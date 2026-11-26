Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722635;
	b=F/EPpX7g6O9ZUwIMyaJMzQpnXe+9ZmF29FMy64lOVulfqIV0BYNP81+DVKql5LGOE/JJ
	 dcssJqexbYPHnj35JGP84RbggR5pSkMUZOFiBDnELmjmAYmUfhv8yJNuWfdzqZwzl65hV
	 EBBKHzBnySkNLiUmzyWGP8OvdcVTx6FGut4PwGDhBM4RTnzsHfrOxIxZLLETlHI/9RRpm
	 b25C6G/eZA/JmdayybexpjSEijAmgJ3eRACY2/R92Pl57S2Tb0Yign3/AJd7M27xrEhls
	 UtXsbulLP5e3KjjM538T6eEfCAslcfkID0Ox/VDeOAs3u2KKqivnEwTexj7XT2kJfHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722635;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=d0XjNnEfJQWLUW1DhvyFN1Of+dv2m8ZaaSLbIaJqpVg=;
	b=rmwNtBaZMPExIUXhM/aVpUTe7OMCZVg+J2eXHmI1V8aMZi11jgNW0Swg+WcSPI7/25Pr
	 tA+dPSArTpwyhqHAVODz0Yi+bY3iy4JL/jz5MqlSTdd3YQOVlQOmPWKFrtUS4p2Z+AjFM
	 tKMNqRx/IVMB/TA0E/ginF4zAKCIdI6J1kopqV6Es7lQKHcxj0Gxdle+UpS5+Z+dlPzhY
	 u9OI/j2BjMdlFs2lJQPwzYUxCAsVqJqimsf+OfXUZ2sJwISTMezCMR1/Wve4DWECjnjC5
	 aVlQwNvvjMYTpfu9xJd/qvoFqUsoh/ugfFeznYn6gRgRHDdoFDJk+NYHphX/A+ALr1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CQMdFhLu;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3530606A330;
	Thu, 26 Nov 2026 19:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3530606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CQMdFhLu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795722635; x=1827258635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r9ECPuBzYcm+LiBelJ56wm9g0OC0DyvmjYml8nAFdfE=;
  b=CQMdFhLuclSKzHsjwjkUrB8XApp1uHomq5KBC/VMXVy2NmsccgJjgi1y
   aU6jr2d7Lbd30UGMM5WspUxVbHsumcTyE2S1T+bsdv4Q5LQvHanNUwuSf
   Cmcs8rMcdpe2Xq5vLZusE/qIHcm4wIM7LnPKoLQ31Q56in39BcDahKqxy
   aYsDRSDnHjulq9Xr9hjwdsWaFi3Ko7v+BzaAqIr2wi5eLiRDSidTZocKC
   f5jT5iA3IjM/MkURZlmmoucWx9BoDsGFjALu25tWWgmZkJaA+BXm4YLBh
   XGdPArBdCZiTsuk0hRNCTzMQeOHdWRMFVCgXB1UCcAH0lw/6nmD8/mkIJ
   Q==;
X-CSE-ConnectionGUID: k72ILnG7R4CLElPbZTij9g==
X-CSE-MsgGUID: 4vYHL8roS0utHYEHUoOlRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4542870"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4542870"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 11:50:34 -0800
X-CSE-ConnectionGUID: LKhjY0YDRiaLOFtMDPI7Kg==
X-CSE-MsgGUID: 9X4E6OwoTR+SrvFA/qi8xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12846450"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Nov 2026 11:50:28 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWfU8-00000001Uj8-0o9x;
	Thu, 26 Nov 2026 19:50:24 +0000
Date: Fri, 27 Nov 2026 03:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Oarora Etimis <oaroraetimis@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com, victoria@system76.com,
	thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 43/43] drm/vkms: Add ConfigFS interface for connector
 parent and port_id
Message-ID: <20261127033740.miob9yII-lkp@intel.com>
References: <20261126-vkms-all-config-v7-43-21194cda2468@bootlin.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126-vkms-all-config-v7-43-21194cda2468@bootlin.com>

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3c7c3c12dfc7704ca614abbfa266ca00a2b5a994]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-vkms-Lock-the-config-dump-against-concurrent-configfs-changes/20261126-122844
base:   3c7c3c12dfc7704ca614abbfa266ca00a2b5a994
patch link:    https://lore.kernel.org/r/20261126-vkms-all-config-v7-43-21194cda2468%40bootlin.com
patch subject: [PATCH v7 43/43] drm/vkms: Add ConfigFS interface for connector parent and port_id
config: i386-randconfig-1004-20261126 (https://download.01.org/0day-ci/archive/20261127/20261127033740.miob9yII-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127033740.miob9yII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127033740.miob9yII-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vkms/vkms_configfs.c:117 struct member 'parent_group' not described in 'vkms_configfs_connector'
>> Warning: drivers/gpu/drm/vkms/vkms_configfs.c:117 struct member 'parent_group' not described in 'vkms_configfs_connector'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
