Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952A0C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  5 May 2022 19:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbiEETJt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 May 2022 15:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234595AbiEETJs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 May 2022 15:09:48 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D124A3CC
        for <linux-doc@vger.kernel.org>; Thu,  5 May 2022 12:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651777567; x=1683313567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g5OoGBxii9JSs7clLCkA+yvXJktICHOeLJoss3U1pG8=;
  b=HNhddz7tsPZNYiKIeaHPQGsceia+bBBJ2g/PihGz348/8U7yUdKpJPBe
   eKNhIaehuM1+5PrRkY/5QsuG3m9Myx9JzI/30qgyk8GGBStqUbo5mo6oY
   agNHviq/rXIf1NizlR7O+Lkrn/AF5AVuzLjyDkGHJr35ahMrYOJa5ERic
   vOJny0WQX6AsSPWKT0YcmJUNEEDjWz3doEOVHa4BGz5lNEmkqMmIsKRWy
   3/Fe6Vlqk+uhL55yLio6oNOtkhJwfQ1S9EYrjZOtwP7cLa7zT8eJAS8ma
   AJk6AL5pxqg477mGoRbc4sGNaBkXzJ9rTa9CgJ+UBE5aSlAYl/JNqQtyd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="250211011"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="250211011"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 12:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="517655756"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 May 2022 12:06:05 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nmgnc-000Cg4-R2;
        Thu, 05 May 2022 19:06:04 +0000
Date:   Fri, 6 May 2022 03:05:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Oliver Upton <oupton@google.com>
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>,
        Reiji Watanabe <reijiw@google.com>, linux-doc@vger.kernel.org
Subject: [arm-platforms:kvm-arm64/psci-suspend 7/13] htmldocs:
 Documentation/virt/kvm/api.rst:6049: (SEVERE/4) Title level inconsistent:
Message-ID: <202205060209.NeOKC7Mb-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/psci-suspend
head:   582eb04e05ddd234ca32083c8457c6d409fd7b6a
commit: bfbab44568779e1682bc6f63688bb9c965f0e74a [7/13] KVM: arm64: Implement PSCI SYSTEM_SUSPEND
reproduce: make htmldocs

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the arm-platforms/kvm-arm64/psci-suspend HEAD 582eb04e05ddd234ca32083c8457c6d409fd7b6a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> Documentation/virt/kvm/api.rst:6049: (SEVERE/4) Title level inconsistent:

vim +6049 Documentation/virt/kvm/api.rst

  6031	
  6032	 - KVM_SYSTEM_EVENT_SHUTDOWN -- the guest has requested a shutdown of the
  6033	   VM. Userspace is not obliged to honour this, and if it does honour
  6034	   this does not need to destroy the VM synchronously (ie it may call
  6035	   KVM_RUN again before shutdown finally occurs).
  6036	 - KVM_SYSTEM_EVENT_RESET -- the guest has requested a reset of the VM.
  6037	   As with SHUTDOWN, userspace can choose to ignore the request, or
  6038	   to schedule the reset to occur in the future and may call KVM_RUN again.
  6039	 - KVM_SYSTEM_EVENT_CRASH -- the guest crash occurred and the guest
  6040	   has requested a crash condition maintenance. Userspace can choose
  6041	   to ignore the request, or to gather VM memory core dump and/or
  6042	   reset/shutdown of the VM.
  6043	 - KVM_SYSTEM_EVENT_WAKEUP -- the exiting vCPU is in a suspended state and
  6044	   KVM has recognized a wakeup event. Userspace may honor this event by
  6045	   marking the exiting vCPU as runnable, or deny it and call KVM_RUN again.
  6046	 - KVM_SYSTEM_EVENT_SUSPEND -- the guest has requested a suspension of
  6047	   the VM.
  6048	
> 6049	For arm/arm64:
  6050	^^^^^^^^^^^^^^
  6051	
  6052	   KVM_SYSTEM_EVENT_SUSPEND exits are enabled with the
  6053	   KVM_CAP_ARM_SYSTEM_SUSPEND VM capability. If a guest invokes the PSCI
  6054	   SYSTEM_SUSPEND function, KVM will exit to userspace with this event
  6055	   type.
  6056	
  6057	   It is the sole responsibility of userspace to implement the PSCI
  6058	   SYSTEM_SUSPEND call according to ARM DEN0022D.b 5.19 "SYSTEM_SUSPEND".
  6059	   KVM does not change the vCPU's state before exiting to userspace, so
  6060	   the call parameters are left in-place in the vCPU registers.
  6061	
  6062	   Userspace is _required_ to take action for such an exit. It must
  6063	   either:
  6064	
  6065	    - Honor the guest request to suspend the VM. Userspace can request
  6066	      in-kernel emulation of suspension by setting the calling vCPU's
  6067	      state to KVM_MP_STATE_SUSPENDED. Userspace must configure the vCPU's
  6068	      state according to the parameters passed to the PSCI function when
  6069	      the calling vCPU is resumed. See ARM DEN0022D.b 5.19.1 "Intended use"
  6070	      for details on the function parameters.
  6071	
  6072	    - Deny the guest request to suspend the VM. See ARM DEN0022D.b 5.19.2
  6073	      "Caller responsibilities" for possible return values.
  6074	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
