Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741C6C6FD19
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 15:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjCPPKE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Mar 2023 11:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbjCPPJz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Mar 2023 11:09:55 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898173252C
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 08:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678979394; x=1710515394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eOV/ldQx3xWA9S+utd9+eO0S2mmhiPUV0nhprHPp4bM=;
  b=H0SdlfK4cHqY0gWlHghUvm/jpxL7ngRnloiaimWVHu6uVncVR+wnuewc
   Y15CmxDPCMsTz/aAnESD6Ab4RpSbDEprBWWZsiF05XfjNdF/MNbU16sDm
   Cy31wJNQZnAZpg+jHQvVUKIEpZiKPpa9Xtxb631MS5MOyzX37DGblpsYp
   i7kdCKf2C/e4zlkCwmeNrhRDYwZPd6DuWCWvj9isIbOTFeASYRkfAj42k
   zMOeKCztf8Fp/i1sbI3sOU2EIklaH4xp8dCfUp+jgeJSwJ3oBxFMAcB1Z
   mEF3eYxhpY7ZIk3Apx95qxmbpzWRg1+qI1HxUwKA5hJtiMQkVlKI34qKm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="339561204"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="339561204"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 08:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="679930012"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="679930012"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Mar 2023 08:09:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pcpES-0008as-2b;
        Thu, 16 Mar 2023 15:09:32 +0000
Date:   Thu, 16 Mar 2023 23:09:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: [akpm-mm:mm-nonmm-unstable 23/26] htmldocs:
 Documentation/ELF/ELF.rst: WARNING: document isn't included in any toctree
Message-ID: <202303162342.blXLNoBi-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   ad1ba07b8ea42d34d4b48e960bae2ecb35d95bba
commit: 60b38b7cbb295d7914ca4a6e6cbe1f32b234c830 [23/26] ELF: document some de-facto PT_* ABI quirks
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=60b38b7cbb295d7914ca4a6e6cbe1f32b234c830
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-nonmm-unstable
        git checkout 60b38b7cbb295d7914ca4a6e6cbe1f32b234c830
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303162342.blXLNoBi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ELF/ELF.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
