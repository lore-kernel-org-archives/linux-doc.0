Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEE2CA0FE2
	for <linux-doc@archiver.kernel.org>; Fri,  1 Sep 2023 00:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbjIAAFT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 31 Aug 2023 20:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbjIAAFS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Aug 2023 20:05:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713ECE67
        for <linux-doc@vger.kernel.org>; Thu, 31 Aug 2023 17:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693526715; x=1725062715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KDYhfCIQxGINYE/imu1aXKL2iojeCQ+R5QfboP5A/s0=;
  b=f17v/6MVegNuDyy2MC4V/BUuIKe+FkYfAI/B3WLo/XeU6ymqi05rMjcX
   iqRX92v8BBJcf4SawjWzTNHsk9dOh4nG0xtBGL7cF3ixmvVwELuQXlk/z
   XN61UCDMMACM5CmizoHCX3T6c9SDJ4aJGM0kpcDjUnxZR6cTUmC07E6l+
   FXMCue+44oNJu4haDVCjMe3L8kfFiy8Mnzwy2Xc8WnNDOEaePCYJo7ZF8
   p1JoKB7x6tkWCgMbvSu/rT+RgGsYRc6VAjf2vScnDqkCEqncaENaaIqrv
   4xzRH/Ns+Wb+LuS4yPzFBvl7OSK6pmsc5slHgUCStWn1uIwCCYLrUKdwd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375000990"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="375000990"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 17:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913485389"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="913485389"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Aug 2023 17:05:13 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qbrex-0000fn-0G;
        Fri, 01 Sep 2023 00:05:11 +0000
Date:   Fri, 1 Sep 2023 08:05:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Eduard Zingerman <eddyz87@gmail.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Daniel Borkmann <daniel@iogearbox.net>,
        linux-doc@vger.kernel.org
Subject: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
Message-ID: <202309010804.G3MpXo59-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf: Add description for CO-RE relocations
reproduce: (https://download.01.org/0day-ci/archive/20230901/202309010804.G3MpXo59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3MpXo59-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/bpf/btf.rst references a file that doesn't exist: Documentation/bpf/llvm_reloc
>> Warning: Documentation/bpf/llvm_reloc.rst references a file that doesn't exist: Documentation/bpf/btf

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
