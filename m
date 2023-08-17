Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6EFC2FC24
	for <linux-doc@archiver.kernel.org>; Thu, 17 Aug 2023 09:13:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349349AbjHQJM7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Aug 2023 05:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349365AbjHQJMj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 05:12:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094B1198E
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 02:12:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9B7BE639CB
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 09:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DA0C433C9;
        Thu, 17 Aug 2023 09:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692263557;
        bh=Upkp86vw9ugMAMCg3JpwxfKSQ44z4bXL8TT4F1RVH6Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JBCziDDdMTvWjwQB/ruqrcoCw92B+7nD/CwevpXQ4fmuWvTYPg2gB8Y65QAL0amJM
         +EhV2ORJ/QtCck3CuxMrfX8YayLc2eKUblsV2GSfx1/R0q0IflAeaEgkjbykZDXA8p
         49iM1vEPa8UUPVxPNS0ibnocjXwWmcyu1kBNVTyl+yQaH3mZx1shx51wdSdgY5oCG8
         Su2AwuAWz6p3lsOtHW19t53SsDyVEJxO/qYt3wU/pKuFNGashAGcn7W6d9rT4QGHNK
         Y6gZhb9qETZMxjYPEkfR2OwkWICuQxqH8Q1vPog9vx3AkFPMpNGBgAEOuyvc/xJKfp
         FdIRarbDckkig==
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
Subject: [PATCH net-next v3 6/8] net/mlx5: Provide an interface to block change of IPsec capabilities
Date:   Thu, 17 Aug 2023 12:11:28 +0300
Message-ID: <f8f3a51282be5e91c2622fa2d40e669b807c43fd.1692262560.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692262560.git.leonro@nvidia.com>
References: <cover.1692262560.git.leonro@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Leon Romanovsky <leonro@nvidia.com>

mlx5 HW can't perform IPsec offload operation simultaneously both on PF
and VFs at the same time. While the previous patches added devlink knobs
to change IPsec capabilities dynamically, there is a need to add a logic
to block such IPsec capabilities for the cases when IPsec is already
configured.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 .../mellanox/mlx5/core/en_accel/ipsec.c       | 20 +++++++++++-
 .../net/ethernet/mellanox/mlx5/core/eswitch.c | 32 +++++++++++++++++++
 .../net/ethernet/mellanox/mlx5/core/eswitch.h | 13 ++++++++
 include/linux/mlx5/driver.h                   |  1 +
 4 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c
index 3b88a8bb7082..7d4ceb9b9c16 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c
@@ -38,6 +38,7 @@
 #include <net/netevent.h>
 
 #include "en.h"
+#include "eswitch.h"
 #include "ipsec.h"
 #include "ipsec_rxtx.h"
 #include "en_rep.h"
@@ -670,6 +671,11 @@ static int mlx5e_xfrm_add_state(struct xfrm_state *x,
 	if (err)
 		goto err_xfrm;
 
+	if (!mlx5_eswitch_block_ipsec(priv->mdev)) {
+		err = -EBUSY;
+		goto err_xfrm;
+	}
+
 	/* check esn */
 	if (x->props.flags & XFRM_STATE_ESN)
 		mlx5e_ipsec_update_esn_state(sa_entry);
@@ -678,7 +684,7 @@ static int mlx5e_xfrm_add_state(struct xfrm_state *x,
 
 	err = mlx5_ipsec_create_work(sa_entry);
 	if (err)
-		goto err_xfrm;
+		goto unblock_ipsec;
 
 	err = mlx5e_ipsec_create_dwork(sa_entry);
 	if (err)
@@ -735,6 +741,8 @@ static int mlx5e_xfrm_add_state(struct xfrm_state *x,
 	if (sa_entry->work)
 		kfree(sa_entry->work->data);
 	kfree(sa_entry->work);
+unblock_ipsec:
+	mlx5_eswitch_unblock_ipsec(priv->mdev);
 err_xfrm:
 	kfree(sa_entry);
 	NL_SET_ERR_MSG_WEAK_MOD(extack, "Device failed to offload this state");
@@ -764,6 +772,7 @@ static void mlx5e_xfrm_del_state(struct xfrm_state *x)
 static void mlx5e_xfrm_free_state(struct xfrm_state *x)
 {
 	struct mlx5e_ipsec_sa_entry *sa_entry = to_ipsec_sa_entry(x);
+	struct mlx5e_ipsec *ipsec = sa_entry->ipsec;
 
 	if (x->xso.flags & XFRM_DEV_OFFLOAD_FLAG_ACQ)
 		goto sa_entry_free;
@@ -780,6 +789,7 @@ static void mlx5e_xfrm_free_state(struct xfrm_state *x)
 	if (sa_entry->work)
 		kfree(sa_entry->work->data);
 	kfree(sa_entry->work);
+	mlx5_eswitch_unblock_ipsec(ipsec->mdev);
 sa_entry_free:
 	kfree(sa_entry);
 }
@@ -1055,6 +1065,11 @@ static int mlx5e_xfrm_add_policy(struct xfrm_policy *x,
 	pol_entry->x = x;
 	pol_entry->ipsec = priv->ipsec;
 
+	if (!mlx5_eswitch_block_ipsec(priv->mdev)) {
+		err = -EBUSY;
+		goto ipsec_busy;
+	}
+
 	mlx5e_ipsec_build_accel_pol_attrs(pol_entry, &pol_entry->attrs);
 	err = mlx5e_accel_ipsec_fs_add_pol(pol_entry);
 	if (err)
@@ -1064,6 +1079,8 @@ static int mlx5e_xfrm_add_policy(struct xfrm_policy *x,
 	return 0;
 
 err_fs:
+	mlx5_eswitch_unblock_ipsec(priv->mdev);
+ipsec_busy:
 	kfree(pol_entry);
 	NL_SET_ERR_MSG_MOD(extack, "Device failed to offload this policy");
 	return err;
@@ -1074,6 +1091,7 @@ static void mlx5e_xfrm_del_policy(struct xfrm_policy *x)
 	struct mlx5e_ipsec_pol_entry *pol_entry = to_ipsec_pol_entry(x);
 
 	mlx5e_accel_ipsec_fs_del_pol(pol_entry);
+	mlx5_eswitch_unblock_ipsec(pol_entry->ipsec->mdev);
 }
 
 static void mlx5e_xfrm_free_policy(struct xfrm_policy *x)
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
index 4a7a13169a90..ae4059b51410 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
@@ -48,6 +48,7 @@
 #include "devlink.h"
 #include "ecpf.h"
 #include "en/mod_hdr.h"
+#include "en_accel/ipsec.h"
 
 enum {
 	MLX5_ACTION_NONE = 0,
@@ -882,6 +883,37 @@ static void esw_vport_cleanup(struct mlx5_eswitch *esw, struct mlx5_vport *vport
 	esw_vport_cleanup_acl(esw, vport);
 }
 
+bool mlx5_eswitch_block_ipsec(struct mlx5_core_dev *dev)
+{
+	struct mlx5_eswitch *esw = dev->priv.eswitch;
+
+	if (!mlx5_esw_allowed(esw))
+		return true;
+
+	mutex_lock(&esw->state_lock);
+	if (esw->enabled_ipsec_vf_count) {
+		mutex_unlock(&esw->state_lock);
+		return false;
+	}
+
+	dev->num_ipsec_offloads++;
+	mutex_unlock(&esw->state_lock);
+	return true;
+}
+
+void mlx5_eswitch_unblock_ipsec(struct mlx5_core_dev *dev)
+{
+	struct mlx5_eswitch *esw = dev->priv.eswitch;
+
+	if (!mlx5_esw_allowed(esw))
+		/* Failure means no eswitch => core dev is not a PF */
+		return;
+
+	mutex_lock(&esw->state_lock);
+	dev->num_ipsec_offloads--;
+	mutex_unlock(&esw->state_lock);
+}
+
 int mlx5_esw_vport_enable(struct mlx5_eswitch *esw, u16 vport_num,
 			  enum mlx5_eswitch_vport_event enabled_events)
 {
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h
index 8042e2222ee9..9fc3cc978ede 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h
@@ -357,6 +357,7 @@ struct mlx5_eswitch {
 	struct blocking_notifier_head n_head;
 	struct xarray paired;
 	struct mlx5_devcom_comp_dev *devcom;
+	u16 enabled_ipsec_vf_count;
 };
 
 void esw_offloads_disable(struct mlx5_eswitch *esw);
@@ -689,6 +690,12 @@ mlx5_eswitch_enable_pf_vf_vports(struct mlx5_eswitch *esw,
 				 enum mlx5_eswitch_vport_event enabled_events);
 void mlx5_eswitch_disable_pf_vf_vports(struct mlx5_eswitch *esw);
 
+bool mlx5_esw_ipsec_vf_offload_supported(struct mlx5_core_dev *dev);
+int mlx5_esw_ipsec_vf_crypto_offload_supported(struct mlx5_core_dev *dev,
+					       u16 vport_num);
+bool mlx5_eswitch_block_ipsec(struct mlx5_core_dev *dev);
+void mlx5_eswitch_unblock_ipsec(struct mlx5_core_dev *dev);
+
 int mlx5_esw_vport_enable(struct mlx5_eswitch *esw, u16 vport_num,
 			  enum mlx5_eswitch_vport_event enabled_events);
 void mlx5_esw_vport_disable(struct mlx5_eswitch *esw, u16 vport_num);
@@ -872,6 +879,12 @@ static inline void mlx5_eswitch_unblock_encap(struct mlx5_core_dev *dev)
 
 static inline int mlx5_eswitch_block_mode(struct mlx5_core_dev *dev) { return 0; }
 static inline void mlx5_eswitch_unblock_mode(struct mlx5_core_dev *dev) {}
+static inline bool mlx5_eswitch_block_ipsec(struct mlx5_core_dev *dev)
+{
+	return false;
+}
+
+static inline void mlx5_eswitch_unblock_ipsec(struct mlx5_core_dev *dev) {}
 #endif /* CONFIG_MLX5_ESWITCH */
 
 #endif /* __MLX5_ESWITCH_H__ */
diff --git a/include/linux/mlx5/driver.h b/include/linux/mlx5/driver.h
index caa6006d940c..5e3c46b38047 100644
--- a/include/linux/mlx5/driver.h
+++ b/include/linux/mlx5/driver.h
@@ -814,6 +814,7 @@ struct mlx5_core_dev {
 	/* MACsec notifier chain to sync MACsec core and IB database */
 	struct blocking_notifier_head macsec_nh;
 #endif
+	u64 			num_ipsec_offloads;
 };
 
 struct mlx5_db {
-- 
2.41.0

