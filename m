Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED9537C89
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 15:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QMC5eqXm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01502C433C8;
	Fri, 27 Oct 2023 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698421106;
	bh=z2XypgoUj4CyDsDS5E6xO0hRTOqveOmWXo6hbGyXGyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMC5eqXmrQZEMm5335WrTzKNTWUE/mt/wrufjaw6FA/EMZqkyuo9jir8Onc/GmJqz
	 deyKoxWMLKwh+skhGvMJbS1uI5TfmC5iFIvaR8uGr9jtny4INAf4hQDnrU6dMw+7Yq
	 rj56BEtogQu730ScQ5OI2FKl4R3Ai2zA8drwg0MM=
Date: Fri, 27 Oct 2023 17:38:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Alyssa Milburn <alyssa.milburn@intel.com>,
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v4 0/6] Delay VERW
Message-ID: <2023102733-irk-announcer-4a3a@gregkh>
References: <20231027-delay-verw-v4-0-9a3622d4bcf7@linux.intel.com>
 <20231027144848.GGZTvN0AtGIQ9kBtkA@fat_crate.local>
 <20231027150535.s4nlkppsvzeahm7t@desk>
 <20231027151226.GIZTvTWuQUXdsmt6v3@fat_crate.local>
 <20231027153242.ruabpxxywhq5upc7@desk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027153242.ruabpxxywhq5upc7@desk>

On Fri, Oct 27, 2023 at 08:32:42AM -0700, Pawan Gupta wrote:
> On Fri, Oct 27, 2023 at 05:12:26PM +0200, Borislav Petkov wrote:
> > On Fri, Oct 27, 2023 at 08:05:35AM -0700, Pawan Gupta wrote:
> > > I am going on a long vacation next week, I won't be working for the rest
> > > of the year. So I wanted to get this in a good shape quickly. This
> > > patchset addresses some security issues (although theoretical). So there
> > > is some sense of urgency. Sorry for spamming, I'll take you off the To:
> > > list.
> > 
> > Even if you're leaving for vacation, I'm sure some colleague of yours or
> > dhansen will take over this for you. So there's no need to keep sending
> > this every day. Imagine everyone who leaves for vacation would start
> > doing that...
> 
> I can imagine the amount emails maintainers get. I'll take care of this
> in future. But, its good to get some idea on how much is too much,
> specially for a security issue?

You said it wasn't a security issue (theoretical?)

And are we supposed to drop everything for such things?  Again, think of
the people who are on the other end of your patches please...

greg k-h
