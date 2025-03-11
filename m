Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD34221DA5
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741680875; cv=none; b=dfVak58ceqFZ06hi86TKPM4drnVYk6sgpCWShGTiXpNDuGbgE/9M7zgHvDtIUDCpm6G74lHIPbsmRTlAHzf4rRy93o/a9Dd59LcXH8LNAHlAxR+svh1iFItkImPiwqteQKyBkOfw0gFVzHElQn5ZXjCUTvXHFugfY3dvLqCN5Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741680875; c=relaxed/simple;
	bh=pwgXluTeynYMWXQHCNZrpE2vZNdH1WtFjtlIwe0j1CA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RkZkKNQh/IKhQCvUlITBtwO4OuBGGZX+XgpmiEMOoYiQW9pSqDhpU2qgWhED2bGn+geKB9e+tllQSRyeCmXwAvfmiWR6fXheQGeiIOo3bzErLV9MmRHhCH5LtYPWtVI9T03WkqvIC2QyNg9oU/7x1Tn6qCnIcRkAB0D3SHaLXVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoaKgfpk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoaKgfpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741680873; x=1773216873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pwgXluTeynYMWXQHCNZrpE2vZNdH1WtFjtlIwe0j1CA=;
  b=HoaKgfpkK+qIzYU2RhETRNuHyD9bS5Jo8Ur7tSAlR+voIdrSLmXKI/y4
   /M8N5roN7hq1eQe8EGKn8gJP6lQzMfxDgBWs2u5eZf9dkli15/8UgpCU0
   3i4q1VPNu3k+55ziTDdjRl+4b+LKSOkeRLPcw/G6GT6NCkQohZ2xZaLi7
   ma1AUQGU7w+wCPaBK05s6fe7jjSmfCctbngsCalROUbMvWM0UfKRQbE4l
   G8wwGB3zMwGR2eGXwnZ+9PkK7TmnfTsNP5odcA6n0jwyt8W/6GJjMXMsX
   YaPHd+8rbaAyctwarZZgxij2L1FtgI7+sOZSEOy8Ek0D6rAO4yiINQ0QB
   w==;
X-CSE-ConnectionGUID: nFf2TdoSRQOtlkyLwunDCQ==
X-CSE-MsgGUID: 8vbGb4GcSbC6ie/xvJAuDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="68066480"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="68066480"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 01:14:32 -0700
X-CSE-ConnectionGUID: NyKQD+AsRHWW0+tuReHr5A==
X-CSE-MsgGUID: pBkzbgn0QCaVxjFgxO3tjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120201955"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 11 Mar 2025 01:14:31 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trukv-0006TY-0f;
	Tue, 11 Mar 2025 08:14:29 +0000
Date: Tue, 11 Mar 2025 16:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [boqun:rust-atomic-v3 3/12] htmldocs: Warning:
 rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist:
 srctree/tools/memory-model/Documentation/explanation.txt
Message-ID: <202503111628.mRkhIEl5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-atomic-v3
head:   a266f2acd822d285b38f117aa2cfb863743d05e9
commit: 65ca28f0c264b60230a69b605e493aa79faba691 [3/12] rust: sync: atomic: Add ordering annotation types
reproduce: (https://download.01.org/0day-ci/archive/20250311/202503111628.mRkhIEl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503111628.mRkhIEl5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
>> Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
