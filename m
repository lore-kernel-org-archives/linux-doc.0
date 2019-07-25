Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B5A7A7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Jul 2019 11:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391315AbfGYLYP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Jul 2019 07:24:15 -0400
Received: from mga02.intel.com ([134.134.136.20]:8567 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389393AbfGYLYP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Jul 2019 07:24:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jul 2019 04:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,306,1559545200"; 
   d="scan'208";a="160875077"
Received: from ngote-system-product-name.iind.intel.com ([10.106.124.92])
  by orsmga007.jf.intel.com with ESMTP; 25 Jul 2019 04:24:10 -0700
From:   NitinGote <nitin.r.gote@intel.com>
To:     joe@perches.com, keescook@chromium.org
Cc:     corbet@lwn.net, akpm@linux-foundation.org, apw@canonical.com,
        linux-doc@vger.kernel.org, kernel-hardening@lists.openwall.com,
        Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v6] Documentation/checkpatch: Prefer stracpy over strcpy/strlcpy/strncpy.
Date:   Thu, 25 Jul 2019 16:52:19 +0530
Message-Id: <20190725112219.6244-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Nitin Gote <nitin.r.gote@intel.com>

Added check in checkpatch.pl to deprecate strcpy(), strlcpy() and
strncpy() in favor of stracpy().

Updated Documentation/process/deprecated.rst for stracpy().

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 Change log:
 v5->v6
 - Used stracpy() instead of strscpy().

 v4->v5
 - Change the subject line as per review comment.
 - v5 is Reviewed-by: Kees Cook <keescook@chromium.org>

 v3->v4
 - Removed "c:func:" from deprecated.rst as per review comment.

 v2->v3
 - Avoided use of $check in implementation.
 - Incorporated trivial comments.

 v1->v2
 - For string related apis, created different %deprecated_string_api
   and these will get emitted at CHECK Level using command line option
   -f/--file to avoid bad patched from novice script users.

 Documentation/process/deprecated.rst | 10 +++++-----
 scripts/checkpatch.pl                | 24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index 49e0f64a3427..709662c71a1a 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -84,7 +84,7 @@ buffer. This could result in linear overflows beyond the
 end of the buffer, leading to all kinds of misbehaviors. While
 `CONFIG_FORTIFY_SOURCE=y` and various compiler flags help reduce the
 risk of using this function, there is no good reason to add new uses of
-this function. The safe replacement is :c:func:`strscpy`.
+this function. The safe replacement is stracpy().

 strncpy() on NUL-terminated strings
 -----------------------------------
@@ -93,9 +93,9 @@ will be NUL terminated. This can lead to various linear read overflows
 and other misbehavior due to the missing termination. It also NUL-pads the
 destination buffer if the source contents are shorter than the destination
 buffer size, which may be a needless performance penalty for callers using
-only NUL-terminated strings. The safe replacement is :c:func:`strscpy`.
-(Users of :c:func:`strscpy` still needing NUL-padding will need an
-explicit :c:func:`memset` added.)
+only NUL-terminated strings. In this case, the safe replacement is
+stracpy(). If, however, the destination buffer still needs NUL-padding,
+the safe replacement is stracpy_pad().

 If a caller is using non-NUL-terminated strings, :c:func:`strncpy()` can
 still be used, but destinations should be marked with the `__nonstring
@@ -107,7 +107,7 @@ strlcpy()
 :c:func:`strlcpy` reads the entire source buffer first, possibly exceeding
 the given limit of bytes to copy. This is inefficient and can lead to
 linear read overflows if a source string is not NUL-terminated. The
-safe replacement is :c:func:`strscpy`.
+safe replacement is stracpy().

 Variable Length Arrays (VLAs)
 -----------------------------
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 342c7c781ba5..dddf5adf1aac 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -605,6 +605,20 @@ foreach my $entry (keys %deprecated_apis) {
 }
 $deprecated_apis_search = "(?:${deprecated_apis_search})";

+our %deprecated_string_apis = (
+	"strcpy"		=> "stracpy",
+	"strlcpy"		=> "stracpy",
+	"strncpy"		=> "stracpy - for non-NUL-terminated uses, strncpy dest should be __nonstring",
+);
+
+#Create a search pattern for all these strings apis to speed up a loop below
+our $deprecated_string_apis_search = "";
+foreach my $entry (keys %deprecated_string_apis) {
+        $deprecated_string_apis_search .= '|' if ($deprecated_string_apis_search ne "");
+        $deprecated_string_apis_search .= $entry;
+}
+$deprecated_string_apis_search = "(?:${deprecated_string_apis_search})";
+
 our $mode_perms_world_writable = qr{
 	S_IWUGO		|
 	S_IWOTH		|
@@ -6446,6 +6460,16 @@ sub process {
 			     "Deprecated use of '$deprecated_api', prefer '$new_api' instead\n" . $herecurr);
 		}

+# check for string deprecated apis
+		if ($line =~ /\b($deprecated_string_apis_search)\b\s*\(/) {
+			my $deprecated_string_api = $1;
+			my $new_api = $deprecated_string_apis{$deprecated_string_api};
+			my $msg_level = \&WARN;
+			$msg_level = \&CHK if ($file);
+			&{$msg_level}("DEPRECATED_API",
+				      "Deprecated use of '$deprecated_string_api', prefer '$new_api' instead\n" . $herecurr);
+		}
+
 # check for various structs that are normally const (ops, kgdb, device_tree)
 # and avoid what seem like struct definitions 'struct foo {'
 		if ($line !~ /\bconst\b/ &&
--
2.17.1

