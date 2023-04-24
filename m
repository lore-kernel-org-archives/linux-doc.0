Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61111C7EE20
	for <linux-doc@archiver.kernel.org>; Mon, 24 Apr 2023 11:04:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbjDXLEH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Apr 2023 07:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbjDXLDj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Apr 2023 07:03:39 -0400
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E436535A0;
        Mon, 24 Apr 2023 04:03:37 -0700 (PDT)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.tkos.co.il (Postfix) with ESMTPS id EB04C44075A;
        Mon, 24 Apr 2023 13:47:33 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1682333254;
        bh=wbWSwHfxYrJxojZ6L4lTERN9bJSXMITupfVMYU8Ip0U=;
        h=From:To:Cc:Subject:Date:From;
        b=cu7bGNwsHLdn+MDjRxozuuV25YQr5XQcrwpKKtmUkfwc0iqOJQ2LFIEfUmD+MdSu/
         K/ysoWhrO316Gaa1fBf8vgnu5dFUYfeobY93URUvgYwX6gm/eLmPW9qTGpEPq/mqK6
         3lKh3Oc73tPBlOBgML88HKu5gnXcN9VGLKVyQOKUEaus+pHnEVyxMd2hxDJMoVu0go
         0TC/m7SrxtcD7XjeI7F3VFJSMQmqMagJhv1d73hoGgTEX8CvoJ7pteocdIsLdXXCFL
         fuBx0Qiu2RqINc44WuBuonJX9VF9yPrbOMAH61NViQPBvZELakjGr4qTxp33+7OA4S
         W0/biqUM34IGQ==
From:   Baruch Siach <baruch@tkos.co.il>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v2 1/2] docs: dt: fix documented Primecell compatible string
Date:   Mon, 24 Apr 2023 13:52:53 +0300
Message-Id: <9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Only arm,primecell is documented as compatible string for Primecell
peripherals. Current code agrees with that.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:

  Split the translation update to a separate patch
---
 Documentation/devicetree/usage-model.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/usage-model.rst b/Documentation/devicetree/usage-model.rst
index b6a287955ee5..0717426856b2 100644
--- a/Documentation/devicetree/usage-model.rst
+++ b/Documentation/devicetree/usage-model.rst
@@ -415,6 +415,6 @@ When using the DT, this creates problems for of_platform_populate()
 because it must decide whether to register each node as either a
 platform_device or an amba_device.  This unfortunately complicates the
 device creation model a little bit, but the solution turns out not to
-be too invasive.  If a node is compatible with "arm,amba-primecell", then
+be too invasive.  If a node is compatible with "arm,primecell", then
 of_platform_populate() will register it as an amba_device instead of a
 platform_device.
-- 
2.39.2

