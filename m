Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC2156C3
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 08:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gh3jCbh7"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBC5E1;
	Mon,  6 Nov 2023 00:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699259440; x=1730795440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JYJ3UAqt2LA+9s63D4dixosHg6tgpCCu7wy54TKZmmc=;
  b=Gh3jCbh7I/xl7KUj4/oYVDXzjYiR4Xj0v67ErGdvdV90Ju+F5KE7ra9z
   7qa0YVbG0ah4WLuFUKwwUwJ2syyy8rc4sFOYbnvRfEHqbcWbgBADTq/4R
   Y0GfTAI7QYss/zCx/Jf2YHQLhzmRIHXkCQu/bR6WRcOz4BevkLb+e+gMX
   P95+VMDLMXWjki1Ptv7Nq4QIy26AkX9EcXp9hpn+SEfHGBIl/bMc7dGJm
   CGDkWlRRqsST0RPUOUjAL9N7ES7nBa18YCpJaQ/niQUY4W+x3FKF/yVUg
   NEXbuOuVFO+j/vHnyu6SFGrQ9ENGwGtdjUcEp1FddL65ze4Ay6vJi1dMT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="392098007"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="392098007"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 00:30:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879359698"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="879359698"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2023 00:30:37 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzv0F-0006Gl-2j;
	Mon, 06 Nov 2023 08:30:35 +0000
Date: Mon, 6 Nov 2023 16:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luca Coelho <luciano.coelho@intel.com>, linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING:
 Unknown directive type "c:namespace-pop".
Message-ID: <202311061623.86pTQrie-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jani,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: f6757dfcfde722fdeaee371b66f63d7eb61dd7e4 drm/doc: fix duplicate declaration warning
date:   4 months ago
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061623.86pTQrie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061623.86pTQrie-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING: Unknown directive type "c:namespace-pop".

vim +143 Documentation/gpu/rfc/i915_scheduler.rst

   139	
   140	.. kernel-doc:: include/uapi/drm/i915_drm.h
   141	        :functions: i915_context_engines_parallel_submit
   142	
 > 143	.. c:namespace-pop::
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
