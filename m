Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCD12C195
	for <linux-doc@vger.kernel.org>; Fri, 22 Dec 2023 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiQHGzMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703269650; x=1734805650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pt9b0Hgh0C7Pk9dPUYOu38GqDSdHInoSNZujqodFUsA=;
  b=FiQHGzMzhP3vnxaMX9cgsIoyp/sYD1N0KeM3WygQ8zSigL4FLumX7raC
   iGgJuCdOl2OP7GQoeKkPZDaWJdPzx2e1oXwHYAGO61NWlYAAj2g/eAybe
   3RtVIJd86YqQzCcRVDoEi0k3GvhhwFX8YB7x8XcWVCvY/TbnhSmwtfmMl
   DUOTL390hTzrVILJc34/BiV1jOJYl2HOSbYHIPxAFXt6aOEPladYWQ8J/
   Vq15tx5SCHmzDlvihgJzxAQNFfgW382v4ZkwcqZKKy8gijRrSmHr/T1vB
   3LLXExvtc0ZpA4jRV8V3UcAdqFxFCMVAGe9DWFm77go8fc4AUNufNjgz5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="398925280"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="398925280"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 10:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="867697922"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="867697922"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Dec 2023 10:27:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGkF4-0009kR-2G;
	Fri, 22 Dec 2023 18:27:26 +0000
Date: Sat, 23 Dec 2023 02:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [dhowells-fs:crypto-krb5 3/21] htmldocs:
 Documentation/crypto/krb5.rst: WARNING: document isn't included in any
 toctree
Message-ID: <202312230235.JDvyYSLu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   ebd44e15422341724b06a3a13590ea80244ebbd6
commit: 2d17e825b2f65fd09877bdc1e2fa6236726bf57a [3/21] crypto/krb5: Add API Documentation
reproduce: (https://download.01.org/0day-ci/archive/20231223/202312230235.JDvyYSLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230235.JDvyYSLu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/crypto/krb5.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
