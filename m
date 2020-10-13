Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EE3C4363A
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:57:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A676D214DB
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590244;
	bh=BXGjvj2YrbZhIVzM1s1K593e8KBsZNVDOudP8Rkf7D4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=LAnA2SyGSDEruklIq36mYpUSGxY5K2gtxBNTxBxJp+KwZO9GiHADuDJjQ6p6Pn711
	 keEGGw2GmjIs4vjDWHi3O3jMReYCImCKM3QtpbfqrfppNVVjdCzluMZpfvoQzkUoD5
	 ZZ4MUYX087RYWwfLl5wfAkb8UwH8mrj8Wv1DPZfM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbgJML5H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:57:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:58144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727648AbgJMLys (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:48 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B175224F4;
        Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=BXGjvj2YrbZhIVzM1s1K593e8KBsZNVDOudP8Rkf7D4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KfXGiyqeuV8n1rQGxQIn5BmfSNqvtgjfkPGTZbuOGgqotYVbtogTEFOqaA89PGMmJ
         23WYS1HSjhaRnyuZ3EX6e/pPVGE6e0ruMpdsPKsQrh4p1OkRK3cE7ERnsaYztXSAS+
         YV/9yqiDC+FTNTD+u5OcliFwtI8nG772HmBfAXso=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt5-006CVt-B3; Tue, 13 Oct 2020 13:54:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v6 57/80] net: appletalk: Kconfig: Fix docs location
Date:   Tue, 13 Oct 2020 13:54:12 +0200
Message-Id: <732aa8cc045a585a4f91d886195682f290e885a2.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The location of ltpc.rst changed. Update it at Kconfig.

Fixes: 4daedf7abb41 ("docs: networking: move AppleTalk / LocalTalk drivers to the hw driver section")

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/net/appletalk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/appletalk/Kconfig b/drivers/net/appletalk/Kconfig
index d4f22a2e5be4..43918398f0d3 100644
--- a/drivers/net/appletalk/Kconfig
+++ b/drivers/net/appletalk/Kconfig
@@ -48,7 +48,7 @@ config LTPC
 	  If you are in doubt, this card is the one with the 65C02 chip on it.
 	  You also need version 1.3.3 or later of the netatalk package.
 	  This driver is experimental, which means that it may not work.
-	  See the file <file:Documentation/networking/ltpc.rst>.
+	  See the file <file:Documentation/networking/device_drivers/appletalk/ltpc.rst>.
 
 config COPS
 	tristate "COPS LocalTalk PC support"
-- 
2.26.2

