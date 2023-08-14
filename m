Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E46C04A94
	for <linux-doc@archiver.kernel.org>; Mon, 14 Aug 2023 19:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbjHNTM7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Aug 2023 15:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbjHNTMu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 15:12:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C0710F2
        for <linux-doc@vger.kernel.org>; Mon, 14 Aug 2023 12:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692040369; x=1723576369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KV4ijDd60O8GOvHsldkXLcTkS9rJnFy3Z+QzX2vRclA=;
  b=asWA2/7+M9COyzyO2h11n+5DTksYeVKq2PqiwLkVzrKY+DEb8dRXcp8c
   kYarGipv5vX8K2zhKgdNGHWj7bXjVHHuxulXAfZDWJNIsJ9j9z4WzH4ty
   efYIhRHnGnc09wsj9IaPiE5owOQjIKx2sGOJm85wql/iFqf+7Ih4yH1KQ
   5Fepk6zxsWh+HJwzL9/SI6AbqjxKYQJ3+f77UrKFoJ4OZVx34NHih/dRW
   hHBGWSLuurjcalH34JgiJphjhUDb34nXUrUG6z46rzlZjp6mlea3KlrQk
   oc0Me8+p6z5Gep+7cNdkQ/KF+TEItudW533d7W5ZcWWoPcDgeOM6/vpJt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372112803"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="372112803"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 12:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="803555389"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="803555389"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2023 12:12:48 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qVczb-0000Mp-0t;
        Mon, 14 Aug 2023 19:12:44 +0000
Date:   Tue, 15 Aug 2023 03:12:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [hverkuil-media-tree:for-v6.6l 18/18] htmldocs: Warning:
 Documentation/translations/zh_CN/video4linux/v4l2-framework.txt references a
 file that doesn't exist: Documentation/driver-api/media/v4l2-videobuf.rst
Message-ID: <202308150317.Z8jOOWgM-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.6l
head:   7408f9f1c272ca820c9f4c7c677ca8fde26779bf
commit: 7408f9f1c272ca820c9f4c7c677ca8fde26779bf [18/18] media: remove the old videobuf framework
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150317.Z8jOOWgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150317.Z8jOOWgM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/translations/zh_CN/video4linux/v4l2-framework.txt references a file that doesn't exist: Documentation/driver-api/media/v4l2-videobuf.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
