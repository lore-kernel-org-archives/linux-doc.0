Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEED73A5430
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 05:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735518; cv=none; b=dwZSUgbVXVSajhsRFcNzJkTncIr6dh+EYY8UJRNk8Ai/f7JiUpUJU9VrWxGNx2e3G08MxN5aFmXDGgDEqivo5Uqa5G2MoBhnSYzoBUBGGmBU/IDhTTH/Del4GYk2REwTIqJzBqcr9zEq3H+cVf2pCsrCVAxgpkCedgXJDM0kAag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735518; c=relaxed/simple;
	bh=oCcChryUQFv/Qj0t9HGpwBva0VV0aG4p68fVuqZW4io=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q2uyaZ2CncAHNYX+IwIBtHHiwQIXc6sBU4r/nnDlwlBh9ilaPeUJvR7QC7phCOKLf8hRwp9A4a8udMQCvLORHv+7Y2tQHUFBEjFlLIWYZJQztL8NZ7j/7cQQUruhyOQke6pj4cqSo66U7Y1uuwuX2VtLSCWxh3S5I4njFaEJZT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIaZrtQP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIaZrtQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778735517; x=1810271517;
  h=date:from:to:cc:subject:message-id;
  bh=oCcChryUQFv/Qj0t9HGpwBva0VV0aG4p68fVuqZW4io=;
  b=HIaZrtQPzFaRXVHiAlU4/crhBEKiEJchrjeK9I8Ya0wunJudqyAlK5nx
   IWuaPHe13NNyvk6X2QokwyXBZOSlS+GDSZ1p1wA5ctD8osEkUIJ9g4M3+
   +UCaMJs4Lo15kTkIB8ukfNzjDKZIBDz6v3qsHRipL5yrA65WB1p79vrnV
   2tI/aEpqN8Dv6RyKcFILZTE4G8iWFoY6VukN5pNx2iMtnzk9h0glJD7+j
   1c2oikH7BmXDCtvnPX2wpIVfw+UU9H57GpqKZJO26snD/HgNfV38tzWqz
   G1EhCge2s7I4VK5KIRfvxZ26M3Ec4Yia9oU5U4Q01vEYFwuzUVess8KNB
   A==;
X-CSE-ConnectionGUID: UL4pI6+VTu2l3BU9AYNdpA==
X-CSE-MsgGUID: fttZcVUrQzSAt4RPLKpcIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91057363"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="91057363"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 22:11:56 -0700
X-CSE-ConnectionGUID: z+4e/TN5RbqfFRSFrSZOlQ==
X-CSE-MsgGUID: do/KjxSxRqKEqzkZ6c5KuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="237302800"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2026 22:11:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNOMR-000000008l1-3yzl;
	Thu, 14 May 2026 05:11:51 +0000
Date: Thu, 14 May 2026 07:11:49 +0200
From: kernel test robot <lkp@intel.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/virt/kvm/api.rst:6589: WARNING:
 Literal block expected; none found. [docutils]
Message-ID: <202605140717.W1StD3Ke-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Amit-Machhiwal/KVM-PPC-Book3S-HV-Validate-arch_compat-against-host-compatibility-mode/20260514-003250
head:   14b4e064019c3de50b10ce42416ad214e65ab27d
commit: 14b4e064019c3de50b10ce42416ad214e65ab27d KVM: PPC: Document KVM_PPC_GET_COMPAT_CAPS ioctl
date:   12 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260514/202605140717.W1StD3Ke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140717.W1StD3Ke-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/virt/kvm/api.rst:6589: WARNING: Literal block expected; none found. [docutils]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]


vim +6589 Documentation/virt/kvm/api.rst

  6588	
> 6589	H_GUEST_CAP_POWER9  (bit 1): KVM guests can run in Power9 processor mode
  6590	H_GUEST_CAP_POWER10 (bit 2): KVM guests can run in Power10 processor mode
  6591	H_GUEST_CAP_POWER11 (bit 3): KVM guests can run in Power11 processor mode
  6592	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
