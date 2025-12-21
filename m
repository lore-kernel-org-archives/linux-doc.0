Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC27182B8
	for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 21:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766353814; cv=none; b=F/wCcUXydsj1wMwfihqdDe6kOX+Tohnu4tkGtJ9dyQKv+dSLSaxFAiF64atxVSrrQmGMpublLEFsVCJHPQT2ImYIbxrE1nASoUoF1nDBDGxQPnkBnoGSlVMbHx+upeEGwWWLnyVy0kg1AfnMcGpU45wFblWh2E4w8np1wwzjj7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766353814; c=relaxed/simple;
	bh=wK4hv0liv6fI13orAi0jiRtUoKbQmRln9wYbtPfdaww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHZOdu4UewNR2Cv/y9/XBUJzkl8I4DLuxPNFWGkg1WQYr2TxgOmslsKF3YxvOUf+pCaxQvG0iluJImZQJryb1P6HwRlQ0vD/gY2JVP7vaXW6JvMGU9zcqK95SJU375z7ZU7frPBcTBkolXIYR7OBTBL4qzD0cl+/tMEHUlPSems=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Abyp3va0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Abyp3va0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766353811; x=1797889811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wK4hv0liv6fI13orAi0jiRtUoKbQmRln9wYbtPfdaww=;
  b=Abyp3va0bsvDvW1rlBcQluza35Eo/1vHTJASUFLCWytmX6h0S2Mq16NZ
   1XCv1maxMEstz9VW22wTREOzMhMDkrLsnTweY2AZh/H6RR3XZWmBjw9Cn
   4QeJRz8dNexur3fflpXNf6rrjdoqx0esJR6B4AC6VOohcVm1y9c6jgU4m
   LuYXirryH4WbjP81K7fBWUrPAaA/6zeqT/WfHzKokkYNiYWz7Oi3I2LNp
   d32cXuIG1+geM6Mh22fmGmlPWXokrxnJVe9YVLCERmwYx52/YHVc2DNjt
   frEX85sR9x4Ao45my5mKmKCgT1LhHjT8CXJBpgg3JuJu6++HjvZ9Mbdk6
   Q==;
X-CSE-ConnectionGUID: kjBGlOutRESvQDFNYhOHZw==
X-CSE-MsgGUID: dO9wiQKtReOX82BSsNyvfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68297116"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68297116"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 13:50:11 -0800
X-CSE-ConnectionGUID: uo4ihW/PTWSHu3aVVECjsA==
X-CSE-MsgGUID: YRLluMLfRx2WOVe2/d3vTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199388689"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2025 13:50:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXRJW-000000005Fk-2E3C;
	Sun, 21 Dec 2025 21:50:06 +0000
Date: Sun, 21 Dec 2025 22:49:44 +0100
From: kernel test robot <lkp@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-doc@vger.kernel.org
Subject: [akpm-mm:mm-new 98/101] htmldocs:
 Documentation/admin-guide/laptops/index.rst:7: WARNING: toctree contains
 reference to nonexisting document 'admin-guide/laptops/laptop-mode'
 [toc.not_readable]
Message-ID: <202512212211.GvfwAGPP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   287373d0b6ee3872d95edfd1921fb2f18535d6cd
commit: 7cc91bf52584387445d654cde466ba5cb1235757 [98/101] mm/block/fs: remove laptop_mode
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512212211.GvfwAGPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212211.GvfwAGPP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/pci.h
   ERROR: Cannot find file ./include/linux/mod_devicetable.h
   WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
   ERROR: Cannot find file ./include/linux/bootconfig.h
   WARNING: No kernel-doc for file ./include/linux/bootconfig.h
>> Documentation/admin-guide/laptops/index.rst:7: WARNING: toctree contains reference to nonexisting document 'admin-guide/laptops/laptop-mode' [toc.not_readable]
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   WARNING: No kernel-doc for file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_blk.h
   ERROR: Cannot find file ./include/linux/pstore_blk.h


vim +7 Documentation/admin-guide/laptops/index.rst

b02f1651ff7758 Documentation/laptops/index.rst Mauro Carvalho Chehab 2019-04-18  6  
b02f1651ff7758 Documentation/laptops/index.rst Mauro Carvalho Chehab 2019-04-18 @7  .. toctree::

:::::: The code at line 7 was first introduced by commit
:::::: b02f1651ff7758c4db0d759ab765d39986a79f5a docs: laptops: convert to ReST

:::::: TO: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
