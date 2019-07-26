Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D046C7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 14:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387467AbfGZOnS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 10:43:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58752 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387416AbfGZOnS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 10:43:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=kcy4lQ5H2m2VueCeLuPBdxegYaaeC0v7B9CIScWM+1k=; b=rTMcolfmWqGxo/J+KbglakoQ5
        ri5a0oOF6YAU9NfVpnizFvdIUEAkk1aVN6+i3nkK/U6SBEsXhW8fXMq/OgeYv3a3SEQ+BhijtKEX+
        M9vSWN9n7np2YBV/GkGXziqn3Vr7xVmX6JmndhI8J/rWrUPb6Z7mQk3hxvuk49dB6XzpO6IJsBOF+
        sABcaDC98lI2SY+iCBmJuD8RO9PnBLoZqqv7e3v49l7MXAE7o6kpS9Jcj+u6AFFXfpJYlRdQ5GyOT
        OUgyLEhJDFLtcatzJn/kinyBWRVfhMup84ohe8qTR2EuNOfORi5i4Gce+OD/O/cY7ANbiTuTsdVtp
        TlxQA28BQ==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hr1RF-00052s-Iy; Fri, 26 Jul 2019 14:43:18 +0000
Date:   Fri, 26 Jul 2019 11:43:14 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Fw: [PATCH v2 05/10] scripts/sphinx-pre-install: don't use LaTeX
 with CentOS 7
Message-ID: <20190726114314.4751e29e@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Forwarded message:

Date: Fri, 26 Jul 2019 08:31:19 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH v2 05/10] scripts/sphinx-pre-install: don't use LaTeX with CentOS 7


There aren't enough texlive packages for LaTeX-based builds
to work on CentOS/RHEL <= 7.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 scripts/sphinx-pre-install | 68 ++++++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 18 deletions(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 101ddd00bf02..33efadd6c0b6 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -83,6 +83,17 @@ sub check_missing(%)
 	foreach my $prog (sort keys %missing) {
 		my $is_optional = $missing{$prog};
 
+		# At least on some LTS distros like CentOS 7, texlive doesn't
+		# provide all packages we need. When such distros are
+		# detected, we have to disable PDF output.
+		#
+		# So, we need to ignore the packages that distros would
+		# need for LaTeX to work
+		if ($is_optional == 2 && !$pdf) {
+			$optional--;
+			next;
+		}
+
 		if ($is_optional) {
 			print "Warning: better to also install \"$prog\".\n";
 		} else {
@@ -333,10 +344,10 @@ sub give_debian_hints()
 
 	if ($pdf) {
 		check_missing_file("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
-				   "fonts-dejavu", 1);
+				   "fonts-dejavu", 2);
 	}
 
-	check_program("dvipng", 1) if ($pdf);
+	check_program("dvipng", 2) if ($pdf);
 	check_missing(\%map);
 
 	return if (!$need && !$optional);
@@ -371,22 +382,40 @@ sub give_redhat_hints()
 	#
 	# Checks valid for RHEL/CentOS version 7.x.
 	#
+	my $old = 0;
+	my $rel;
+	$rel = $1 if ($system_release =~ /release\s+(\d+)/);
+
 	if (!($system_release =~ /Fedora/)) {
 		$map{"virtualenv"} = "python-virtualenv";
-	}
 
-	my $release;
+		if ($rel && $rel < 8) {
+			$old = 1;
+			$pdf = 0;
 
-	$release = $1 if ($system_release =~ /Fedora\s+release\s+(\d+)/);
+			printf("Note: texlive packages on RHEL/CENTOS <= 7 are incomplete. Can't support PDF output\n");
+			printf("If you want to build PDF, please read:\n");
+			printf("\thttps://www.systutorials.com/241660/how-to-install-tex-live-on-centos-7-linux/\n");
+		}
+	} else {
+		if ($rel && $rel < 26) {
+			$old = 1;
+		}
+	}
+	if (!$rel) {
+		printf("Couldn't identify release number\n");
+		$old = 1;
+		$pdf = 0;
+	}
 
-	check_rpm_missing(\@fedora26_opt_pkgs, 1) if ($pdf && $release >= 26);
-	check_rpm_missing(\@fedora_tex_pkgs, 1) if ($pdf);
-	check_missing_tex(1) if ($pdf);
+	check_rpm_missing(\@fedora26_opt_pkgs, 2) if ($pdf && !$old);
+	check_rpm_missing(\@fedora_tex_pkgs, 2) if ($pdf);
+	check_missing_tex(2) if ($pdf);
 	check_missing(\%map);
 
 	return if (!$need && !$optional);
 
-	if ($release >= 18) {
+	if (!$old) {
 		# dnf, for Fedora 18+
 		printf("You should run:\n\n\tsudo dnf install -y $install\n");
 	} else {
@@ -425,8 +454,8 @@ sub give_opensuse_hints()
 		"texlive-zapfding",
 	);
 
-	check_rpm_missing(\@suse_tex_pkgs, 1) if ($pdf);
-	check_missing_tex(1) if ($pdf);
+	check_rpm_missing(\@suse_tex_pkgs, 2) if ($pdf);
+	check_missing_tex(2) if ($pdf);
 	check_missing(\%map);
 
 	return if (!$need && !$optional);
@@ -450,7 +479,7 @@ sub give_mageia_hints()
 		"texlive-fontsextra",
 	);
 
-	check_rpm_missing(\@tex_pkgs, 1) if ($pdf);
+	check_rpm_missing(\@tex_pkgs, 2) if ($pdf);
 	check_missing(\%map);
 
 	return if (!$need && !$optional);
@@ -473,7 +502,8 @@ sub give_arch_linux_hints()
 		"texlive-latexextra",
 		"ttf-dejavu",
 	);
-	check_pacman_missing(\@archlinux_tex_pkgs, 1) if ($pdf);
+	check_pacman_missing(\@archlinux_tex_pkgs, 2) if ($pdf);
+
 	check_missing(\%map);
 
 	return if (!$need && !$optional);
@@ -492,7 +522,7 @@ sub give_gentoo_hints()
 	);
 
 	check_missing_file("/usr/share/fonts/dejavu/DejaVuSans.ttf",
-			   "media-fonts/dejavu", 1) if ($pdf);
+			   "media-fonts/dejavu", 2) if ($pdf);
 
 	check_missing(\%map);
 
@@ -560,7 +590,7 @@ sub check_distros()
 	my %map = (
 		"sphinx-build" => "sphinx"
 	);
-	check_missing_tex(1) if ($pdf);
+	check_missing_tex(2) if ($pdf);
 	check_missing(\%map);
 	print "I don't know distro $system_release.\n";
 	print "So, I can't provide you a hint with the install procedure.\n";
@@ -589,11 +619,13 @@ sub check_needs()
 	check_program("make", 0);
 	check_program("gcc", 0);
 	check_python_module("sphinx_rtd_theme", 1) if (!$virtualenv);
-	check_program("xelatex", 1) if ($pdf);
 	check_program("dot", 1);
 	check_program("convert", 1);
-	check_program("rsvg-convert", 1) if ($pdf);
-	check_program("latexmk", 1) if ($pdf);
+
+	# Extra PDF files - should use 2 for is_optional
+	check_program("xelatex", 2) if ($pdf);
+	check_program("rsvg-convert", 2) if ($pdf);
+	check_program("latexmk", 2) if ($pdf);
 
 	check_distros();
 
-- 
2.21.0




Thanks,
Mauro
