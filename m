Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64EAC388F9
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:37:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CA98208C3
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603471058;
	bh=yMRNzlACHqKUUTJZngT9EQP1KSTd8+oU2SNtS1l01+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=lhKQf9qVBzZ2Fv334pJhhl0B7wx8ZOmBwOKLYbQoc79v7n/zrBK7nlkgvqT9Z+89V
	 /gI3haBw0QcosFiYLmJM1tMLLG+Kt80c4T49lk1ItBiz7fub4mLgMY/FpU/DG5yKw6
	 YhjlqxwChTyMCdMkIX7t1BJfR8qJhQL4Od0m3kh4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752206AbgJWQhY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:37:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:33600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751833AbgJWQdt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:49 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D30872465E;
        Fri, 23 Oct 2020 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470828;
        bh=yMRNzlACHqKUUTJZngT9EQP1KSTd8+oU2SNtS1l01+o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s7STmtCcTiAEJQ3gifzFiVuxMlcqVUAkxDebbVagBjORv+aw0A55NFkTPyqwiC+9S
         VuixwH1MAcJkb0Fthgwb5+eu1NXliQnTw+UQyMWejtp0S4JZRqVsVDW3zSjnnHtLxW
         0m3SPSugqdoVrn8hiQJtkqremXCdC1UDeYHwE++M=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00f-002AwR-RV; Fri, 23 Oct 2020 18:33:45 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Alexandre Bounine <alex.bou9@gmail.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 25/56] rapidio: fix kernel-doc a markup
Date:   Fri, 23 Oct 2020 18:33:12 +0200
Message-Id: <3d8661828870f884115e891c25d470cd4e3621b9.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Probaly this was due to a cut and paste issue.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/rapidio/rio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index 606986c5ba2c..16b59b472b3d 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -749,7 +749,7 @@ int rio_map_outb_region(struct rio_mport *mport, u16 destid, u64 rbase,
 EXPORT_SYMBOL_GPL(rio_map_outb_region);
 
 /**
- * rio_unmap_inb_region -- Unmap the inbound memory region
+ * rio_unmap_outb_region -- Unmap the inbound memory region
  * @mport: Master port
  * @destid: destination id mapping points to
  * @rstart: RIO base address window translates to
-- 
2.26.2

