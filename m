Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E011CCA47B
	for <linux-doc@archiver.kernel.org>; Sat,  2 Jul 2022 12:49:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbiGBMs7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 2 Jul 2022 08:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiGBMs4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Jul 2022 08:48:56 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F76DE9F
        for <linux-doc@vger.kernel.org>; Sat,  2 Jul 2022 05:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656766135; x=1688302135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66KCT6O2bKhNZvhyd6u4KISkXhOHI+d6bFFrrT/7XdI=;
  b=ORfIselgA5MRu8KRMJGYNG4hvXzEj0M3uIDAi/H/0FsA61KNXNPbATg/
   25PnU08fJvo6+EBGuu5hJTmtZwz7a8WDaBvGZGm9Kf7zShkGFeayWrayY
   QyfFpA6r9joPHftr/ZJQXsoITMJfOKlamjr3YeA07Y/M0ZEOP7khElvrO
   9uXhatfVvlEscVYdQiMQVvjj+Ldki8TAqr8pB7RAyPz7nN7IzIZ6qnfO0
   9SnlkgxPUi3SyrVGoQosaMMr0yE+hSq/Qniz+55yzowDe88wOxXqN9o2F
   me1d8685ZVDFs2GA2QTAumqTlsLa8/Dt3YZUKalOyrhLip4Jtna2hL2Af
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="265858700"
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="265858700"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 05:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="566622066"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Jul 2022 05:48:53 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o7cYO-000FFX-T8;
        Sat, 02 Jul 2022 12:48:52 +0000
Date:   Sat, 2 Jul 2022 20:48:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Johannes Berg <johannes.berg@intel.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 3548/7282] htmldocs:
 Documentation/driver-api/80211/mac80211:32: include/net/mac80211.h:4036:
 WARNING: Inline strong start-string without end-string.
Message-ID: <202207022001.lbrZCRtD-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c4185b16aba73929aa76f0d030efbe79ae867808
commit: d8787ec6b4ef1857b827699eca6f5978d0aecd74 [3548/7282] wifi: mac80211: add vif link addition/removal
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/80211/mac80211:32: include/net/mac80211.h:4036: WARNING: Inline strong start-string without end-string.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
