Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786B6C6FA8E
	for <linux-doc@archiver.kernel.org>; Fri, 23 Sep 2022 11:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbiIWLUw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Sep 2022 07:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiIWLUu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Sep 2022 07:20:50 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0A3CD1D4
        for <linux-doc@vger.kernel.org>; Fri, 23 Sep 2022 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663932050; x=1695468050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=an+Q/MLwjZNnavcLzJHbZet7eTH7sPVEIWFjZ6RQbr8=;
  b=JikpyKsh6se545IQbcBVnbPQ8f+b0cVKfGBbg9udhQmWcpunFCcMHhk+
   cYQMzjtENZ6jCzjYVcnY9y0spybZaljRIR6GE35b9WwdC1qlMieU0fzxw
   Cs68r526qPqmJakiqehZZshMVp5jurvQ8zNDvCDxCQt3uc+lMTR2EtME/
   D76JEWAggS4YEO/ISPvPB3jon88MGWsR1z1EQtlmrAI3eNPN25KBuIk3X
   nXxnHS0qqSDzUuNrgqCcisJcoUFeCDWfClS6vZ1f90ASyFazzxg9rtRst
   yT3QceX6PfIMKjy+DA/yUdr4tEFeCl1Wb7vCujUIkgOwWWEolU1oHmJ45
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301453223"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; 
   d="scan'208";a="301453223"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 04:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; 
   d="scan'208";a="948986799"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Sep 2022 04:20:48 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1obgjf-0005c3-1I;
        Fri, 23 Sep 2022 11:20:47 +0000
Date:   Fri, 23 Sep 2022 19:20:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 8678/9680] htmldocs: Warning:
 Documentation/translations/zh_CN/devicetree/kernel-api.rst references a file
 that doesn't exist: Documentation/Devicetree/kernel-api.rst
Message-ID: <202209231933.vcyETtUl-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaa11ce2ffc84166d11c4d2ac88c3fcf75425fbd
commit: 2507a316b03d5cf9ae0a244eb481056bec27707f [8678/9680] docs/zh_CN: add dt kernel-api translation
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2507a316b03d5cf9ae0a244eb481056bec27707f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2507a316b03d5cf9ae0a244eb481056bec27707f
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: Documentation/translations/zh_CN/devicetree/kernel-api.rst references a file that doesn't exist: Documentation/Devicetree/kernel-api.rst

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
