Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD8DC433FE
	for <linux-doc@archiver.kernel.org>; Mon,  7 Nov 2022 17:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbiKGRdL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Nov 2022 12:33:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbiKGRdK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Nov 2022 12:33:10 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0977823EAC
        for <linux-doc@vger.kernel.org>; Mon,  7 Nov 2022 09:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667842390; x=1699378390;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XlCKGtfUOOsWZKAmOLbMdf7L0wmWwqYuF9wT5UroNEg=;
  b=m4W4O8kr0VFEoAdbC0L8hvw52biAAJel+XDv6mgQL+qhVG1QsmFtFg69
   DFVdLfucP6VYM4SosDeomrM19Y8aDBzpnohnYLuHi9V4QcXhfVyD+8Bb6
   /uEltQ/TVvzr+xFfS04zBHyyO/E5tyXLhd1FW34MC3YFtMHFykK/L92Jg
   Rd6RaO9a9BbEt5aNIWcgEuwaKSWpSnmFkhs3WXbVrTJkx/BIsDAtoqMRS
   OkTDp+oL9Te8MLq4o7Wu0LhhldXdU/pnWP7Ehk3n9kXAEOKwLsa6Osozf
   upIndzZ0NRTYy+c3hvXyM9fyPti+T6nBvPg8ovXrWvaeN+ImqhmJ4ZE+r
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308096792"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="308096792"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 09:32:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="630568315"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="630568315"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 09:32:58 -0800
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-doc@vger.kernel.org
Cc:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/3] Documentation/gpu: reduce verbosity in toc
Date:   Mon,  7 Nov 2022 09:32:06 -0800
Message-Id: <20221107173209.2219571-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Checking some issues I was having i915 doc made me look at the toc for
Documentation/gpu. I think it's too hard to read when extending the toc
all levels for each driver. Reduce it to maxdepth=2.

Also fix the usage-stats section appearing in the wrong place.

Lucas De Marchi (3):
  Documentation/gpu: Fix section in the wrong scope
  Documentation/gpu: Limit index to maxdepth=2
  Documentation/gpu: Limit drivers index to maxdepth=2

 Documentation/gpu/drivers.rst         | 1 +
 Documentation/gpu/drm-usage-stats.rst | 1 -
 Documentation/gpu/index.rst           | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.38.1

