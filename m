Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5C7C43334
	for <linux-doc@archiver.kernel.org>; Sun, 17 Jul 2022 05:12:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiGQFMS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 17 Jul 2022 01:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiGQFMR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 17 Jul 2022 01:12:17 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DC61A3AB
        for <linux-doc@vger.kernel.org>; Sat, 16 Jul 2022 22:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658034736; x=1689570736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tg1oLv+ogp+myoil/KsLCbKgeL1xpXG7/d4GNuvVrL4=;
  b=AdSykQP2tVd6SMd4JVETeVJ9Cn7AYCh16wz3rsfafO92ep/rKu89H21N
   ER+xrka1nPnF2nd24GNozvcLrbxFGxgfpbFyW60w2sjQmvbB7CpvfzFu/
   Fa81yrchw2ON0EHrDkO5VDtHCObmCQBS57YF3HqmaeubomSHsYukQ+HhX
   R4JWVto46TA00RXanqDxbvcxFTNLyo2LgiCx7nRF9SYL0VNH7akJfszYk
   c3hm6EZ6ZXucpaXPbGWRaT3S4iqYPwEMBOO4BtYl46sHUJu0b1XOikm2r
   t6jRBzwQN0SakcM0LcZ5w9mURXaqTeALVvXcqU3Ii8qnkW3tDb/ibkIm4
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="286765294"
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; 
   d="scan'208";a="286765294"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 22:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; 
   d="scan'208";a="773388966"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Jul 2022 22:12:13 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oCwZg-0002ke-TP;
        Sun, 17 Jul 2022 05:12:12 +0000
Date:   Sun, 17 Jul 2022 13:11:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Tomasz Kowallik <tomaszx.kowalik@intel.com>,
        Adam Guerin <adam.guerin@intel.com>,
        Fiona Trahe <fiona.trahe@intel.com>,
        Wojciech Ziemba <wojciech.ziemba@intel.com>,
        Vladis Dronov <vdronov@redhat.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 7976/10906] htmldocs:
 Documentation/ABI/testing/sysfs-driver-qat:24: WARNING: Unexpected
 indentation.
Message-ID: <202207171329.cobuoIBt-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Giovanni,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
commit: d4cfb144f60551d80732c93c892fe76fc8df860d [7976/10906] crypto: qat - expose device config through sysfs for 4xxx
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-driver-qat:24: WARNING: Unexpected indentation.

vim +24 Documentation/ABI/testing/sysfs-driver-qat

  > 24	Date:		June 2022

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
