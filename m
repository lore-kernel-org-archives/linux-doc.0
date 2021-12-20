Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CAAC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 20 Dec 2021 20:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhLTU0a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Dec 2021 15:26:30 -0500
Received: from mga18.intel.com ([134.134.136.126]:59334 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229461AbhLTU0a (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Dec 2021 15:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640031990; x=1671567990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uAz97FAQaKQOFJA/nlaXdTZFYNWOUofAtQU2ymK0R5k=;
  b=TzcJkgd0TMq4vY59kMvlO2vP0bwFoNOrhC06C4d63rTiX+vASxf/dPWH
   Fi7DKZDuf5RzxYmb2ll82uhi3ujMtJhye30A5IYzJIULiw0HF/lgT+/nM
   vABHCwIjlvQClI9s6VzeGz7mgigoVnTtaU9abbdcdDI52a3m0soqq054u
   Y5sx+Kevk7uR/Z8a0anEYFlxKfwset7+ec7Mz37Qj/qJiUOsJz6rGZpf0
   OA/+05xT0EA4d/Zzy0hpv0O6nq9aOyja+W7FmYLDGY44TChRAk4eCvEkW
   YDMdHojB3I7MXIF8gwx43i9RpfCJBQaarEOOtZ3G3xjO9FWG7MmwXEOcp
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="227118646"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="227118646"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 12:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="757417071"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 20 Dec 2021 12:26:26 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzPEj-0008CX-83; Mon, 20 Dec 2021 20:26:21 +0000
Date:   Tue, 21 Dec 2021 04:26:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     kbuild-all@lists.01.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Dan Williams <dan.j.williams@intel.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] sysfs: add sysfs_add_bin_file_to_group()
Message-ID: <202112210456.vwGC0F3M-lkp@intel.com>
References: <20211220064730.28806-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211220064730.28806-1-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi "Rafał,

I love your patch! Perhaps something to improve:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on char-misc/char-misc-testing linux/master linus/master v5.16-rc6 next-20211220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rafa-Mi-ecki/sysfs-add-sysfs_add_bin_file_to_group/20211220-144856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git aa483f3ce655ed9ee4f32d050d1822eec2d20ada
config: x86_64-randconfig-s021-20211219 (https://download.01.org/0day-ci/archive/20211221/202112210456.vwGC0F3M-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/a9802080b6d35af5dfd7ae847a0978e47caafd59
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rafa-Mi-ecki/sysfs-add-sysfs_add_bin_file_to_group/20211220-144856
        git checkout a9802080b6d35af5dfd7ae847a0978e47caafd59
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/sysfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> fs/sysfs/file.c:379:5: sparse: sparse: symbol '__sysfs_add_file_to_group' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
