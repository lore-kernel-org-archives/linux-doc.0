Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D3EC7EE22
	for <linux-doc@archiver.kernel.org>; Wed, 10 May 2023 13:02:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236900AbjEJNCb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 May 2023 09:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236681AbjEJNCa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 May 2023 09:02:30 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31D110D0
        for <linux-doc@vger.kernel.org>; Wed, 10 May 2023 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683723749; x=1715259749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=90kq/cIbU+pJu67FzgQIR0hL/LPFhqMpXuCALzU2fVE=;
  b=iXM5NY05xpL+3nrhqmE2loUJBEb9g5wKySXxbirYjnAIlkQaqotQzAQe
   hWkXOpCi+hJPsYcAAvgM/1pdeIvZH2mF+PPlnxRTDil0LaTHO8PpyeIGq
   dtqXGYmSqjvtmXgmRmDLTE4BOkqxpTcuB6LQ53YjXJHGuOZWDmqazQKxK
   qir/D4WdyIEE1yZw6YJpQ4xmz1jmXyrDSQ94YpWbR4H+/QHe8NBgFbfxb
   7BX/8wLmouBTuN+ppu6Tt2WY+Lj8QM9apb3TWQjdzbbRPeLOSx2p+GLKT
   jYM8vqvZYi75hvbqAD4tSWYl+JPD6LT9dBBrDpvbbWag05WqVAvqW08IY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="329825867"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="329825867"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 06:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="945687573"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="945687573"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 May 2023 06:01:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pwjRj-0003Iu-08;
        Wed, 10 May 2023 13:01:31 +0000
Date:   Wed, 10 May 2023 21:00:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     oe-kbuild-all@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [arm:csi-v6 2/7] htmldocs: Warning: drivers/media/i2c/imx219-rmk.c
 references a file that doesn't exist:
 Documentation/media/uapi/v4l/dev-subdev.rst
Message-ID: <202305102002.PAxDivwy-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git csi-v6
head:   bddf95ecbbc88a20d81a76a2b01a809c36020679
commit: b563a36455a1b3fa9af3ac8e0ccaed687731e485 [2/7] media: i2c: imx219 camera driver
reproduce:
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm csi-v6
        git checkout b563a36455a1b3fa9af3ac8e0ccaed687731e485
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305102002.PAxDivwy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/i2c/imx219-rmk.c references a file that doesn't exist: Documentation/media/uapi/v4l/dev-subdev.rst
>> Warning: drivers/media/i2c/imx219-rmk.c references a file that doesn't exist: Documentation/media/uapi/v4l/vidioc-g-selection.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
