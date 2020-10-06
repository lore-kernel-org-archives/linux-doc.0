Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D06EC4363D
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 13:21:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E48222078E
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 13:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601990514;
	bh=EqfKWAQVNPOktMi714ODIttN8rNb+ZlSR96IH/A99vY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=MDPXcHbEXwXQKg7u9RCrQxjvdhpQhKjJWpe89WryOawntfIRUSuNPnO2S8+l5KSoT
	 rgBgeQp4p9PFav3MQBTBXdJguk0e5/+VpFx96NQmC75V4nKgyDC5yaii86UfhgCjVe
	 1elrqqOkDlulGyIHPXA6ayvOpe7p91M1GWozBG40=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgJFNVx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 09:21:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:57560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgJFNVx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 09:21:53 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 795AF2078E;
        Tue,  6 Oct 2020 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601990512;
        bh=EqfKWAQVNPOktMi714ODIttN8rNb+ZlSR96IH/A99vY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GjcVFmnnyZNhVDozl9IUjUEzfZea1CI+AKKkpi1s4p04mOi49oygAOnpGUwe10wPJ
         b1U+qsEunzCcoGvstToAnv8JIH18HWAWU6DH2cQp1W8HDrojEcUQE5H6wsZZ8PgQga
         naea445ssPaFt4VY/ViQkLi7tmD+bGKMEZ0WRwf4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPmuM-0018Kj-5o; Tue, 06 Oct 2020 15:21:34 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] docs: infrastructure.rst: exclude device_link_state from device.h
Date:   Tue,  6 Oct 2020 15:21:30 +0200
Message-Id: <cacdd9cb5094c33435a8663ee151f39ab8b5721d.1601990386.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601990386.git.mchehab+huawei@kernel.org>
References: <cover.1601990386.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is already documented at device_link.rst, causing this
warning, due to a broken cross-reference:

	.../Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
	Declaration is 'device_link_state'.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/infrastructure.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/infrastructure.rst b/Documentation/driver-api/infrastructure.rst
index e38d79be4e16..683bd460e222 100644
--- a/Documentation/driver-api/infrastructure.rst
+++ b/Documentation/driver-api/infrastructure.rst
@@ -6,6 +6,7 @@ The Basic Device Driver-Model Structures
 
 .. kernel-doc:: include/linux/device.h
    :internal:
+   :no-identifiers: device_link_state
 
 Device Drivers Base
 -------------------
-- 
2.26.2

