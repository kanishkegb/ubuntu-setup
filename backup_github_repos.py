from github import Github

import os
import pdb


path = '/mnt/d/Sync/GitHub'


# !!! DO NOT EVER USE HARD-CODED VALUES HERE !!!
# Instead, set and test environment variables, see README for info
GH_ACCSS_TKN = os.environ['GH_ACCSS_TKN']
g = Github(GH_ACCSS_TKN)


def parse_path(path):
    parsed_path = '/'
    for dir in path.split('/'):
        parsed_path = os.path.join(parsed_path, dir)
    return parsed_path





user = g.get_user().login
repos = g.get_user().get_repos()

path = parse_path(path)
# pdb.set_trace()


def clone_or_update(repo, path):
    print(os.system('pwd'))
    os.chdir(path)
    repo_path = os.path.join(path, repo.name)

    if os.path.isdir(repo_path):
        os.chdir(repo_path)
        os.system('git pull')
    else:
        os.system('git clone {}'.format(repo.ssh_url))
        os.chdir(repo_path)
        os.system('git pull')

    os.chdir(path)


def get_sub_dir(path, sub_dir_name):
    sub_dir = os.path.join(path, sub_dir_name)

    if not os.path.isdir(sub_dir):
        os.system('mkdir {}'.format(sub_dir_name))

    return sub_dir


def get_orgs(g):
    orgs = {'org_list':[]}
    for org in g.get_user().get_orgs():
        login = org.login
        orgs['org_list'].append(login)
        orgs['num_{}_repos'.format(login)] = 0
    return orgs


os.chdir(path)
orgs = get_orgs(g)
orgs_list = orgs['org_list']

num_personal_repos = 0
num_contributed_repos = 0
for repo in repos:
    owner = repo.owner.login
    os.chdir(path)
    if owner == user:
        print('Owned repo: {}'.format(repo.name))
        sub_dir = get_sub_dir(path, 'personal')
        num_personal_repos += 1
        # clone_or_update(repo, sub_dir)

    else:
        for mem in repo.get_contributors():
            if mem.login == user:
                # pdb.set_trace()

                if owner in orgs_list:
                    print('{} repo: {}'.format(owner, repo.name))
                    sub_dir = get_sub_dir(path, owner)
                    orgs['num_{}_repos'.format(owner)] += 1
                    # clone_or_update(repo, sub_dir)
                else:
                    print('Contributed repo: {}'.format(repo.name))
                    sub_dir = get_sub_dir(path, 'contributed')
                    num_contributed_repos += 1
                    # clone_or_update(repo, sub_dir)

print('\nFinished GitHub backup!\n')
print('\n\n======================================\n')
print('\tSummary\n')
print('======================================\n')
print('Updated {} personal repos'.format(num_personal_repos))
print('Updated {} contributed repos'.format(num_contributed_repos))

for org in orgs_list:
    print('Updated {} {} repos'.format(orgs['num_{}_repos'.format(org)], org))

print('\n======================================\n')

pdb.set_trace()
