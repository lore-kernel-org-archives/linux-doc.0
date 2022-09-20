Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67149C54EE9
	for <linux-doc@archiver.kernel.org>; Tue, 20 Sep 2022 11:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbiITLKz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Sep 2022 07:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbiITLKm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Sep 2022 07:10:42 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7A7B86D
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 04:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663672242; x=1695208242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mk37G7OAFiuftFDanH18OltgE6w68yKL3nvcxgy8dLY=;
  b=R5J5P7oeUNMv87MVBNl/olDSoxeR93r7pjhprQ6XyBFVpqIrv35TuThP
   viMbz/a4RVI7gmh/qVeYnjbmVv79Iqa/40f/z7A1XZ28ABdv6Ht+nXv1T
   aDySFmZnI0hvS7FlkRosKaMVK2rvJ/g1aPSgrzMiNjQgcTZcnaTVQqP1p
   4ij6rz/w93UNbHQ8bMIzjFHd+0fwnobGY7JnmxfYMmqCFMkjas1c1Vq9o
   0sEh86cin0o1trOWwVf6ZWWoRiKUjMf3L468fVwq19e7J2WwCEkMDg1YK
   z3fIEfuM4vVvjgwbL3p2wJjv1cLi5fQ+kCVS/GaHy1ywXxgHHTDAESawb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="300484620"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="300484620"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 04:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="618873530"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Sep 2022 04:10:36 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oab99-0002iD-0X;
        Tue, 20 Sep 2022 11:10:35 +0000
Date:   Tue, 20 Sep 2022 19:09:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Michal Simek <monstr@monstr.eu>
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:master 253/700] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.txt
Message-ID: <202209201904.Hipk1zS7-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx master
head:   1b14bc5f77a5f355659987039abe92c930befb48
commit: aa65f3d5ba5783976d1337ee94a0511f13cb1204 [253/700] dt-bindings: remoteproc: Remove old binding in txt format
reproduce:
        # https://github.com/Xilinx/linux-xlnx/commit/aa65f3d5ba5783976d1337ee94a0511f13cb1204
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout aa65f3d5ba5783976d1337ee94a0511f13cb1204
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.txt

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
