Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBD6C43334
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 22:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbiGFW1G (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 18:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbiGFW1F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 18:27:05 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5EDD2AE34
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 15:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657146424; x=1688682424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WsBMruj58sYI6v224uOFJcG1bNiWcNXU4u7ozS7fwVM=;
  b=g9RFIRshv53+HJlCV0yp/MZE3GHYGorIb9z/wOQlwcXvS2PVH3SZR0Ve
   6kiQyMfkYSYZFcscLA4FvBYoaIO9C3msBcROznM8Hv2WWtc0zo/SfJjSg
   teyTAQor/TF1BNUB3S/uOYeXCg4mFdBwstmIsIfipAtmWXplRD9Cfy0Cz
   OrujsBZ0UTD/ViENKlGX5dPskdsjooSr72O4G71j2GB5TNN1E8RPqXFY5
   MDm2fZu9MJxYHjWWg33ds8HUEdRDUPCd2pHx80P/JOyq41Cj3i0ztyKth
   vYk7RkzNibjo8DoBGBfdlLorYsnsQ6EqxCXINiS3bH2E7nWbf49nhHqBN
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="263667794"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; 
   d="scan'208";a="263667794"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 15:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; 
   d="scan'208";a="620518976"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Jul 2022 15:27:03 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o9DU6-000L8N-HQ;
        Wed, 06 Jul 2022 22:27:02 +0000
Date:   Thu, 7 Jul 2022 06:26:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 4772/8197] htmldocs:
 Documentation/arm/google/chromebook-boot-flow.rst: WARNING: document isn't
 included in any toctree
Message-ID: <202207070644.x48XOOvs-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   088b9c375534d905a4d337c78db3b3bfbb52c4a0
commit: 59228d3b9060b0e5e6b37ceca078fd81a165cfc9 [4772/8197] dt-bindings: Document how Chromebooks with depthcharge boot
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/arm/google/chromebook-boot-flow.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
