Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D2AC43334
	for <linux-doc@archiver.kernel.org>; Sun,  3 Jul 2022 06:16:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiGCGQi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 3 Jul 2022 02:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiGCGQh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Jul 2022 02:16:37 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56832614
        for <linux-doc@vger.kernel.org>; Sat,  2 Jul 2022 23:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656828996; x=1688364996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dbnGAVBhqMjh4IkpQ5qdsUqIz8UDvlr+et7UCYj2F3k=;
  b=i6geDs80Cdy+Jv8/UI2Apwq3C9XjI8UiYSUZWSj3ZpoCHKvc01RQNZvr
   Bs13DFrHl4TgM6sNHZ+SPURO2FDVwnLkUWu1ZfPiXJZVohuWzTTPHnR5t
   SwB4REMDWLpMGJhG4ugNg/0trIHRcFcnmz5vHEU10PmKr3Y8tUwesm3iw
   X1mvNpBJeN1BjZVD/NobdtDTXsIKRZsijTEDrBeUZF+u3pr40T5vwYOPi
   dVrDlpK0m5Ei0wOIKqi7pwuzH6hwCxPo7ztC1nJApsCdcMPyB+jCB8BdH
   205DCcff2SCZsxtgniahOAQU6Qb5Mldv3blV3NVZd5uCNZG8i+t929VSi
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10396"; a="281668904"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="281668904"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 23:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="542141220"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jul 2022 23:16:34 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o7suI-000GAV-0q;
        Sun, 03 Jul 2022 06:16:34 +0000
Date:   Sun, 3 Jul 2022 14:16:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ben Gardon <bgardon@google.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Matlack <dmatlack@google.com>,
        Peter Xu <peterx@redhat.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 4541/7282] htmldocs:
 Documentation/virt/kvm/api.rst:8210: WARNING: Title underline too short.
Message-ID: <202207031437.qIh6LFcx-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c4185b16aba73929aa76f0d030efbe79ae867808
commit: 084cc29f8bbb034cf30a7ee07a816c115e0c28df [4541/7282] KVM: x86/MMU: Allow NX huge pages to be disabled on a per-vm basis
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/virt/kvm/api.rst:8210: WARNING: Title underline too short.

vim +8210 Documentation/virt/kvm/api.rst

  8208	
  8209	8.38 KVM_CAP_VM_DISABLE_NX_HUGE_PAGES
> 8210	---------------------------
  8211	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
