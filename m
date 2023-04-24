Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E57AC77B61
	for <linux-doc@archiver.kernel.org>; Mon, 24 Apr 2023 10:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjDXK6j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Apr 2023 06:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjDXK6j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Apr 2023 06:58:39 -0400
X-Greylist: delayed 331 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 24 Apr 2023 03:58:37 PDT
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAA51FDE;
        Mon, 24 Apr 2023 03:58:36 -0700 (PDT)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.tkos.co.il (Postfix) with ESMTPS id 3D5F74407EC;
        Mon, 24 Apr 2023 13:47:34 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1682333254;
        bh=UOqpi3mb7I3QEpZ3fDvh/I/rUBrUC+KfYR4O0OfZLcM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WH12fBnYK3h78gBrX8/a8GA0FN0qFwHxKFmw1Tek9/OxaDf6AtRZzI7xHVnVGXt37
         +KhK7A5Q2eksm4T44cQZfhBds6oCArvZyaB/0q+FarjfM8QiilTO97zdIzb/xOaNjB
         3EiTjih+lHbT8KG6cZ7wg8YTAhTQDCDydOLvKvQ4sqD7ggCQfAh6N5RQ8J2xfZXKlk
         zrXTXNVn5Zz1MJovSYax5Fs6hI6n30NuJd6AjJOjDP8rlxXTKglDgePWUMiHrvMPfR
         G58x0G2WiGNEAjhDpqxExAeCiUudInkrnNeoHIN3pfidtVDOLVc8VC4QxnU0Kmd/yu
         sCG0/EA11kJrw==
From:   Baruch Siach <baruch@tkos.co.il>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v2 2/2] docs: zh_CN/devicetree: sync usage-model fix
Date:   Mon, 24 Apr 2023 13:52:54 +0300
Message-Id: <b39560250cb58f8cdcfe95791ce5af7455c6e8e3.1682333574.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il>
References: <9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sync compatibly string fix from the English document.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:

  New separate patch for translation
---
 Documentation/translations/zh_CN/devicetree/usage-model.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/devicetree/usage-model.rst b/Documentation/translations/zh_CN/devicetree/usage-model.rst
index c6aee82c7e6e..19ba4ae0cd81 100644
--- a/Documentation/translations/zh_CN/devicetree/usage-model.rst
+++ b/Documentation/translations/zh_CN/devicetree/usage-model.rst
@@ -325,6 +325,6 @@ Primecell设备。然而，棘手的一点是，AMBA总线上的所有设备并
 
 当使用DT时，这给of_platform_populate()带来了问题，因为它必须决定是否将
 每个节点注册为platform_device或amba_device。不幸的是，这使设备创建模型
-变得有点复杂，但解决方案原来并不是太具有侵略性。如果一个节点与“arm,amba-primecell”
+变得有点复杂，但解决方案原来并不是太具有侵略性。如果一个节点与“arm,primecell”
 兼容，那么of_platform_populate()将把它注册为amba_device而不是
 platform_device。
-- 
2.39.2

