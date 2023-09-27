Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9900CE82CD8
	for <linux-doc@archiver.kernel.org>; Wed, 27 Sep 2023 20:49:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjI0Utg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Sep 2023 16:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjI0Utf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Sep 2023 16:49:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81392D6
        for <linux-doc@vger.kernel.org>; Wed, 27 Sep 2023 13:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695847774; x=1727383774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l8ypVAYzotEw1gNhx4vkGpFW2qkXxbVAxXaz9C4dNYo=;
  b=c/7MdO0Na05U1GZAXmYMnw+kl4DLURtBjYQpqoTxTrTC6p/MkOWTDvQZ
   aQS+x0E07f7iH1MFYqO73u032NeCy5H0SHLZ5kkRtzNH+u66UFFvcR2Os
   /2Yn0Kflkl1AMoDS1wQ5ZBT/fahUl/hUy3dlKiT+/vYlriNGt83Pwca2S
   PNf64V/8DKln0vYQb9riY05a/650YRjeAX7ZEHcUOUBO34Y7s7uhmmqJF
   KIRVXR7CQD5KtcQvYM1W0mw/K4Voch2REraoNQEuMY9mYLFBF6RydPBwg
   SLGuVkaxZfZP4H6gphTok25OZQLdzWuFhtxBs8OUCi6Ui7p863TtYcwgl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="384720414"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="384720414"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 13:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="873045291"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="873045291"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 13:49:32 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlbTN-0000fH-2s;
        Wed, 27 Sep 2023 20:49:29 +0000
Date:   Thu, 28 Sep 2023 04:48:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     oe-kbuild-all@lists.linux.dev, git@amd.com,
        Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 159/1370] dtbs_check:
 Documentation/devicetree/bindings/clock/renesas,proxo.yaml: title: 'Renesas
 ProXO Oscillator Device Tree Bindings' should not be valid under {'pattern':
 '([Bb]inding| [Ss]chema)'}
Message-ID: <202309280410.3aZD5DhK-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 0b10acac98371cb08db5fdec1490f5a603f80e68 [159/1370] dt-bindings: clock: Add bindings for Renesas ProXO
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309280410.3aZD5DhK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280410.3aZD5DhK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mfd/ene-kb3930.yaml: title: 'ENE KB3930 Embedded Controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml: title: 'Qualcomm Global Clock & Reset Controller Binding for SM8450' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/iio/adc/sprd,sc2720-adc.yaml: title: 'Spreadtrum SC27XX series PMICs ADC binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/clock/renesas,proxo.yaml: title: 'Renesas ProXO Oscillator Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,videocc.yaml: title: 'Qualcomm Video Clock & Reset Controller Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml: title: 'Marvell Armada 7K/8K Platforms Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/iio/adc/xlnx,versal-sysmon.yaml: properties:xlnx,nodeid:maxItems: False schema does not allow 1
   hint: Scalar properties should not have array keywords

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
