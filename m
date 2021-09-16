Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B10BC4332F
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:14:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7775B6120F
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:14:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236486AbhIPJQN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:16:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:40940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235609AbhIPJPm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:15:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B522561373;
        Thu, 16 Sep 2021 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631783661;
        bh=I0zJgrJ074MHHhu9mtPme4IHH94Arp6S89AUJJj772g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a0b5h8l1FA46jf224AFwJrrrv5TH7oiVc5LT7Cxl6mXtl/Iq0NcuJCK1A67SYmLRV
         nNYMKp1cTYv4rgDt7w7KZxBskHGcxkSu96tITLrksxhcgK1FYw31zoRgx4MNwKOfyp
         FgSyR7fSN5/Ed3vortnD2k33z/rkl6AxW0Um6N2Kf7g3Z8wcnjv+RKpBTJ+1Tqso6P
         vxISo56AJrZYtn0PAH/rXaDP3p6TCu3i8PfdWaL/kFgR509IXLbOeCQH3rQ8fW47V8
         oBYXOCkh6VxHxLJlS+qaTboopeFThtSNzyfPD2gPaycjyA4yz8jMUiqnNiTxNtbh2v
         oQ0tQd4RHrNAA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQnTH-001sLx-W0; Thu, 16 Sep 2021 11:14:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 19/24] MAINTAINERS: update intel,ixp46x-rng.yaml reference
Date:   Thu, 16 Sep 2021 11:14:12 +0200
Message-Id: <36ee194d1607df649e8bbed47eca37333818fa56.1631783482.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631783482.git.mchehab+huawei@kernel.org>
References: <cover.1631783482.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The file name: Documentation/devicetree/bindings/display/intel,ixp46x-rng.yaml
should be, instead: Documentation/devicetree/bindings/rng/intel,ixp46x-rng.yaml.

Update its cross-reference accordingly.

Fixes: cca061b04c0d ("hw_random: ixp4xx: Add DT bindings")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bb9daad21935..da9658e24496 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9509,7 +9509,7 @@ F:	include/linux/soc/ixp4xx/qmgr.h
 INTEL IXP4XX RANDOM NUMBER GENERATOR SUPPORT
 M:	Deepak Saxena <dsaxena@plexity.net>
 S:	Maintained
-F:	Documentation/devicetree/bindings/display/intel,ixp46x-rng.yaml
+F:	Documentation/devicetree/bindings/rng/intel,ixp46x-rng.yaml
 F:	drivers/char/hw_random/ixp4xx-rng.c
 
 INTEL KEEM BAY DRM DRIVER
-- 
2.31.1

