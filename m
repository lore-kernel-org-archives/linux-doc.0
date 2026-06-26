Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989CB3F4DEF
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 13:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782481975; cv=none; b=N3QmsCsKhN8DPGAfoVWfZ6yiFjYXB3G/g1mHCUbMdnn+0aweEtJWDyBi8eS3DnG50pOVwTRb1/cAJL+dzkxyoY5F5vy1ZHQhuyEvhNoptF7UjRw5SK793BWGhX+PFbAvDd09teqsioaKw89iZV21YQKvbTrsKX1vP5PmhndrpXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782481975; c=relaxed/simple;
	bh=dJZxTpBrowY7HgrJ0VgsMDXwgpcRgiYvkWrlK4JGOew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bYSy4KZ4zZQ+6RCAqMr3BMVARC4hy1QbDC8ObZq2YmlKxBTKQ0MC2kWDuFjlW5jw8AqEh1LfDbrXVsNHaI62DcCPUhMAmQmQH+PrPgZvZlekiLQOUCYnAsIyF4QsgLVcCuBfFp+aCm/ny1OQkcb/E10jdOB/htmjcsBca7cwEHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (2048-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=tYtKxiCA; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="tYtKxiCA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rasmusvillemoes.dk;
	s=protonmail; t=1782481963; x=1782741163;
	bh=klomjTp/kFRiT2SqS4cY7wTFQ0YyZY2hiOo18ni0jNo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=tYtKxiCAO2i7EgBB0iHvY58UJ/xOmE/Mi4aygHHteB8dah1JYvhSLsHmc7aMMQkjq
	 7OoCzVeMSvPsM1+gbfgi9KlhdeVaXBjsofY47ESJvL83RhYGaWdyWlCgBzzXvarXFo
	 kqp6fCxBcZAVQEQvIFNVjWxBJJvsDe9YsSNKB4tEwD9SZNEMEGJRukqGCejizJRTJd
	 5vaO8D+ujry4oIoyUHRbg949P9Lc75PC9PM0mFwXuwzqv9vwuG/3DBfcJJH+kwv1Ti
	 dIb+++Vuq39+SPO1ikZXFumJ0bWdAWlnupQWazT3gi5B+qTYCtN0Q2DGnVsGnsZE4N
	 tHY5GUy5C1NVw==
X-Pm-Submission-Id: 4gmxvD3Kjdz1DFTD
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: "Mark Rutland" <mark.rutland@arm.com>
Cc: <linux-arm-kernel@lists.infradead.org>,  "Ard Biesheuvel"
 <ardb@kernel.org>,  "Will Deacon" <will@kernel.org>,  "Jonathan Corbet"
 <corbet@lwn.net>,  <linux-doc@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: arm64: Document that text_offset is always 0
In-Reply-To: <ajVekauNroapwbtm@J2N7QTR9R3.cambridge.arm.com> (Mark Rutland's
	message of "Fri, 19 Jun 2026 16:21:53 +0100")
References: <20260604140839.1930847-1-linux@rasmusvillemoes.dk>
	<FJaxt3BQA_NDzW32PANPtSgJ_BxYjJ7azs-k2dgboQtWdDfsdpM7j_VNuB7Vym1cYLDXKM1Tsm1YnqsSB7boQA==@protonmail.internalid>
	<ajVekauNroapwbtm@J2N7QTR9R3.cambridge.arm.com>
Date: Fri, 26 Jun 2026 15:52:39 +0200
Message-ID: <87y0g1mms8.fsf@rasmusvillemoes.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jun 19 2026, "Mark Rutland" <mark.rutland@arm.com> wrote:

> On Thu, Jun 04, 2026 at 04:08:39PM +0200, Rasmus Villemoes wrote:
>> When trying to figure out where to place and call an arm64 Image in
>> memory, reading booting.rst should provide the answer. However, it
>> requires quite some digging to figure out that text_offset is set via
>> ".quad 0" in head.S and is thus actually always 0 since v5.10.
>
> What is the actual problem?
>
> The documentation in booting.rst is accurate; I don't see why it's
> necessary to read the source code to look at text_offset. Immediately
> above the text in your diff, the documentation has:
>
> | 4. Call the kernel image
> | ------------------------
> |
> | Requirement: MANDATORY
> |
> | The decompressed kernel image contains a 64-byte header as follows::
> |
> |   u32 code0;                    /* Executable code */
> |   u32 code1;                    /* Executable code */
> |   u64 text_offset;              /* Image load offset, little endian */
> |   u64 image_size;               /* Effective Image size, little endian */
> |   u64 flags;                    /* kernel flags, little endian */
> |   u64 res2      = 0;            /* reserved */
> |   u64 res3      = 0;            /* reserved */
> |   u64 res4      = 0;            /* reserved */
> |   u32 magic     = 0x644d5241;   /* Magic number, little endian, "ARM\x64" */
> |   u32 res5;                     /* reserved (used for PE COFF offset) */
>
> Can you explain the problem you're facing? e.g.
>
> * Is the documentation unclear, in a way that could be better?
>
> * Is there some aspect of the boot protocol that is hard for a
>   bootloader to follow?
>
> * Is there some problem with *testing* that bootloaders respect the
>   text_offset requirements?
>
> * Something else?

Yes, the structure of the header is documented. But nowhere is it
explained how the text_offset field gets its value.

So imagine I've just built an arm64 kernel. Now I want to put that into
a FIT image, where I tell the bootloader where to place it and what
address to jump to, via the load= and entry= properties. Now, the
documentation

  The Image must be placed text_offset bytes from a 2MB aligned base
  address anywhere in usable system RAM and called there.

is clear enough that those two have to be the same value. What is not at
all clear is how I'm suppose to determine what that text_offset value is
that I'm suppose to add to some 2MB aligned address I choose.

Prior to 120dc60d0, one could at least 'git grep TEXT_OFFSET --
arch/arm64/' and see 'TEXT_OFFSET := 0x0'.

>> I've included a Fixes tag since I spent way too much time tracking
>> down where that text_offset might be defined. The mentioned commit did
>> get rid of all references to TEXT_OFFSET-the-macro, but not
>> text_offset-the-concept.
>
> Keeping text_offset as a concept was deliberate. That allows us to keep
> the documentation accruate for older kernel versions, and allows for the
> possiblity that a non-zero offset is introduced in future (though I
> admit that might be a tough sell).

Fair enough. But would you at least consider adding just this part:

>> +- As of v5.10, text_offset is always 0.
>> +

One can, using the documented header, read it post-factum from the
kernel binary itself, and perhaps that's what's intended. But to answer
your first question, yes, I did find the documenation unclear and
expected to find some explicit mention of how one is supposed to know
the value of text_offset.

Rasmus
