Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FA6ECAAD3
	for <linux-doc@archiver.kernel.org>; Mon, 19 Sep 2022 21:50:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiISVuE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Sep 2022 17:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiISVuE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Sep 2022 17:50:04 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDF13D5B1
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 14:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663624202; x=1695160202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qZrcI4/0dmNamh4Z0S+Gpq+/UYILPLnfNbBGGlylQ0=;
  b=fuT6VY5zwbo4LxJ8ZZDAi/nx7npfEx2bIPmVAj0qZuU0sdhCxmiKigiQ
   VjSqmX0Fn0KmHhUWOphWw0WA6Wiy1Fe2oLJAaB3mkKpzA0ljVDepWhIBq
   hgq65v6086syxYCWwvOgxmZcXMqo3w8lQPOcRgnq6Sa58OvDFybo7t8cA
   4nxxaK6+umLgS5AHjMcIS8vhshCKk/M4mlExMaweMtXufVtJBt/RGL80U
   /ny7IpXQHiUPsQ+34+RvArwu6Gh8c/cn3NvASG7FJsM1cRcyKaIo31xmO
   1y44tVfhfcBIW43ZDRotnFWKPTfAyPHsbBpTiI6H+M5kWYTp1R5tkFh6I
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="286576909"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="286576909"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 14:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="596256691"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Sep 2022 14:50:00 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oaOeO-0002FR-0O;
        Mon, 19 Sep 2022 21:50:00 +0000
Date:   Tue, 20 Sep 2022 05:49:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:master 32/700] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
Message-ID: <202209200554.wauSaDOe-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx master
head:   1b14bc5f77a5f355659987039abe92c930befb48
commit: 56eeb302e8dae59b645fc39c2d4c85136cba483a [32/700] dt-bindings: media: xilinx: csi2rxss: Remove .txt binding doc
reproduce:
        # https://github.com/Xilinx/linux-xlnx/commit/56eeb302e8dae59b645fc39c2d4c85136cba483a
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 56eeb302e8dae59b645fc39c2d4c85136cba483a
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
