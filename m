Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E60C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 11:02:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3893233A1
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 11:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbhAMLCL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 06:02:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:38846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727458AbhAMLAv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 13 Jan 2021 06:00:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A76E7233EA;
        Wed, 13 Jan 2021 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610535569;
        bh=g4Wl+NXd9JRkaqcuGoSkCKjcsKr8o1tp1k7y5FbTC7o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dEC32SBff+rVbxryFBL7ItVWvFbaQACXkxMsOi2VW+fU6gRDVhxUGuKQPoDJWlJ69
         QYREsyAVlAOmxluIQoreadtXf9GyqvfzaHvEkzt/M6rFMygI81i8xPJBxDr32304+O
         A8xHip6DmT+m6n02sPybg5x4oR+VhHNyDRw05bP+e0dRGEbt9+tkn5TLqFP1pc6aGy
         B6mda9wvLLXj6QY7nV2ebpd+mesD3NMCx9URGlw0T1jwRaxF6FWnhyMyMSUbGWe24L
         aFET8KsS84HXbXt//cwwIRqV5QNFSTeF6rTM3w2HJ1SCVU2PZoHmxaiL3LUo85A3//
         fSUTWZIkRUStg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kzds7-00DpGV-J1; Wed, 13 Jan 2021 11:59:27 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 15/24] MAINTAINERS: update ti,dac7612.yaml reference
Date:   Wed, 13 Jan 2021 11:59:16 +0100
Message-Id: <cffd9dbec7523646912ec38d252e9dd5d9c860cb.1610535350.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610535349.git.mchehab+huawei@kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 8b74e06b0f4d ("dt-bindings:iio:dac:ti,dac7612 yaml conversion")
renamed: Documentation/devicetree/bindings/iio/dac/ti,dac7612.txt
to: Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml.

Update its cross-reference accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17640957fc93..9318147e0791 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17640,7 +17640,7 @@ TEXAS INSTRUMENTS' DAC7612 DAC DRIVER
 M:	Ricardo Ribalda <ribalda@kernel.org>
 L:	linux-iio@vger.kernel.org
 S:	Supported
-F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.txt
+F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
 F:	drivers/iio/dac/ti-dac7612.c
 
 TEXAS INSTRUMENTS DMA DRIVERS
-- 
2.29.2

