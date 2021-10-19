Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92B0C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 19 Oct 2021 08:04:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4C4761390
	for <linux-doc@archiver.kernel.org>; Tue, 19 Oct 2021 08:04:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234733AbhJSIGl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Oct 2021 04:06:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:36160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234700AbhJSIGk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 19 Oct 2021 04:06:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9247361381;
        Tue, 19 Oct 2021 08:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634630667;
        bh=wY3fxruG22HqOKaFVDNRauDM1mfVAfkO9EW4ebZcww8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QckYmw5rUwR+zAK+yirmwpGWExL7CvS2JyTlECIBBEx5AyHZ/ZBHmtDW6xnGVr2Su
         jgWpAARP0Nts8szDoOAWdTemqCBfgbLkhChsbtRaCF/MJcvHgbLQR0+Ct+YNT14+0n
         aTprTxjykbAdiWC1ZhFLGRO4/CTSGknpJyXsIbCm4HkFkRoQvah4/eXZ4mHaDzDwTU
         Ap2VUdkonIwts+jhGOSetOGSJhcq87C2qd5KqF13XJG5yVUddKMqPxnH0SOSAH9/hK
         cD/xdBxDcas4Qf2Ci7eeDxLd8K95IMTR0X8CEV9NB6J6VUItnDeRCw7tOU9Z7Mniv3
         cfnGnLxAw2U2w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mck6j-001oJL-5u; Tue, 19 Oct 2021 09:04:25 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/23] MAINTAINERS: update brcm,unimac-mdio.yaml reference
Date:   Tue, 19 Oct 2021 09:04:10 +0100
Message-Id: <16b1368230352f3ec136d98766090a2161f84f9f.1634630486.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634630485.git.mchehab+huawei@kernel.org>
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 5d1c5594b646 ("dt-bindings: net: brcm,unimac-mdio: convert to the json-schema")
renamed: Documentation/devicetree/bindings/net/brcm,unimac-mdio.txt
to: Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml.

Update its cross-reference accordingly.

Fixes: 5d1c5594b646 ("dt-bindings: net: brcm,unimac-mdio: convert to the json-schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 74428ad1a74d..66c6c27d2209 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3783,7 +3783,7 @@ L:	bcm-kernel-feedback-list@broadcom.com
 L:	netdev@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/net/brcm,bcmgenet.txt
-F:	Documentation/devicetree/bindings/net/brcm,unimac-mdio.txt
+F:	Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
 F:	drivers/net/ethernet/broadcom/genet/
 F:	drivers/net/ethernet/broadcom/unimac.h
 F:	drivers/net/mdio/mdio-bcm-unimac.c
-- 
2.31.1

