Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5C71DEFDC
	for <linux-doc@vger.kernel.org>; Mon,  6 Jan 2025 17:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736184393; cv=none; b=ZZVz0w890PaDtjv7AqIjjuVtAgiAsL+sX9FtFJJ8V8REAHBNESJlmgUvIXiQNHF7i1hidZzNdjYXZdUPUsJ0yiu+v5EtRRMnDhc/ot3P6y4OInKfq2v4qoylUEVpr5x2wsAJHKRITwOjEgnIuABu2vxnOYSbiqphZox9FmUKVs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736184393; c=relaxed/simple;
	bh=yRwjxIVp6X2QV8L34y72ii3dXUdNCBl8vp4rZXZVvlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yu4JaLCeVajOz5BX1M0v+7Zh4Pr0B6SYY3s3Xw6dTj2IuUZntl3bmIwB9WrG+l0HHGAlE3jLytGaQ8bXMGUDKoBgbzTvRLv90ZHKz3lzXy1kHEYs+3v9fswAGt9hMQzMBYA0D+kEMYJsl0tbYsGKxBI4AMElIFJ3EcSwUQRtz3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CN4TRmmq; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CN4TRmmq"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467896541e1so514071cf.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 09:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736184389; x=1736789189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6rxXklF4dZRAeJ2Ffa+a+2xKsUwbq1AwgjfUqcTc6Y=;
        b=CN4TRmmqhZ2W00NJAoC1sZnWk2Na5NSXNnEmEj+oy5rN09cJ2isTros2ClJJoeqzeu
         oy1FFf+TZcooe8p1iRE3ei/0HfHaU0fg3d/zxJN5i2jhdr5qHWXTXkI9nPd+XooFj/sz
         zWUeOzYflJytBHv9O42k3XhQT96FgMyzVVCUYmtAPIX5Kn99MypUo1G1DFizLCrvBcv6
         3CwpzBJKDn47P/t4vgJ7ybVFKHDY66bO/GK2al05MbbPYDsJikoKZRnEpKuUy+qFlQ8/
         6K9plNgIOvWK6B9sGZUrgSpQtQDfpFt8muNWvcaauLxugUnniqX6hYr5kS1hvjGEZCif
         kgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736184389; x=1736789189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6rxXklF4dZRAeJ2Ffa+a+2xKsUwbq1AwgjfUqcTc6Y=;
        b=XNBMlpO4dOPrJzCePdGWnMmkv2zozgK6NmYFPawKGgc4V4e4Q5Q989i/QwRyS7ck+j
         IJnVEHlq6schsMkArApnoyca52QWPB19hLkBCe2LNfq359OmRJXj7NIJOTPJ1yRwx1GO
         +8/CTNgSPgz/ulAYNZPf+kgWTirUHQ1QfREoMyEUl/HSG2JDL9eqwQg+NFPaotkEY7Gn
         5epdielQDS1Dn3DxXCxFevnhBiyRkvQYYukb6R3K7FlgnMR5rge4NlKWpKmgElVAzL8h
         Q4npMzqye8Iox3bwLonxncPCQHxLDVMXuRJSEdOcSLoDT4GF0I9PpVcXDRm3fQKxIv1K
         IKKg==
X-Forwarded-Encrypted: i=1; AJvYcCWfPP97D9erOi2MP7/kXfkiG3UcBr4hSXIIgBUvm8UIpsMRuK/DosXphPkv1n27CdNyEjZuBzI9m6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/H6+E+3EWnPyEzSVptZph0QxLb+u+khLVk4b3pYOpFt7nJwJT
	UKqYjo5yqnA3Dfbe8iDwSk/WhJLgB9J1a7IMVtUVzbGt1hcAODWEXQFVfBigpoF+oQx+6MeyRkg
	hT0VLmDjF2sWV1XKOZrCM67KS1kPaMpmaG2uA
X-Gm-Gg: ASbGncvBZ2bCMxs0ufdulwBFBeikORhcbKd5QcwDxvbpIizP7fGcNJTyh8vxfUEM4kH
	OJBnS47aUkGzlrMEgDo+Yk+O2arcdVLSxT0glHw==
X-Google-Smtp-Source: AGHT+IFJCjq3wjm9kRCvwm8UoVMoNTKlObb/EWc2On4aKjNnEpuElJqH1BI9wHN48IrRIzMGVNSUTYt+Hm5YgR/7v/8=
X-Received: by 2002:ac8:5a0a:0:b0:467:7ef7:88a3 with SMTP id
 d75a77b69052e-46b1fb09a9dmr7572121cf.16.1736184389095; Mon, 06 Jan 2025
 09:26:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-13-surenb@google.com>
 <20250106003821.3gtfxq33fqj4wm5b@master>
In-Reply-To: <20250106003821.3gtfxq33fqj4wm5b@master>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 6 Jan 2025 09:26:18 -0800
X-Gm-Features: AbW1kvbaXcBoTX_mpSsAlcDCw3o53cgg9-NCBUyOQF6QTVAS9PZy6MM4RcwFoVw
Message-ID: <CAJuCfpE+kzSO4ei3jmKEn_nu=xETBwDu73C=izPJy6y+4wGx7Q@mail.gmail.com>
Subject: Re: [PATCH v7 12/17] mm: replace vm_lock and detached flag with a
 reference count
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 4:38=E2=80=AFPM Wei Yang <richard.weiyang@gmail.com>=
 wrote:
>
> On Thu, Dec 26, 2024 at 09:07:04AM -0800, Suren Baghdasaryan wrote:
> [...]
> > /*
> >  * Try to read-lock a vma. The function is allowed to occasionally yiel=
d false
> >  * locked result to avoid performance overhead, in which case we fall b=
ack to
> >@@ -710,6 +733,8 @@ static inline void vma_lock_init(struct vm_area_stru=
ct *vma)
> >  */
> > static inline bool vma_start_read(struct vm_area_struct *vma)
> > {
> >+      int oldcnt;
> >+
> >       /*
> >        * Check before locking. A race might cause false locked result.
> >        * We can use READ_ONCE() for the mm_lock_seq here, and don't nee=
d
> >@@ -720,13 +745,20 @@ static inline bool vma_start_read(struct vm_area_s=
truct *vma)
> >       if (READ_ONCE(vma->vm_lock_seq) =3D=3D READ_ONCE(vma->vm_mm->mm_l=
ock_seq.sequence))
> >               return false;
> >
> >-      if (unlikely(down_read_trylock(&vma->vm_lock.lock) =3D=3D 0))
> >+
> >+      rwsem_acquire_read(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> >+      /* Limit at VMA_REF_LIMIT to leave one count for a writer */
> >+      if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &o=
ldcnt,
> >+                                                    VMA_REF_LIMIT))) {
> >+              rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> >               return false;
> >+      }
> >+      lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> >
> >       /*
> >-       * Overflow might produce false locked result.
> >+       * Overflow of vm_lock_seq/mm_lock_seq might produce false locked=
 result.
> >        * False unlocked result is impossible because we modify and chec=
k
> >-       * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock=
_seq
> >+       * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lo=
ck_seq
> >        * modification invalidates all existing locks.
> >        *
> >        * We must use ACQUIRE semantics for the mm_lock_seq so that if w=
e are
> >@@ -734,10 +766,12 @@ static inline bool vma_start_read(struct vm_area_s=
truct *vma)
> >        * after it has been unlocked.
> >        * This pairs with RELEASE semantics in vma_end_write_all().
> >        */
> >-      if (unlikely(vma->vm_lock_seq =3D=3D raw_read_seqcount(&vma->vm_m=
m->mm_lock_seq))) {
> >-              up_read(&vma->vm_lock.lock);
> >+      if (unlikely(oldcnt & VMA_LOCK_OFFSET ||
> >+                   vma->vm_lock_seq =3D=3D raw_read_seqcount(&vma->vm_m=
m->mm_lock_seq))) {
>
> I am not sure it worth mention. In case it is too trivial, just ignore.
>
> If (oldcnt & VMA_LOCK_OFFSET), oldcnt + 1 > VMA_REF_LIMIT. This means
> __refcount_inc_not_zero_limited() above would return false.
>
> If my understanding is correct, we don't need to check it here.

Yes, you are correct, (oldcnt & VMA_LOCK_OFFSET) is not really needed
here. I'll send a small fixup removing this check and adding a comment
before __refcount_inc_not_zero_limited() explaining that it will fail
if VMA_LOCK_OFFSET is set.
Thanks,
Suren.

>
> >+              vma_refcount_put(vma);
> >               return false;
> >       }
> >+
> >       return true;
> > }
> >
> [...]
>
> --
> Wei Yang
> Help you, Help me
