Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A394C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:14:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 503D360F93
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:14:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235765AbhIPJPo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:15:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:40908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235411AbhIPJPl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:15:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BEA26120F;
        Thu, 16 Sep 2021 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631783661;
        bh=P40uukirW3FFGa1Zimq5CX1XaC1AElNM7bJsxfRbqLI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mp0q2G4vT0EkLqQ2lHS9PNQGkJ6u75paaXDSXYYDB5upoLXu5Z2QsH8owaRIPQiuM
         /ssCvGEvebj2QRG3ct6VB1VdDIRY6ZfMu9rYV7uDBfLb0+WGt6T94R6o4f7nRme1hM
         FNscx5y6WE9lpaGxZ7NxDTuCcxZrljL7njAAP6vIsL/4j2Ff4dg34GGSCVizCes6UK
         OPWinlBjn5ndSZ9GEErNvwYbCpWqoBGaaqw/RmY3PiQ7+ie+X07mLnBX9utxwv9vj1
         GHpOURZAchb8rENAvJcv1KzyzsNZRW+5m+nJU+Y+DA1E5VZnwW6nIBhmK8EL1WmPI1
         4JafdvcDxPWpA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQnTH-001sKg-AW; Thu, 16 Sep 2021 11:14:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH 02/24] dt-bindings: net: dsa: sja1105: update nxp,sja1105.yaml reference
Date:   Thu, 16 Sep 2021 11:13:55 +0200
Message-Id: <cde8e4181286d7e0ea2c750528b2604d77863b98.1631783482.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631783482.git.mchehab+huawei@kernel.org>
References: <cover.1631783482.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 62568bdbe6f6 ("dt-bindings: net: dsa: sja1105: convert to YAML schema")
renamed: Documentation/devicetree/bindings/net/dsa/sja1105.txt
to: Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml.

Update its cross-reference accordingly.

Fixes: 62568bdbe6f6 ("dt-bindings: net: dsa: sja1105: convert to YAML schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/networking/dsa/sja1105.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/dsa/sja1105.rst b/Documentation/networking/dsa/sja1105.rst
index 564caeebe2b2..29b1bae0cf00 100644
--- a/Documentation/networking/dsa/sja1105.rst
+++ b/Documentation/networking/dsa/sja1105.rst
@@ -296,7 +296,7 @@ not available.
 Device Tree bindings and board design
 =====================================
 
-This section references ``Documentation/devicetree/bindings/net/dsa/sja1105.txt``
+This section references ``Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml``
 and aims to showcase some potential switch caveats.
 
 RMII PHY role and out-of-band signaling
-- 
2.31.1

