import luigi
import time
import os
import shutil



class MyExternal(luigi.ExternalTask):
    def complete(self):
        return False


class AIR(luigi.Task):
    def run(self):
        print "Running AIR Data Loader"

    def requires(self):
	f = open('/usr/AIR/tmp/exec_sa_jobs.txt')
	lines = f.readlines()
	count = len(lines)
	global i
        for i in xrange(count):
            yield AIRDataLoaderJobExtract(i)
	f.close()


class AIRDataLoaderJobExtract(luigi.Task):
    num = luigi.IntParameter()

    def run(self):
	number = self.num +1
	o = 'eval `sed -n '+str(number)+'p /usr/AIR/tmp/exec_sa_jobs.txt`'
	os.system(o)
        self.output().open('w').close()

    def output(self):
        return luigi.LocalTarget('/usr/AIR/tmp/airdataloader/%d' % self.num)


if __name__ == "__main__":
    if os.path.exists('/usr/AIR/tmp/airdataloader'):
        shutil.rmtree('/usr/AIR/tmp/airdataloader')

    luigi.run(['--local-scheduler', '--task', 'AIR', '--workers', '100'], use_optparse=True)
