Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BD7527E244
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Mar 2018 03:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932758AbeCED6l (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 4 Mar 2018 22:58:41 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:59597 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932709AbeCED6i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Mar 2018 22:58:38 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 2188420A9C;
        Sun,  4 Mar 2018 22:58:38 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
  by compute5.internal (MEProxy); Sun, 04 Mar 2018 22:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=cc
        :date:from:in-reply-to:message-id:references:subject:to
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=T5rmsaOHMRrS3v9pf
        r0KZPzlk7qSPCqPncFWGTdHdk4=; b=EqPa+subl6QD55CAA8pQSvxdBJQKdQc1V
        dtAbzxixTA7CvDFXENh/fuLiOl2Jrm2Y3ioNgxTcsRaSKRrF9UBMC+CJrhFz1GWv
        1PR+chEXhDoJ22U5Ci+fDOYcBMauRD/g2fV8+vdTOjvUL4vNbZvZ9c3whhk/X88D
        k6iAlEiLNRsaveycUFQX1JT7MTpcl/o8X6KtiAi8Rkfl+qzVFSsnsMivcdE4JGpy
        8EKBKsI5JpCc7od76vdNjticTgxIHquAiKDVIxJbnPsljUJmYfS3D/lDsw+wWLNc
        FPsr4E5FfhHeZUoVbmpqhhl45hKD+ZUlrbIRGOQ8LD9PWm7zvCP7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:date:from:in-reply-to:message-id
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=T5rmsaOHMRrS3v9pfr0KZPzlk7qSPCqPncFWGTdHdk4=; b=ON9L02Cb
        5PnHSrWkq1xm4bPPm4EZ31fVbHmXufSoyMrH/OPI23h1f/SwGrmx57f4flWsSrQB
        9/9HslWyGZuwed8fa1rAGa+Hh54TYVfn26UnzEuLVEH2uh/VSi7ozflI5yT1a29n
        ayB4l8pmXz9cvUDES19db1uGjKOp+YO3lY2ijCebevhxe0i2q51qvjvyGzwfJRsO
        EaIBbKdrE4h1Xs7ipTVyh+wMU7EqLs68bDD/k0ae7KmrO7IFjT2/Y+ct1kF6fsdA
        Q4+8QRShFuzsWRzd0yncCfNBxiaz0P8YoiwsDye3vn21UIfqPW+OOut75vGmfMo8
        oTIXiDXppShgBw==
X-ME-Sender: <xms:bsCcWhhLVfHooBez_H2j8oDSYFLX0GEoaToqMF0pWEvKdKckKBAU5A>
Received: from localhost (ppp121-44-99-155.bras1.syd7.internode.on.net [121.44.99.155])
        by mail.messagingengine.com (Postfix) with ESMTPA id 605A77E1F3;
        Sun,  4 Mar 2018 22:58:37 -0500 (EST)
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Tobin C. Harding" <me@tobin.cc>, Joe Perches <joe@perches.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 1/2] checkpatch: add check for tag Co-Developed-by
Date:   Mon,  5 Mar 2018 14:58:20 +1100
Message-Id: <1520222301-11874-2-git-send-email-me@tobin.cc>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520222301-11874-1-git-send-email-me@tobin.cc>
References: <1520222301-11874-1-git-send-email-me@tobin.cc>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Joe Perches <joe@perches.com>

Recently signature tag Co-Developed-by was added to the
kernel (Documentation/process/5.Posting.rst). checkpatch.pl doesn't know
about it yet. All prior tags used all lowercase characters except for first
character. Checks for this format had to be re-worked to allow for the
new tag.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Tobin C. Harding <me@tobin.cc>
---
 scripts/checkpatch.pl | 58 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 23 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3d4040322ae1..fbe2ae2d035f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -461,16 +461,18 @@ our $logFunctions = qr{(?x:
 	seq_vprintf|seq_printf|seq_puts
 )};
 
-our $signature_tags = qr{(?xi:
-	Signed-off-by:|
-	Acked-by:|
-	Tested-by:|
-	Reviewed-by:|
-	Reported-by:|
-	Suggested-by:|
-	To:|
-	Cc:
-)};
+our @valid_signatures = (
+	"Signed-off-by:",
+	"Acked-by:",
+	"Tested-by:",
+	"Reviewed-by:",
+	"Reported-by:",
+	"Suggested-by:",
+	"Co-Developed-by:",
+	"To:",
+	"Cc:"
+);
+my $signature_tags = "(?x:" . join('|', @valid_signatures) . ")";
 
 our @typeListMisordered = (
 	qr{char\s+(?:un)?signed},
@@ -2193,6 +2195,17 @@ sub pos_last_openparen {
 	return length(expand_tabs(substr($line, 0, $last_openparen))) + 1;
 }
 
+sub get_preferred_sign_off {
+	my ($sign_off) = @_;
+
+	foreach my $sig (@valid_signatures) {
+		if (lc($sign_off) eq lc($sig)) {
+			return $sig;
+		}
+	}
+	return "";
+}
+
 sub process {
 	my $filename = shift;
 
@@ -2499,35 +2512,34 @@ sub process {
 			my $sign_off = $2;
 			my $space_after = $3;
 			my $email = $4;
-			my $ucfirst_sign_off = ucfirst(lc($sign_off));
+			my $preferred_sign_off = ucfirst(lc($sign_off));
 
-			if ($sign_off !~ /$signature_tags/) {
+			if ($sign_off !~ /$signature_tags/i) {
 				WARN("BAD_SIGN_OFF",
 				     "Non-standard signature: $sign_off\n" . $herecurr);
-			}
-			if (defined $space_before && $space_before ne "") {
+			} elsif ($sign_off !~ /$signature_tags/) {
+				$preferred_sign_off = get_preferred_sign_off($sign_off);
 				if (WARN("BAD_SIGN_OFF",
-					 "Do not use whitespace before $ucfirst_sign_off\n" . $herecurr) &&
+					 "'$preferred_sign_off' is the preferred signature form\n" . $herecurr) &&
 				    $fix) {
-					$fixed[$fixlinenr] =
-					    "$ucfirst_sign_off $email";
+					$fixed[$fixlinenr] = "$preferred_sign_off $email";
 				}
 			}
-			if ($sign_off =~ /-by:$/i && $sign_off ne $ucfirst_sign_off) {
+			if (defined $space_before && $space_before ne "") {
 				if (WARN("BAD_SIGN_OFF",
-					 "'$ucfirst_sign_off' is the preferred signature form\n" . $herecurr) &&
+					 "Do not use whitespace before $preferred_sign_off\n" . $herecurr) &&
 				    $fix) {
 					$fixed[$fixlinenr] =
-					    "$ucfirst_sign_off $email";
+					    "$preferred_sign_off $email";
 				}
-
 			}
+
 			if (!defined $space_after || $space_after ne " ") {
 				if (WARN("BAD_SIGN_OFF",
-					 "Use a single space after $ucfirst_sign_off\n" . $herecurr) &&
+					 "Use a single space after $preferred_sign_off\n" . $herecurr) &&
 				    $fix) {
 					$fixed[$fixlinenr] =
-					    "$ucfirst_sign_off $email";
+					    "$preferred_sign_off $email";
 				}
 			}
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
