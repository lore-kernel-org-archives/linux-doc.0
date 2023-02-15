Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B40C636CC
	for <linux-doc@archiver.kernel.org>; Wed, 15 Feb 2023 03:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjBOD5e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Feb 2023 22:57:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBOD5e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Feb 2023 22:57:34 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2FF15570
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 19:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676433453; x=1707969453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMre833KJsS+eK+HgH5diSLvUqFTBRhsP25iPfawLCo=;
  b=I4/Xt+WD/0Sgg9dcKjIvB2oRcCFJkfCIXbdLAZpDRhbJN4HYPIA5XChd
   WO8TpOXmdKe5ioxabkP0NdGzw5cXvRZ67FC2tpPuZGnt7/g492bM33b2w
   ljHRUPOEj9yuvPrzmbG2UyfZblxwwjwOKJal4Ml0frgLdlCpKOY0i3jmF
   4TqRESxa4d4GwrOagNScG8d0U0zg+JNyYVAipwiKbJ6gB0ZJRM3Gyll+e
   /CX1pK0BS/qOxYTAGgpkAjRtYCF68axVr1TSh/vjeuEySmPbeXWfX3Lw9
   0F2j+kTtNBNxXr0HEbmRjslzYoMtFa3mvHfp1SAXrj+HtY64WNvmxDf1G
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="393740597"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="393740597"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 19:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="812281075"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="812281075"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2023 19:57:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pS8vC-00090V-2G;
        Wed, 15 Feb 2023 03:57:30 +0000
Date:   Wed, 15 Feb 2023 11:56:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dave Marchevsky <davemarchevsky@fb.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Ammar Faizi <ammarfaizi2@gnuweeb.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
        Alexei Starovoitov <ast@kernel.org>, linux-doc@vger.kernel.org
Subject: [ammarfaizi2-block:bpf/bpf-next/master 9/13] htmldocs:
 Documentation/bpf/graph_ds_impl.rst:62: WARNING: Error in "code-block"
 directive:
Message-ID: <202302151123.wUE5FYFx-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf-next/master
head:   1f5dfcc78ab4cc06ce7dac9de6c1ed361fde7119
commit: c31315c3aa09297d99cb39e837185ef225586d2b [9/13] bpf, documentation: Add graph documentation for non-owning refs
reproduce:
        # https://github.com/ammarfaizi2/linux-block/commit/c31315c3aa09297d99cb39e837185ef225586d2b
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block bpf/bpf-next/master
        git checkout c31315c3aa09297d99cb39e837185ef225586d2b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302151123.wUE5FYFx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/bpf/graph_ds_impl.rst:62: WARNING: Error in "code-block" directive:

vim +62 Documentation/bpf/graph_ds_impl.rst

    61	
  > 62	.. code-block:: c
    63	        struct node_data {
    64	          long key;
    65	          long data;
    66	          struct bpf_rb_node node;
    67	        };
    68	
    69	        struct bpf_spin_lock glock;
    70	        struct bpf_rb_root groot __contains(node_data, node);
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
