Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A46C76196
	for <linux-doc@archiver.kernel.org>; Tue, 11 Apr 2023 15:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbjDKPJk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Apr 2023 11:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjDKPJ2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Apr 2023 11:09:28 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF574EC7
        for <linux-doc@vger.kernel.org>; Tue, 11 Apr 2023 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681225756; x=1712761756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SV3G2m3uKXrIo3IebGAnDrvbFcpeQIDFkVWmLK1r+aA=;
  b=JLXbzllwGiTCdQeTHNyVXmGbc/5rZS9MJlgxFGuZNSTuyqc9zJzKKpNx
   sFUOhZRAMV+Wl+SsQkqjoc8Y8OPS91P7l5RZbi0bH/2ANXb0KdenhEezJ
   no4E6FxPG4BIVki2a4VU/c1sBd5ykQIF1VJrYUbgNky4KlOq9HcHydJ6r
   i1X9ibbqfvOtdM+ktHPvCq9mE/YeDgcv73O268gvSjQndh9MFEtp+nni9
   XQdGPy0rYoNR3s3/Ui5wY4TkxDGbq/3qLZKNLJR0fI0FrgS+Nfm+RmxZ5
   FgTv96DHBmRGqibTsld/fGWqGde5x0tBpML8xCXPWuyazviYP9ud1lmpG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342403543"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="342403543"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 08:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="812597110"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="812597110"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Apr 2023 08:09:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pmFcQ-000WQD-0q;
        Tue, 11 Apr 2023 15:09:14 +0000
Date:   Tue, 11 Apr 2023 23:08:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 90/150] htmldocs: Warning: MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
Message-ID: <202304112308.pib6myKS-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   50deb21d3cedfc0532a79c819cde73e09f9395fd
commit: a728054125491c7c3653f4caf1cf6cb544d9b64c [90/150] dt-bindings: net: Convert ATH10K to YAML
reproduce:
        # https://github.com/krzk/linux/commit/a728054125491c7c3653f4caf1cf6cb544d9b64c
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
        git checkout a728054125491c7c3653f4caf1cf6cb544d9b64c
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304112308.pib6myKS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
