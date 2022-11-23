Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9E2C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 23 Nov 2022 18:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239429AbiKWSCd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Nov 2022 13:02:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239227AbiKWSCZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Nov 2022 13:02:25 -0500
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3ECF8C7AC;
        Wed, 23 Nov 2022 10:02:23 -0800 (PST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id 0CFBA3B1D;
        Wed, 23 Nov 2022 19:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1669226542;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dbqJAngAnCItu/kQhrmwoKdD13Z1Ky8qwmXbY0PTXSA=;
        b=v/5RSiS+j5rt3w7kJZACxzGmYamX7vbD6+QyoLb9F0wfekJVPshLPUfL8jQ7PVLYQx4/1j
        djfiU2DV47D29uxfvw4BMdtCxpcuiuaDkAPIIYfayKTlmghBR8FxRP/cUQPu9+B9PXeg96
        4vQueLE3pnYbPuvjAMbutoxAFzXu8FWnZQ4MRgeJWBxE7coja3R20STwIJwE09zG9C91I4
        0WfBZiPn3jpbhY2dotC5oW/O4WuagisAZgsCShQYbwHYM9fJZf1FNhNuQHdOuhFE0bz7kv
        iKaENYpuqLt4rB4kxYCjNAQUzOipujW49nGSSwvjv18izu7vZpJR38I3idkWkg==
From:   Michael Walle <michael@walle.cc>
To:     Jonathan Corbet <corbet@lwn.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v4 08/20] nvmem: core: drop the removal of the cells in nvmem_add_cells()
Date:   Wed, 23 Nov 2022 19:01:39 +0100
Message-Id: <20221123180151.2160033-9-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123180151.2160033-1-michael@walle.cc>
References: <20221123180151.2160033-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If nvmem_add_cells() fails, the whole nvmem_register() will fail
and the cells will then be removed anyway. This is a preparation
to introduce a nvmem_add_one_cell() which can then be used by
nvmem_add_cells().

This is then the same to what nvmem_add_cells_from_table() and
nvmem_add_cells_from_of() do.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v3:
 - fix typo, s/prepartion/preparation/

changes since v2:
 - none

changes since v1:
 - none

 drivers/nvmem/core.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 24573e63e5a9..7c76e0e0072e 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -515,7 +515,7 @@ static int nvmem_add_cells(struct nvmem_device *nvmem,
 		    int ncells)
 {
 	struct nvmem_cell_entry **cells;
-	int i, rval;
+	int i, rval = 0;
 
 	cells = kcalloc(ncells, sizeof(*cells), GFP_KERNEL);
 	if (!cells)
@@ -525,28 +525,22 @@ static int nvmem_add_cells(struct nvmem_device *nvmem,
 		cells[i] = kzalloc(sizeof(**cells), GFP_KERNEL);
 		if (!cells[i]) {
 			rval = -ENOMEM;
-			goto err;
+			goto out;
 		}
 
 		rval = nvmem_cell_info_to_nvmem_cell_entry(nvmem, &info[i], cells[i]);
 		if (rval) {
 			kfree(cells[i]);
-			goto err;
+			goto out;
 		}
 
 		nvmem_cell_entry_add(cells[i]);
 	}
 
+out:
 	/* remove tmp array */
 	kfree(cells);
 
-	return 0;
-err:
-	while (i--)
-		nvmem_cell_entry_drop(cells[i]);
-
-	kfree(cells);
-
 	return rval;
 }
 
-- 
2.30.2

