Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1111AC77B7A
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 00:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjE3Akv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 May 2023 20:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjE3Aku (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 May 2023 20:40:50 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B046AC7
        for <linux-doc@vger.kernel.org>; Mon, 29 May 2023 17:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685407249; x=1716943249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xsbY3V5Q4anW8sVEiwWuOq9O52ybYNRkM3msyin3Sdw=;
  b=U3e0mtIUKjVpK6QlsflRdvWW7VG4mv33j9K5Hq9WSjkJiliuASb/l1XF
   ShXIMozR7AOThaTd0nl0WwYyBFlZuQkzsKLBWkS01FMjCNbZ01wnbuWCC
   tlfkuNQrFbcJ1dH7+ULHsozH+19pOQ9xVhHtpNQG8H/3ojdjyj6+1DMX4
   aFm0LJub87aQ+YN92Dt72XxYPA5/LU+eHHj9icINAEtfYPWiH8Nhdn3c4
   kyu461BtE4u3hQe+0jW53AkMtywpbTqNZ+62wlsM1Z8Fvqo9fejovynbL
   zOFI9iPvRgRDlnsx9QKqjujDxvTkYUhu5pd2AkchqdIpKRdE4EsriAFJg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="358039716"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="358039716"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 17:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="709427243"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="709427243"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 May 2023 17:40:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q3nPq-000LCI-1Y;
        Tue, 30 May 2023 00:40:46 +0000
Date:   Tue, 30 May 2023 08:40:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     oe-kbuild-all@lists.linux.dev, Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>, linux-doc@vger.kernel.org
Subject: [jgunthorpe:iommufd_hwpt 27/33] htmldocs:
 Documentation/userspace-api/iommufd:184:
 ./drivers/iommu/iommufd/device.c:614: WARNING: Definition list ends without
 a blank line; unexpected unindent.
Message-ID: <202305300848.8s7UFUln-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/jgunthorpe/linux iommufd_hwpt
head:   3556b57302b5cf741aafa42b1c05dbcd39e92d89
commit: ada6bf92fd813584c7482059e5618acdc1243745 [27/33] iommufd: Add iommufd_device_replace()
reproduce:
        # https://github.com/jgunthorpe/linux/commit/ada6bf92fd813584c7482059e5618acdc1243745
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd_hwpt
        git checkout ada6bf92fd813584c7482059e5618acdc1243745
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300848.8s7UFUln-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/iommufd:184: ./drivers/iommu/iommufd/device.c:614: WARNING: Definition list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
