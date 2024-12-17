Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17DA1F76C0
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734451110; cv=none; b=UWAv7LYFrRgVKsD35EmUxjVxfKsJx+Y/Fb+8F/NK1QjTSGAyeWQnGWBJA4RSSaOzY4TqPPWSa07pLJ5l1mzSi0apUZMtaw+mEYbIJaHcnn4xRM6/sF0AZEOBRZREJMYxZLa1d0lGpP3ObDab8BeK24qWr4UJ6rlyz+WnEIEvkZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734451110; c=relaxed/simple;
	bh=dBH/+O7g6d06xn0ec8a6KSHrWYZBqAa/QIx306iaTM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sr2IpwWE2GsbFY1tcGU4SZ/uuhz3m/zSu8nMYb4YUQzHAqPNi2CHYSN4KeYv+tc2IgMF70s9pm3JdObshMF4eC2tFghq1Z02U6Ms1XtJOcSwf5NEuS7Ygu1r+e+nDD5MndUlgKfhSbMAJGhuYnfxd6HPeK61eDfoMVDovJvgqYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o9NeR9jW; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o9NeR9jW"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467896541e1so292041cf.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 07:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734451106; x=1735055906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbVYvO44lAz7K8MjpLCIdcOgRywKqjJNL2ZPeifyjMs=;
        b=o9NeR9jWFbLpCNIoxkmiukPogdEZ2XuIfq+j/46xSFQia9H6DHMYjpW1GOsYdbsfzr
         1J7sKw/4i/gpfQImHUI3aSHZpBLXdFvmF37MddMAOCza/xITnQwL3ZC/HZN1p3FJMTqs
         OemGFd91XfpAekxBDQlxUDGmZC8UU9pHAmf1qsteVQ8AyqOTJy8e61L3QfxRq0DyVvVt
         ZE5ECIKZSmPnFNOhM74LxvDXciIwxuWNQXMFJt2+Nn0XHi6DgItnxzAxDk7XL9WvluQK
         IIs8z78+KmKRCLrKMO8DlHH+SSMIm2Te723syXP2Om9ayp3DuqSCIPGCcw+vlWq6nl8j
         fTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734451106; x=1735055906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbVYvO44lAz7K8MjpLCIdcOgRywKqjJNL2ZPeifyjMs=;
        b=vgmJUxEy5JTkHPtWEi8ddU4QtZuSjQ+66OqkR+cse+29Gj4V8M3RkgSEwhKNXq9crE
         0X2UL+qzQzBLe+1Uq8y91ehy/EGmXlH7kxGg9MX7Vheoex5YpvOKtVfl4M6GrX6AN2UB
         YvAv8TCFp9Zb0NGBM7QQcqqQ9Ape6/ghpv1lV35/YMXMDpvX+qMbtNC0fCBWX2wzR+VM
         8qGv5ft33njlC4zehdVSqWKBhq2UCDCc56kIOkI/AbdKaIBpvMY9A0uFCGXhqkDqDV6Q
         gQB2LMLSx+sXRNNek1XC7o16kYvycabeDVS3fJqcD5xcurFi4tsqzLcAzygjZRN79ZgC
         2vnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwNU6Sto/RsMDwwZBTDLa6x7e9B3Lrnm+C1DP+Cg7aYJ3acfovHsYCxC83IWAYnNIapjHSbbeLgLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBRg6HLNQYy6adF3Rw1+qJ5soyGVnAjU/yApCUpeVigX0Af+F6
	LIgvXM4Zzno1sEIShNEBMuGwoNUHbBouj1sLhFFTRj6bCyhLu/88AGupk9YfLC48+xU8gRoP19p
	YYb+XRnRzxWa8HIHIc2OuMyw/aaxvGLVFu10m
X-Gm-Gg: ASbGncsM5kNdLDyXaZpFXHvvL3Ze1BwEHRGlG37ckVAYT3wQhf8yTrOYwzHdPZAIFWm
	G8osiGpKAckBrdoQN2M4zu2XAYGV1rNPanHXql5YsFNmQQG/419YZiGPiTFFUtMHSKqU1
X-Google-Smtp-Source: AGHT+IFoNxbLSivCB8O+mxImiir970GdW7OaKshYzGwkWOn3yHVrguyW7CMWfUXbyO03XcT7Rr+UjXFED1Gcx3L2cUs=
X-Received: by 2002:a05:622a:1115:b0:468:f7e0:ad40 with SMTP id
 d75a77b69052e-468f971ac80mr4409181cf.14.1734451106340; Tue, 17 Dec 2024
 07:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com> <20241216192419.2970941-14-surenb@google.com>
 <20241217102620.GC11133@noisy.programming.kicks-ass.net>
In-Reply-To: <20241217102620.GC11133@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Dec 2024 07:58:15 -0800
Message-ID: <CAJuCfpHMouycE-G7vtph5nu_E92VTMvUdKuoteiqf7Gz0GR0nA@mail.gmail.com>
Subject: Re: [PATCH v6 13/16] mm: introduce vma_ensure_detached()
To: Peter Zijlstra <peterz@infradead.org>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 2:26=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Dec 16, 2024 at 11:24:16AM -0800, Suren Baghdasaryan wrote:
> > vma_start_read() can temporarily raise vm_refcnt of a write-locked and
> > detached vma:
> >
> > // vm_refcnt=3D=3D1 (attached)
> > vma_start_write()
> >     vma->vm_lock_seq =3D mm->mm_lock_seq
> >
> >                     vma_start_read()
> >                        vm_refcnt++; // vm_refcnt=3D=3D2
> >
> > vma_mark_detached()
> >     vm_refcnt--; // vm_refcnt=3D=3D1
> >
> > // vma is detached but vm_refcnt!=3D0 temporarily
> >
> >                        if (vma->vm_lock_seq =3D=3D mm->mm_lock_seq)
> >                            vma_refcount_put()
> >                                vm_refcnt--; // vm_refcnt=3D=3D0
> >
> > This is currently not a problem when freeing the vma because RCU grace
> > period should pass before kmem_cache_free(vma) gets called and by that
> > time vma_start_read() should be done and vm_refcnt is 0. However once
> > we introduce possibility of vma reuse before RCU grace period is over,
> > this will become a problem (reused vma might be in non-detached state).
> > Introduce vma_ensure_detached() for the writer to wait for readers unti=
l
> > they exit vma_start_read().
>
> So aside from the lockdep problem (which I think is fixable), the normal
> way to fix the above is to make dec_and_test() do the kmem_cache_free().
>
> Then the last user does the free and everything just works.

I see your point. Let me reply in the other patch where you have more
comments about this.
