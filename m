Return-Path: <SRS0=H0Zm=CE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E00C433DF
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 10:47:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 358552080C
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598438864;
	bh=BXGjvj2YrbZhIVzM1s1K593e8KBsZNVDOudP8Rkf7D4=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=g0CrsCHNVlOAdddG4HenvL/9PuDnitcT9oD6E0f5qY6kxpLl5JYDDxIhkAXn81DhA
	 M4oR8mnaql+Gnvm9EDzPTzznFz2ADvZHgnISsYlAITUwSxb7SJcQyvzDPEavBfDqDE
	 gHDZGCTo1NNQeis+ui+3wJKWAGf8nJfzA4swnGiI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728664AbgHZKrm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Aug 2020 06:47:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:35900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728659AbgHZKri (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Aug 2020 06:47:38 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3AE84206EB;
        Wed, 26 Aug 2020 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598438857;
        bh=BXGjvj2YrbZhIVzM1s1K593e8KBsZNVDOudP8Rkf7D4=;
        h=From:To:Cc:Subject:Date:From;
        b=GROkWjWSPv5nNmsZ+7TO8qBXYCpdh4x2eaWbJYAS1X7mX3o0GaOvL81W1yGkArcT5
         6vfkyvjMsJ7G+IkTIVv8Rn7WFa6lWIJrgQ5ZY4uMOtisIDt3yobgMlVCXqrlHRIhwz
         +QH5bWpegjCDEribF+L+TWEaLFiwlrlWR3bAcrgw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kAsxr-002EHW-7s; Wed, 26 Aug 2020 12:47:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] net: appletalk: Kconfig: Fix docs location
Date:   Wed, 26 Aug 2020 12:47:34 +0200
Message-Id: <20200826104734.531509-1-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
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

