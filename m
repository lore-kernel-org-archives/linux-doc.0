Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40E5C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 20 Dec 2021 14:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbhLTOLL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Dec 2021 09:11:11 -0500
Received: from mga07.intel.com ([134.134.136.100]:12377 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233500AbhLTOLK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Dec 2021 09:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640009470; x=1671545470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zS9JlipLnIF6Cr3H8Jd74Gbk+KYjuyX9wfBp0LlELRA=;
  b=Kbd7i2bFoMZzfSBP0ZnH4q9nbou7BU2lh434OZoifbbNGsIRRgKXs402
   ZloYcjNKXvKO3tqk6cdU4qRJ6K/99hydQ6fd1E0c84JeaaOshXjDoR0Wl
   sVxFZYslIDvBWi8xs9xoqB1TEPMq+YHIuECv9an5DU7/HGRopnniJ3x4/
   RLLBQK6gzz8CyrvnoiAknjTMp+s6TnsGTzTUrD/SNn/fKQNdKJoF4KPvC
   PMbAASF8iSmxaQq7xoSUU51PBq6hHQmYEjahaWkj9Vteq3Q3ghCW5qjma
   U3QA3O7lFU/N9CGeYJKU75KrWC90WMB+CQHsh1A0mr23JoSPBP0NxUOMj
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="303544089"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="303544089"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 06:07:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="547344094"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Dec 2021 06:07:08 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzJJj-0007pW-Mm; Mon, 20 Dec 2021 14:07:07 +0000
Date:   Mon, 20 Dec 2021 22:07:04 +0800
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
Subject: Re: [PATCH 2/2] nvmem: expose NVMEM cells in sysfs
Message-ID: <202112202227.nt77aHJ2-lkp@intel.com>
References: <20211220064730.28806-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211220064730.28806-2-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi "Rafał,

I love your patch! Yet something to improve:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on char-misc/char-misc-testing linux/master linus/master v5.16-rc6 next-20211217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rafa-Mi-ecki/sysfs-add-sysfs_add_bin_file_to_group/20211220-144856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git aa483f3ce655ed9ee4f32d050d1822eec2d20ada
config: m68k-m5208evb_defconfig (https://download.01.org/0day-ci/archive/20211220/202112202227.nt77aHJ2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8408088794497c22b0fd47fe2f5e5add1ab00ec9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rafa-Mi-ecki/sysfs-add-sysfs_add_bin_file_to_group/20211220-144856
        git checkout 8408088794497c22b0fd47fe2f5e5add1ab00ec9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=m68k SHELL=/bin/bash drivers/nvmem/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/nvmem/core.c: In function 'nvmem_cell_entry_drop':
   drivers/nvmem/core.c:452:38: error: 'nvmem_cells_group' undeclared (first use in this function); did you mean 'nvmem_cell_lookup'?
     452 |                                      nvmem_cells_group.name);
         |                                      ^~~~~~~~~~~~~~~~~
         |                                      nvmem_cell_lookup
   drivers/nvmem/core.c:452:38: note: each undeclared identifier is reported only once for each function it appears in
   drivers/nvmem/core.c: In function 'nvmem_cell_entry_add':
>> drivers/nvmem/core.c:509:15: error: implicit declaration of function 'sysfs_add_bin_file_to_group'; did you mean 'sysfs_add_file_to_group'? [-Werror=implicit-function-declaration]
     509 |         err = sysfs_add_bin_file_to_group(&dev->kobj, &cell->battr,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               sysfs_add_file_to_group
   drivers/nvmem/core.c:510:43: error: 'nvmem_cells_group' undeclared (first use in this function); did you mean 'nvmem_cell_lookup'?
     510 |                                           nvmem_cells_group.name);
         |                                           ^~~~~~~~~~~~~~~~~
         |                                           nvmem_cell_lookup
   cc1: some warnings being treated as errors


vim +509 drivers/nvmem/core.c

   495	
   496	static void nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
   497	{
   498		struct device *dev = &cell->nvmem->dev;
   499		int err;
   500	
   501		mutex_lock(&nvmem_mutex);
   502		list_add_tail(&cell->node, &cell->nvmem->cells);
   503		mutex_unlock(&nvmem_mutex);
   504	
   505		sysfs_attr_init(&cell->battr.attr);
   506		cell->battr.attr.name = cell->name;
   507		cell->battr.attr.mode = 0400;
   508		cell->battr.read = nvmem_cell_attr_read;
 > 509		err = sysfs_add_bin_file_to_group(&dev->kobj, &cell->battr,
   510						  nvmem_cells_group.name);
   511		if (err)
   512			dev_warn(dev, "Failed to add %s cell: %d\n", cell->name, err);
   513	
   514		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_ADD, cell);
   515	}
   516	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
