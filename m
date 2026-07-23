Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E12392825
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 22:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784844896; cv=none; b=IrhFIMRAZlG2bDVqBTCeZHMKXPFTV+4qsTMyFtYmwVyGr7uBaUn81+VXiPA9N+ecu1h1D9T413qWzCI8Pk0lN/bnvi9k3xAEkslUrf2eVlsBpiQNXweQrPU8YsQdwtAxabVxIEqnJQgxQOimPGNYoj//EY6cltP2Ftwb0C5jEsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784844896; c=relaxed/simple;
	bh=AqLqP1qUz/2R14lcBpsh6LkGL2O0HNx9VcWOasao/mU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FDFLdLy5z9oDNnfV5PxHZycudsozGieTu9AvpQY2C9W1EMvo2so0T+6pmRwI2kq/xJMb5LUWAFMRI5zRUoPgq26B4/oOENmS0oyUcuFfltVkBkYOO+kfEg97NmzaInIEcPJdneRC/B7h4Hu/eIL7ZVbLDXdJV3SukxeVwUvJRrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAuXKY6Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAuXKY6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784844895; x=1816380895;
  h=date:from:to:cc:subject:message-id;
  bh=AqLqP1qUz/2R14lcBpsh6LkGL2O0HNx9VcWOasao/mU=;
  b=dAuXKY6ZWZVHnM3/suAf7YTII5AhKdq7QDm6Jjn4XVoCilg1WdGTw7xU
   E7iZsA2h6WMGJ61kpyVb6hsb/aBoPRWi2U53x2vU2omfY4hdZeiC+ekUY
   HQR9F3yRI49kPglAAIJ1o+L2UhXaXwOo10nQv3En8coGyWaIbDeLoWOpY
   EEoHa3h5ke6VQTMmAMtaObosWHAj488LzCKsjSxpjjBUhdTpSSrzHe/tq
   r2fU2JregP4QclQW/tkh+GEmGCWqE5lTA4fYqEia1Sw+X7RA7hqfnIfYD
   CEmf/sgPJuk2mXo2e0jQ1zvn6ibN9FgZagbLZsNaOdJr++RuVeH6YRFNn
   A==;
X-CSE-ConnectionGUID: LmMGBXTsTHaD3jkn6g1REg==
X-CSE-MsgGUID: bVtCOLDXSa+Tc3E3cntswg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95867302"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="95867302"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 15:14:54 -0700
X-CSE-ConnectionGUID: lhqO18QDS26rbPJM7KJtVA==
X-CSE-MsgGUID: QXECBlnzS6mP6fOc6mP/RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="262323356"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Jul 2026 15:14:53 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wn1gp-000000000qc-1PFh;
	Thu, 23 Jul 2026 22:14:51 +0000
Date: Fri, 24 Jul 2026 00:13:54 +0200
From: kernel test robot <lkp@intel.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/hwmon/mpq8646.rst: WARNING: document
 isn't included in any toctree [toc.not_included]
Message-ID: <202607240042.RTbezkhc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vincent-Jardin-via-B4-Relay/hwmon-pmbus-event-notification-with-alarms/20260723-215736
head:   5888684fbfe4c2df4051b175e2b234bc14efddd3
commit: 5888684fbfe4c2df4051b175e2b234bc14efddd3 hwmon: pmbus: add MPQ8646 driver
date:   8 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260724/202607240042.RTbezkhc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607240042.RTbezkhc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/hwmon/mpq8646.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
