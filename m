Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F7AC61DA4
	for <linux-doc@archiver.kernel.org>; Fri,  3 Mar 2023 22:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbjCCWwm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Mar 2023 17:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbjCCWwk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 17:52:40 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C2D23653
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 14:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677883933; x=1709419933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LJMM/M/VXIyk7Ttka26UbAX7Rb43ih+T7QK7jhtVmXw=;
  b=XRQJMpK+6wDfL8n4l0yt1zKnc8M30eoCt2QHhMdz8dJh/w6MGhptGMG4
   5CoV9T7fT0/Qpao7b9NY/308nN15M4bJP42YO37C6+usEcsFJQ8yOqmTc
   fOvCRpjEA0RI/9q/SxKnc3r9EHi4ZKf4KH9Vug0dR+4VR7C+LJXEkn8tR
   A6eDEF+ldFZzYMYLtqUMxtb7DBABorU3wYUTjPRAIVcbycY3X9oTi0iCN
   xWBfim3TdhsmmyvSkS+/fEz96all5//Aqv6a8cmLYLX7b9TAWDfhh3F51
   D77recZwZXSz+cMExhyAlJF8fNFfO1u7mq50ELBi9anhCwR1XCEArUPYs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="333900937"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="333900937"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 14:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="668810371"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="668810371"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2023 14:49:28 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pYEDP-0001ho-0i;
        Fri, 03 Mar 2023 22:49:27 +0000
Date:   Sat, 4 Mar 2023 06:49:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [jgunthorpe:iommufd_hwpt 25/43] htmldocs:
 Documentation/userspace-api/iommufd:184:
 ./drivers/iommu/iommufd/device.c:580: WARNING: Definition list ends without
 a blank line; unexpected unindent.
Message-ID: <202303040633.TQNPbc3e-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/jgunthorpe/linux iommufd_hwpt
head:   d3282ba3ccf913d4b7fc93ad8b3c2f27927d8b68
commit: 5cccd4abc87354ab4ba694936b4f9a123c32749f [25/43] iommufd: Add iommufd_device_replace()
reproduce:
        # https://github.com/jgunthorpe/linux/commit/5cccd4abc87354ab4ba694936b4f9a123c32749f
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd_hwpt
        git checkout 5cccd4abc87354ab4ba694936b4f9a123c32749f
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303040633.TQNPbc3e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/iommufd:184: ./drivers/iommu/iommufd/device.c:580: WARNING: Definition list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
