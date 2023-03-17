Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278EEC76195
	for <linux-doc@archiver.kernel.org>; Fri, 17 Mar 2023 08:56:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbjCQI4u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Mar 2023 04:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbjCQI4p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Mar 2023 04:56:45 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5617C69206
        for <linux-doc@vger.kernel.org>; Fri, 17 Mar 2023 01:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679043376; x=1710579376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZulOP3t7LVO+tymMsNlteIrer0a8d7gcp6PEELWfYGc=;
  b=FrShi1f8hyUnd5U1cdavhoal97OuCnGm37kEO1y3TelS8JcJE/yU0I9f
   anRAnh7uX+Y0xdXTEtgJE8Z5DIsg+HUmG4MO2q9KCYAwxsEaPeqojHmnC
   exzG+B72VfTSo/asIpyW/xbjwd7bZUnx1704AowgF/pnNV4LLl9UCyKkk
   DFAhQbJ0SpIy8JFz2wAV1QMGcANi1EYioaDlpZdaEVYiaKh3PDXCXYmvN
   kQnEcEdJcy3YznhqCcvg20oGZwPG2XaPU7CDzHDz2xK7ApSZ98VIllmO4
   5Vw+OxOkCT4Og0KG7zzxGD63+so9xKVam2B2WdIE6FZuAUhhrn33oIKOE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317869973"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="317869973"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 01:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="769293413"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="769293413"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2023 01:56:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pd5sY-0009F0-0k;
        Fri, 17 Mar 2023 08:56:02 +0000
Date:   Fri, 17 Mar 2023 16:55:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Gaurav Jain <gaurav.jain@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 4213/4413] htmldocs: Warning:
 Documentation/devicetree/bindings/input/snvs-pwrkey.txt references a file
 that doesn't exist: Documentation/devicetree/bindings/crypto/fsl-sec4.txt
Message-ID: <202303171606.xoYwr7Lj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f08c1de13a9403341c18b66638a05588b2663ce
commit: 0a4ca303ece25a84a92eda476cf8944d81e8e2c7 [4213/4413] dt-bindings: crypto: fsl,sec-v4.0: Convert to DT schema
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0a4ca303ece25a84a92eda476cf8944d81e8e2c7
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0a4ca303ece25a84a92eda476cf8944d81e8e2c7
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171606.xoYwr7Lj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/input/snvs-pwrkey.txt references a file that doesn't exist: Documentation/devicetree/bindings/crypto/fsl-sec4.txt
>> Warning: Documentation/devicetree/bindings/rtc/snvs-rtc.txt references a file that doesn't exist: Documentation/devicetree/bindings/crypto/fsl-sec4.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/crypto/fsl-sec4.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
