Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD170EEAA77
	for <linux-doc@archiver.kernel.org>; Thu, 14 Sep 2023 21:04:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjINVE5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Sep 2023 17:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjINVE4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Sep 2023 17:04:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DB0269D
        for <linux-doc@vger.kernel.org>; Thu, 14 Sep 2023 14:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694725492; x=1726261492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1HFqFpn6qRMJmPH5QN0s5azNTELpxThwJWafI5yh5K0=;
  b=cWNEaBW1kzbHB0OAQQ1BfaKxP3lsfugtaV4uxw6sU1XegnmFKY0pu/2v
   Ole8qBVTjW0s6C2ndLJoGwVC1kM17HYTBdGvIYZBzmBJzs019GNip/Uxl
   Iw9EmM3QO2fXHOc+BbQ3OlFlT9l0Ui0sXawSgVfz/SWwb2ayzakqsnLb4
   4QQB4PswKFsBCsZBXtQaW2dq7tOo9wtXl9k2SJIguINUgNCi7frw1ey3J
   R6SkJGIQPMRFzGwgcZfpmNhtI4O9ADrGDpVYfPPks5foQaSmpT0M0n1LM
   953OmPwtyoYSFtYeWbQgXSEP8qTGobJsemGXkQmpRny6r3ppp6BnIIca+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="378996056"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="378996056"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 14:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918379557"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="918379557"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Sep 2023 14:04:49 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qgtW3-00024N-1I;
        Thu, 14 Sep 2023 21:04:47 +0000
Date:   Fri, 15 Sep 2023 05:04:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 83/152] htmldocs: Warning:
 Documentation/devicetree/bindings/power/wakeup-source.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
Message-ID: <202309150511.kJuaaDOi-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   e510c064ef4961248313eb1adca5b08cec056708
commit: e2618ab264c9d17bb4c1909d9805341d800ddc02 [83/152] dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309150511.kJuaaDOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150511.kJuaaDOi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
