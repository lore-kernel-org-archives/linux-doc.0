Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636A03064AE
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784492090; cv=none; b=FtUXqiOdXxVEPqP73LNGAV5BdZ9eVsLfFUkcMsYZWsUtUy3GKKQP62XFesZpYUCEr1F4JCnHe1n+sgagT7TF/JZtu19Bki7Zgut49dDflIXb8/50B9qwBNDaC9DgUh+NMfilinW7tfT8yV0po09OMbRWfyDxRsCbycOaq2hHaXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784492090; c=relaxed/simple;
	bh=aUf8kHcE4wTtuaSw3o4n+qJZf3TK7aocdYKH8Q2zb6o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DZPT84JSAZXUFGhGVLIyZHHaHT4EyWejJ2EDfFYAEybgrVz0ujlATf9AR/AMLpKFkGJDf8NuCJ5bn37IJWLKUvm0TL5j9pTs7cC6eIcfndXZMBGqLiYYZGnmW3c2VeQlKkpXi07Paz3TFqWRGXMKZtCDGB/PlOk84YbigjusV+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/w3splJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/w3splJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784492087; x=1816028087;
  h=date:from:to:cc:subject:message-id;
  bh=aUf8kHcE4wTtuaSw3o4n+qJZf3TK7aocdYKH8Q2zb6o=;
  b=P/w3splJmrxX1hblrsFKaXyEUBuiwwgfNrlRlQEB0YrEPN0VECN3aLch
   hGjy0ccJG8PokLGGh7KsMUpcF6utyFS/Hk6BPugu3h4S/Zx7af8IKmxJz
   4311Bw2oAGWrN6XKMfWw6ZS/DcUOqVMRejM9TtgmOUgVRgcs5ZXI5LSh2
   C1vgjkGwgMyXkrdp76GM+nTQ+S0uoKhRaLJQCu3Ph76tUBkEByQlWu9fM
   0wH3hLrk57ufxPbkTiIchCt2nq+pVGkjh687ng+YgiN3lecL14Y7GqyFV
   wk9trmPzXPGBey47g2QcmcoRHO0QmkN6tMR6HNDJeHYnFg5LoK6fB6pfR
   A==;
X-CSE-ConnectionGUID: NdJseTUlQdCk2nZvozQi/w==
X-CSE-MsgGUID: SZJ1HPWuSLCXY+Q9sph+wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="72618325"
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="72618325"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 13:14:46 -0700
X-CSE-ConnectionGUID: eAfAdT8IS5uVw4eS8GR1eA==
X-CSE-MsgGUID: OsH3fgGuSd69uUpq40YpwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="260842893"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 Jul 2026 13:14:45 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlXuM-0000000063x-3Wd8;
	Sun, 19 Jul 2026 20:14:42 +0000
Date: Sun, 19 Jul 2026 22:14:26 +0200
From: kernel test robot <lkp@intel.com>
To: Wensheng Wang <wenswang@yeah.net>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
 linux-doc@vger.kernel.org
Subject: [groeck-staging:hwmon-next 51/58] htmldocs:
 Documentation/hwmon/mpq82d00.rst:4: WARNING: Title underline too short.
Message-ID: <202607192203.4qtHWNRY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   428f63b8f73dd48efa8fa17330d8769ad765afd9
commit: cac7a93ef369c067263a2a7090b68177336c8fad [51/58] hwmon: add MPQ82D00 driver
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260719/202607192203.4qtHWNRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607192203.4qtHWNRY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/hwmon/mpq82d00.rst:4: WARNING: Title underline too short.


vim +4 Documentation/hwmon/mpq82d00.rst

     2	
     3	Kernel driver mpq82d00
   > 4	====================
     5	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
