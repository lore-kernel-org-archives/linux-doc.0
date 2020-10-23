Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C19C61DD8
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F80824640
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603470833;
	bh=u1Pqr2RIY1HqhTK0TpGLNOF+nTm1eTs38WLO0ZJ4+0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ichRU23aNR3ImoQFue27dfWIBrcct9iVvHMh6ZGo13CHvWFlvObeLngWMaFtZ0cQ1
	 p2k5tX7kMoHlhAj3FOf74VS5P8MUDJ9a0P5Z3BCfB5EXHt/aASqOOtL0fRv5v9ES+t
	 r8M1q5Q9xlh5VG802BfZkAckoWmIidYq4wxCz4tw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751884AbgJWQdv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:33:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:33314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751839AbgJWQdu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:50 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C0FE246A2;
        Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470828;
        bh=u1Pqr2RIY1HqhTK0TpGLNOF+nTm1eTs38WLO0ZJ4+0A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z/hkxDZYSLHRKJLOvLuXvqK3NtrZvdTmorxLGJrektvtGbFuOEQn34lI95TcpNxF+
         qlitjXCM4k77NEdYy1rMiXEf843CY27CIh0q217ZDc/pDLaPDyt39lauLEqIvXUaYA
         MOqQ4FkJOyYuKxsbU2LOpLuoptmFSr+tpEXx9O/k=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00g-002Awc-0B; Fri, 23 Oct 2020 18:33:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 28/56] slimbus: fix a kernel-doc markup
Date:   Fri, 23 Oct 2020 18:33:15 +0200
Message-Id: <7a581d05aec5ebbd02be27513de1c5e5a25b7922.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix the name of the enum on its kernel-doc markup:
	enum slim_ch_aux_fmt -> enum slim_ch_aux_bit_fmt

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/slimbus/slimbus.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index c73035915f1d..00a7f112574b 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -244,7 +244,7 @@ enum slim_ch_data_fmt {
 };
 
 /**
- * enum slim_ch_aux_fmt: SLIMbus channel Aux Field format IDs according to
+ * enum slim_ch_aux_bit_fmt: SLIMbus channel Aux Field format IDs according to
  *	Table 63 of SLIMbus Spec 2.0
  * @SLIM_CH_AUX_FMT_NOT_APPLICABLE: Undefined
  * @SLIM_CH_AUX_FMT_ZCUV_TUNNEL_IEC60958: ZCUV for tunneling IEC60958
-- 
2.26.2

