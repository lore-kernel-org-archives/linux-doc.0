Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A859C433EF
	for <linux-doc@archiver.kernel.org>; Sun,  3 Jul 2022 21:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiGCVrb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 3 Jul 2022 17:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiGCVrb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Jul 2022 17:47:31 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC7A2AE2
        for <linux-doc@vger.kernel.org>; Sun,  3 Jul 2022 14:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656884850; x=1688420850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IaQyU8LKf23ljLGerTawPDbjCqcJc3FiasXHUcAtQig=;
  b=GGqxHR/vKZfOCZtxx0e2veWCQiMCHLAoRXxg6C604a90t8OjC/UTb983
   cc5ep2QaoBZpOev78OwBo2De6CLvcBF2U7X9v9ifwjKhRSiCOmMMf8zHF
   ZVR/TwxXd0+GJhSegA5QouzqEhIZyV3Kz/fwYtms/UV8UcQxQQSc+fal2
   yMbniXfoYeDzX5zvzNecjSiTzLounIX+QPt5k7UtWU9bQj2LZ+ThT6Oip
   KOdVKeY3vpYQ8PxYRmOn4bWgoyiXmLICXICmbYUhe93Sz34L766YbugGf
   6oYWZTcHjC/nG6f5PDYkNc7/5ezB7xMR+D6J/JqN408lfpWh0CDtehG+l
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="263397622"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="263397622"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2022 14:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="919103223"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jul 2022 14:47:28 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o87RA-000H1f-6L;
        Sun, 03 Jul 2022 21:47:28 +0000
Date:   Mon, 4 Jul 2022 05:46:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dylan Yip <dylan.yip@xilinx.com>
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        Michal Simek <monstr@monstr.eu>,
        Hyun Kwon <hyun.kwon@xilinx.com>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:release-2020.2.2_k26 129/241] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-ctrl-type-hdr (if the link has no caption the label must precede a
 section header)
Message-ID: <202207040526.WWF8LiLg-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx release-2020.2.2_k26
head:   4731ff5042ce76fc145bc2797faa2d91b090675e
commit: eaaa91e3600a51760c14f0ac5276cb143f6c9987 [129/241] media: videodev2.h: Add control type for HDR
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-hdr (if the link has no caption the label must precede a section header)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
