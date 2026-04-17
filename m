Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445A37416B;
	Fri, 17 Apr 2026 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417088; cv=none; b=O5wp3Yxx8BmXwNNtTCyB4K4Tx35NkRrrXwzGg0sEbTvVh9eqtY94sI18tPsbQ61OBiQ+E/o+QvoNtN8D7qn3QjDWtbbIliMUhillh9Lvcl40IO4Ovnix1qseJpf4QklXG2Wuq5ECdhN/YK/MZ4MbB+kE2S5R3lkb8ncHsCUXuVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417088; c=relaxed/simple;
	bh=Yh3aIT0LhpqB2XvIHbuHWcgibMBlm9kzvaO+VyiZxA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYfVgWoSxL+lpSo9FlP1ycHq9sQTcB/5Vs3gh3txrtRTAr9WCln9bUsgZwE3jyQ+iLTsiPe2HdLXhuIbsvq8Hu7nVdtBiM7V1byNo/Vaso8gnhkFn0x2U6QiCBoIqjmsLYnW7jyChxH7CkxNZMA3WWr/R27zPpidHoln4slCgTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=nLjA7rCB; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="nLjA7rCB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=OtUmsssVat6H5uUWOGAgIMHCFf2EzwnMzi7lYMo5hwg=; b=nLjA7rCB3i9XrrthI/d/2fWiqZ
	ByYEGdrrSLzqHMI+J9GEf1NxH2Q2a+W2J64WXkJNaYYLfAs9LnwitL/BtKi6FOxWxQ974SbiGUEgb
	uWoMSAteewAwyGp5kzWuofHPxyUsk2Nff7u5DxzZsUyWkjuF3oYO9s8xK2RlDtdbPiijnfSyEnaqb
	QAeYC8X//4jAS7helEgl1srQURzS3ArVSDTnjHF/BVNuP7wuDdqc+OnMx2sMvEOsfj4jjejBP1GPM
	Jy2KbBW9NWcUPSWU2gwVkFiX2GUfLLHuerk3DjalmVCl+keRXqRyv3VGuOb3gDxP+BPGofUE+A6Cd
	yAKIc4ng==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wDfE5-00FH6o-1a;
	Fri, 17 Apr 2026 09:11:01 +0000
Date: Fri, 17 Apr 2026 02:10:51 -0700
From: Breno Leitao <leitao@debian.org>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v4 0/3] mm/memory-failure: add panic option for
 unrecoverable pages
Message-ID: <aeHy3-vQTQYJlGw5@gmail.com>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
 <CACw3F51PC0iB6mfbiceQ_Kh242FN8zdXOfTyE5Pa_5+gjTPPGg@mail.gmail.com>
 <aeD6hpM3t0RZm5mW@gmail.com>
 <CACw3F50WYH8Vmd9EXx9+3yM=FU5-1WBkNffkGucC+wSjL+=wFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACw3F50WYH8Vmd9EXx9+3yM=FU5-1WBkNffkGucC+wSjL+=wFQ@mail.gmail.com>
X-Debian-User: leitao

On Thu, Apr 16, 2026 at 09:26:08AM -0700, Jiaqi Yan wrote:

> So we will always get the same stack trace below, right?
> 
>           panic+0xb4/0xc0
>           action_result+0x278/0x340
>           memory_failure+0x152b/0x1c80
> 
> IIUC, this stack trace itself doesn't provide any useful information
> about the memory error, right? What exactly can we use from the stack
> trace? It is just a side-effect that we failed immediately.

We can use it to correlate problems across a fleet of machines. Let me
share how crash dump analysis works in large datacenters.

There are thousands of crashes a day (to stay on the low ballpark), and
different services try to correlate and categorize them into a few
buckets, something like:

	1. New crash — needs investigation
	2. Known issue — fix is being rolled out
	3. Hardware problem — do not spend engineering time on it

When a machine crashes at a random code path like d_lookup() 67 seconds
after the memory error, the automated triage classifies it as a kernel
bug in VFS/dcache and assigns it to the filesystem team for
investigation. Engineers spend time chasing a bug that doesn't exist in
software — it's a hardware problem.

With the immediate panic at memory_failure(), the stack trace is always
recognizable and can be automatically classified as category 3 (hardware
problem). The static stack trace is the feature, not a limitation: it
gives triage automation a stable signature to match on.

The value isn't in what the stack trace and the panic() tells a human reading
one crash — it's in what it tells automated systems processing thousands of
them.

> You can still correlate failure with "Memory failure: 0x1: unhandlable
> page" and keep running until the actual fatal poison consumption takes
> down the system. Drawback is that these will be cascading events that
> can be "noisy". What I see is the choice between failing fast versus
> failing safe.

Correlating the "unhandlable page" log with a later crash is
theoretically possible but breaks down in practice at scale:

- The crash may happen seconds, minutes, or hours later — or never, if
the page isn't accessed again before a reboot.

- The crash happens on a different CPU, different task, different context

— there's no breadcrumb linking it back to the memory error.

- Automated triage systems work on stack traces and panic strings, not
by correlating dmesg lines across time with later crashes.

- The later crash looks completely different depending on the
architecture. On arm64, you get a "synchronous external abort". On
x86, it's a machine check exception. On some platforms, it might be a
generic page fault or a BUG_ON in a subsystem that found inconsistent
data. There is no single signature to match — every architecture and
every consumption path produces a different crash, making automated
correlation essentially impossible.

- Worse, the crash may never happen at all. If the corrupted memory is
read but the corruption doesn't trigger a fault — say, a flipped bit
in a permission field, a size, a pointer that still maps to valid
memory, or a data buffer — the result is silent data corruption with
no crash to correlate against. The system continues operating on wrong
data with no indication anything went wrong.

Also, I wouldn't call continuing with known-corrupted kernel memory
"failing safe" — it's the opposite. The kernel has no mechanism to
fence off a poisoned slab page or page table from future access.
Continuing is failing unsafely with a delayed, unpredictable
consequence.


> > Isn't the clean approach way better than the random one?
> 
> I don't fully agree. In the past upstream has enhanced many kernel mm
> services (e.g. khugepaged, page migration, dump_user_range()) to
> recover from memory error in order to improve system availability,
> given these service or tools can fail safe. Seeing many crashes
> pointing to a certain in-kernel service at consumption time helped us
> decide what services we should enhance, and which service we should
> prioritize. Of course not all kernel code can be recovered from memory
> error, but that doesn't mean knowing what kernel code often caused
> crash isn't useful.


That's a fair point — consumption-time crashes have historically been
useful for identifying which kernel services to harden. But I'd argue
this patch doesn't prevent that analysis, it complements it.

The sysctl defaults to off. Operators who want to observe where poison
is consumed — to prioritize which services to enhance — can leave it
disabled and get exactly the behavior they have today.

But for operators running large fleets where the priority is fast
diagnosis and machine replacement rather than kernel hardening research,
the immediate panic is what they need. They already know the memory is
bad, they don't need the kernel to keep running to find out which
subsystem hits it first.

Also, the services you mention — khugepaged, page migration,
dump_user_range() — were enhanced to handle errors in user pages,
where recovery is possible (kill the process, fail the migration). The
pages this patch panics on — reserved pages, unknown page types — are
kernel memory where _no_ recovery mechanism exists or is likely to exist.
There's no service to enhance for those; the only options are crash now
or crash later, given a crucial memory page got lost. 

> Anyway, I only have a second opinion on the usefulness of a static
> stack trace. This fail-fast option is good to have. Thanks!

Thanks for the review! Just to make sure I understand your position correctly —
are you saying you'd like changes to the patch, or is this more of a general
observation about the tradeoff?

--breno
