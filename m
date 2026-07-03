Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2E33CB2D9;
	Fri,  3 Jul 2026 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783078751; cv=none; b=O1jmJ15lWg5nayNTzFvJesIxdyjoWvvCNH17Wg+fMdyw6/lGtwDdlRJlAgML/YOFW+UuIjl95US1p+7oE/ZyXw5dpPusveFo+jX3EA/QBft0gQpetJcgKyrCBPTwhHUrGmjj5QnKzgI08HaIZMhU8cLZx/d73931vgdB2cMQ5aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783078751; c=relaxed/simple;
	bh=z3Dcn4Y+gh7aauR9UG/kjI8tsi2P6DhFCJ2KNlAEi10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAVXj6HlEwru7AnMz5Yd5Cuj4w+SAbxz8wvVZW4gbNj71zwCzs3F5A706tfNvO2whpSZW8DJ5F95Vq9qvcNi1SRwxGaJKHLZpfvHwzOc1GgHlOpqwZwjOF9EGe2HLchHTrS4YtigoRCEIsoezh/CWouU1a9hgXbut7guuKYAjd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=I/NZ4zB3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="I/NZ4zB3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D5F51F91;
	Fri,  3 Jul 2026 04:39:04 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 800673F673;
	Fri,  3 Jul 2026 04:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783078748; bh=z3Dcn4Y+gh7aauR9UG/kjI8tsi2P6DhFCJ2KNlAEi10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/NZ4zB3KGO1A3CA8wk2BQBUeSD4ExqXYaUHMMxGNLUzs/+OSwYJtNEXLndNuPlJ2
	 BhY0E94DJlFLHGEC1Fi0CWIMT8q2Fmu+lOHwgt6quRvF1g4ivIcFV+DAqu4D6gGkBY
	 +ycMh/1Mu4tDuHikoShBJkEbl74VV9sl2URanl/Q=
Date: Fri, 3 Jul 2026 12:39:00 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: arm64: Document that text_offset is always 0
Message-ID: <akefVP09OXYWYuup@J2N7QTR9R3>
References: <20260604140839.1930847-1-linux@rasmusvillemoes.dk>
 <FJaxt3BQA_NDzW32PANPtSgJ_BxYjJ7azs-k2dgboQtWdDfsdpM7j_VNuB7Vym1cYLDXKM1Tsm1YnqsSB7boQA==@protonmail.internalid>
 <ajVekauNroapwbtm@J2N7QTR9R3.cambridge.arm.com>
 <87y0g1mms8.fsf@rasmusvillemoes.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0g1mms8.fsf@rasmusvillemoes.dk>

On Fri, Jun 26, 2026 at 03:52:39PM +0200, Rasmus Villemoes wrote:
> On Fri, Jun 19 2026, "Mark Rutland" <mark.rutland@arm.com> wrote:
> 
> > On Thu, Jun 04, 2026 at 04:08:39PM +0200, Rasmus Villemoes wrote:
> >> When trying to figure out where to place and call an arm64 Image in
> >> memory, reading booting.rst should provide the answer. However, it
> >> requires quite some digging to figure out that text_offset is set via
> >> ".quad 0" in head.S and is thus actually always 0 since v5.10.
> >
> > What is the actual problem?
> >
> > The documentation in booting.rst is accurate; I don't see why it's
> > necessary to read the source code to look at text_offset. Immediately
> > above the text in your diff, the documentation has:
> >
> > | 4. Call the kernel image
> > | ------------------------
> > |
> > | Requirement: MANDATORY
> > |
> > | The decompressed kernel image contains a 64-byte header as follows::
> > |
> > |   u32 code0;                    /* Executable code */
> > |   u32 code1;                    /* Executable code */
> > |   u64 text_offset;              /* Image load offset, little endian */
> > |   u64 image_size;               /* Effective Image size, little endian */
> > |   u64 flags;                    /* kernel flags, little endian */
> > |   u64 res2      = 0;            /* reserved */
> > |   u64 res3      = 0;            /* reserved */
> > |   u64 res4      = 0;            /* reserved */
> > |   u32 magic     = 0x644d5241;   /* Magic number, little endian, "ARM\x64" */
> > |   u32 res5;                     /* reserved (used for PE COFF offset) */
> >
> > Can you explain the problem you're facing? e.g.
> >
> > * Is the documentation unclear, in a way that could be better?
> >
> > * Is there some aspect of the boot protocol that is hard for a
> >   bootloader to follow?
> >
> > * Is there some problem with *testing* that bootloaders respect the
> >   text_offset requirements?
> >
> > * Something else?
> 
> Yes, the structure of the header is documented. But nowhere is it
> explained how the text_offset field gets its value.
> 
> So imagine I've just built an arm64 kernel. Now I want to put that into
> a FIT image, where I tell the bootloader where to place it and what
> address to jump to, via the load= and entry= properties. Now, the
> documentation
> 
>   The Image must be placed text_offset bytes from a 2MB aligned base
>   address anywhere in usable system RAM and called there.
> 
> is clear enough that those two have to be the same value. What is not at
> all clear is how I'm suppose to determine what that text_offset value is
> that I'm suppose to add to some 2MB aligned address I choose.

To determine that you should read the text_offset field from the header
in the Image binary.

That's the *entire* point of having the header -- bootloaders and
scripts should read that, and don't need to know anything about the
kernel source code or build process.

For example, see the aarch64 boot-wrapper:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git/commit/?id=4a50f69c550473b989f0d38f096d4d9a3a6804c7

> Prior to 120dc60d0, one could at least 'git grep TEXT_OFFSET --
> arch/arm64/' and see 'TEXT_OFFSET := 0x0'.

That was never necessary, and never a good idea, because the internals
of the kernel source code can change (as they have now). Bootloaders
and/or scripting should consume the Image header.

> >> I've included a Fixes tag since I spent way too much time tracking
> >> down where that text_offset might be defined. The mentioned commit did
> >> get rid of all references to TEXT_OFFSET-the-macro, but not
> >> text_offset-the-concept.
> >
> > Keeping text_offset as a concept was deliberate. That allows us to keep
> > the documentation accruate for older kernel versions, and allows for the
> > possiblity that a non-zero offset is introduced in future (though I
> > admit that might be a tough sell).
> 
> Fair enough. But would you at least consider adding just this part:
> 
> >> +- As of v5.10, text_offset is always 0.
> >> +

If we add that, then we're tacitly saying that people don't need to read
the text_offset field from the header, and we're removing our ability to
ever change that.

I don't think we should add such a statement unless we're certain we'll
never want a non-zero text_offset in future.

> One can, using the documented header, read it post-factum from the
> kernel binary itself, and perhaps that's what's intended. But to answer
> your first question, yes, I did find the documenation unclear and
> expected to find some explicit mention of how one is supposed to know
> the value of text_offset.

As above, reading the header from the Image binary is *exactly* what is
intended.

If that's not clear from the documentation, what do you think would
clarify that?

Mark.
