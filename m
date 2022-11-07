Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B87C43217
	for <linux-doc@archiver.kernel.org>; Mon,  7 Nov 2022 17:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbiKGRdO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Nov 2022 12:33:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbiKGRdL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Nov 2022 12:33:11 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7021923EAC
        for <linux-doc@vger.kernel.org>; Mon,  7 Nov 2022 09:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667842391; x=1699378391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KODMlnwV/QFHCCKxEIsZ/8aNUnTgN8JpQxZph3w8T2E=;
  b=iIZFQndc1574OMHfa/4JhFLuEtVZO/1cI7p+vzc2CggpnwS12NfqXPIr
   Hu6AVLQATjFmtNevyK05mIS9GfdMf38krjnTIgeDM2XtNCjljqMa4YbRC
   6OmtAz1bMbMKL+7pvQF9D09F31sbgTrKzVVR/OKwgTby9IDD8lWYvE4yS
   ESukfwA+A2THrRanH9O490en4h4wh5A/GT7ZFWKd+MIbJuN9XClTdajGS
   wh2SK/ljgWBKh5AwRkGBhdjYnL60I64h/uwHRAxxODs4XSYjG8JSs+Zr8
   qfmHYSLjNvC3LpltWE3OsFy0O4a2vRQKEzlXtiAkKO5HPWZ4Sxg90Rz5C
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308096802"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="308096802"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 09:32:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="630568325"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="630568325"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 09:32:58 -0800
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-doc@vger.kernel.org
Cc:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/3] Documentation/gpu: Limit drivers index to maxdepth=2
Date:   Mon,  7 Nov 2022 09:32:09 -0800
Message-Id: <20221107173209.2219571-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107173209.2219571-1-lucas.demarchi@intel.com>
References: <20221107173209.2219571-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just like the main index, the page generated is very verbose if all the
internal details of each driver is included.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/drivers.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 3a52f48215a3..a36ec133b123 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -3,6 +3,7 @@ GPU Driver Documentation
 ========================
 
 .. toctree::
+   :maxdepth: 2
 
    amdgpu/index
    i915
-- 
2.38.1

