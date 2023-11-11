Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEF67498
	for <linux-doc@vger.kernel.org>; Sat, 11 Nov 2023 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lStATqVr"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC5A111
	for <linux-doc@vger.kernel.org>; Fri, 10 Nov 2023 23:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699688312; x=1731224312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C6BY88badSpVTD6TKEk2NjB+fBSGGycdZUunr9OjOA8=;
  b=lStATqVrdc70PTW7ZE8iwkL8/nWk0L9RAukeZXxY36U+mHweyieyyvjM
   RUEc9hASQU6EaOK1KyqjEHzJFwjBlNAHaMDA39nAwONsXHi3ul6iJnSOd
   L+7ybROpqxG/8FHCd5NVLR+oz14vkh3qXG6L0pPcIx5fv1Z/v+0DDqK5F
   OQQLeRCmPwzt1yGvS2/v4aeyRrzHxFC29wcyU4DWgHgi1D+ZapRlge+cX
   9yoR+pr2R+hMMWGTarftsDJGLZJhYPVEEShr97c48FUrxw0QEOCW7WPOH
   UqjFb20cUORBW+/tPEgYRWvdZP2v1G/oXi1e1PuKUIJ5u0F/zxg8xhGQy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="454563379"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="454563379"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 23:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="740318734"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="740318734"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Nov 2023 23:38:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1iZY-000AIj-0e;
	Sat, 11 Nov 2023 07:38:28 +0000
Date: Sat, 11 Nov 2023 15:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Riana Tauro <riana.tauro@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>, linux-doc@vger.kernel.org
Subject: [drm-xe:drm-xe-next 1708/1927] htmldocs: Warning:
 /sys/devices/.../hwmon/hwmon<i>/power1_max is defined 2 times:
  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:0
  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:8
Message-ID: <202311111546.yozUaR9N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   b3890fb4386dcef68a96888141c4cc773f6241ce
commit: 1be1e64c654d3c9a22badb904e5b889372c0c918 [1708/1927] drm/xe/hwmon: Expose power attributes
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311111546.yozUaR9N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111546.yozUaR9N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:0  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:8
>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_rated_max is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:14  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:22

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
