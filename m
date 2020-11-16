Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA574C4742C
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 11:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74D7120853
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 11:23:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWVpv/oO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbgKPKUF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Nov 2020 05:20:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:53092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728829AbgKPKSa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 16 Nov 2020 05:18:30 -0500
Received: from mail.kernel.org (ip5f5ad5de.dynamic.kabel-deutschland.de [95.90.213.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4DC8B22370;
        Mon, 16 Nov 2020 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605521908;
        bh=UWikoMIHLn4xCDwo6/PTmbYT90JrBvUQtRfiBfDqPgA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cWVpv/oO8/FPD5Dwien+TQAbi7FJ50c4WB0RSFKJfdG1JuCW75eMHd8r3t9D84tsh
         Qe+2tH/a8EMkZ2HP3GQ8GHrw0E27niHr9bGxmEtsUXynm9P9G2H/ZcJrjfr8iCgGSv
         tLEaOPSCEUaT/WsbSTiFkeNm+Os+PNOGdVhRkNUc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kebac-00FwE1-2a; Mon, 16 Nov 2020 11:18:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/27] HSI: fix a kernel-doc markup
Date:   Mon, 16 Nov 2020 11:18:02 +0100
Message-Id: <e74a86396524f3d8371846882430e1586a2f4129.1605521731.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605521731.git.mchehab+huawei@kernel.org>
References: <cover.1605521731.git.mchehab+huawei@kernel.org>
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
 drivers/hsi/hsi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hsi/hsi_core.c b/drivers/hsi/hsi_core.c
index 47f0208aa7c3..c3fb5beb846e 100644
--- a/drivers/hsi/hsi_core.c
+++ b/drivers/hsi/hsi_core.c
@@ -335,41 +335,41 @@ static int hsi_remove_port(struct device *dev, void *data __maybe_unused)
 	device_for_each_child(dev, NULL, hsi_remove_client);
 	device_unregister(dev);
 
 	return 0;
 }
 
 static void hsi_controller_release(struct device *dev)
 {
 	struct hsi_controller *hsi = to_hsi_controller(dev);
 
 	kfree(hsi->port);
 	kfree(hsi);
 }
 
 static void hsi_port_release(struct device *dev)
 {
 	kfree(to_hsi_port(dev));
 }
 
 /**
- * hsi_unregister_port - Unregister an HSI port
+ * hsi_port_unregister_clients - Unregister an HSI port
  * @port: The HSI port to unregister
  */
 void hsi_port_unregister_clients(struct hsi_port *port)
 {
 	device_for_each_child(&port->device, NULL, hsi_remove_client);
 }
 EXPORT_SYMBOL_GPL(hsi_port_unregister_clients);
 
 /**
  * hsi_unregister_controller - Unregister an HSI controller
  * @hsi: The HSI controller to register
  */
 void hsi_unregister_controller(struct hsi_controller *hsi)
 {
 	device_for_each_child(&hsi->device, NULL, hsi_remove_port);
 	device_unregister(&hsi->device);
 }
 EXPORT_SYMBOL_GPL(hsi_unregister_controller);
 
 /**
-- 
2.28.0

