Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818B11B2EF2
	for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740674646; cv=none; b=aJX2XEpEZlQ6OLGVPCMV70FfrC7stOkXhk8svsHN8uW7T9kjFPyj98zp6UtBMOwC+GU49aMpv8X9R4xnxJpd5Gs9Fd6uHa3VYv2jTwN7BqA8QwhnA5n1m1eJjof3BPFYiOh6Q9ybdFHfwkVS1kmOyfNWH08HuP1KEvIGjudh5Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740674646; c=relaxed/simple;
	bh=fB6w7SixAEXD/myhXo99GjY8ysGqb9qy7aUzN37BOJI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h3Goe9g4jzgROr3Oa1LU/sVDrj38sUZ9NEO0asTzJWda6WTKETUwJO14TGLj1bPaDAIKEttuV13AgoGkpnIMfFMPR6lnn9MCOslQteIIwjHA5MAzq/1R7G5aWDm7CALEUn3lY1cLIc7GfXu0M1vh4GEd9wCsqrR5RKKXuvr/v3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x482BqLZ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x482BqLZ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2feb8d29740so388744a91.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 08:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740674644; x=1741279444; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/JYB8oqoHOpfjOcYGs25VQ09uupMqax+pANsHT7Jb3g=;
        b=x482BqLZyPKSGWjcglkFMBPoIlsxJh07Snt13o4k3Pwhl8RVg505zudpSjD/aTfL8j
         3N0B2UoSpN4BfKVDujWIE4MfGvweHmArgnf1RSpBh/mOC++qnprLiGo6q4zO0NIOJceF
         xIFJWt6MbRk0zvjgS20X33KhF7dpIhM8UGmH4rjJmKoLrxRRgs8wZgDWdiqZvttZjumN
         WklV64yWJ/TofGfjrmelG2Vu8JTx9xbSEMF8/+orb+00l8Gg2rMNqy0U3L9hTtMHSvCr
         CrldZxfFS7S0fTdLNQxkdrFFTtBNJGJyOJTdSk+dPk6juja/HYPdJtoCNhANbDZsD6PO
         iwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740674644; x=1741279444;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/JYB8oqoHOpfjOcYGs25VQ09uupMqax+pANsHT7Jb3g=;
        b=B/KZeN8pe2GPM4OwpdLTuAzI2dgIK5IRCrOmVYAGydyqRgcqDBVNO6it/Unu92M4dA
         wEIq/p5IejFvZrtz32LQk7nN59HMuwzn/faeJwaBjgThRIo+gZjgY3tbndPMLUsqLCFL
         +rpPKtEHavEc5oSlddEjulEmCpbBmRG/mmGB14z60dL4IqRFBreRRnCeGLTSY9cZsJEE
         xe31bHQuCsKci76ARWTx2NQKp6dheBZbbeXe3UQu+mxH42HxAzpTurnn3bAJ6fdkdCY8
         wF0o46mrofAwpWgZuRIIU8T7hZ6HcHb2SEJy/1VKgsURtDxSlXNAQiFHh3qTSmGj23O5
         0aDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMFH4/fPMXRSSUrVWReMUYnXJ7Eqaim1pfCeG7lKA6razlN6wNcmXkBtLnL+jRByL5UmdN6m32Zyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPpUZKpc1tgZ8iN1BmZSXAYJQ5w5go+8ZKBp+JiaZFSRKKTk+E
	qKwLycHoIIPfSAREeMJS2+TE86++xmL+3Xt3fvUnVHyYvrbOH+NlHeL7YVQDuAHPgLKOuP1PY6a
	gTw==
X-Google-Smtp-Source: AGHT+IGw5yzNreu/xypo2hwjbTNx8tGBWmfy+nhlosdcH+FG5or9oFqBfp6TM2HlecegwTm2+w+cuJ+tpv4=
X-Received: from pjbsd5.prod.google.com ([2002:a17:90b:5145:b0:2fc:3022:36b4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d008:b0:2ea:3f34:f18f
 with SMTP id 98e67ed59e1d1-2fe7e33d416mr11321462a91.19.1740674643568; Thu, 27
 Feb 2025 08:44:03 -0800 (PST)
Date: Thu, 27 Feb 2025 08:44:02 -0800
In-Reply-To: <946fc0f5-4306-4aa9-9b63-f7ccbaff8003@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241118123948.4796-1-kalyazin@amazon.com> <Z6u-WdbiW3n7iTjp@google.com>
 <a7080c07-0fc5-45ce-92f7-5f432a67bc63@amazon.com> <Z7X2EKzgp_iN190P@google.com>
 <6eddd049-7c7a-406d-b763-78fa1e7d921b@amazon.com> <Z7d5HT7FpE-ZsHQ9@google.com>
 <f820b630-13c1-4164-baa8-f5e8231612d1@amazon.com> <Z75nRwSBxpeMwbsR@google.com>
 <946fc0f5-4306-4aa9-9b63-f7ccbaff8003@amazon.com>
Message-ID: <Z8CWUiAYVvNKqzfK@google.com>
Subject: Re: [RFC PATCH 0/6] KVM: x86: async PF user
From: Sean Christopherson <seanjc@google.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: pbonzini@redhat.com, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, jthoughton@google.com, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, vkuznets@redhat.com, gshan@redhat.com, 
	graf@amazon.de, jgowans@amazon.com, roypat@amazon.co.uk, derekmn@amazon.com, 
	nsaenz@amazon.es, xmarcalx@amazon.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 26, 2025, Nikita Kalyazin wrote:
> On 26/02/2025 00:58, Sean Christopherson wrote:
> > On Fri, Feb 21, 2025, Nikita Kalyazin wrote:
> > > On 20/02/2025 18:49, Sean Christopherson wrote:
> > > > On Thu, Feb 20, 2025, Nikita Kalyazin wrote:
> > > > > On 19/02/2025 15:17, Sean Christopherson wrote:
> > > > > > On Wed, Feb 12, 2025, Nikita Kalyazin wrote:
> > > > > > The conundrum with userspace async #PF is that if userspace is given only a single
> > > > > > bit per gfn to force an exit, then KVM won't be able to differentiate between
> > > > > > "faults" that will be handled synchronously by the vCPU task, and faults that
> > > > > > usersepace will hand off to an I/O task.  If the fault is handled synchronously,
> > > > > > KVM will needlessly inject a not-present #PF and a present IRQ.
> > > > > 
> > > > > Right, but from the guest's point of view, async PF means "it will probably
> > > > > take a while for the host to get the page, so I may consider doing something
> > > > > else in the meantime (ie schedule another process if available)".
> > > > 
> > > > Except in this case, the guest never gets a chance to run, i.e. it can't do
> > > > something else.  From the guest point of view, if KVM doesn't inject what is
> > > > effectively a spurious async #PF, the VM-Exiting instruction simply took a (really)
> > > > long time to execute.
> > > 
> > > Sorry, I didn't get that.  If userspace learns from the
> > > kvm_run::memory_fault::flags that the exit is due to an async PF, it should
> > > call kvm run immediately, inject the not-present PF and allow the guest to
> > > reschedule.  What do you mean by "the guest never gets a chance to run"?
> > 
> > What I'm saying is that, as proposed, the API doesn't precisely tell userspace
                                                                         ^^^^^^^^^
                                                                         KVM
> > an exit happened due to an "async #PF".  KVM has absolutely zero clue as to
> > whether or not userspace is going to do an async #PF, or if userspace wants to
> > intercept the fault for some entirely different purpose.
> 
> Userspace is supposed to know whether the PF is async from the dedicated
> flag added in the memory_fault structure:
> KVM_MEMORY_EXIT_FLAG_ASYNC_PF_USER.  It will be set when KVM managed to
> inject page-not-present.  Are you saying it isn't sufficient?

Gah, sorry, typo.  The API doesn't tell *KVM* that userfault exit is due to an
async #PF.

> > Unless the remote page was already requested, e.g. by a different vCPU, or by a
> > prefetching algorithim.
> > 
> > > Conversely, if the page content is available, it must have already been
> > > prepopulated into guest memory pagecache, the bit in the bitmap is cleared
> > > and no exit to userspace occurs.
> > 
> > But that doesn't happen instantaneously.  Even if the VMM somehow atomically
> > receives the page and marks it present, it's still possible for marking the page
> > present to race with KVM checking the bitmap.
> 
> That looks like a generic problem of the VM-exit fault handling.  Eg when

Heh, it's a generic "problem" for faults in general.  E.g. modern x86 CPUs will
take "spurious" page faults on write accesses if a PTE is writable in memory but
the CPU has a read-only mapping cached in its TLB.

It's all a matter of cost.  E.g. pre-Nehalem Intel CPUs didn't take such spurious
read-only faults as they would re-walk the in-memory page tables, but that ended
up being a net negative because the cost of re-walking for all read-only faults
outweighed the benefits of avoiding spurious faults in the unlikely scenario the
fault had already been fixed.

For a spurious async #PF + IRQ, the cost could be signficant, e.g. due to causing
unwanted context switches in the guest, in addition to the raw overhead of the
faults, interrupts, and exits.

> one vCPU exits, userspace handles the fault and races setting the bitmap
> with another vCPU that is about to fault the same page, which may cause a
> spurious exit.
> 
> On the other hand, is it malignant?  The only downside is additional
> overhead of the async PF protocol, but if the race occurs infrequently, it
> shouldn't be a problem.

When it comes to uAPI, I want to try and avoid statements along the lines of
"IF 'x' holds true, then 'y' SHOULDN'T be a problem".  If this didn't impact uAPI,
I wouldn't care as much, i.e. I'd be much more willing iterate as needed.

I'm not saying we should go straight for a complex implementation.  Quite the
opposite.  But I do want us to consider the possible ramifications of using a
single bit for all userfaults, so that we can at least try to design something
that is extensible and won't be a pain to maintain.
