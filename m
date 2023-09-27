Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F09E82CC9
	for <linux-doc@archiver.kernel.org>; Wed, 27 Sep 2023 19:35:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjI0Tfq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Sep 2023 15:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjI0Tfp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Sep 2023 15:35:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DDD114
        for <linux-doc@vger.kernel.org>; Wed, 27 Sep 2023 12:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695843344; x=1727379344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6L5lq3H/pApb/yyhkxihABm+pLW6DPCWReMpmbFe8yU=;
  b=Pcw1rt9AL8yPKKk70Px0BF6YHIzUWWyIgwiL7s4nRIF9xufVdCntoN1s
   9nkPXoL9MRMFOYl86CS9exiCbpkfa7+kpoLUCGR7fVPvlLeC3+YSeFnn3
   DarB7N8C69e1mdAnecaR7CXaLot8bi1kq8FxdhiYCWZpeC5/H0GJWC2Iy
   tUrJIeJBRVGhQ/tiRLxHkMZoQGSFDIIRHE+Iz9n5CLsV6jgjAI1JCOHaX
   B92N/3pcRO2lpG+9re3kDifHa7t83KCyg3UNtYtikaCareXa6EQwA90o9
   f5PluicTtqY2o2fnTtJDf89+2B105tbrzd2n1RkudzJOhJYbo6k41lh04
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381817491"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="381817491"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 12:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="819559646"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="819559646"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2023 12:35:23 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlaJd-0000a1-1y;
        Wed, 27 Sep 2023 19:35:21 +0000
Date:   Thu, 28 Sep 2023 03:34:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ye Yang <ye.yang@xilinx.com>
Cc:     oe-kbuild-all@lists.linux.dev, git@amd.com,
        Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 105/1370] dtbs_check:
 Documentation/devicetree/bindings/misc/xlnx,dpu.yaml: title: 'Xilinx Deep
 learning Processing Unit (DPU) Vivado Flow DT Bindings' should not be valid
 under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309280344.V326u5xN-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 95fe76af74b9ae7d1ca00cada06ae5cacb732174 [105/1370] dt-bindings: misc: xlnx_dpu: Add DPUCZDX8G v3.4 documentation
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309280344.V326u5xN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280344.V326u5xN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/ti,sci-clk.yaml: title: 'TI-SCI clock controller node bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/power/supply/bq25890.yaml: title: 'Binding for bq25890, bq25892, bq25895 and bq25896 Li-Ion Charger' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml: title: 'Pine64 PinePhone keyboard device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/misc/xlnx,dpu.yaml: title: 'Xilinx Deep learning Processing Unit (DPU) Vivado Flow DT Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml: title: 'STMicroelectronics STM32 Factory-programmed data bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/misc/xlnx,tmr-inject.yaml: title: 'Xilinx TMR Inject Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/input/input.yaml: title: 'Common input schema binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
