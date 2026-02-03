Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E963ACF07;
	Tue,  3 Feb 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130555; cv=none; b=Sw1VT8F8ZQ1SzaKXDbc+rCC14OCkwCgGXLdA0I5TwH2roEURqiJRqbXgcc3wXthn22MYi0WbB2RiwlRcddlXhy+n3c00Ow32JFVQ2f5sYOwNNTJgK6Dd3QsKpBgiycAVbfwdjPtBo8oLcN6Kp60YNbl3FcK5zx7ZT+/KvUEp3ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130555; c=relaxed/simple;
	bh=NqNP2uQYzab+0n+ez3XsP/9cvYv0t7ITDg4PrOql4bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IPH0/qCsJfV8e3OuBz87Ow3T7qqS2G/pcG26Mhq1C0cCjAJ0KiblTxkOhA3QDjiGltffXZ7X7Qd0pppBZR1uGNSOMX4O2v3b0XXVdtCT3Ykld2kYhHBaKOR8quR22SSEr0VfLytj+uysaI0saA77rHoBUd+mxkwxDvjVK9S+Dhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glMRRPhI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glMRRPhI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3DCC2BCB6;
	Tue,  3 Feb 2026 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130555;
	bh=NqNP2uQYzab+0n+ez3XsP/9cvYv0t7ITDg4PrOql4bg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=glMRRPhI4wniUpAMpVBUd4DoicK+P+oz6OdmU/PVXK+Y1QepLKO1WMlkBTSM2aO8D
	 bw0xxLtcSukrxieg5LgLafwHbsoSovDh7KM/nGaRdyeebyyGa+FKgPPf5en60tJpwg
	 n6en89iK6fbAR+go35SKPlbqOqcr3QzULAZXcbZEP801tZqSxvZxRL8O4sLAkyXhpS
	 QTmQZO5wM9PhEosrQDeLMb6W9/nZwq2qzbtv1HCmr9TAbaSRNPDu8OtA+M5vCQ0oT0
	 qHl1I/EHvjgH7sbfHrfmNHIduB7qYj1l0bs+z4Li2UluI69itwNuZWxbW+KqYjMMf8
	 f5m7wLwdCm5pA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnHon-000000027V2-0oK8;
	Tue, 03 Feb 2026 15:55:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 15/15] unittests: test_kdoc_parser: add command line arg to read a YAML file
Date: Tue,  3 Feb 2026 15:55:43 +0100
Message-ID: <b0cd95fc4bf2ea93136503f79e657994eaa51ff6.1770128540.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770128540.git.mchehab+huawei@kernel.org>
References: <cover.1770128540.git.mchehab+huawei@kernel.org>
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
index dd3d576e1b93..eb2225529325 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -29,7 +29,7 @@ from kdoc.kdoc_output import RestFormat, ManFormat
 
 from kdoc.xforms_lists import CTransforms
 
-from unittest_helper import run_unittest
+from unittest_helper import TestUnits
 
 
 #
@@ -37,6 +37,10 @@ from unittest_helper import run_unittest
 #
 TEST_FILE = os.path.join(SRC_DIR, "kdoc-test.yaml")
 
+env = {
+    "yaml_file": TEST_FILE
+}
+
 #
 # Ancillary logic to clean whitespaces
 #
@@ -442,7 +446,9 @@ class KernelDocDynamicTests():
         optional ones.
         """
 
-        with open(TEST_FILE, encoding="utf-8") as fp:
+        test_file = os.environ.get("yaml_file", TEST_FILE)
+
+        with open(test_file, encoding="utf-8") as fp:
             testset = yaml.safe_load(fp)
 
         tests = testset["tests"]
@@ -503,4 +509,15 @@ KernelDocDynamicTests.create_tests()
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

