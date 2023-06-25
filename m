Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138CEEB64DC
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jun 2023 10:43:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbjFYKnK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Jun 2023 06:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbjFYKnJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Jun 2023 06:43:09 -0400
X-Greylist: delayed 571 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 25 Jun 2023 03:43:08 PDT
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93316E4F
        for <linux-doc@vger.kernel.org>; Sun, 25 Jun 2023 03:43:08 -0700 (PDT)
Received: from newone.lan (unknown [10.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id F307D160F0D;
        Sun, 25 Jun 2023 12:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1687689214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=vURs0dN7pFAtc/1rIOXHSQy4w1XN8ufieVIUbmodPfw=;
        b=yxge9f4ZK7Ht+yxKVbBuWKkSldUDdqgw9PHXsjHZCyMfpId5iad2mwKXTTisaUwbXaIcvJ
        Gov68vuREA+bzH8zOrjKHihNAm+NeGqZ5QX8TxQwKTY99JHgYSlXU6VAKLkOqOQqZxevuN
        YYUZovtX7CyOE5/GrPXRvfhnCHNL+RQ=
From:   David Heidelberg <david@ixit.cz>
To:     Jonathan Corbet <corbet@lwn.net>, David Heidelberg <david@ixit.cz>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: ACPI: fix typo in ssdt-overlays.rst
Date:   Sun, 25 Jun 2023 12:33:04 +0200
Message-Id: <20230625103305.115484-1-david@ixit.cz>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/admin-guide/acpi/ssdt-overlays.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/acpi/ssdt-overlays.rst b/Documentation/admin-guide/acpi/ssdt-overlays.rst
index b5fbf54dca19..5ea9f4a3b76e 100644
--- a/Documentation/admin-guide/acpi/ssdt-overlays.rst
+++ b/Documentation/admin-guide/acpi/ssdt-overlays.rst
@@ -103,7 +103,7 @@ allows a persistent, OS independent way of storing the user defined SSDTs. There
 is also work underway to implement EFI support for loading user defined SSDTs
 and using this method will make it easier to convert to the EFI loading
 mechanism when that will arrive. To enable it, the
-CONFIG_EFI_CUSTOM_SSDT_OVERLAYS shoyld be chosen to y.
+CONFIG_EFI_CUSTOM_SSDT_OVERLAYS should be chosen to y.
 
 In order to load SSDTs from an EFI variable the ``"efivar_ssdt=..."`` kernel
 command line parameter can be used (the name has a limitation of 16 characters).
-- 
2.39.2

