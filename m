Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319052451E1
	for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 23:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733871704; cv=none; b=XyqNiv61CwwFeSR1YV/vEBAi2BTWv97Lu2U0UKtRcHf14o5WFZkgFZly5D5Q81kMujNEh8vpsCmmPT43xqT165yPWcdM1aSPZx0vkVTtQTNZ/xhZEqZ9CQdxFo/xH7rtzcRoCKbtgPb4yv6cHkj3DuS2hZo5yH3olNt33laTLWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733871704; c=relaxed/simple;
	bh=aaGwjJkuwbXt3NPDu+zczlCpQXArNSQyZqB6vDu+eh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PbxxuD4Qkvto/cDekX2jTfKWEaSYTLnyBupuXEBPkRMvILtbihBDZPzJt3sE8gnB2PHhadDvGOs/6fSORyG0E1KNF3JuV1+FXZwsX/txOiTqZfwaee+tlaHJkMBEKk9WGwzCoWPn18z+h0xNzHuCARmQSnHCUBa3qIYvqb2ln20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MJeCeWti; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MJeCeWti"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4674a47b7e4so21651cf.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 15:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733871701; x=1734476501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXrLKzAtEzguQg29Xv5m2Hq5BKyNsbhYO4T4SHrddF0=;
        b=MJeCeWtifZj5UyHggwavecaP0/MPxTtzMZZLFubse5BB4KAbxvwbeS65r3erNyl9Mf
         TLmYKA6mBPWtEmzI7KsNFwNbwaxerwRwXZWPReG77SS9V+19c1q77t8pt1q7fXgoiQiL
         esPuM1TFz590UZGas4ibTRecgNoDg34WIVmS4DkQYXLPPabUc+/CUFffET3dx587p91K
         Lmbg6k3X/bBOmVqEZdyY5AS0ayLcHV675/Y07fi+AvnL28FuGlFJ27RiBptwSvsOtlNJ
         DfXQL41vJCQc5Loz06n2581kRJPXHcbqWhnAS+j1jfIIheuHsUbrABXVf+j33Z4beGT8
         9mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733871701; x=1734476501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXrLKzAtEzguQg29Xv5m2Hq5BKyNsbhYO4T4SHrddF0=;
        b=bSmLGLYYULtwD5WQXAKMdymVdhidbwPKYBFqjHvyzTFEX/57RehOvL2cEZN1CKRQVZ
         fGbRu3B6Vnl4mgmvma5ebnHW+7Nx8R5v4eCyv2uAA7EwHG9QDdB+kWf8QOyg+FIsVOSQ
         rcVsiHNH8PK9op/ZUCITfneH8975DlX7FkHfThg5LEEz4L6RF4Ovobk9XsiaJLJzhdoE
         Qe8ZJXKY/sZELjYmFktUxRUlINWXWl8luGbFxKw3R5zbuYM2cqtQX8urLVoZzHKIyWkl
         iE0URyKw5sshmU0/o8kKxCC7ykef97mjC+8RYS8R2ClhAhpItE+FPre/QmXym2wx1B9V
         wW8w==
X-Forwarded-Encrypted: i=1; AJvYcCXT9r4E/4NPF8Qq9ybeRE6Ib934tJuYRiWy3hz3MsxBXSKiU/t8YJgfhN4yhGZ9JYuSqUg3FYkG5I8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxmmBbwACz7RsJlVI6VUa3iiX6iQiuUn77KgMJKyWfSdjH6zki
	MfyprEegZQ71nmO03D5H5NmSM4UQ8P8nucSqhPhfy5tfofd0QDja7wB/1HwHSObhZNQ/BQLj8ha
	Pg7dh76bGkkAHRcU4n7q+GYnoGgcbPXbgWK1v
X-Gm-Gg: ASbGncuGR8TB0WB/u03nV4OFG0yO+CBaDAs8oqe46F18rIJZZIcebTV5CHf1DtFHOum
	Wc4qH4AT6iRXKJl+pXD/ff+wQTuJwcBA4JUMTGV6XX7htnmZAw6Xw6DYcq0H/DBCOTA==
X-Google-Smtp-Source: AGHT+IEaOVcYVTFoRGC9lcxEWssBE/oldxlRq76a77YBd+EOx+vzOWIhvfVnCcEbcTRmPkFfL/V0tbsnNF7aSeNhaSo=
X-Received: by 2002:a05:622a:5c91:b0:466:9b73:8e3c with SMTP id
 d75a77b69052e-46789f89f37mr522021cf.13.1733871700732; Tue, 10 Dec 2024
 15:01:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206225204.4008261-1-surenb@google.com> <20241206225204.4008261-5-surenb@google.com>
 <6b29b2a5-c244-4930-a5a0-1a24a04e7e35@suse.cz> <CAJuCfpFxAZ-JwN8VqNF14zeBnsPM_pD0+-N2PDq5GcQGR1xqLQ@mail.gmail.com>
 <643beb6c-4226-46ca-b7e9-292467479aea@suse.cz> <CAJuCfpHR3LXfAZA_oh_2KBtFe6JQPU5T3nYMZd_ooAjRJd8xUQ@mail.gmail.com>
 <5036d089-0774-4863-88c5-eaaea1265ac7@suse.cz>
In-Reply-To: <5036d089-0774-4863-88c5-eaaea1265ac7@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 10 Dec 2024 15:01:29 -0800
Message-ID: <CAJuCfpGrnSTU5ZH0Vt_AXyyFX5vAyknqcOtRsfnh4dbpOeyy-A@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, hannes@cmpxchg.org, 
	mjguzik@gmail.com, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 9:25=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 12/10/24 18:16, Suren Baghdasaryan wrote:
> > On Tue, Dec 10, 2024 at 8:32=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz=
> wrote:
> >>
> >> On 12/10/24 17:20, Suren Baghdasaryan wrote:
> >> > On Tue, Dec 10, 2024 at 6:21=E2=80=AFAM Vlastimil Babka <vbabka@suse=
.cz> wrote:
> >> >>
> >> >> On 12/6/24 23:52, Suren Baghdasaryan wrote:
> >> >> > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure th=
at
> >> >> > object reuse before RCU grace period is over will be detected ins=
ide
> >> >> > lock_vma_under_rcu().
> >> >> > lock_vma_under_rcu() enters RCU read section, finds the vma at th=
e
> >> >> > given address, locks the vma and checks if it got detached or rem=
apped
> >> >> > to cover a different address range. These last checks are there
> >> >> > to ensure that the vma was not modified after we found it but bef=
ore
> >> >> > locking it.
> >> >> > vma reuse introduces several new possibilities:
> >> >> > 1. vma can be reused after it was found but before it is locked;
> >> >> > 2. vma can be reused and reinitialized (including changing its vm=
_mm)
> >> >> > while being locked in vma_start_read();
> >> >> > 3. vma can be reused and reinitialized after it was found but bef=
ore
> >> >> > it is locked, then attached at a new address or to a new mm while
> >> >> > read-locked;
> >> >> > For case #1 current checks will help detecting cases when:
> >> >> > - vma was reused but not yet added into the tree (detached check)
> >> >> > - vma was reused at a different address range (address check);
> >> >> > We are missing the check for vm_mm to ensure the reused vma was n=
ot
> >> >> > attached to a different mm. This patch adds the missing check.
> >> >> > For case #2, we pass mm to vma_start_read() to prevent access to
> >> >> > unstable vma->vm_mm. This might lead to vma_start_read() returnin=
g
> >> >> > a false locked result but that's not critical if it's rare becaus=
e
> >> >> > it will only lead to a retry under mmap_lock.
> >> >> > For case #3, we ensure the order in which vma->detached flag and
> >> >> > vm_start/vm_end/vm_mm are set and checked. vma gets attached afte=
r
> >> >> > vm_start/vm_end/vm_mm were set and lock_vma_under_rcu() should ch=
eck
> >> >> > vma->detached before checking vm_start/vm_end/vm_mm. This is requ=
ired
> >> >> > because attaching vma happens without vma write-lock, as opposed =
to
> >> >> > vma detaching, which requires vma write-lock. This patch adds mem=
ory
> >> >> > barriers inside is_vma_detached() and vma_mark_attached() needed =
to
> >> >> > order reads and writes to vma->detached vs vm_start/vm_end/vm_mm.
> >> >> > After these provisions, SLAB_TYPESAFE_BY_RCU is added to vm_area_=
cachep.
> >> >> > This will facilitate vm_area_struct reuse and will minimize the n=
umber
> >> >> > of call_rcu() calls.
> >> >> >
> >> >> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >> >>
> >> >> I'm wondering about the vma freeing path. Consider vma_complete():
> >> >>
> >> >> vma_mark_detached(vp->remove);
> >> >>   vma->detached =3D true; - plain write
> >> >> vm_area_free(vp->remove);
> >> >>   vma->vm_lock_seq =3D UINT_MAX; - plain write
> >> >>   kmem_cache_free(vm_area_cachep)
> >> >> ...
> >> >> potential reallocation
> >> >>
> >> >> against:
> >> >>
> >> >> lock_vma_under_rcu()
> >> >> - mas_walk finds a stale vma due to race
> >> >> vma_start_read()
> >> >>   if (READ_ONCE(vma->vm_lock_seq) =3D=3D READ_ONCE(mm->mm_lock_seq.=
sequence))
> >> >>   - can be false, the vma was not being locked on the freeing side?
> >> >>   down_read_trylock(&vma->vm_lock.lock) - suceeds, wasn't locked
> >> >>     this is acquire, but was there any release?
> >> >
> >> > Yes, there was a release. I think what you missed is that
> >> > vma_mark_detached() that is called from vma_complete() requires VMA =
to
> >> > be write-locked (see vma_assert_write_locked() in
> >> > vma_mark_detached()). The rule is that a VMA can be attached without
> >> > write-locking but only a write-locked VMA can be detached. So, after
> >>
> >> OK but write unlocking means the mm's seqcount is bumped and becomes
> >> non-equal with vma's vma->vm_lock_seq, right?
> >>
> >> Yet in the example above we happily set it to UINT_MAX and thus effect=
ively
> >> false unlock it for vma_start_read()?
> >>
> >> And this is all done before the vma_complete() side would actually rea=
ch
> >> mmap_write_unlock(), AFAICS.
> >
> > Ah, you are right. With the possibility of reuse, even a freed VMA
> > should be kept write-locked until it is unlocked by
> > mmap_write_unlock(). I think the fix for this is simply to not reset
> > vma->vm_lock_seq inside vm_area_free(). I'll also need to add a
>
> But even if we don't reset vm_lock_seq to UINT_MAX, then whover reallocat=
ed
> it can proceed and end up doing a vma_start_write() and rewrite it there
> anyway, no?

Actually, I think with a small change we can simplify these locking rules:

static inline void vma_start_write(struct vm_area_struct *vma)
{
        int mm_lock_seq;

-        if (__is_vma_write_locked(vma, &mm_lock_seq))
-                return;
+        mmap_assert_write_locked(vma->vm_mm);
+        mm_lock_seq =3D vma->vm_mm->mm_lock_seq;

        down_write(&vma->vm_lock->lock);
        /*
        * We should use WRITE_ONCE() here because we can have concurrent re=
ads
        * from the early lockless pessimistic check in vma_start_read().
        * We don't really care about the correctness of that early check, b=
ut
        * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happ=
y.
        */
        WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
        up_write(&vma->vm_lock->lock);
}

This will force vma_start_write() to always write-lock vma->vm_lock
before changing vma->vm_lock_seq. Since vma->vm_lock survives reuse,
the other readers/writers will synchronize on it even if vma got
reused.

>
> > comment for vm_lock_seq explaining these requirements.
> > Do you agree that such a change would resolve the issue?
> >
> >>
> >> > vma_mark_detached() and before down_read_trylock(&vma->vm_lock.lock)
> >> > in vma_start_read() the VMA write-lock should have been released by
> >> > mmap_write_unlock() and therefore vma->detached=3Dfalse should be
> >> > visible to the reader when it executed lock_vma_under_rcu().
> >> >
> >> >>   is_vma_detached() - false negative as the write above didn't prop=
agate
> >> >>     here yet; a read barrier but where is the write barrier?
> >> >>   checks for vma->vm_mm, vm_start, vm_end - nobody reset them yet s=
o false
> >> >>     positive, or they got reset on reallocation but writes didn't p=
ropagate
> >> >>
> >> >> Am I missing something that would prevent lock_vma_under_rcu() fals=
ely
> >> >> succeeding here?
> >> >>
> >>
>
