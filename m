Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A9DC6FD1D
	for <linux-doc@archiver.kernel.org>; Tue, 21 Mar 2023 05:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjCUFxk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Mar 2023 01:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjCUFxk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Mar 2023 01:53:40 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B34B23300
        for <linux-doc@vger.kernel.org>; Mon, 20 Mar 2023 22:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679377997; x=1710913997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m7tMsLPv9nU1FGdk5g2fbjs/8TTEmzgOm9TDVJ7nlec=;
  b=Y9wRttQ/rOKT7FMYCTySVTB4a6iU8MyYodCZVlgSL/zSeakiKlRI1/uT
   tbfsUhY/36FhW3WKaSH17vPXnHo1a0dLcEdrBy+GFUZLjCvDhw/uJ9H7/
   dRoadgeaJ/VFN60CKuNfjF2gvIPlMoZwmV6r4x2P66p+CqAMtlBNSOVe8
   AvO0ZRtQD0VDg+wX7xNcXL/wqrgbZDIjIF9f8FAaoudEirsVC02Z3wr/l
   7SAlmhDOUZtagL5ttG1lYrskxhjRXzuE9wMZBwJdjtgOIBB6oHgnCPGGb
   /VThfo4nTTMqYlLyn5GDiWMyWvLr+7YVwrdKksno7NBl0lhAKP7y8EwfI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="403727923"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="403727923"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 22:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="631427045"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="631427045"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Mar 2023 22:53:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1peUvq-000Be6-2q;
        Tue, 21 Mar 2023 05:53:14 +0000
Date:   Tue, 21 Mar 2023 13:52:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Paul Moore <paul@paul-moore.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 5031/5297] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/ABI/obsolete/sysfs-selinux-checkreqprot
Message-ID: <202303211332.MILzGUKQ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f3594f0204b756638267242e26d9de611435c3ba
commit: a7e4676e8e2cb158a4d24123de778087955e1b36 [5031/5297] selinux: remove the 'checkreqprot' functionality
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a7e4676e8e2cb158a4d24123de778087955e1b36
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a7e4676e8e2cb158a4d24123de778087955e1b36
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211332.MILzGUKQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/obsolete/sysfs-selinux-checkreqprot

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
