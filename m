Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB59C32773
	for <linux-doc@archiver.kernel.org>; Fri, 19 Aug 2022 22:11:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239169AbiHSWLR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Aug 2022 18:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239019AbiHSWLQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Aug 2022 18:11:16 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58333D7D32
        for <linux-doc@vger.kernel.org>; Fri, 19 Aug 2022 15:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660947075; x=1692483075;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Q9IpP/wQPMVMLP8+yNpTygwsUlJEPG3EjeUTanXave0=;
  b=ArP53nywqQBN5Kd7flsWh7XTudlSSIzT5t98f58E+ZROGmASSW5Em1Tw
   hu1O8Kd3ce3tvLD0UnekTxNHMJk7zs6A/t4+Fl/ejyFHU0u977xMwNR0G
   e4f27AG8J2t92mXpdokKyc4r6rJXh1/cjP2bg+lyG89UFuv8x/aygITws
   hMUnY2n78Gs1s8afcVVfjbwTvXxR1uCqMJcHrEDtnWl4ltJj9kcp2i4p1
   PXz1wrVleNS264HVnEe/6OPKb07of6oIXx2ftPjpykfIcm15xjnsoeKsh
   IJLh6+zItFoRXvS4hFHfmS+jy7paaXDYZNvvBRxyJA1TCZp7722IJ6A5b
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="293901697"
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="293901697"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 15:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="559090534"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Aug 2022 15:11:13 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oPACu-0001rH-2b;
        Fri, 19 Aug 2022 22:11:12 +0000
Date:   Sat, 20 Aug 2022 06:10:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     kbuild-all@lists.01.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>
Subject: [lwn-2.6:docs-next 10/12] htmldocs:
 Documentation/translations/zh_CN/process/submit-checklist.rst:14: WARNING:
 undefined label: cn_submittingpatches (if the link has no caption the label
 must precede a section header)
Message-ID: <202208200608.HCVQ2hgC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation/translations/zh_CN/process/submitting-patches.rst
tree:   git://git.lwn.net/linux-2.6 docs-next
head:   36aaccaf98ebadd025a385356ada7a12ad0ca237
commit: fdb34b18b959df5851dfd6f5ccee6dcb34c2b793 [10/12] docs/zh_CN: Update zh_CN/process/submitting-patches.rst to 5.19
reproduce:
        git remote add lwn-2.6 git://git.lwn.net/linux-2.6
        git fetch --no-tags lwn-2.6 docs-next
        git checkout fdb34b18b959df5851dfd6f5ccee6dcb34c2b793
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/translations/zh_CN/process/5.Posting.rst:18: WARNING: undefined label: cn_submittingpatches (if the link has no caption the label must precede a section header)
>> Documentation/translations/zh_CN/process/8.Conclusion.rst:17: WARNING: undefined label: cn_submittingpatches (if the link has no caption the label must precede a section header)
>> Documentation/translations/zh_CN/process/howto.rst:98: WARNING: undefined label: cn_submittingpatches (if the link has no caption the label must precede a section header)
>> Documentation/translations/zh_CN/process/submit-checklist.rst:14: WARNING: undefined label: cn_submittingpatches (if the link has no caption the label must precede a section header)

vim +14 Documentation/translations/zh_CN/process/submit-checklist.rst

3cabb71cdc61e0 Alex Shi 2019-04-01  13  
3cabb71cdc61e0 Alex Shi 2019-04-01 @14  这些都是在
6db147a8bb89f6 Alex Shi 2019-04-01  15  :ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <cn_submittingpatches>`
3cabb71cdc61e0 Alex Shi 2019-04-01  16  和其他有关提交Linux内核补丁的文档中提供的。
3cabb71cdc61e0 Alex Shi 2019-04-01  17  

:::::: The code at line 14 was first introduced by commit
:::::: 3cabb71cdc61e0502be5e8543b8d111ad519a7e6 docs/zh_CN: add submit-checklist file

:::::: TO: Alex Shi <alex.shi@linux.alibaba.com>
:::::: CC: Jonathan Corbet <corbet@lwn.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
