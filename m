Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B048E16400
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 13:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mH1NPlPL"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8798A2
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698671923; x=1730207923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fBmPXx5EprEyBzJ34PpeBBxbc5KCPSxgmxz7V3OKh0g=;
  b=mH1NPlPLiEvurZsQ24Xzg81tdlwHj/5B7Gd5xsRXQpsjHG67qglVTlgH
   ITdNuSVrNz6/5ZBFb6cPbGLTjZ9KpMnxmZ5zn5JvgR1lNv+7WMdWHNdzi
   1belsO1x0XlPPWV61uteH08jFoq8rYp7qy4ZMx2/6an/98z94rMHfCsAH
   rD4CI0H3TaFS2ODaIU+X2Ld6W11/qYtUT0m2nu8pH2Aq4QRPHnFMu48xr
   n/TN2mKSnNjCK1YAmrSYmwVkZmuMplr/lx5of3gdAaT5NoYYHySSsgxS2
   e38oD5I1z98i113lCRCbTTuGhDkvkW9d17hoPDwCMc8mWLO/AGTfcQVa7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="910325"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="910325"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 06:18:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="1462148"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Oct 2023 06:18:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxSAB-000DI7-10;
	Mon, 30 Oct 2023 13:18:39 +0000
Date: Mon, 30 Oct 2023 21:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Chester Lin <clin@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Jan Petrous <jan.petrous@nxp.com>,
	linux-doc@vger.kernel.org
Subject: [chesterlintw-s32g:s32g-gmac-devel-6.6-rc7 2/5] dtbs_check:
 Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml:6:10: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202310302108.7EnG5NKF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/chesterlintw/linux-s32g s32g-gmac-devel-6.6-rc7
head:   ac69f501fdc08f9c7dd913621f6f09f34cc7dd65
commit: 9580d2091ae382dfb3e349500d4530bd7f81a8e0 [2/5] dt-bindings: net: add schema for NXP S32CC dwmac glue driver
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231030/202310302108.7EnG5NKF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310302108.7EnG5NKF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml:6:10: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +6 Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml

   > 6	$schema: "http://devicetree.org/meta-schemas/core.yaml#"
     7	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
