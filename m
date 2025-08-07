Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34E24C6D
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 15:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754580817; cv=none; b=KpPKREkaf9TMUxfzW22Y9Oiom9tZAZ0kN50ZXlcApPQfVhTwxmRRbxOk7Cxmzl7GYxl0S6ANrAe5QxVaUdyUCFM5pXOYTKBgKDu3uiwfwgAZ9UqIhHHPEL5Swc3lKm2hIEvc3dbwoDSHJtNieYYbwXWP4XyL59zIjiv7ZH8B6PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754580817; c=relaxed/simple;
	bh=FnUPB7qv30FA9oqfJQeIo6iP24gxoG1IpXSWOd8UpiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QP48ecdOy5MUbsCdE/vF5euiWHk1mLIViXav6sZNhKjZTrFHU8LuXx3W+2klNqnXBIR/cFGp4Eaxk5pSZGcjGh+mLwZhlxe4CLP6KkU3OmrQCNYnvUvsPMsE9ho+qG0Xg6u2TEPjkihIegaMjWyJIy89JfV4wwPRsxDLVL98J8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8B6sQfY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8B6sQfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754580816; x=1786116816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FnUPB7qv30FA9oqfJQeIo6iP24gxoG1IpXSWOd8UpiQ=;
  b=W8B6sQfYsH1x0bXUxRy1lDjHWGdci3cGPzBHEaEMog+nO9BoYmz3sWSH
   mPFpZdOG8T/bJXpd9YN6JNFMsRgIHugn26jhTKjwNYTV6nz7aas82r6zE
   3Kin54pal/+1+QHDUs3p98OloRD7VjEds9cXMapDj+G/OzkgloMOZg0S9
   mhM0EQ3fYS0GeuzKD+nES3/CxkHp13HIGCmly2Vb9Bljr9kcKdW5WVhyk
   jWNKhjtot5HuKTU8tAcNXggbr7qZDFfaKL5cahDn34AbzfW7b0yjlny2q
   z+CxQj+9EkMZ7poeLF0uBPpN7d91dsem46E94+iKZLpvk9q19eR8LURDt
   g==;
X-CSE-ConnectionGUID: 9sof5ka7Rp2l0BbAhIZuEQ==
X-CSE-MsgGUID: W7fiO4DSRzq4e3hzqw8zmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74374972"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74374972"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 08:33:35 -0700
X-CSE-ConnectionGUID: o1CHXdWvQDSW10VkV6+4Rw==
X-CSE-MsgGUID: dkmXxvFfTbqS9ZMXUrL3SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165097478"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2025 08:33:34 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk2cV-0002UF-2w;
	Thu, 07 Aug 2025 15:33:31 +0000
Date: Thu, 7 Aug 2025 17:32:42 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 186/801] htmldocs: Warning:
 Documentation/hwmon/vexpress.rst references a file that doesn't exist:
 Documentation/devicetree/bindings/hwmon/vexpress.txt
Message-ID: <202508071725.Rt2GN27p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 8aeff7f162304fd086eb251accbf61a6e5364d7a [186/801] dt-bindings: hwmon: Convert vexpress to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071725.Rt2GN27p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071725.Rt2GN27p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt
   Warning: Documentation/devicetree/bindings/thermal/armada-thermal.txt references a file that doesn't exist: Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
   Warning: Documentation/devicetree/bindings/thermal/armada-thermal.txt references a file that doesn't exist: Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: Documentation/hwmon/vexpress.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/vexpress.txt
   Warning: Documentation/trace/rv/da_monitor_instrumentation.rst references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
