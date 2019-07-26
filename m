Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIM_INVALID,DKIM_SIGNED,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5CA3C7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 14:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfGZOoI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 10:44:08 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58820 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728150AbfGZOoI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 10:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Resent-To:Resent-Message-ID:Subject:
        Resent-From:Resent-Date:Sender:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Sender:Resent-Cc:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=x2yqbL/GCB4qt/1ZOmXmAZs70DddLHNZ+/ZNEpgEx/U=; b=OTq6YaBth90DbXpB9b0S51+lRL
        i1RAQdVvo3cd3FMpcRcfDqMoUX0exQBaiL+lbLGT5z98OB47tgwETLq3P51IjUDEjUv5daVQk1/8h
        7RQOoQS5ushMOZYLrGNRq5mPmt+W8yQHgnqGPmqspkUJ+X2sSyO9T2cI62z9wL2O0g+3H46NwYf0g
        sOX2Ktj20x+PiToQq8hvR3XtV2nuNclPcq3U87PmlXbu+iiAFJj2netuHXD4+JEvv6QNb0G4kUCfU
        TFZvfwz9xtZYQMGgeza2Bc6RHlhDDRZi9TJb0cni7GpJ9o+WTU2zb3PdAGxcL02MQ8DaG9FoB7ZD7
        C2vXTbnQ==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hr1S3-00055l-Ks; Fri, 26 Jul 2019 14:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x2yqbL/GCB4qt/1ZOmXmAZs70DddLHNZ+/ZNEpgEx/U=; b=OK8SpZOS4IGRL074Lib0U7tizs
 UTCJelSxyQfMYp0zm4ayTWwDFyBlBino//94PcLnKoKLCOAGX368iBpsqUdjBA17jfqUTwNCHsnzw
 KMYiXpo5wJjj7MOhipBmVbwGrvqD0zGJ3DdgCyjddMvI2//NYcr+OYV/Bz7x0mbPAGo42UODRIoqp
 C/UNpDBe6uzij3CVYIo6AhdMz7MEsrCGiblvdOJpwE9rD77HJBuAj0EeKbr1Kd7cK8WYeZ2tZpXsM
 GZIkqg9Yp4mTb1sD729pOg+4PSvPgC2/1cI+AGLdK/kxa6BcJoBb4GS613TvXPP6U/6i6Ul5DlxAF
 D2goY/1w==;
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pIKfYni9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1329A22BEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mchehab@bombadil.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x2yqbL/GCB4qt/1ZOmXmAZs70DddLHNZ+/ZNEpgEx/U=; b=pIKfYni9ZhoYMhkgeGfYuzpK0m
 HDok/OW0qS8rU8mRIycvB+cs6ZmR3Hz3tuK8jyE/NmzGKeFUXBkc/csQPJQSJRhxcv4x/l6xuueKF
 uJ0+DKaVvINjWar/MRbuWobLmJ7Q5Cm2iJFwXBeEhjvghwgUw532mJtjPTTGtyBNmPhN2gPJ+ExQc
 mOkm0lnMnLFg+U+FZFIZBwQxkLW+W8X/Dp8OR9C5xRRKnMQwZMHOGQjUFQyEZnV+X/mtT9/raOWYY
 1rbsQzt5aZkuvN+Tel7y21j+7miNTQnyxALFhUOvQtKizqhnkQVT3J8Z1pJV0l3Ga+7U3irbwx9VM
 9coDrpuQ==;
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org> (by way of
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>)
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date:   Fri, 26 Jul 2019 08:31:20 -0300
Message-Id: <02105d38fdc903f67d336a53397e2a28c3f99cef.1564139914.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564139914.git.mchehab+samsung@kernel.org>
References: <cover.1564139914.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_123143_090103_AFD2136D 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
Subject: [PATCH v2 06/10] scripts/sphinx-pre-install: fix latexmk
 dependencies
Apparently-To: <mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
To:     unlisted-recipients:; (no To-header on input)

The name of the package with carries latexmk is different
on two distros:

- On OpenSUSE, latexmk is packaged as "texlive-latexmk-bin"
- On Mageia, latexmk is packaged at "texlive-collection-basic"

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 scripts/sphinx-pre-install | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 33efadd6c0b6..8dc13fe95ffe 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -454,6 +454,8 @@ sub give_opensuse_hints()
 		"texlive-zapfding",
 	);
 
+	$map{"latexmk"} = "texlive-latexmk-bin";
+
 	check_rpm_missing(\@suse_tex_pkgs, 2) if ($pdf);
 	check_missing_tex(2) if ($pdf);
 	check_missing(\%map);
@@ -479,6 +481,8 @@ sub give_mageia_hints()
 		"texlive-fontsextra",
 	);
 
+	$map{"latexmk"} = "texlive-collection-basic";
+
 	check_rpm_missing(\@tex_pkgs, 2) if ($pdf);
 	check_missing(\%map);
 
-- 
2.21.0

