Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE436402BAF
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 12:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777551519; cv=none; b=YPSBzDVQUppU/6DNYOev6ebGeRzsAeHPHS0SstCuJQyIbJZcwScrmkh+dAAB8Q8pVm+4SbInQcLObiE7WhNZtUjNmOIXROa9cuFLZQ2z6pOo//tG/azGctVl8spEBlLAtJRW0UdLYC6lRFXj/mjfABuxNdxf//sRMa+D0PLNOSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777551519; c=relaxed/simple;
	bh=rVklRIRZYDFnVAt4xwUDSYYqKzPfmoTODe4qBkBZBYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u+ZcdQnqpamJD52+30cFgcIAl6GSVz6DyE00pLF6MeASbVMnL3OeQXS3sem/UgzxhErMeynYkSxZvSys9WhcmFrEU0gmZW8Zx2XR8d72QuxRJABEmRzkknRY8fm1Cu6iFsZftpkAiJ8fCJ/HjA4SZe8pej1IQQPDisVIc3qjSM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UljrYmEK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UljrYmEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777551518; x=1809087518;
  h=date:from:to:cc:subject:message-id;
  bh=rVklRIRZYDFnVAt4xwUDSYYqKzPfmoTODe4qBkBZBYk=;
  b=UljrYmEK0cbIP7orUTFaxZJpFVQO65TeQaoRZ9f4WMLSAJz9oJqMfqXj
   bzK3hRT/YfcfUHu6n731hXeMRlawdVUaqC2yDvTI0RP1Tg2Q0bWXsRavd
   R9+ywr7e4Y90mm658tu+mxXMB8eF/GbGRtekGdvGRrx1I+w5wAs1bhwKo
   MVJ5ofbd0JiQ2M/E6CtcR7YRRyuAvC8wtMcAe6RY/7h+ktSeeQOHzj87U
   1PPrwnUMJGehbYwQKrIV1a70iCB+DbLfWD/rNkRMrcQZHa11g1xmkNEHO
   8eNMasipOP/ipi0nRHJ/XZfulFJNzNki7TEp4TCnjR4sPnan1BvaA8dS/
   A==;
X-CSE-ConnectionGUID: 9ooE/Io9R1er0UQhHc9ufQ==
X-CSE-MsgGUID: XeUbOVy3TaW9FsdeUL/BHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="101163774"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="101163774"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:18:37 -0700
X-CSE-ConnectionGUID: HXfYdtDXSkS5mqRZT2oMsQ==
X-CSE-MsgGUID: W70nrv0KTfWXSCTrajHdMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="233724608"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 30 Apr 2026 05:18:36 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIQLh-000000004ot-3YzH;
	Thu, 30 Apr 2026 12:18:33 +0000
Date: Thu, 30 Apr 2026 14:18:31 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/networking/device_drivers/ethernet/index.rst:10: WARNING:
 toctree contains reference to nonexisting document
 'networking/device_drivers/ethernet/cirrus/cs89x0' [toc.not_readable]
Message-ID: <202604301418.xWBPHv08-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andrew-Lunn/drivers-net-3com-3c509-Remove-this-driver/20260424-104110
head:   9223eb1499a6a614ff3744386dc2b772907adc68
commit: ece15657f74a8fe0c3cf05e2837534bb570a85bc drivers: net: cirrus: cs89x0: Remove this driver
date:   6 days ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260430/202604301418.xWBPHv08-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301418.xWBPHv08-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Non-Preserved Properties
   ======================== [docutils]
   Documentation/networking/device_drivers/ethernet/index.rst:10: WARNING: toctree contains reference to nonexisting document 'networking/device_drivers/ethernet/3com/3c509' [toc.not_readable]
>> Documentation/networking/device_drivers/ethernet/index.rst:10: WARNING: toctree contains reference to nonexisting document 'networking/device_drivers/ethernet/cirrus/cs89x0' [toc.not_readable]
   Documentation/networking/device_drivers/ethernet/index.rst:10: WARNING: toctree contains reference to nonexisting document 'networking/device_drivers/ethernet/smsc/smc9' [toc.not_readable]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:48: ERROR: Unexpected section title.


vim +10 Documentation/networking/device_drivers/ethernet/index.rst

132db93572821e Jakub Kicinski 2020-06-26   7  
132db93572821e Jakub Kicinski 2020-06-26   8  Contents:
132db93572821e Jakub Kicinski 2020-06-26   9  
132db93572821e Jakub Kicinski 2020-06-26 @10  .. toctree::

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
