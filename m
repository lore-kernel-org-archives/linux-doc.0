Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5D9C43457
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:58:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8985920870
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590310;
	bh=EqfKWAQVNPOktMi714ODIttN8rNb+ZlSR96IH/A99vY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=DjVb80F81wvz9My3tJ/TIbDdJckzdxQJcfW+AFfnXF2ycQAYNLY2HITSSQbn6Aiwr
	 LEEUztFfF1lCIQozVsTChnm6WJO9gdTQu6ajiFSEn5ECKMW9Sfj3XgPPXPIzU11mCI
	 +iHaygrxhPxjiIHFziWunQS/aINhOdFmmagiBU1E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbgJML63 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:58:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:58150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727567AbgJMLyp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:45 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CEB72245D;
        Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=EqfKWAQVNPOktMi714ODIttN8rNb+ZlSR96IH/A99vY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VTKTekFFqerm2D+zwLZCUZZnrDfkTQVqLv4n0/nhhMfiiVNrQf6o0V3Fec/bxVss+
         TilSaBF/4BkS7qAbvPvrCB3B1TKh53NSb/ix5fm4J2WU+pD+zVP2mlj57X9DetP5VE
         8gKh0zmEMaFHpan4kQTAJ5RQ6jOZ9qviWxkBoDC4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt5-006CVY-51; Tue, 13 Oct 2020 13:54:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 51/80] docs: infrastructure.rst: exclude device_link_state from device.h
Date:   Tue, 13 Oct 2020 13:54:06 +0200
Message-Id: <c7d111535e0d7b428f7b2384598a6022a24b0845.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
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

