Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB673C388F9
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:35:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A00F4241A4
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603470954;
	bh=rRJb3vXySurhGMEM1BHGpbCPhoUmwH5PiCAUJ7B2PjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=2RB13+pfmomRBmL0J1KY+JufMZBaUMwJwKC2ohoZmycyakflsfszxBZ5EUR2VDYlJ
	 gfBe2fSTw6opK+JYJSkegQ7XxiYCuVScVBazQ/l+UUdkSgPlGOiTyE9dj7Kv1Be+6x
	 GZ5Ph0yiVH+kXoHvHVNZd6cNAU9OP4ovzsI8GpEQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751090AbgJWQfx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:35:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:33228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751861AbgJWQdu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:50 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A76EF246D1;
        Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470828;
        bh=rRJb3vXySurhGMEM1BHGpbCPhoUmwH5PiCAUJ7B2PjY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=btK72J3g/GgZ2E/3PF+YWY96+jok5e/0A3tkbnPQ1F2fUqhK5P5tiwk64AN90KO1x
         630Amh/UGGgQcrCTe7Ls320LZ0MgyI7gqY82TK3/Nr0okb6pTitWqA5Anvl4q5nuIv
         qI6ja+xgvTN8VR3XdTIqXcfNZN6DVDfUT5klBAR0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00g-002Axg-LF; Fri, 23 Oct 2020 18:33:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 50/56] w1: fix a kernel-doc markup
Date:   Fri, 23 Oct 2020 18:33:37 +0200
Message-Id: <434cdc1c46f1c49bfa651b39e1b406c7166cd5d0.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A function has a different name between their prototype
and its kernel-doc markup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/linux/w1.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/w1.h b/include/linux/w1.h
index 949d3b10e531..9a2a0ef39018 100644
--- a/include/linux/w1.h
+++ b/include/linux/w1.h
@@ -280,7 +280,7 @@ int w1_register_family(struct w1_family *family);
 void w1_unregister_family(struct w1_family *family);
 
 /**
- * module_w1_driver() - Helper macro for registering a 1-Wire families
+ * module_w1_family() - Helper macro for registering a 1-Wire families
  * @__w1_family: w1_family struct
  *
  * Helper macro for 1-Wire families which do not do anything special in module
-- 
2.26.2

