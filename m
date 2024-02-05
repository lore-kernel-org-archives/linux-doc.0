Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBB845971
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155526; cv=none; b=fXM5WP/N153/vC+fdmDO/kNHR6wpF2DEgPl3g4BwWA6Xgzqzjvd+YchH0cbS37dUE63AQLFMGy9fyH36/aUWhOPbPT2ckajalOTQxbvxdZvHh/+9SuFkk+WeDHP8bFGDJ4/+hsJ5ubYdc79C3CA2jZN08FG0EgFkdUr6TTDkgqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155526; c=relaxed/simple;
	bh=zl8XWRh61sZaW/goSYZcNbMcekiIdSaONij2/kj3zlc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FwSt2/wOsZ6o8qfFHRhFvMbdwOr5ZgAa2c+4r1nFzPAg1RL1vEPO5t0UalZaDBRn4V2SF8cOFoijFB/XJ8wbgbplxEQfJ0yPQcoQEmpMZb8NN+pFaKRbrKzwYirMQD602e8DD/IwEwc9kFxtzWqzgrO2Zm3oYaA5hZnPccT4FW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L5B4dBKp; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L5B4dBKp"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 415DWCMV017550;
	Mon, 5 Feb 2024 17:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=Jos363JbFx3QPovAuiXSn0LnBD11cLsviJ1paqbnUNo=;
 b=L5B4dBKpoCfpdmQ82iQ4KBCgyFJPhzJlWYHH4Lsa5mFz1Q1jvWlLUhImx1DtizONLrmI
 o1a9YQTOwieYIpzEvXODN2Xx+CRp2tWgTjGYiQiLd1j1NrVVG64YciEZ3RS2lpPksCub
 aLDlv8AajUJXSXLQRK96h3Q5W8YqJu7gi9tggbtsqGvHJBP13FVwPAzbFbaZ2uHR6iCT
 VQLLm5YtitGW2jzVr67EHCd5xFUFktLfYV89+4NW+3/xYxFZDpMhw19sJU+L1Jzz1Ady
 7mcGSzh1qTaQNZ6RSypGpQA6ZRN5MFFdu94m5TTnbzDSXPw/BY3StcpfoUx725kmKEw6 kA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1bwemmrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:58 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 415HOOvg038677;
	Mon, 5 Feb 2024 17:51:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx5u29e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:57 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 415Hpkj0033449;
	Mon, 5 Feb 2024 17:51:56 GMT
Received: from localhost.localdomain (dhcp-10-175-62-2.vpn.oracle.com [10.175.62.2])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w1bx5u1vh-7;
	Mon, 05 Feb 2024 17:51:56 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 6/8] doc: kfigure.py: convert to sphinx.util.logging
Date: Mon,  5 Feb 2024 18:51:31 +0100
Message-Id: <20240205175133.774271-7-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240205175133.774271-1-vegard.nossum@oracle.com>
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_12,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402050134
X-Proofpoint-ORIG-GUID: tJngD1FJkZe8CKgGVetNh8ryFUpThtBz
X-Proofpoint-GUID: tJngD1FJkZe8CKgGVetNh8ryFUpThtBz

As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
to 2.4.4"), we can use Sphinx's built-in logging facilities.

Gotchas:
- remove first argument 'app' from all calls
- instead of (fmt % (args)), use (fmt, args)
- instead of ("<fmt>: " + str) use ("<fmt: %s>", str)
- realign wrapped lines

I changed the "Neither inkscape(1) nor convert(1) found." message from a
.verbose() to a .warning(), since that actually affects the output in a
big way.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/sphinx/kfigure.py | 66 ++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/Documentation/sphinx/kfigure.py b/Documentation/sphinx/kfigure.py
index 97166333b727..b58f6458af63 100644
--- a/Documentation/sphinx/kfigure.py
+++ b/Documentation/sphinx/kfigure.py
@@ -58,13 +58,15 @@ from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives
 from docutils.parsers.rst.directives import images
 import sphinx
+from sphinx.util import logging
 from sphinx.util.nodes import clean_astext
-import kernellog
 
 Figure = images.Figure
 
 __version__  = '1.0.0'
 
+logger = logging.getLogger(__name__)
+
 # simple helper
 # -------------
 
@@ -170,7 +172,7 @@ def setupTools(app):
     """
     global dot_cmd, dot_Tpdf, convert_cmd, rsvg_convert_cmd   # pylint: disable=W0603
     global inkscape_cmd, inkscape_ver_one  # pylint: disable=W0603
-    kernellog.verbose(app, "kfigure: check installed tools ...")
+    logger.verbose("kfigure: check installed tools ...")
 
     dot_cmd = which('dot')
     convert_cmd = which('convert')
@@ -178,7 +180,7 @@ def setupTools(app):
     inkscape_cmd = which('inkscape')
 
     if dot_cmd:
-        kernellog.verbose(app, "use dot(1) from: " + dot_cmd)
+        logger.verbose("use dot(1) from: %s", dot_cmd)
 
         try:
             dot_Thelp_list = subprocess.check_output([dot_cmd, '-Thelp'],
@@ -190,10 +192,10 @@ def setupTools(app):
         dot_Tpdf_ptn = b'pdf'
         dot_Tpdf = re.search(dot_Tpdf_ptn, dot_Thelp_list)
     else:
-        kernellog.warn(app, "dot(1) not found, for better output quality install "
+        logger.warning("dot(1) not found, for better output quality install "
                        "graphviz from https://www.graphviz.org")
     if inkscape_cmd:
-        kernellog.verbose(app, "use inkscape(1) from: " + inkscape_cmd)
+        logger.verbose("use inkscape(1) from: %s", inkscape_cmd)
         inkscape_ver = subprocess.check_output([inkscape_cmd, '--version'],
                                                stderr=subprocess.DEVNULL)
         ver_one_ptn = b'Inkscape 1'
@@ -204,26 +206,26 @@ def setupTools(app):
 
     else:
         if convert_cmd:
-            kernellog.verbose(app, "use convert(1) from: " + convert_cmd)
+            logger.verbose("use convert(1) from: %s", convert_cmd)
         else:
-            kernellog.verbose(app,
+            logger.warning(
                 "Neither inkscape(1) nor convert(1) found.\n"
                 "For SVG to PDF conversion, "
                 "install either Inkscape (https://inkscape.org/) (preferred) or\n"
                 "ImageMagick (https://www.imagemagick.org)")
 
         if rsvg_convert_cmd:
-            kernellog.verbose(app, "use rsvg-convert(1) from: " + rsvg_convert_cmd)
-            kernellog.verbose(app, "use 'dot -Tsvg' and rsvg-convert(1) for DOT -> PDF conversion")
+            logger.verbose("use rsvg-convert(1) from: %s", rsvg_convert_cmd)
+            logger.verbose("use 'dot -Tsvg' and rsvg-convert(1) for DOT -> PDF conversion")
             dot_Tpdf = False
         else:
-            kernellog.verbose(app,
+            logger.verbose(
                 "rsvg-convert(1) not found.\n"
                 "  SVG rendering of convert(1) is done by ImageMagick-native renderer.")
             if dot_Tpdf:
-                kernellog.verbose(app, "use 'dot -Tpdf' for DOT -> PDF conversion")
+                logger.verbose("use 'dot -Tpdf' for DOT -> PDF conversion")
             else:
-                kernellog.verbose(app, "use 'dot -Tsvg' and convert(1) for DOT -> PDF conversion")
+                logger.verbose("use 'dot -Tsvg' and convert(1) for DOT -> PDF conversion")
 
 
 # integrate conversion tools
@@ -257,13 +259,12 @@ def convert_image(img_node, translator, src_fname=None):
 
     # in kernel builds, use 'make SPHINXOPTS=-v' to see verbose messages
 
-    kernellog.verbose(app, 'assert best format for: ' + img_node['uri'])
+    logger.verbose('assert best format for: %s', img_node['uri'])
 
     if in_ext == '.dot':
 
         if not dot_cmd:
-            kernellog.verbose(app,
-                              "dot from graphviz not available / include DOT raw.")
+            logger.verbose("dot from graphviz not available / include DOT raw.")
             img_node.replace_self(file2literal(src_fname))
 
         elif translator.builder.format == 'latex':
@@ -290,10 +291,9 @@ def convert_image(img_node, translator, src_fname=None):
 
         if translator.builder.format == 'latex':
             if not inkscape_cmd and convert_cmd is None:
-                kernellog.warn(app,
-                                  "no SVG to PDF conversion available / include SVG raw."
-                                  "\nIncluding large raw SVGs can cause xelatex error."
-                                  "\nInstall Inkscape (preferred) or ImageMagick.")
+                logger.warning("no SVG to PDF conversion available / include SVG raw.\n"
+                               "Including large raw SVGs can cause xelatex error.\n"
+                               "Install Inkscape (preferred) or ImageMagick.")
                 img_node.replace_self(file2literal(src_fname))
             else:
                 dst_fname = path.join(translator.builder.outdir, fname + '.pdf')
@@ -306,15 +306,14 @@ def convert_image(img_node, translator, src_fname=None):
         _name = dst_fname[len(str(translator.builder.outdir)) + 1:]
 
         if isNewer(dst_fname, src_fname):
-            kernellog.verbose(app,
-                              "convert: {out}/%s already exists and is newer" % _name)
+            logger.verbose("convert: {out}/%s already exists and is newer" % _name)
 
         else:
             ok = False
             mkdir(path.dirname(dst_fname))
 
             if in_ext == '.dot':
-                kernellog.verbose(app, 'convert DOT to: {out}/' + _name)
+                logger.verbose('convert DOT to: {out}/%s', _name)
                 if translator.builder.format == 'latex' and not dot_Tpdf:
                     svg_fname = path.join(translator.builder.outdir, fname + '.svg')
                     ok1 = dot2format(app, src_fname, svg_fname)
@@ -325,7 +324,7 @@ def convert_image(img_node, translator, src_fname=None):
                     ok = dot2format(app, src_fname, dst_fname)
 
             elif in_ext == '.svg':
-                kernellog.verbose(app, 'convert SVG to: {out}/' + _name)
+                logger.verbose('convert SVG to: {out}/%s', _name)
                 ok = svg2pdf(app, src_fname, dst_fname)
 
             if not ok:
@@ -354,8 +353,7 @@ def dot2format(app, dot_fname, out_fname):
     with open(out_fname, "w") as out:
         exit_code = subprocess.call(cmd, stdout = out)
         if exit_code != 0:
-            kernellog.warn(app,
-                          "Error #%d when calling: %s" % (exit_code, " ".join(cmd)))
+            logger.warning("Error #%d when calling: %s", exit_code, " ".join(cmd))
     return bool(exit_code == 0)
 
 def svg2pdf(app, svg_fname, pdf_fname):
@@ -388,13 +386,13 @@ def svg2pdf(app, svg_fname, pdf_fname):
         pass
 
     if exit_code != 0:
-        kernellog.warn(app, "Error #%d when calling: %s" % (exit_code, " ".join(cmd)))
+        logger.warning("Error #%d when calling: %s", exit_code, " ".join(cmd))
         if warning_msg:
-            kernellog.warn(app, "Warning msg from %s: %s"
-                           % (cmd_name, str(warning_msg, 'utf-8')))
+            logger.warning("Warning msg from %s: %s",
+                           cmd_name, str(warning_msg, 'utf-8'))
     elif warning_msg:
-        kernellog.verbose(app, "Warning msg from %s (likely harmless):\n%s"
-                          % (cmd_name, str(warning_msg, 'utf-8')))
+        logger.warning("Warning msg from %s (likely harmless):\n%s",
+                       cmd_name, str(warning_msg, 'utf-8'))
 
     return bool(exit_code == 0)
 
@@ -418,7 +416,7 @@ def svg2pdf_by_rsvg(app, svg_fname, pdf_fname):
         # use stdout and stderr from parent
         exit_code = subprocess.call(cmd)
         if exit_code != 0:
-            kernellog.warn(app, "Error #%d when calling: %s" % (exit_code, " ".join(cmd)))
+            logger.warning("Error #%d when calling: %s", exit_code, " ".join(cmd))
         ok = bool(exit_code == 0)
 
     return ok
@@ -513,15 +511,15 @@ def visit_kernel_render(self, node):
     app = self.builder.app
     srclang = node.get('srclang')
 
-    kernellog.verbose(app, 'visit kernel-render node lang: "%s"' % (srclang))
+    logger.verbose('visit kernel-render node lang: "%s"', srclang)
 
     tmp_ext = RENDER_MARKUP_EXT.get(srclang, None)
     if tmp_ext is None:
-        kernellog.warn(app, 'kernel-render: "%s" unknown / include raw.' % (srclang))
+        logger.warning('kernel-render: "%s" unknown / include raw.', srclang)
         return
 
     if not dot_cmd and tmp_ext == '.dot':
-        kernellog.verbose(app, "dot from graphviz not available / include raw.")
+        logger.verbose("dot from graphviz not available / include raw.")
         return
 
     literal_block = node[0]
-- 
2.34.1

