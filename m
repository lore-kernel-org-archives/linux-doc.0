Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40224168C2
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekvFZKl6"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C64FE
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697706727; x=1729242727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wUzQY02fbDbKVC6vTQhGWzPlhEhCPvJNMeg1h1q3XwQ=;
  b=ekvFZKl6dzg7AmICYeFiPlcXMEgfLdZcLl1/y7c9vJVIP4mfNtOoHufV
   eTT3Y/b7uNyd2tFweDVJnVVbMiKYu/IDU1F2RPT7wTH3NC2RQKowWd3ke
   +OuzzrLhyKbaQgIWwflOBdsmelI64tFB7j7/QE+m4jMVpkftMROB4pNQi
   yrK9P2D20BIbyqU0LNt4U8HWkPCfADc5nrJco3Olb9sCS3IN/xZPsxWvs
   +N1VygQ/457xYjOkVMcj5qybrGPFJhns6dxlPCbWRpQhVrvvSRAoSGqdu
   mfdiZ6UXFW61n3ZOHS0PtWsExm+iU4CGBJRbD/Swn72xq3nSQH9gjlSHh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="383430505"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="383430505"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 02:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="706790714"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="706790714"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Oct 2023 02:12:03 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtP4S-0001ug-28;
	Thu, 19 Oct 2023 09:12:00 +0000
Date: Thu, 19 Oct 2023 17:11:00 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [esmil:visionfive 25/51] dtbs_check:
 Documentation/devicetree/bindings/reset/starfive,jh7100-audrst.yaml: title:
 'StarFive JH7100 SoC Audio Reset Controller Device Tree Bindings' should not
 be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202310191701.UhzAJMqm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   0f773a07e5c8a56f5ad75d722157b4b71634b645
commit: b564e5387f9e3a7806b524ebba8b6d597c4ce101 [25/51] dt-bindings: reset: Add starfive,jh7100-audrst bindings
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310191701.UhzAJMqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191701.UhzAJMqm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/reset/starfive,jh7100-audrst.yaml: title: 'StarFive JH7100 SoC Audio Reset Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
