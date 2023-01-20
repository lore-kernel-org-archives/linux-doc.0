Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA4DC004D4
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 02:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjATCsY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 21:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjATCsX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 21:48:23 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D559B133
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 18:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674182878; x=1705718878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/KzAjTS4G6i6y2zqmDHDoIbbTnC/2ix6fy2H2gIATVo=;
  b=AZT0BgUkupQA7KVLU3HFmSjrLZIsJRmAo5avwiB2tfO8x388ZH7AIyNj
   oKfoUwBbD/0SzmIIjYskKY9AdodItuqVtEIgR8IRby88xRNiZsTM9CWOm
   z6wUChENanpSHuimvUC7ARIhF1Uux7TKiGlEcXFCVjYwnnorgbaYsmkiY
   2eb1lWhEqiGHgwYuK9ake1x71YT9afRkM6lOqdO2xIWLkGLIolpAQgicH
   HoHhOw61el5WPeV0AVtX7UwssZXtbNcMtoggxc6KbxMqO9XH9GHZZaLBF
   IBfdW6zMSBSV2oCtLj7ECAAsFfaiK3/pV3H9Bl+Dz4k4+I7S+7ymlPA8A
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323184896"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="323184896"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 18:47:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="768536482"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="768536482"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2023 18:47:36 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pIhRH-00026q-1c;
        Fri, 20 Jan 2023 02:47:35 +0000
Date:   Fri, 20 Jan 2023 10:46:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ofir Bitton <obitton@habana.ai>
Cc:     oe-kbuild-all@lists.linux.dev, Oded Gabbay <ogabbay@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [ogabbay:habanalabs-next 60/71] htmldocs:
 Documentation/ABI/testing/sysfs-driver-habanalabs:201: WARNING: Unexpected
 indentation.
Message-ID: <202301201050.nZkYhbBo-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git habanalabs-next
head:   f65c5dac2073222b2836f0ca1fcaa989fe36245a
commit: 0a14c331682f615246a075aa4386317cceceaed0 [60/71] habanalabs: update device status sysfs documentation
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git/commit/?id=0a14c331682f615246a075aa4386317cceceaed0
        git remote add ogabbay https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git
        git fetch --no-tags ogabbay habanalabs-next
        git checkout 0a14c331682f615246a075aa4386317cceceaed0
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-driver-habanalabs:201: WARNING: Unexpected indentation.
>> Documentation/ABI/testing/sysfs-driver-habanalabs:201: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +201 Documentation/ABI/testing/sysfs-driver-habanalabs

6457271f64a2b6 Ofir Bitton 2022-08-03  184  
d91389bc839d72 Oded Gabbay 2019-02-16  185  What:           /sys/class/habanalabs/hl<n>/soft_reset
d91389bc839d72 Oded Gabbay 2019-02-16  186  Date:           Jan 2019
d91389bc839d72 Oded Gabbay 2019-02-16  187  KernelVersion:  5.1
2f8db5a1754416 Oded Gabbay 2021-01-12  188  Contact:        ogabbay@kernel.org
d91389bc839d72 Oded Gabbay 2019-02-16  189  Description:    Interface to trigger a soft-reset operation for the device.
d91389bc839d72 Oded Gabbay 2019-02-16  190                  Soft-reset will reset only the compute and DMA engines of the
d91389bc839d72 Oded Gabbay 2019-02-16  191                  device
d91389bc839d72 Oded Gabbay 2019-02-16  192  
d91389bc839d72 Oded Gabbay 2019-02-16  193  What:           /sys/class/habanalabs/hl<n>/soft_reset_cnt
d91389bc839d72 Oded Gabbay 2019-02-16  194  Date:           Jan 2019
d91389bc839d72 Oded Gabbay 2019-02-16  195  KernelVersion:  5.1
2f8db5a1754416 Oded Gabbay 2021-01-12  196  Contact:        ogabbay@kernel.org
d91389bc839d72 Oded Gabbay 2019-02-16  197  Description:    Displays how many times the device have undergone a soft-reset
d91389bc839d72 Oded Gabbay 2019-02-16  198                  operation since the driver was loaded
d91389bc839d72 Oded Gabbay 2019-02-16  199  
d91389bc839d72 Oded Gabbay 2019-02-16  200  What:           /sys/class/habanalabs/hl<n>/status
d91389bc839d72 Oded Gabbay 2019-02-16 @201  Date:           Jan 2019
d91389bc839d72 Oded Gabbay 2019-02-16  202  KernelVersion:  5.1
2f8db5a1754416 Oded Gabbay 2021-01-12  203  Contact:        ogabbay@kernel.org
0a14c331682f61 Ofir Bitton 2023-01-10  204  Description:    Status of the card:
0a14c331682f61 Ofir Bitton 2023-01-10  205                  "operational" - Device is available for work.
0a14c331682f61 Ofir Bitton 2023-01-10  206                  "in reset" - Device is going through reset, will be available
0a14c331682f61 Ofir Bitton 2023-01-10  207                          shortly.
0a14c331682f61 Ofir Bitton 2023-01-10  208                  "disabled" - Device is not usable.
0a14c331682f61 Ofir Bitton 2023-01-10  209                  "needs reset" - Device is not usable until a hard reset will
0a14c331682f61 Ofir Bitton 2023-01-10  210                          be initiated.
0a14c331682f61 Ofir Bitton 2023-01-10  211                  "in device creation" - Device is not available yet, as it is
0a14c331682f61 Ofir Bitton 2023-01-10  212                          still initializing.
0a14c331682f61 Ofir Bitton 2023-01-10  213                  "in reset after device release" - Device is going through
0a14c331682f61 Ofir Bitton 2023-01-10  214                          a compute-reset which is executed after a device release
0a14c331682f61 Ofir Bitton 2023-01-10  215                          (relevant for Gaudi2 only).
d91389bc839d72 Oded Gabbay 2019-02-16  216  

:::::: The code at line 201 was first introduced by commit
:::::: d91389bc839d724cd8df7ca308dde97beca9b0c5 habanalabs: add sysfs and hwmon support

:::::: TO: Oded Gabbay <oded.gabbay@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
