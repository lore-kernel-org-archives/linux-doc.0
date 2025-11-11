Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552FF2BE05E
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 06:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762841632; cv=none; b=AU2H3jqObZpgHHQwp3rucWNaslvyNXL4jpJFGmxP4r0HlBTObaI1uGwZKTOgXaA9OofThcJOAx91Elkamv3wTET/WqEfXLXm3jJ26mc2K1MH8fT03C2FhqjkYRlqS20J98IVf2eGYu1ZGjAnz1epUZEFFR8yG/ul5nDjOyiOmhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762841632; c=relaxed/simple;
	bh=85dZTVJaKBjootEEbBhkM6OmEcD8qaRmWyiKB5Req1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmX4srDUmBQ9DOhCghH0GpkfJPG0UbPILzzlC+gRcZnvANFk9Cv90lCsnCN3wrF/MU1l7z4hrr5R1AhfYhjCWPXMjleGo934pYphLG0XCDE+p/P9UvyBHI1J5Oryol9OVEYPuuLaqh3CG4cg0/KULUxBtunRVSjm14XLNz1leA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=RQ0rlIKa; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="RQ0rlIKa"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3437c093ef5so2112589a91.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 22:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1762841630; x=1763446430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6ye0KUrS4UUrF7S8bH5+znRQmU5zqbKdnyimkow66o=;
        b=RQ0rlIKaq+KwB13a8gNA4DS3ZRe8OXDwlE4CzJp4LkSmRz5QztnLzpi6bv+Fjfa+WF
         w5Jt15m6vAkXg99fixu9Q5PxYojb0S3hAs/Nj3JgM23O9fkr8YtmqM/6RqdShL9qHkrN
         Upi6IkD+ZeDCJm0BOidraZl36UgTPuRA7haCMlUTpteTEYBdhNEfd09DB53o+FnGUk7j
         5+BdUOJ6hkO29QoLFYcXtwKTzKTUfQbiNTHok1JblAgN9hLD63BAV6AqFAUJAjv1VYau
         SFVQ+UB1g6N6immU4EBfOQ1RQNEdnb5uL3dWygx99tF/4byx4MnLnxxl538kaAv1kaNx
         BAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762841630; x=1763446430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x6ye0KUrS4UUrF7S8bH5+znRQmU5zqbKdnyimkow66o=;
        b=higACmqZsqjgYwKzAI4givnpFgC5FMuqfbtcS0ZWgmZuIo4Yuqfp0Ly+aZIb00IyR7
         dHDUo+Y1i+yO5/owgZMfKvaBLET5qNBezAiTAOZiC8tOPbO725rNcSETmB1n7vzmI3KU
         jYrLNn+1sBqMYZ3CagSl4dKs1Miur3Tb8F+YoCU9riT1O49n9Cp9rnbihPopOvdlAfHY
         47Pg+P7bMQ1fCLN4op7pDiLSw5hJ4ujUDtpD/NWC5+Ks4+Y5iQGrFL+QSjHSmrPNB6ei
         C/CqdYNmegTuQ3I+kg9FAPg9R6iwmFoTtXzJiM1m16nqwPYXjm3SKkf6/ocaXyOzUU68
         VHHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYkXMq/obnw0KyfphSxnndePjxuf8tLkJtEz6kScNFlNYv1SP8+ciy4L+uWHWls6bEYhm/zaMS32o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4TUI86oFOygGCZ9qZiCag8Tb7ijRjAO5hAWTc6sdb2Duzo2nn
	ND7DGvy/LR6za0Kv/0D6Nc20vgd9YmKhVa7JoJ1MZLC4IdhJ2NrismSqHRrT0YvwHDQ=
X-Gm-Gg: ASbGncuk7ohIMPsoXAc/m/tNk4xvjIlupzatiFn5ZwkgD+j5HBBdfKJOC4Ic7/pOuq9
	FwpO6DYE0k9kFZzonv8zSOo1rGor4YgYyWmlo/gqYmHivJvOwQ87/239dut02tuqWgqNt5SK6pX
	PWHNZHRljO3zhRtT3upbPfHu57exbpAKFRT75sx+GwzyAdueAcVo+Xu3j9qILFND+UMAWRi8PHD
	RU99yQQM0obH3n0udh/3M5sG3LmPrCt1OxY806KuiPFhsSUvJ1tIyJECBG6VeKRY8Ei/HGJmvG+
	B864o/VTKI6eBCy5n6WFj4JxjzE3ni9CkQ/fcpfPVAC1G1U6B4MxCqBHpJ40UO5+AhxQN47tNA1
	/51qdFjtAY3OM74dLzZ+ZwAuXyOqmr1Igwxp2c+O6dpUr9xDVJW8JcZfTJbvntimUYlYFRu2KeM
	DRqbgSGrA5ZBPe2vVY9hzB8lDm
X-Google-Smtp-Source: AGHT+IFit24Wfiz5/okT1CYzaOFSn2pdykfe7Yx20hV//KiCLFFviTnyJczCSUcO4P48kN01R/ygpg==
X-Received: by 2002:a17:90b:54cc:b0:32b:df0e:9283 with SMTP id 98e67ed59e1d1-3436cd0bcd5mr13428881a91.34.1762841630530;
        Mon, 10 Nov 2025 22:13:50 -0800 (PST)
Received: from .shopee.com ([122.11.166.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc175d85sm14312666b3a.43.2025.11.10.22.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 22:13:50 -0800 (PST)
From: Leon Huang Fu <leon.huangfu@shopee.com>
To: mkoutny@suse.com
Cc: akpm@linux-foundation.org,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	hannes@cmpxchg.org,
	jack@suse.cz,
	joel.granados@kernel.org,
	kyle.meyer@hpe.com,
	lance.yang@linux.dev,
	laoar.shao@gmail.com,
	leon.huangfu@shopee.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mclapinski@google.com,
	mhocko@kernel.org,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	tj@kernel.org
Subject: Re: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for on-demand stats flushing
Date: Tue, 11 Nov 2025 14:13:42 +0800
Message-ID: <20251111061343.71045-1-leon.huangfu@shopee.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <ewcsz3553cd6ooslgzwbubnbaxwmpd23d2k7pw5s4ckfvbb7sp@dffffjvohz5b>
References: <ewcsz3553cd6ooslgzwbubnbaxwmpd23d2k7pw5s4ckfvbb7sp@dffffjvohz5b>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 10, 2025 at 9:50 PM Michal Koutný <mkoutny@suse.com> wrote:
>
> Hello Leon.

Hi Michal,

>
> On Mon, Nov 10, 2025 at 06:19:48PM +0800, Leon Huang Fu <leon.huangfu@shopee.com> wrote:
> > Memory cgroup statistics are updated asynchronously with periodic
> > flushing to reduce overhead. The current implementation uses a flush
> > threshold calculated as MEMCG_CHARGE_BATCH * num_online_cpus() for
> > determining when to aggregate per-CPU memory cgroup statistics. On
> > systems with high core counts, this threshold can become very large
> > (e.g., 64 * 256 = 16,384 on a 256-core system), leading to stale
> > statistics when userspace reads memory.stat files.
> >
> > This is particularly problematic for monitoring and management tools
> > that rely on reasonably fresh statistics, as they may observe data
> > that is thousands of updates out of date.
> >
> > Introduce a new write-only file, memory.stat_refresh, that allows
> > userspace to explicitly trigger an immediate flush of memory statistics.
>
> I think it's worth thinking twice when introducing a new file like
> this...
>
> > Writing any value to this file forces a synchronous flush via
> > __mem_cgroup_flush_stats(memcg, true) for the cgroup and all its
> > descendants, ensuring that subsequent reads of memory.stat and
> > memory.numa_stat reflect current data.
> >
> > This approach follows the pattern established by /proc/sys/vm/stat_refresh
> > and memory.peak, where the written value is ignored, keeping the
> > interface simple and consistent with existing kernel APIs.
> >
> > Usage example:
> >   echo 1 > /sys/fs/cgroup/mygroup/memory.stat_refresh
> >   cat /sys/fs/cgroup/mygroup/memory.stat
> >
> > The feature is available in both cgroup v1 and v2 for consistency.
>
> First, I find the motivation by the testcase (not real world) weak when
> considering such an API change (e.g. real world would be confined to
> fewer CPUs or there'd be other "traffic" causing flushes making this a
> non-issue, we don't know here).

Fewer CPUs?

We are going to run kernels on 224/256 cores machines, and the flush threshold
is 16384 on a 256-core machine. That means we will have stale statistics often,
and we will need a way to improve the stats accuracy.

>
> Second, this is open to everyone (non-root) who mkdir's their cgroups.
> Then why not make it the default memory.stat behavior? (Tongue-in-cheek,
> but [*].)
>
> With this change, we admit the implementation (async flushing) and leak
> it to the users which is hard to take back. Why should we continue doing
> any implicit in-kernel flushing afterwards?

If the concern is that we're papering over a suboptimal flush path, I'm happy
to take a closer look. I'll review both the synchronous and asynchronous
flushing paths to see how to improve it.

>
> Next, v1 and v2 haven't been consistent since introduction of v2 (unlike
> some other controllers that share code or even cftypes between v1 and
> v2). So I'd avoid introducing a new file to V1 API.
>
> When looking for analogies, I admittedly like memory.reclaim's
> O_NONBLOCK better (than /proc/sys/vm/stat_refresh). That would be an
> argument for flushing by default mentioned abovee [*]).
>
> Also, this undercuts the hooking of rstat flushing into BPF. I think the
> attempts were given up too early (I read about the verifier vs
> seq_file). Have you tried bypassing bailout from
> __mem_cgroup_flush_stats via trace_memcg_flush_stats?
>

I tried "tp_btf/memcg_flush_stats", but it didn't work:

        10: (85) call css_rstat_flush#80218
        program must be sleepable to call sleepable kfunc css_rstat_flush

The bpf code and the error message are attached at last section.

>
> All in all, I'd like to have more backing data on insufficiency of (all
> the) rstat optimizations before opening explicit flushes like this
> (especially when it's meant to be exposed by BPF already).
>

It's proving non-trivial to capture a persuasive delta. The global worker
already flushes rstat every two seconds (2UL*HZ), so the window where
userspace can observe stale numbers is short.

[...]

Thanks,
Leon

---

#include "vmlinux.h"

#include "bpf_helpers.h"
#include "bpf_tracing.h"

char _license[] SEC("license") = "GPL";

extern void css_rstat_flush(struct cgroup_subsys_state *css) __weak __ksym;

SEC("tp_btf/memcg_flush_stats")
int BPF_PROG(memcg_flush_stats, struct mem_cgroup *memcg, s64 stats_updates, bool force, bool needs_flush)
{
	if (!force || !needs_flush) {
		css_rstat_flush(&memcg->css);
		__bpf_vprintk("memcg_flush_stats: memcg id=%d, stats_updates=%lld, force=%d, needs_flush=%d\n",
					  memcg->id.id, stats_updates, force, needs_flush);
	}
    return 0;
}

---

permission denied:
        0: R1=ctx() R10=fp0
        ; int BPF_PROG(memcg_flush_stats, struct mem_cgroup *memcg, s64 stats_updates, bool force, bool needs_flush) @ memcg.c:13
        0: (79) r6 = *(u64 *)(r1 +24)         ; R1=ctx() R6_w=scalar()
        1: (79) r9 = *(u64 *)(r1 +16)         ; R1=ctx() R9_w=scalar()
        ; if (!force || !needs_flush) { @ memcg.c:15
        2: (15) if r9 == 0x0 goto pc+1        ; R9_w=scalar(umin=1)
        3: (55) if r6 != 0x0 goto pc+27       ; R6_w=0
        4: (b7) r3 = 0                        ; R3_w=0
        ; int BPF_PROG(memcg_flush_stats, struct mem_cgroup *memcg, s64 stats_updates, bool force, bool needs_flush) @ memcg.c:13
        5: (79) r7 = *(u64 *)(r1 +0)
        func 'memcg_flush_stats' arg0 has btf_id 623 type STRUCT 'mem_cgroup'
        6: R1=ctx() R7_w=trusted_ptr_mem_cgroup()
        6: (bf) r2 = r7                       ; R2_w=trusted_ptr_mem_cgroup() R7_w=trusted_ptr_mem_cgroup()
        7: (0f) r2 += r3                      ; R2_w=trusted_ptr_mem_cgroup() R3_w=0
        8: (79) r8 = *(u64 *)(r1 +8)          ; R1=ctx() R8_w=scalar()
        ; css_rstat_flush(&memcg->css); @ memcg.c:16
        9: (bf) r1 = r2                       ; R1_w=trusted_ptr_mem_cgroup() R2_w=trusted_ptr_mem_cgroup()
        10: (85) call css_rstat_flush#80218
        program must be sleepable to call sleepable kfunc css_rstat_flush
        processed 11 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
