Received: from forwardcorp1b.mail.yandex.net (forwardcorp1b.mail.yandex.net [178.154.239.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC86440BCA1;
	Wed,  5 Aug 2026 09:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923438; cv=none; b=gDTBvyPFeyhY277hEqqB7HypqkXvDoImg2Ad5dns26ShiuFgPVjLzxio0YwsyJ6wSKjUNOODZ40oVO3xu8x0YgPxmDUjG+fJ5UGEPIxv5svhpFSV/h2zPbojFh9lKITD++dYvLMEDn78/LyD1lbYNywsthTVivqgKLvbNEsY+PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923438; c=relaxed/simple;
	bh=SSaaYC8x0Ob+e1v/cv9vzLM7AAGkmTFCGJ7J+ERAKc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bcK33vEYmx87EaiA8+/15ObJ356IkjRuDfBY+LLhbJZf6BA00RhHjsYaiX8d+dMDqKNgOESQ91Ow7ZrPOkb7Obucw3LrfA4qvzdxDNUae/j8t2y8w5HsijQIem8TOMccbx8Ic6ezzIGYN/fg9kKip5QjwcvVuB8jtI55ATxrQ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru; spf=pass smtp.mailfrom=yandex-team.ru; dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b=sc8OhmLP; arc=none smtp.client-ip=178.154.239.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b="sc8OhmLP"
Received: from mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:43a8:0:640:574d:0])
	by forwardcorp1b.mail.yandex.net (postfix) with ESMTPS id 874B1808E1;
	Wed, 05 Aug 2026 12:48:53 +0300 (MSK)
Received: from i101646577.yandex-team.ru (unknown [2a02:6bf:8080:43c::1:39])
	by mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (smtpcorp) with ESMTPSA id lmErQB23hCg0-cG0RyIly;
	Wed, 05 Aug 2026 12:48:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1785923332;
	bh=w3V7sfmWLggUmQu9ZRjliJsNs4NKeoQcp6wRpWpznBc=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=sc8OhmLPz7+seM305BniVNbQHKGkHFF8xJGHDIByfwGJskh5qeWNca8Fgqb1D0ecs
	 X/Z/gZgFJqYLz2iWEoY38gCCndFux78xIKoZIOu0NGyQz/kV4caqUJcD6OvAgcGtZd
	 0cxxv3wlCann1+83k/HGWaEYx18PohSKkzVdzN9Q=
Authentication-Results: mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@kernel.org>
Cc: Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Hao Li <hao.li@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: [RFC PATCH 0/3] mm/slub: allow capping the order kvmalloc() uses for kmalloc()
Date: Wed,  5 Aug 2026 12:48:40 +0300
Message-ID: <20260805094843.292134-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By calling kvmalloc() rather than kmalloc(), a caller states that it does
not require physically contiguous memory.  For the vast majority of those
callers the contiguity is not an optimization they can observe at all, yet
the attempt to obtain it is paid for by the whole system in buddy
fragmentation and background reclaim/compaction work.

Commit 46459154f997 ("mm: kvmalloc: make kmalloc fast path real fast
path") made the kmalloc() attempt much cheaper by dropping
__GFP_DIRECT_RECLAIM, which removed the synchronous stall.  It did not
remove the attempt itself, and the attempt still takes the zone lock,
still steals pageblocks when it succeeds, still raises
pgdat->kswapd_order, and still ends up waking kcompactd for allocations
that are served by vmalloc() a moment later.

Individual callers can be converted to vmalloc(), and that is the better
fix where it applies, but it does not scale: in practice each offender is
found only after it has hurt a production machine.  One example is
xt_jumpstack_alloc(), which issues one kvmalloc_node() per possible CPU on
every iptables/ip6tables table replace, while holding the per-address
family xt mutex.  On a 192 CPU machine a single reload is therefore 192
order-6 allocations, and the 384 below are just two of them, a little over
two minutes apart, on a 6.6 based kernel:

    ================================================================
    COUNT: 384 | PID COMM: ip6tables | ORDER: 6 | GFP: 0x52cc0
    FIRST SEEN : 2026-06-02 13:31:16.378
    LAST SEEN  : 2026-06-02 13:33:27.921  (Span: 131.543 sec)
    FLAGS      : IO | FS | DIRECT_RECLAIM | KSWAPD_RECLAIM | NORETRY
    ----------------------------------------------------------------
        __alloc_pages+0x5
        __kmalloc_large_node+0x82
        __kmalloc_node+0xc3
        kvmalloc_node+0x48
        xt_replace_table+0x95
        __do_replace+0xd3
        do_ip6t_set_ctl+0x38f
        nf_setsockopt+0x5b
        rawv6_setsockopt+0x54
        do_sock_setsockopt+0xae
        __sys_setsockopt+0x79
        __x64_sys_setsockopt+0x25
        do_syscall_64+0x37
        entry_SYSCALL_64_after_hwframe+0x78

On that kernel each of those entered direct compaction with the xt mutex
held, which is what made it visible.  That call site, and the ruleset blob
allocation next to it, have since been converted to vmalloc() in our tree,
and 46459154f997 addresses that shape of stall generically, so this series
is not asking for that incident to be fixed again.  It is about the callers
of the same shape that are still there: the veth path quoted further down
is one that 46459154f997 deliberately does not cover, and it is unlikely to
be the only one.

Patch 1 adds a vm.kvmalloc_max_contig_order sysctl capping the order
kvmalloc() will ask the page allocator for.  Requests above the cap go
straight to vmalloc(), which is the path they would have taken had the
kmalloc() attempt failed, so no semantics change.  Requests small enough
for a kmalloc cache to serve are never diverted.

Patch 2 adds a kvmalloc_forced_vmalloc counter to /proc/vmstat so that the
effect of a given setting is observable.

Patch 3 adds a KUnit suite covering both, including the invariant that the
lower bound on the sysctl is what keeps cache sized requests out of
vmalloc().

The default is MAX_PAGE_ORDER, i.e. current behavior, so this is entirely
opt-in and all three patches are gated behind CONFIG_KVMALLOC_ORDER_LIMIT.

Some things I am explicitly unsure about and would like opinions on:

 - Where does the kmalloc()/vmalloc() crossover point belong?  Callers
   whose size is always large do not need kvmalloc() at all and should
   simply call vmalloc(), which is how the netfilter sites above were
   fixed in our tree.  The class this series is aimed at is the other one:
   callers whose size is only known at runtime, is usually small, and is
   occasionally huge.  Those cannot be converted to vmalloc() without
   penalizing the common small case, so for them the crossover point has
   to live inside kvmalloc().  Today that point is fixed at "always try
   kmalloc() first".  This series makes it a global tunable.  It could
   equally be a compile time constant or a per callsite hint.  I have no
   strong opinion on which is right, only that the current value is too
   generous.

 - Order versus size units for the sysctl.  Orders match the mechanism
   being protected and give MAX_PAGE_ORDER as a natural "off" value, but
   an order valued sysctl under vm/ is unusual, and both ends of the
   accepted range end up being arch dependent.

 - __GFP_RETRY_MAYFAIL callers are currently subject to the cap like
   everyone else.  There is a reasonable argument that the flag is already
   the "I really do want contiguity" annotation and should be exempt.
   Only 7 call sites in the tree use it today.  They were deliberately not
   exempted, because that flag is also what keeps those call sites in
   direct reclaim and direct compaction after 46459154f997, and in
   practice they are not rare.  Container churn creating veth pairs
   produced this over twelve days on a single machine:

    ==================================================================
    TOTAL COUNT : 4948  =>  [ Order 7 (x4948) ]
    TIME SPAN   : 2026-05-22 13:03:27.119 --> 2026-06-03 11:40:27.303
    GFP         : 0x446dc0
    FLAGS       : IO | FS | DIRECT_RECLAIM | KSWAPD_RECLAIM | RETRY_MAYFAIL
    ------------------------------------------------------------------
        __alloc_pages
        __kmalloc_large_node
        __kmalloc_node
        kvmalloc_node
        veth_dev_init
        register_netdevice
        veth_newlink
        __rtnl_newlink
        rtnl_newlink
        rtnetlink_rcv_msg
        netlink_rcv_skb
        netlink_unicast
        netlink_sendmsg
        __sock_sendmsg
        __sys_sendto
        __x64_sys_sendto
        do_syscall_64
        entry_SYSCALL_64_after_hwframe

   Every one of those is a 512 KiB contiguous request, made by a caller
   that does not need contiguity, from inside a sendto() syscall, and each
   one is still entitled to reclaim and compact synchronously on a current
   kernel.  Exempting __GFP_RETRY_MAYFAIL would make the cap a no-op here,
   so the series treats the sysctl as an administrative override that
   supersedes caller hints, in the same spirit as the other allocation
   policy knobs under vm/.  If the consensus is that the flag must be
   honored, the exemption is a one line change.

 - The counter only accounts allocations the limit diverted, so it stays at
   zero until the limit is lowered below its MAX_PAGE_ORDER default.  It
   therefore cannot answer "what should I set this to?" ahead of time, which
   still needs tracing kvmalloc() directly, or lowering the limit on a
   canary machine and reading the counter there.  If a per order histogram
   would be a better answer to that question, say so and I will add one.



Daniil Tatianin (3):
  mm/slub: allow capping the order kvmalloc() uses for kmalloc()
  mm/slub: count kvmalloc() allocations forced to vmalloc()
  mm/slub: add KUnit coverage for the kvmalloc order limit

 Documentation/admin-guide/sysctl/vm.rst |  35 +++++
 MAINTAINERS                             |   1 +
 include/linux/vm_event_item.h           |   3 +
 lib/Kconfig.debug                       |  15 ++
 lib/tests/Makefile                      |   1 +
 lib/tests/kvmalloc_kunit.c              | 184 ++++++++++++++++++++++++
 mm/Kconfig                              |  22 +++
 mm/slab.h                               |   4 +
 mm/slub.c                               |  93 +++++++++++-
 mm/vmstat.c                             |   3 +
 10 files changed, 354 insertions(+), 7 deletions(-)
 create mode 100644 lib/tests/kvmalloc_kunit.c


base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
