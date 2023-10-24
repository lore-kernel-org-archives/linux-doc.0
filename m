Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E5E4736A
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 22:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AIVvGuDO"
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 458954215;
	Tue, 24 Oct 2023 15:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2y2E9U9ipcgqhNemTPgdJ7dGCY1z+qxFK9VqKODRjRo=; b=AIVvGuDOZDBlSOZMDm37tlTcVB
	iWdWJIn5mVyXVRVywL4LmGqSiYgqTah0ThEPD5lPkPpfEIS4oEif75HlfBbjsIyTK01VjqEZ7lFLX
	sx67Gi1Bn09SV/zwnsTVPinsuc29Q5++wXmfgwFrVOg87ED8y15gqxcoh7ZH3i64t9yuZBPIgxp9G
	/D0Fu8diM9tnsMNJbheKLh/9Uor+QRdDWEOqh0MTJ8m/PycUugwRN0oFtT5lOhKEJvGdJwgy1e9Q2
	SBLBGJiHPkLgD3VC5BQOX5U1Tgq4WQ53VlwPFbmrXfbNhLDrITFI8sw61xJQm/XI7q1Sa/9/NEJF6
	78f95d8w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qvPt7-0054rI-LD; Tue, 24 Oct 2023 22:28:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3FBED300451; Wed, 25 Oct 2023 00:28:37 +0200 (CEST)
Date: Wed, 25 Oct 2023 00:28:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
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
	Alyssa Milburn <alyssa.milburn@intel.com>, song@kernel.org
Subject: Re: [PATCH  v2 1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231024222837.GH33965@noisy.programming.kicks-ass.net>
References: <20231024-delay-verw-v2-0-f1881340c807@linux.intel.com>
 <20231024-delay-verw-v2-1-f1881340c807@linux.intel.com>
 <20231024103601.GH31411@noisy.programming.kicks-ass.net>
 <20231024163515.aivo2xfmwmbmlm7z@desk>
 <20231024163621.GD40044@noisy.programming.kicks-ass.net>
 <20231024164520.osvqo2dja2xhb7kn@desk>
 <20231024170248.GE40044@noisy.programming.kicks-ass.net>
 <DD2F34A0-4F2F-4C8C-A634-7DBEF31C40F0@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD2F34A0-4F2F-4C8C-A634-7DBEF31C40F0@zytor.com>

On Tue, Oct 24, 2023 at 11:27:36AM -0700, H. Peter Anvin wrote:

> the only overhead to modules other than load time (including the
> runtime linking) is that modules can't realistically be mapped using
> large page entries.

Song is working on that. Currently the module allocator is split between
all (5 IIRC) different page permissions required, next step is using
large page pools for those.
