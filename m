Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFF9C25B50
	for <linux-doc@archiver.kernel.org>; Tue, 24 Jan 2023 12:16:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbjAXMQP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Jan 2023 07:16:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233544AbjAXMQI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Jan 2023 07:16:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98A3457D4;
        Tue, 24 Jan 2023 04:15:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 63D72610AA;
        Tue, 24 Jan 2023 12:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0969CC433D2;
        Tue, 24 Jan 2023 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674562553;
        bh=01/fw80+h5CCKaaSUFROeNFVFiv5pBtbjx/3iSu09s0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aQlnZt4wtAsXCw/ez8ojt/JSdcbHHvVxNgXy2J3ZWWHl43FgLHoBLJz6IZ5jBjNxn
         ziWDvgZGe6KqhtKT6WLUz+T3dLTdg/28pnHrxxqjVR3zi/H9aKhiOY4bjfg6oZGg7y
         JXp+G0LV0dA1Ze31j4WtmDG1YvKiBP1qDQhh92lZuHTU5CZgJ8QmNdF3UMjYWB3OnT
         ueoVnsFF7SUFcWtPElO5YNJTBX74fydwvBaqLXJy+zWO20PxGk2ZeNgybBSBaSlWeI
         KjGNJfqLH5BtVnQm0WoWJu2ak2jI2+cQ7gCE5QboF3+ky2bRZFiTPxNgYUoGGBN1xd
         q/WyeXmTxccsw==
From:   Leon Romanovsky <leon@kernel.org>
To:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Steffen Klassert <steffen.klassert@secunet.com>
Cc:     Leon Romanovsky <leonro@nvidia.com>,
        Andy Gospodarek <andy@greyhouse.net>,
        Ayush Sawal <ayush.sawal@chelsio.com>,
        Eric Dumazet <edumazet@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        intel-wired-lan@lists.osuosl.org,
        Jay Vosburgh <j.vosburgh@gmail.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, oss-drivers@corigine.com,
        Paolo Abeni <pabeni@redhat.com>,
        Raju Rangoju <rajur@chelsio.com>,
        Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <simon.horman@corigine.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Veaceslav Falico <vfalico@gmail.com>
Subject: [PATCH net-next v1 09/10] bonding: fill IPsec state validation failure reason
Date:   Tue, 24 Jan 2023 13:55:05 +0200
Message-Id: <f20afc9cb9606d73584281cff772ccdbc499c3d9.1674560845.git.leon@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1674560845.git.leon@kernel.org>
References: <cover.1674560845.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Leon Romanovsky <leonro@nvidia.com>

Rely on extack to return failure reason.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/net/bonding/bond_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 686b2a6fd674..00646aa315c3 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -444,7 +444,7 @@ static int bond_ipsec_add_sa(struct xfrm_state *xs,
 	if (!slave->dev->xfrmdev_ops ||
 	    !slave->dev->xfrmdev_ops->xdo_dev_state_add ||
 	    netif_is_bond_master(slave->dev)) {
-		slave_warn(bond_dev, slave->dev, "Slave does not support ipsec offload\n");
+		NL_SET_ERR_MSG_MOD(extack, "Slave does not support ipsec offload");
 		rcu_read_unlock();
 		return -EINVAL;
 	}
-- 
2.39.1

