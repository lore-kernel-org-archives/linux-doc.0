Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4E4C4708A
	for <linux-doc@archiver.kernel.org>; Fri, 18 Nov 2022 18:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242382AbiKRSwT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Nov 2022 13:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242882AbiKRSv5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Nov 2022 13:51:57 -0500
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC708F3FD
        for <linux-doc@vger.kernel.org>; Fri, 18 Nov 2022 10:51:57 -0800 (PST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id 1C257277E;
        Fri, 18 Nov 2022 19:51:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1668797492;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5hJ+x0t7Feg652ncYtA0Rozjly++kFybl23/BlNYEos=;
        b=RopdvzAe9TlQPOi0Gkeanh59YifCyxSJrAvHLSBKPiPf0oHCabrNxHsWP3ul8ZDP0rdLqF
        YhuthUagm7gjd6cM1VWWLoyQ8L32JGvxFAYItW9Z4S0GM1bnkhjhrE07mVFrVkr0IuGAvI
        cJDJn6fXJP1pA/q8S9iI0kcpLwZO1QiTu//iJisXfHE5eTQvOminP6GCsK5rcKyOMBWGCF
        4eoF1xT291YkZLKizUvZ2XdW/HoOKqJLYyy5ZJDoh1VHL6Ak4zqSE/qC34qyyd14+YGhVx
        ZJ1IAL7a8LxGkeTsUXWxCROQvql0EKIz+oKol5EogeKuwcgYbB2c4cpKc72tCA==
From:   Michael Walle <michael@walle.cc>
To:     Jonathan Corbet <corbet@lwn.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v3 16/18] MAINTAINERS: add myself as sl28vpd nvmem layout driver
Date:   Fri, 18 Nov 2022 19:51:16 +0100
Message-Id: <20221118185118.1190044-17-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221118185118.1190044-1-michael@walle.cc>
References: <20221118185118.1190044-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add myself as a maintainer for the new sl28vpd nvmem layout driver.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v2:
 - new patch

 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1df62c469bd9..ef4b7a31f8b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19097,6 +19097,12 @@ F:	drivers/irqchip/irq-sl28cpld.c
 F:	drivers/pwm/pwm-sl28cpld.c
 F:	drivers/watchdog/sl28cpld_wdt.c
 
+SL28 VPD NVMEM LAYOUT DRIVER
+M:	Michael Walle <michael@walle.cc>
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
+F:	drivers/nvmem/layouts/sl28vpd.c
+
 SLAB ALLOCATOR
 M:	Christoph Lameter <cl@linux.com>
 M:	Pekka Enberg <penberg@kernel.org>
-- 
2.30.2

