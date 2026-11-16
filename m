Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832345;
	b=t6djLzGEtvy6MCMMyJOTfPJ/O3eXrgieVI3hDlivQ8XQ+AZ8O59Dq7AQcFPJfVZEZyO2
	 TVvW5MqKwghSfPpQJN4xv50a0kKxc5yO/9VnVas9toaoDfnG2aEs7N0LI71ZZIQ8SoAg4
	 0zApTZHQz4o1lHwUwUXwKEOX6RjAMXYkgZ8bu7K/zVB1UaDM/VKPxRWmYPigZkj8lsZ2u
	 i+aSUsgryRa0t4GEM7O3vtkRRNWY4iCyVktWyoItcIUzhsCOnPOlYRgbAzqWW6L+QPrHc
	 Qbnsh8kh6/9FgnasNZ4h+MqbH4qIw6NWvALBdJX3oDNZb4ZMqEeeJ6/X+oWpU17bYYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832345;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pigN0TwHVFmm/Lpkxlh7y58k5LzszIkx0oLKuJzOHZk=;
	b=HO39iKHEZgtvU4lkHylz4d3ccgox1iYQ46/Lvqd36jfc0ZdBuxbRpf5atPCk72ha4VD/
	 tffQgG0GLkQHQKtCFoJi57SeOjORF6dN/UYAlECZ+wBbvA7NRdMuzF1Cre5bXYiOksI7y
	 ORIamrAVVFW1NzRRRwvFyPc1JUnBCqzn/EPJRE8k1a+hTcWK0WK18RN60K7216Plb8qJ5
	 FXDEC+xDVvnj/hZlC3RbfZ5imdkxv3qj9MP3hrxZijG7syEjCYNku3UKk0Zf7+EJ06GT8
	 hvyjQoPqXdOP07ttweVpV/B7dw1xLZlKpfVgKnjoHrYL0fokV8TbEmfe62SPSdezQqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZnJ2ZlOF;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B96D606A323
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 12:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B96D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZnJ2ZlOF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794832346; x=1826368346;
  h=date:from:to:cc:subject:message-id;
  bh=xTXSPRD0PNI1pCuFlOHDLTk4M3/8czMzLCQ9s6UJH08=;
  b=ZnJ2ZlOF1K8lrSL7BgUwLhIpTm443aJ0Yc6oO5bb7lJtdnbvR1Tr5eXw
   MtQTg7+Rf9i+30b8nBQpnUdvc3YKP+4PY8HY/3m79FU0zC6BAzlkJprwf
   FrqFhr1SZuNWIqQEIXY47hRBJkm8uRtbgA1LPwCPUZRhfH+vyNunnV+Rn
   j8UQmJww49oNoSYHOBG/KpIDXFZOnSj5h6fZnwmiRPZhRhKWVpZDFPIjt
   m3AtTGb46QqfFSHcMO57cQm5LkwyxypjvBv7ukXkgNQH1Az61tx9+YOkm
   e13OreY1hTuUdaBOAoo2wzaPJLkxqaFFhfId6oUCy19kjCZQUftVuD87c
   w==;
X-CSE-ConnectionGUID: XDVWX1S3Q6efnWSRIACLBA==
X-CSE-MsgGUID: 8+D7LzAlRhGs2ZcnFVGoeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3483625"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3483625"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 04:32:25 -0800
X-CSE-ConnectionGUID: XiRsNwnnRF+h7QLScstBGw==
X-CSE-MsgGUID: V6bh0VJTQ3+7HQ8Vn96GOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9671376"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 16 Nov 2026 04:32:22 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSvsi-000000002gd-2CoN;
	Mon, 16 Nov 2026 12:32:20 +0000
Date: Mon, 16 Nov 2026 13:31:32 +0100
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [mhiramat:topic/wprobe-v2 29/32] htmldocs:
 Documentation/trace/wprobetrace.rst:98: WARNING: Block quote ends without a
 blank line; unexpected unindent. [docutils]
Message-ID: <202611161301.mWpmGnus-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/wprobe-v2
head:   07317b7122771533c64d5b50a83441c05b880db4
commit: 5a377e479f85fd078a29a1f4fa0f816f42dab205 [29/32] tracing/wprobe: Add set_wprobe and clear_wprobe event triggers
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261116/202611161301.mWpmGnus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161301.mWpmGnus-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Blocker fields
   ~~~~~~~~~~~~~~ [docutils]
   Documentation/trace/wprobetrace.rst:97: ERROR: Unexpected indentation. [docutils]
>> Documentation/trace/wprobetrace.rst:98: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/userspace-api/landlock:771: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +98 Documentation/trace/wprobetrace.rst

    94	
    95	Notes:
    96	- set_wprobe only works on the wprobe which is NOT set a valid address yet,
    97	  and it must be enabled after the trigger is set.
  > 98	- clear_wprobe only works on the wprobe which is set a valid address, and it
    99	  will be soft-disabled after the trigger is cleared.
   100	- Therefore, if a trigger sets/clears a wprobe, other/same trigger events
   101	  will not work (on the same event) while the wprobe is set.
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
