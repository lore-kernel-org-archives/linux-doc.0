Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61335507
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 23:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ja1Mh8BT"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D019010CA;
	Fri, 20 Oct 2023 16:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697845781; x=1729381781;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sUVfTo3lntITx/vLDxRaXJpf3T8h1tdB1hdFMPw4iHA=;
  b=Ja1Mh8BTYYoWirSph/H2mmVe1NkbNukdFVYhY74IL8OxC1GcnKoOC2dw
   UWo4aCWAgYrT5echBeOrbIUOaCVdp/TFGDLbqwdQtd8BxrTifnBFY8X5q
   a0uDHRk27edY7GjCf8X2T+05xkp+eWPBEFVoOEQ0hE6KMnZYyATi7u39q
   DhLcrAQ/rBhmjqLBi2Ek0RkAduAtJAnNGxBFqVCVsjE7GTTpbPH4svxMH
   m+TCSfVK099HXoyCyfhOOeiVBwuSJSdC2aT3RsupxSAob8/Vwr6qQ0LLA
   x3VnuX8IuNNQ03lykieIFVKYMCXgY1tRff2oTLpHrgDKixfy8/9GV9jcU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="389446278"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="389446278"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 16:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="707373792"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="707373792"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 16:49:40 -0700
Date: Fri, 20 Oct 2023 16:49:34 -0700
From: Andi Kleen <ak@linux.intel.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	tim.c.chen@linux.intel.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com
Subject: Re: [PATCH  3/6] x86/entry_32: Add VERW just before userspace
 transition
Message-ID: <ZTMSDkBzUZBiTBoG@tassilo>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-3-cff54096326d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020-delay-verw-v1-3-cff54096326d@linux.intel.com>

On Fri, Oct 20, 2023 at 01:45:09PM -0700, Pawan Gupta wrote:
> As done for entry_64, add support for executing VERW late in exit to
> user path for 32-bit mode.
> 
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>  arch/x86/entry/entry_32.S | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
> index 6e6af42e044a..bbf77d2aab2e 100644
> --- a/arch/x86/entry/entry_32.S
> +++ b/arch/x86/entry/entry_32.S
> @@ -886,6 +886,9 @@ SYM_FUNC_START(entry_SYSENTER_32)
>  	popfl
>  	popl	%eax
>  
> +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> +	USER_CLEAR_CPU_BUFFERS
> +
>  	/*
>  	 * Return back to the vDSO, which will pop ecx and edx.
>  	 * Don't bother with DS and ES (they already contain __USER_DS).

Did you forget the INT 0x80 entry point?

-Andi

