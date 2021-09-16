Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DF8C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:56:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA69D61212
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236351AbhIPJ5f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:57:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:58056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236311AbhIPJ4w (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:56:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD902613A9;
        Thu, 16 Sep 2021 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631786126;
        bh=9HM99bp42GrDo8Wh8WFpyjKqMlQVsdN9rnF+mvtZRYw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JXMWPRfl8clOecIpLQ+0or+fcVaWPbp+aeTNkhOFTQx1fWuZ+EzKw2SB5dSQAa3vg
         4FkSr9izc4DcZqH9SOh3M+FHJiX9ZQF74dS/RLcYOloLMsK4qK2z3qQn8Q+3yBjvDZ
         RGAdHFsV5rp0/V1Id7kSa7YM6OON59hT0fMsqoycqaKXYmsMeqsE7i582URYqz1Qig
         hnFFpVi3+/iqDCK0vfL0sELFhKDKNJlY0jtp8/J5yTrG0iTnuaXQKXIndfV+WXnKPM
         XSHklKvrAivyzkdbDXKPkGklxnliE+8JoaVqGXq0uHrVaKNztDzmKjxTC/BucvEae7
         GTrMx/sL5FdFA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQo72-001vUo-W3; Thu, 16 Sep 2021 11:55:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 23/23] MAINTAINERS: update ti,am654-hbmc.yaml reference
Date:   Thu, 16 Sep 2021 11:55:22 +0200
Message-Id: <86f95f891eb73a9b9865d9b3dd4338bc54aac54d.1631785820.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631785820.git.mchehab+huawei@kernel.org>
References: <cover.1631785820.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 6947ad674944 ("dt-bindings: mtd: Convert ti, am654-hbmc.txt to YAML schema")
renamed: Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
to: Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml.

Update its cross-reference accordingly.

Fixes: 6947ad674944 ("dt-bindings: mtd: Convert ti, am654-hbmc.txt to YAML schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 067ae42b53aa..8fed382b1935 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8725,7 +8725,7 @@ Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
 C:	irc://irc.oftc.net/mtd
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi/next
 F:	Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
-F:	Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
+F:	Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml
 F:	drivers/mtd/hyperbus/
 F:	include/linux/mtd/hyperbus.h
 
-- 
2.31.1

