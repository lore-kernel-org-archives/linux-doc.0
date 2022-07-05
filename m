Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6442EC43334
	for <linux-doc@archiver.kernel.org>; Tue,  5 Jul 2022 18:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiGESSy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Jul 2022 14:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiGESSx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Jul 2022 14:18:53 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7F91408B
        for <linux-doc@vger.kernel.org>; Tue,  5 Jul 2022 11:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657045132; x=1688581132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bWpqvY3At5xbUcJwPumPySRb6Jds7z486oOWfevgw1M=;
  b=l7WARVIEzxQ6hLRrz6lAwD0NFceQlCW/efW+ELK1EsgEYbEzrOcIrOFq
   Hfh6gphe1DnsKerJIiOize5f3QboRMx3NlsuLWYTDL/ibKo/NVK8m+qs5
   ul1AQklh2oJ9+nWHa5UtGB3eFTYIjfiOnh8wgvk1U+vYtB99xoIvyca89
   T6aDcCClr7aTI2WBwkCd4t+tliyWZYf3jm6aBmESoiiZy1VwVfKNBfLA8
   17JU+5w6ZHqh1Yi6E5U36iu+gQA7b93rsZHbKD8rAbnJQtmqgSVKCwL7E
   T3HBNsG0Vgcs/ehdurC98U+cjCZ13bKc3JMqwtmDdpbEwxucVkrhZJvuT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="263856510"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; 
   d="scan'208";a="263856510"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 11:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; 
   d="scan'208";a="660654751"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Jul 2022 11:18:50 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o8n8M-000JSx-4r;
        Tue, 05 Jul 2022 18:18:50 +0000
Date:   Wed, 6 Jul 2022 02:18:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Rohit Visavalia <rohit.visavalia@xilinx.com>
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        Michal Simek <monstr@monstr.eu>,
        Devarsh Thakkar <devarsh.thakkar@xilinx.com>,
        Vishal Sagar <vishal.sagar@xilinx.com>,
        linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:master 379/608] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-yuv444p (if the link has no caption the label must precede a
 section header)
Message-ID: <202207060218.agu9mcap-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx master
head:   72c3ddb0ee4e9f0fe29a598535e9f57fa6ccd51f
commit: 1d0aa998d1cfa9ca6f660f00578ce11f93ab6a42 [379/608] media: v4l: Support 3 planar YUV444P 8bpc pixel format in contiguous memory
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-yuv444p (if the link has no caption the label must precede a section header)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
