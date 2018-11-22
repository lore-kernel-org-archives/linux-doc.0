Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CED957D089
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Nov 2018 11:06:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405479AbeKVVpt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Nov 2018 16:45:49 -0500
Received: from mga02.intel.com ([134.134.136.20]:60822 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405478AbeKVVpt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Nov 2018 16:45:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Nov 2018 03:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,265,1539673200"; 
   d="scan'208";a="110276170"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2018 03:06:53 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTPS id A483C202E4;
        Thu, 22 Nov 2018 13:06:52 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1gPmo8-0005d7-TJ; Thu, 22 Nov 2018 13:06:05 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH 1/1] scripts/kernel-doc: Fix struct and struct field attribute processing
Date:   Thu, 22 Nov 2018 13:06:04 +0200
Message-Id: <20181122110604.21603-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kernel-doc attempts to clear the struct and struct member attributes
from the API documentation it produces. It falls short of the job in the
following respects:

- extra whitespaces are left where __attribute__((...)) was removed,

- only a single attribute is removed per struct,

- attributes (such as aligned) containing numbers were not removed,

- attributes are only cleared from struct fields, not structs themselves.

This patch addresses these issues by removing the attributes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 scripts/kernel-doc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index ffbe901a37b51..5a3945dc50358 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1062,7 +1062,7 @@ sub dump_struct($$) {
     my $x = shift;
     my $file = shift;
 
-    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}/) {
+    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
 	my $decl_type = $1;
 	$declaration_name = $2;
 	my $members = $3;
@@ -1073,8 +1073,9 @@ sub dump_struct($$) {
 	# strip comments:
 	$members =~ s/\/\*.*?\*\///gos;
 	# strip attributes
-	$members =~ s/__attribute__\s*\(\([a-z,_\*\s\(\)]*\)\)//i;
-	$members =~ s/__aligned\s*\([^;]*\)//gos;
+	$members =~ s/\s*__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)//gi;
+	$members =~ s/\s*__aligned\s*\([^;]*\)//gos;
+	$members =~ s/\s*__packed\s*//gos;
 	$members =~ s/\s*CRYPTO_MINALIGN_ATTR//gos;
 	# replace DECLARE_BITMAP
 	$members =~ s/DECLARE_BITMAP\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
-- 
2.11.0

