Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71E321340
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfON6swb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54E0C433C8;
	Mon, 23 Oct 2023 18:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698084488;
	bh=nIgs0wvJThOXxn7oOFB3LcbF7XBEJd/S1r1uOMhwaUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pfON6swb831n8aeMwzxjj6xbWsYHljK018mYgGx5xpYQ23ww+ylfFIAnLPz8ARk9a
	 6T3Ne9hpYee+sflOr8FZhPc5KDP3OD3ouG4DcMWu2TkWyQXi7L1eFcy1H/ixJndj6Z
	 kb0Q9MoK+7JyY/3I3baH153a6h1T9nfa87axTJt4jC4/gvruTx/1/KQh3NXH8WKXZ2
	 NQLfec/mlk8Sn/vYMYqDBRBNgwAvcBI3nwPtwKHsSDQne1DgG0zpKlnOkWIBD1QD/f
	 wATJITKZwjKP/tDk95E9ZaEpofBlAOUPsTHQFP/If/BVmJ0bW/KMB/nXYTIz8k5DIt
	 /vmkRx8q2Pksg==
Date: Mon, 23 Oct 2023 11:08:06 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
	Alyssa Milburn <alyssa.milburn@intel.com>
Subject: Re: [RESEND][PATCH 1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231023180806.udbnt4nx3r2bdyi3@treble>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-1-cff54096326d@linux.intel.com>
 <f620c7d4-6345-4ad0-8a45-c8089e3c34df@citrix.com>
 <20231021011859.c2rtc4vl7l2cl4q6@desk>
 <bdfefc38-c010-4423-b129-3f153078fd67@citrix.com>
 <20231021022134.kbey242xq7n754rg@desk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231021022134.kbey242xq7n754rg@desk>

On Fri, Oct 20, 2023 at 07:21:34PM -0700, Pawan Gupta wrote:
> On Sat, Oct 21, 2023 at 02:33:47AM +0100, Andrew Cooper wrote:
> > On 21/10/2023 2:18 am, Pawan Gupta wrote:
> > > On Sat, Oct 21, 2023 at 12:55:45AM +0100, Andrew Cooper wrote:
> > >> Also it avoids playing games with hiding data inside an instruction.
> > >> It's a neat trick, but the neater trick is avoid it whenever possible.
> > > Thanks for the pointers. I think verw in 32-bit mode won't be able to
> > > address the operand outside of 4GB range.
> > 
> > And?  In a 32bit kernel, what lives outside of a 4G range?
> > 
> > > Maybe this is fine or could it
> > > be a problem addressing from e.g. KVM module?
> > 
> > RIP-relative addressing is disp32.  Which is the same as it is for
> > direct calls.
> > 
> > So if your module is far enough away for VERW to have issues, you've got
> > far more basic problems to solve first.
> 
> Sorry, I raised the wrong problem. In 64-bit mode, verww only has 32-bit
> of relative addressing, so memory operand has to be within 4GB of
> callsite. That could be a constraint.

Even on x86-64, modules are mapped within 4GB of the kernel, so I don't
think that's a concern.

-- 
Josh
