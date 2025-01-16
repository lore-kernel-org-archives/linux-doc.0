Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6D22ACFD
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737040347; cv=none; b=hZD/+3EWOQuVQdarsme4cxfG5U+RUGvqRBjuX/50CAUvLgBO72D8vAV1AbRK72dBDEtcNJ34maS3lrLFXB69Pl53bUlD3oCE2wWSZsoQfPyQM4fEpN2tM2F0tEJrODv9LJr4WmX7wLdba9mfYooZJImPaVTNJL7ipvhkqVifUnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737040347; c=relaxed/simple;
	bh=0PUB85XmaxY2RsEE8C1U2ytA/p4QHYotKPSAma4kaKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSJgFD7tI442w1shpwk1ejmnAfb1h7uFMCI53dGl8qPXenTWkygVwhDhBNk4RFO2LjJ/wS2zxd1Na0el1sNFJWfCqT5dFz8ukCMziqg5LxR2nYBDEnJmm3diGkvERnvs7vYWrQt7oIXPS/JHv/uT/umUmt1WzoKdSVqVqRfAUHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x115vgkR; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x115vgkR"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4679b5c66d0so225641cf.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 07:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737040345; x=1737645145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n0nLBWn98kJwyuHw9dnciSZynzrVaqoianwsxEC3Eg=;
        b=x115vgkRPz27jcYckGI8JIcKvM2DZ1l6U+sUlXW/2Oy7OB4JK3uP4H5DUSma+qFPHj
         3ywam5kywphkFk/uhmL3r5QYVcBNQ83u3nY/jBK1OAprdrit1KkPDwbACDwdZAWEoEeX
         fJFm4VG0DXCJZVzLVQ0c+JvDd/IQYVv6cR7ZvMNLiAfwC6NMFir09R8EY1JyjXn+SIPJ
         DKRd3YnX0LL8adVXzip2yL8zIR32jzONKKjzT/VuX7kGHvPEsKwJ94cShrQYTi3lALkZ
         JOFgCpRRuAXbeZmbhHxHpIgwwR1lUtUm8gdvL64pdw/lg7RBxgDzqDpZIUZmXixlo8qo
         gEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737040345; x=1737645145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+n0nLBWn98kJwyuHw9dnciSZynzrVaqoianwsxEC3Eg=;
        b=LRcikFsqT3yMiZfhZOy19ohnrnT2Q5zeVUAbSpez85PBV8Z6AfCgzWva/mWDy8SUWA
         QWnZrCrjnqSYLe2AFT6f38048pCjs+ddWSs19Vs2UvOLEgOgtmvdzTMHAGawS6Roa1lz
         88EM+pHcxuXH7CpI+LrO3wieiZNtnBfCPJVEr6rYgrV8N6jFbKcIFQldBOaw4FoJjJn2
         +YNbXtHU/QXS7Dew3Dr8yEPqmuxTQRf7cg9BzgiEC5qpiKQm/rjuVR43D4pX+Nc/SggM
         rhUYlsK2PMrJIgSxY94mtyfD4q2s/ged6CEzjvuuAV9kl2fBGQEG+XMTHyIZhO/gSLID
         kCkA==
X-Forwarded-Encrypted: i=1; AJvYcCVI+a3QDZjsnci7fUKWrgCZ0GVSMcxk2NY5oLAFRahZ+whhWswU1B1nDoSlzVWkSWrXcxh76z1vWLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvYpmfTusEdyfmBsQs67F1iW+RQuz5VIhslKDsIPKP2fmLOXJR
	O9tOmIg0VHZ2VlBbObinc5sFVoJ4uP/N9FlOW3RgSlmR+qOD1rR/2JJzc4zF9jpWxF0hR/k6iHh
	4hFt1K9ZM/522jjq+mpFhRNtS//ahN0WfpiWI
X-Gm-Gg: ASbGnctQwL6MWqlcrsDG4lt2q2zAEFiHwOMG1wdSWwiaS5NwKORNrp5pROYVitDl22Z
	+pld6uHSe6ct3Pr3TNWEHNV1vpVaN3fy/OFwOQ1idjqRSYWoN1QeFSlXZMElJ9nYgkyc=
X-Google-Smtp-Source: AGHT+IG+O/DVRwFu6EvuSaxS73MdcDHVMcicb46JgTFoFOl8iILCGYiVT+ctNM6O1o9CXO+Stlr+AjBd+/+DGsBuuGY=
X-Received: by 2002:a05:622a:11cc:b0:46c:9f17:12f6 with SMTP id
 d75a77b69052e-46e054f0636mr3327701cf.27.1737040344411; Thu, 16 Jan 2025
 07:12:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250115104841.GX5388@noisy.programming.kicks-ass.net> <20250115111334.GE8385@noisy.programming.kicks-ass.net>
 <20250115160011.GG8385@noisy.programming.kicks-ass.net>
In-Reply-To: <20250115160011.GG8385@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 16 Jan 2025 07:12:13 -0800
X-Gm-Features: AbW1kvaoaeyJPp721yShu4wYM4LOzIoOGeL34SC30h8Ck__Aj0E6qb5Ke2kCGuM
Message-ID: <CAJuCfpG1O73PN-poxrS045LicQzgPTedAjvQUzxmU54jxAX_Pw@mail.gmail.com>
Subject: Re: [PATCH] refcount: Strengthen inc_not_zero()
To: Peter Zijlstra <peterz@infradead.org>
Cc: will@kernel.org, boqun.feng@gmail.com, mark.rutland@arm.com, 
	Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 8:00=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Jan 15, 2025 at 12:13:34PM +0100, Peter Zijlstra wrote:
>
> > Notably, it means refcount_t is entirely unsuitable for anything
> > SLAB_TYPESAFE_BY_RCU, since they all will need secondary validation
> > conditions after the refcount succeeds.
> >
> > And this is probably fine, but let me ponder this all a little more.
>
> Even though SLAB_TYPESAFE_BY_RCU is relatively rare, I think we'd better
> fix this, these things are hard enough as they are.
>
> Will, others, wdyt?

I'll wait for the verdict on this patch before proceeding with my
series. It obviously simplifies my job. Thanks Peter!

>
> ---
> Subject: refcount: Strengthen inc_not_zero()
>
> For speculative lookups where a successful inc_not_zero() pins the
> object, but where we still need to double check if the object acquired
> is indeed the one we set out to aquire, needs this validation to happen
> *after* the increment.
>
> Notably SLAB_TYPESAFE_BY_RCU is one such an example.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  include/linux/refcount.h | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> index 35f039ecb272..340e7ffa445e 100644
> --- a/include/linux/refcount.h
> +++ b/include/linux/refcount.h
> @@ -69,9 +69,10 @@
>   * its the lock acquire, for RCU/lockless data structures its the depend=
ent
>   * load.
>   *
> - * Do note that inc_not_zero() provides a control dependency which will =
order
> - * future stores against the inc, this ensures we'll never modify the ob=
ject
> - * if we did not in fact acquire a reference.
> + * Do note that inc_not_zero() does provide acquire order, which will or=
der
> + * future load and stores against the inc, this ensures all subsequent a=
ccesses
> + * are from this object and not anything previously occupying this memor=
y --
> + * consider SLAB_TYPESAFE_BY_RCU.
>   *
>   * The decrements will provide release order, such that all the prior lo=
ads and
>   * stores will be issued before, it also provides a control dependency, =
which
> @@ -144,7 +145,7 @@ bool __refcount_add_not_zero(int i, refcount_t *r, in=
t *oldp)
>         do {
>                 if (!old)
>                         break;
> -       } while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
> +       } while (!atomic_try_cmpxchg_acquire(&r->refs, &old, old + i));
>
>         if (oldp)
>                 *oldp =3D old;
> @@ -225,9 +226,9 @@ static inline __must_check bool __refcount_inc_not_ze=
ro(refcount_t *r, int *oldp
>   * Similar to atomic_inc_not_zero(), but will saturate at REFCOUNT_SATUR=
ATED
>   * and WARN.
>   *
> - * Provides no memory ordering, it is assumed the caller has guaranteed =
the
> - * object memory to be stable (RCU, etc.). It does provide a control dep=
endency
> - * and thereby orders future stores. See the comment on top.
> + * Provides acquire ordering, such that subsequent accesses are after th=
e
> + * increment. This is important for the cases where secondary validation=
 is
> + * required, eg. SLAB_TYPESAFE_BY_RCU.
>   *
>   * Return: true if the increment was successful, false otherwise
>   */
