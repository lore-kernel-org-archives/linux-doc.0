Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38CBE82CA1
	for <linux-doc@archiver.kernel.org>; Wed, 27 Sep 2023 17:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjI0Rjk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Sep 2023 13:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjI0Rjk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Sep 2023 13:39:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EACCA1
        for <linux-doc@vger.kernel.org>; Wed, 27 Sep 2023 10:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695836379; x=1727372379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q4yaeR1nQ4U0v+XEYM1mG5MhTSyAq16ln08WXB6MYgM=;
  b=W9BMFN+lY+OwO213h51zgzMIkQE6xStIkqF3bjeZdcos6Qdcnc5+Kc5D
   kwgI5Ff/EpfWn03Ge8Sb7pS9XUq65+nTUleHkk6Xs1Iw7vz99IdZF70lr
   H9Z0MwekaoaF8OHEsqYJRBzo/XcftalcUqc9JJcxszCDtkZZtNVXQjEhY
   kiHbFgHjzJiEH1VCXnUIc+50PLqHfl6rlWR/67IPxcYyJIghcnexp2oZ0
   aclQbWrU7B8O2di1MfDKUqXhmBWBUBMfuuTnOzWUrpVg6JPi0W42Bp3GS
   vPKHd936TyZ5LIdXwo7C32iZc9hN0gMtw9Hv/+S6SvuzqSNQkMN/GLisv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="366946734"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="366946734"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 10:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996241258"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="996241258"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2023 10:39:36 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlYVa-0000Uy-0M;
        Wed, 27 Sep 2023 17:39:34 +0000
Date:   Thu, 28 Sep 2023 01:39:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Wendy Liang <wendy.liang@xilinx.com>
Cc:     oe-kbuild-all@lists.linux.dev, git@amd.com,
        Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 99/1370] dtbs_check:
 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml:
 title: 'Xilinx R5 remote processor controller bindings' should not be valid
 under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309280102.voVpNtnO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 4a9dac9504e729fa23e81c5c83edfeb9a8f91721 [99/1370] dt-binding: soc: xilinx: ai-engine: Add new AI engine binding
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309280102.voVpNtnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280102.voVpNtnO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/power/fsl,scu-pd.yaml: title: 'i.MX SCU Client Device Node - Power domain bindings based on SCU Message Protocol' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/wireless/microchip,wilc1000.yaml: title: 'Microchip WILC wireless devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/rng/ingenic,trng.yaml: title: 'Bindings for DTRNG in Ingenic SoCs' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml: title: 'Xilinx R5 remote processor controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/wireless/esp,esp8089.yaml: title: 'Espressif ESP8089 Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml: title: 'Qualcomm Camera Clock & Reset Controller Binding for SM8250' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/gpu/vivante,gc.yaml: title: 'Vivante GPU Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
