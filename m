Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BA72A1C7
	for <linux-doc@vger.kernel.org>; Thu,  4 Sep 2025 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756980067; cv=none; b=rgI+O7NWd4r76ZZ/Oc759VTIr4jace49UuwhtrLe/mivy23zGCcZxfhRrnY/D3rcezz04HAUgQ/lzlTVGmRz+F9xOA041watRin8SMV+8XbS3F5bJ957GvxzNvfQVK+hXQujyXlaPbkqVvUEN+qf2L2Wur/UIkEgudi/31EMzUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756980067; c=relaxed/simple;
	bh=9grlEZvpNwYPR8AsyuZhWqYjtadqZ9sOLU55FMZFAkk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X9vN3ZYJd+eCRpst9BKtvsfsv+kyR6JlWvrG2We5SYxr5I/UpJzXck1L5HgNKTxaxpXfCdEewvEdmxsxeUxSpXx4tI8Uz3RZurSxQauSGIT/B02/s3OUe5lB3ImaUuPuXskPYaSEClVi/tVdyUMvZU9yklyeynFU+1+dEpiB8ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DNDGLi2t; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DNDGLi2t"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58499so4010470;
	Thu, 4 Sep 2025 10:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=H4SOmYSb0buI3Ba4avLrfLTr6HmRCtW+7ZHeJibXlNI=; b=
	DNDGLi2tafCSqcewJkcQJMYjWIB7qR57ECpL6Va0zFu8vNBkSGbeCi5/WkTnVRvu
	cFHhYqlGViNu5NapGrFroQzU1Wb11fQfyvwlGUf5urEBDxCdb9pEKoViKjPuLei2
	ISUKfVJVb+LdQQHnuhkoU7dGJhoJsByaOJVI7+2umBszLpDepCkTmIW0CNtCV6V+
	6Uf32BIxdu7Pi++4tWIoo8ChbXrlVrP3wY/vRnrM+VRq7lu3UmX+9qWgm4JIRkAJ
	V/b7aE2XT5n6q04f4qbhePhWBcQHnEbYrG8DGzzjwz+c9iAkw4XlilA8JIvFDEGg
	aIbXut2u4OpDO+oWkhUdFA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48y7vy0455-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 10:01:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5848jgsZ036360;
	Thu, 4 Sep 2025 09:45:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrbbycp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 09:45:39 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5849jYZq033188;
	Thu, 4 Sep 2025 09:45:39 GMT
Received: from localhost.localdomain (dhcp-10-154-122-161.vpn.oracle.com [10.154.122.161])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 48uqrbbyar-3;
	Thu, 04 Sep 2025 09:45:38 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH RFC 3/3] docs: add scripts/documentation-gen-redirects.py
Date: Thu,  4 Sep 2025 11:45:20 +0200
Message-Id: <20250904094520.451070-3-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904094520.451070-1-vegard.nossum@oracle.com>
References: <20250904094520.451070-1-vegard.nossum@oracle.com>
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
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509040096
X-Proofpoint-ORIG-GUID: LUfg-FswQqCcMZz45C0AezlJ52XvRRiQ
X-Proofpoint-GUID: LUfg-FswQqCcMZz45C0AezlJ52XvRRiQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDA5MCBTYWx0ZWRfXy6pSk/3sgB8g
 czbE9ujg5ODlraSYDnO2TfT8ym/QqEYUZ3fw4vqzZ1f+wZa/gVrl7+7yZO84+irYWQmk1C3h4Pl
 SsSPb1OIqxGg+IXl//PEx3hDzoWtnwmFszBlA656Lx94mrXQHHhl0lz3k0+B9bpsm68FEXV+YFJ
 5PFsVQkBGiCnOf5nq4Lq4CCc48lhAukEoYAG3NH3mKc1m0NmPOAMDGFcCyA6xAvskY5B2CF7ZpQ
 ecSyd927VA0GABQlfoNATEB8/Elc3IRtQyTPZOAAg2uBxCh/u1aPq4gJFEtZ4IDQDCp/MwgiFQS
 F5/6RemHNWnHyY1vz8rdvQzUga2j5XSkcF2LgObeo937r2MnvG1c0FhI8OkpOqLiyQqQomF0aHc
 /kdaENuc
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=68b9635e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ag1SF4gXAAAA:8 a=07d9gI8wAAAA:8
 a=yPCof4ZbAAAA:8 a=ZWDM03DPKvESC0Zxh4QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=e2CUPOnPG4QKp8I52DXD:22

Add a new script and a new documentation 'make' target,
htmldocs-redirects.

This will generate HTML stub files in the HTML documentation output
directory that redirect the browser to the new path.

Suggested-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/Makefile                 |  4 +++
 Makefile                               |  5 +--
 scripts/documentation-gen-redirects.py | 45 ++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100755 scripts/documentation-gen-redirects.py

diff --git a/Documentation/Makefile b/Documentation/Makefile
index b98477df5ddfc..59fc77ebeceed 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -124,6 +124,9 @@ htmldocs:
 	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
 
+htmldocs-redirects: $(srctree)/Documentation/.renames.txt
+	@scripts/documentation-gen-redirects.py --output $(BUILDDIR) < $<
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
diff --git a/scripts/documentation-gen-redirects.py b/scripts/documentation-gen-redirects.py
new file mode 100755
index 0000000000000..20fecbf6697d6
--- /dev/null
+++ b/scripts/documentation-gen-redirects.py
@@ -0,0 +1,45 @@
+#! /usr/bin/env python3
+#
+# Copyright © 2025, Oracle and/or its affiliates.
+# Author: Vegard Nossum <vegard.nossum@oracle.com>
+
+import argparse
+import os
+import sys
+
+parser = argparse.ArgumentParser()
+parser.add_argument('-o', '--output', help='Output directory')
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

