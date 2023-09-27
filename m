Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE17E80AAD
	for <linux-doc@archiver.kernel.org>; Wed, 27 Sep 2023 14:23:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbjI0OXM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Sep 2023 10:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbjI0OXL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Sep 2023 10:23:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC38F9
        for <linux-doc@vger.kernel.org>; Wed, 27 Sep 2023 07:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695824590; x=1727360590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dUT749PpcnVmmx3qHv5UIWQPZbo6RO+koDeFGDz+ZfE=;
  b=Z0qQQ7cpJyrwT4VHkCp7QeZZeOIL96rf5G+7RmvSZLJsaqvrbor6wy5J
   u6N+z/1h77fRR7KJpafyq8PE7oRIvWhusQSq53C+3SXdWLp4U0prrwasO
   sn9JXqrsamcw3hM0bGIXdy8aA0tLrp3KfgFhfeVDSFZkFdw2hca1Inx47
   PE2ryR5moa2urOnnUmz3y+qPCGEJ4GK6id6e3zOY/ryfRvS+t07IOoKjD
   +/WbyjSHjrgOD31SB9hzcDnwmxv2NyFG0fvt7rNTk8V5KhvBDSnQuJPEN
   bIdcbAV2EimTUdmHxht6GFNPohIbTTImqXTQ/lNIuUuiAD2M/lLZWr89j
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380716217"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="380716217"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 07:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752613370"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="752613370"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2023 07:21:03 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlVPP-0000In-0r;
        Wed, 27 Sep 2023 14:20:59 +0000
Date:   Wed, 27 Sep 2023 22:20:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ye Yang <ye.yang@xilinx.com>
Cc:     oe-kbuild-all@lists.linux.dev, git@amd.com,
        Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 105/1370] dtbs_check:
 Documentation/devicetree/bindings/misc/xlnx,dpu.yaml: title: 'Xilinx Deep
 learning Processing Unit (DPU) Vivado Flow DT Bindings' should not be valid
 under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309272257.HI1vHzGM-lkp@intel.com>
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
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309272257.HI1vHzGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309272257.HI1vHzGM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/misc/xlnx,tmr-manager.yaml: title: 'Xilinx TMR Microblaze Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml: title: 'Toshiba TC358775 DSI to LVDS bridge bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi Performance Monitor device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/misc/xlnx,dpu.yaml: title: 'Xilinx Deep learning Processing Unit (DPU) Vivado Flow DT Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/ethernet-controller.yaml: title: 'Ethernet Controller Generic Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml: title: 'Freescale i.MX8qm/qxp Control and Status Registers Module Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/dma/dma-common.yaml: title: 'DMA Engine Generic Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
