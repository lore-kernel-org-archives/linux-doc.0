Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4A97CF16
	for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 21:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719609232; cv=none; b=UK1com/Mnsp/uiB7FICfJhw16AWzO752Rk1NL7MWWiH7OrcyYrJTrdJgBKwbaUodN/u8V08lGMnsopexo6VUB2uwq84+oGn/XzM558tInJBvfru7NMUUFRn7ZBslyOgm9TUlavVgZ3s2nGcmozlX1RXvLXzv7vMb1pNwmWmrZyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719609232; c=relaxed/simple;
	bh=rcq0CBNdH9/HbkNZOXGVIt8R7lyhg6gNjzCq1VjpI0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kbje9e6aRFJjheyfjeywZ5Xqe0mZm0/aEnKs6ja3lF32z8uXZMcTsFUFrxuh1zDBbbm8ibyQMqNCsgDp/WlXa3tFUBcSUOfA8FjbNsM3MHUgW4UzpxpfDAu4kQ7jyjHOBXhM9Oz3L4Rt8ziw8sXMBoKJQhnE+2zQ3lnGikLumMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asjqmspT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asjqmspT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719609230; x=1751145230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rcq0CBNdH9/HbkNZOXGVIt8R7lyhg6gNjzCq1VjpI0Y=;
  b=asjqmspTWcgnrZONTWthxnHU298Sh1iiv+z+m15CEinNIdmOvj8ZGBKI
   Q4zx0Q/ORTK4ts+q60rb13eeELhuHemw1h5zSqzYqBctmsKbOosgVAv91
   YMyky1wDwIZeUwBdg1DEEIIlFMjNgst0XWWT8xtWylMqJR17oFm5aRHPS
   +khlkGJLljdAYFBOdB8NUZpkSSqR5XuuZ42/5QQH+6zgmZFh5v7UcNG6U
   wWUNXfgvlo/cZPhjJwq0+tTCMqVezRzNnggB6Qe/FlubjvWXkJedsY6Sl
   DavG1W5Sf96xx6KEcIe1WPhfrkzJ3AeV5GGkke45Cw5CKS8eDDxrVWQcB
   Q==;
X-CSE-ConnectionGUID: jCwVCrA1Ssmzn8a41do2YQ==
X-CSE-MsgGUID: ytq9QwuaTeOC96UzK94K7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="42226277"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="42226277"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 14:13:41 -0700
X-CSE-ConnectionGUID: eL0VABp6SuW1CTy/hqejpQ==
X-CSE-MsgGUID: bPSXXLdrSjijBpfmf7z87A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44838889"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jun 2024 14:13:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNIuY-000IUK-1b;
	Fri, 28 Jun 2024 21:13:38 +0000
Date: Sat, 29 Jun 2024 05:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [morimoto:sound-ak4619-for-upstream-2024-06-28 5/8]
 Documentation/devicetree/bindings/sound/simple-audio-mux.yaml: state-labels:
 missing type definition
Message-ID: <202406290553.oLOBg3m5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-ak4619-for-upstream-2024-06-28
head:   1fcff128782574ab57b108b58c74363f602252e6
commit: ad1349eda3c8e174887cff500cf17d1b02b192d7 [5/8] ASoC: dt-bindings: simple-audio-mux: add mux-names property
config: csky-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240629/202406290553.oLOBg3m5-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290553.oLOBg3m5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290553.oLOBg3m5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
>> Documentation/devicetree/bindings/sound/simple-audio-mux.yaml: state-labels: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
