Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADE2E81E18
	for <linux-doc@archiver.kernel.org>; Mon,  9 Oct 2023 22:29:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378804AbjJIW3a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Oct 2023 18:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378146AbjJIW33 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 18:29:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F69B9D;
        Mon,  9 Oct 2023 15:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696890568; x=1728426568;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qn02x6oNIDv29hbmsU6QjRTEVE9qGBnpzwd3mHYtNk8=;
  b=WICota2Gw3js9PY/RigIuaIRAx/CxEJlE5/2/UqMZb4vgqxsCT0vxI9R
   jdy/XPCfZzI5wzkplQedvvdj0X03VLYjcs1jx9+Br2Uxvstv3iJFGZsSV
   S9yNrJQkzmduJfVhjCsrOiyBGiNNDpk3MPmh5by28bzY7VSvDgU6gqMz0
   cZ/WJiR3P8qNlaH5rDPly7TPc4Tm4IQQIpGXYhE72Jn8FMpnTS27F8+8T
   XmDWknIYg/tulWr9hLLHwMUQpGRzmp9gzIG6Uzrvd0ddOu3E/Q0j8t+Rw
   C9SiZpMyVPXFWSSSX0QqapIz87/A98AWhKYjXztfBWxXj5rfuMWjWkVk6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2849383"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="2849383"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 15:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="843876572"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="843876572"
Received: from amlin-018-114.igk.intel.com ([10.102.18.114])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Oct 2023 15:28:47 -0700
From:   Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
To:     netdev@vger.kernel.org
Cc:     vadim.fedorenko@linux.dev, jiri@resnulli.us, corbet@lwn.net,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Subject: [PATCH net-next v4 0/5] dpll: add phase-offset and phase-adjust
Date:   Tue, 10 Oct 2023 00:26:11 +0200
Message-Id: <20231009222616.12163-1-arkadiusz.kubalewski@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Improve monitoring and control over dpll devices.
Allow user to receive measurement of phase difference between signals
on pin and dpll (phase-offset).
Allow user to receive and control adjustable value of pin's signal
phase (phase-adjust).

v3->v4:
- do not increase do version of uAPI header as it is not needed (v3 did
  not have this change)
- fix spelling around commit messages, argument descriptions and docs
- add missing extack errors on failure set callbacks for pin phase
  adjust and frequency
- remove ice check if value is already set, now redundant as checked in
  the dpll subsystem

v2->v3:
- do not increase do version of uAPI header as it is not needed

v1->v2:
- improve handling for error case of requesting the phase adjust set
- align handling for error case of frequency set request with the
approach introduced for phase adjust


Arkadiusz Kubalewski (5):
  dpll: docs: add support for pin signal phase offset/adjust
  dpll: spec: add support for pin-dpll signal phase offset/adjust
  dpll: netlink/core: add support for pin-dpll signal phase
    offset/adjust
  ice: dpll: implement phase related callbacks
  dpll: netlink/core: change pin frequency set behavior

 Documentation/driver-api/dpll.rst         |  53 +++++-
 Documentation/netlink/specs/dpll.yaml     |  31 +++
 drivers/dpll/dpll_netlink.c               | 188 +++++++++++++++++-
 drivers/dpll/dpll_nl.c                    |   8 +-
 drivers/dpll/dpll_nl.h                    |   2 +-
 drivers/net/ethernet/intel/ice/ice_dpll.c | 220 +++++++++++++++++++++-
 drivers/net/ethernet/intel/ice/ice_dpll.h |  10 +-
 include/linux/dpll.h                      |  18 ++
 include/uapi/linux/dpll.h                 |   6 +
 9 files changed, 518 insertions(+), 18 deletions(-)

-- 
2.38.1

