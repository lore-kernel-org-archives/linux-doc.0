Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20974386458;
	Mon, 23 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257059; cv=none; b=sLRtIgtpAFdV1aXDWhE4KzB2gpD7p6WzcbnoMK7Kl1ibOQ1FOT1E2gW9QJUMdhy9UWGi4UgSKid6R/sIVG777fUQ/vwvuy/g/U2SYvK+CwZ7bjxIlUsirtdM09CkL6ckvfOxDikXshvPZsessO7+0BVKCxPZRNXbUYnkbEe9eMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257059; c=relaxed/simple;
	bh=9bP3dZmN9dqpLzA2P9uYLroVbRJTwYSVc6XXaOpsBAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=paL5HxVpmOo2rUY+9ZzECcT9JGqlWxZNkfTq4aNN6XvTK28EOVrZKz66/XN7z5l5AXg1BZcOkaojG8qNz61gKp0No0ZsbW5jRJ3tpuLEiBGRvFKK/CDDCydRDPbtUAYq22B2bP51Q6LY9XBdspiUgbB7pPSiomS3ZR67+KRQ8b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swUYgibz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swUYgibz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB981C2BCB4;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774257058;
	bh=9bP3dZmN9dqpLzA2P9uYLroVbRJTwYSVc6XXaOpsBAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=swUYgibzFJdQN8iDOu5XIB9/VQqqZyTluwz/hNGv0wKnXiJswJRt39TEN1+M35w22
	 PURQSoT7ESF2W7yDkFTnPNHGXtHwplQTdNWHEZQtKJTCFVXvBw3kmCpLgTwbzmnAY6
	 K0ZWV/EoFQKE5tCJJXnxNBxsZQxFgk3pEBzbT4OIx2ptdvckTwgG1p4JvI6+Wmwm+4
	 5mlltT9RjT9WWs0NsUwL9BQVTAFQCRBVdH+E3qPbZAVvf92wkIXMqjPCQtEAcLcruU
	 Hr/poTyBwo76zlpfgXhdalQwfrUqoEGMDFb6sM9RpakIXwOY3izzJnLhGg+vX/7aoM
	 vUSqCV5Puv5Qw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w4bJI-00000002yWM-1ipo;
	Mon, 23 Mar 2026 10:10:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] unittests: test_kdoc_parser: add command line arg to read a YAML file
Date: Mon, 23 Mar 2026 10:10:45 +0100
Message-ID: <1d1a56de012c43756f9ca87aa9bf6c285674f113.1774256269.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774256269.git.mchehab+huawei@kernel.org>
References: <cover.1774256269.git.mchehab+huawei@kernel.org>
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
2.53.0

