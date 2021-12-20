Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B9BC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 20 Dec 2021 14:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233482AbhLTOLF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Dec 2021 09:11:05 -0500
Received: from mga05.intel.com ([192.55.52.43]:46003 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233480AbhLTOLE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Dec 2021 09:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640009464; x=1671545464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0XcNLixrtr2QjXg1MaKB5fuQPBpmBxmMJ668nUAmjJs=;
  b=IDW+upGxLOp9nQmhAQylU7OkSUOU+1YSNRW+miIH6YM1GLdjGt+IrtaK
   RyAPF+eJdzg2ZNB6dlSuMhcXz5Ec0q0ilSJ3T3w+lgVo0hF/T178Z0WX8
   9vME9kzx1QMGJTNEe/9Y+3B96bTl+qidUZMzKy9AD6bW/FWwiwXMCfNYo
   mBr6d4gl5/QhM6ppWPtlaQeYUJVLmKoFx8LuL7C4JW4VSdi860whM1Bcr
   WEvh7iTr4kc0zU13sp/RADTLBZkLWaFwpiM3JxGvwFkIK5bJcMP6XE5Fx
   0pbtaAdEpTh15pdAuNoHW3eCVNpLkzR2R+Aqq/GmJyVqpHTshwhPX1LBN
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="326467964"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="326467964"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 06:08:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="467398710"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Dec 2021 06:08:20 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzJKh-0007qE-RY; Mon, 20 Dec 2021 14:08:07 +0000
Date:   Mon, 20 Dec 2021 22:07:49 +0800
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
Message-ID: <202112202251.hdWPQftO-lkp@intel.com>
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
[also build test WARNING on char-misc/char-misc-testing linux/master linus/master v5.16-rc6 next-20211217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rafa-Mi-ecki/sysfs-add-sysfs_add_bin_file_to_group/20211220-144856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git aa483f3ce655ed9ee4f32d050d1822eec2d20ada
config: nds32-allnoconfig (https://download.01.org/0day-ci/archive/20211220/202112202251.hdWPQftO-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a9802080b6d35af5dfd7ae847a0978e47caafd59
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rafa-Mi-ecki/sysfs-add-sysfs_add_bin_file_to_group/20211220-144856
        git checkout a9802080b6d35af5dfd7ae847a0978e47caafd59
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nds32 SHELL=/bin/bash fs/sysfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/sysfs/file.c:379:5: warning: no previous prototype for '__sysfs_add_file_to_group' [-Wmissing-prototypes]
     379 | int __sysfs_add_file_to_group(struct kobject *kobj,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   fs/sysfs/file.c:383: warning: Function parameter or member 'battr' not described in '__sysfs_add_file_to_group'
>> fs/sysfs/file.c:383: warning: expecting prototype for sysfs_add_file_to_group(). Prototype was for __sysfs_add_file_to_group() instead


vim +/__sysfs_add_file_to_group +379 fs/sysfs/file.c

   372	
   373	/**
   374	 * sysfs_add_file_to_group - add an attribute file to a pre-existing group.
   375	 * @kobj: object we're acting for.
   376	 * @attr: attribute descriptor.
   377	 * @group: group name.
   378	 */
 > 379	int __sysfs_add_file_to_group(struct kobject *kobj,
   380				      const struct attribute *attr,
   381				      const struct bin_attribute *battr,
   382				      const char *group)
 > 383	{
   384		struct kernfs_node *parent;
   385		kuid_t uid;
   386		kgid_t gid;
   387		int error;
   388	
   389		if (WARN_ON((attr && battr) || (!attr && !battr)))
   390			return -EINVAL;
   391	
   392		if (group) {
   393			parent = kernfs_find_and_get(kobj->sd, group);
   394		} else {
   395			parent = kobj->sd;
   396			kernfs_get(parent);
   397		}
   398	
   399		if (!parent)
   400			return -ENOENT;
   401	
   402		kobject_get_ownership(kobj, &uid, &gid);
   403		if (attr)
   404			error = sysfs_add_file_mode_ns(parent, attr, attr->mode, uid,
   405						       gid, NULL);
   406		else
   407			error = sysfs_add_bin_file_mode_ns(parent, battr, battr->attr.mode,
   408							   uid, gid, NULL);
   409		kernfs_put(parent);
   410	
   411		return error;
   412	}
   413	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
