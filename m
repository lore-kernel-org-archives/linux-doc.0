Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8D71CF80
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 18:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joEFNxBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56641C433C9;
	Mon, 23 Oct 2023 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698085334;
	bh=DuXRKNTPP+oxmrxXIzF8KREEatSCS8sUp02WksFrGHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=joEFNxBAGlFzt7+m9GSg8uOSLPPf/HstBuyv+wpoc82ZVPcmKOjVpkea0MN1e7CGo
	 YdTtmzBOmG3lDwrNZmnbbPlA3I02u+TjXLBwapbyYIZEjmMVMG9nwbiZ9ELOCmdbK9
	 GF9xiST4DIUhMBxcqsMz0ZuG8QqGN/XEgxtVTsG0T1RwCW39WA18gDk1JDRJ4mBOXn
	 HB+IxTp3mXU0z23EWRuDI8oGeSslGA3l2xK/djKgYdyhF9RjdLaOstpDl1FsXijOV4
	 dAgXubZrFZIt3WIAcX6IvJuxfbKVF2TuFjY/GEtzD3l1E4adXKnuIiDO3+D4VZJPAb
	 5fahPDLQmdc3Q==
Date: Mon, 23 Oct 2023 11:22:11 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
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
Message-ID: <20231023182211.5ojm2rsoqqqwqg46@treble>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-2-cff54096326d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231020-delay-verw-v1-2-cff54096326d@linux.intel.com>

On Fri, Oct 20, 2023 at 01:45:03PM -0700, Pawan Gupta wrote:
> +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> +	USER_CLEAR_CPU_BUFFERS
> +
>  	jmp	.Lnative_iret
>  
>  
> @@ -774,6 +780,9 @@ native_irq_return_ldt:
>  	 */
>  	popq	%rax				/* Restore user RAX */
>  
> +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> +	USER_CLEAR_CPU_BUFFERS
> +

I'm thinking the comments add unnecessary noise here.  The macro name is
self-documenting enough.

The detail about what mitigations are being done can go above the macro
definition itself, which the reader can refer to if they want more
detail about what the macro is doing and why.

Speaking of the macro name, I think just "CLEAR_CPU_BUFFERS" is
sufficient.  The "USER_" prefix makes it harder to read IMO.

-- 
Josh
