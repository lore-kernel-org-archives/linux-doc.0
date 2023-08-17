Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C39EB64DD
	for <linux-doc@archiver.kernel.org>; Thu, 17 Aug 2023 09:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349340AbjHQJM6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Aug 2023 05:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349345AbjHQJM1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 05:12:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB2FE210E
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 02:12:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 51DBC61B6B
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 09:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D462C433C8;
        Thu, 17 Aug 2023 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692263543;
        bh=AdCGw65Sp30/Y/5xCO8g6GynIgoWlihomWyv4XJymKo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H+olRZXS1TLiy5vRSzoua6cc6nqFaAxWsDZqgKVgiU6+/kpkS6KUAU6tW62zkm1eP
         t8pRfjBb3kZ+C7wbzO5kEo9YqVUcGfTjJNh1sezYvQBHjJFRbWz1lMT/WRUwLP3tnB
         l6SR4X0WwKJpLtRV0DvkN23WXGg63BRCCtHPfYwLiv0wQA9DmMbmpK5XBRKruBCi1n
         HxHn/rSPapu4W4XFUTVSjkelcbnmWVRPzmyYK/o+KexbvBiEjOqlf6r0p0LxzGlKBG
         4qDslSHHpaPANtQH9j5p62gW2sG03VkpERS5B1xHtMC0X4u/o3moaea9YJpO0A10a7
         C4x/R6gZInEbw==
From:   Leon Romanovsky <leon@kernel.org>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     Leon Romanovsky <leonro@nvidia.com>,
        Dima Chumak <dchumak@nvidia.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Simon Horman <simon.horman@corigine.com>
Subject: [PATCH net-next v3 3/8] net/mlx5: Drop extra layer of locks in IPsec
Date:   Thu, 17 Aug 2023 12:11:25 +0300
Message-ID: <8c50d16c8cbb07ea0aaeeabbbf9439ee3eb6490b.1692262560.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692262560.git.leonro@nvidia.com>
References: <cover.1692262560.git.leonro@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Leon Romanovsky <leonro@nvidia.com>

There is no need in holding devlink lock as it gives nothing
compared to already used write mode_lock.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 .../mellanox/mlx5/core/eswitch_offloads.c      | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
index 46b8c60ac39a..ef2bb04f10be 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
@@ -3879,38 +3879,28 @@ int mlx5_devlink_eswitch_inline_mode_get(struct devlink *devlink, u8 *mode)
 
 bool mlx5_eswitch_block_encap(struct mlx5_core_dev *dev)
 {
-	struct devlink *devlink = priv_to_devlink(dev);
-	struct mlx5_eswitch *esw;
+	struct mlx5_eswitch *esw = dev->priv.eswitch;
 
-	devl_lock(devlink);
-	esw = mlx5_devlink_eswitch_get(devlink);
-	if (IS_ERR(esw)) {
-		devl_unlock(devlink);
-		/* Failure means no eswitch => not possible to change encap */
+	if (!mlx5_esw_allowed(esw))
 		return true;
-	}
 
 	down_write(&esw->mode_lock);
 	if (esw->mode != MLX5_ESWITCH_LEGACY &&
 	    esw->offloads.encap != DEVLINK_ESWITCH_ENCAP_MODE_NONE) {
 		up_write(&esw->mode_lock);
-		devl_unlock(devlink);
 		return false;
 	}
 
 	esw->offloads.num_block_encap++;
 	up_write(&esw->mode_lock);
-	devl_unlock(devlink);
 	return true;
 }
 
 void mlx5_eswitch_unblock_encap(struct mlx5_core_dev *dev)
 {
-	struct devlink *devlink = priv_to_devlink(dev);
-	struct mlx5_eswitch *esw;
+	struct mlx5_eswitch *esw = dev->priv.eswitch;
 
-	esw = mlx5_devlink_eswitch_get(devlink);
-	if (IS_ERR(esw))
+	if (!mlx5_esw_allowed(esw))
 		return;
 
 	down_write(&esw->mode_lock);
-- 
2.41.0

