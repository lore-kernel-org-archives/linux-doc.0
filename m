Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFB1189BB0
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 17:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753292736; cv=none; b=HWl9r4MUAY2m2jJx1LkZhWjMQ75sZMsdNJfuPTDj0B9SoLf1wdovqxoHIpYb2fz7HvogjwrgTe2gRW1KQA/2kGRJCGkAPIKPuj12vk0h5MnKqz6j7W2OyapWR+nP/1OoZMvJc/MR4PyCKwz0bjSwsbfMJPR0kvZZ3sSgB7Ol/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753292736; c=relaxed/simple;
	bh=QCqmqy3i2BSNKF8d6To0zZGVl/TeP5zYFRjQtgacaV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TLKjpZ/8eu+4i3nelE5tRAT47e4Z0131ujxUZdlXEtdTCzZkE/2BUhA3xY1U0UYpIojYkCaHXiR3xyCn2uz4fRk84wzXM51Q2mwl/e8pELYuYwYk89zD23Lr/kpUeMEC80tuCxVrdvD3/EPSKP0nQ1MKDCU5iFaW1Phblfcy39o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFBH2Pyk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFBH2Pyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753292735; x=1784828735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QCqmqy3i2BSNKF8d6To0zZGVl/TeP5zYFRjQtgacaV8=;
  b=oFBH2PykSeiZ9m50egOsTvCuWumMBD+rkuh10BjfEw+xQuiz/8Su8MfK
   VcpGKmnNDEN29H59fFt49m9Z8pMzTmksNsIavmdMqZnzArQ3pVFsPG0v+
   fXTz4jcSxN1+Idx8pzbVzXm5vqDWwivSG3nWvLOLIBaFPnFljisU648J1
   6edJDl54rE5HFg5hezVP8vlrTdIdV/xAPpw68Fj8d7rdoANVknElXWuNf
   WlqXXrsTwCQitGFCb8yAIR3UGs2n1mZRd+nupZTBbJerPnfeEVJkqteLy
   eQH1xdb9nAoI0P0isdQhdsQNBULjn4v1A5pKOlTPTFeLvThEkVHwxGLkV
   Q==;
X-CSE-ConnectionGUID: auC+idBpTSKJD2d071GH/g==
X-CSE-MsgGUID: 2OmtqoiqTWqFlE1IXE3SqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73043037"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="73043037"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:45:34 -0700
X-CSE-ConnectionGUID: jL4sMX3eQ6KfR6Hp0sh2jQ==
X-CSE-MsgGUID: +b2Zl9UAQVGPDVQP5Tw0/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="159417975"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 23 Jul 2025 10:45:33 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uedX0-00001B-22;
	Wed, 23 Jul 2025 17:45:30 +0000
Date: Wed, 23 Jul 2025 15:24:37 +0200
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-doc@vger.kernel.org
Subject: [asahilinux:bits/090-spi-hid 13/26]
 drivers/hid/hid-magicmouse.c:590: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202507231521.uTu070PQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   9da5f109e42a00118fe6327d7774c46116780937
commit: 6c777754fd9890693a267f3829e3aa6f142e6645 [13/26] hid: magicmouse: Add MTP multi-touch device support
config: alpha-randconfig-2002-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231521.uTu070PQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231521.uTu070PQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231521.uTu070PQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-magicmouse.c:587: warning: Excess struct member 'crc16' description in 'tp_finger'
>> drivers/hid/hid-magicmouse.c:590: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * vendor trackpad report
   drivers/hid/hid-magicmouse.c:604: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * standard HID mouse report


vim +590 drivers/hid/hid-magicmouse.c

   588	
   589	/**
 > 590	 * vendor trackpad report
   591	 *
   592	 * @num_fingers:	the number of fingers being reported in @fingers
   593	 * @buttons:		same as HID buttons
   594	 */
   595	struct tp_header {
   596		// HID vendor part, up to 1751 bytes
   597		u8 unknown[22];
   598		u8 num_fingers;
   599		u8 buttons;
   600		u8 unknown3[14];
   601	};
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
