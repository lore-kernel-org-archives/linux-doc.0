Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBC531691E
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762948621; cv=none; b=Zl67FDZgbRadPeXIEjr4iQD9gdTIHpLaduEATzplgHVkN7ZjM29DNXeHQVeGuNPmAamrW62uZUf4HXXDuMXSeONAG3uFF4WwBQxTELpAacl3vF2L969r++1S/yWQAB7/7ji6YQ/i/wC/RSqFa2fiflaXLb/TVP/p/r4maBKIap0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762948621; c=relaxed/simple;
	bh=CZ16LxSwwgK4ebq8l7kpJKEY6aiRedDYFlM/GPLHSqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lky1JS2HDNQAa0bPmjuWUsybJORFXDby4PC+0tUzQgp7H+d/AYkAI6GIwF6zagXRBiZpLwXJrdRglHONcKb29A60C8jwOdRLUu+zzkLKtZqzTextyWZ7cdShfwL695HXDx7wq1GrHTfi79dXhs9pIRdczx27zGVFegBsBNyNxNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adK2rOhn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adK2rOhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762948620; x=1794484620;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CZ16LxSwwgK4ebq8l7kpJKEY6aiRedDYFlM/GPLHSqU=;
  b=adK2rOhnLu3WrJmb6Airqfru2wNIZ0Wmgf2HbV7Hm1WlCC/SVhNuNtSs
   fVVW/1QUDK9nEBG7dIeYWHxyrid0InwhWs+7czF8cFq+GnYC2GCWcGIbp
   +6dJ/z5pW6141RQjXnuQlpSnbI3kRPrZXtaaHVGoPs6XY+gyChPexQGLM
   NucNMzf9lAywU+lCoEFAH5LeyDKHtx2TbXjPc38cyzUbUYolNcDHw4tSA
   1qPv9/MaQiTMJ5gGmi8ETmfYJtAOGYh4Dbwd9O5cvgLpRAbTCLc9a4n0J
   /2ie+v1UzK9rmWJRzJheizZbzd3bgRdRekP+eIiAhBhBiD3/0d8jcj7AL
   w==;
X-CSE-ConnectionGUID: c8QtKgZjSFC6a1SvlL4OXw==
X-CSE-MsgGUID: ObxXcm2aSjGaZkLUc0NjCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76467787"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="76467787"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:57:00 -0800
X-CSE-ConnectionGUID: tTD/D1HeRoGo0TMoyxM8eQ==
X-CSE-MsgGUID: gtqhXKGPSQKPii8SPzcnyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="193323564"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.54])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:56:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-doc@vger.kernel.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/4] Documentation: clean up subproject index boilerplate
Date: Wed, 12 Nov 2025 13:56:50 +0200
Message-ID: <cover.1762948491.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Only very lightly tested.

Jani Nikula (4):
  Documentation: remove subproject index links deep in the structure
  Documentation: streamline subproject index link in translations
  Documentation: include the boilerplate for SPHINXDIRS index link
  Documentation: use a source-read extension to include the index
    boilerplate

 Documentation/RCU/index.rst                              | 7 -------
 Documentation/accel/index.rst                            | 7 -------
 Documentation/admin-guide/aoe/index.rst                  | 7 -------
 Documentation/admin-guide/auxdisplay/index.rst           | 7 -------
 Documentation/admin-guide/cgroup-v1/index.rst            | 7 -------
 Documentation/admin-guide/cifs/index.rst                 | 7 -------
 Documentation/admin-guide/device-mapper/index.rst        | 7 -------
 Documentation/admin-guide/gpio/index.rst                 | 7 -------
 Documentation/admin-guide/index.rst                      | 7 -------
 Documentation/admin-guide/kdump/index.rst                | 7 -------
 Documentation/arch/arc/index.rst                         | 7 -------
 Documentation/arch/arm/index.rst                         | 8 --------
 Documentation/arch/arm64/index.rst                       | 7 -------
 Documentation/arch/loongarch/index.rst                   | 7 -------
 Documentation/arch/m68k/index.rst                        | 7 -------
 Documentation/arch/mips/index.rst                        | 7 -------
 Documentation/arch/openrisc/index.rst                    | 7 -------
 Documentation/arch/parisc/index.rst                      | 7 -------
 Documentation/arch/powerpc/index.rst                     | 7 -------
 Documentation/arch/riscv/index.rst                       | 7 -------
 Documentation/arch/s390/index.rst                        | 7 -------
 Documentation/bpf/index.rst                              | 7 -------
 Documentation/cdrom/index.rst                            | 7 -------
 Documentation/conf.py                                    | 8 +++++++-
 Documentation/core-api/index.rst                         | 7 -------
 Documentation/core-api/kho/index.rst                     | 2 --
 Documentation/dev-tools/index.rst                        | 8 --------
 Documentation/doc-guide/index.rst                        | 7 -------
 Documentation/driver-api/80211/index.rst                 | 7 -------
 Documentation/driver-api/coco/index.rst                  | 2 --
 Documentation/driver-api/crypto/iaa/index.rst            | 7 -------
 Documentation/driver-api/crypto/index.rst                | 7 -------
 Documentation/driver-api/cxl/index.rst                   | 2 --
 Documentation/driver-api/dmaengine/index.rst             | 7 -------
 Documentation/driver-api/driver-model/index.rst          | 7 -------
 Documentation/driver-api/early-userspace/index.rst       | 7 -------
 Documentation/driver-api/firmware/index.rst              | 7 -------
 Documentation/driver-api/index.rst                       | 7 -------
 Documentation/driver-api/memory-devices/index.rst        | 7 -------
 Documentation/driver-api/pci/index.rst                   | 7 -------
 Documentation/driver-api/phy/index.rst                   | 8 --------
 Documentation/driver-api/pm/index.rst                    | 7 -------
 Documentation/driver-api/serial/index.rst                | 7 -------
 Documentation/driver-api/soundwire/index.rst             | 7 -------
 .../driver-api/surface_aggregator/clients/index.rst      | 7 -------
 Documentation/driver-api/surface_aggregator/index.rst    | 7 -------
 Documentation/driver-api/usb/index.rst                   | 7 -------
 Documentation/driver-api/xilinx/index.rst                | 7 -------
 Documentation/fault-injection/index.rst                  | 7 -------
 Documentation/fb/index.rst                               | 7 -------
 Documentation/fpga/index.rst                             | 7 -------
 Documentation/gpu/drivers.rst                            | 7 -------
 Documentation/gpu/index.rst                              | 7 -------
 Documentation/hwmon/index.rst                            | 7 -------
 Documentation/i2c/index.rst                              | 7 -------
 Documentation/infiniband/index.rst                       | 7 -------
 Documentation/input/devices/index.rst                    | 7 -------
 Documentation/input/index.rst                            | 7 -------
 Documentation/isdn/index.rst                             | 7 -------
 Documentation/kbuild/index.rst                           | 7 -------
 Documentation/livepatch/index.rst                        | 7 -------
 Documentation/locking/index.rst                          | 7 -------
 Documentation/mhi/index.rst                              | 7 -------
 Documentation/netlabel/index.rst                         | 7 -------
 Documentation/networking/device_drivers/atm/index.rst    | 7 -------
 Documentation/networking/device_drivers/can/index.rst    | 7 -------
 .../networking/device_drivers/cellular/index.rst         | 7 -------
 .../networking/device_drivers/ethernet/index.rst         | 7 -------
 .../device_drivers/ethernet/mellanox/mlx5/index.rst      | 7 -------
 Documentation/networking/device_drivers/fddi/index.rst   | 7 -------
 .../networking/device_drivers/hamradio/index.rst         | 7 -------
 Documentation/networking/device_drivers/index.rst        | 7 -------
 Documentation/networking/device_drivers/wifi/index.rst   | 7 -------
 Documentation/networking/device_drivers/wwan/index.rst   | 7 -------
 Documentation/networking/diagnostic/index.rst            | 7 -------
 Documentation/networking/index.rst                       | 7 -------
 Documentation/pcmcia/index.rst                           | 7 -------
 Documentation/peci/index.rst                             | 7 -------
 Documentation/power/index.rst                            | 7 -------
 Documentation/process/debugging/index.rst                | 9 ---------
 Documentation/process/index.rst                          | 7 -------
 Documentation/rust/index.rst                             | 7 -------
 Documentation/scheduler/index.rst                        | 7 -------
 Documentation/sound/index.rst                            | 7 -------
 Documentation/sphinx-includes/subproject-index.rst       | 4 ++++
 Documentation/spi/index.rst                              | 7 -------
 Documentation/target/index.rst                           | 7 -------
 Documentation/tee/index.rst                              | 7 -------
 Documentation/timers/index.rst                           | 7 -------
 Documentation/tools/index.rst                            | 7 -------
 Documentation/tools/rtla/index.rst                       | 7 -------
 Documentation/tools/rv/index.rst                         | 7 -------
 Documentation/trace/index.rst                            | 7 -------
 Documentation/translations/it_IT/RCU/index.rst           | 7 -------
 Documentation/translations/it_IT/core-api/index.rst      | 7 -------
 Documentation/translations/it_IT/doc-guide/index.rst     | 7 -------
 Documentation/translations/it_IT/i2c/index.rst           | 7 -------
 Documentation/translations/it_IT/index.rst               | 7 +++++++
 Documentation/translations/it_IT/locking/index.rst       | 7 -------
 Documentation/translations/it_IT/process/index.rst       | 7 -------
 Documentation/translations/zh_CN/admin-guide/index.rst   | 7 -------
 .../translations/zh_CN/arch/loongarch/index.rst          | 7 -------
 Documentation/translations/zh_CN/arch/mips/index.rst     | 7 -------
 Documentation/translations/zh_CN/arch/openrisc/index.rst | 8 --------
 Documentation/translations/zh_CN/arch/parisc/index.rst   | 7 -------
 Documentation/translations/zh_CN/arch/riscv/index.rst    | 8 --------
 Documentation/translations/zh_CN/core-api/index.rst      | 7 -------
 Documentation/translations/zh_CN/doc-guide/index.rst     | 7 -------
 Documentation/translations/zh_CN/driver-api/index.rst    | 7 -------
 .../translations/zh_CN/driver-api/phy/index.rst          | 7 -------
 Documentation/translations/zh_CN/infiniband/index.rst    | 9 ---------
 Documentation/translations/zh_CN/kbuild/index.rst        | 8 --------
 Documentation/translations/zh_CN/locking/index.rst       | 7 -------
 Documentation/translations/zh_CN/networking/index.rst    | 7 -------
 Documentation/translations/zh_CN/peci/index.rst          | 7 -------
 Documentation/translations/zh_CN/power/index.rst         | 7 -------
 Documentation/translations/zh_CN/process/index.rst       | 7 -------
 Documentation/translations/zh_CN/rust/index.rst          | 7 -------
 Documentation/translations/zh_CN/scheduler/index.rst     | 7 -------
 Documentation/translations/zh_CN/sound/index.rst         | 7 -------
 Documentation/translations/zh_CN/userspace-api/index.rst | 7 -------
 Documentation/translations/zh_CN/virt/index.rst          | 7 -------
 Documentation/translations/zh_TW/admin-guide/index.rst   | 8 --------
 .../translations/zh_TW/arch/loongarch/index.rst          | 8 --------
 Documentation/translations/zh_TW/arch/mips/index.rst     | 8 --------
 Documentation/translations/zh_TW/arch/openrisc/index.rst | 9 ---------
 Documentation/translations/zh_TW/arch/parisc/index.rst   | 8 --------
 Documentation/translations/zh_TW/process/index.rst       | 8 --------
 Documentation/usb/index.rst                              | 7 -------
 Documentation/userspace-api/gpio/index.rst               | 7 -------
 Documentation/userspace-api/index.rst                    | 7 -------
 Documentation/virt/index.rst                             | 7 -------
 Documentation/w1/index.rst                               | 7 -------
 Documentation/watchdog/index.rst                         | 7 -------
 Documentation/wmi/devices/index.rst                      | 7 -------
 Documentation/wmi/index.rst                              | 8 --------
 136 files changed, 18 insertions(+), 935 deletions(-)
 create mode 100644 Documentation/sphinx-includes/subproject-index.rst

-- 
2.47.3

