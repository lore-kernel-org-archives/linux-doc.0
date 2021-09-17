Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A35C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 17 Sep 2021 18:50:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2BAF61056
	for <linux-doc@archiver.kernel.org>; Fri, 17 Sep 2021 18:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240787AbhIQSve (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Sep 2021 14:51:34 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:59261 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235893AbhIQSvd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Sep 2021 14:51:33 -0400
Date:   Fri, 17 Sep 2021 18:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acoro.eu;
        s=protonmail2; t=1631904607;
        bh=N+gO9RIfpt8SiTHVFCUohoA8yoBqGr/uc1Xzu+Xgz4w=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=5XUvXL63CTlfcFvz5j6jWyvz0UpLRrb/QivTotYo+bkccqoR9v1E7AMXZg538BeGt
         G8tKPf0XzIyVOWZOV1HyfW+0fJuBUxCT0KtLROx3bx6vKSUNnAq9gAiDspwszPo+nV
         5TbwUuRG3tySTtqbyoobk5Ie8VZdxFzpyu+iO4ZWF1DNE1b8JbXXf/0/m8bM+hV97O
         pcY4Fp5w4sXazww16X6hjoww9gZljyNMq34DZjbWSQGiljXpY/0EK3cVqC1/d0UtUU
         5gmsNcVxOgf7NizAUM8Ghtd76x+zIEmZ2C69g971Kp6aMlPtVaeXN3T4zziUBc32De
         c/74VDxNmEPMw==
To:     davem@davemloft.net, linux-doc@vger.kernel.org,
        vladimir.oltean@nxp.com, asconcepcion@acoro.eu
From:   Alejandro Concepcion-Rodriguez <asconcepcion@acoro.eu>
Cc:     kuba@kernel.org, corbet@lwn.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alejandro Concepcion-Rodriguez <asconcepcion@acoro.eu>
Subject: [PATCH] docs: net: dsa: sja1105: fix reference to sja1105.txt
Message-ID: <05f698d3-4155-4688-77d0-adc0ab6fe140@acoro.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The file sja1105.txt was converted to nxp,sja1105.yaml.

Signed-off-by: Alejandro Concepcion-Rodriguez <asconcepcion@acoro.eu>
---
 Documentation/networking/dsa/sja1105.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/dsa/sja1105.rst b/Documentation/netwo=
rking/dsa/sja1105.rst
index 564caeebe2b2..29b1bae0cf00 100644
--- a/Documentation/networking/dsa/sja1105.rst
+++ b/Documentation/networking/dsa/sja1105.rst
@@ -296,7 +296,7 @@ not available.
 Device Tree bindings and board design
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

-This section references ``Documentation/devicetree/bindings/net/dsa/sja110=
5.txt``
+This section references ``Documentation/devicetree/bindings/net/dsa/nxp,sj=
a1105.yaml``
 and aims to showcase some potential switch caveats.

 RMII PHY role and out-of-band signaling
--
2.25.1

