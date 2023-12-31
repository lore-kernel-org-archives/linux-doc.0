Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D721DC8CB
	for <linux-doc@vger.kernel.org>; Mon,  1 Jan 2024 00:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mQX35mr/"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BVNvuIh007295;
	Mon, 1 Jan 2024 00:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=m+uGDUzwoy19lTleQGJW262YTT5p5oJhsSZFU63+2sA=;
 b=mQX35mr/hJmdY+m8sTn49OOyfZy4H1GrBWrPTgOLZwFT1MTl6sX/YAgUjQGBAA7gLUhd
 +hUd3EsC7QStfzLzVUPXdGZe9uFSCNLYGL9FHvV0zaZOwiv6Oy+m/Qt8x/PAlcdujm/d
 K9igN6fQwzL12FUqE3OhS2gsNaaDJUbPcK0A73oEaXkZ9+rAo1MKn83uWTaa1lfgEXnc
 T2Tqz4WvBL030S4yhdAGbQMjOjzlx8T3vEsbcgCUKEDOdcwwM0p5G8kPEvwDpUzGKCCZ
 TGS3fi3B3nmYrSzt3UKGbQ8aOnhze8+NcBa+i64ebpfGpYX+JkWzQDr1of5aN0nZ6tuk Hw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vaatu1b9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Jan 2024 00:00:11 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3BVKFL70001883;
	Mon, 1 Jan 2024 00:00:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3va9n4xcqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Jan 2024 00:00:10 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 401007oX021824;
	Mon, 1 Jan 2024 00:00:10 GMT
Received: from localhost.localdomain (dhcp-10-175-57-83.vpn.oracle.com [10.175.57.83])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3va9n4xchr-2;
	Mon, 01 Jan 2024 00:00:10 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: [RFC PATCH 2/2] docs: kernel_abi.py: fix command injection
Date: Mon,  1 Jan 2024 00:59:59 +0100
Message-Id: <20231231235959.3342928-2-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231231235959.3342928-1-vegard.nossum@oracle.com>
References: <20231231235959.3342928-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-31_14,2023-12-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=915
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312310198
X-Proofpoint-GUID: cYXUiBmEUnhzdCQinFWf2zc6p7KmF9Dt
X-Proofpoint-ORIG-GUID: cYXUiBmEUnhzdCQinFWf2zc6p7KmF9Dt

The kernel-abi directive passes its argument straight to the shell.
This is unfortunate and unnecessary.

Let's always use paths relative to $srctree/Documentation/ and use
subprocess.check_call() instead of subprocess.Popen(shell=True).

This also makes the code shorter.

Link: https://fosstodon.org/@jani/111676532203641247
Reported-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/admin-guide/abi-obsolete.rst |  2 +-
 Documentation/admin-guide/abi-removed.rst  |  2 +-
 Documentation/admin-guide/abi-stable.rst   |  2 +-
 Documentation/admin-guide/abi-testing.rst  |  2 +-
 Documentation/sphinx/kernel_abi.py         | 56 ++++------------------
 5 files changed, 14 insertions(+), 50 deletions(-)

diff --git a/Documentation/admin-guide/abi-obsolete.rst b/Documentation/admin-guide/abi-obsolete.rst
index d095867899c5..594e697aa1b2 100644
--- a/Documentation/admin-guide/abi-obsolete.rst
+++ b/Documentation/admin-guide/abi-obsolete.rst
@@ -7,5 +7,5 @@ marked to be removed at some later point in time.
 The description of the interface will document the reason why it is
 obsolete and when it can be expected to be removed.
 
-.. kernel-abi:: $srctree/Documentation/ABI/obsolete
+.. kernel-abi:: ABI/obsolete
    :rst:
diff --git a/Documentation/admin-guide/abi-removed.rst b/Documentation/admin-guide/abi-removed.rst
index f7e9e43023c1..f9e000c81828 100644
--- a/Documentation/admin-guide/abi-removed.rst
+++ b/Documentation/admin-guide/abi-removed.rst
@@ -1,5 +1,5 @@
 ABI removed symbols
 ===================
 
-.. kernel-abi:: $srctree/Documentation/ABI/removed
+.. kernel-abi:: ABI/removed
    :rst:
diff --git a/Documentation/admin-guide/abi-stable.rst b/Documentation/admin-guide/abi-stable.rst
index 70490736e0d3..fc3361d847b1 100644
--- a/Documentation/admin-guide/abi-stable.rst
+++ b/Documentation/admin-guide/abi-stable.rst
@@ -10,5 +10,5 @@ for at least 2 years.
 Most interfaces (like syscalls) are expected to never change and always
 be available.
 
-.. kernel-abi:: $srctree/Documentation/ABI/stable
+.. kernel-abi:: ABI/stable
    :rst:
diff --git a/Documentation/admin-guide/abi-testing.rst b/Documentation/admin-guide/abi-testing.rst
index b205b16a72d0..19767926b344 100644
--- a/Documentation/admin-guide/abi-testing.rst
+++ b/Documentation/admin-guide/abi-testing.rst
@@ -16,5 +16,5 @@ Programs that use these interfaces are strongly encouraged to add their
 name to the description of these interfaces, so that the kernel
 developers can easily notify them if any changes occur.
 
-.. kernel-abi:: $srctree/Documentation/ABI/testing
+.. kernel-abi:: ABI/testing
    :rst:
diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 49797c55479c..5911bd0d7965 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -39,8 +39,6 @@ import sys
 import re
 import kernellog
 
-from os import path
-
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
@@ -73,60 +71,26 @@ class KernelCmd(Directive):
     }
 
     def run(self):
-
         doc = self.state.document
         if not doc.settings.file_insertion_enabled:
             raise self.warning("docutils: file insertion disabled")
 
-        env = doc.settings.env
-        cwd = path.dirname(doc.current_source)
-        cmd = "get_abi.pl rest --enable-lineno --dir "
-        cmd += self.arguments[0]
-
-        if 'rst' in self.options:
-            cmd += " --rst-source"
+        srctree = os.path.abspath(os.environ["srctree"])
 
-        srctree = path.abspath(os.environ["srctree"])
+        args = [
+            os.path.join(srctree, 'scripts/get_abi.pl'),
+            'rest',
+            '--enable-lineno',
+            '--dir', os.path.join(srctree, 'Documentation', self.arguments[0]),
+        ]
 
-        fname = cmd
-
-        # extend PATH with $(srctree)/scripts
-        path_env = os.pathsep.join([
-            srctree + os.sep + "scripts",
-            os.environ["PATH"]
-        ])
-        shell_env = os.environ.copy()
-        shell_env["PATH"]    = path_env
-        shell_env["srctree"] = srctree
+        if 'rst' in self.options:
+            args.append('--rst-source')
 
-        lines = self.runCmd(cmd, shell=True, cwd=cwd, env=shell_env)
+        lines = subprocess.check_output(args, cwd=os.path.dirname(doc.current_source)).decode('utf-8')
         nodeList = self.nestedParse(lines, self.arguments[0])
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
         env = self.state.document.settings.env
         content = ViewList()
-- 
2.34.1

