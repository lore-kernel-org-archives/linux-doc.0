Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F5BC7618E
	for <linux-doc@archiver.kernel.org>; Sat, 22 Apr 2023 08:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjDVIpo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Apr 2023 04:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjDVIpm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Apr 2023 04:45:42 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A5919AD
        for <linux-doc@vger.kernel.org>; Sat, 22 Apr 2023 01:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682153141; x=1713689141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OKLVh8xQIvVz2h33ZlYrUsdYNd0jGrEn+uL2RURhDwk=;
  b=nWVqFjlidQOI/+qB2kTIKW1plJ0nz50CdHPcWYf+MtRXDkpupMTC1Abn
   NhZ+zTq38AUB7J8vL3GUdSsRzzGtiEpaTY+Fj0/dytx+s1mv8861Wer13
   nH4iXAlDm3EfLqHJ6gftGy/eXnvHjD073Y12YO9IblSqeF0FeC1yKl+SE
   WbHkBcqw2oqfhnmxMffGzv1V/MzvE5qcXoNg78Rmn86jbnFccoHXKncR8
   FmfG7UsYZhrWXBWXbDkSJGMcj0B+fQeMMqJvpY1emsLFxq1iB4wtfzmFN
   l3s4ugEu9i1lxSxeELqSj3oJR7Ucf3ejMOTarlzUgN7s8f5tHuGhNF/4p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="432417118"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="432417118"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 01:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="836408951"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="836408951"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2023 01:45:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pq8sF-000hCW-24;
        Sat, 22 Apr 2023 08:45:39 +0000
Date:   Sat, 22 Apr 2023 16:44:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-doc@vger.kernel.org
Subject: [mgr:v6.3/topic/rk3568-vepu-h264-stateless-bootlin 1/4] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-ctrl-type-h264-encode-params (if the link has no caption the label must
 precede a section header)
Message-ID: <202304221631.JP3Qrgqz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.pengutronix.de/git/mgr/linux v6.3/topic/rk3568-vepu-h264-stateless-bootlin
head:   d0897ac6844c86a8d8d6f90d4116eb068184010c
commit: 17faa1883b0680d2e17b0d56a9e52e60c09e5d13 [1/4] media: Introduce Hantro V4L2 H.264 stateless encoding API
reproduce:
        git remote add mgr https://git.pengutronix.de/git/mgr/linux
        git fetch --no-tags mgr v6.3/topic/rk3568-vepu-h264-stateless-bootlin
        git checkout 17faa1883b0680d2e17b0d56a9e52e60c09e5d13
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221631.JP3Qrgqz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-h264-encode-params (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-h264-encode-rc (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-h264-encode-feedback (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
