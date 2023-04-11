Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26549C76196
	for <linux-doc@archiver.kernel.org>; Tue, 11 Apr 2023 10:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjDKKVQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Apr 2023 06:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjDKKVP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Apr 2023 06:21:15 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9E23AB0
        for <linux-doc@vger.kernel.org>; Tue, 11 Apr 2023 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681208467; x=1712744467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GVsPzAZHNedPOIs9wwN86m2a07NabvDF9TEuPZQLJBA=;
  b=AwYXTtUw97wdzuNZq5RwoPMOViRxHon0kBrJLQMvfzCZz0qK8hNhWVkk
   R3PwF+ZL0VAL9fO9gEuuLky2iIsLx4A6q2gBRNofRjsBHEVI4WfKajmZS
   snrmtu5llC/+OZGO0Pg2h8ybsLUJO+tg9cpP8/CxZghx8P8J/3NCgj1zS
   SC7Ey8I8Vh9FYJBLDkcR/zjD4GOR4ExjcfdVrPXko9JsI/QAzFqUTYIW6
   0yz+CVXBGDZXfQIqNgjTXmhrqVA0q/mdO3QSDikRdF/Qd5xC7WGUcBwO4
   D1f7LsVqtsQmtIOjxOhjonDVGXHXVUXsOcUjP8je1YifWqZ2TojM0boo6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="341071840"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="341071840"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 03:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="862817665"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="862817665"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Apr 2023 03:21:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pmB7Y-000WCj-2b;
        Tue, 11 Apr 2023 10:21:04 +0000
Date:   Tue, 11 Apr 2023 18:21:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 10/150] htmldocs: Warning:
 Documentation/devicetree/bindings/power/wakeup-source.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
Message-ID: <202304111813.Fng1bYsN-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   50deb21d3cedfc0532a79c819cde73e09f9395fd
commit: d1403fbcae5ad8cfbb421f06f4e87941c2b780b6 [10/150] dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
reproduce:
        # https://github.com/krzk/linux/commit/d1403fbcae5ad8cfbb421f06f4e87941c2b780b6
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
        git checkout d1403fbcae5ad8cfbb421f06f4e87941c2b780b6
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111813.Fng1bYsN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
