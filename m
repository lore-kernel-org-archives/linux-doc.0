Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930AC377EA5
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 23:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773704515; cv=none; b=iW6JD8wyksqqnKNnry85Hj7Eh06eE2KhWsagzklfhlRsmv3wFZ+QDoYJVmHWd5SbTJa21u9oiVqd9krMwbCVz5Szz18UEZ4sVnyvF6e/vq9xhw6MoRre8FIOlkZ6G72kye0OBZy+zvsPBBSFiXhVn3n/U+aTDBx9J5m71LygNnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773704515; c=relaxed/simple;
	bh=q6bqC0pIQ+NfjOxHKAbqC6VyliaQB+n6SnBf0DIRPps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EifLhAaIJGiNTWT7TrfiC3HqVoY/fV4JFmNfjF0snWeL9SN+QQscvUVQQCxbhd1S6x5QLKdr6hQRJ84El8aRR2Oby+iqVsLI7pGQxQ9VsC+5daXUWrQdVd8FqETsNJnfNgxfWQRgXwvXAR/EaOMs+bk8l1zX8yxiadUK0f+aiZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrGDs0AP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrGDs0AP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773704514; x=1805240514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q6bqC0pIQ+NfjOxHKAbqC6VyliaQB+n6SnBf0DIRPps=;
  b=jrGDs0AP6QREiuYmH2rImq1Ne7T1Ta8pw4PPICyWQy2IljzHNZFrFFWp
   WmR0BFFlKYTuafteXhyuCROQPbS9jtDA8XGTjB/1ar5dNbRQjv13SDIXa
   H2BFupuvGghGOITVxL+Zyds59dYmH0SbXp+j973BIr0vFJIWlg5ai+rhz
   o8dk3xe5xZYvSGEgMpqHi7URLW/ipV16h51RjSNSFvIiMsaK4nyuNf+Ns
   Z5v4uiOMF+Ey8R/bT+OK5Fn1l+H4DK6JlMK1JNPbQLxFkGgsfyikZbL6Y
   kp4XoMjxmNJhCTrzPav+/jxHsu099eocH22uZblklGZPsmiho/X/aC0OC
   A==;
X-CSE-ConnectionGUID: 3dtC1MKcRHOul8DSqQwu8Q==
X-CSE-MsgGUID: cEc0t8boQ4u61+TKjt63cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="100186558"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="100186558"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 16:41:52 -0700
X-CSE-ConnectionGUID: XGH68MigQQC1IhtgZp4uAA==
X-CSE-MsgGUID: F1S7uDaLS9iD7NWJonNLwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221106760"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Mar 2026 16:41:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2HZE-000000004Jx-0XLb;
	Mon, 16 Mar 2026 23:41:48 +0000
Date: Tue, 17 Mar 2026 00:41:37 +0100
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [linux-next:master 5891/6556] htmldocs: Warning:
 include/linux/drbd_protocol.h references a file that doesn't exist:
 Documentation/application-resync-synchronization.rst
Message-ID: <202603170037.XxWCThM4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95c541ddfb0815a0ea8477af778bb13bb075079a
commit: 59f03ec44e87aaf5b153440601e62f1c1c5260cb [5891/6556] drbd: update and move protocol definitions
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260317/202603170037.XxWCThM4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603170037.XxWCThM4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>> Warning: include/linux/drbd_protocol.h references a file that doesn't exist: Documentation/application-resync-synchronization.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
