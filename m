Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05152C2FC22
	for <linux-doc@archiver.kernel.org>; Thu, 17 Aug 2023 09:13:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349357AbjHQJNA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Aug 2023 05:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349375AbjHQJMr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 05:12:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B737D1FE2
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 02:12:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 401E3638E3
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 09:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE9FC433CD;
        Thu, 17 Aug 2023 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692263565;
        bh=GXIGtEMigdYTSCm2iTmqFELl4pZbSdBA2ThXERzYR1Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tGRviZinUBE4lgehqCUeo1V4Hgys+hK6OWx4J1S4kpbsTNJRVTL7a6Xt/xvjwAwPw
         ytyE6pi6+UwC3LmFKpVfToarP8gp+vmMCUu3NRDN14VzWOT/7xkk4P98raAWYKny8b
         HzuJUJVgduQ7D/X8kcD7cgBhlYmnQZO866vh+cmVZPDyqn+F9bCeSECeo3JVGpVXM9
         hvRDlyT4ikLw2JA81Fp7P8z7KusTmlsgOOVy09FO3HUbrnFZLIQtaLo06l9r9d6GaA
         6rTb4bZvelDg+zU/966U6JyUdBCCUj9pgS8KfrsPdFj+5nUtlmRA92l2b3v80ReSjc
         0CgZneqfQ6raQ==
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
Subject: [PATCH net-next v3 5/8] net/mlx5: Add IFC bits to support IPsec enable/disable
Date:   Thu, 17 Aug 2023 12:11:27 +0300
Message-ID: <a978d0a9239d3109faed5531102d026662153b7e.1692262560.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692262560.git.leonro@nvidia.com>
References: <cover.1692262560.git.leonro@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Leon Romanovsky <leonro@nvidia.com>

Add hardware definitions to allow to control IPSec capabilities.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/mlx5/mlx5_ifc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/mlx5/mlx5_ifc.h b/include/linux/mlx5/mlx5_ifc.h
index 08dcb1f43be7..fc3db401f8a2 100644
--- a/include/linux/mlx5/mlx5_ifc.h
+++ b/include/linux/mlx5/mlx5_ifc.h
@@ -65,9 +65,11 @@ enum {
 
 enum {
 	MLX5_SET_HCA_CAP_OP_MOD_GENERAL_DEVICE        = 0x0,
+	MLX5_SET_HCA_CAP_OP_MOD_ETHERNET_OFFLOADS     = 0x1,
 	MLX5_SET_HCA_CAP_OP_MOD_ODP                   = 0x2,
 	MLX5_SET_HCA_CAP_OP_MOD_ATOMIC                = 0x3,
 	MLX5_SET_HCA_CAP_OP_MOD_ROCE                  = 0x4,
+	MLX5_SET_HCA_CAP_OP_MOD_IPSEC                 = 0x15,
 	MLX5_SET_HCA_CAP_OP_MOD_GENERAL_DEVICE2       = 0x20,
 	MLX5_SET_HCA_CAP_OP_MOD_PORT_SELECTION        = 0x25,
 };
@@ -3451,6 +3453,7 @@ union mlx5_ifc_hca_cap_union_bits {
 	struct mlx5_ifc_virtio_emulation_cap_bits virtio_emulation_cap;
 	struct mlx5_ifc_macsec_cap_bits macsec_cap;
 	struct mlx5_ifc_crypto_cap_bits crypto_cap;
+	struct mlx5_ifc_ipsec_cap_bits ipsec_cap;
 	u8         reserved_at_0[0x8000];
 };
 
-- 
2.41.0

