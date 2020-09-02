import matlab.unittest.TestRunner
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoberturaFormat
 
suite = testsuite(pwd,'IncludeSubfolders',true);
 
runner = TestRunner.withTextOutput('OutputDetail',3);
 
sourceFolder = pwd;
reportFile = 'cobertura.xml';
reportFormat = CoberturaFormat(reportFile);
p = CodeCoveragePlugin.forFolder(sourceFolder,'IncludingSubfolders', true,'Producing',reportFormat);
runner.addPlugin(p)
 
results = runner.run(suite);  
nfailed = nnz([results.Failed]);
assert(nfailed == 0, [num2str(nfailed) ' test(s) failed.'])
