Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCF11EEA31;
	Thu, 26 Mar 2026 19:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552188; cv=none; b=MIufwNZlDjjgWeyDBzZ30IcBnKuSJXkRRiAh1iq2uubQsluBmEluHirBCOCKEox1CVyc98lAJd43qeJu9B1JmOsZWXhPGnH2X5tQpeb4U4qFAqOLJqBX5vMJ7DAsOOrHRI+LvzAeryan2HY6fsMXO5rBcriaGFmPMjFBPuXpz1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552188; c=relaxed/simple;
	bh=czihQRIEm15OTD1+oh6youh5BQM2dQxCYTXOhgP6lZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B5Yykho/btwNo3FF34m+X5nMnMxa95P27NAB91UwAIW+SILgPNMhKkyUjzb8C9YXn4DuCEDknT79Vzfh0Vv2qmMudgTDIqFKd3yJbbU89FMU5rS3Wo7BFBC7Hol+Rm3Yza8bIXv1sYISQwntjlpP1JNyvbR3/r7VXGmAKjgL5O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDlrZyzJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDlrZyzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE72CC116C6;
	Thu, 26 Mar 2026 19:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774552188;
	bh=czihQRIEm15OTD1+oh6youh5BQM2dQxCYTXOhgP6lZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cDlrZyzJGJlDjK3He5wcU+aIVy8cqxG/wrACgvcFUWp4GiifpgBCgw8D+Gi9FNc2t
	 pU9VdtMQd5mqfOfjBu6GbR40YZUIAjEbDCuEiuPik0z5qWKHRT1U1vEWtyeSSVYr8E
	 s5Il6PWYrxbTUzN+WWLXSTBSbQpTj+GgECZMHf45oqVG5Gd044u5q46Qwjxi4HrxwZ
	 AihTUpz3My4FLaTub2gjyYOQdNGIQzEQyet0swKvrom0S2konQeiynLMQqRpHHRKda
	 lH2ryBXvrG/PPx0FmjyjQA8ZU/LXBrOfYQduR02kxrCqAHppTO1y5mO+bD+d8PtkBX
	 XXAgLnHoGYnDg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w5q5R-0000000BH8O-3uLc;
	Thu, 26 Mar 2026 20:09:45 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 1/2] tools: unittest_helper: add a quiet mode
Date: Thu, 26 Mar 2026 20:09:42 +0100
Message-ID: <27556792ff70e6267ecd19c258149d380db8d423.1774551940.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774551940.git.mchehab+huawei@kernel.org>
References: <cover.1774551940.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On quiet mode, only report errors.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/unittest_helper.py | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/tools/lib/python/unittest_helper.py b/tools/lib/python/unittest_helper.py
index 55d444cd73d4..f3cba5120401 100755
--- a/tools/lib/python/unittest_helper.py
+++ b/tools/lib/python/unittest_helper.py
@@ -141,7 +141,7 @@ class Summary(unittest.TestResult):
         super().addSkip(test, reason)
         self._record_test(test, f"SKIP ({reason})")
 
-    def printResults(self):
+    def printResults(self, verbose):
         """
         Print results using colors if tty.
         """
@@ -174,10 +174,15 @@ class Summary(unittest.TestResult):
 
         # Print results
         for module_name, classes in self.test_results.items():
-            print(f"{module_name}:")
+            if verbose:
+                print(f"{module_name}:")
             for class_name, tests in classes.items():
-                print(f"    {class_name}:")
+                if verbose:
+                    print(f"    {class_name}:")
                 for test_name, status in tests:
+                    if not verbose and status in [ "OK", "EXPECTED_FAIL" ]:
+                        continue
+
                     # Get base status without reason for SKIP
                     if status.startswith("SKIP"):
                         status_code = status.split()[0]
@@ -187,7 +192,8 @@ class Summary(unittest.TestResult):
                     print(
                         f"        {test_name + ':':<{max_length}}{color}{status}{COLORS['reset']}"
                     )
-            print()
+            if verbose:
+                print()
 
         # Print summary
         print(f"\nRan {self.testsRun} tests", end="")
@@ -230,6 +236,7 @@ class TestUnits:
         """Returns a parser for command line arguments."""
         parser = argparse.ArgumentParser(description="Test runner with regex filtering")
         parser.add_argument("-v", "--verbose", action="count", default=1)
+        parser.add_argument("-q", "--quiet", action="store_true")
         parser.add_argument("-f", "--failfast", action="store_true")
         parser.add_argument("-k", "--keyword",
                             help="Regex pattern to filter test methods")
@@ -279,7 +286,10 @@ class TestUnits:
         if not caller_file and not suite:
             raise TypeError("Either caller_file or suite is needed at TestUnits")
 
-        verbose = args.verbose
+        if args.quiet:
+            verbose = 0
+        else:
+            verbose = args.verbose
 
         if not env:
             env = os.environ.copy()
@@ -334,7 +344,7 @@ class TestUnits:
                                             failfast=args.failfast)
         result = runner.run(suite)
         if resultclass:
-            result.printResults()
+            result.printResults(verbose)
 
         sys.exit(not result.wasSuccessful())
 
-- 
2.53.0

