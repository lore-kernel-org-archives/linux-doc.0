Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767D93D9DC1;
	Fri, 17 Jul 2026 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304680; cv=none; b=ec15Ta9y9zaEXSbT93Jgs/yt6KKH6uaE1ezUEUfLaS2NmWJepFMg/y0ynkZZGnkh+A1Wanr/BJ4Ty/Luek0quwkgbdPGSXhZNG8ZyAGdXkD+1W0m306QO5PlLZlCrPdngpCi+brIhjsYRfDc36JbELvl3AjKP2p4o1te7i8buQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304680; c=relaxed/simple;
	bh=hhlZC55NCoOboYGzmSlGUWqv0bhMRrctydET89oRbUc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DG1FxyEhq/N2q45ukINoT0nW+ySV6JrlEh64SJUpQwcZWhznJOM3S3d2imS14m4ZwCx8jz9V90n9kxlfFAaUFZNHKD+PiBziQEw9kF3Zjl8ZBf5XUD3vwUj27kAHOzi5WPSRfGgBCEV+SWyEKaXh2tNss7lVOFRfX+BYK/PF97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=IlqNrBR+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P6bRHzLp; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="IlqNrBR+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P6bRHzLp"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AE2651400086;
	Fri, 17 Jul 2026 12:11:15 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 17 Jul 2026 12:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784304675;
	 x=1784391075; bh=NQRz/eEv6O1w3b/5Q7E8Jwnz89TBuRefEY3MCKedBO4=; b=
	IlqNrBR+vtGjLgPIojRHT4H/x2Z5H8G/x8UD3WqH+NShn2h0jkHsO8RJmIOkdspf
	peMHLCjqipb+/ylOKymkBVyZknbQUh9keZhh9kk8lNK5MxA4+ifX+/Y7S4phkzvZ
	gwkM+PEs4GJM29/Itawzhg7UWrvYraVf5ujhu0DyZlSCeNW5y2vZXUxSaPU9LAXl
	5yHjduHHrKQVTe6V5e6BsvUT6bMVNMr/v3HQCPTmuBLADLj6oBsRdtMxgsNlvTB0
	Lqk9CNrcqcN8cvAE4P27x2okHKUBNoTh4WHxhLm4pXNB0Hb7WBLMaZzBTA765Xa8
	Fb6bVYV9zqsHWAnB6rONUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784304675; x=
	1784391075; bh=NQRz/eEv6O1w3b/5Q7E8Jwnz89TBuRefEY3MCKedBO4=; b=P
	6bRHzLpADkSy9qwZa0HioJhTSUxRVwbzCZVB6K83tNp8/W0IlwOkAiCSgyVbDu8X
	F5ZPj9/Lhi9tcBKT43IFqNmNIcqR/IKzZTJbdvWLHPxOu0FJtHVizZ672YuIjW25
	joFx3H1UMs9qRAPtaZIrOIvsci59e+BHz3ecn7eh65BJNflEHj9JYxEa3DhLHu1L
	fh+vbWbZNTEbWpeUjGABVFI4FB7k6Bs+9xrxJGDG2E1iV/JKO2UTRhiuym3oiF0x
	l4LVwUQWn3ikQ83Whdl+Qylr8pUXhzyKypVv4Zqkxg9s5usUdQLnHvlbOMHcP9bl
	dzDF/3fqTe0sRvchVe1Iw==
X-ME-Sender: <xms:I1RaajJz1CUMhyvmOH4FsJs15wV25Mh7Xww32usFhxN62Fzip2ZNPA>
    <xme:I1Raah_MmmRCMFGqnMMn4EqrPUDr9I-j9TNwRQT4e6Te0sinhpnbNGUVAKD8kHtdc
    fUaqK8fB8AkxGoxA7jhQr8OLo5mQM3pL3Fv_L759lnwiCTYkiAJuZk>
X-ME-Proxy-Cause: dmFkZTGzT199FElmq41wAI354RUlYZG3ogFY7hHBHOXDBDCvD48ghXgZbJ9y9dTSiWP8Mf
    U6Z6E1ptral2P7tzzwze8OuGLKv3rleaZSKnYbo0emyW3jcCiPAnU/HppblAEoEbpIHF5h
    49vewLx8CFgg8mu1KLEKgwrFBwqCQ92KuSV8ntq8r+y5AYjeR5JheFLJSitG+E4y3hETqp
    /RZE3K/dNNE7jwxcCMKo2jfWXVERIT8RYsjjIUK/bm/cVOwnO/Zri1VAbRauAM/Kk9sW39
    9qMIR4inR8uSWiz+3XJdgk29FaggzzgIhS4gDdy4krKVfuepkQAU6s85ItWTcM+TqnbTVv
    UrHTdf2NZIYv+SR3trC4XP7ArtYOIs/IFu10qWpyPXvdERlhFQ7w2cwCtytNi+ZT0qxKO6
    tml/o02/e/LKdrD9KRTMLutRfWA5eaoaWYoivLXWNbGQBSYvIFYbX48bOHN232GOxoUEmB
    LUfo3NHgjy/sogXJoNSrl8dNkOqtot61jv/66fGA8omEeShgoZ6JtMD18WDW4KRHvEnsNi
    KTT4nxfjIF9kDkQG9d3OLxUgM2FlkQK5xQ5DzAVwVNJdjhOn9gqs0b8HV1d0bV8jsSUPPU
    o6l2jd9cG+vtKhlLAjgRVOWVkC9S7rP5evowrN7sYUf4xj8KoOCKIVmxwCpQ
X-ME-Proxy: <xmx:I1Raatbq9Qw0hu9I_n0J-ePbmeW7_rkpYpIvY4PmeWh2MbUyHDbA1w>
    <xmx:I1Raaq7gZuxZQXRhUeEjkt3z1oWx4pyZoRTqS_0J1eDZGrWgsAyAZQ>
    <xmx:I1Raat8I_LIpgfCkXp6Mtaqi6vYwQkvsbARwwPO8sr70TLxs29ns7w>
    <xmx:I1RaauZshkI0T7qsstPKFP2QGhxIp2yq6hSMKdV3a_xCMhtxGKH7Iw>
    <xmx:I1Raaif7Gtj-aCk4PnkKP-XB8F9kn2Kzme9yTGmmas6mgwiCFHoYaJ9Z>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 308BD182007E; Fri, 17 Jul 2026 12:11:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AIcAXbcH1-lN
Date: Fri, 17 Jul 2026 18:10:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ryan Roberts" <ryan.roberts@arm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Jean-Philippe Brucker" <jpb@kernel.org>, "Oded Gabbay" <ogabbay@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Message-Id: <2732dc3b-e3b0-4df6-9b63-f0de4eaca993@app.fastmail.com>
In-Reply-To: <5f82ee6b-d106-4ae1-9b2c-5a817e3e43b9@arm.com>
References: <20260717104759.123203-1-ryan.roberts@arm.com>
 <20260717104759.123203-2-ryan.roberts@arm.com>
 <1e561b1a-2c87-4a23-b4da-126b333de8ba@app.fastmail.com>
 <5f82ee6b-d106-4ae1-9b2c-5a817e3e43b9@arm.com>
Subject: Re: [RFC PATCH v1 1/8] misc/arm-cla: Add driver skeleton and documentation
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jul 17, 2026, at 17:44, Ryan Roberts wrote:
> On 17/07/2026 14:49, Arnd Bergmann wrote:
>> On Fri, Jul 17, 2026, at 12:47, Ryan Roberts wrote:
>> This sounds a lot like st64bv or st64bv0, passing an 8-word payload and returning
>> a single word per accelerator operation with shared addressing.
>
> We're actually passing 9 words here; 8 DATA words plus the LAUNCH word. CLA
> supports only 64 bit aligned and sized accesses (other accesses are RAZ/WI) so
> they have to be written as 9x64bit stores. Then poll using 64bit loads.
>
>> 
>> Why are there now two interfaces to do the same thing?
>
> Good question. This is how the HW operates.
>
>> 
>> Can a user process use st64bv to do the four steps in a
>> single instruction?
>
> No, unfortunately not.
>

Ok

>> Can a CPU start multiple asynchronous operations concurrently?
>
> Yes; STATUS indicates READY while it can accept more asynchronous operations
> ("comamnds").

How does userspace know which operations have already completed
then? (not worried about this bit, just trying to understand)

>> Do these continue to run if the starting process is scheduled out
>> and another process also tries to use CLA?
>
> Yes; the driver manages assignment of a CLA to a process context completely
> separately from the thread scheduler's decisions about which threads run on
> which CPUs and when. If another process is scheduled onto the CPU and it
> attempts to access it's VA for the CLA, it will fault into the driver's handler
> and be put to sleep until the driver decides to reassign the CLA.

This part does sound dangerous, not in the sense that I think it's
fundamentally broken, but in the complexity it adds.

I wonder if it's feasible to simplify this by always canceling
any ongoing CLA operations during switch_mm():

Is there an upper bound on how long a single operation can take,
or a guarantee that an operation at least provides a partial result
in hardware?

From your earlier descriptions, it sounds like the CPU is usually
assumed to wait for completion with WFE anyway, so from the
scheduler's perspective, the thread is active while waiting for
the accelerator to complete a job (even if from hardware side
the CPU is powered down during WFE).

If this is how it generally operates, and the accelerator jobs
are usually fast, forcing the CLA TTBR0 to be the same as the
CPU TTBR0 would avoid the entire problem of unmapping the registers
on context switch, but instead let this hook into the same place
as the corresponding iommu_mm_data switch on x86, which seems
to handle this more nicely.

> I'm not sure what you mean by "Which instruction specifically causes the fault".
> A fault occurs within the accelerator if it tries to access a virtual address
> that is not mapped by the page table or if the permissions of the mapping are
> not sufficient, etc... The fact that the accelerator has faulted is reported to
> the SW that is polling the accelerator's STATUS register within user space. That
> SW is expected to trigger fault handling by the usual kernel mechanisms by
> accessing the VA. Then it issues a RESOLVE operation to tell the accelerator it
> can continue.

Got it now. I had assumed that the page fault is delivered asynchronously
to the kernel without user space getting involved. In this case, I think
the interface is actually cleaner, though it does add a little bit
of overhead for userspace having to decipher the status. 
 
>>> +User space software is expected to create a thread to drive each CLA it is
>>> +using, and for each thread to be pinned to the CLA's local CPU.
>> 
>> What happens if multiple processes have the same chardev open and
>> each mmap() that, e.g. after a fork()? Does each process see its
>> own virtual instance of the accelerator and interact with it through
>> the same physical MMIO register range but its own process address space,
>> or do you have to rely on the registers being mapped only into a
>> single mm_struct to prevent a process from messing with another process
>> data?
>
> The driver maintains a cla_ctx for each {file description, mm_struct} pair. So
> in this case, even though the file description is shared between the parent and
> child processes, they still have distinct mm_structs so still have separate
> contexts allowing the driver to virtualize access correctly.

Ok, got it.

     Arnd
