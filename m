Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900EAC43457
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A40A20878
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590386;
	bh=J74G5kQSa0vkKhBu17975/ADBNsJSxOJrcSKfNRKnzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=aIXQfL3ACcnarrG9ISS4q56QqQPgi8EJYAZB5+jqQ+i7Tw9SXA1zW4BLuAHQk7HD0
	 w1aLyEt1CcE+R0XB0cZCx99dYAn5NXbZ7Hpx1MdxbTEU9u8JPQAZ1a6zEAt6ubvUTv
	 nEJJW8iDD6l5Wqmg/dWfgRU2gt+qCfp25JNlEZ6Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbgJML7p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:59:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:57516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727485AbgJMLyn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:43 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6B86223EA;
        Tue, 13 Oct 2020 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=J74G5kQSa0vkKhBu17975/ADBNsJSxOJrcSKfNRKnzY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WeXInMEOMZRPCfSKOTHNV1jNR5U8Kg5A8ZRYu/+jklvXpaUAGb014su9vt5k+h0Z0
         KwgxVURLwr64PxgINi9001Z05l7PayO3NQoHEtIOXokBiwBRQa9AcMRxhAADdX1LHH
         5rPI7s9LFW9KbzoqNLzo+qsu6u5SemFwT5UkwD+Y=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt4-006CV7-TL; Tue, 13 Oct 2020 13:54:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 43/80] docs: infrastructure.rst: don't include firmware kernel-doc
Date:   Tue, 13 Oct 2020 13:53:58 +0200
Message-Id: <ea3381684003d71c5e8bdc492cd142c9470ff614.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Those are already documented at:

	Documentation/driver-api/firmware/request_firmware.rst

Including it twice is causing lots of warnings:

	./Documentation/driver-api/infrastructure.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/firmware/request_firmware'.
	Declaration is 'request_firmware'.
	./Documentation/driver-api/infrastructure.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/firmware/request_firmware'.
	Declaration is 'firmware_request_nowarn'.
	./Documentation/driver-api/infrastructure.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/firmware/request_firmware'.
	Declaration is 'request_firmware_direct'.
	./Documentation/driver-api/infrastructure.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/firmware/request_firmware'.
	Declaration is 'firmware_request_platform'.
	./Documentation/driver-api/infrastructure.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/firmware/request_firmware'.
	Declaration is 'firmware_request_cache'.
	./Documentation/driver-api/infrastructure.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/firmware/request_firmware'.
	Declaration is 'request_firmware_into_buf'.
	./Documentation/driver-api/infrastructure.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/firmware/request_firmware'.
	Declaration is 'request_firmware_nowait'.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/infrastructure.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/driver-api/infrastructure.rst b/Documentation/driver-api/infrastructure.rst
index 06d98c4526df..e38d79be4e16 100644
--- a/Documentation/driver-api/infrastructure.rst
+++ b/Documentation/driver-api/infrastructure.rst
@@ -28,9 +28,6 @@ Device Drivers Base
 .. kernel-doc:: drivers/base/node.c
    :internal:
 
-.. kernel-doc:: drivers/base/firmware_loader/main.c
-   :export:
-
 .. kernel-doc:: drivers/base/transport_class.c
    :export:
 
-- 
2.26.2

