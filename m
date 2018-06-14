Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD13A7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Jun 2018 16:17:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755235AbeFNQQ7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Jun 2018 12:16:59 -0400
Received: from osg.samsung.com ([64.30.133.232]:59293 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755416AbeFNQJU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 14 Jun 2018 12:09:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 10A2720EF1;
        Thu, 14 Jun 2018 09:09:20 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id B_HGKODnptFo; Thu, 14 Jun 2018 09:09:19 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.114.220.dynamic.adsl.gvt.net.br [177.41.114.220])
        by osg.samsung.com (Postfix) with ESMTPSA id 83F7E20EA2;
        Thu, 14 Jun 2018 09:09:16 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.91)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fTUoE-0005Sx-5c; Thu, 14 Jun 2018 13:09:14 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 12/27] scripts/documentation-file-ref-check: add a fix logic for DT
Date:   Thu, 14 Jun 2018 13:08:57 -0300
Message-Id: <1676a46d9df76ede6c5c59d00709e69929fdbe6c.1528990947.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528990947.git.mchehab+samsung@kernel.org>
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1528990947.git.mchehab+samsung@kernel.org>
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are several links broken due to DT file movements. Add
a hint logic to seek for those changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 MAINTAINERS                          |  2 +-
 scripts/documentation-file-ref-check | 20 +++++++++++++++++---
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 09554034be46..ec65e33e2cf1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7425,7 +7425,7 @@ M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	drivers/iio/gyro/mpu3050*
-F:	Documentation/devicetree/bindings/iio/gyroscope/inv,mpu3050.txt
+F:	Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt
 
 IOC3 ETHERNET DRIVER
 M:	Ralf Baechle <ralf@linux-mips.org>
diff --git a/scripts/documentation-file-ref-check b/scripts/documentation-file-ref-check
index 9d5e21b10346..c8bc1c1c1d6e 100755
--- a/scripts/documentation-file-ref-check
+++ b/scripts/documentation-file-ref-check
@@ -64,7 +64,7 @@ while (<IN>) {
 		next if (grep -e, glob("$ref $fulref"));
 
 		if ($fix) {
-			if (!($ref =~ m/(devicetree|scripts|Kconfig|Kbuild)/)) {
+			if (!($ref =~ m/(scripts|Kconfig|Kbuild)/)) {
 				$broken_ref{$ref}++;
 			}
 		} else {
@@ -84,10 +84,19 @@ foreach my $ref (keys %broken_ref) {
 	# get just the basename
 	$new =~ s,.*/,,;
 
-	# Seek for the same name on another place, as it may have been moved
 	my $f="";
 
-	$f = qx(find . -iname $new) if ($new);
+	# usual reason for breakage: DT file moved around
+	if ($ref =~ /devicetree/) {
+		my $search = $new;
+		$search =~ s,^.*/,,;
+		$f = qx(find Documentation/devicetree/ -iname "*$search*") if ($search);
+		if (!$f) {
+			# Manufacturer name may have changed
+			$search =~ s/^.*,//;
+			$f = qx(find Documentation/devicetree/ -iname "*$search*") if ($search);
+		}
+	}
 
 	# usual reason for breakage: file renamed to .rst
 	if (!$f) {
@@ -95,6 +104,11 @@ foreach my $ref (keys %broken_ref) {
 		$f=qx(find . -iname $new) if ($new);
 	}
 
+	# Wild guess: seek for the same name on another place
+	if (!$f) {
+		$f = qx(find . -iname $new) if ($new);
+	}
+
 	my @find = split /\s+/, $f;
 
 	if (!$f) {
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
