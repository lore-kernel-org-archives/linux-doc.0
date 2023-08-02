Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818F9C001E0
	for <linux-doc@archiver.kernel.org>; Wed,  2 Aug 2023 20:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbjHBUo3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Aug 2023 16:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbjHBUo2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 16:44:28 -0400
Received: from mgamail.intel.com (unknown [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D7D2703
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 13:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691009067; x=1722545067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qfUs7dIIMXqaIRKzaSQAAWRUV4nJmz+R8F3dtqbdyqQ=;
  b=n3HKhZVNVDYlKkZqXQYRvZLgGR7GrUB1M/ftKn9/kS9fpkLdIQmnuiTP
   AqzsiXjRYpemByU4QozXCyHHXK9aYE1LYYnAl4rHIJZddnBGyGqjbLahj
   hEwzEPTkUSSWwNxn8GXJ0wUA5VEe/VxJPIPuVxoggbHDPbLsXqgwXWAam
   JIoE81E4uaZ0+vnroLveEMYREIuNpFeYc8qy49NIWhzJgZtOjCZvC8m/y
   4gze4ro6+LGKhMdHEcCLGCDwNVSlUlaEDrWzY/EUpOBZYkEqYkR1t1ARU
   zqIs1aV2QUjirTDEZfjeS/KxkHM/yTGlTj/8nW47nigYU4FBAstjtQWMq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369698552"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="369698552"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 13:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="794731759"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="794731759"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Aug 2023 13:44:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qRIhl-0001TD-0P;
        Wed, 02 Aug 2023 20:44:25 +0000
Date:   Thu, 3 Aug 2023 04:43:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Christian Brauner <brauner@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Christian Brauner <christianvanbrauner@gmail.com>,
        Josef Bacik <josef@toxicpanda.com>, linux-doc@vger.kernel.org
Subject: [brauner-vfs:b4/vfs-super-exclusive.v2 6/6] htmldocs:
 Documentation/filesystems/api-summary:38: ./fs/super.c:558: WARNING:
 Unexpected indentation.
Message-ID: <202308030438.UYcxIMES-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-super-exclusive.v2
head:   cdcc91fd53b39d6b68bfdca0b21a7883cc6ec4ba
commit: cdcc91fd53b39d6b68bfdca0b21a7883cc6ec4ba [6/6] fs: add FSCONFIG_CMD_CREATE_EXCL
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030438.UYcxIMES-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308030438.UYcxIMES-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/filesystems/api-summary:38: ./fs/super.c:558: WARNING: Unexpected indentation.
>> Documentation/filesystems/api-summary:38: ./fs/super.c:559: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/filesystems/api-summary:38: ./fs/super.c:561: WARNING: Enumerated list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
