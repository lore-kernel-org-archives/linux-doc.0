Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1A8C5517A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:37:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24DE522210
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603471066;
	bh=ZCsVet1GIWAxHh4n+biib5dB9ct8PGQp/kjUnG/ob5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=oETPuqG8epccnjrTu+PVcRdQ1torj+Xd+jZ92B5GCqhiCnNrUtVVpMaA2TmHQXRlb
	 URQb72BnBFhPeosqNpCD//qEKmw6V4AFY3WR0al7kPOr2HsTl+xQM1sATmaR4d2PiJ
	 snHWhBtJ/EEjk61+Zx454GLJ4hk10xkTtNA7c4Nc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751383AbgJWQho (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:37:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:33604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751834AbgJWQdt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:49 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4D0224691;
        Fri, 23 Oct 2020 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470828;
        bh=ZCsVet1GIWAxHh4n+biib5dB9ct8PGQp/kjUnG/ob5o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=an6rsEbiMmvxJJuoNQnp1W5/t3AkqUMtakGy0SROV+bgh5jhbE3WdCOQ3oUOStGDF
         IDABJyTsHnFqkekmg2mkDY51GYpBQaOFwOzFKj4dIfEMyFOjPT0WNwiCmyxQtYginh
         LZZQqb2+hpUpy4V2r7bXG97Bgrt2QvBP5fgo15Rk=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00f-002AwV-TL; Fri, 23 Oct 2020 18:33:45 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 26/56] regulator: fix a kernel-doc markup
Date:   Fri, 23 Oct 2020 18:33:13 +0200
Message-Id: <dffad16d4d6427d7d0fc89797e4126fe7c69d5de.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It seems that the function was renamed. kernel-doc markup
should follow it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/regulator/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index a4ffd71696da..79d00e7039d9 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -5529,7 +5529,7 @@ void regulator_set_drvdata(struct regulator *regulator, void *data)
 EXPORT_SYMBOL_GPL(regulator_set_drvdata);
 
 /**
- * regulator_get_id - get regulator ID
+ * rdev_get_id - get regulator ID
  * @rdev: regulator
  */
 int rdev_get_id(struct regulator_dev *rdev)
-- 
2.26.2

