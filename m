Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jif2+T+S"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53EDB1987
	for <linux-doc@vger.kernel.org>; Fri, 17 Nov 2023 05:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700226505; x=1731762505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xkaVHL3tFGeBn4BZ93EHL8cAlgVs4wOIQHp2pZFPBFw=;
  b=jif2+T+Sv2f6+XILReHTEbY3wYJctBHek4FIBBuBtmQoiLK7fPpN3sb6
   mD2vAVnnY1W9ouHQpPMTa0YdhgtGQtUmUjhmEePqDI3LAhJF850SvZzTA
   hj/qJHwFiLom0pM7MeuO30Qr6iISHP/xP8Z54tbYRxd7UAG5pjC0X09MF
   1ygtyvmCyTMIU1xd3BDZ78Um3wPNR9CXVnwbrjcDPOQRYk07E4PqV6TqG
   t3f3faAfZt/s6Lken32ODw0XfXqwEp6JadVdFImx/JjFuByKJC6HrhXKn
   RBwmHPNMs8Bg33lMmIjRxYoiSGJd3ybMuAqDbzrkb0ehTP+POcvYgMabE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="395222868"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="395222868"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 05:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1012929239"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="1012929239"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Nov 2023 05:08:23 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3ya4-0002od-39;
	Fri, 17 Nov 2023 13:08:20 +0000
Date: Fri, 17 Nov 2023 21:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 1819/1905] htmldocs:
 ./security/landlock/ruleset.h:287: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202311172010.AfFjwTiU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eff99d8edbed7918317331ebd1e365d8e955d65e
commit: f3672f581e951204d0ff4570a04daef1b81e182c [1819/1905] landlock: Add IOCTL access right
reproduce: (https://download.01.org/0day-ci/archive/20231117/202311172010.AfFjwTiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311172010.AfFjwTiU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./security/landlock/ruleset.h:287: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

vim +287 ./security/landlock/ruleset.h

   285	
   286	/**
 > 287	 * Returns @access with the synthetic IOCTL group flags enabled if necessary.
   288	 *
   289	 * @handled: Handled FS access rights.
   290	 * @access:  FS access rights to expand.
   291	 *
   292	 * Returns:
   293	 * @access expanded by the necessary flags for the synthetic IOCTL access rights.
   294	 */
   295	static inline access_mask_t expand_all_ioctl(access_mask_t handled,
   296						     access_mask_t access)
   297	{
   298		return access |
   299		       expand_ioctl(handled, access, LANDLOCK_ACCESS_FS_WRITE_FILE,
   300				    IOCTL_CMD_G1 | IOCTL_CMD_G2 | IOCTL_CMD_G4) |
   301		       expand_ioctl(handled, access, LANDLOCK_ACCESS_FS_READ_FILE,
   302				    IOCTL_CMD_G1 | IOCTL_CMD_G2 | IOCTL_CMD_G3) |
   303		       expand_ioctl(handled, access, LANDLOCK_ACCESS_FS_READ_DIR,
   304				    IOCTL_CMD_G1);
   305	}
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
