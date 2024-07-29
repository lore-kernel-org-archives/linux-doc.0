Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA2418F2FC
	for <linux-doc@vger.kernel.org>; Mon, 29 Jul 2024 22:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722293532; cv=none; b=UTYpCI8ZnYKmPlpzRGxzsA2VND8cig1/hbjr9cdOL8Zh/Y7ncyK4F2T43L0fMODPpGXkQXg72WUHogXKhxL0tp9sphrz+Eb0MeaPsopGNKBZaoyXIOL6iVtxseGRmrwJ7S01D2CSHmYXvTeHpEGXhAY5bjy5+xNNSBiYQU1KNwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722293532; c=relaxed/simple;
	bh=EJSwlSm8eCcJpGYlpOEzmLrTY0E/UPfdfjMSIGHuCRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JZCEFVETS8J2vMhZ28DBR4ZxcHquoSSYaxceWxv6KMrre69kb8g4DjjMUXreQMF/UFxh7Rh+zL3mG33SUpDwOooOrdq/MogQJNWDLiLyzbMPED1X61ZO349mtaItbWLGkaX+9WmZFvs1fXROy2e4yOs/IAUTbXmd4Wl4ygVhmPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvNFQ/gu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvNFQ/gu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722293531; x=1753829531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EJSwlSm8eCcJpGYlpOEzmLrTY0E/UPfdfjMSIGHuCRk=;
  b=DvNFQ/gunwCGQe8NPPvq6En3gCvYbtWf3yYiVWmy1612gptTcZE+VCSQ
   Easd+r+gqNDH84YC8LGvwaBZY+53cajJjJw0ZJaxw8zji4W3dAd3R7Izk
   KAPZNo6p8Eb/Iay1p2PjMDVPeaSmCitzi9eUZJsd+LE7XB/DzoVxjWi4C
   GVpMvtAOFJAkERSCbbpNOOojxxIiLjzSTGr+pZBIivbxT6+iNnaO92dhN
   MNCbsvnUH+2sBHJK35o3qJiqIePkdfgfPxkFitFl6WwFxyqMgP6NiX5N/
   28S80fuSozwC96xTcojyiCUhcbF8CsHD57wFWSBayQKYnmKCJFciX0zfp
   A==;
X-CSE-ConnectionGUID: uP3P/e62Tv+k3xlCfmMt5g==
X-CSE-MsgGUID: mefEozBUTxaaAVWRRIn4Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20228989"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20228989"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 15:52:08 -0700
X-CSE-ConnectionGUID: mC6hFsI+QOeLtgPTT8n+hg==
X-CSE-MsgGUID: MyGaBhRESsunygTjrtmUKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54925187"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jul 2024 15:52:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYZDn-000s9g-22;
	Mon, 29 Jul 2024 22:52:03 +0000
Date: Tue, 30 Jul 2024 06:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-doc@vger.kernel.org
Subject: [asahilinux:bits/005-maintainers 1/2] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/usb/apple,dwc3.yaml
Message-ID: <202407300611.ba2No4ej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/005-maintainers
head:   e58fcf1783e145ebf6a5e11dd9e7a4f26d2fb88b
commit: e67eef26afff00da3e58d4d53ec8dfff8aacb8b2 [1/2] MAINTAINERS: Add Apple dwc3 bindings to ARM/APPLE
reproduce: (https://download.01.org/0day-ci/archive/20240730/202407300611.ba2No4ej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300611.ba2No4ej-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/usb/apple,dwc3.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
