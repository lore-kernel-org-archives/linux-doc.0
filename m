Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A93C77B7A
	for <linux-doc@archiver.kernel.org>; Sat,  3 Jun 2023 17:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjFCRQs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Jun 2023 13:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjFCRQr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jun 2023 13:16:47 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E1B185
        for <linux-doc@vger.kernel.org>; Sat,  3 Jun 2023 10:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685812605; x=1717348605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q6mvgXclEvZxWmR2IQvHMv+VhhvtR5RjC5l2jothIlY=;
  b=btAZJXfldd05HVn80AMjCYbqAWzkk/FAOoKCzdx2OeLHyBPLuIzVuTOm
   JWkSOwpJmDosfW95zeX6NFz7NhlSZ8DFZmWSg+FlfEVvfVJUwJATDMZjY
   8h5Twc6OO1D1kEag7YSzpeWUiSVYV6pLdhpdhQ9BXpVAjkLmkvyFva6iK
   xAO7v4f7Si86PU95UWFP8QJeoE8aZh9mrt/ltL0Rfj4H0mJE9q0F2tpgM
   cn6mqWPTs1ahhi/JBEaiyQzsDlDKrKgANlV1UsGcJkid8n1EqXdl3LvXC
   oa5JAD3sVczZeYkJZ+Qy4DJIJll4Hm68SR9MYdqdqOFbGCw5ckSukAesm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="335715852"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="335715852"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 10:16:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="702288615"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="702288615"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Jun 2023 10:16:44 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q5Urr-0001pR-1h;
        Sat, 03 Jun 2023 17:16:43 +0000
Date:   Sun, 4 Jun 2023 01:15:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org
Subject: [trace:probes/core 16/16] htmldocs: Warning:
 Documentation/trace/fprobetrace.rst references a file that doesn't exist:
 Documentation/trace/fprobes.rst
Message-ID: <202306040144.aD72UzkF-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace probes/core
head:   438ae37afde3d24731cf23e5b77370e76218744e
commit: 438ae37afde3d24731cf23e5b77370e76218744e [16/16] Documentation: tracing/probes: Add fprobe event tracing document
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/commit/?id=438ae37afde3d24731cf23e5b77370e76218744e
        git remote add trace git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
        git fetch --no-tags trace probes/core
        git checkout 438ae37afde3d24731cf23e5b77370e76218744e
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306040144.aD72UzkF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/trace/fprobetrace.rst references a file that doesn't exist: Documentation/trace/fprobes.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
