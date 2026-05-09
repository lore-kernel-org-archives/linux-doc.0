Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB61A246782
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 16:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778343633; cv=none; b=jhVUz6smDE+LOvMAMMXZ4Hpax0COwhnz95oBH03VZDqCn3ztIti7Z+iSruhhROj1ntF2KFj28eeCz/dD5rIt/KcplrEmlk5ZkQM3YI8A1VsSeGJj9r9dYft7nioRt835L+BK8/xvEWwL4bmdcUnbmYU0/s2NUeie0mv105X10fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778343633; c=relaxed/simple;
	bh=K17rgOODrv3C35ZecA1Dtc68zqvl72LgIOSAsDQgPlI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o7v+nhf+DGtA2j6S7WAn0VfPP3SOLi0NCf5hnq0e1UUcx52rlCx1nk+1vExu5OFVGCS3r0su/5JLVtUmsHDGu10oLbyBNbUD8Aa40nFlXLUKNv6clM/uHIDINa2+KLDfFYPYamNZ8WsNrBMpKPK6sT9ObLsgxnYOsEClAw3C6t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxXVVdDt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxXVVdDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778343632; x=1809879632;
  h=date:from:to:cc:subject:message-id;
  bh=K17rgOODrv3C35ZecA1Dtc68zqvl72LgIOSAsDQgPlI=;
  b=gxXVVdDtT48HGsaWE2+wNXoJ2prJKaqbV+3gHmRyoZzPZSMHRSTgCl0R
   lkxozV+hA9onimfY00pDnF2tsIcynvkL5AYfMfha0zePmhzP1Bjwj6obS
   7Hlhf1c0Q7w7tza9Lrh94PiNJ6GMNsx1vgBf7foaUccQujLEcal6PRnM4
   /IXfujybguKKXvh9yLV1uEbxLCsqUJ9UImEdykViXLOc8dgySDRYh4bnj
   dKE0BXr3+AFZSSFECM9wRkbeEI20hDJQucNNSSGcCL/QvsZ/piE5o+GmN
   Y7dsj+BBvucDW9Mh6C9aZly06+T6AnMHUhDDH68H9UuCDpBm5tmRjPnox
   A==;
X-CSE-ConnectionGUID: +kTVN6nORmKjtj18WG4VtQ==
X-CSE-MsgGUID: zZPTwicCSZi1rfnc1lauhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="101965639"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="101965639"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 09:20:31 -0700
X-CSE-ConnectionGUID: K2LkTUeNS2inAYQH22SY0A==
X-CSE-MsgGUID: M4j2kuMUSu+3pwbC3hLMww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="237268630"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 09 May 2026 09:20:31 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLkPj-000000007Vp-2772;
	Sat, 09 May 2026 16:20:27 +0000
Date: Sat, 09 May 2026 18:20:22 +0200
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
 linux-doc@vger.kernel.org
Subject: [asahilinux:bits/090-spi-hid 12/19] Warning:
 drivers/hid/hid-magicmouse.c:589 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202605091838.pJQhskey-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   7b3c6e8461f3035d025ece758919facbc1c6d854
commit: 2a467e61d288146e8b5e748c8cef4979c399cedc [12/19] HID: magicmouse: Add MTP multi-touch device support
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260509/202605091838.pJQhskey-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091838.pJQhskey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605091838.pJQhskey-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hid/hid-magicmouse.c:589 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * vendor trackpad report
   Warning: drivers/hid/hid-magicmouse.c:603 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * standard HID mouse report

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
