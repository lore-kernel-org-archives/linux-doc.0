Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C6618CC0B
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 16:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736959155; cv=none; b=OEWaOe+gw8Db+q/oiMLIm6lriBZeCyOEZmz9NMq5ldnuaBGBMn9MY2+AYe5NtvRGOboYWDOVN1l1FpvoDPW0+7n6TQOG4InUdVH7lMY5yWQOqkGEkvn7RakiPTju2qaha9feivjkn4Uo7Ohi60IGcG/c3KsfF/XkgFiz0kgvEYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736959155; c=relaxed/simple;
	bh=ybHwkuf7JbMi+08a9DeGp84JphF3/ltzZJ0kuU2gj0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3I2YiBCadprP95Y+NqKqA7uw6OJF+Bir/DIFLebzKGiFMIn6SpHLHwXf7SdoAcLBGBxEuQT187blv6Wny/FXo4bHYBn3QMua01GwSw5SS8ntewPy4yDbo87Pvlnyczdm6FARvb8ZytbVclnrVhrJYZRkTrlQI0UO8inf/EojyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FRbRn85i; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FRbRn85i"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467abce2ef9so579921cf.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 08:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736959153; x=1737563953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaZL90gx3dqyATOSCUoKbDZ4oWlZcUee4Harbwpymrk=;
        b=FRbRn85iajz4V31XquJdeDL1cjuBKJuD+IZPIDoBl0OlTNlmoOCl2p5i/NoIvpuIrb
         DFrqXmKTvXGBmNWvSt1FF1usCoRJ7JgDw1i8FcqJZFaaef8e6x1mjHcst+mmlJ/8m1vz
         JZN69gq9GRJ39v7/gMsdK0JJVsSmE634YZifUJq++kOBG7Jd+Qn285pvtouaFqAu1f2s
         p8VQgpup//TTb3q4e5hdkZbxm7Odbczkxlrf1zdxuqpI/5IevUiQudpTOepkx6/WLuaG
         BzUH6yU4DN6wKyFEBeB+GJD9/QhsCBFsRZwTU3PIh2KSC9k6mCsbjnBqibbIFjheMqBv
         RCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736959153; x=1737563953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaZL90gx3dqyATOSCUoKbDZ4oWlZcUee4Harbwpymrk=;
        b=auTaAzAF/7rsA2R7gmoJs9JH0k/hixaJvqbxbTnwXvXF/rlWujG0CkfBUUcIJZZHVg
         RoFa9rwYEV57KAeqtWYiCn4mV07+p/m9Yf/C7DncVLWrqY2ZbnM8+F+Fm9tQyO3zHrTp
         ff9iY9U2BllRF4sfP9ZS8duXLbD8iyl2lWa/V30m8OICBIWZX3X3Dtqa5WMVJjeqfEjw
         LTTzbF4hCWMbJfmLOfSkWHXPhxGu9laOMYbmb3N4v32N6AzHvPaR77yw4l1vFBDF9ff0
         5+dsUAvEw9Q6XftpFdL8iP2UB/mzYcoMY0R9sGBLgpr5xB2346erY3V3qqtOyupvcP7A
         RLvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyOTcZDq155yqXSfJ/PmPlgi3pOwnHUNhLPm4K8dHJjvMCV/psiIe0ue0e5Zi/iyN3P4QjML7Cy4E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx93lekoO6uf4JOo1SGJx17ifVx++HGLI6rXdNtTsjLns6FYor
	ZBVSpLkckpQdyszOJ2ACHyHrxLc9V/JEt2Q2EY77sAbFMRYjmZY3tWExLiwiIbU4aDAUYPTCM5r
	uhI73H3a+u2ZHD5bMbDA9y1WyhkF4gBn4WYYz
X-Gm-Gg: ASbGnct4PkHOjPlVxCZKunVfhnWt7/Wty6T/fbGPu+BgJu2TJtxPhfo29aJ+eOgxUGL
	gBuF7EMqTEILmXpVcMdsskugR5tT1K20g1VzjX/BP1eflFk80VIEPqFrGhtt3rDaKiwk=
X-Google-Smtp-Source: AGHT+IGUkYPO5ZjvmWw6xf3ICmiBy/miXu0O3/ygEQr+pM9TgveRmbvWW3Y4m127Mhfar6MytlQPEoyZvu/XoifvPQg=
X-Received: by 2002:ac8:7c46:0:b0:467:462e:a51b with SMTP id
 d75a77b69052e-46df56c14f6mr4399061cf.14.1736959152832; Wed, 15 Jan 2025
 08:39:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-13-surenb@google.com>
 <20250115105056.GY5388@noisy.programming.kicks-ass.net>
In-Reply-To: <20250115105056.GY5388@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 15 Jan 2025 08:39:01 -0800
X-Gm-Features: AbW1kva5KQEaW2j0QeAKNz__H-sbubypX-MpKHIs5psh00jd36ny2QIqDDCj1jY
Message-ID: <CAJuCfpEU-D_G3N1aduOprR0YmV+jP+4un78XMs4Qj41_V+_6Ug@mail.gmail.com>
Subject: Re: [PATCH v9 12/17] mm: move lesser used vma_area_struct members
 into the last cacheline
To: Peter Zijlstra <peterz@infradead.org>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
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

On Wed, Jan 15, 2025 at 2:51=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Jan 10, 2025 at 08:25:59PM -0800, Suren Baghdasaryan wrote:
> > Move several vma_area_struct members which are rarely or never used
> > during page fault handling into the last cacheline to better pack
> > vm_area_struct. As a result vm_area_struct will fit into 3 as opposed
> > to 4 cachelines. New typical vm_area_struct layout:
> >
> > struct vm_area_struct {
> >     union {
> >         struct {
> >             long unsigned int vm_start;              /*     0     8 */
> >             long unsigned int vm_end;                /*     8     8 */
> >         };                                           /*     0    16 */
> >         freeptr_t          vm_freeptr;               /*     0     8 */
> >     };                                               /*     0    16 */
> >     struct mm_struct *         vm_mm;                /*    16     8 */
> >     pgprot_t                   vm_page_prot;         /*    24     8 */
> >     union {
> >         const vm_flags_t   vm_flags;                 /*    32     8 */
> >         vm_flags_t         __vm_flags;               /*    32     8 */
> >     };                                               /*    32     8 */
> >     unsigned int               vm_lock_seq;          /*    40     4 */
>
> Does it not make sense to move this seq field near the refcnt?

In an earlier version, when vm_lock was not a refcount yet, I tried
that and moving vm_lock_seq introduced regression in the pft test. We
have that early vm_lock_seq check in the beginning of vma_start_read()
and if it fails we bail out early without locking. I think that might
be the reason why keeping vm_lock_seq in the first cacheling is
beneficial. But I'll try moving it again now that we have vm_refcnt
instead of the lock and see if pft still shows any regression.

>
> >     /* XXX 4 bytes hole, try to pack */
> >
> >     struct list_head           anon_vma_chain;       /*    48    16 */
> >     /* --- cacheline 1 boundary (64 bytes) --- */
> >     struct anon_vma *          anon_vma;             /*    64     8 */
> >     const struct vm_operations_struct  * vm_ops;     /*    72     8 */
> >     long unsigned int          vm_pgoff;             /*    80     8 */
> >     struct file *              vm_file;              /*    88     8 */
> >     void *                     vm_private_data;      /*    96     8 */
> >     atomic_long_t              swap_readahead_info;  /*   104     8 */
> >     struct mempolicy *         vm_policy;            /*   112     8 */
> >     struct vma_numab_state *   numab_state;          /*   120     8 */
> >     /* --- cacheline 2 boundary (128 bytes) --- */
> >     refcount_t          vm_refcnt (__aligned__(64)); /*   128     4 */
> >
> >     /* XXX 4 bytes hole, try to pack */
> >
> >     struct {
> >         struct rb_node     rb (__aligned__(8));      /*   136    24 */
> >         long unsigned int  rb_subtree_last;          /*   160     8 */
> >     } __attribute__((__aligned__(8))) shared;        /*   136    32 */
> >     struct anon_vma_name *     anon_name;            /*   168     8 */
> >     struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     8 */
> >
> >     /* size: 192, cachelines: 3, members: 18 */
> >     /* sum members: 176, holes: 2, sum holes: 8 */
> >     /* padding: 8 */
> >     /* forced alignments: 2, forced holes: 1, sum forced holes: 4 */
> > } __attribute__((__aligned__(64)));
>
>
