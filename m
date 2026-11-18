Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965502;
	b=Y0jyF+BbrsGdhC7CGRe6MBW1AzHKVEpLOusv6Pm1YHTcdGzSjq7eLUTO+fAZypqbSzRP
	 gYCYpQanCefV16BEipfONA7H8DMz9O7aOj7geM3QNMWfs3YmSosII4ajsxezk2iEsn63C
	 J2GKxP/aWhE/adHq9vxtHVA+LBYyqMsqTPlCozR/qv/M/L6+/Dxzv+5KeY84nUldFDx0D
	 8FR2q46QqLdOzU++4Nh/7/5MEqH149a41KywbMYs4TRxxkNaN41c8blwO1bH0AKMBOdtF
	 LE8Np18iuizzNShRHv+6Mio/uGzB+r6vgLaIoZfccJDrVuzHecI+BrjaPhYURReiP8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965502;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zAkIjPRIUy+1ibZd/Ym2UtI/sxpiyDfTk20BZIJIObg=;
	b=ri6vj5kMzOvJdtCgGOUR1uFMCbH7OqPR07M3rSAhdlvDK40/nMBJALj4v9i8GyYpZ+/Y
	 vlYhHfcH86DX+4ED59AkmJNkGGYMIXwCw1EOn+MuPLCRPaJBDdKjqCiY+beRcsx5OYALo
	 5w9JAytIUbjCkOc00bzYjlpr0CjvAB+NmzfB/wiCrXKTWJl2DmCes8eAUrr/CNexIRscF
	 9knxJydL+KZchZxqpaT22rsvYEMi8/Dns1tso9amYnaimEFKgmZ9RW3gOTGOypCr+iWS7
	 VlX9zjzkbpmDnUCz/HEPCMOSUw/zhIcjhARPM0izedhe147JxCmwMLAO/NgVNqgdWvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l8AMW8Fj;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C97606A32F
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 01:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C97606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l8AMW8Fj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794965502; x=1826501502;
  h=date:from:to:cc:subject:message-id;
  bh=RwRQLziripNf4YKGn/tlNGeuqGUG89PjV5qkMtUDkS8=;
  b=l8AMW8FjqSmjVy2w6N26iXu5lCr91sfdRoCe7kNaRUmrd1ey2aa5/5Pt
   HdFZuacJ4uMqksHsFI45MOrPp0oDcm7WeFCRCmvtLLLz05CbICYU/WgEc
   ePlq2AtNyA5sYhbKegg/hYtjr1DIEQbcPtkp7HGuXhDjWCAKyfJfH4VMT
   s06AjusfJWLYntnIsFrAa/QKLLRMxRnVVcFlW0Uc5UyjsOvZGwrwy2ygE
   HlfEraPZnqNh1wJ5Bs5x2YaM8QDYwyNL9kQKFVqWFq+xlPuzhW1fmevzA
   SqpDmmRTGvCvrCpJkpwdS7w1Xuq6WTNtq7IA1TZ2Bso/7KsM5Qq9h8JNY
   g==;
X-CSE-ConnectionGUID: PYblOgzTSH+uq0XTZ8SdPg==
X-CSE-MsgGUID: cxU9HhSZQLCFPalSZFWWlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3660280"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3660280"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 17:31:42 -0800
X-CSE-ConnectionGUID: NkoLg0pUQS2O6OeSSZ/X6g==
X-CSE-MsgGUID: qRpJMjONRIqj0EPmHlYtYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9909026"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 17:31:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTUWP-000000003HW-2paZ;
	Wed, 18 Nov 2026 01:31:37 +0000
Date: Wed, 18 Nov 2026 02:30:44 +0100
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [dhowells-fs:netfs-next-3 5/17] htmldocs:
 Documentation/core-api/bvecq:250: ./fs/netfs/bvecq.c:67: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <20261118022449.06BFWl7F-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-3
head:   e74086cfeb13e6550daa03bdc877b5bc8f3a9864
commit: dc8006b617d9c43da48d339b85cf3b4c78d2007d [5/17] iov_iter: Add an API document for the bvecq structure
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261118/20261118022449.06BFWl7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118022449.06BFWl7F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
   Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]
>> Documentation/core-api/bvecq:250: ./fs/netfs/bvecq.c:67: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/core-api/bvecq:250: ./fs/netfs/bvecq.c:141: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/core-api/bvecq:250: ./fs/netfs/bvecq.c:146: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/core-api/bvecq:250: ./fs/netfs/bvecq.c:198: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:387: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
