Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172C8C63704
	for <linux-doc@archiver.kernel.org>; Tue,  6 Dec 2022 20:07:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiLFUHx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Dec 2022 15:07:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiLFUHv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Dec 2022 15:07:51 -0500
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5736E12745;
        Tue,  6 Dec 2022 12:07:49 -0800 (PST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id 5D69C27AA;
        Tue,  6 Dec 2022 21:07:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1670357267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jccYpGhRy5gogBWLLHj7E2HN2uMWlo2JC7ssSIFLQtc=;
        b=KBD7cnd9QOSO/57qGehuqF4Cc+qXERoCaSlpkkNU8U3/56TH9CVIMhSNXn3X/SW+LPlt1d
        YKPbpeU47AaBZvH/Bee9NMJzI7zD/is71U+4YMLqrc2QOzYLkU1eWWBXIrmNTzI5nspuKI
        vH89q/FjWOSL8MJv8i/mMl/gqmCT9YcHJ4uK/Ufc6LzTH+84QSusG4Pqv0tYnjJ0a88Nqf
        O8XH7QzR8imcMpibVswnbano7GLtLUqSHkto0cvsRD0npwvxlyzrE6eCq/pFKCdUYKOX2t
        9PJ9Y872A6dlBbDzaefu4hiqbZZ5K1febkNV0iFcTK7QD6L86PYiChquMcr1Uw==
From:   Michael Walle <michael@walle.cc>
To:     Jonathan Corbet <corbet@lwn.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Walle <michael@walle.cc>,
        Dan Carpenter <error27@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 03/21] of: property: make #.*-cells optional for simple props
Date:   Tue,  6 Dec 2022 21:07:22 +0100
Message-Id: <20221206200740.3567551-4-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221206200740.3567551-1-michael@walle.cc>
References: <20221206200740.3567551-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sometimes, future bindings for phandles will get additional arguments.
Thus the target node of the phandle will need a new #.*-cells property.
To be backwards compatible, this needs to be optional.

Prepare the DEFINE_SIMPLE_PROPS() to handle the cells name as optional.

Signed-off-by: Michael Walle <michael@walle.cc>
Tested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
changes since v4:
 - none

changes since v3:
 - new patch

 drivers/of/property.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 134cfc980b70..3043ca7735db 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1256,8 +1256,8 @@ static struct device_node *parse_suffix_prop_cells(struct device_node *np,
 	if (strcmp_suffix(prop_name, suffix))
 		return NULL;
 
-	if (of_parse_phandle_with_args(np, prop_name, cells_name, index,
-				       &sup_args))
+	if (__of_parse_phandle_with_args(np, prop_name, cells_name, 0, index,
+					 &sup_args))
 		return NULL;
 
 	return sup_args.np;
-- 
2.30.2

