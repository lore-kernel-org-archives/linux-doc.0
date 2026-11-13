Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538648;
	b=amsmsqxF7DpFzTRv8uNOpcqXqjgAEMVqoPSPOUEBFVP8tB69M7kjXAhxPpIxokvFra6k
	 7OVkEaM8VBddc1uiRKf3jlXw+CIbB31ClLg0je/hp1Tv9LAF48aNn2Tlqlf+idzoTpxuh
	 e0mSPU3VSFAHqC5hVpq4YtCyNZkqSME777jj6VFShsGbUnQ+DA/1Q0ZwYO5zvxAPhxzAt
	 vEHA7OXisGnfieqgUjzA2xaP1CLTweOoO3SZoS2XlRT/dBjBUG5Skd/Jzzlu5vQ9n0xx5
	 bHYspbdST1ZY9N1cpLdC6E862/9PipHnN0j83q/gTgx/FpFLFMF1fzQZnjZLNlURhcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538648;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/BLjIp7LQel1rITKidY/UDZ/He83YSDISQKcmQPTMmM=;
	b=S4NAKvoPygpFmDZzrGoT3Rseh3NeDdjkpaFilBalVcqoyecDOpVFSkQqOLADrEVbPnGF
	 vwB4pFNxdVDBLp84mK9xmwgzJyiw6AyBTnk/hXJW9LoXoyNFZIDJkbAfrCJy8CzHksIcX
	 e9myJpoXC+nYFStur7mKKGz5Ttb/ZH4PX/BZhF/wXHE+vm6DKC+9J11p3CAKxBCE4qfBW
	 NndUPcqqUOTYX4KqFlmD1nMcvTCdPW83TPZpcx5DtWCasVTb7WHpj74ZCx+nEZItX2Sge
	 IGOPxgsJeeWDflF9gDQ645dB2Ly7beDxUuYlIBe5xLxR2mUd9yuMvbGPdnu/NZMm5Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DWBZqLBL;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84670606A31C
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 02:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84670606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DWBZqLBL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794538648; x=1826074648;
  h=date:from:to:cc:subject:message-id;
  bh=pDAIlkt1RAOy0BNi6S5Z6/O1no1SdZun5zbkAGMwAn8=;
  b=DWBZqLBLd+/hy6yX7auhMqwXKjTACsgh83c6XBjNOCd+833bzLxPi86+
   drrpMQR5KAeTNJ3lveugN02tGk0rpzDyLtNRTQOoMhtu91uXYOpbQFdVY
   70xHxS5TsNoabKoouwSd6wUectfzv6o/uhvtMDW8MtKVS91CPSonrKNYN
   +9jXEEpp59Gggdn7ssJIxY9ziIzvAuAdj43jfs3Ww5qq7pRec58kyPbHa
   4xsPXlSlJ80k3HCYcWw+PvyElTJZK3vwbVDbvvaX/apH4nKwU8NMT2KpE
   8ps95SngyNy+E8lReSp9RF42EDfZaj4JMvdheJZSfOEponAavnthQQ1e6
   A==;
X-CSE-ConnectionGUID: LR8DpiagQlSavErgDPp2Mg==
X-CSE-MsgGUID: OFDB9k3ESoejFB2itoWv7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3200251"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3200251"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 18:57:27 -0800
X-CSE-ConnectionGUID: RDAeBbEbTS2GOfkdlLPopQ==
X-CSE-MsgGUID: EQpwzxmKSKO7zMyyPz7qxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8971211"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2026 18:57:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRhTf-0000000015V-0RLr;
	Fri, 13 Nov 2026 02:57:23 +0000
Date: Fri, 13 Nov 2026 03:56:41 +0100
From: kernel test robot <lkp@intel.com>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: [docs:docs-next 24/36] htmldocs: Warning:
 Documentation/doc-guide/checktransupdate.rst references a file that doesn't
 exist: Documentation/process/foo.rst
Message-ID: <202611130347.6z3dpT1c-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git docs-next
head:   2138148bf44fd84d3e0a863f0e8cb3627cdcc606
commit: 64e0d8dcdce89129a075e765b640f5ffc46a3015 [24/36] docs: improve translation update checks across locales
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261113/202611130347.6z3dpT1c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130347.6z3dpT1c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: Documentation/doc-guide/checktransupdate.rst references a file that doesn't exist: Documentation/process/foo.rst
>> Warning: Documentation/doc-guide/checktransupdate.rst references a file that doesn't exist: Documentation/translations/zh_CN/process/foo.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
>> Warning: Documentation/translations/zh_CN/doc-guide/checktransupdate.rst references a file that doesn't exist: Documentation/process/foo.rst
>> Warning: Documentation/translations/zh_CN/doc-guide/checktransupdate.rst references a file that doesn't exist: Documentation/translations/zh_CN/process/foo.rst
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst references a file that doesn't exist: Documentation/filesystems/gfs2-glocks.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
