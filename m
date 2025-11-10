Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C52221C163
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 06:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762755664; cv=none; b=p8o6cWezsxothGlKY9Cxqm6xyfNkrF+nMJI2g/WHJkwMuRUDmCbvmBh9ex4GYWn43wZKL+pRer4xkZsfFWE7BZZRTytQK0TuBIyCa1CTjWhddvIPq4aaBexyxxLHahQtasMjFuZFIJ64lAlHQwc8b40bF6KEmXd1bWGbdsYO3Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762755664; c=relaxed/simple;
	bh=ZcGxkDYNC5UCv0BkCG8bAreEMmuRiNPiMJ4Eq7NE7RY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O87uCBm7McOmCPin2J75JsmbMkUeuSKEJ2q+e0aRhLb5IAeSBXUrTEhJm+3rYsjSNVe3IglkhDB45YzuCm71DJI+v4dBv+/G1/g0JuXBkX9V6tRrXi0KU3dX7Xt1UNACQcfJGIXlki98XJM22369XmlvqB69S6z5WyVaZRyynII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=Cb5ObF5B; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="Cb5ObF5B"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so1954155b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 09 Nov 2025 22:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1762755661; x=1763360461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bvd5Yl5uTKxCTPtToTZFSJR27j/IrzDu4M4hsZnd7A=;
        b=Cb5ObF5BN9Cgdy0dE4ejtoOimvTB7brqeqaglZkMRJXJXUraLErzOC4pTVbyfhVZWS
         6eytGU4ydDeTY73G1nMSlznWL1CbC94tbs+j4LMNxa7tEqEZtA35DSaXndeqmISShp9Q
         DcXgecp8pjPDL46P3dlEjMljq5gy4XVDPd/n1DCw8Ye+x4OcEGUtpkenGfLs0GpbSuN/
         O4phM+TjNYs0hciVMSHCwlFFLUW75qmNUGzYlEh0uny8NBS08Iga0PRYpNYZ18CSYb94
         yndSuVDtR3NpXpfhqGx2ZbnmRzHWR9zTFA1ksMfXOmthnacu7uTJbPY18b9o8qnrI6xC
         dJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762755661; x=1763360461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2bvd5Yl5uTKxCTPtToTZFSJR27j/IrzDu4M4hsZnd7A=;
        b=BEbcMy7LmaUGDGJc1BjXN9Vyyi2qgERyTxuPrx9mwO+ZSMmegUJSUjm0uU8OutOyCw
         FHrYIRVXFbOLwB9+8L5OlE+1pKfGlVW+ptrHcURkjKqao+bkHQxqAcDEmT2nhV92aiui
         qpA6d/kUKJs9poC64HbRkH3/oEvg71FRFhtw7S1k0QLvc9hpDYMOeMQwGEV08xD1VsIi
         iHNY74z3nsB6U1XlgOo1mLq6B6VsFT0ygA6s8mYK/jhIyevztQ/Bww1fB/Uvc+oxAxfQ
         hTuWlc6EkGDOQcs54hvM0G1BzCiWY2q8tynC1+bwCLGbazvsKqRFkkFO5cS9WlcEOiqK
         bfDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf3y1o1kqoGZajPyeW6UcoBSJx7u5JlbKAgjVU6jiJ61SsaSadS96tNG3MwaPbbVsd+EJm2sF2lf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIQ2mmnMZFscUgh3bEZwBLAb03fmpSXmLtx3hbIvt3CJBLu0va
	yexfE5CTtJBk1lgIdBZE3DbXfj3xcNm5/yndMdyMuhiCazp8I9AghSH0hH/rgnvE6kc=
X-Gm-Gg: ASbGncuwHUqgpmXJeX7pJZKOnC5ByOWwqsPL9EsQOIaEW8+qfuJ7AiXI1UCyHo9gjMv
	a4NxFJO46nauwj8yAHRutes+IArbRa3g2RVg3vWtsQJt2RR0p8rM9SAWGq7Un86cN70l6Ssamn1
	wIiT7D2EVmNX8cGG+KgPZa/tAk0L35ihqoYnvKhsUM960mhzP/14ei4Yvl098AcVzpMHBVurvWG
	oEo8hZqrupy5m/ChAJ5NUtWsA0/AWIX4bTaIhhW4BQRP7HFHTPGP9KZWd5iIIsgIhQXwoA7qCFz
	3iSrV6BZoSM9QbyikLmu+yJwWPFlHdwHYYKA4TB9Mj2MHI12Y+mEkZ0t2KXYyJyH/6ags/Ah24Z
	y3e2sLCI8IqalKZyEC9Lsx/bXZ0vfpZ4sAd+7K/o5jzLHv1cCQypvz0gTzon1H3Wa/ConNFRnOq
	8oaeb7sgOg+q2SwQ==
X-Google-Smtp-Source: AGHT+IHJe19Wgu6Lk1i0m6uGDAjX1Z5fu+nfTMxhKeWaemOIoa7wCp8aZhGxugUb/8NNh1qJMMkGNw==
X-Received: by 2002:a05:6a20:7f9f:b0:343:72ff:af9b with SMTP id adf61e73a8af0-353a33532d9mr10298637637.41.1762755660784;
        Sun, 09 Nov 2025 22:21:00 -0800 (PST)
Received: from .shopee.com ([122.11.166.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc179f77sm10274534b3a.34.2025.11.09.22.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 22:21:00 -0800 (PST)
From: Leon Huang Fu <leon.huangfu@shopee.com>
To: inwardvessel@gmail.com
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
	shakeel.butt@linux.dev
Subject: Re: [PATCH mm-new v2] mm/memcontrol: Flush stats when write stat file
Date: Mon, 10 Nov 2025 14:20:53 +0800
Message-ID: <20251110062053.83754-1-leon.huangfu@shopee.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <37aa86c5-2659-4626-a80b-b3d07c2512c9@gmail.com>
References: <37aa86c5-2659-4626-a80b-b3d07c2512c9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 7, 2025 at 1:02 AM JP Kobryn <inwardvessel@gmail.com> wrote:
>
> On 11/4/25 11:49 PM, Leon Huang Fu wrote:
> > On high-core count systems, memory cgroup statistics can become stale
> > due to per-CPU caching and deferred aggregation. Monitoring tools and
> > management applications sometimes need guaranteed up-to-date statistics
> > at specific points in time to make accurate decisions.
> >
> > This patch adds write handlers to both memory.stat and memory.numa_stat
> > files to allow userspace to explicitly force an immediate flush of
> > memory statistics. When "1" is written to either file, it triggers
> > __mem_cgroup_flush_stats(memcg, true), which unconditionally flushes
> > all pending statistics for the cgroup and its descendants.
> >
> > The write operation validates the input and only accepts the value "1",
> > returning -EINVAL for any other input.
> >
> > Usage example:
> >    # Force immediate flush before reading critical statistics
> >    echo 1 > /sys/fs/cgroup/mygroup/memory.stat
> >    cat /sys/fs/cgroup/mygroup/memory.stat
> >
> > This provides several benefits:
> >
> > 1. On-demand accuracy: Tools can flush only when needed, avoiding
> >     continuous overhead
> >
> > 2. Targeted flushing: Allows flushing specific cgroups when precision
> >     is required for particular workloads
>
> I'm curious about your use case. Since you mention required precision,
> are you planning on manually flushing before every read?
>

Yes, for our use case, manual flushing before critical reads is necessary.
We're going to run on high-core count servers (224-256 cores), where the
per-CPU batching threshold (MEMCG_CHARGE_BATCH * num_online_cpus) can
accumulate up to 16,384 events (on 256 cores) before an automatic flush is
triggered. This means memory statistics can be likely stale, often exceeding
acceptable tolerance for critical memory management decisions.

Our monitoring tools don't need to flush on every read - only when making
critical decisions like OOM adjustments, container placement, or resource
limit enforcement. The opt-in nature of this mechanism allows us to pay the
flush cost only when precision is truly required.

> >
> > 3. Integration flexibility: Monitoring scripts can decide when to pay
> >     the flush cost based on their specific accuracy requirements
>
> [...]
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index c34029e92bab..d6a5d872fbcb 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -4531,6 +4531,17 @@ int memory_stat_show(struct seq_file *m, void *v)
> >       return 0;
> >   }
> >
> > +int memory_stat_write(struct cgroup_subsys_state *css, struct cftype *cft, u64 val)
> > +{
> > +     if (val != 1)
> > +             return -EINVAL;
> > +
> > +     if (css)
> > +             css_rstat_flush(css);
>
> This is a kfunc. You can do this right now from a bpf program without
> any kernel changes.
>

While css_rstat_flush() is indeed available as a BPF kfunc, the practical
challenge is determining when to call it. The natural hook point would be
memory_stat_show() using fentry, but this runs into a BPF verifier
limitation: the function's 'struct seq_file *' argument doesn't provide a
trusted path to obtain the 'struct cgroup_subsys_state *css' pointer
required by css_rstat_flush().

I attempted to implement this via BPF (code below), but it fails
verification because deriving the css pointer through
seq->private->kn->parent->priv results in an untrusted scalar that the
verifier rejects for the kfunc call:

    R1 invalid mem access 'scalar'

The verifier error occurs because:
1. seq->private is rdonly_untrusted_mem
2. Dereferencing through kernfs_node internals produces untracked pointers
3. css_rstat_flush() requires a trusted css pointer per its kfunc definition

A direct userspace interface (memory.stat_refresh) avoids these verifier
limitations and provides a cleaner, more maintainable solution that doesn't
require BPF expertise or complex workarounds.

Thanks,
Leon

---


#include "vmlinux.h"

#include "bpf_helpers.h"
#include "bpf_tracing.h"

char _license[] SEC("license") = "GPL";

extern void css_rstat_flush(struct cgroup_subsys_state *css) __weak __ksym;

static inline struct cftype *of_cft(struct kernfs_open_file *of)
{
	return of->kn->priv;
}

struct cgroup_subsys_state *of_css(struct kernfs_open_file *of)
{
	struct cgroup *cgrp = of->kn->parent->priv;
	struct cftype *cft = of_cft(of);

	/*
	 * This is open and unprotected implementation of cgroup_css().
	 * seq_css() is only called from a kernfs file operation which has
	 * an active reference on the file.  Because all the subsystem
	 * files are drained before a css is disassociated with a cgroup,
	 * the matching css from the cgroup's subsys table is guaranteed to
	 * be and stay valid until the enclosing operation is complete.
	 */
	if (cft->ss)
		return cgrp->subsys[cft->ss->id];
	else
		return &cgrp->self;
}

static inline struct cgroup_subsys_state *seq_css(struct seq_file *seq)
{
	return of_css(seq->private);
}

SEC("fentry/memory_stat_show")
int BPF_PROG(memory_stat_show, struct seq_file *seq, void *v)
{
	struct cgroup_subsys_state *css = seq_css(seq);

	if (css)
		css_rstat_flush(css);

	return 0;
}
