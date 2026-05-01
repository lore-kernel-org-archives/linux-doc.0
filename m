Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A2930EF97
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 20:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777667399; cv=none; b=ZWWjpJJp7A8XgA7iDAEwmcHRVYffDu6Sl/xh2PnEmnnSyA705dpgTXCzRucwLfFKqFG3j4bSnlNNLatknVXuEbupZspAPHASTa2nvcpQ/V1nBEQfUGx2aZ+GQWptLEvSSyvIjBTaDZndrmzdSElePs/AljJEb7SABhSHmjLTkvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777667399; c=relaxed/simple;
	bh=qJUbyCM+Fpb/X54kF9M9w0HEiI3EnghRpGZlRDej1mc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=piCmxqE4Y1m+geAJbBt8/ONvfF4yadTXbyJnZbNR0rWAiR9TgLHSNaMJH6DiRfUSOE2upiM3t/uHtXibpwOonjBztpWH0fug25R2sP+Fq57YgoDKTjeqW4jHzJScHNKxmR2p0cEfkAR5sm6qaWZLnkjMDvFk/dxmLVIImuahmZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTg3q65T; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTg3q65T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777667396; x=1809203396;
  h=date:from:to:cc:subject:message-id;
  bh=qJUbyCM+Fpb/X54kF9M9w0HEiI3EnghRpGZlRDej1mc=;
  b=bTg3q65T+sZxZ8OquczQvdDl40i1+GN0G1AhqgN2K1xD5NXzpUEzfQEs
   k9ebDgAA5w+EFxEYPQ4uAM2QnJVScunZ4RnURN8uUbosk/BmOpqO8WOXr
   RThiCV14YxytlAv4H2jjpVfSREwAqYVWlVqO2Q9WF+Q5KdADxfFVgPKzb
   63gKu7S9k251MbjboVPlU33SFKyBBkzO5Qd5WT3o6h3uYBaKayjptCqmN
   lECE/A5LkzndSmMutpGCzxbEzVCqNLhVXWB/PjCfeSfIszUl8gwZiqeMl
   ioodx/KtI+odw/T1ufeTBzcop82lvhwaY8P47k5PlWQBVS6OR797q3LIR
   g==;
X-CSE-ConnectionGUID: KN4TYix+Qq6mH8v7BspA1g==
X-CSE-MsgGUID: ukddX5pKRvSEmBge6SeJ3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="81200507"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="81200507"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 13:29:56 -0700
X-CSE-ConnectionGUID: KuF0r3dGRDyLnfCIHkz89Q==
X-CSE-MsgGUID: kr+hf3HVTvyHfqF3q4I8yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="236739102"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2026 13:29:54 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIuUh-000000000q9-0xPI;
	Fri, 01 May 2026 20:29:51 +0000
Date: Sat, 02 May 2026 04:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nitesh Shetty <nj.shetty@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>,
 Vincent Fu <vincent.fu@samsung.com>, Anuj Gupta <anuj20.g@samsung.com>,
 linux-doc@vger.kernel.org
Subject: [bvanassche:copy-offloading 6/15] Warning:
 block/blk-copy.c:10 This comment starts with '/**', but isn't a kernel-doc
 comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202605020409.k5N4LYv0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/bvanassche/linux copy-offloading
head:   145ce5577cb6e492710d78c469338bac08d916d4
commit: fbd1337059d2e2acd851258f7aecd627917c4f7b [6/15] block: Add an onloaded copy implementation
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260502/202605020409.k5N4LYv0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020409.k5N4LYv0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605020409.k5N4LYv0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: block/blk-copy.c:10 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Tracks the state of a single onloaded copy operation.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
