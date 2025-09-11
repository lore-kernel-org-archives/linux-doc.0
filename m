Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D92C2940D
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 02:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757557902; cv=none; b=GsOY0FhEE3RvWb35fLawfbCptQHr01Hy/Uh5bTvzjAKWxYDwDHlNFUbxQylMZ8+mE20jaJ30umLB94e/zHLrLRF4hpouaFvCDPy4HUK//TGXCIEoGz0TxRQnzUVnUxdSvfhd+550uk25a/Ci35D18cMqaR4L6RRtRzgoEMXMpC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757557902; c=relaxed/simple;
	bh=3kMZvO/i1tMADDZmcxyr2hcCoOpPCD99OHYl0BnTlw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GylKaUkv3ULDrdER6cvi9F45T+6Yhja8a/SwlkzL8uCd94HWNlMg9QiBEpN/OT6t/nKkiqPAHW+YVIXKGrUfnDJqHVzctn2wkW1bbU1HcIutulK1QTGxp6nID9I33Gu9oKiFWBmr/yljLtDyPc2KWpN8euo3s0bZKbupOdTIZfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyGXj0YT; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyGXj0YT"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-7220d7dea27so1831226d6.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 19:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757557900; x=1758162700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nP6wbCxq9x6mQLQiBSlqIUPtCF+SQ7XDDNdAR44nPo4=;
        b=NyGXj0YTUsqeLmnpjwI9ipgQh/enhVcnFvPPeHgVCgZRPk5KgP8SUYbOCP9SgBHno3
         Th62xNGfXiN1IcpWGcilPfbKZro5X1WWlOG/3vCR8V8nki4u3UMEea+IP9ZHPvMJ+Ph3
         27e1AT0L1qSrhkgjB+uiN4Y+drM3/k7PLWcnCp6l2Lh2IX1hkRcaYYx01Um8+YTcygSb
         l4Q4SG9ZKAICSHsbTd/8Da/AL+d67d9y+W2PV7BNmV+qchyCog5igv7Q4QjJm5eh36Zd
         X2e4xV9QqUCoFCp6cu7s2iu4EsYXviNga/bGh7vZDwuyxUUWzgw3GKkqQgNVB/o5WAlO
         sY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757557900; x=1758162700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nP6wbCxq9x6mQLQiBSlqIUPtCF+SQ7XDDNdAR44nPo4=;
        b=BYcK9mOjsgrPA4znbb8E2ScJfhG4eA4drxrO8ecSShjrILzjnVqZKIh2eh1MHe+ymF
         wPQV//nJpg+3VXLriihsDR/LO+hhukoqAcS+aEvRE8Xo5AOC+8W/Gf6iOhYgvDIVUoAI
         mCLOQfevdS9o9TKihNTXwzn2ZdArSO1XE1zLIOPJ1HFAUQcoGgtJfRqPpzeOcTpXrl5N
         nwziDyghT8VcdjghuCIN6Mn10Kh9DW7mNxwBcBBiiK4mbrkj3o6hvCiZ2E5PcX9a7vrR
         xCBVayD6Gq1F47xNTCqQ05f2bJ1H1IEjbT7nLXfT2k0ueSy+Et0AQwuaTbWQuJSvnyuE
         KKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+2ZYRjuCkjz4YkZKWmHC/tLOgMlNkrofPyhnJ4N2MpdfZ239kQFZu/GrArypCDpLuu6R381hzKZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkD4DNsBPCePlYYKXeCyfTYHik7xb3DJtVrGLyT646i+tlc03O
	l6rQgeYTRWY5lg0Fnyhqg9bUl/ODNAGrbup0vt23e1yR9qaM+EIyqco9TOJ/ftk66Hu46cHWayD
	kNoVWsM9oWMtpp+dEvDjXLF84x33U6vc=
X-Gm-Gg: ASbGncvCI48TBEycHhSmMlGp/k40ULGyRkIG8FKhO0p0BsACMiHaG28s/Bkm26R3ddF
	gcPEgQNfRz+UCrHnof0TJZhPlqVCcYd2o4lhfMt046UJyoOWrNkfBxPkRkc+T/0/SAJyFsxslh2
	G0YAle2GSzE5xP1Z5FbIr8Kir5I6NkDw793mVFX7PX2e9fQkcRgmfXhcQFHGi3OiWbTF+CiYC6J
	3kppmQBt+3draE+Esix6eEWXC0kt5gjL7+H4m6H
X-Google-Smtp-Source: AGHT+IFv4549Bjlkb1Z6NZ8k1soS7TwcDklPSqOEtK13et4tNf5IIQCCxGt2xPSm81jmjCgBMMBrH+SVQoPZVCSMjkU=
X-Received: by 2002:ad4:5dcb:0:b0:722:f52a:1bd4 with SMTP id
 6a1803df08f44-7393e0991f3mr201672756d6.63.1757557899833; Wed, 10 Sep 2025
 19:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910024447.64788-1-laoar.shao@gmail.com> <20250910024447.64788-8-laoar.shao@gmail.com>
 <CAADnVQJF6YtzOojGV16hmUpFCiZGxuJAi6=Q4TK=VPH=_93eJA@mail.gmail.com>
In-Reply-To: <CAADnVQJF6YtzOojGV16hmUpFCiZGxuJAi6=Q4TK=VPH=_93eJA@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 11 Sep 2025 10:31:02 +0800
X-Gm-Features: AS18NWBQamtUOb14Z7OXpCMF7HjTdLWXm-KLhQksJqZVjzlAf4LNyGFT7O4xrGk
Message-ID: <CALOAHbBvwT+6f_4gBHzPc9n_SukhAs_sa5yX=AjHYsWic1MRuw@mail.gmail.com>
Subject: Re: [PATCH v7 mm-new 07/10] selftests/bpf: add a simple BPF based THP policy
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Tejun Heo <tj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Liam Howlett <Liam.Howlett@oracle.com>, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, usamaarif642@gmail.com, gutierrez.asier@huawei-partners.com, 
	Matthew Wilcox <willy@infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Amery Hung <ameryhung@gmail.com>, David Rientjes <rientjes@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, 21cnbao@gmail.com, Shakeel Butt <shakeel.butt@linux.dev>, 
	bpf <bpf@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 4:44=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Sep 9, 2025 at 7:46=E2=80=AFPM Yafang Shao <laoar.shao@gmail.com>=
 wrote:
> >
> > +/* Detecting whether a task can successfully allocate THP is unreliabl=
e because
> > + * it may be influenced by system memory pressure. Instead of making t=
he result
> > + * dependent on unpredictable factors, we should simply check
> > + * bpf_hook_thp_get_orders()'s return value, which is deterministic.
> > + */
> > +SEC("fexit/bpf_hook_thp_get_orders")
> > +int BPF_PROG(thp_run, struct vm_area_struct *vma, u64 vma_flags, enum =
tva_type tva_type,
> > +            unsigned long orders, int retval)
> > +{
>
> ...
>
> > +SEC("struct_ops/thp_get_order")
> > +int BPF_PROG(alloc_in_khugepaged, struct vm_area_struct *vma, enum bpf=
_thp_vma_type vma_type,
> > +            enum tva_type tva_type, unsigned long orders)
> > +{
>
> This is a bad idea to mix struct_ops logic with fentry/fexit style.
> struct_ops hook will not be affected by compiler optimizations,
> while fentry depends on a whim of compilers.
> struct_ops can be scoped, while fentry is always global.
> sched-ext already struggles with the later, since some scheds
> need tracing data from other parts of the kernel and they cannot
> be grouped together. All sorts of workarounds were proposed, but
> no good solution in sight. So don't go this route for THP.
> Make everything you need to be struct_ops based and/or pass
> whatever extra data into these ops.

will change it.

>
> Also think of scoping for bpf-thp from the start.
> Currently st_ops/thp_get_order is only one and it's global.
> It's ok for prototypes and experiments, but not ok for landing upstream.
> I think cgroup would a natural scope and different cgroups might
> want their own bpf based THP hints. Once you do that, think through
> how delegation of suggested order will propagate through hierarchy.

+ Tejun

As Johannes Weiner previously explained [[0]], cgroups are designed as
nested hierarchies for partitioning resources. They are a poor fit for
enforcing arbitrary, non-hierarchical policies.

: Cgroups are for nested trees dividing up resources. They're not a good
: fit for arbitrary, non-hierarchical policy settings.

[0] https://lore.kernel.org/linux-mm/20250430175954.GD2020@cmpxchg.org/

The THP  policy is a quintessential example of such an arbitrary
setting. Even within a single cgroup, it is often necessary to enable
THP for performance-critical tasks while disabling it for others to
avoid latency spikes. Implementing this policy through a cgroup
interface that propagates hierarchically would eliminate the crucial
ability to configure it on a per-task basis.

While the bpf-thp mechanism has a global scope, this does not limit
its application to a single system-wide policy. In contrast to a
hierarchical cgroup-based setting, bpf-thp offers the flexibility to
set policies per-task, per-cgroup, or globally. Fundamentally, it is a
more powerful variant of prctl(), not a variant of cgroup interface
file.

>
> bpf-oom seems to be aligning toward the same design principles,
> so don't reinvent the wheel.

Since bpf-oom's role is to select a task to kill from within **a
defined group of tasks**, it is inherently well-suited for
cgroup-based management.

--=20
Regards
Yafang
