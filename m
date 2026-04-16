Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F263E0C73;
	Thu, 16 Apr 2026 15:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776353605; cv=none; b=O00PkxY8a2iVD7X+YkTQLg+NWJgHPsyuzb+JJ0FesTcRFmGJdPHruSl3XXLpspfShWFfNpFNPSy2V0NBIpBmiaEgZBFpDxHcsklV4bLTIyZ+CYPUfoI9BO7bnggGwT4hzn7JSDkr+oZY/Jy6bYIEjsISl7GC23hq28DqjfdYLKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776353605; c=relaxed/simple;
	bh=pko8ABRkCF7np33dJSRAlbPDoRDDm7C+k8HU/HyxhEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTXuYR30y5Bi2BS3Zp2s82lADIWO0zPtc36x6JZUSeOb7cjc5V8YF0iPNJtFTrwAU5nO4o3hd+8NDBRK3PdjNb+iWQOHqM5I4KrerzfJLqcVK7kRodfOTgFXjhhSL5bwO8cObftMJJpMivFRWhdLIPjZGH/Yvgc/gk3NHXDs4I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Dnf4Oxh2; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Dnf4Oxh2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=KunAmUKSTj1m7i2sFZ/KMt7l4R69/TMP3N1aLPhKL0k=; b=Dnf4Oxh2QVWd2T2bW3peV2Ew5U
	qTEy5oCfwnAhwpXJCiLx1fwxs/MBBwmaviqTVlttG5IERQ8sP53eru7ZB1q/kjSeQ+cBj7O+MRVug
	eMUZ/p6hgOG9Zd7WYfJVRvMI5hWFOn5VFxpqLEw52VgB344yJHW51yQ/WS3cGg7eecsEfsKzmMhca
	dwrmu4BWbt+wt+cwKcXRr0fvoYcno2CBOP+rUSXQhMjswr2u/2NVqo6ihVyWnualvHBvtMMXG17Bz
	t91keM9LlIZpGj+cUTDjewQfCyHRBUJ8KwPYiQSLYuA95wUJ5ViqI9YtUziLknmEBoI+sBRU3+tHV
	Ybvay2dQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wDOhy-00Ehzh-1E;
	Thu, 16 Apr 2026 15:32:46 +0000
Date: Thu, 16 Apr 2026 08:32:39 -0700
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
Message-ID: <aeD6hpM3t0RZm5mW@gmail.com>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
 <CACw3F51PC0iB6mfbiceQ_Kh242FN8zdXOfTyE5Pa_5+gjTPPGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACw3F51PC0iB6mfbiceQ_Kh242FN8zdXOfTyE5Pa_5+gjTPPGg@mail.gmail.com>
X-Debian-User: leitao

Hi Jiaqi,

On Wed, Apr 15, 2026 at 01:56:35PM -0700, Jiaqi Yan wrote:
> On Wed, Apr 15, 2026 at 5:55 AM Breno Leitao <leitao@debian.org> wrote:
> >
> > When the memory failure handler encounters an in-use kernel page that it
> > cannot recover (slab, page tables, kernel stacks, vmalloc, etc.), it
> > currently logs the error as "Ignored" and continues operation.
> >
> > This leaves corrupted data accessible to the kernel, which will inevitably
> > cause either silent data corruption or a delayed crash when the poisoned memory
> > is next accessed.
> >
> > This is a common problem on large fleets. We frequently observe multi-bit ECC
> > errors hitting kernel slab pages, where memory_failure() fails to recover them
> > and the system crashes later at an unrelated code path, making root cause
> > analysis unnecessarily difficult.
> >
> > Here is one specific example from production on an arm64 server: a multi-bit
> > ECC error hit a dentry cache slab page, memory_failure() failed to recover it
> > (slab pages are not supported by the hwpoison recovery mechanism), and 67
> > seconds later d_lookup() accessed the poisoned cache line causing
> > a synchronous external abort:
> >
> >     [88690.479680] [Hardware Error]: error_type: 3, multi-bit ECC
> >     [88690.498473] Memory failure: 0x40272d: unhandlable page.
> >     [88690.498619] Memory failure: 0x40272d: recovery action for
> >                    get hwpoison page: Ignored
> >     ...
> >     [88757.847126] Internal error: synchronous external abort:
> >                    0000000096000410 [#1] SMP
> >     [88758.061075] pc : d_lookup+0x5c/0x220
> >
> > This series adds a new sysctl vm.panic_on_unrecoverable_memory_failure
> > (default 0) that, when enabled, panics immediately on unrecoverable
> > memory failures. This provides a clean crash dump at the time of the
>
> I get the fail-fast part, but wonder will kernel really be able to
> provide clean crash dump useful for diagnosis?

Yes, the kernel does provide a useful crash dump. With the sysctl enabled,
here's what I observe:

	Kernel panic - not syncing: Memory failure: 0x1: unrecoverable page
	CPU: 40 UID: 0 PID: 682 Comm: bash Tainted: G B  7.0.0-next-20260414-upstream-00004-gcbb3af7bfd3b #93
	Tainted: [B]=BAD_PAGE

	Call Trace:
	 <TASK>
	 vpanic+0x399/0x700
	 panic+0xb4/0xc0
	 action_result+0x278/0x340          ← your new panic call site
	 memory_failure+0x152b/0x1c80


Without the patch (or with the sysctl disabled), you only get:

	Memory failure: 0x1: unhandlable page.
	Memory failure: 0x1: recovery action for reserved kernel page: Ignored

Then the host continues running until it eventually accesses that poisoned
memory, triggering a generic error similar to the d_lookup() case mentioned
above.

> In your example at 88757.847126, kernel was handling SEA and because
> we are under kernel context, eventually has to die(). Apparently not
> only your patch, but also memory-failure has no role to play there.
> But at least SEA handling tried its best to show the kernel code that
> consumed the memory error.
>
> So your code should apply to the memory failure handling at
> 88690.498473, which is likely triggered from APEI GHES for poison
> detection (I guess the example is from ARM64). Anything except SEA is
> considered not synchronous (by APEI is_hest_sync_notify()). If kernel
> panics there, I guess it will be in a random process context or a
> kworker thread? How useful is it for diagnosis? Just the exact time an
> error detected (which is already logged by kernel)?

The kernel panics with a clear stack trace and explicit reason, making it
straightforward to correlate and analyze the failure.

My objective is to have a clean, immediate crash rather than allowing the
system to continue running and potentially crash later (if at all).

Working at a hyperscaler, I regularly see thousands of these "unhandlable
page" messages, followed by later kernel crashes when the corrupted memory
is eventually accessed.

> On X86, for UCNA or SRAO type machine check exceptions, I think with
> your patch the panic would also happen in random process context or
> kworker thread,
>
> Can you share some clean crash dumps from your testing that show they
> are more useful than the crash at SEA? Thanks!

Certainly, here is the complete crash dump from the example above. This
happened on a real production hardware:

	[88690.478913] [ T593001] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 784
	[88690.479097] [ T593001] {1}[Hardware Error]: event severity: recoverable
	[88690.479184] [ T593001] {1}[Hardware Error]:  imprecise tstamp: 2026-03-20 13:13:08
	[88690.479282] [ T593001] {1}[Hardware Error]:  Error 0, type: recoverable
	[88690.479359] [ T593001] {1}[Hardware Error]:   section_type: memory error
	[88690.479424] [ T593001] {1}[Hardware Error]:   physical_address: 0x00000040272d5080
	[88690.479503] [ T593001] {1}[Hardware Error]:   physical_address_mask: 0xfffffffffffff000
	[88690.479606] [ T593001] {1}[Hardware Error]:   node:0 card:0 module:1 rank:1 bank:13 device:6 row:64114 column:832 requestor_id:0x0000000000000027 
	[88690.479680] [ T593001] {1}[Hardware Error]:   error_type: 3, multi-bit ECC
	[88690.479754] [ T593001] {1}[Hardware Error]:   DIMM location: not present. DMI handle: 0x000e 
	[88690.479882] [ T593001] EDAC MC0: 1 UE multi-bit ECC on unknown memory (node:0 card:0 module:1 rank:1 bank:13 device:6 row:64114 column:832 requestor_id:0x0000000000000027 DIMM location: not present. DMI handle: 0x000e page:0x40272d offset:0x5080 grain:4096 - APEI location: node:0 card:0 module:1 rank:1 bank:13 device:6 row:64114 column:832 requestor_id:0x0000000000000027 DIMM location: not present. DMI handle: 0x000e)
	[88690.498473] [ T593001] Memory failure: 0x40272d: unhandlable page.
	[88690.498619] [ T593001] Memory failure: 0x40272d: recovery action for get hwpoison page: Ignored
	[88757.847126] [ T640437] Internal error: synchronous external abort: 0000000096000410 [#1]  SMP
	[88757.867131] [ T640437] Modules linked in: ghes_edac(E) act_gact(E) sch_fq(E) tcp_diag(E) inet_diag(E) cls_bpf(E) mlx5_ib(E) sm3_ce(E) sha3_ce(E) sha512_ce(E) ipmi_ssif(E) ipmi_devintf(E) nvidia_cspmu(E) ib_uverbs(E) cppc_cpufreq(E) coresight_etm4x(E) coresight_stm(E) ipmi_msghandler(E) coresight_trbe(E) arm_cspmu_module(E) arm_smmuv3_pmu(E) arm_spe_pmu(E) stm_core(E) coresight_tmc(E) coresight_funnel(E) coresight(E) bpf_preload(E) sch_fq_codel(E) ip_tables(E) ip6_tables(E) vhost_net(E) tun(E) vhost(E) vhost_iotlb(E) tap(E) tls(E) mpls_gso(E) mpls_iptunnel(E) mpls_router(E) fou(E) acpi_power_meter(E) loop(E) drm(E) backlight(E) drm_panel_orientation_quirks(E) autofs4(E) raid0(E) efivarfs(E) dm_crypt(E)
	[88757.991191] [ T640437] CPU: 70 UID: 34133 PID: 640437 Comm: Collection-20 Kdump: loaded Tainted: G   M        E       6.16.1-0_fbk2_0_gf40efc324cc8 #1 NONE 
	[88758.017569] [ T640437] Tainted: [M]=MACHINE_CHECK, [E]=UNSIGNED_MODULE
	[88758.028860] [ T640437] Hardware name: ....
	[88758.046969] [ T640437] pstate: 23401009 (nzCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
	[88758.061075] [ T640437] pc : d_lookup+0x5c/0x220
	[88758.068392] [ T640437] lr : try_lookup_noperm+0x30/0x50
	[88758.077088] [ T640437] sp : ffff800138cafc30
	[88758.083827] [ T640437] x29: ffff800138cafc40 x28: ffff0001dcfe8bc0 x27: 00000000bc0a11f7
	[88758.098321] [ T640437] x26: 00000000000ee00c x25: ffffffffffffffff x24: 0000000000000001
	[88758.112807] [ T640437] x23: ffff003fa14d0000 x22: ffff8000828d3740 x21: ffff800138cafde8
	[88758.127281] [ T640437] x20: ffff0000d0316fc0 x19: ffff800138cafce0 x18: 0001000000000000
	[88758.141753] [ T640437] x17: 0000000000000001 x16: 0000000001ffffff x15: dfc038a300003936
	[88758.156226] [ T640437] x14: 00000000fffffffa x13: ffffffffffffffff x12: ffff0000d0316fc0
	[88758.170695] [ T640437] x11: 61c8864680b583eb x10: 0000000000000039 x9 : ffff800080fcfd68
	[88758.185170] [ T640437] x8 : ffff003fa72d5088 x7 : 0000000000000000 x6 : ffff800138cafd58
	[88758.199645] [ T640437] x5 : ffff0001dcfe8bc0 x4 : ffff80008104a330 x3 : 0000000000000002
	[88758.214111] [ T640437] x2 : ffff800138cafd4d x1 : ffff800138cafce0 x0 : ffff0000d0316fc0
	[88758.228579] [ T640437] Call trace:
	[88758.233565] [ T640437]  d_lookup+0x5c/0x220 (P)
	[88758.240864] [ T640437]  try_lookup_noperm+0x30/0x50
	[88758.248868] [ T640437]  proc_fill_cache+0x54/0x140
	[88758.256696] [ T640437]  proc_readfd_common+0x138/0x1e8
	[88758.265222] [ T640437]  proc_fd_iterate.llvm.7260857650841435759+0x1c/0x30
	[88758.277248] [ T640437]  iterate_dir+0x84/0x228
	[88758.284354] [ T640437]  __arm64_sys_getdents64+0x5c/0x110
	[88758.293383] [ T640437]  invoke_syscall+0x4c/0xd0
	[88758.300843] [ T640437]  do_el0_svc+0x80/0xb8
	[88758.307599] [ T640437]  el0_svc+0x30/0xf0
	[88758.313820] [ T640437]  el0t_64_sync_handler+0x70/0x100
	[88758.322497] [ T640437]  el0t_64_sync+0x17c/0x180
	...

And my clear crash would look like the following:

	[ 1096.480523] Memory failure: 0x2: recovery action for reserved kernel page: Ignored
	[ 1096.480751] Kernel panic - not syncing: Memory failure: 0x2: unrecoverable page
	[ 1096.480760] CPU: 5 UID: 0 PID: 683 Comm: bash Tainted: G    B               7.0.0-next-20260414-upstream-00004-gcbb3af7bfd3b #93 PREEMPTLAZY
	[ 1096.480768] Tainted: [B]=BAD_PAGE
	[ 1096.480774] Call Trace:
	[ 1096.480778]  <TASK>
	[ 1096.480782]  vpanic+0x399/0x700
	[ 1096.480821]  panic+0xb4/0xc0
	[ 1096.480849]  action_result+0x278/0x340
	[ 1096.480857]  memory_failure+0x152b/0x1c80
	[ 1096.480925]  hwpoison_inject+0x3a6/0x3f0 [hwpoison_inject]
	....


Isn't the clean approach way better than the random one?

For testing, I use this simple procedure, in case you want to play with
it:
	# modprobe hwpoison-inject
	# sysctl -w vm.panic_on_unrecoverable_memory_failure=0
	# echo 1 > /sys/kernel/debug/hwpoison/corrupt-pfn


Thanks for the review and good discussion,
--breno

