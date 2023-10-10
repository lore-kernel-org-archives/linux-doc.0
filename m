Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751BCCD8CB4
	for <linux-doc@archiver.kernel.org>; Tue, 10 Oct 2023 20:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234411AbjJJUHb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Oct 2023 16:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234473AbjJJUHR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Oct 2023 16:07:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7733F18A;
        Tue, 10 Oct 2023 13:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696968314; x=1728504314;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H9zuVNck3hbzlM+dU23Xf2FfdQjpTlHZ5OUi9JbqeCM=;
  b=iSslj0oBI70rBCe99hRypONITrZMaH+G2Fw36Yc1gvsm/3Ye/fafrTsD
   YS0cEpV9r5I7sc8QBUtNkMBkI2l3zYwC/udYDrr3Aiqt0137xH2YtfGeF
   uIY5QJgbzZxyvMwODHIzTdzd9NgW43WCPvZYO3ZKuY36i/9p+H2BFa7/M
   DC/1DAkuRbqhDx6aEQJbBn5RiRA8CWAPwal6rklfUc7LSt4EKa9gJXi01
   6cg6l8TtwcyI5/WKFdUQF3LcjtiJ3RqIBGg7DRTMkyRygmT+wcxGNLP1g
   EUIHAw/x//xk1iz92+0xwnxXxS0FT2pgWki5/fUx8QzW4+bRTA5GFW1hD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374839989"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="374839989"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 13:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="1000819864"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="1000819864"
Received: from rhaeussl-mobl.ger.corp.intel.com (HELO azaki-desk1.intel.com) ([10.252.42.107])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 13:04:49 -0700
From:   Ahmed Zaki <ahmed.zaki@intel.com>
To:     netdev@vger.kernel.org
Cc:     intel-wired-lan@lists.osuosl.org, corbet@lwn.net,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, vladimir.oltean@nxp.com, andrew@lunn.ch,
        horms@kernel.org, mkubecek@suse.cz,
        willemdebruijn.kernel@gmail.com, linux-doc@vger.kernel.org,
        Ahmed Zaki <ahmed.zaki@intel.com>
Subject: [PATCH net-next v3 0/6] Support symmetric RSS (Toeplitz) hash
Date:   Tue, 10 Oct 2023 14:04:31 -0600
Message-Id: <20231010200437.9794-1-ahmed.zaki@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Patch 1 adds the support at the Kernel level, allowing the user to set a
symmetric RSS hash for any flow type via:

    # ethtool -N|-U eth0 rx-flow-hash <flow_type> s|d|f|n symmetric-xor

Support for the new "symmetric-xor" flag will be later sent to the
"ethtool" user-space tool.

Patch 2 fixes a long standing bug with the register values. The bug has
been benign for now since only (asymmetric) Toeplitz hash (Zero) has been
used.

Patches 3 and 4 lay some groundwork refactoring. While the first is
mainly cosmetic, the second is needed since there is no more room in the
previous 64-bit RSS profile ID for the symmetric attribute introduced in 
the next patch.

Finally, patches 5 and 6 add the symmetric Toeplitz support for the ice 
(E800 PFs) and the iAVF drivers.

---
v3: rename "symmetric" to "symmetric-xor" and drop "Fixes" tag in patch 2.
v2: fixed a "Reviewed by" to "Reviewed-by", also need to cc maintainers.

Ahmed Zaki (4):
  net: ethtool: allow symmetric-xor RSS hash for any flow type
  ice: fix ICE_AQ_VSI_Q_OPT_RSS_* register values
  ice: refactor the FD and RSS flow ID generation
  iavf: enable symmetric RSS Toeplitz hash

Jeff Guo (1):
  ice: enable symmetric RSS Toeplitz hash for any flow type

Qi Zhang (1):
  ice: refactor RSS configuration

 Documentation/networking/scaling.rst          |   6 +
 .../net/ethernet/intel/iavf/iavf_adv_rss.c    |   8 +-
 .../net/ethernet/intel/iavf/iavf_adv_rss.h    |   3 +-
 .../net/ethernet/intel/iavf/iavf_ethtool.c    |  22 +-
 drivers/net/ethernet/intel/ice/ice.h          |   2 +
 .../net/ethernet/intel/ice/ice_adminq_cmd.h   |   8 +-
 drivers/net/ethernet/intel/ice/ice_common.h   |   1 +
 drivers/net/ethernet/intel/ice/ice_ethtool.c  |  14 +-
 .../net/ethernet/intel/ice/ice_ethtool_fdir.c |  35 +-
 .../net/ethernet/intel/ice/ice_flex_pipe.c    |  43 +-
 .../net/ethernet/intel/ice/ice_flex_pipe.h    |   4 +-
 .../net/ethernet/intel/ice/ice_flex_type.h    |   7 +
 drivers/net/ethernet/intel/ice/ice_flow.c     | 439 +++++++++++++-----
 drivers/net/ethernet/intel/ice/ice_flow.h     |  46 +-
 .../net/ethernet/intel/ice/ice_hw_autogen.h   |   4 +
 drivers/net/ethernet/intel/ice/ice_lib.c      | 117 ++---
 drivers/net/ethernet/intel/ice/ice_main.c     |  49 +-
 drivers/net/ethernet/intel/ice/ice_type.h     |   1 +
 drivers/net/ethernet/intel/ice/ice_virtchnl.c |  55 ++-
 .../ethernet/intel/ice/ice_virtchnl_fdir.c    |  35 +-
 include/linux/avf/virtchnl.h                  |  16 +-
 include/uapi/linux/ethtool.h                  |  17 +-
 net/ethtool/ioctl.c                           |  11 +
 23 files changed, 637 insertions(+), 306 deletions(-)

-- 
2.34.1

