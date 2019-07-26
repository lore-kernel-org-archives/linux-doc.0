Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIM_INVALID,DKIM_SIGNED,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8133B7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 14:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbfGZOnq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 10:43:46 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58786 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfGZOnp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 10:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Resent-To:Resent-Message-ID:Subject:
        Resent-From:Resent-Date:Sender:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Sender:Resent-Cc:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jFyzo3As5CrICxDhs7tl/BXq0/acefqHr/iuBUuENY8=; b=HhZr6kyAkGHQZZQNb/9lNGvKZz
        LdtzGwu6z0Y/zIoX0OPCZN4YkhjsDb/Bf74N+q2ysZUQVsmH5iZQtQQIMn7QoCJckChrqiLpA4f5F
        qMRgrTbqUMLiS0fcDxol67DHq9ahqyHYbpdiFk8neRz2IVnuvL3oNeNyQ+FQsQGPa90kgrghvgiAF
        7qqg3nHJ+XsQRMGKiJW4hAuifWklYRWl5HeJ4qib17L8NENnOdgpfNlNTvPi5GNwvZFaTLonYGNzG
        2/Cqv4wsoG63rEq+Qpqv48Z5vtqd8qkm3adpCv4QFL3rZ3ouGTcHhpqEJRNqsi78pjfN9GxLb0waT
        ePc+EEUw==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hr1Rh-00054h-8G; Fri, 26 Jul 2019 14:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jFyzo3As5CrICxDhs7tl/BXq0/acefqHr/iuBUuENY8=; b=NN5e4g4AxUSCDrSL0Jncan4nCa
 mgc/rLFEgYlnP+Wd6Ighawb65Cb6puanYGflCzFY/YeO0otodXFBppt7jkCE5YNDfd3IZQGFNYhOU
 mkcBzhlLIpFkqM2GMNhaI8G5w4cqapBfeg6ubwT0jtsVza0am8APPYCnLula4sP6K9YBfAUBkT8xw
 YnpiL//74fL9Jt19py6lvTRfElOKmcsq6AGRRfwxQmCRTPQ8SE1iIeM+UZE1VIT1s9eyX2UXHeKVN
 GYD57hmY3fGV4ApuK53e8aYCnZg+s44+MLVSHk4qqhY/1YmGM/7NsqkgON5bd2blvkgWZdIBCpqYf
 F2HMr5tg==;
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mRsPpJZ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C8FC22CB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mchehab@bombadil.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jFyzo3As5CrICxDhs7tl/BXq0/acefqHr/iuBUuENY8=; b=mRsPpJZ9Qc9N5L66zHUa/XMQv1
 abnz2iFtpWf+IbHcvYuiz4ta2EUaL0lB+1hdi76vakUW7yEWpfioG8M2drbbY95hh7aOttF7YXoHV
 h6h0nXh+RLEkTVBx+4sUlEYEG3rc2u9weNgyxm6bH10CnG8+99ZhVepAvQxYVe7qLKv2R0+22kOGh
 2KqQfew9yWans3L5/t1HPXo0jvK1CbE9fBoJBq7J2BQuqttcw7zq0vdhMxd+rsRJu06G9AfZbqIlw
 TgVlHQ9YLH5oEDfEG/CuESkZGmlHg6nLTr8AptZhVIdmmhy7PP18JuQtWTkrpFqjrDar9d9uGdefT
 K7F0Uqug==;
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org> (by way of
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>)
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date:   Fri, 26 Jul 2019 08:31:21 -0300
Message-Id: <05ee9298adfcee760ec42ac11e35fda1093f1792.1564139914.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564139914.git.mchehab+samsung@kernel.org>
References: <cover.1564139914.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_123146_712735_38E34BAF 
X-CRM114-Status: GOOD (  10.78  )
Subject: [PATCH v2 07/10] scripts/sphinx-pre-install: cleanup Gentoo checks
Apparently-To: <mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
To:     unlisted-recipients:; (no To-header on input)

On Gentoo, the portage changes for ImageMagick to work are
always suggested, even if already applied. While the two
extra commands should be harmless, add a check to avoid
reporting it without need.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 scripts/sphinx-pre-install | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 8dc13fe95ffe..0a5c83aa5f44 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -533,8 +533,19 @@ sub give_gentoo_hints()
 	return if (!$need && !$optional);
 
 	printf("You should run:\n\n");
-	printf("\tsudo su -c 'echo \"media-gfx/imagemagick svg png\" > /etc/portage/package.use/imagemagick'\n");
-	printf("\tsudo su -c 'echo \"media-gfx/graphviz cairo pdf\" > /etc/portage/package.use/graphviz'\n");
+
+	my $imagemagick = "media-gfx/imagemagick svg png";
+	my $cairo = "media-gfx/graphviz cairo pdf";
+	my $portage_imagemagick = "/etc/portage/package.use/imagemagick";
+	my $portage_cairo = "/etc/portage/package.use/graphviz";
+
+	if (qx(cat $portage_imagemagick) ne "$imagemagick\n") {
+		printf("\tsudo su -c 'echo \"$imagemagick\" > $portage_imagemagick'\n")
+	}
+	if (qx(cat $portage_cairo) ne  "$cairo\n") {
+		printf("\tsudo su -c 'echo \"$cairo\" > $portage_cairo'\n");
+	}
+
 	printf("\tsudo emerge --ask $install\n");
 
 }
-- 
2.21.0

