Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1D9C61DA4
	for <linux-doc@archiver.kernel.org>; Tue, 14 Feb 2023 04:14:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbjBNEO6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Feb 2023 23:14:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjBNEO5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Feb 2023 23:14:57 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C59A1727
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 20:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676348096; x=1707884096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIYaxsBhdI8QugIG5FC9uDgYK0wM+u7EP5fcD6bIgLA=;
  b=jU4bE6qMLU6B9omXT+k1+VK3Y7++tSLeRj2YHLhev7gUk6ibETpY5jGi
   7lwBswOOx6qHOXayO3fgLK29fQFnPFeJ5f7e5FaHJLWjRQbgpNrVJUP8q
   RR5nmhbsj/c+I3x7DOgYbGzb3chX8ryWueDSEZtF6sIyspUT8NYTCkwoQ
   QQTDThZ4FTaVFb9lNEB+fX43SXWimAT8jL1ov0J969QT7n//uhJJV7N5s
   bmXu640/pYWsiwfwFUCMSfDBBhOcgO+ZH5RAT21uehXKUktvVt6/aslgy
   Rrux/q8bvw/W7Mtmqt7wHg1UQCqh37+qYh4haZ5lQLY7VAgGmKferGPNU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="329701798"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="329701798"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 20:14:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="914592844"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="914592844"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Feb 2023 20:14:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pRmiT-0008CX-1z;
        Tue, 14 Feb 2023 04:14:53 +0000
Date:   Tue, 14 Feb 2023 12:14:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 17/107] htmldocs: Warning:
 Documentation/devicetree/bindings/power/wakeup-source.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
Message-ID: <202302141230.nVFyJ8OO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   3eb1c8811f15264354cd69b7e98ff292aa259ec5
commit: 9f8f871682750e1539e68435dae4df7e220ff9c3 [17/107] dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
reproduce:
        # https://github.com/krzk/linux/commit/9f8f871682750e1539e68435dae4df7e220ff9c3
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
        git checkout 9f8f871682750e1539e68435dae4df7e220ff9c3
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141230.nVFyJ8OO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
