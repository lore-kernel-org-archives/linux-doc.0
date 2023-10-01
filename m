Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E49E748E9
	for <linux-doc@archiver.kernel.org>; Sun,  1 Oct 2023 07:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234402AbjJAHu5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 1 Oct 2023 03:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234371AbjJAHu5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 1 Oct 2023 03:50:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E860FC2
        for <linux-doc@vger.kernel.org>; Sun,  1 Oct 2023 00:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696146656; x=1727682656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qpFj19NS0Pw7y+Jf2oTPugSwHCa4o/JdBIZLshbTYHE=;
  b=DPEPPgx8xuOPJ6dVzj6ajg7uB6dHnLinhKJZ967Ut0QF194Vf76jIOFk
   tdMHedKgv/rgcqrJIT4FU2SD+4GQUREJ8tHuPXh/H+/e6ghcbfr37siiB
   ajqxzK6lsmSgExYW1cCmCc006AODC/387Bp3smuEZ65ITp0D+Vls8Mwh/
   jjWy7soKR59iYuYqvJVsscxwv73IVsaAEN694orjytH/lGPQ3uN/HP2An
   EJ+0CRQMe3VvJK85UyZxfl8xFDDq+BdfEBmg1d8GPOAPZ3XsVfKQq8672
   AtsjPAo85cki7RLHfS3ddIePiB9DHd3QEZvqBeXLhs5b/tOefEVnfQJtx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="361880718"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="361880718"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 00:50:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="785492151"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="785492151"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 01 Oct 2023 00:50:53 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qmrE2-0004tq-2d;
        Sun, 01 Oct 2023 07:50:50 +0000
Date:   Sun, 1 Oct 2023 15:50:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc:     oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-doc@vger.kernel.org
Subject: [hverkuil-media-tree:for-v6.7j 219/221] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-ctrl-type-visconti-isp (if the link has no caption the label must
 precede a section header)
Message-ID: <202310011556.lmxI2mjT-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.7j
head:   2f3d32703cd6355a1c45254602a3929daa0492d6
commit: a2ef312be806773e60f58c0ebfc2fe3a34275b62 [219/221] media: add V4L2 vendor specific control handlers
reproduce: (https://download.01.org/0day-ci/archive/20231001/202310011556.lmxI2mjT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310011556.lmxI2mjT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-visconti-isp (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
