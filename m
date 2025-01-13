Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664863A1B6
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 21:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803142; cv=none; b=Gk4XuDq6HAKMqEYQ2r8IacyL3x6ak8BQfxh8p9uYJlVybtTudfyjdGuNRNW1Ug1UNpI11Y6u14lMsq5fOzzkarHOyDGuHwtqLl2d60SZ81HuYDysInSB5uxpBGaEDThcs59iDmIdpQsHv9wZNCJwlPQ7PweMokm4GlsdOnBortY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803142; c=relaxed/simple;
	bh=n/QsMpjek4FgZciZgBgiQjbl1aKZ6rXK6jLgTC8vr0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVmWYkXL69sO4aulc1fUK3abCJe1o61h5g9hMG8bff96+qgg04DJ9mSTRBu4qlZQ1+MyWHVJvr3YmlyU1cVV3hwjVT1usR/UjQVrYR9muYxt6E+V7tL9t4iIj+cxy4k/XsPGS5W6jm0vjKFPKlS6wB5wC0IYtT98IEUZ3yVPq24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xPH0amTX; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xPH0amTX"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4678c9310afso7211cf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 13:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736803140; x=1737407940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtMSrBdSD1WyW+/bmHD6GIAtvwp9TVQ1tGkdYov9OtA=;
        b=xPH0amTX/l/isWr3L9dfwyzRYuflXuFkM5j2qbzegjXy5CB1V1mrjX1Q8kZqsgxLL/
         kOHEa3C3aO/2Lo074Ub9bQi8HvSmKfVDc6X1e91EFbgByAfgfofvUwfRKLSauV/8sRkP
         r/BzipTXGxSUFCXBIBkZsSbUYPL62qX8YqKunR9xDRkNeAsM4S/N2cZVOibTNYQeg2X+
         7azk+VovCmiXnYyaMhm3fBye2PVzwi4O8aCKRHpI8agMYEgNeX23G8SBsWDUrELV0kJW
         eTIg8X7e/1+RSzL3DTzTalYfdTuPLNE+52G7Qt50w1LGqT4XK+VdxM2A3HXYC5ASzqkc
         3TZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736803140; x=1737407940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtMSrBdSD1WyW+/bmHD6GIAtvwp9TVQ1tGkdYov9OtA=;
        b=TMsamtUl1H9T3YH/s7wFS1qNF1ObhxPsIpZb5G1JRY0u8nRnUjM7m1U837O4qVSibW
         fAZmc/F1aQw3WxVDnltknqv1eA1xzL95ZgOVJ11p2CnQkksAA5ttSRkyUdO8Y5qn3DW8
         Dytf83Iq0l0b2Xot9DDmJlkgwJVIpCgMEFcOW+rzM7o/nTWnkD2e9fWdVxJ/Faw8t4xG
         T6Yw3+lcwVe8Uj4Hx0TuJFiMVeZLM6c1NuiFD1KN461hFE5BClPszL/SzfGLnIVNjB6C
         s66nMceUc/yxY/iKImpGK8M7cYyNE0qV//Ezarjd0XylRzSgCadDe05fcJsqyxht9VrQ
         WPeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg9KOpxzsvP+gq9LbcDL8sJoBMG8RKVrUftD1hLXqZNO6f+NGeNh6AouvKKKRFnoWvRvL/mI6fbGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx66hooXAoXw6WAlepjuZtgxMVtboKQivjjkXGu9htH6WAj2Bk/
	d8L7F3nyeO9Rjlp6Fe8baPOIFBQCvHTjM6DJKI/dWpUd9pJkdSF9Ne+pdTNhQvkBbcn0dSPe+9j
	VP1VYQu0Jbt4yIg2TqBqTDdViPFkBnH1Xcfah
X-Gm-Gg: ASbGncv4B2nTYgUfOiiShT4UFOy6GjG1QGuiBVhgiKJWWkgwkQPh+IbQX/zvqd2kQ6C
	Pa0mwNrUtSnTNfYvBF9ABf8jPvnxoIuNpZmcEUQ==
X-Google-Smtp-Source: AGHT+IFhhek6CRujAvqPLNOqlKag4xW2G09GK9bsPCJBvIEEsvbG3fQol1M/+lRBiYUbJd7mqSdkZjvsPn4nng15dxQ=
X-Received: by 2002:a05:622a:1aa0:b0:466:90dd:19f3 with SMTP id
 d75a77b69052e-46de99be708mr565921cf.7.1736803139828; Mon, 13 Jan 2025
 13:18:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <20250113093611.hmjmizvt73mrq2y2@master>
In-Reply-To: <20250113093611.hmjmizvt73mrq2y2@master>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 13:18:48 -0800
X-Gm-Features: AbW1kvZsEqGrLSIs0VIWlzkP6ofP2l1u26oVzJKobxz9Q7GM1FQylAsV5mynLcg
Message-ID: <CAJuCfpH_4EF6+-cUF9uNrfX7wONWHR8f13EQHN4AeVkALMBWfQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
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

On Mon, Jan 13, 2025 at 1:36=E2=80=AFAM Wei Yang <richard.weiyang@gmail.com=
> wrote:
>
> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
> [...]
> >
> >+static inline bool is_vma_writer_only(int refcnt)
> >+{
> >+      /*
> >+       * With a writer and no readers, refcnt is VMA_LOCK_OFFSET if the=
 vma
> >+       * is detached and (VMA_LOCK_OFFSET + 1) if it is attached. Waiti=
ng on
> >+       * a detached vma happens only in vma_mark_detached() and is a ra=
re
> >+       * case, therefore most of the time there will be no unnecessary =
wakeup.
> >+       */
> >+      return refcnt & VMA_LOCK_OFFSET && refcnt <=3D VMA_LOCK_OFFSET + =
1;
>
> It looks equivalent to
>
>         return (refcnt =3D=3D VMA_LOCK_OFFSET) || (refcnt =3D=3D VMA_LOCK=
_OFFSET + 1);
>
> And its generated code looks a little simpler.

Yeah, but I think the original version is a bit more descriptive,
checking that (1) there is a writer and (2) there are no readers.

>
> >+}
> >+
> >+static inline void vma_refcount_put(struct vm_area_struct *vma)
> >+{
> >+      /* Use a copy of vm_mm in case vma is freed after we drop vm_refc=
nt */
> >+      struct mm_struct *mm =3D vma->vm_mm;
> >+      int oldcnt;
> >+
> >+      rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> >+      if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
> >+
> >+              if (is_vma_writer_only(oldcnt - 1))
> >+                      rcuwait_wake_up(&mm->vma_writer_wait);
> >+      }
> >+}
> >+
>
> --
> Wei Yang
> Help you, Help me
