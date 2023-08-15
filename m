Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681BDC001B0
	for <linux-doc@archiver.kernel.org>; Tue, 15 Aug 2023 21:48:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238894AbjHOVrg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Aug 2023 17:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240278AbjHOVrQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Aug 2023 17:47:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A2F1FC3
        for <linux-doc@vger.kernel.org>; Tue, 15 Aug 2023 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692136036; x=1723672036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1s4RnkKZRmjxzcjBk3GgrgM4OPxoBuqBpZBQk6chlUY=;
  b=Xcnw6wv9N37VzROPFfB9LI3EMrH4BsHbzg86KpW2g+hz6G1OtJnUXu3M
   GbJzjV8uA/VcZIZsyDmdSdHbw4/QMuoYuvvgCTMjz8WZ7dY4Pki9ZSKvo
   3ymDcsSs8DULFKGi0YbLiX/DZOGOhxusS+5y7gwaVFMJ5TIkZy3ccadmT
   b1forjxn8jh3dMelNa6dkEs3JxDDMxgF7FmYov6iv5VxvnuIwEArO/acY
   uO7v2Y4bkdwOCWFpJGxgcEDGmrGXIxfOKX6iYAtp+bbjLTbc/M/iilgvv
   hUU/QIcVdfICUq2Cy23IlTboXPFCugjWNDl1eLxmyyBLvGPFStoIJUvKY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403363667"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="403363667"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 14:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="768967398"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="768967398"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Aug 2023 14:47:13 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qW1se-0001Fp-08;
        Tue, 15 Aug 2023 21:47:12 +0000
Date:   Wed, 16 Aug 2023 05:46:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [davejiang:cxl-ide 20/24] htmldocs:
 Documentation/driver-api/acpi/keyp.rst: WARNING: document isn't included in
 any toctree
Message-ID: <202308160511.yQu2B5co-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   a43b30b80446a307847711c68ed284729a3e4cdb
commit: 41909be2f957ba387c3b58c4dd2207758774cb63 [20/24] acpi: Add KEYP documentation
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160511.yQu2B5co-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160511.yQu2B5co-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/acpi/keyp.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
