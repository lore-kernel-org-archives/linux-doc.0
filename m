Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B42C4332F
	for <linux-doc@archiver.kernel.org>; Mon,  7 Nov 2022 17:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbiKGRdM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Nov 2022 12:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbiKGRdL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Nov 2022 12:33:11 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71071F9FC
        for <linux-doc@vger.kernel.org>; Mon,  7 Nov 2022 09:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667842390; x=1699378390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GHPk9xqpYWmnySxynr7NduvhEBCfEm3hDibv2rvryPc=;
  b=et/Xia/VPytgdDj2auhKa5W/hTXSk54ZEq+bJ3AUrSOp6I3ub7B3dDIg
   Ko/Zcj7tIbdmrXEo3Gu09nGjCLrZ9MtFHA5jHcn5Dz7s1zztX6EcjZPtL
   jyGK4YoEbHUnAgmt66K/4AlkvVJlArOgbBSGxEEV2Dlbza1/lILAhotob
   jw2oo98onGdaqe5ZcpjTDzrnWROzaE6vZORUcNCFoPD3vUxjX4THSNT06
   uwwaubKpPi+YFdygt7CYoO9S6ErVcqXCin6C4flGoEg7bkOgnccgsvdtJ
   NJr4SpNb8Cncbdqnp2Iv0XaSm5exQx2HB8YlmvL1E4VXgCoYctIg78GMp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308096794"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="308096794"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 09:32:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="630568319"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="630568319"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 09:32:58 -0800
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-doc@vger.kernel.org
Cc:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/3] Documentation/gpu: Fix section in the wrong scope
Date:   Mon,  7 Nov 2022 09:32:07 -0800
Message-Id: <20221107173209.2219571-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107173209.2219571-1-lucas.demarchi@intel.com>
References: <20221107173209.2219571-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

That section should still be inside "DRM client usage stats" rather than
as a sibling.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/drm-usage-stats.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 92c5117368d7..b46327356e80 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -126,7 +126,6 @@ percentage utilization of the engine, whereas drm-engine-<str> only reflects
 time active without considering what frequency the engine is operating as a
 percentage of it's maximum frequency.
 
-===============================
 Driver specific implementations
 ===============================
 
-- 
2.38.1

