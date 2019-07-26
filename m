Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIM_INVALID,DKIM_SIGNED,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6A3387D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 14:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbfGZOoa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 10:44:30 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58842 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728150AbfGZOo3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 10:44:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Resent-To:Resent-Message-ID:Subject:
        Resent-From:Resent-Date:Sender:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Sender:Resent-Cc:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=i7MBSJrUNlhCKGjlZAmu2GT/MGdBqxk/UuCTvQRDuxQ=; b=d45fuEvDVA7/CzFYbit7i9teGg
        26yKEJ1ynIZEF62cbZ+wwpTLnPxHMC740VOGxP2W5EuNUQydE1mf7ADf8wSl1QDaJV/V2d3ufNQMH
        tgMxYmiAWEP5KVYBrUMXB1eWiFXt/QqO7d/9Z5evNVg1MjU/zhi5HXSZTR9U61nHO33ETtr+l8w2b
        R8kHwyX91ykm7Fs66xMSr1JZgvAXHU2SlTuhI/V9cv3TEZ1uARoLNaFu0YQE4BrnuSSRJWz8TRg51
        hVRDc7oHMS57AiZwGSkdCz1B38q2xbvtpGciI3KkgL9DksphvbduSH+Kzy1AG+HC0SF/gbJrWn8f0
        bGmuaC2w==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hr1SP-00056y-1o; Fri, 26 Jul 2019 14:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i7MBSJrUNlhCKGjlZAmu2GT/MGdBqxk/UuCTvQRDuxQ=; b=FFNdAnoafBzSeha7Uz0RE7+FoQ
 W3tYbLobYlKaa8WNlMnlxy3sa3JExmjvVjGIxAYPFy0RhoXPVarQOycVQ6AOpw7nhQBPjl93Ky9rb
 6/250webKTtdx3WCPpqPlLYdVdI6LLcxQ6/dlHRPwq9de0JQnev0hr7RznOo8I1+Xc1l2usTNLl3s
 loA/fSFKqK5uZZWlIDlDXyt2jCLN+cuH1PVwzFGXrc57DN+as/OISZUAcAg9nRa+QiMiARGLJAApb
 /27jxx7mFOV00lxPnYRjZNzOKf+XKKmXb2csbxnclo0+13NAQbil2U2d2DYg5sBo8oxZ0LNw6nlSm
 6vdhGFZQ==;
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KLAqBJmn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C67822C7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mchehab@bombadil.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i7MBSJrUNlhCKGjlZAmu2GT/MGdBqxk/UuCTvQRDuxQ=; b=KLAqBJmnBxHephxZxodOWH0czB
 Wf8SgR6s1uwd508tDUhBanxGV4g29H5dl7wGCuYb6WVuMYJD9HFNnYU+GzsAYD8vmUSjG0ODNvtab
 ZhaeKxfyDcHrZ7C+XtEkQbrn6ll+5Abr0VXuRQbXnR2GLMel/qumsur4IMjarwCxsfUwuFM2izvVT
 9X8DoZqIkCOSSSSOZmfbM1MGHPm5T85nBCRE4yv8mDksJwHytoH73uu15Ra31d8sx4/mzTJXtidDb
 FXMqTsJv4+A636XQECl2PqcyzySoTYeblA+x/RgBu0GZy30KFBjv4ziwvYy8FVwLblnbVrGdiACre
 VbGEDPqQ==;
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org> (by way of
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>)
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date:   Fri, 26 Jul 2019 08:31:19 -0300
Message-Id: <5dd07ed5bd7da2f5709ac785e807c8ed3b0b232c.1564139914.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564139914.git.mchehab+samsung@kernel.org>
References: <cover.1564139914.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_123146_748785_E9AC6A62 
X-CRM114-Status: GOOD (  14.88  )
Subject: [PATCH v2 05/10] scripts/sphinx-pre-install: don't use LaTeX with
 CentOS 7
Apparently-To: <mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
To:     unlisted-recipients:; (no To-header on input)

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

