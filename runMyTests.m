disp(matlabroot)
import matlab.unittest.TestRunner
import matlab.unittest.Verbosity
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoberturaFormat
 
suite = testsuite(pwd, 'IncludeSubfolders', true);
 
runner = TestRunner.withTextOutput('OutputDetail', Verbosity.Detailed);
runner.addPlugin(CodeCoveragePlugin.forFolder({'.'}, 'IncludingSubfolders', true, 'Producing', CoberturaFormat('coverage.xml')));
 
results = runner.run(suite);
 
nfailed = nnz([results.Failed]);
assert(nfailed == 0, [num2str(nfailed) ' test(s) failed.']);
