Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4D3E9413A
	for <linux-doc@archiver.kernel.org>; Fri,  6 Oct 2023 22:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233851AbjJFWrx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Oct 2023 18:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233854AbjJFWrw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Oct 2023 18:47:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE388A6;
        Fri,  6 Oct 2023 15:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696632471; x=1728168471;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NM9EE9HTl9rWpj1CsHsY211ttABfbYDKg9zIqN+1XE4=;
  b=E2inWBDOfiG2WIRuLW8sw9TWbSAUwmYRbpdXlmCZ5xpFv1gjswzfY2iI
   a+hgfX4d1acAPICz1mXlAK2BZA2touW140mGeXHeOv5U3w2zB9lhrh1SH
   6XViHHs6OzdKkas26XdowcBkwWdIlbR0L6c3L9+gXGGZjdDUwK4cqFCJj
   K8zFr6W4DFdlIbNtGsz39UqrS7X03UqfPG13xS7WGkIZ8XRO36waYzB2N
   aAgaYeHPla/F3oHCD9B8g5MVqATC3Ze0F1+8shmysRwEvC9lSOrU3YPCS
   6ct1PAe6OCSOE2TTfk2N7i73m9io7i/48vpPd9hgzACiwJCxiz40uHQbp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="363201091"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="363201091"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 15:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="1083610336"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="1083610336"
Received: from dianaman-mobl1.ger.corp.intel.com (HELO azaki-desk1.intel.com) ([10.249.35.113])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 15:47:46 -0700
From:   Ahmed Zaki <ahmed.zaki@intel.com>
To:     netdev@vger.kernel.org
Cc:     intel-wired-lan@lists.osuosl.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        vladimir.oltean@nxp.com, andrew@lunn.ch, horms@kernel.org,
        mkubecek@suse.cz, Ahmed Zaki <ahmed.zaki@intel.com>,
        Wojciech Drewek <wojciech.drewek@intel.com>
Subject: [PATCH net-next v2 2/6] ice: fix ICE_AQ_VSI_Q_OPT_RSS_* register values
Date:   Fri,  6 Oct 2023 16:47:22 -0600
Message-Id: <20231006224726.443836-3-ahmed.zaki@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006224726.443836-1-ahmed.zaki@intel.com>
References: <20231006224726.443836-1-ahmed.zaki@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix the values of the ICE_AQ_VSI_Q_OPT_RSS_* registers. Shifting is
already done when the values are used, no need to double shift. Bug was
not discovered earlier since only ICE_AQ_VSI_Q_OPT_RSS_TPLZ (Zero) is
currently used.

Also, rename ICE_AQ_VSI_Q_OPT_RSS_XXX to ICE_AQ_VSI_Q_OPT_RSS_HASH_XXX
for consistency.

Fixes: 7bd527aa174f ("ice: Adjust naming for inner VLAN operations")
Co-developed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
Signed-off-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
Reviewed-by: Wojciech Drewek <wojciech.drewek@intel.com>
Signed-off-by: Ahmed Zaki <ahmed.zaki@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_adminq_cmd.h |  8 ++++----
 drivers/net/ethernet/intel/ice/ice_lib.c        |  4 ++--
 drivers/net/ethernet/intel/ice/ice_virtchnl.c   | 12 +++++-------
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h b/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h
index 51281b58ad72..56ec1897f4d8 100644
--- a/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h
+++ b/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h
@@ -491,10 +491,10 @@ struct ice_aqc_vsi_props {
 #define ICE_AQ_VSI_Q_OPT_RSS_GBL_LUT_M		(0xF << ICE_AQ_VSI_Q_OPT_RSS_GBL_LUT_S)
 #define ICE_AQ_VSI_Q_OPT_RSS_HASH_S		6
 #define ICE_AQ_VSI_Q_OPT_RSS_HASH_M		(0x3 << ICE_AQ_VSI_Q_OPT_RSS_HASH_S)
-#define ICE_AQ_VSI_Q_OPT_RSS_TPLZ		(0x0 << ICE_AQ_VSI_Q_OPT_RSS_HASH_S)
-#define ICE_AQ_VSI_Q_OPT_RSS_SYM_TPLZ		(0x1 << ICE_AQ_VSI_Q_OPT_RSS_HASH_S)
-#define ICE_AQ_VSI_Q_OPT_RSS_XOR		(0x2 << ICE_AQ_VSI_Q_OPT_RSS_HASH_S)
-#define ICE_AQ_VSI_Q_OPT_RSS_JHASH		(0x3 << ICE_AQ_VSI_Q_OPT_RSS_HASH_S)
+#define ICE_AQ_VSI_Q_OPT_RSS_HASH_TPLZ		0x0U
+#define ICE_AQ_VSI_Q_OPT_RSS_HASH_SYM_TPLZ	0x1U
+#define ICE_AQ_VSI_Q_OPT_RSS_HASH_XOR		0x2U
+#define ICE_AQ_VSI_Q_OPT_RSS_HASH_JHASH		0x3U
 	u8 q_opt_tc;
 #define ICE_AQ_VSI_Q_OPT_TC_OVR_S		0
 #define ICE_AQ_VSI_Q_OPT_TC_OVR_M		(0x1F << ICE_AQ_VSI_Q_OPT_TC_OVR_S)
diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
index acc3ffc940e7..1adf65d88ef0 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_lib.c
@@ -1186,12 +1186,12 @@ static void ice_set_rss_vsi_ctx(struct ice_vsi_ctx *ctxt, struct ice_vsi *vsi)
 	case ICE_VSI_PF:
 		/* PF VSI will inherit RSS instance of PF */
 		lut_type = ICE_AQ_VSI_Q_OPT_RSS_LUT_PF;
-		hash_type = ICE_AQ_VSI_Q_OPT_RSS_TPLZ;
+		hash_type = ICE_AQ_VSI_Q_OPT_RSS_HASH_TPLZ;
 		break;
 	case ICE_VSI_VF:
 		/* VF VSI will gets a small RSS table which is a VSI LUT type */
 		lut_type = ICE_AQ_VSI_Q_OPT_RSS_LUT_VSI;
-		hash_type = ICE_AQ_VSI_Q_OPT_RSS_TPLZ;
+		hash_type = ICE_AQ_VSI_Q_OPT_RSS_HASH_TPLZ;
 		break;
 	default:
 		dev_dbg(dev, "Unsupported VSI type %s\n",
diff --git a/drivers/net/ethernet/intel/ice/ice_virtchnl.c b/drivers/net/ethernet/intel/ice/ice_virtchnl.c
index 01e88b6e43a1..55bf7891981f 100644
--- a/drivers/net/ethernet/intel/ice/ice_virtchnl.c
+++ b/drivers/net/ethernet/intel/ice/ice_virtchnl.c
@@ -823,8 +823,8 @@ static int ice_vc_handle_rss_cfg(struct ice_vf *vf, u8 *msg, bool add)
 		int status;
 
 		lut_type = ICE_AQ_VSI_Q_OPT_RSS_LUT_VSI;
-		hash_type = add ? ICE_AQ_VSI_Q_OPT_RSS_XOR :
-				ICE_AQ_VSI_Q_OPT_RSS_TPLZ;
+		hash_type = add ? ICE_AQ_VSI_Q_OPT_RSS_HASH_XOR :
+				ICE_AQ_VSI_Q_OPT_RSS_HASH_TPLZ;
 
 		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 		if (!ctx) {
@@ -832,11 +832,9 @@ static int ice_vc_handle_rss_cfg(struct ice_vf *vf, u8 *msg, bool add)
 			goto error_param;
 		}
 
-		ctx->info.q_opt_rss = ((lut_type <<
-					ICE_AQ_VSI_Q_OPT_RSS_LUT_S) &
-				       ICE_AQ_VSI_Q_OPT_RSS_LUT_M) |
-				       (hash_type &
-					ICE_AQ_VSI_Q_OPT_RSS_HASH_M);
+		ctx->info.q_opt_rss =
+			FIELD_PREP(ICE_AQ_VSI_Q_OPT_RSS_LUT_M, lut_type) |
+			FIELD_PREP(ICE_AQ_VSI_Q_OPT_RSS_HASH_M, hash_type);
 
 		/* Preserve existing queueing option setting */
 		ctx->info.q_opt_rss |= (vsi->info.q_opt_rss &
-- 
2.34.1

