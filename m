Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115BCEB64DD
	for <linux-doc@archiver.kernel.org>; Sat, 29 Jul 2023 03:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbjG2DNv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Jul 2023 23:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjG2DNu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Jul 2023 23:13:50 -0400
Received: from mgamail.intel.com (unknown [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF524483
        for <linux-doc@vger.kernel.org>; Fri, 28 Jul 2023 20:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690600429; x=1722136429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VQq3PmLtJWjf5e72114AfS1++3BaFWBC9F+47/dGIig=;
  b=PBekznP2GqmKJXVQBHYtRqiNxZLl4SpCaYheyJ/q8xjhIYYS1WdnrchI
   xeP4DcQU605ld1qmLJWz99VpNkVqDW2kxSHYXsELCVERd5iSf81HszVQ1
   5iE8yifn+Zoacsyb67gtMnmvvupovRelFtPnD46L+UHZkYEpR6KXHWrt/
   osmNTgTZkWG21PXxqsB/r0ygaj92qxGT0Wg6L12KVXhGv1R9VLPo5RR7y
   TuIFaypXsVjuV++na4p6Zy34Ebs3DUx2XcjiBAxJ6Di3T1RoqUw62IK32
   /t0d/JsB7Re1c//ylgFbmRsCe2o8xr9bqyWQbqWtBLYEAhTvPLDIjlTzg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="455082747"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="455082747"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 20:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="757379237"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="757379237"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Jul 2023 20:13:46 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPaOn-0003n5-2k;
        Sat, 29 Jul 2023 03:13:45 +0000
Date:   Sat, 29 Jul 2023 11:13:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Huisong Li <lihuisong@huawei.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wei Xu <xuwei5@hisilicon.com>, linux-doc@vger.kernel.org
Subject: [hisilicon-hisi:next/drivers 2/2] htmldocs:
 Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs:4: WARNING:
 Unexpected indentation.
Message-ID: <202307291107.uXFY2Hfv-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/hisilicon/linux-hisi next/drivers
head:   d8f6674884c47d8093cf7534a3ed8d882ba8e702
commit: d8f6674884c47d8093cf7534a3ed8d882ba8e702 [2/2] doc: soc: hisilicon: Add Kunpeng HCCS driver documentation
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291107.uXFY2Hfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291107.uXFY2Hfv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs:4: WARNING: Unexpected indentation.
>> Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs:4: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs:4: WARNING: Definition list ends without a blank line; unexpected unindent.
>> Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs:26: WARNING: Malformed table.

vim +4 Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs

   > 4	Date:		November 2023
     5	KernelVersion:	6.6
     6	Contact:	Huisong Li <lihuisong@huawei.org>
     7	Description:
     8			The /sys/devices/platform/HISI04Bx:00/chipX/ directory
     9			contains read-only attributes exposing some summarization
    10			information of all HCCS ports under a specified chip.
    11			The X in 'chipX' indicates the Xth chip on platform.
    12	
    13			There are following attributes in this directory:
    14			================= ==== =========================================
    15			all_linked:       (RO) if all enabled ports on this chip are
    16					       linked (bool).
    17			linked_full_lane: (RO) if all linked ports on this chip are full
    18					       lane (bool).
    19			crc_err_cnt:      (RO) total CRC err count for all ports on this
    20					       chip.
    21			============= ==== =============================================
    22	
    23	What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/all_linked
    24			/sys/devices/platform/HISI04Bx:00/chipX/dieY/linked_full_lane
    25			/sys/devices/platform/HISI04Bx:00/chipX/dieY/crc_err_cnt
  > 26	Date:		November 2023
    27	KernelVersion:	6.6
    28	Contact:	Huisong Li <lihuisong@huawei.org>
    29	Description:
    30			The /sys/devices/platform/HISI04Bx:00/chipX/dieY/ directory
    31			contains read-only attributes exposing some summarization
    32			information of all HCCS ports under a specified die.
    33			The Y in 'dieY' indicates the hardware id of the die on chip who
    34			has chip id X.
    35	
    36			There are following attributes in this directory:
    37			================= ==== =========================================
    38			all_linked:       (RO) if all enabled ports on this die are
    39					       linked (bool).
    40			linked_full_lane: (RO) if all linked ports on this die are full
    41					       lane (bool).
    42			crc_err_cnt:      (RO) total CRC err count for all ports on this
    43					       die.
    44			============= ==== =============================================
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
