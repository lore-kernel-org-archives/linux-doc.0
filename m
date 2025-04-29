Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B2940C03
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939352; cv=none; b=Zm6fBO4Mi6Cvv5vguuq84djqnxSVoycwONuh58W1vK+S/aQm4dybtvlOvpn5bSwvOIxfNQYajb/y/ZaT/gM2kWZ7U0fdBnazWt7Dh8owUY+kmZTXBfklt++0B0JBsmZZQZV1qL4gXFMbUWnzN6XOK1JlhCRLWZvR/gUqXHKvV/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939352; c=relaxed/simple;
	bh=Vgadvu82mkBRcPb0qIWnCN+OBXyqJhxWHFZkMyEURqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1bAzgXElLouqjL9IVHEEYOPuiwia609c0mGxDVAPa4KreV8hO6Ir9OBvbPVMXuybM60OYpUFlV7meBTS07iM7CPQD6Fu6oSdHlJNfwjOUpC0q/5n+GzLocYX5eFqgubbHTpTnThNgzNo1HggrM8W5tVmSOJmru1T82U/plWuag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nopBS5gK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nopBS5gK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745939351; x=1777475351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vgadvu82mkBRcPb0qIWnCN+OBXyqJhxWHFZkMyEURqg=;
  b=nopBS5gKEBt24zTO81AWWRBQEt6GMtP05/5ID3rqL3Yo2rLixNHoJNgr
   3hia4d9PFa9HtusRCJCxYEt1sZa2uhnL250PvpcnO3hZYIYDutpZ/dZeW
   n67kNCXZFDUz2VuFWceMHLWPfFEhc0VdGjcWuHNlKdTl/n5Dm3bx0HJtv
   CisihUnn4tsyev+TR/AF/LqvvhM19q8InWMWCz0EnJiDaKLEZKBxJ8Nkn
   hm7E4IiXGR5ceadaRpuN2425KJni6SuCptaxoo7gT3Ou4GAm9bWzTTDNp
   kSkXxzToj+AbGyxX7+LPBMVv+4oQIeElSeU9TpO4EMnJSnXy7GVk+ukhy
   Q==;
X-CSE-ConnectionGUID: vDe5ShxgTby6bWoOOrP55Q==
X-CSE-MsgGUID: nOZiOqGaTSS2ZZoatyaTVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50228916"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="50228916"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:09:09 -0700
X-CSE-ConnectionGUID: 69Z6mil/QvmX+ZUE19QedA==
X-CSE-MsgGUID: Abdbf4+wRIeotbP6sZJPhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="133748424"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 08:09:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ma1-0000oF-1J;
	Tue, 29 Apr 2025 15:09:05 +0000
Date: Tue, 29 Apr 2025 23:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alessevan <44125445+Alessevan@users.noreply.github.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [rust:pr/1161 77/195] drivers/net/ethernet/realtek/8139c.c:61:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504292239.yphfXPc5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1161
head:   9f5fa1ba161d636d346f72ba808ce20ee4a3fa70
commit: 9b38723f8040ce8db95558558c52dda3dc826ab8 [77/195] fix(hot): reset errors correctly handled
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250429/202504292239.yphfXPc5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292239.yphfXPc5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292239.yphfXPc5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/realtek/8139c.c:7: warning: expecting prototype for 8139c.c(). Prototype was for DRV_NAME() instead
>> drivers/net/ethernet/realtek/8139c.c:61: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Reset network card.


vim +61 drivers/net/ethernet/realtek/8139c.c

    59	
    60	/**
  > 61	 * Reset network card.
    62	 * @param drv_priv private driver's data
    63	 * @return zero if failed positive either
    64	 */
    65	static int rtl8139c_reset(struct rtl8139c_priv *drv_priv)
    66	{
    67		writeb(CmdReset, drv_priv->hwmem + ChipCmd);
    68		int i = 1000;
    69		while (--i) {
    70			if ((readb(drv_priv->hwmem + ChipCmd) & CmdReset) == 0) {
    71				break;
    72			}
    73			udelay(10);
    74		}
    75		return i;
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
