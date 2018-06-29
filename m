Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 776B97D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Jun 2018 21:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754042AbeF2VFY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Jun 2018 17:05:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50670 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753973AbeF2VFX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jun 2018 17:05:23 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w5TL3hAE053652
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 17:05:22 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2jwst5wdfg-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 17:05:22 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Fri, 29 Jun 2018 22:05:20 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 29 Jun 2018 22:05:18 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w5TL5H1B37159144
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 29 Jun 2018 21:05:17 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 07EA252059;
        Fri, 29 Jun 2018 22:05:06 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.207.81])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 7ED9B52057;
        Fri, 29 Jun 2018 22:05:04 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Sat, 30 Jun 2018 00:05:15 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Jani Nikula <jani.nikula@intel.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH v3 1/2] Documentation/sphinx: allow "functions" with no parameters
Date:   Sat, 30 Jun 2018 00:05:10 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530306311-10510-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1530306311-10510-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18062921-0028-0000-0000-000002D686F5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18062921-0029-0000-0000-0000238DF9C0
Message-Id: <1530306311-10510-2-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-06-29_10:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1806290223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When kernel-doc:: specified in .rst document without explicit directives,
it outputs both comment and DOC: sections. If a DOC: section was explicitly
included in the same document it will be duplicated. For example, the
output generated for Documentation/core-api/idr.rst [1] has "IDA
description" in the "IDA usage" section and in the middle of the API
reference.

This patch enables using "functions" directive without parameters to output
all the documentation excluding DOC: sections.

[1] https://www.kernel.org/doc/html/v4.17/core-api/idr.html

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
Acked-by: Matthew Wilcox <willy@infradead.org>
---
 Documentation/doc-guide/kernel-doc.rst |  9 +++++++--
 Documentation/sphinx/kerneldoc.py      | 10 +++++++---
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index 80383b1..8db53cd 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -488,14 +488,19 @@ doc: *title*
     .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
        :doc: High Definition Audio over HDMI and Display Port
 
-functions: *function* *[...]*
+functions: *[ function ...]*
   Include documentation for each *function* in *source*.
+  If no *function* if specified, the documentaion for all functions
+  and types in the *source* will be included.
 
-  Example::
+  Examples::
 
     .. kernel-doc:: lib/bitmap.c
        :functions: bitmap_parselist bitmap_parselist_user
 
+    .. kernel-doc:: lib/idr.c
+       :functions:
+
 Without options, the kernel-doc directive includes all documentation comments
 from the source file.
 
diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index fbedcc3..9d0a7f0 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -47,7 +47,7 @@ class KernelDocDirective(Directive):
     optional_arguments = 4
     option_spec = {
         'doc': directives.unchanged_required,
-        'functions': directives.unchanged_required,
+        'functions': directives.unchanged,
         'export': directives.unchanged,
         'internal': directives.unchanged,
     }
@@ -75,8 +75,12 @@ class KernelDocDirective(Directive):
         elif 'doc' in self.options:
             cmd += ['-function', str(self.options.get('doc'))]
         elif 'functions' in self.options:
-            for f in str(self.options.get('functions')).split():
-                cmd += ['-function', f]
+            functions = self.options.get('functions').split()
+            if functions:
+                for f in functions:
+                    cmd += ['-function', f]
+            else:
+                cmd += ['-no-doc-sections']
 
         for pattern in export_file_patterns:
             for f in glob.glob(env.config.kerneldoc_srctree + '/' + pattern):
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
