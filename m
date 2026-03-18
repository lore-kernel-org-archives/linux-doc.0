Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8556E3D88FD;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843979; cv=none; b=B7ae5kSJY1MeDPgfA7ARBH18IMM/sEWX+cc3SOEhzXejttnpHX/8DmxTUQNSRPsneIpFb+dgHR0xBSSIG/T7hFJXs4+NJSZtbqqbuyvaAaXeGmZQnWszBICu+5GQ8SHIx4cZVmRSuXrGRQPvs83zuhs3Qdwz48bOqWIUOU8m9aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843979; c=relaxed/simple;
	bh=SbTGzPiBvYBl5sLtu8jLO7RNBFHfCo7Ima/HbCP221M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TefrmmwITlFEq/gTVetnCVIxX263EY2plfxCpof+nZ9JxhLqIJbEu1o4W547MOZHsora7LqoMTGt6qPd8DPUHJRf26yeW/L2HS6ZI5Jin5AN20UosyjRhPLDGHJhMFz23/8dupSnCpudhDNoA7m/eizb18/yyOK8oXh1WK+fDqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPGX0dn9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPGX0dn9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64771C2BCB0;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843979;
	bh=SbTGzPiBvYBl5sLtu8jLO7RNBFHfCo7Ima/HbCP221M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XPGX0dn9OpgFU+F9CQAM8o4PC5lLhB+uW7UdwXbRYpdHk/iDSMai5hlAssNGw/6KQ
	 NVhbIhVZSRyRE/7Ak9/bT8+dKioRqLULAf38qNMPwOC1jvCCq+5MbXCjt8PBnY/qwI
	 Zc2K51+VjuoXJQYxRhxqM5IuK1oFfN4lFZ8dITWM1oFWqLe8qSCVLnwpI69viy3AKh
	 9sTmercMdX58Pumea9PTOzLEWREYign5nf6WaZeDDYeZ7KnWxvFpIB+ZolPXItrEJR
	 pMleKOggjhvEzjQ/CYk2EpPrEH5ciaFoL87LYaIL7L7+lsERJwW2sx7Qo5da8yv3AJ
	 OW7YSzloSYNBA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2rqj-00000004HYT-1vud;
	Wed, 18 Mar 2026 15:26:17 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] unittests: test_kdoc_parser: add command line arg to read a YAML file
Date: Wed, 18 Mar 2026 15:26:06 +0100
Message-ID: <35cc58a54256dc04da237d2991f767262699e353.1773841456.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773841456.git.mchehab+huawei@kernel.org>
References: <cover.1773841456.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The test_kdoc_parser.py already supports loading dynamic tests
when running unit tests.

Add support to read from a different file. This is useful for:
- regression tests before/afer some changes;
- preparing new unit tests;
- test a different yaml before adding its contents at
  tools/unittests/kdoc-test.yaml.

It should be noticed that passing an argument to a unit test
is not too trivial, as unittest core will load itself the
runner with a separate environment. The best (only?) way to
do it is by setting the system environment. This way, when
the class is called by the unit test loader, it can pick
the var from the environment without relying on a global
variable.

The unittest_helper has already provision for it, so let's
use its support.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/unittests/test_kdoc_parser.py | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index 723dd8c7f4f3..f2250ef192ce 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -30,7 +30,7 @@ from kdoc.kdoc_output import RestFormat, ManFormat
 
 from kdoc.xforms_lists import CTransforms
 
-from unittest_helper import run_unittest
+from unittest_helper import TestUnits
 
 
 #
@@ -38,6 +38,10 @@ from unittest_helper import run_unittest
 #
 TEST_FILE = os.path.join(SRC_DIR, "kdoc-test.yaml")
 
+env = {
+    "yaml_file": TEST_FILE
+}
+
 #
 # Ancillary logic to clean whitespaces
 #
@@ -470,7 +474,9 @@ class KernelDocDynamicTests():
         optional ones.
         """
 
-        with open(TEST_FILE, encoding="utf-8") as fp:
+        test_file = os.environ.get("yaml_file", TEST_FILE)
+
+        with open(test_file, encoding="utf-8") as fp:
             testset = yaml.safe_load(fp)
 
         tests = testset["tests"]
@@ -531,4 +537,15 @@ KernelDocDynamicTests.create_tests()
 # Run all tests
 #
 if __name__ == "__main__":
-    run_unittest(__file__)
+    runner = TestUnits()
+    parser = runner.parse_args()
+    parser.add_argument("-y", "--yaml-file", "--yaml",
+                        help='Name of the yaml file to load')
+
+    args = parser.parse_args()
+
+    if args.yaml_file:
+        env["yaml_file"] = os.path.expanduser(args.yaml_file)
+
+    # Run tests with customized arguments
+    runner.run(__file__, parser=parser, args=args, env=env)
-- 
2.52.0

