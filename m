Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711501;
	b=UZ7wvuDEkj9q788fRgsEJ21xpH2hucVRjZ5lMq4JKdREfbY2+Y3iEDfkcyHSC87st4O4
	 5JmNnm0NZWZ4kSwa2/iCnnRoEnB/ClWYU/pINegvktS42XoclpmheewTDZM1rQ6CT0fGZ
	 zjHfpx9D6XCNJuLMsuRH1g0yEXLv05G1tblSiHdJSPYIbPJY+MPIOidCrNn0W3AF7tEgm
	 3aV0CQyW+kpk7CqGnNOtm/hMYdTEHVrbaFGIvvJWzfG2SyN6Ri7NZ2VxCjFBksdyfm3Hw
	 6fw8SCBCItRuKYotMyIi8ZGc5PX61r5YS7PAf+Hiqw9otQpq5ETW6PLzF1HY2JMQDvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711501;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=fHUOAZ6mMNtMo23vR2WHKfUxqC/87b1E4Io2Mv6sKk4=;
	b=JMumGegM/QPk2t0n4VOTkKpD/0U0Q65i0wnm0Dal+WiTQVOVBUu8gr9eQR9KJDs3+yCs
	 Lb3RY0qbsahRWOBl2QQQKXedqz1M7ANjCvahYAJu3AeIXCdaorhQOPq51TY3wm2PozBEX
	 ad9ltYJFrfD5CviWOLK0GrYhnO/16ClqzB3NT7HpREx484MucpIeNb4DEiyW0ycNM871k
	 oUs2wfE1gICoKiqWxHy1IQIkIf/dzIqT8M1H9RBcTtESZdhotB8euo8KAbs+h25pSPGxy
	 UzkQPoQuAtTWBtvKD90Qyudy6DrKcneLcM839+Qsy7Em6Bu4svmcJqn1ODTz+2jcx5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lQiodYqu;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49849606A327;
	Thu, 26 Nov 2026 16:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49849606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lQiodYqu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795711501; x=1827247501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i50Q9NVKtCix8B4lDLFjoFRATEwHTTiRYUfMBO48zBA=;
  b=lQiodYqu0fRB/pUpP7sJOzV2ZWytvDpVZ6b5BJ9AsQ3ZDrH+cy07Gl+u
   ADHMRFL+SlEp9H6KUBRi2CdaaJi3ohIEVYdyaHPyM7c/Ju0rc4vHBoMAd
   U2lJm3Da5TKuHwxAQuBelfCto+8VJjjFYLlqRviQTXPqCYTkNNF9xF7Fa
   vxHgwAhhMlalIBSh6Nu6/uWgcQumW/ylTy+Uto5EETer2cj6KHfH7Zhxo
   hSOFah4AsCZutrFRfzqTEzxiz89f7Ks2b90qapC/zuF1RqpzViDj+XYqu
   Gwessyp4fq4mpggp4JdWUg9mS+dBrnvLvBRj3YX7uOuaqsc7GEhGYNpVZ
   g==;
X-CSE-ConnectionGUID: OLukKs9bRiGkKUVMbFJF+w==
X-CSE-MsgGUID: hsnI5hw7Qiyq1s/Vn2rxFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4536158"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4536158"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 08:45:00 -0800
X-CSE-ConnectionGUID: YtB+QfE5S9qxdiA/Q8e41Q==
X-CSE-MsgGUID: BgF88I1nR1Shg2G0j7ck8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="13894609"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 26 Nov 2026 08:44:55 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWcaY-00000001UTg-354e;
	Thu, 26 Nov 2026 16:44:50 +0000
Date: Fri, 27 Nov 2026 00:44:34 +0800
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
Subject: Re: [PATCH v7 34/43] drm/vkms: Introduce config for connector
 supported colorspace
Message-ID: <20261127003812.SJ4m3pfw-lkp@intel.com>
References: <20261126-vkms-all-config-v7-34-21194cda2468@bootlin.com>
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
In-Reply-To: <20261126-vkms-all-config-v7-34-21194cda2468@bootlin.com>

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3c7c3c12dfc7704ca614abbfa266ca00a2b5a994]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-vkms-Lock-the-config-dump-against-concurrent-configfs-changes/20261126-122844
base:   3c7c3c12dfc7704ca614abbfa266ca00a2b5a994
patch link:    https://lore.kernel.org/r/20261126-vkms-all-config-v7-34-21194cda2468%40bootlin.com
patch subject: [PATCH v7 34/43] drm/vkms: Introduce config for connector supported colorspace
config: i386-randconfig-1004-20261126 (https://download.01.org/0day-ci/archive/20261127/20261127003812.SJ4m3pfw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127003812.SJ4m3pfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127003812.SJ4m3pfw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vkms/vkms_connector.c:88 function parameter 'connector' not described in 'vkms_connector_init'
>> Warning: drivers/gpu/drm/vkms/vkms_connector.c:88 function parameter 'connector_cfg' not described in 'vkms_connector_init'
>> Warning: drivers/gpu/drm/vkms/vkms_connector.c:88 function parameter 'connector' not described in 'vkms_connector_init'
>> Warning: drivers/gpu/drm/vkms/vkms_connector.c:88 function parameter 'connector_cfg' not described in 'vkms_connector_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
