Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CB2977DBD4
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Jul 2019 00:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbfGDAif (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Jul 2019 20:38:35 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:43409 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727383AbfGDAie (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Jul 2019 20:38:34 -0400
Received: by mail-pf1-f202.google.com with SMTP id 6so2512027pfz.10
        for <linux-doc@vger.kernel.org>; Wed, 03 Jul 2019 17:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=JaclVjWWg1jR5XC8IB5tgYYWiqh+NZ/mVD/zRwjH/mc=;
        b=c1GtRLX8E4JlmpkJlOGwh1CkwdqR82trfruz3C/5c+9N4wPpyean1VohxhEeLdNHr3
         7q8ez958MWLIoUWnTKUgMCTxr9C/6roypzJtrmBQVDO7okP1z5JuDpB1V617Uz55IgsL
         aK6f4Ve6uoW66mAIDB2CmIt8MutPCP+Uffzpw081dX4VfdYBQYGkMmxMsEui+qAgGIZ5
         O9nCftFd/x95+VU5W2vZ9UglxOaZGBZT3tq6O+zvblpWNWv0k5Pu1gT7G3poa13nQoxH
         nxDny29o8dtnpFWLRkZ3KmWRIp+s+p4Y8QMZPmaA29YdM7uJu2eTXRUobjD/hUZYvkfr
         ntcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=JaclVjWWg1jR5XC8IB5tgYYWiqh+NZ/mVD/zRwjH/mc=;
        b=pLKfx1TxEt62/Pq5W9pbhN6zNAamM8IxX54qqfvo/SFlUi9VE6mJ+vL2MskG22sXZx
         s5guNdg4tntLyMkVKeZn8V9/K8rxOcmcQ2qMGeyfEWxbtO77bEstwDwYmdfrI49DUzK0
         ng3FC6d9OHH7V2ymUs8PHpXSVucQLtnUulyjAt6Yc1Yjxg8aQgaNcbX4kFUaP5FI/oFe
         lIpQj7xqeMpOgjPN/F08FU22uHHnjljRchYFzl2U3/D4YZC09usRavZVw9dmH7j5sZIM
         /D7sNcOyHMPASe5qE1tpktIAcnC92Jm0MeW+yx/7s3r6vx33SinsXmfU/+DqVFCG+rbN
         EteQ==
X-Gm-Message-State: APjAAAWUyBndbNUVO+DljGMrbR/bGaj3ejEqqSstEKdKNAqCQbwZxHRn
        m4MEJrs/dYjJsjefuIZr3+LO2GJPj9tPAYSI3+Tasg==
X-Google-Smtp-Source: APXvYqxFHeUyEmRc+E266L7AWtRcZYH52FrZdtGZW7LHXmFozQV8TqTzDOPN+gorhXKXxWotVyX8UjhiTb1vVxMxPauz0g==
X-Received: by 2002:a63:fc52:: with SMTP id r18mr39777830pgk.378.1562200713145;
 Wed, 03 Jul 2019 17:38:33 -0700 (PDT)
Date:   Wed,  3 Jul 2019 17:36:11 -0700
In-Reply-To: <20190704003615.204860-1-brendanhiggins@google.com>
Message-Id: <20190704003615.204860-15-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v6 14/18] kunit: defconfig: add defconfigs for building KUnit tests
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add defconfig for UML and a fragment that can be used to configure other
architectures for building KUnit tests. Add option to kunit_tool to use
a defconfig to create the kunitconfig.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 arch/um/configs/kunit_defconfig              |  8 ++++++++
 tools/testing/kunit/configs/all_tests.config |  8 ++++++++
 tools/testing/kunit/kunit.py                 | 18 ++++++++++++++++--
 tools/testing/kunit/kunit_kernel.py          |  3 ++-
 4 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 arch/um/configs/kunit_defconfig
 create mode 100644 tools/testing/kunit/configs/all_tests.config

diff --git a/arch/um/configs/kunit_defconfig b/arch/um/configs/kunit_defconfig
new file mode 100644
index 0000000000000..bfe49689038f1
--- /dev/null
+++ b/arch/um/configs/kunit_defconfig
@@ -0,0 +1,8 @@
+CONFIG_OF=y
+CONFIG_OF_UNITTEST=y
+CONFIG_OF_OVERLAY=y
+CONFIG_I2C=y
+CONFIG_I2C_MUX=y
+CONFIG_KUNIT=y
+CONFIG_KUNIT_TEST=y
+CONFIG_KUNIT_EXAMPLE_TEST=y
diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
new file mode 100644
index 0000000000000..bfe49689038f1
--- /dev/null
+++ b/tools/testing/kunit/configs/all_tests.config
@@ -0,0 +1,8 @@
+CONFIG_OF=y
+CONFIG_OF_UNITTEST=y
+CONFIG_OF_OVERLAY=y
+CONFIG_I2C=y
+CONFIG_I2C_MUX=y
+CONFIG_KUNIT=y
+CONFIG_KUNIT_TEST=y
+CONFIG_KUNIT_EXAMPLE_TEST=y
diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index da11bd62a4b82..3e51dc4febfdc 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -11,6 +11,7 @@ import argparse
 import sys
 import os
 import time
+import shutil
 
 from collections import namedtuple
 from enum import Enum, auto
@@ -21,7 +22,7 @@ import kunit_parser
 
 KunitResult = namedtuple('KunitResult', ['status','result'])
 
-KunitRequest = namedtuple('KunitRequest', ['raw_output','timeout', 'jobs', 'build_dir'])
+KunitRequest = namedtuple('KunitRequest', ['raw_output','timeout', 'jobs', 'build_dir', 'defconfig'])
 
 class KunitStatus(Enum):
 	SUCCESS = auto()
@@ -29,8 +30,16 @@ class KunitStatus(Enum):
 	BUILD_FAILURE = auto()
 	TEST_FAILURE = auto()
 
+def create_default_kunitconfig():
+	if not os.path.exists(kunit_kernel.KUNITCONFIG_PATH):
+		shutil.copyfile('arch/um/configs/kunit_defconfig',
+				kunit_kernel.KUNITCONFIG_PATH)
+
 def run_tests(linux: kunit_kernel.LinuxSourceTree,
 	      request: KunitRequest) -> KunitResult:
+	if request.defconfig:
+		create_default_kunitconfig()
+
 	config_start = time.time()
 	success = linux.build_reconfig(request.build_dir)
 	config_end = time.time()
@@ -99,13 +108,18 @@ def main(argv, linux):
 				'directory.',
 				type=str, default=None, metavar='build_dir')
 
+	run_parser.add_argument('--defconfig',
+				help='Uses a default kunitconfig.',
+				action='store_true')
+
 	cli_args = parser.parse_args(argv)
 
 	if cli_args.subcommand == 'run':
 		request = KunitRequest(cli_args.raw_output,
 				       cli_args.timeout,
 				       cli_args.jobs,
-				       cli_args.build_dir)
+				       cli_args.build_dir,
+				       cli_args.defconfig)
 		result = run_tests(linux, request)
 		if result.status != KunitStatus.SUCCESS:
 			sys.exit(1)
diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 07c0abf2f47df..bf38768353313 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -14,6 +14,7 @@ import os
 import kunit_config
 
 KCONFIG_PATH = '.config'
+KUNITCONFIG_PATH = 'kunitconfig'
 
 class ConfigError(Exception):
 	"""Represents an error trying to configure the Linux kernel."""
@@ -81,7 +82,7 @@ class LinuxSourceTree(object):
 
 	def __init__(self):
 		self._kconfig = kunit_config.Kconfig()
-		self._kconfig.read_from_file('kunitconfig')
+		self._kconfig.read_from_file(KUNITCONFIG_PATH)
 		self._ops = LinuxSourceTreeOperations()
 
 	def clean(self):
-- 
2.22.0.410.gd8fdbe21b5-goog

