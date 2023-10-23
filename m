Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED5614A91
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 19:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4qjsoxC"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8E8C5;
	Mon, 23 Oct 2023 12:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698088418; x=1729624418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WPOxCjo/MZ3d3oAzLRk/DrwPZNYoVWIGJnSvwkEFy2M=;
  b=n4qjsoxCUVrPkHsUoQctc0mftT7FuYrjbYDswdLnCcDj0DpPN7Zqp2h7
   0Ei6YKD8SVX1JywOGgmK62qlSzERShcfTCC/ywQvjNeCVtn9eL1WoduJ3
   zkNLqn8EQ9vboNrEF4REK58zUNKqr0nPuCR9x/M60lMK2FhkBYjkjNx5l
   BX9ZC+DBjLY0df85j40vAUFx6Y11FtpTjww68PVTqtPoSm4Kl5Hhrz+Sl
   iTdbMOUVLIXQUvXbhY04UQWkQ9ynw+Ux7YvZ3DWAH/g6JzBci7438K/RM
   YIC/QHt2hCxZMt1ANw996CMVlEJdepBR3jI/re/fwOMeVjTPc7qrCHdKP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="389758354"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="389758354"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 12:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1089592710"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="1089592710"
Received: from qwilliam-mobl.amr.corp.intel.com (HELO desk) ([10.212.150.186])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 12:13:36 -0700
Date: Mon, 23 Oct 2023 12:13:25 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH  2/6] x86/entry_64: Add VERW just before userspace
 transition
Message-ID: <20231023191325.ot2eomswz4h5aqx2@desk>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-2-cff54096326d@linux.intel.com>
 <20231023182211.5ojm2rsoqqqwqg46@treble>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023182211.5ojm2rsoqqqwqg46@treble>

On Mon, Oct 23, 2023 at 11:22:11AM -0700, Josh Poimboeuf wrote:
> On Fri, Oct 20, 2023 at 01:45:03PM -0700, Pawan Gupta wrote:
> > +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> > +	USER_CLEAR_CPU_BUFFERS
> > +
> >  	jmp	.Lnative_iret
> >  
> >  
> > @@ -774,6 +780,9 @@ native_irq_return_ldt:
> >  	 */
> >  	popq	%rax				/* Restore user RAX */
> >  
> > +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> > +	USER_CLEAR_CPU_BUFFERS
> > +
> 
> I'm thinking the comments add unnecessary noise here.  The macro name is
> self-documenting enough.
>
> The detail about what mitigations are being done can go above the macro
> definition itself, which the reader can refer to if they want more
> detail about what the macro is doing and why.

Sure, I will move the comments to definition.

> Speaking of the macro name, I think just "CLEAR_CPU_BUFFERS" is
> sufficient.  The "USER_" prefix makes it harder to read IMO.

Ok, will drop "USER_".
