Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90AB13A89B
	for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 05:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731907330; cv=none; b=b/1nwCtk4z6uUZZRpaLALV9nZp7Vr9EG49OIK6qYJUV6WhE2kuFnWP3+X5L5Emtu3J4KWnvKIhPxckJ2TguBM1cPmmRuhQBS/MRHxW5m3IgGW/0/IaMjH13UtDhmupMolbvCGkJPaJ1tx7GhFh+ZR4BJq71CfUFAbt+cPG4Tj9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731907330; c=relaxed/simple;
	bh=oDRCCmOJ6l3Qo4x7rZ5IXmovcEpVy7mgLlkhICA0kTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O5xq4qKzpO/rdqQGZPC1pYVQcvlqzgcy1XZmhSgbyUoCx34sXHpKQLqPHEZCpJ5unBewH0d3IivPp+Bv11y8TPWO6sW5tAIb8WKqliUK672COMYiXIuMG8kRoeODo8oHOjvDGvINf1f3GsQjVgy5DOJXWxs729rI/7JTJvy75g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxIwP9SN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxIwP9SN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731907328; x=1763443328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oDRCCmOJ6l3Qo4x7rZ5IXmovcEpVy7mgLlkhICA0kTA=;
  b=RxIwP9SN0d/ykBTGDqOTlfzofNNX6S4fmFtcnQJ+FKeTv4mzJ1Vq445o
   +xDT0rBNJt/mDpSzkEpw6oO/FwZCaoeeWz5IwTIAIJMdTs3fdE4PSkLe9
   T1zBkpRHm2lMeaYddSyBnZI2UV1/tC+GeBhM408PwJjzioF5G32HK7ZPd
   1+HrximAWtdOozkEGLTDTFufA8U2TIVLaBwGMuICV8sgwivRjo3KnKDkJ
   GgQqqflo0e6Eh3wPWshkpUx1KQSTMcaEvnhCOBLL1HgudEcHRWMbKwZ3F
   rAJNrbIG4CeXGCOR+L461qvNFAQmVYBW1ed8eK/e6CQZcBGvsLNx7Qda0
   A==;
X-CSE-ConnectionGUID: qmIbrMe7SuuXBOAjN7ipuA==
X-CSE-MsgGUID: 09k+KpGgSQKwwBpC2FW9Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="19457272"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="19457272"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 21:22:07 -0800
X-CSE-ConnectionGUID: AdmJPbzNSDicUTKlsCdhtQ==
X-CSE-MsgGUID: /xZ+WN3QSOumGFuMgqqC1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89244496"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2024 21:22:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCuD5-0002HP-2a;
	Mon, 18 Nov 2024 05:22:03 +0000
Date: Mon, 18 Nov 2024 13:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-doc@vger.kernel.org
Subject: [asahilinux:bits/090-spi-hid 13/28]
 drivers/hid/hid-magicmouse.c:578: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202411181319.N9xtkvNz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   501868c5f377ff4155041d111e0bea3c499b97a8
commit: 10730e65908dcaf173cc12a45e6186fc7f275cf9 [13/28] hid: magicmouse: Add MTP multi-touch device support
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241118/202411181319.N9xtkvNz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181319.N9xtkvNz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181319.N9xtkvNz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-magicmouse.c:174: warning: Function parameter or struct member 'pos' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:174: warning: Function parameter or struct member 'input_ops' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:575: warning: Excess struct member 'crc16' description in 'tp_finger'
>> drivers/hid/hid-magicmouse.c:578: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * vendor trackpad report
   drivers/hid/hid-magicmouse.c:592: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * standard HID mouse report


vim +578 drivers/hid/hid-magicmouse.c

   576	
   577	/**
 > 578	 * vendor trackpad report
   579	 *
   580	 * @num_fingers:	the number of fingers being reported in @fingers
   581	 * @buttons:		same as HID buttons
   582	 */
   583	struct tp_header {
   584		// HID vendor part, up to 1751 bytes
   585		u8 unknown[22];
   586		u8 num_fingers;
   587		u8 buttons;
   588		u8 unknown3[14];
   589	};
   590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
