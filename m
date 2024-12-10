Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5629F469D
	for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 17:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850998; cv=none; b=NlImvDbo0bqsL20SKgRekx/AovxRcIJ2QA+FXowobrGfgUDCifrdEyb1DlDSjtomoLkJiFMqUCr4W4SnJRPY8BRVjXUeMWpMfrkp+ZvSzgS3HlUaFvd8e5K0ShwVL80Hi7dDc2dq7xsuHvj0YYZjUrdhT2G7FoM409ZrDQaX9Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850998; c=relaxed/simple;
	bh=4WfZf/VyEMdGyzTnRIwjU/zlxOBfiYZBI1KPIS2oQj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YyRljghy2Mxk9oi5cQ8jpXZKjfXkDBBQNhZpLSMj1m9VnVMXSIEehKR3Gn9ibaU0baSzrPe6bRmuLCv1b3OjRB8KPgKbya8omNGhVlrsbGcEFabjkJKMNIig7QhFf5WBw8D72JKzVu8VzSJgI2juVwFywK3jF/WfwADSqvxXFyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ksI05Hv2; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ksI05Hv2"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4675936f333so185381cf.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 09:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733850995; x=1734455795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaOi4QsOb+J5LPb4Q/0lyWfsbMFf1E6fSqgF/905dAo=;
        b=ksI05Hv28ZOzBTSdXqacapIDt7reiI83vWJO/Tf0p21vKBRyDyw0obmc+P0eJAepQn
         38mMqKO2eODZNSeVRpFuLOJNI8mji8hx+e+W8+ms3Us51QTc8jtRdbpeMzK9jKLeEJf5
         bvW4lueFtDQnFvUwOEU8Tx5PWADFGoJs/zzsnCrpct5KsfcLyxJZzqs+SZTyscBcGXZ+
         uGa3gqOE5oRPe+EeargYIpKQawQ1cF+dvSxSWg901j3qxWSFCqaUTIYhYVR0LAfb50P+
         nmgRbcGGx49fybINvU1XXMwmrxPB/86sz6sg0GY7QVwjUjgVTGgd0CSbNs4wmnX6qilY
         gaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850995; x=1734455795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaOi4QsOb+J5LPb4Q/0lyWfsbMFf1E6fSqgF/905dAo=;
        b=iWGKqoTukVAMOFx59Dcxxb6RaOqCZUfYJWnFmiOVtyz9pbw2sEnbXlUV+EesqbuaDy
         nxhGAXEIUi8TRts2qu+friJPU1xpwn9dslIaeVGuAmBWw6o7vDb1YhfaMlbDeg5A0nXF
         0d2P6kUAqZfzZLkPNOcUj8KXDrrEvOMCQaTID5A8Eo8EhfTG6dRxNwaou6mBLRnlVXaL
         ZnmfOEJRqSbtezy1iBmI6b8Es8WnN8OUvNh8kaxjYhFHwBRcVkO8pYQFYfSFERJRquLi
         f7HPs/q7LvBPKMPfDzrlYlyi3j1d3mesoZDsU1NqvFjVnqZ/DrhRop+IW0sbP4uL0ISE
         MZVA==
X-Forwarded-Encrypted: i=1; AJvYcCXIGPI+Xaizzt8tdW90Q/bcsO1PupoWImTRLdjLVA8CjespVFLU9VzvNWsxPqh1YAWfSoBYktkk8Fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwObuYIRuE0n2a8l2EXB8FTJsshJPn9yE4g5+cPhix5w7fe3aNu
	S4UyvX7SbLU4Ayd3v5jIH6g72G/qH3+fd69CXNXaDlcPHxyPcYnNMq7zphpWqLF/kQ8Y0sSDk1x
	kFgVMAG7pyr472Ide4Sdn2xpSnJROOklcAf2h
X-Gm-Gg: ASbGncvAUjpHQDjDhHp37wHfdrwGnoQLZYbCwsZy9SqBWh8fmNinsm4HuKGMjtaaqNz
	V+8mx+ATd/bzrAw0rSx9a1oDasg0+D3gJnN1jUqUwUeAl4nABTgzNlR0Gm6L1wp1MJw==
X-Google-Smtp-Source: AGHT+IEeFcyZ6T1bdtWsKVYAtVQ8wAtPBjDv42QIMAppf4WlYawq+dIfGHO6dImIpr4LCNCMkgNp3LMCeVKsCbb+cx0=
X-Received: by 2002:a05:622a:4c18:b0:466:97d6:b245 with SMTP id
 d75a77b69052e-46776274fdamr4970131cf.22.1733850994869; Tue, 10 Dec 2024
 09:16:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206225204.4008261-1-surenb@google.com> <20241206225204.4008261-5-surenb@google.com>
 <6b29b2a5-c244-4930-a5a0-1a24a04e7e35@suse.cz> <CAJuCfpFxAZ-JwN8VqNF14zeBnsPM_pD0+-N2PDq5GcQGR1xqLQ@mail.gmail.com>
 <643beb6c-4226-46ca-b7e9-292467479aea@suse.cz>
In-Reply-To: <643beb6c-4226-46ca-b7e9-292467479aea@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 10 Dec 2024 09:16:23 -0800
Message-ID: <CAJuCfpHR3LXfAZA_oh_2KBtFe6JQPU5T3nYMZd_ooAjRJd8xUQ@mail.gmail.com>
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

On Tue, Dec 10, 2024 at 8:32=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 12/10/24 17:20, Suren Baghdasaryan wrote:
> > On Tue, Dec 10, 2024 at 6:21=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz=
> wrote:
> >>
> >> On 12/6/24 23:52, Suren Baghdasaryan wrote:
> >> > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> >> > object reuse before RCU grace period is over will be detected inside
> >> > lock_vma_under_rcu().
> >> > lock_vma_under_rcu() enters RCU read section, finds the vma at the
> >> > given address, locks the vma and checks if it got detached or remapp=
ed
> >> > to cover a different address range. These last checks are there
> >> > to ensure that the vma was not modified after we found it but before
> >> > locking it.
> >> > vma reuse introduces several new possibilities:
> >> > 1. vma can be reused after it was found but before it is locked;
> >> > 2. vma can be reused and reinitialized (including changing its vm_mm=
)
> >> > while being locked in vma_start_read();
> >> > 3. vma can be reused and reinitialized after it was found but before
> >> > it is locked, then attached at a new address or to a new mm while
> >> > read-locked;
> >> > For case #1 current checks will help detecting cases when:
> >> > - vma was reused but not yet added into the tree (detached check)
> >> > - vma was reused at a different address range (address check);
> >> > We are missing the check for vm_mm to ensure the reused vma was not
> >> > attached to a different mm. This patch adds the missing check.
> >> > For case #2, we pass mm to vma_start_read() to prevent access to
> >> > unstable vma->vm_mm. This might lead to vma_start_read() returning
> >> > a false locked result but that's not critical if it's rare because
> >> > it will only lead to a retry under mmap_lock.
> >> > For case #3, we ensure the order in which vma->detached flag and
> >> > vm_start/vm_end/vm_mm are set and checked. vma gets attached after
> >> > vm_start/vm_end/vm_mm were set and lock_vma_under_rcu() should check
> >> > vma->detached before checking vm_start/vm_end/vm_mm. This is require=
d
> >> > because attaching vma happens without vma write-lock, as opposed to
> >> > vma detaching, which requires vma write-lock. This patch adds memory
> >> > barriers inside is_vma_detached() and vma_mark_attached() needed to
> >> > order reads and writes to vma->detached vs vm_start/vm_end/vm_mm.
> >> > After these provisions, SLAB_TYPESAFE_BY_RCU is added to vm_area_cac=
hep.
> >> > This will facilitate vm_area_struct reuse and will minimize the numb=
er
> >> > of call_rcu() calls.
> >> >
> >> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >>
> >> I'm wondering about the vma freeing path. Consider vma_complete():
> >>
> >> vma_mark_detached(vp->remove);
> >>   vma->detached =3D true; - plain write
> >> vm_area_free(vp->remove);
> >>   vma->vm_lock_seq =3D UINT_MAX; - plain write
> >>   kmem_cache_free(vm_area_cachep)
> >> ...
> >> potential reallocation
> >>
> >> against:
> >>
> >> lock_vma_under_rcu()
> >> - mas_walk finds a stale vma due to race
> >> vma_start_read()
> >>   if (READ_ONCE(vma->vm_lock_seq) =3D=3D READ_ONCE(mm->mm_lock_seq.seq=
uence))
> >>   - can be false, the vma was not being locked on the freeing side?
> >>   down_read_trylock(&vma->vm_lock.lock) - suceeds, wasn't locked
> >>     this is acquire, but was there any release?
> >
> > Yes, there was a release. I think what you missed is that
> > vma_mark_detached() that is called from vma_complete() requires VMA to
> > be write-locked (see vma_assert_write_locked() in
> > vma_mark_detached()). The rule is that a VMA can be attached without
> > write-locking but only a write-locked VMA can be detached. So, after
>
> OK but write unlocking means the mm's seqcount is bumped and becomes
> non-equal with vma's vma->vm_lock_seq, right?
>
> Yet in the example above we happily set it to UINT_MAX and thus effective=
ly
> false unlock it for vma_start_read()?
>
> And this is all done before the vma_complete() side would actually reach
> mmap_write_unlock(), AFAICS.

Ah, you are right. With the possibility of reuse, even a freed VMA
should be kept write-locked until it is unlocked by
mmap_write_unlock(). I think the fix for this is simply to not reset
vma->vm_lock_seq inside vm_area_free(). I'll also need to add a
comment for vm_lock_seq explaining these requirements.
Do you agree that such a change would resolve the issue?

>
> > vma_mark_detached() and before down_read_trylock(&vma->vm_lock.lock)
> > in vma_start_read() the VMA write-lock should have been released by
> > mmap_write_unlock() and therefore vma->detached=3Dfalse should be
> > visible to the reader when it executed lock_vma_under_rcu().
> >
> >>   is_vma_detached() - false negative as the write above didn't propaga=
te
> >>     here yet; a read barrier but where is the write barrier?
> >>   checks for vma->vm_mm, vm_start, vm_end - nobody reset them yet so f=
alse
> >>     positive, or they got reset on reallocation but writes didn't prop=
agate
> >>
> >> Am I missing something that would prevent lock_vma_under_rcu() falsely
> >> succeeding here?
> >>
>
