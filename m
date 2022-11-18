Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76599C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 18 Nov 2022 18:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242036AbiKRSwD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Nov 2022 13:52:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242841AbiKRSvw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Nov 2022 13:51:52 -0500
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D378FE66
        for <linux-doc@vger.kernel.org>; Fri, 18 Nov 2022 10:51:42 -0800 (PST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id 4B3121CF7;
        Fri, 18 Nov 2022 19:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1668797485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T+grl/7KSmuE6kpRpwjC0iwkY9puLExtvI/auPRa/KM=;
        b=BMhk9wRWo/1HZyfrxiYoc5eosaQsmqpNIqZedKumsLkD2yjNhF+8SInMxaqIfSAsOJT31E
        3BiLJ1W7OyFvfpGt4HMoeM+Eq0ylPvic5cTFLxWhEc7ZrtFn/ipqZQoLgC+aOtZlUzraxw
        cF0suGUl3ThYEXMqDT3MjrJKR0HGQg4gAmHMsajqrGP8IxbUxB7RjpvjFRh0OE8iT/NhtP
        qZfuu15Mf3J/Fr9JebH4WWuu/cfwk+hsIZhw9blYPNo37KC8g7bZglhDsjpbeXX3muznRp
        ncjmYYr29v/CmYiUrb0T0km0S7/w228llxLAwr01SlsGbGvKsvMzkCV2Zk8V6A==
From:   Michael Walle <michael@walle.cc>
To:     Jonathan Corbet <corbet@lwn.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Walle <michael@walle.cc>, Andrew Lunn <andrew@lunn.ch>,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v3 01/18] net: add helper eth_addr_add()
Date:   Fri, 18 Nov 2022 19:51:01 +0100
Message-Id: <20221118185118.1190044-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221118185118.1190044-1-michael@walle.cc>
References: <20221118185118.1190044-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a helper to add an offset to a ethernet address. This comes in handy
if you have a base ethernet address for multiple interfaces.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Jakub Kicinski <kuba@kernel.org>
---
changes since v2:
 - none

changes since v1:
 - none

 include/linux/etherdevice.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/etherdevice.h b/include/linux/etherdevice.h
index a541f0c4f146..224645f17c33 100644
--- a/include/linux/etherdevice.h
+++ b/include/linux/etherdevice.h
@@ -507,6 +507,20 @@ static inline void eth_addr_inc(u8 *addr)
 	u64_to_ether_addr(u, addr);
 }
 
+/**
+ * eth_addr_add() - Add (or subtract) and offset to/from the given MAC address.
+ *
+ * @offset: Offset to add.
+ * @addr: Pointer to a six-byte array containing Ethernet address to increment.
+ */
+static inline void eth_addr_add(u8 *addr, long offset)
+{
+	u64 u = ether_addr_to_u64(addr);
+
+	u += offset;
+	u64_to_ether_addr(u, addr);
+}
+
 /**
  * is_etherdev_addr - Tell if given Ethernet address belongs to the device.
  * @dev: Pointer to a device structure
-- 
2.30.2

