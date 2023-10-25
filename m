Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793BB2AB25
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRVNj3VW"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0EB131;
	Wed, 25 Oct 2023 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698246561; x=1729782561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SEr5aW4KGi57nsWBOgqXVfaiVNBRpUeXtWwmjagDtZY=;
  b=DRVNj3VW+0YeyQQMwX4HFXTvWHNNfiwGY0kVBK/cHO5LA6opu8D6R2Kp
   GHzCazQABsjyl9Uy+SlXzv3l/5vyXMleVspPJ7XsX6d4ewz70Z7CXX9Ib
   Yresbl8k/HWpgm0RfO5av2qL6qR7+TwE9LXjBcoc+MSw15sg/YXVsUmnH
   CcgWh9HuxOX++lqIGABA3rbhcMRF8eMyTQymHfsr9Wj8Np6mD2e1/wwD1
   DaNQMMDD3VoUMnqplYggjhTD+lX3LeCBZ2MgEgf6zKwuJVfp4IoxFwFPR
   Zy7cs/WHsrLEOTjSPUivKWUKTIT8xEDdf/GNlagn2EAIBptZK8mCCGfxH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="451555068"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="451555068"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 08:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="111864"
Received: from mhans-mobl3.amr.corp.intel.com (HELO desk) ([10.252.132.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 08:06:20 -0700
Date: Wed, 25 Oct 2023 08:06:44 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Alyssa Milburn <alyssa.milburn@intel.com>
Subject: Re: [PATCH  v2 1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231025150644.xckrfxcr2vxcqvun@desk>
References: <20231024-delay-verw-v2-0-f1881340c807@linux.intel.com>
 <20231024-delay-verw-v2-1-f1881340c807@linux.intel.com>
 <20231024103601.GH31411@noisy.programming.kicks-ass.net>
 <20231025040029.uglv4dwmlnfhcjde@desk>
 <20231025065610.GA31201@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025065610.GA31201@noisy.programming.kicks-ass.net>

On Wed, Oct 25, 2023 at 08:56:10AM +0200, Peter Zijlstra wrote:
> > config3: 32-bit mode, pre-boot objdump
> > 
> > entry_SYSENTER_32:
> >    ...
> >    c8e:       58                      pop    %eax
> >    c8f:       90                      nop
> >    c90:       90                      nop
> >    c91:       90                      nop
> >    c92:       90                      nop
> >    c93:       90                      nop
> >    c94:       90                      nop
> >    c95:       90                      nop
> >    c96:       fb                      sti
> >    c97:       0f 35                   sysexit
> > 
> 
> If you look at arch/x86/include/asm/nops.h, you'll find (for 32bit):
> 
>  * 7: leal 0x0(%esi,%eiz,1),%esi
> 
> Which reads as:
> 
> 	load-effective-address of %esi[0] into %esi

Wow, never imagined that this would be one of the magician's trick. I
will go read on why is it better than NOPL.
