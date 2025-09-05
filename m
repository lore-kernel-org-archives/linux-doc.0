Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F704400
	for <linux-doc@vger.kernel.org>; Fri,  5 Sep 2025 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757083591; cv=none; b=glTd8BjAMZvTUVpl4KaQ/2VqdG3xI88R7kn8PayE4BGBALkQ1XdXosWvPVQezKQKQcA//dmvq4GkhcuFL9ryXV8jiZfsoZqPMjC8kCPpegbxNxvqoaM321QSC9h5QJBvKUAww++Oo2iny2LF23z4EJRwCQqSdL9D4MSE4/HzmSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757083591; c=relaxed/simple;
	bh=fasin47LGarLKDIEqRCJ7siD6oBMYRImiNLdEaUY6qs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i1OBQDH/6UxmpHF5EI2eCS1VFiBur9fSmvCbrjCB8RSH8f4P8+WUQziJOIz25pEdiev2N585JgptD2/1qgxDCtdh6AbnSJNO5pnXk8q0uWgxDqK4n4202Bs7QhtbC+kEERQN9cNYj0sIUQLskGeimmpsJPrswdT/yTHbEOoyp2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f725i3Wg; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f725i3Wg"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585EXZHn003245;
	Fri, 5 Sep 2025 14:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Ss/wh0BQ+xaFV6VIgpUO5v/veX0f7entj58+g9epLQc=; b=
	f725i3Wg4UjY4z1z0R3LYycLsxL3QAIwvTlJMaZhWud2sVLd4iNorV7ATABH1TBU
	4w7AqfI4trbEOuoTaVVjNH+Tc188iHZaQ9j0vWV38OfdEX1X80R47Bt8viorRB7w
	gxg5lo4oh1NYrYSt+ml/TBwKg4nWuvD9eURoeO3zzt2CsASz3pfzt80pNUfD+gAV
	JNZh4UVOLqJ6+JOOQStV4g8hL3VatpuiEDrZSaknWWKp0IwAMGGoT2U/cCG36pjf
	adGG4UnW/YxqbKIpHZnY+yk+25Qu/r+m+yZsn4KL8NuOCA1xv9DUHi9qZNF8Lr0u
	ea1FxtDF5aJznsJRAKMr+g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4901qp00s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Sep 2025 14:46:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 585DmG2Z026221;
	Fri, 5 Sep 2025 14:46:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrd3vsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Sep 2025 14:46:24 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 585EkKZe022015;
	Fri, 5 Sep 2025 14:46:24 GMT
Received: from localhost.localdomain (dhcp-10-154-122-46.vpn.oracle.com [10.154.122.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48uqrd3vm5-4;
	Fri, 05 Sep 2025 14:46:24 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH v2 3/3] docs: add tools/docs/gen-redirects.py
Date: Fri,  5 Sep 2025 16:46:08 +0200
Message-Id: <20250905144608.577449-4-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905144608.577449-1-vegard.nossum@oracle.com>
References: <20250905144608.577449-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509050145
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MSBTYWx0ZWRfXxswxmRI+g24h
 OS6hE2gDUOnsEjjmBcf42lYFVkqIwVpsiISlU6PT5RzAMZqewb5auxI5IS+eB04KRtmRhrDZNhd
 dPTyugmHy8QHBesrBFr9JVyyjDmWTGITQVj82yoP8/PAtdwlPPGMplPvBBkhhVYWHWUuzszHeJI
 V3x+TTbFShMgk4e2fG9p0Ktpv7tS9YYW4/bhCBLuqHA/BJgmnKFLO8MMn0hvwiZ0KqbtZR/xHOu
 pJA11aQMClJwwtYmqH3h0LIBGJOjiQvQR8vgM9o86JgRnAQzSkGdLtTKo82tLq6Cnqby04nctMm
 RDfRSJpuR0Or1SUNSP1VkgSKpsBgpmCZtj2xqZAVSxUqrGO1iVxM2NQjpC0J/j5oJZ7d6/JtB8c
 LiTQkXTOeQJZlstxxi5hTODNg66sSQ==
X-Proofpoint-GUID: bGixF9wtoWMyan02khd9gXr-Y00RBaPB
X-Authority-Analysis: v=2.4 cv=PqOTbxM3 c=1 sm=1 tr=0 ts=68baf7c1 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ag1SF4gXAAAA:8 a=07d9gI8wAAAA:8
 a=yPCof4ZbAAAA:8 a=pKj-dFjRtrQsPEjPR58A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=e2CUPOnPG4QKp8I52DXD:22 cc=ntf awl=host:13602
X-Proofpoint-ORIG-GUID: bGixF9wtoWMyan02khd9gXr-Y00RBaPB

Add a new script and a new documentation 'make' target,
htmldocs-redirects.

This will generate HTML stub files in the HTML documentation output
directory that redirect the browser to the new path.

Suggested-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/Makefile      |  4 +++
 Makefile                    |  5 ++--
 tools/docs/gen-redirects.py | 54 +++++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100755 tools/docs/gen-redirects.py

diff --git a/Documentation/Makefile b/Documentation/Makefile
index b98477df5ddfc..fdd6d8469155b 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -124,6 +124,9 @@ htmldocs:
 	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
 
+htmldocs-redirects: $(srctree)/Documentation/.renames.txt
+	@tools/docs/gen-redirects.py --output $(BUILDDIR) < $<
+
 # If Rust support is available and .config exists, add rustdoc generated contents.
 # If there are any, the errors from this make rustdoc will be displayed but
 # won't stop the execution of htmldocs
@@ -193,6 +196,7 @@ cleandocs:
 dochelp:
 	@echo  ' Linux kernel internal documentation in different formats from ReST:'
 	@echo  '  htmldocs        - HTML'
+	@echo  '  htmldocs-redirects - generate HTML redirects for moved pages'
 	@echo  '  texinfodocs     - Texinfo'
 	@echo  '  infodocs        - Info'
 	@echo  '  latexdocs       - LaTeX'
diff --git a/Makefile b/Makefile
index 06c28b1d7e67a..5dc8ce3d28a2a 100644
--- a/Makefile
+++ b/Makefile
@@ -1799,8 +1799,9 @@ $(help-board-dirs): help-%:
 
 # Documentation targets
 # ---------------------------------------------------------------------------
-DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
-	       linkcheckdocs dochelp refcheckdocs texinfodocs infodocs
+DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs htmldocs-redirects \
+	       epubdocs cleandocs linkcheckdocs dochelp refcheckdocs \
+	       texinfodocs infodocs
 PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS):
 	$(Q)$(MAKE) $(build)=Documentation $@
diff --git a/tools/docs/gen-redirects.py b/tools/docs/gen-redirects.py
new file mode 100755
index 0000000000000..6a6ebf6f42dc8
--- /dev/null
+++ b/tools/docs/gen-redirects.py
@@ -0,0 +1,54 @@
+#! /usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright © 2025, Oracle and/or its affiliates.
+# Author: Vegard Nossum <vegard.nossum@oracle.com>
+
+"""Generate HTML redirects for renamed Documentation/**.rst files using
+the output of tools/docs/gen-renames.py.
+
+Example:
+
+    tools/docs/gen-redirects.py --output Documentation/output/ < Documentation/.renames.txt
+"""
+
+import argparse
+import os
+import sys
+
+parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
+parser.add_argument('-o', '--output', help='output directory')
+
+args = parser.parse_args()
+
+for line in sys.stdin:
+    line = line.rstrip('\n')
+
+    old_name, new_name = line.split(' ', 2)
+
+    old_html_path = os.path.join(args.output, old_name + '.html')
+    new_html_path = os.path.join(args.output, new_name + '.html')
+
+    if not os.path.exists(new_html_path):
+        print(f"warning: target does not exist: {new_html_path} (redirect from {old_html_path})")
+        continue
+
+    old_html_dir = os.path.dirname(old_html_path)
+    if not os.path.exists(old_html_dir):
+        os.makedirs(old_html_dir)
+
+    relpath = os.path.relpath(new_name, os.path.dirname(old_name)) + '.html'
+
+    with open(old_html_path, 'w') as f:
+        print(f"""\
+<!DOCTYPE html>
+
+<html lang="en">
+<head>
+    <title>This page has moved</title>
+    <meta http-equiv="refresh" content="0; url={relpath}">
+</head>
+<body>
+<p>This page has moved to <a href="{relpath}">{new_name}</a>.</p>
+</body>
+</html>""", file=f)
-- 
2.34.1

