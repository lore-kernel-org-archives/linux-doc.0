Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A7A0D7D981
	for <lwn-linux-doc@archive.lwn.net>; Mon, 27 May 2019 22:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfE0W1G (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 27 May 2019 18:27:06 -0400
Received: from ms.lwn.net ([45.79.88.28]:58694 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727167AbfE0W1G (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 May 2019 18:27:06 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id ACFF16A2;
        Mon, 27 May 2019 22:27:05 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 7/7] kernel-doc: always name missing kerneldoc sections
Date:   Mon, 27 May 2019 16:26:58 -0600
Message-Id: <20190527222658.27304-8-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527222658.27304-1-corbet@lwn.net>
References: <20190527222658.27304-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The "no structured comments found" warning is not particularly useful if
there are several invocations, one of which is looking for something
wrong.  So if something specific has been requested, make it clear that
it's the one we weren't able to find.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/kernel-doc | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 3350e498b4ce..c0cb41e65b9b 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -285,7 +285,7 @@ use constant {
     OUTPUT_INTERNAL     => 4, # output non-exported symbols
 };
 my $output_selection = OUTPUT_ALL;
-my $show_not_found = 0;
+my $show_not_found = 0;	# No longer used
 
 my @export_file_list;
 
@@ -435,7 +435,7 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
     } elsif ($cmd eq 'enable-lineno') {
 	    $enable_lineno = 1;
     } elsif ($cmd eq 'show-not-found') {
-	$show_not_found = 1;
+	$show_not_found = 1;  # A no-op but don't fail
     } else {
 	# Unknown argument
         usage();
@@ -2163,12 +2163,14 @@ sub process_file($) {
     }
 
     # Make sure we got something interesting.
-    if ($initial_section_counter == $section_counter) {
-	if ($output_mode ne "none") {
-	    print STDERR "${file}:1: warning: no structured comments found\n";
+    if ($initial_section_counter == $section_counter && $
+	output_mode ne "none") {
+	if ($output_selection == OUTPUT_INCLUDE) {
+	    print STDERR "${file}:1: warning: '$_' not found\n"
+		for keys %function_table;
 	}
-	if (($output_selection == OUTPUT_INCLUDE) && ($show_not_found == 1)) {
-	    print STDERR "    Was looking for '$_'.\n" for keys %function_table;
+	else {
+	    print STDERR "${file}:1: warning: no structured comments found\n";
 	}
     }
 }
-- 
2.21.0

