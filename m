Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021689;
	b=YZaF/+e/J+3gI0OknKe7WKceRuBHUMcvKNjwXPwcEkujVP+WR+ZOjWRnHENQWGR+DPFq
	 rk2XkaI7GYCteiH495zxDX2NlJX+gI6n+kP0qrBL1AK5bWcs95vNgHdCu4+cblK/ifv4f
	 6X8y4eks2Dy+YKsVX4nvRhAprPbIeelVh82ZIQzY8aFUAQGBtFQB6qVikrK1Yi7ICXpZB
	 Gl3v4RpcxiYc8hXNdaKgIgDMtbfTPSqPRHBzYd2SIdLngp1CA/dxeMgNPAUa/dtZTphyV
	 P1625BxJniWCBmlQHeefQDyb9ITwhMip9K2zLJzYKkxisZXM6MMDbjpP3XrImfUCyWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021689;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TOy6Rp+SHX253BVVCK7BxgoCgOVIqjjf5EEKxqzkVDw=;
	b=CaTM2Kq/HQ1vE9lyUmhp383fQHok6CX30lt+y0RpMInZqKtLcdu20x0OwLBG/eYj2f6X
	 kLCmQGrVDb+cf1aaEObybV1bExDn1ELYoW4tiqwsd3Po1SsM6vGzVxDhJB2ZFk6uM2NJ8
	 PFsMRIZmjALROo/MZ1OKhwscOxNav7WldxmrLwIHHwUl5C++ZhtHh7kbQwmT3ivixgtVp
	 EdATIf+/NIg/vXYoNDkorFYqAkC+x1UrOsKzHi06Rz1i4DxV8gOpNHWzzn6CdF7zurtYY
	 tZ3ARM9h9zgPUvSULm5ohGIkoqwmFSf1qsdbATisE4oK7prPCl1Z9wjPULH4XAXngFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bTTRTyXa;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDF1606A331
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 17:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FDF1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bTTRTyXa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795021689; x=1826557689;
  h=date:from:to:cc:subject:message-id;
  bh=7BgtQytgClffo55bh3tN0xto9a1fHoF02AITgnNbZu4=;
  b=bTTRTyXav2gir84OK72NXvOZuvRjIxdsPY3i+1ExVg2b1Cd/by+/ZHcN
   LrWoXx+LAxLxMcjwFaDXLKhgkRUSM510ziY5V2KAe0DHIiDYLNKfZ4tez
   Oy/n3jXZNu9LKPKYqgnR4E4u5TKaspVqu6UMJ+8EZedinLaVYYjEXstGC
   51SBvdgZ+bdN/VSJvUsq9zkCa4XEZzX24/PrBLWVnZeIyyXZyuGqhPbJX
   sTvC4yvcuaWZ8dtdDoT1nhm9xTJtmGvE06YIp9g+7nwXrps9wzoCWXDq8
   oJgLgVEVS2qDFMDzzsy0ahbJorcbso76hyplDae4p62rk0rAJH4gQWDvZ
   w==;
X-CSE-ConnectionGUID: CsaBI1EPTziaE7KaO0BXkw==
X-CSE-MsgGUID: 1E2XIqxjS7y5HHAs6oPFiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3724756"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3724756"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 09:08:08 -0800
X-CSE-ConnectionGUID: ZKqKzDxcSz2T7s/AOUPKQA==
X-CSE-MsgGUID: 1PruIKKASVK8yeb12KeMsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12140044"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 18 Nov 2026 09:08:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTj8e-000000003Qs-1mx3;
	Wed, 18 Nov 2026 17:08:04 +0000
Date: Wed, 18 Nov 2026 18:07:23 +0100
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [davidhildenbrand:b4/skb_refcount_overflow 2/5] htmldocs:
 Documentation/networking/kapi:26: ./net/core/skbuff.c:3915: WARNING: Block
 quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <20261118180045.xkMPPkgU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

tree:   https://github.com/davidhildenbrand/linux b4/skb_refcount_overflow
head:   489a68ccaede05a4e7a94bda9052caaed9ea199c
commit: 3c7472c30f7a0080454073070f1f62fa07d3c43d [2/5] net: skbuff: limit folio refcount when copying skb frag references
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261118/20261118180045.xkMPPkgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118180045.xkMPPkgU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
   Documentation/networking/kapi:26: ./net/core/skbuff.c:3914: ERROR: Unexpected indentation. [docutils]
>> Documentation/networking/kapi:26: ./net/core/skbuff.c:3915: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/networking/kapi:107: ./include/net/net_shaper.h:76: ERROR: Unexpected section title.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
