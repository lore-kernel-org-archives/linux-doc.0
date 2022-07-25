Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56511C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 20:56:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiGYU4j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 16:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbiGYU4i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 16:56:38 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E98222BF2;
        Mon, 25 Jul 2022 13:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658782597; x=1690318597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9xVSixPsZx3n7XPRlkOSZ8exLMudRDJcJEqe18N/3Vc=;
  b=cx+Q47YGhgDUPLZYU+X2RfJArCc5OnDsWWDCOC0q8LFg9jtSx7tzeH2a
   uxhUJiolfM4C6S6kz6JKx47o79yZnYBjPOtdW5J/x8nAPlXjUfCPp/ZT/
   n5citEmgebI1UtdE1EQ+mMlwEnd6ImfBRfdzIkvj3MoO5Hv78+36oImtU
   LTicPMiVNwxfyWE650vx51qTMeIQBHR5UafbBQueI9jnXuKNo/uS0FKC2
   RMKeE1oouPz7r+6at77QxVO2+wQnqlDES1zUrZh5GyxF3JRl1AlbsKBD0
   SX0C6ZKaFIw3UZx+3O1KtW+iYwA8DpJnqDu/wpR2AniU9BYIoS3A3XseJ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="267564331"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="267564331"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 13:56:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="689191014"
Received: from jekeller-desk.amr.corp.intel.com ([10.166.241.7])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 13:56:36 -0700
From:   Jacob Keller <jacob.e.keller@intel.com>
To:     netdev@vger.kernel.org
Cc:     Jacob Keller <jacob.e.keller@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        David Ahern <dsahern@kernel.org>,
        Stephen Hemminger <stephen@networkplumber.org>,
        linux-doc@vger.kernel.org
Subject: [net-next v3 1/4] devlink: add missing kdoc for overwrite mask
Date:   Mon, 25 Jul 2022 13:56:26 -0700
Message-Id: <20220725205629.3993766-2-jacob.e.keller@intel.com>
X-Mailer: git-send-email 2.37.1.208.ge72d93e88cb2
In-Reply-To: <20220725205629.3993766-1-jacob.e.keller@intel.com>
References: <20220725205629.3993766-1-jacob.e.keller@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

commit 5d5b4128c4ca ("devlink: introduce flash update overwrite mask")
failed to document the overwrite_mask parameter of the
devlink_flash_update_params structure. Fix this.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
Fixes: 5d5b4128c4ca ("devlink: introduce flash update overwrite mask")
---
Changes since v2
* Split this change out to its own patch

 include/net/devlink.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/net/devlink.h b/include/net/devlink.h
index 780744b550b8..e2c530b2b67d 100644
--- a/include/net/devlink.h
+++ b/include/net/devlink.h
@@ -613,6 +613,7 @@ enum devlink_param_generic_id {
  * struct devlink_flash_update_params - Flash Update parameters
  * @fw: pointer to the firmware data to update from
  * @component: the flash component to update
+ * @overwrite_mask: what sections of flash can be overwritten
  *
  * With the exception of fw, drivers must opt-in to parameters by
  * setting the appropriate bit in the supported_flash_update_params field in
-- 
2.35.1.456.ga9c7032d4631

