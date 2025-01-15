Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5AA22E409;
	Wed, 15 Jan 2025 04:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736913613; cv=none; b=HOYGct/rKzqRcK5KdC9fPFLlQoImYTnFIy2CJAXVnw0Fb84fSlvu1Hhm6xEId2RHJCUACRWccJHnFf8Eu4tev7NZSp4eUxlxZcmKAKJJPy1I9g/Wa55z0EFgGxEDLVfc25viUk9YeFniQ7vS5PfcNZldU+onqiZxtvpJ8Gca+Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736913613; c=relaxed/simple;
	bh=hWT6V5fLYHtBrGHgSWLd07VmHi+bh2gzhXa7FZ2Q2UM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2Q6B6aZl3jLoWRwUrCPECjSHREXFsgffB2eBwhi5jQN4VM3kB7paIffzXQeiT2i+cMxyBEKZ8o+lnd1DSwxgaxpOvQxwVQllvZQpzhXc5cnfJ3UVDtRwNgQz620U5vS2fiDY5dMUkzqopFHM3+rEj3QcyVyLyJo3uiJLMPIkXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAeyRhYC; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAeyRhYC"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso10971970a12.0;
        Tue, 14 Jan 2025 20:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736913609; x=1737518409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kv2u0uJzn/Ts463acJ9jwBqvhz9v41RCMEi3nxpdcxc=;
        b=fAeyRhYCLPEUVeA7iOV1dYNA/Djz/o17oFzRzUk7AJ6onLtgDfJr9irUdMFral7x92
         Nn5vXaxyy3HXLwFDVy9c6EAz6sWrD/VJcoRZL6NUtT23QC+F/SvV1s9P7AEAxStj4FMn
         8gqNCG5KGCQdbGhcWjm4VIanhwtDzBAPuah4BU2qsj9AB25/ASrabQVys0fmzp/yE+2F
         3Vy79LlxkN6z/kS63BRwteVSjlTlNDuPzRAFdQ5zSmwwDqP3JOmVXarewlzBicJ9ends
         QGUWNioZaVYmOr6cAjHujxIivQwHImIBLk+Xhn2Pr+w/pKKvc2x6LtEsB+BxsYMM7VM9
         nI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736913609; x=1737518409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kv2u0uJzn/Ts463acJ9jwBqvhz9v41RCMEi3nxpdcxc=;
        b=qq7G0XJ63otYw0KPgxH7g4JJgqUxdNnAgrRbU+sFkfOnIOGue5xiJI5hIah2mhi0DQ
         Ecgma2kwd0Rr9WWPxCzLr95Xlhtu8mkG+4MeAzkqnWJ0moTD4e9F3G15UoJvx16KtiP8
         vxTKpvr0PSpZ9x0OI13CrqeTp8VL6E9fimraNKLhoCGE/Y8RCuKkfnNxXb9Fg3uVCH9l
         hrjLXNvnVlKRRAmWYBwA3tYDHQ9N0cWCfORijpg6rIioKqNEB02ZHbC9U+kOBHMKGrfh
         o8/Nm02NRZANVB9bNSLeDoM3yixaZDoPkMKdNHwU7DYXbzvn8HX3GXVEmQRqepEN4Xnn
         0G5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5snCfjwqFRuWvTVFPGDCvr8pXsmCAolzB75aEUas6u3Yu12RMXtHdQGB6OTNTLsxl8ta+sT3FMYwzDU0Q@vger.kernel.org, AJvYcCVJEI1RksgCtyA+ZeaT3FNL+fD/w4ExOOLoJcNKZA5Xcym667ksGlcZeN99qa4cqsQcxNali/MTPN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCsJbEkFTAGAc/OMuk39NtVs8ZDtaFKpd1AlDsNqGcP4utnHPW
	UscvTLIel9IBcL6Kq6DgNMiXwOQkMKCple9MrnFOpfCQBT2jA6uNSYFxooDbw4e+YE7e03qsvWx
	mIDgjBMYNHexbPBszqhaMm9RDRl0=
X-Gm-Gg: ASbGncvvP5+aj2XTd4/zsWkHIF4pAdYW8Dxz72V+c6pvcYj2c20arDTy3W/BTtvStam
	w6RRvI/7+MayR0DBMhShuBzX8vztYtvOLCq7h
X-Google-Smtp-Source: AGHT+IEEg1XJyQx+U5nOwfPrBRvC6/6ng8zywQNu0QqYgTdeQe2oZZA1UImZ/MMw4Mn5IeGnj2yd2vaBzhM7BErqxKQ=
X-Received: by 2002:a05:6402:2355:b0:5d9:a55:4307 with SMTP id
 4fb4d7f45d1cf-5d972e4eeabmr25957199a12.22.1736913608740; Tue, 14 Jan 2025
 20:00:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-17-surenb@google.com>
 <20250115022703.hqbqdqawvqgrfgxb@master> <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
In-Reply-To: <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 15 Jan 2025 04:59:56 +0100
X-Gm-Features: AbW1kvadBBfWrXSDBSr3BCQnFpffG_Arl4O4sHftvcF6KJ0SGYlligKzAXYSYLM
Message-ID: <CAGudoHH9-h68S-YV4TObYMRDFe99xAO7Nu3tXF8h_Kds2-MWCw@mail.gmail.com>
Subject: Re: [PATCH v9 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: Suren Baghdasaryan <surenb@google.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org, 
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 4:15=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, Jan 14, 2025 at 6:27=E2=80=AFPM Wei Yang <richard.weiyang@gmail.c=
om> wrote:
> >
> > On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrote:
> >
> > >diff --git a/kernel/fork.c b/kernel/fork.c
> > >index 9d9275783cf8..151b40627c14 100644
> > >--- a/kernel/fork.c
> > >+++ b/kernel/fork.c
> > >@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct mm_st=
ruct *mm)
> > >       return vma;
> > > }
> > >
> > >+static void vm_area_init_from(const struct vm_area_struct *src,
> > >+                            struct vm_area_struct *dest)
> > >+{
[snip]
> > Would this be difficult to maintain? We should make sure not miss or ov=
erwrite
> > anything.
>
> Yeah, it is less maintainable than a simple memcpy() but I did not
> find a better alternative. I added a warning above the struct
> vm_area_struct definition to update this function every time we change
> that structure. Not sure if there is anything else I can do to help
> with this.
>

Bare minimum this could have a BUILD_BUG_ON in below the func for the
known-covered size. But it would have to be conditional on arch and
some macros, somewhat nasty.

KASAN or KMSAN (I don't remember which) can be used to find missing
copies. To that end the target struct could be marked as fully
uninitialized before copy and have a full read performed from it
afterwards -- guaranteed to trip over any field which any field not
explicitly covered (including padding though). I don't know what magic
macros can be used to do in Linux, I am saying the support to get this
result is there. I understand most people don't use this, but this
still should be enough to trip over buggy patches in -next.

Finally, the struct could have macros delimiting copy/non-copy
sections (with macros expanding to field names), for illustrative
purposes:
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 332cee285662..25063a3970c8 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -677,6 +677,7 @@ struct vma_numab_state {
  * getting a stable reference.
  */
 struct vm_area_struct {
+#define vma_start_copy0 vm_rcu
        /* The first cache line has the info for VMA tree walking. */

        union {
@@ -731,6 +732,7 @@ struct vm_area_struct {
        /* Unstable RCU readers are allowed to read this. */
        struct vma_lock *vm_lock;
 #endif
+#define vma_end_copy1 vm_lock

        /*
         * For areas with an address space and backing store,

then you would do everything with a series of calls

however, the __randomize_layout annotation whacks that idea (maybe it
can be retired?)

--=20
Mateusz Guzik <mjguzik gmail.com>
