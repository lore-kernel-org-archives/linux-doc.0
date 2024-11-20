Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CBC13BAF1
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 23:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732146284; cv=none; b=TrrhaQgrVZiya0lGZ8FR5nQTL5zqbO8MIWwMq9ChUt41uusAA0uO0/+8VdTL+885hVWVyN+89QoFrcT9PDOkHvp5AEokzdQt8KbSJe23E14tWSby+mmog1btG/EFvVol2Edg11ukcrwAi/EIC8wL4AL/71MLXY29Y6B84CxEgTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732146284; c=relaxed/simple;
	bh=VYULMpEDAPylKL42wS5fy2eOiSVaq0rxnmEIT0A+0PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GK1CJgvgKbfxBc8v+mzkDeqRbI3Ug/xnWhzwS/8Nx2dN+8IK6IDIiY43Yx4Lft9ssnwYqVhMXXDQZWisCcMqF6uluz/BqUnTiT24UDlGY4RZWOd7yd/O09K2xe/dQuPFpjFf8BqBowu7FJ1QjcrNMyI+YZgTy9Ntpv0pqjJzhKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PocFkz5+; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PocFkz5+"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4608dddaa35so148201cf.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 15:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732146281; x=1732751081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxlIf7epPu0Gfnfexi0C2Kwjnv8g1AAJhtWmrHEoFGU=;
        b=PocFkz5+DbtHtQhl6X7LgWuMfTW4YsjG4dRxHPmUv8ViG3okYtdZB9R7/WiPaxchna
         Uuvzdv5el4KfFbf7CU87+LsuKfH5FifpyrNKdS9jP2VfkEN0faJ0nlr4u+MUHgXDzE30
         fQH664GKRmjTIMIRQVE6HOqTniT+uVY4uwaXhvaW9X1B3twd28PlUPGVvqBGTPs19F7K
         v/Dxad+C1H7ZGY9dei7AMNfXbON1/GOspskgVHhQwV7VFvsoTQ4cgj2qVRgM2Qyp+wk1
         PjDBGaw1ntFUdlBM5gw+MRIW3muN+tnFs5Jk/1X8THhp+fKSO1WtRERa32lk94KkvCLJ
         CBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732146281; x=1732751081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxlIf7epPu0Gfnfexi0C2Kwjnv8g1AAJhtWmrHEoFGU=;
        b=p7PAHJ0emECgwW/+QLHfi+IT4I4OdXDlLrrnRff+bRDkTshsebpIjDQhyXhJD9sDvl
         k4VuKG+Jz79Ax03WJdRDH8xBvw1D3Swvh8xhj9QQJF2x9luAakaQ2JbN8E7iCq8CMCW0
         q6LkyOHZeHwKApx589rBwcepPt7/tfdxawqIqcS9XNYSbmtPWcRUvx7Uv6K1PCtsN4tu
         2h64/qHVJR2yjUJKPkncrdpLBAOalH+isp3vUBdVEsH5vdX7V1dc+DxGxBsq+FDfh61d
         GImokKYFkmorPorXlxHnFfVXmFBFOkz+L75qP8tDtEpJqr5feavTBqF82+LOqqZGlTG/
         Biyg==
X-Forwarded-Encrypted: i=1; AJvYcCWB1sqiVtvWd5AHnd1c2QnOcl5kfQ5RXVZVXEHOFPtPjjhZAnBH0VBCU+Z+UEpG5cc/ihZY+5M2FYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Bcso6eZGsxCVGjKkvx6ky34a+cg8R84eGQU9aoqLNcU2TVBr
	UsxlqngR7+M69SZERNXV/fgdZNs542nQPi26+gK+8nejS4aTMORiGD5MPTW1eSljuVqv6GbfG9Q
	SoGCKrFIwDYeZphwoT5DGWqLty+Ea5LZ9geEm
X-Gm-Gg: ASbGncutih5JQahxtwNlmBQ9PMVBhR9Ie8/aF5h2U69Hi5Qowx3V/+P6qyIXj3euO0z
	T5Y86nsIK3HvzVX6T9jtrG6Q0JzNaiQg=
X-Google-Smtp-Source: AGHT+IEe3+sA9ZC//JKUWhAcs4Y8+fxRca4+aY14pz1BRAB49A2SGTYA3dnT6lGqw0fmkJDYqZoIMrZMcDmmK2UU1uA=
X-Received: by 2002:ac8:7d0c:0:b0:460:f093:f259 with SMTP id
 d75a77b69052e-465300c93f2mr1217201cf.22.1732146281054; Wed, 20 Nov 2024
 15:44:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120000826.335387-1-surenb@google.com> <20241120000826.335387-3-surenb@google.com>
 <zfd7xdkr5dkvvx3caqao3oorh2pxxifhdhwsw2iyxcuzbevo3n@sobu7xhw24vv>
In-Reply-To: <zfd7xdkr5dkvvx3caqao3oorh2pxxifhdhwsw2iyxcuzbevo3n@sobu7xhw24vv>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 20 Nov 2024 15:44:29 -0800
Message-ID: <CAJuCfpFAh-gw_BVCaEB4+saedVC6aPB7HfyPikvTujyGRLXPwQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] mm: move per-vma lock into vm_area_struct
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, minchan@google.com, 
	jannh@google.com, souravpanda@google.com, pasha.tatashin@soleen.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 3:33=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> On Tue, Nov 19, 2024 at 04:08:23PM -0800, Suren Baghdasaryan wrote:
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
> > Move vm_lock back into vm_area_struct, aligning it at the cacheline
> > boundary and changing the cache to be cacheline-aligned as well.
> > With kernel compiled using defconfig, this causes VMA memory consumptio=
n
> > to grow from 160 (vm_area_struct) + 40 (vm_lock) bytes to 256 bytes:
> >
> >     slabinfo before:
> >      <name>           ... <objsize> <objperslab> <pagesperslab> : ...
> >      vma_lock         ...     40  102    1 : ...
> >      vm_area_struct   ...    160   51    2 : ...
> >
> >     slabinfo after moving vm_lock:
> >      <name>           ... <objsize> <objperslab> <pagesperslab> : ...
> >      vm_area_struct   ...    256   32    2 : ...
> >
> > Aggregate VMA memory consumption per 1000 VMAs grows from 50 to 64 page=
s,
> > which is 5.5MB per 100000 VMAs. Note that the size of this structure is
> > dependent on the kernel configuration and typically the original size i=
s
> > higher than 160 bytes. Therefore these calculations are close to the
> > worst case scenario. A more realistic vm_area_struct usage before this
> > change is:
> >
> >      <name>           ... <objsize> <objperslab> <pagesperslab> : ...
> >      vma_lock         ...     40  102    1 : ...
> >      vm_area_struct   ...    176   46    2 : ...
> >
> > Aggregate VMA memory consumption per 1000 VMAs grows from 54 to 64 page=
s,
> > which is 3.9MB per 100000 VMAs.
> > This memory consumption growth can be addressed later by optimizing the
> > vm_lock.
> >
> > [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google=
.com/
> > [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
> > [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT=
_kbfP_pR+-2g@mail.gmail.com/
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>

Thanks!

>
>
> One question below.
>
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -716,8 +716,6 @@ struct vm_area_struct {
> >        * slowpath.
> >        */
> >       unsigned int vm_lock_seq;
> > -     /* Unstable RCU readers are allowed to read this. */
> > -     struct vma_lock *vm_lock;
> >  #endif
> >
> >       /*
> > @@ -770,6 +768,10 @@ struct vm_area_struct {
> >       struct vma_numab_state *numab_state;    /* NUMA Balancing state *=
/
> >  #endif
> >       struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +     /* Unstable RCU readers are allowed to read this. */
> > +     struct vma_lock vm_lock ____cacheline_aligned_in_smp;
> > +#endif
> >  } __randomize_layout;
>
> Do we just want 'struct vm_area_struct' to be cacheline aligned or do we
> want 'struct vma_lock vm_lock' to be on a separate cacheline as well?

We want both to minimize cacheline sharing.

>
