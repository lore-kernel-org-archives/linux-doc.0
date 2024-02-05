Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA85B45950
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 17:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155523; cv=none; b=VgaYKPMNjdc3DsOCR/RM1HOmdxrTj0mJu6EeHpL0Z4lZ0Rn4sxm1tjMd43/Kilm0rAJUMylJcweKL4a1TzUmVoj9gvwDtae6DqjQ/JmF8zKTqlLEF3HMnlzV6phWICzV7oJnydUQb3P+qG7Nk998vOegrIWiL+n+lbEJWqWK3fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155523; c=relaxed/simple;
	bh=E0r42cc2iZuFurxwzXm6D37EinqENUqwWH2lzYiEJTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hhtUXaX/uXLGs201j3/vsSeFLvwyJ1gn6kjsvm/rmKBsPuv20IKzg3slWXH6tN0k+VJ9fUShDMcs6LnxynYDvqLwLDMJkaV35H7R56Qw7Qmpcwj5OPHvDnw1dpS5Tq2y4Z9JwH8dtPMBq00aDEOdmkB76Q+Fhaz5FmuWImKl/SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BQBmhL9F; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BQBmhL9F"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 415DVpcG023688;
	Mon, 5 Feb 2024 17:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=LEFIjNzhdFMard7t2m4AmWySO1XfOBV8UAjPNhsaujs=;
 b=BQBmhL9F4l/H2Sqrd1zKp/hvhMq9HREqp+tLLfxITOddyMNhsyEuFzqQCJXnaNF5lkET
 NxSDESAuJEpAA+AzC8aG1lldgWldDK5dUjimVZBpHBKdFomw7G/pLW7tg4LoqDCyYQdg
 wDPbYTAGEXkNIf2cy7s4EAc9ED9J3XlnK9TNk1ZUTUX74hEMNT2NDWwdLL5xFEA9PSnE
 M7SvV8/GpAGOi+nFN20sys6psi3AiTP91ajYnhscnvzK4qVGir6tgCLqMCP8fOkTiNHs
 4BI/aGy/E/a/ezdkoY4z+TcJ68iB1m9+wVyDaLHA4+1tZ3HnWeg0scLXjA2bIqcbVJ6Z Qg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1d3ucmt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:56 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 415GwUZO038386;
	Mon, 5 Feb 2024 17:51:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx5u27g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:55 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 415Hpkiw033449;
	Mon, 5 Feb 2024 17:51:55 GMT
Received: from localhost.localdomain (dhcp-10-175-62-2.vpn.oracle.com [10.175.62.2])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w1bx5u1vh-6;
	Mon, 05 Feb 2024 17:51:54 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 5/8] doc: kerneldoc.py: convert to sphinx.util.logging
Date: Mon,  5 Feb 2024 18:51:30 +0100
Message-Id: <20240205175133.774271-6-vegard.nossum@oracle.com>
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
X-Proofpoint-ORIG-GUID: geBsCPovOc9GeV1UbzDqyTJqsm4vQE8r
X-Proofpoint-GUID: geBsCPovOc9GeV1UbzDqyTJqsm4vQE8r

As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
to 2.4.4"), we can use Sphinx's built-in logging facilities.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/sphinx/kerneldoc.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 7acf09963daa..c74a3e417cea 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -38,11 +38,13 @@ from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
 import sphinx
+from sphinx.util import logging
 from sphinx.util.docutils import switch_source_input
-import kernellog
 
 __version__  = '1.0'
 
+logger = logging.getLogger(__name__)
+
 class KernelDocDirective(Directive):
     """Extract kernel-doc comments from the specified file"""
     required_argument = 1
@@ -109,8 +111,7 @@ class KernelDocDirective(Directive):
         cmd += [filename]
 
         try:
-            kernellog.verbose(env.app,
-                              'calling kernel-doc \'%s\'' % (" ".join(cmd)))
+            logger.verbose('calling kernel-doc \'%s\'', " ".join(cmd))
 
             p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
             out, err = p.communicate()
@@ -120,8 +121,7 @@ class KernelDocDirective(Directive):
             if p.returncode != 0:
                 sys.stderr.write(err)
 
-                kernellog.warn(env.app,
-                               'kernel-doc \'%s\' failed with return code %d' % (" ".join(cmd), p.returncode))
+                logger.warning('kernel-doc \'%s\' failed with return code %d', " ".join(cmd), p.returncode)
                 return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
             elif env.config.kerneldoc_verbosity > 0:
                 sys.stderr.write(err)
@@ -148,8 +148,8 @@ class KernelDocDirective(Directive):
             return node.children
 
         except Exception as e:  # pylint: disable=W0703
-            kernellog.warn(env.app, 'kernel-doc \'%s\' processing failed with: %s' %
-                           (" ".join(cmd), str(e)))
+            logger.warning('kernel-doc \'%s\' processing failed with: %s',
+                           " ".join(cmd), str(e))
             return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
 
     def do_parse(self, result, node):
-- 
2.34.1

