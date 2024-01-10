Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DE14D100
	for <linux-doc@vger.kernel.org>; Wed, 10 Jan 2024 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N5mrD3rX"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40AHl350023222;
	Wed, 10 Jan 2024 17:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=ID43UcPG+hgI+WZn/OgoYw4kd4mAE8E00X4v9pQ4JKs=;
 b=N5mrD3rX8yCGFgnP67eFW92fWTATT6NrV9w2raJrZYlqVnUW17Viz5Tr0p+bPaimszHn
 VCDXh1B8EKTH8UqzQ4dH5qI1jAyFhTwPW4OEUL5cKDviWFgv1X8ihRLj969tUGeh0JRq
 H4UdbKEquvAffTm5es6JO1D2w3EPWrwwg7Oa3+knMnaBK4TJ5a9+HRlLepZsmGANWdax
 Zp+fpdYkpd3zQ8BJ0M5PQk4fZmo5vX5DT1rjYhvQA/FGCbACST4/XQo+qUNRJvhb6sFe
 gELdnp3E4ZkSUH0V75Xot02Z96L34xCsluHIgh8aQvNIAbwdHCdoHyRNulw7vOM2pBGg jg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vhvgm8kt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jan 2024 17:48:08 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40AHScnU035025;
	Wed, 10 Jan 2024 17:48:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3vfuu6erxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jan 2024 17:48:07 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40AHm6wd004017;
	Wed, 10 Jan 2024 17:48:06 GMT
Received: from localhost.localdomain (dhcp-10-175-34-62.vpn.oracle.com [10.175.34.62])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3vfuu6erwn-1;
	Wed, 10 Jan 2024 17:48:06 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] docs: kernel_feat.py: fix command injection
Date: Wed, 10 Jan 2024 18:47:58 +0100
Message-Id: <20240110174758.3680506-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-10_08,2024-01-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401100143
X-Proofpoint-GUID: HHE7sXw1qPDbVctfzikjXB3RxgGfJr8z
X-Proofpoint-ORIG-GUID: HHE7sXw1qPDbVctfzikjXB3RxgGfJr8z

The kernel-feat directive passes its argument straight to the shell.
This is unfortunate and unnecessary.

Let's always use paths relative to $srctree/Documentation/ and use
subprocess.check_call() instead of subprocess.Popen(shell=True).

This also makes the code shorter.

This is analogous to commit 3231dd586277 ("docs: kernel_abi.py: fix
command injection") where we did exactly the same thing for
kernel_abi.py, somehow I completely missed this one.

Link: https://fosstodon.org/@jani/111676532203641247
Reported-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/admin-guide/features.rst        |  2 +-
 Documentation/arch/arc/features.rst           |  2 +-
 Documentation/arch/arm/features.rst           |  2 +-
 Documentation/arch/arm64/features.rst         |  2 +-
 Documentation/arch/loongarch/features.rst     |  2 +-
 Documentation/arch/m68k/features.rst          |  2 +-
 Documentation/arch/mips/features.rst          |  2 +-
 Documentation/arch/nios2/features.rst         |  2 +-
 Documentation/arch/openrisc/features.rst      |  2 +-
 Documentation/arch/parisc/features.rst        |  2 +-
 Documentation/arch/powerpc/features.rst       |  2 +-
 Documentation/arch/riscv/features.rst         |  2 +-
 Documentation/arch/s390/features.rst          |  2 +-
 Documentation/arch/sh/features.rst            |  2 +-
 Documentation/arch/sparc/features.rst         |  2 +-
 Documentation/arch/x86/features.rst           |  2 +-
 Documentation/arch/xtensa/features.rst        |  2 +-
 Documentation/sphinx/kernel_feat.py           | 55 ++++---------------
 .../zh_CN/arch/loongarch/features.rst         |  2 +-
 .../translations/zh_CN/arch/mips/features.rst |  2 +-
 .../zh_TW/arch/loongarch/features.rst         |  2 +-
 .../translations/zh_TW/arch/mips/features.rst |  2 +-
 22 files changed, 32 insertions(+), 65 deletions(-)

diff --git a/Documentation/admin-guide/features.rst b/Documentation/admin-guide/features.rst
index 8c167082a84f..7651eca38227 100644
--- a/Documentation/admin-guide/features.rst
+++ b/Documentation/admin-guide/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features
+.. kernel-feat:: features
diff --git a/Documentation/arch/arc/features.rst b/Documentation/arch/arc/features.rst
index b793583d688a..49ff446ff744 100644
--- a/Documentation/arch/arc/features.rst
+++ b/Documentation/arch/arc/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features arc
+.. kernel-feat:: features arc
diff --git a/Documentation/arch/arm/features.rst b/Documentation/arch/arm/features.rst
index 7414ec03dd15..0e76aaf68eca 100644
--- a/Documentation/arch/arm/features.rst
+++ b/Documentation/arch/arm/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features arm
+.. kernel-feat:: features arm
diff --git a/Documentation/arch/arm64/features.rst b/Documentation/arch/arm64/features.rst
index dfa4cb3cd3ef..03321f4309d0 100644
--- a/Documentation/arch/arm64/features.rst
+++ b/Documentation/arch/arm64/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features arm64
+.. kernel-feat:: features arm64
diff --git a/Documentation/arch/loongarch/features.rst b/Documentation/arch/loongarch/features.rst
index ebacade3ea45..009f44c7951f 100644
--- a/Documentation/arch/loongarch/features.rst
+++ b/Documentation/arch/loongarch/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features loongarch
+.. kernel-feat:: features loongarch
diff --git a/Documentation/arch/m68k/features.rst b/Documentation/arch/m68k/features.rst
index 5107a2119472..de7f0ccf7fc8 100644
--- a/Documentation/arch/m68k/features.rst
+++ b/Documentation/arch/m68k/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features m68k
+.. kernel-feat:: features m68k
diff --git a/Documentation/arch/mips/features.rst b/Documentation/arch/mips/features.rst
index 1973d729b29a..6e0ffe3e7354 100644
--- a/Documentation/arch/mips/features.rst
+++ b/Documentation/arch/mips/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features mips
+.. kernel-feat:: features mips
diff --git a/Documentation/arch/nios2/features.rst b/Documentation/arch/nios2/features.rst
index 8449e63f69b2..89913810ccb5 100644
--- a/Documentation/arch/nios2/features.rst
+++ b/Documentation/arch/nios2/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features nios2
+.. kernel-feat:: features nios2
diff --git a/Documentation/arch/openrisc/features.rst b/Documentation/arch/openrisc/features.rst
index 3f7c40d219f2..bae2e25adfd6 100644
--- a/Documentation/arch/openrisc/features.rst
+++ b/Documentation/arch/openrisc/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features openrisc
+.. kernel-feat:: features openrisc
diff --git a/Documentation/arch/parisc/features.rst b/Documentation/arch/parisc/features.rst
index 501d7c450037..b3aa4d243b93 100644
--- a/Documentation/arch/parisc/features.rst
+++ b/Documentation/arch/parisc/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features parisc
+.. kernel-feat:: features parisc
diff --git a/Documentation/arch/powerpc/features.rst b/Documentation/arch/powerpc/features.rst
index aeae73df86b0..ee4b95e04202 100644
--- a/Documentation/arch/powerpc/features.rst
+++ b/Documentation/arch/powerpc/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features powerpc
+.. kernel-feat:: features powerpc
diff --git a/Documentation/arch/riscv/features.rst b/Documentation/arch/riscv/features.rst
index c70ef6ac2368..36e90144adab 100644
--- a/Documentation/arch/riscv/features.rst
+++ b/Documentation/arch/riscv/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features riscv
+.. kernel-feat:: features riscv
diff --git a/Documentation/arch/s390/features.rst b/Documentation/arch/s390/features.rst
index 57c296a9d8f3..2883dc950681 100644
--- a/Documentation/arch/s390/features.rst
+++ b/Documentation/arch/s390/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features s390
+.. kernel-feat:: features s390
diff --git a/Documentation/arch/sh/features.rst b/Documentation/arch/sh/features.rst
index f722af3b6c99..fae48fe81e9b 100644
--- a/Documentation/arch/sh/features.rst
+++ b/Documentation/arch/sh/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features sh
+.. kernel-feat:: features sh
diff --git a/Documentation/arch/sparc/features.rst b/Documentation/arch/sparc/features.rst
index c0c92468b0fe..96835b6d598a 100644
--- a/Documentation/arch/sparc/features.rst
+++ b/Documentation/arch/sparc/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features sparc
+.. kernel-feat:: features sparc
diff --git a/Documentation/arch/x86/features.rst b/Documentation/arch/x86/features.rst
index b663f15053ce..a33616346a38 100644
--- a/Documentation/arch/x86/features.rst
+++ b/Documentation/arch/x86/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features x86
+.. kernel-feat:: features x86
diff --git a/Documentation/arch/xtensa/features.rst b/Documentation/arch/xtensa/features.rst
index 6b92c7bfa19d..28dcce1759be 100644
--- a/Documentation/arch/xtensa/features.rst
+++ b/Documentation/arch/xtensa/features.rst
@@ -1,3 +1,3 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. kernel-feat:: $srctree/Documentation/features xtensa
+.. kernel-feat:: features xtensa
diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
index b5fa2f0542a5..b9df61eb4501 100644
--- a/Documentation/sphinx/kernel_feat.py
+++ b/Documentation/sphinx/kernel_feat.py
@@ -37,8 +37,6 @@ import re
 import subprocess
 import sys
 
-from os import path
-
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
@@ -76,33 +74,26 @@ class KernelFeat(Directive):
         self.state.document.settings.env.app.warn(message, prefix="")
 
     def run(self):
-
         doc = self.state.document
         if not doc.settings.file_insertion_enabled:
             raise self.warning("docutils: file insertion disabled")
 
         env = doc.settings.env
-        cwd = path.dirname(doc.current_source)
-        cmd = "get_feat.pl rest --enable-fname --dir "
-        cmd += self.arguments[0]
-
-        if len(self.arguments) > 1:
-            cmd += " --arch " + self.arguments[1]
 
-        srctree = path.abspath(os.environ["srctree"])
+        srctree = os.path.abspath(os.environ["srctree"])
 
-        fname = cmd
+        args = [
+            os.path.join(srctree, 'scripts/get_feat.pl'),
+            'rest',
+            '--enable-fname',
+            '--dir',
+            os.path.join(srctree, 'Documentation', self.arguments[0]),
+        ]
 
-        # extend PATH with $(srctree)/scripts
-        path_env = os.pathsep.join([
-            srctree + os.sep + "scripts",
-            os.environ["PATH"]
-        ])
-        shell_env = os.environ.copy()
-        shell_env["PATH"]    = path_env
-        shell_env["srctree"] = srctree
+        if len(self.arguments) > 1:
+            args.extend(['--arch', self.arguments[1]])
 
-        lines = self.runCmd(cmd, shell=True, cwd=cwd, env=shell_env)
+        lines = subprocess.check_output(args, cwd=os.path.dirname(doc.current_source)).decode('utf-8')
 
         line_regex = re.compile(r"^\.\. FILE (\S+)$")
 
@@ -121,30 +112,6 @@ class KernelFeat(Directive):
         nodeList = self.nestedParse(out_lines, fname)
         return nodeList
 
-    def runCmd(self, cmd, **kwargs):
-        u"""Run command ``cmd`` and return its stdout as unicode."""
-
-        try:
-            proc = subprocess.Popen(
-                cmd
-                , stdout = subprocess.PIPE
-                , stderr = subprocess.PIPE
-                , **kwargs
-            )
-            out, err = proc.communicate()
-
-            out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')
-
-            if proc.returncode != 0:
-                raise self.severe(
-                    u"command '%s' failed with return code %d"
-                    % (cmd, proc.returncode)
-                )
-        except OSError as exc:
-            raise self.severe(u"problems with '%s' directive: %s."
-                              % (self.name, ErrorString(exc)))
-        return out
-
     def nestedParse(self, lines, fname):
         content = ViewList()
         node    = nodes.section()
diff --git a/Documentation/translations/zh_CN/arch/loongarch/features.rst b/Documentation/translations/zh_CN/arch/loongarch/features.rst
index 82bfac180bdc..cec38dda8298 100644
--- a/Documentation/translations/zh_CN/arch/loongarch/features.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/features.rst
@@ -5,4 +5,4 @@
 :Original: Documentation/arch/loongarch/features.rst
 :Translator: Huacai Chen <chenhuacai@loongson.cn>
 
-.. kernel-feat:: $srctree/Documentation/features loongarch
+.. kernel-feat:: features loongarch
diff --git a/Documentation/translations/zh_CN/arch/mips/features.rst b/Documentation/translations/zh_CN/arch/mips/features.rst
index da1b956e4a40..0d6df97db069 100644
--- a/Documentation/translations/zh_CN/arch/mips/features.rst
+++ b/Documentation/translations/zh_CN/arch/mips/features.rst
@@ -10,4 +10,4 @@
 
 .. _cn_features:
 
-.. kernel-feat:: $srctree/Documentation/features mips
+.. kernel-feat:: features mips
diff --git a/Documentation/translations/zh_TW/arch/loongarch/features.rst b/Documentation/translations/zh_TW/arch/loongarch/features.rst
index b64e430f55ae..c2175fd32b54 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/features.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/features.rst
@@ -5,5 +5,5 @@
 :Original: Documentation/arch/loongarch/features.rst
 :Translator: Huacai Chen <chenhuacai@loongson.cn>
 
-.. kernel-feat:: $srctree/Documentation/features loongarch
+.. kernel-feat:: features loongarch
 
diff --git a/Documentation/translations/zh_TW/arch/mips/features.rst b/Documentation/translations/zh_TW/arch/mips/features.rst
index f69410420035..3d3906c4d08e 100644
--- a/Documentation/translations/zh_TW/arch/mips/features.rst
+++ b/Documentation/translations/zh_TW/arch/mips/features.rst
@@ -10,5 +10,5 @@
 
 .. _tw_features:
 
-.. kernel-feat:: $srctree/Documentation/features mips
+.. kernel-feat:: features mips
 
-- 
2.34.1

