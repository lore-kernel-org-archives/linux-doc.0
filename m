Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3993A3B47C1;
	Mon, 11 May 2026 08:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778488808; cv=none; b=giMu/j1xlsZjX+qrTdORK4reMaBZMM+WelzKXqqARVIJE/g/pWrJMJc9D3ybhfkmHX/FghVbJVNo5414+brq0f0ixgkxrONuEkHAcDSqGxEyuERih9tbKxxxbPtrHPCAEuIWcnb9+E9iHaV73N2O4dBR3xid9Ek7wOk4ENTh/OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778488808; c=relaxed/simple;
	bh=FjxoFU/iuph2uKQuJYPBP/jRCiI5H4PriSYE3OFrGPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdl2Je0DjZuJDfD+NnqL604bSFaVFQHnjzVB2nrOcZ4kfJ7PAHv5eHraJCmeA8ezsOGHkrFRTJcN21L/GowhZNXtQE7q1G14/tukyPRxv5wnsUwyjumw5b8bT9xST52lTaVcxbPP6drdrLvvl4LR12XdTJFisX5nSaDmLvAwGHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/n3iLxu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/n3iLxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778488804; x=1810024804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FjxoFU/iuph2uKQuJYPBP/jRCiI5H4PriSYE3OFrGPU=;
  b=f/n3iLxuwGUTbtq0oOWCAFOSPLJfP1GbktnwPO8ixufKVPnxi/C0I0e5
   RIwOcU+NlCzRv6LeGZQLkfkS6o+ZSywNRlo3l46HGWlQm94XS95/zFvfc
   c+LrbHfLL4j18BlX9vff3zf+ZqI5BSvQjHp/A7Tyl584FwNkzPMi54FWZ
   O0YovAx7QUeO/l6WOqT3oeot1W7g1IcG0LN12+pWhtSr8eciJPqWo+fwf
   6SA7gKpr4mq3OFHbDoE7gOTx+3OMY58+td5MEhJQELqmh6Fm0xmKx8Wlc
   AQ4E/BVDElXqywWzLogabJ6BN1IPFO68YCkjqvAQDxndL4mhzm1wtzWu7
   A==;
X-CSE-ConnectionGUID: al0l63/YTDSoKdLbPRMVCg==
X-CSE-MsgGUID: 7JJSl520TZKJ81gDRozSqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="82981395"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="82981395"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 01:39:59 -0700
X-CSE-ConnectionGUID: 8umqLdDHQJyo1nUXtxdk0Q==
X-CSE-MsgGUID: gn3R5xLYTm+H4pTe+HNCFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="242380856"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 11 May 2026 01:39:56 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMMB7-000000007v7-2d8S;
	Mon, 11 May 2026 08:39:53 +0000
Date: Mon, 11 May 2026 10:39:44 +0200
From: kernel test robot <lkp@intel.com>
To: Yan Zhu <zhuyan2015@qq.com>, corbet@lwn.net, alexs@kernel.org,
	si.yanteng@linux.dev, kees@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org,
	dzm91@hust.edu.cn, tony.luck@intel.com, gpiccoli@igalia.com,
	frederic@kernel.org, jani.nikula@intel.com, longman@redhat.com,
	mchehab+huawei@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yan Zhu <zhuyan2015@qq.com>
Subject: Re: [PATCH] docs/zh_CN: update admin-guide/index.rst translation
Message-ID: <202605111009.hlpiVkT6-lkp@intel.com>
References: <tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A@qq.com>

Hi Yan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhu/docs-zh_CN-update-admin-guide-index-rst-translation/20260511-102406
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A%40qq.com
patch subject: [PATCH] docs/zh_CN: update admin-guide/index.rst translation
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260511/202605111009.hlpiVkT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605111009.hlpiVkT6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
   MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
>> Documentation/translations/zh_CN/admin-guide/index.rst:114: WARNING: toctree contains reference to nonexisting document 'translations/zh_CN/admin-guide/module-signing' [toc.not_readable]
   Documentation/userspace-api/landlock:504: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +114 Documentation/translations/zh_CN/admin-guide/index.rst

   113	
 > 114	.. toctree::
   115	   :maxdepth: 1
   116	
   117	   cpu-load
   118	   mm/index
   119	   module-signing
   120	   numastat
   121	
   122	
   123	Todolist:
   124	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
