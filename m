Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AC5EB64D9
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 21:46:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjFZVqp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 17:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjFZVqo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 17:46:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A09610C9
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 14:46:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F28AD60F45
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 21:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180B8C433C8;
        Mon, 26 Jun 2023 21:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687816002;
        bh=kNlt57kfoTRNbVJhKEJCmh7u/FMjIyTPyNK0rg+vYRc=;
        h=From:To:Cc:Subject:Date:From;
        b=PzPwHrcpH2zzuPnwKiU4HR2fidJpv9iORp5EHZi6fXsKAnxVm4GQoniL9qmvX3xie
         fYofj+J5x0exu7OTZ9KoRxf6ostb+m6RZekZWqP0PR6T9yLhtpS1ORII+wqmwwds7W
         JQHw06ocTbcD+m11I9m1dIAzknZZKiZhPOLHIuHaMOqGUE413ir3VDEobMhgu6yowl
         TP/o//sODwmnTMKeZS0tH86pm8r1BmMBosBdtEn2+BurMVpVMWFlzt7GxFdR5BxZsY
         suCNw6qZL+AocAbeVW7/nf8ZKRByI4BTpXPV9v7av688dc61SLH/aBUAyKG2WVT0aT
         ydo27rMHey4MQ==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        Jakub Kicinski <kuba@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Russell King <linux@armlinux.org.uk>, linux-doc@vger.kernel.org
Subject: [PATCH net-next] phylink: ReST-ify the phylink_pcs_neg_mode() kdoc
Date:   Mon, 26 Jun 2023 14:46:40 -0700
Message-ID: <20230626214640.3142252-1-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Stephen reports warnings when rendering phylink kdocs as HTML:

  include/linux/phylink.h:110: ERROR: Unexpected indentation.
  include/linux/phylink.h:111: WARNING: Block quote ends without a blank line; unexpected unindent.
  include/linux/phylink.h:614: WARNING: Inline literal start-string without end-string.
  include/linux/phylink.h:644: WARNING: Inline literal start-string without end-string.

Make phylink_pcs_neg_mode() use a proper list format to fix the first
two warnings.

The last two warnings, AFAICT, come from the use of shorthand like
phylink_mode_*(). Perhaps those should be special-cased at the Sphinx
level.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/all/20230626162908.2f149f98@canb.auug.org.au/
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: Russell King <linux@armlinux.org.uk>
CC: linux-doc@vger.kernel.org
---
 include/linux/phylink.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 516240f1e950..1817940a3418 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -105,11 +105,13 @@ static inline bool phylink_autoneg_inband(unsigned int mode)
  *
  * Determines the negotiation mode to be used by the PCS, and returns
  * one of:
- * %PHYLINK_PCS_NEG_NONE: interface mode does not support inband
- * %PHYLINK_PCS_NEG_OUTBAND: an out of band mode (e.g. reading the PHY)
+ *
+ * - %PHYLINK_PCS_NEG_NONE: interface mode does not support inband
+ * - %PHYLINK_PCS_NEG_OUTBAND: an out of band mode (e.g. reading the PHY)
  *   will be used.
- * %PHYLINK_PCS_NEG_INBAND_DISABLED: inband mode selected but autoneg disabled
- * %PHYLINK_PCS_NEG_INBAND_ENABLED: inband mode selected and autoneg enabled
+ * - %PHYLINK_PCS_NEG_INBAND_DISABLED: inband mode selected but autoneg
+ *   disabled
+ * - %PHYLINK_PCS_NEG_INBAND_ENABLED: inband mode selected and autoneg enabled
  *
  * Note: this is for cases where the PCS itself is involved in negotiation
  * (e.g. Clause 37, SGMII and similar) not Clause 73.
-- 
2.41.0

