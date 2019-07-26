Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIM_INVALID,DKIM_SIGNED,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 289897D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 14:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbfGZOnc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 10:43:32 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58764 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfGZOnb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 10:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Resent-To:Resent-Message-ID:Subject:
        Resent-From:Resent-Date:Sender:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Sender:Resent-Cc:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=E27+dMUle7zU70UZTJBvQbjZ+QD96HjO9TYX+WMTsMo=; b=BEz1vlwngoqWgdjfmN7ERKHt06
        khjdrVdkCTW7GBVWkaEdSPR1vZmigxkpSYsV4IP2Yhk/0zvrgj9fwlBuuKd0BxBwcIWq8ORpzd8mO
        c75s4UV5AFbWM8tgH0uIPuFripGkTDja1osp/Dn7CcDJSBeE8/k9/BpyIyE7K2lWRyqq4cbBqLeRY
        2AeDMCjAoJ6xx9N4eyrmWF2Wxj7OYWcejt2BW9RbZbkgE59HbfwrYspnjOAB4wQO2cV/B2Cym5Gqo
        OnaGMs8fJIxh3NC7cnq3k0YzqABTB245DFkF7CXR2C8NCH8dRt94DkA6o0KxsBiNMppJoiy0OOKTw
        2YNYnF7w==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hr1RT-00053Q-91; Fri, 26 Jul 2019 14:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E27+dMUle7zU70UZTJBvQbjZ+QD96HjO9TYX+WMTsMo=; b=Dj5MAG5Cf0638GlZsRGwt7vNSQ
 bFsM13LupWs3mVPqTKxRFITl2HZFthThYLda4kFT7wo2z/Iqvn0V+1m9RmnZfplH80Qy6uHI9T/DB
 u7+OKVvPFWvfu9VZNxnPmw7POpJiubEmDgZojbrC43wGwLwd42Qg/XputuLKojrIAPHx+WFfzmIaO
 knyr4o44JOZmWUNh4LCw6Fgtv4Zrf+lHhMCrMiN/nyGth8+hCtC6azCQL+XnnIsOZhd2OG6NbyMlH
 kt7M7ZDF4gzALtRHjuyW0aTYaiH4taykvukJYFntL3CY5gfzygA1BhP1xPQ6fk9LpiX+BDeBh6rWT
 6NilfnBA==;
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="crpBbNO7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C28B216C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mchehab@bombadil.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E27+dMUle7zU70UZTJBvQbjZ+QD96HjO9TYX+WMTsMo=; b=crpBbNO7DKxJ7bBnuSF493GvyT
 Q4PvnSBkfLlCcvjFuTcw6u2GaSIIkBmChFHYKtpLjhPwKuTLVtjlF/CsEUSGRfbcE34QqjxdAjbFT
 +TTDLtvMo4S6B8pwkCt2DcUlrppP7OpiHH8sRP4klKL4M+to5AqVvmClBl21YR8PJXZTy8qgSmcks
 6BRmk/h0l6cerXwa14O2wdsLyvuOWwmxoSF6TQnbbhsJnkcBoAtyemL3gINTK4vUQqKsQUJ4LNuha
 tob+dmmXNgKGxRsTTHV7ZErmMvJJ05aglZxnuDqNjNocZ2dCeZa/0ywPviC1n4mLn7y0yiTy5rTXK
 q6gnbCeA==;
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org> (by way of
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>)
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date:   Fri, 26 Jul 2019 08:31:22 -0300
Message-Id: <4faad781a774fdf6a0a12620c7efe85e53732bb7.1564139914.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564139914.git.mchehab+samsung@kernel.org>
References: <cover.1564139914.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_123146_735810_75348234 
X-CRM114-Status: GOOD (  11.09  )
Subject: [PATCH v2 08/10] scripts/sphinx-pre-install: seek for Noto CJK
 fonts for pdf output
Apparently-To: <mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
To:     unlisted-recipients:; (no To-header on input)

The translations guide need Noto CJK fonts. So, add a logic that
would suggest its install for distros.

It also fix a few other issues while testing the script
with several distributions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 scripts/sphinx-pre-install | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 0a5c83aa5f44..3b638c0e1a4f 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -345,6 +345,9 @@ sub give_debian_hints()
 	if ($pdf) {
 		check_missing_file("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
 				   "fonts-dejavu", 2);
+
+		check_missing_file("/usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc",
+				   "fonts-noto-cjk", 2);
 	}
 
 	check_program("dvipng", 2) if ($pdf);
@@ -374,6 +377,7 @@ sub give_redhat_hints()
 	my @fedora_tex_pkgs = (
 		"texlive-collection-fontsrecommended",
 		"texlive-collection-latex",
+		"texlive-xecjk",
 		"dejavu-sans-fonts",
 		"dejavu-serif-fonts",
 		"dejavu-sans-mono-fonts",
@@ -408,6 +412,11 @@ sub give_redhat_hints()
 		$pdf = 0;
 	}
 
+	if ($pdf) {
+		check_missing_file("/usr/share/fonts/google-noto-cjk/NotoSansCJK-Regular.ttc",
+				   "google-noto-sans-cjk-ttc-fonts", 2);
+	}
+
 	check_rpm_missing(\@fedora26_opt_pkgs, 2) if ($pdf && !$old);
 	check_rpm_missing(\@fedora_tex_pkgs, 2) if ($pdf);
 	check_missing_tex(2) if ($pdf);
@@ -456,6 +465,11 @@ sub give_opensuse_hints()
 
 	$map{"latexmk"} = "texlive-latexmk-bin";
 
+	# FIXME: add support for installing CJK fonts
+	#
+	# I tried hard, but was unable to find a way to install
+	# "Noto Sans CJK SC" on openSUSE
+
 	check_rpm_missing(\@suse_tex_pkgs, 2) if ($pdf);
 	check_missing_tex(2) if ($pdf);
 	check_missing(\%map);
@@ -483,6 +497,11 @@ sub give_mageia_hints()
 
 	$map{"latexmk"} = "texlive-collection-basic";
 
+	if ($pdf) {
+		check_missing_file("/usr/share/fonts/google-noto-cjk/NotoSansCJK-Regular.ttc",
+				   "google-noto-sans-cjk-ttc-fonts", 2);
+	}
+
 	check_rpm_missing(\@tex_pkgs, 2) if ($pdf);
 	check_missing(\%map);
 
@@ -508,6 +527,11 @@ sub give_arch_linux_hints()
 	);
 	check_pacman_missing(\@archlinux_tex_pkgs, 2) if ($pdf);
 
+	if ($pdf) {
+		check_missing_file("/usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc",
+				   "noto-fonts-cjk", 2);
+	}
+
 	check_missing(\%map);
 
 	return if (!$need && !$optional);
@@ -528,6 +552,11 @@ sub give_gentoo_hints()
 	check_missing_file("/usr/share/fonts/dejavu/DejaVuSans.ttf",
 			   "media-fonts/dejavu", 2) if ($pdf);
 
+	if ($pdf) {
+		check_missing_file("/usr/share/fonts/noto-cjk/NotoSansCJKsc-Regular.otf",
+				   "media-fonts/noto-cjk", 2);
+	}
+
 	check_missing(\%map);
 
 	return if (!$need && !$optional);
-- 
2.21.0

