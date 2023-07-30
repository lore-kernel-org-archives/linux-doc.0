Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBDEC001DF
	for <linux-doc@archiver.kernel.org>; Sun, 30 Jul 2023 11:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbjG3LBv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 30 Jul 2023 07:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjG3LBu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 30 Jul 2023 07:01:50 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F3C10E0
        for <linux-doc@vger.kernel.org>; Sun, 30 Jul 2023 04:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690714907; x=1722250907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wiso5oU3Kpypc9NJKoMcvrn2onnjR3SCO1jZiPFr3ww=;
  b=h2s48ZpgpntX38FNRSyuoN2luxkfLygoIXV7SQpHfEZVQxuklSfCKFUu
   nv8hQjS+KdO9j+Q9TlY2jALjKLNxIXXqh2yz7CYWoW1w/OMvEyJP8zppB
   3R3pTufm6y+1E2qdmnnUqmGIYtFjj1BIAgts8BkzRuz/JV1suXhr6RUfc
   MixsB99TynXkFpZo7lTVl7vSqqwMLYrYusz783RyBfw4MX7P6O99DyU5/
   alVKvfOANWQUCdC5BBJjRjVnIR7D6qgy7cWxIkmcNOaH9UkjOSKXXCnYf
   he/yBk73LcGoT96q7oSk9NmUxR1ZCvWa6Wy1UcIMcyf9ZHJMa0jy0xOD4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="348439590"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="348439590"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 04:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="841865085"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="841865085"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2023 04:01:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qQ4BE-0004YZ-2V;
        Sun, 30 Jul 2023 11:01:44 +0000
Date:   Sun, 30 Jul 2023 19:00:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Luca Coelho <luciano.coelho@intel.com>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 379/5284] htmldocs:
 Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING: Unknown directive
 type "c:namespace-push".
Message-ID: <202307301850.i9xFNWT6-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jani,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7b3af5a77e8d8da28f435f313e069aea5bcf172
commit: f6757dfcfde722fdeaee371b66f63d7eb61dd7e4 [379/5284] drm/doc: fix duplicate declaration warning
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307301850.i9xFNWT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307301850.i9xFNWT6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING: Unknown directive type "c:namespace-push".
>> Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING: Unknown directive type "c:namespace-pop".

vim +138 Documentation/gpu/rfc/i915_scheduler.rst

   137	
 > 138	.. c:namespace-push:: rfc
   139	
   140	.. kernel-doc:: include/uapi/drm/i915_drm.h
   141	        :functions: i915_context_engines_parallel_submit
   142	
 > 143	.. c:namespace-pop::
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
