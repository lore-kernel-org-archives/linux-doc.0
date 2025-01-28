Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCCC13A26F
	for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2025 05:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738043451; cv=none; b=HOOeeTuL2OT5AeRK5+8A5QJcLRveSs8gfKbB49/jXjCIvcpgKAozUfo/QRRL2RXW2fy+yFSLFGR7dPgzTQLdlY5N4PzBPNb9OmDn+kQMTGQq8bdXlUIBmutFnlhbXRMgpCtazmEIO8RCj6AcJfrqTXWQ2wxjLxJETdttsvs0lZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738043451; c=relaxed/simple;
	bh=aM3lKtY8kdw5h0YWr7OWV0NrYdHkMgeS+MGMD4Bvu3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n4FG8z2YqFwtOFjztVEwewspWkeZEEXArXfp0hDtcUyJxRVkmbWSfCxSVvFU3pWFS7uvhXZYOGDW0Ahpo7JBrNUjlfSfkyhNu0M3hyDCroB89wjNyWDS7ULGczz9oldbNgK59+7RutOqgC/ZHNpfDvw0HhUtig4HiuL1BylGO5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IcJwg1Y2; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IcJwg1Y2"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4679b5c66d0so119741cf.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2025 21:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738043448; x=1738648248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/DLIHVgjJGr7B8yXQBAbJyuY0c81SWL6taCv3/m5lw=;
        b=IcJwg1Y2Khw+p3sLbW+j4BTnYBDwrRSLzW2q7p8cSF/g0BV0KZUxxSLhCmSF+029B0
         N82i7hFxrMX9MCh5Einy1shexLHo65bOQWYX6NiU7lMq0qimbHn3fbs1wzKbdlAwJpVK
         ynrAsIBXWd2XZVY0tUZKovWIIN8mMRH5a0y7YUvT2EHw1jg2KMuGbJ7lfI1Pihjxe/DZ
         YyHdjXlux9Yrm2/b0Yy2mPY/X5yLAlIU5CuICHSC58Gk1T/v0FSyKPH6PB4dqWSFXGTF
         dfNg/5CwbEQUr2PQMotJQf4DKObQBR++dxtIqdkkVENCxHfJzH9u6Ryo5w1s6HMAM4g4
         N3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738043448; x=1738648248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/DLIHVgjJGr7B8yXQBAbJyuY0c81SWL6taCv3/m5lw=;
        b=UtQZF2nhOEvakg/jXTFSrABn59DbZ7NgAX7JFkpOWofa166M0Fq2mYZcBwpw5dlK7O
         auxx4JcHHU5RE056LTw9/DU2fu5g4ZruMbF9BGPCGbONVt7F64e2jPAYwlpAShDACEjB
         FaCVquBGDzbhR4G8Xb28HbWozLDHEqn71dOyUhlmqT5qslI463hs+qZjJsy3aU6khp1L
         THK7Zv4Ht5UhftbWQM0fgbHXLt9vI8XNckaX8wLTjFjyiG0m5iQS19JtfEFXU0IH10yF
         0igKmyfmcLXZPBMM2wK7ZgBrCWanuc02qWXVfow60B1BLfdAIw6kkesTL58raWDQZkaO
         hxPw==
X-Forwarded-Encrypted: i=1; AJvYcCWSMEOUBjDFMzpuqtn07WI+hjOY4AWuIOgwESSeCRCnyZbXXW3PGycBFs84Lrq87Y9jNQbi7CYQ8V4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyjJsS1ZVZfrfmdBOOeaQGjMOo2TnRRNaJHbXcv38b8CJVnJiz
	9dXli+kCl3cMMsGbiyUaMPEka1rvkVN2KmuEMEl7AjtTYcjLJejTdJCItTgwQL4HzXSU8PZZHzp
	eFKSaIdn1aCZ90VXpkb/f6UhW7PQ9y0nCrIPd
X-Gm-Gg: ASbGnctTROSmEXcxH6+KGj5FIUpV8gkOmFZ4M8Z/SBWFFzkIKxbCoe3J37NIY+TUBVZ
	LAucAPX3NatqPOkqgT2Y9LYhJQ/9InbOPTNxTm607PtAAZyUPKP3rCZhVulVI/HTbIiqpIXyc
X-Google-Smtp-Source: AGHT+IHDuLV4fujynqcRkA0GndFhAYVnc8TQAi854bSzeYYHzi0RBRg+6y9hnvMQO4JUbp3yILSA8/hlwG7huDMipjM=
X-Received: by 2002:a05:622a:6186:b0:466:a3ed:bde7 with SMTP id
 d75a77b69052e-46fc55f7d43mr2156801cf.6.1738043447748; Mon, 27 Jan 2025
 21:50:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <c5afb05e-f5c0-4b23-93d8-747b82200230@amd.com>
In-Reply-To: <c5afb05e-f5c0-4b23-93d8-747b82200230@amd.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 27 Jan 2025 21:50:36 -0800
X-Gm-Features: AWEUYZnjiIuowX4OTkjkTw9V3sA9TRsIgEZqtk51nGBoKXRYsomJkoZtqy6N6CY
Message-ID: <CAJuCfpHVFFtGJ9e9kRJp6BoaNGApaR47jQSAv8KJJEnv9YKmig@mail.gmail.com>
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
To: Shivank Garg <shivankg@amd.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 9:27=E2=80=AFPM Shivank Garg <shivankg@amd.com> wro=
te:
>
> Hi Suren,
>
> I tested the patch-series on AMD EPYC Zen 5 system
> (2-socket, 64-core per socket with SMT Enabled, 4 NUMA nodes)
> using mmtests's PFT (config-workload-pft-threads) benchmark on
> mm-unstable.
>
> On 1/11/2025 9:55 AM, Suren Baghdasaryan wrote:
> > Back when per-vma locks were introduces, vm_lock was moved out of
> > vm_area_struct in [1] because of the performance regression caused by
> > false cacheline sharing. Recent investigation [2] revealed that the
> > regressions is limited to a rather old Broadwell microarchitecture and
> > even there it can be mitigated by disabling adjacent cacheline
> > prefetching, see [3].
> > Splitting single logical structure into multiple ones leads to more
> > complicated management, extra pointer dereferences and overall less
> > maintainable code. When that split-away part is a lock, it complicates
> > things even further. With no performance benefits, there are no reasons
> > for this split. Merging the vm_lock back into vm_area_struct also allow=
s
> > vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> > This patchset:
> > 1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
> > boundary and changing the cache to be cacheline-aligned to minimize
> > cacheline sharing;
> > 2. changes vm_area_struct initialization to mark new vma as detached un=
til
> > it is inserted into vma tree;
> > 3. replaces vm_lock and vma->detached flag with a reference counter;
> > 4. regroups vm_area_struct members to fit them into 3 cachelines;
> > 5. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for th=
eir
> > reuse and to minimize call_rcu() calls.
> >
> > Pagefault microbenchmarks show performance improvement:
> > Hmean     faults/cpu-1    507926.5547 (   0.00%)   506519.3692 *  -0.28=
%*
> > Hmean     faults/cpu-4    479119.7051 (   0.00%)   481333.6802 *   0.46=
%*
> > Hmean     faults/cpu-7    452880.2961 (   0.00%)   455845.6211 *   0.65=
%*
> > Hmean     faults/cpu-12   347639.1021 (   0.00%)   352004.2254 *   1.26=
%*
> > Hmean     faults/cpu-21   200061.2238 (   0.00%)   229597.0317 *  14.76=
%*
> > Hmean     faults/cpu-30   145251.2001 (   0.00%)   164202.5067 *  13.05=
%*
> > Hmean     faults/cpu-48   106848.4434 (   0.00%)   120641.5504 *  12.91=
%*
> > Hmean     faults/cpu-56    92472.3835 (   0.00%)   103464.7916 *  11.89=
%*
> > Hmean     faults/sec-1    507566.1468 (   0.00%)   506139.0811 *  -0.28=
%*
> > Hmean     faults/sec-4   1880478.2402 (   0.00%)  1886795.6329 *   0.34=
%*
> > Hmean     faults/sec-7   3106394.3438 (   0.00%)  3140550.7485 *   1.10=
%*
> > Hmean     faults/sec-12  4061358.4795 (   0.00%)  4112477.0206 *   1.26=
%*
> > Hmean     faults/sec-21  3988619.1169 (   0.00%)  4577747.1436 *  14.77=
%*
> > Hmean     faults/sec-30  3909839.5449 (   0.00%)  4311052.2787 *  10.26=
%*
> > Hmean     faults/sec-48  4761108.4691 (   0.00%)  5283790.5026 *  10.98=
%*
> > Hmean     faults/sec-56  4885561.4590 (   0.00%)  5415839.4045 *  10.85=
%*
>
> Results:
>                              mm-unstable-vanilla   mm-unstable-v9-pervma-=
lock
> Hmean     faults/cpu-1    2018530.3023 (   0.00%)  2051456.8039 (   1.63%=
)
> Hmean     faults/cpu-4     718869.0234 (   0.00%)   720985.6986 (   0.29%=
)
> Hmean     faults/cpu-7     377965.1187 (   0.00%)   368305.2802 (  -2.56%=
)
> Hmean     faults/cpu-12    215502.5334 (   0.00%)   212764.0061 (  -1.27%=
)
> Hmean     faults/cpu-21    149946.1873 (   0.00%)   150688.2173 (   0.49%=
)
> Hmean     faults/cpu-30    142379.7863 (   0.00%)   143677.5012 (   0.91%=
)
> Hmean     faults/cpu-48    139625.5003 (   0.00%)   156217.1383 *  11.88%=
*
> Hmean     faults/cpu-79    119093.6132 (   0.00%)   140501.1787 *  17.98%=
*
> Hmean     faults/cpu-110   102446.6879 (   0.00%)   114128.7155 (  11.40%=
)
> Hmean     faults/cpu-128    96640.4022 (   0.00%)   109474.8875 (  13.28%=
)
> Hmean     faults/sec-1    2018197.4666 (   0.00%)  2051119.1375 (   1.63%=
)
> Hmean     faults/sec-4    2853494.9619 (   0.00%)  2865639.8350 (   0.43%=
)
> Hmean     faults/sec-7    2631049.4283 (   0.00%)  2564037.1696 (  -2.55%=
)
> Hmean     faults/sec-12   2570378.4204 (   0.00%)  2540353.2525 (  -1.17%=
)
> Hmean     faults/sec-21   3018640.3933 (   0.00%)  3014396.9773 (  -0.14%=
)
> Hmean     faults/sec-30   4150723.9209 (   0.00%)  4167550.4070 (   0.41%=
)
> Hmean     faults/sec-48   6459327.6559 (   0.00%)  7217660.4385 *  11.74%=
*
> Hmean     faults/sec-79   8977397.1421 (   0.00%) 10695351.6214 *  19.14%=
*
> Hmean     faults/sec-110 10590055.2262 (   0.00%) 12309035.9250 (  16.23%=
)
> Hmean     faults/sec-128 11448246.6485 (   0.00%) 13554648.3823 (  18.40%=
)

Hi Shivank,
Thank you for providing more test results! This looks quite good!

>
> Please add my:
> Tested-by: Shivank Garg <shivankg@amd.com>
>
> I would be happy to test future versions if needed.

That would be very much appreciated! I'll CC you on the next version.
Thanks,
Suren.

>
> Thanks,
> Shivank
>
>
>
> >
> > Changes since v8 [4]:
> > - Change subject for the cover letter, per Vlastimil Babka
> > - Added Reviewed-by and Acked-by, per Vlastimil Babka
> > - Added static check for no-limit case in __refcount_add_not_zero_limit=
ed,
> > per David Laight
> > - Fixed vma_refcount_put() to call rwsem_release() unconditionally,
> > per Hillf Danton and Vlastimil Babka
> > - Use a copy of vma->vm_mm in vma_refcount_put() in case vma is freed f=
rom
> > under us, per Vlastimil Babka
> > - Removed extra rcu_read_lock()/rcu_read_unlock() in vma_end_read(),
> > per Vlastimil Babka
> > - Changed __vma_enter_locked() parameter to centralize refcount logic,
> > per Vlastimil Babka
> > - Amended description in vm_lock replacement patch explaining the effec=
ts
> > of the patch on vm_area_struct size, per Vlastimil Babka
> > - Added vm_area_struct member regrouping patch [5] into the series
> > - Renamed vma_copy() into vm_area_init_from(), per Liam R. Howlett
> > - Added a comment for vm_area_struct to update vm_area_init_from() when
> > adding new members, per Vlastimil Babka
> > - Updated a comment about unstable src->shared.rb when copying a vma in
> > vm_area_init_from(), per Vlastimil Babka
> >
> > [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google=
.com/
> > [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
> > [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT=
_kbfP_pR+-2g@mail.gmail.com/
> > [4] https://lore.kernel.org/all/20250109023025.2242447-1-surenb@google.=
com/
> > [5] https://lore.kernel.org/all/20241111205506.3404479-5-surenb@google.=
com/
> >
> > Patchset applies over mm-unstable after reverting v8
> > (current SHA range: 235b5129cb7b - 9e6b24c58985)
> >
> > Suren Baghdasaryan (17):
> >   mm: introduce vma_start_read_locked{_nested} helpers
> >   mm: move per-vma lock into vm_area_struct
> >   mm: mark vma as detached until it's added into vma tree
> >   mm: introduce vma_iter_store_attached() to use with attached vmas
> >   mm: mark vmas detached upon exit
> >   types: move struct rcuwait into types.h
> >   mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
> >   mm: move mmap_init_lock() out of the header file
> >   mm: uninline the main body of vma_start_write()
> >   refcount: introduce __refcount_{add|inc}_not_zero_limited
> >   mm: replace vm_lock and detached flag with a reference count
> >   mm: move lesser used vma_area_struct members into the last cacheline
> >   mm/debug: print vm_refcnt state when dumping the vma
> >   mm: remove extra vma_numab_state_init() call
> >   mm: prepare lock_vma_under_rcu() for vma reuse possibility
> >   mm: make vma cache SLAB_TYPESAFE_BY_RCU
> >   docs/mm: document latest changes to vm_lock
> >
> >  Documentation/mm/process_addrs.rst |  44 ++++----
> >  include/linux/mm.h                 | 156 ++++++++++++++++++++++-------
> >  include/linux/mm_types.h           |  75 +++++++-------
> >  include/linux/mmap_lock.h          |   6 --
> >  include/linux/rcuwait.h            |  13 +--
> >  include/linux/refcount.h           |  24 ++++-
> >  include/linux/slab.h               |   6 --
> >  include/linux/types.h              |  12 +++
> >  kernel/fork.c                      | 129 +++++++++++-------------
> >  mm/debug.c                         |  12 +++
> >  mm/init-mm.c                       |   1 +
> >  mm/memory.c                        |  97 ++++++++++++++++--
> >  mm/mmap.c                          |   3 +-
> >  mm/userfaultfd.c                   |  32 +++---
> >  mm/vma.c                           |  23 ++---
> >  mm/vma.h                           |  15 ++-
> >  tools/testing/vma/linux/atomic.h   |   5 +
> >  tools/testing/vma/vma_internal.h   |  93 ++++++++---------
> >  18 files changed, 465 insertions(+), 281 deletions(-)
> >
>
