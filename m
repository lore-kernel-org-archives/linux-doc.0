Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B899E1C6A3
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 08:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UfvCywBm"
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437DFB0;
	Wed, 25 Oct 2023 01:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bWZHBY0qveKBPw5XOi4+cbTA2/t5IHaThFqzSpaE5Tw=; b=UfvCywBmjAti4OdilR/Rwo4i99
	igUDFtD+Y+ABTD/Hi6zS7leerHPG2AjtuIUIE8kQyJ4cwA16JsXv80Y49lXEvo7tRbxyzsFcg64PT
	VyooRo+HI16LGRAeZqU9tYlYWRB3qeVrdL2zzO53mFz617JXqIvaEsQkrsjkft+LJqkbul693JNeu
	hpSUxy64iSwqSSskcMXWtqrEpDRt/WpGFiArea8eaiUBgsUkCX4h78ylsUGiF8E6O1IGcFQ7Z0YCB
	HIgtifIV1npaDVcBNbR8yfGBsqbUSEbYA9+LYcS9QBtR+uZqVl1avKUw52H6XeHUwktwzCB51D3TH
	dgOU5wfg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qvYqE-007ZnC-1S; Wed, 25 Oct 2023 08:02:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9E49230047C; Wed, 25 Oct 2023 10:02:13 +0200 (CEST)
Date: Wed, 25 Oct 2023 10:02:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
Subject: Re: [RESEND][PATCH 1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231025080213.GC37471@noisy.programming.kicks-ass.net>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-1-cff54096326d@linux.intel.com>
 <f620c7d4-6345-4ad0-8a45-c8089e3c34df@citrix.com>
 <20231025062818.7kaerqklaut7dg5r@desk>
 <20231025072255.GA37471@noisy.programming.kicks-ass.net>
 <654468cf-1563-4c1c-8c7c-076bc6dfbabf@citrix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <654468cf-1563-4c1c-8c7c-076bc6dfbabf@citrix.com>

On Wed, Oct 25, 2023 at 08:52:50AM +0100, Andrew Cooper wrote:

> > +.pushsection .entry.text, "ax"
> > +
> > +.align 64
> > +SYM_CODE_START_NOALIGN(mds_verw_sel)
> > +	UNWIND_HINT_UNDEFINED
> > +	ANNOTATE_NOENDBR
> > +1:
> > +	.word __KERNEL_DS
> > +	.skip 64 - (. - 1b), 0xcc
> 
> The 1 label aliases mds_verw_sel and this must remain like this for the
> construct to work.
> 
> So instead of .skip, why not simply .align 64, 0xcc and get rid of the
> 1: label?

Because I forgot you can add a filler byte to .align :/ Yes, that's much
saner.

> Do we have a suitably named constant cacheline size, rather than
> opencoding 64?

L1_CACHE_BYTES probably.

> 
> > +SYM_CODE_END(mds_verw_sel);
> 
> Given that KVM needs it, this probably needs an EXPORT_SYMBOL_GPL() on it.

localyesconfig ftw ;-)

/me runs
