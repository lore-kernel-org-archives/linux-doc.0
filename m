Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF72C001DC
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 11:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbjG0L4I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 07:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbjG0L4H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 07:56:07 -0400
Received: from mgamail.intel.com (unknown [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4597D272A;
        Thu, 27 Jul 2023 04:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690458967; x=1721994967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Efx8SU0zT/55gwggD9encEin8NWX/ogU9zQy6lkXD6U=;
  b=grLyzPAzgIGENc4QtgxZPNecrb7v5z13WGdiAxVBYH8zVCwDzjAGDdfZ
   jiAOVRB4pFAgzGem8UlZ8iD5YTXu2NveJGuPm/kvecQKurMyB+wx9BT8R
   Zqrqr/jTe809gRXRaOLm9Nz/q1arDXs0YQCv0Vbq1YIeIF8RElzLfBGZS
   vTG7dop3MZ5M/ADTnm/IrFF3aWOzl+7JgSl3YzYjKepj7abfl6kH83Y2L
   D3kiI5MSBmxNgCHWJ8PnTaYoSajEEt5VEd+MemWm/bpAXdNO59ewrJZbN
   te/8ThyAibEaxQ0kNUN9ePwYwi8lmoXX0Ym5kUV3TLU6KyYZFbaJ+Av3m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="348567988"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="348567988"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 04:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="870339754"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2023 04:56:03 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOzb7-0002FJ-1A;
        Thu, 27 Jul 2023 11:56:01 +0000
Date:   Thu, 27 Jul 2023 19:55:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
        x86@kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Borislav Petkov (AMD)" <bp@alien8.de>,
        Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org
Subject: [tip:x86/shstk 6/42] htmldocs: Warning: arch/x86/Kconfig references
 a file that doesn't exist: Documentation/x86/shstk.rst
Message-ID: <202307271956.IxoG9X0c-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/shstk
head:   c19a153cc0b172c8e1869d6dee52f6aadd73d3c4
commit: 18e66b695e787374ca762ecdeaa1ab5e3772af94 [6/42] x86/shstk: Add Kconfig option for shadow stack
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271956.IxoG9X0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271956.IxoG9X0c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/shstk.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
