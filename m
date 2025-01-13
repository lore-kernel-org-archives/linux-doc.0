Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20081D514C
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803015; cv=none; b=XeYHd+BwzL/K1xCdaGIG6eIVul+IDHWROZbdFjmPNgbN+mIg+pAQTQRsi/xd3CTVoCt3lVxqKo12nLUmnuEQ7dcpqtsW59gGYPBGNT49BVd1U5wJ6kDtWJpfYxCrEjit7kJWqZZsnFoU7/KQgRfN7foScov5KpUz+e0V/HeVxqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803015; c=relaxed/simple;
	bh=eFCW0PYwKebTqexWcPeyICZ7MJ8BakFr8gTXrz8h450=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQsj/4XuMiejolrJhm8bCOYw/bm8Q4HbxgHQVcLecM3vVkYFD4Xjz1Z/CqZaVhJ+Os4Nkf9+kNoGdSFiiZ//AoN71ydHAf/cAECihpPuHpdSS89Y6yKUKCNw5jKKja9lXWFzn+/UbACMP43v/a8ItVLuEJvN2oVhcMroI4FHmVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gWIaCSD3; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gWIaCSD3"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467896541e1so66631cf.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 13:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736803013; x=1737407813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zkwFVrYj9jyweB3toBm3nA57LbeU+KqLHYguHYoUC4=;
        b=gWIaCSD3ZOxBHAXuOveWS6bqwWZSla1P+I1//0tP6joLPoTUWPf/J1xWeBqimQnqVi
         bQziq6PkoFBFlKQnaEydbzqAwiS3FTjHcikg/OZY6txc/Kr4tnmj6SF4HussdHoQhB0i
         yt66kwHuI52GpUOtymD/f9zOMXB6IIkCPzgGesuUNog7xjehD9W+JCGpybhqAZHFwxLZ
         8p34dYVoBjSHboHFvo1PAXwQI+CSbyx21dHx4ut62+Vmd+zwC+eZszzIyIwfvQXDEsvx
         hgNLtHtJ8UtV4km2zRp9r9Bso5vIBjydDkyZJEqtyPSek3xK7WOJBzGUKGSRYY5d3u5a
         A5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736803013; x=1737407813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zkwFVrYj9jyweB3toBm3nA57LbeU+KqLHYguHYoUC4=;
        b=qiF+N+ue83WYsIUcL4tsV4g2LxNiJht4CQpZUaO/hA6L5tPYhPSjLXbhScCVeBSb20
         OQgpR7xhrUHOUTD6g5O7hME1UuBnW/mVJYcHlIeVR053EuPbqEx7nAePisa63xsNGIwx
         F/VFqvgFBo9BRwOQxzrzGoEp0jxBl+rxHN92X2SSCnL51yMIHRzPon3lTNuOFhqiGMS1
         wIKO5QaAGp3sWnaNmvtQzugKv1v+6iQTEZYvmWZLR4gYYBR3gTFyUZ84XzFzGvPgoGPB
         HM1hz6NCzW+ku/cHnpiYrZBeHvZzwTvoex9qg1d++htpM/HjegZfj1ujzLrYAJMM1bNn
         tgMw==
X-Forwarded-Encrypted: i=1; AJvYcCVNE4WxQWmiSYSzQSIhZYiRW9K8XV+DDcrTwY1ixTTGHj9Y0OkG1Ij9A2Hpv1XKU9yrS9kbEeJAkfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfRGTs3b/Uj56SF4S2BzbLhPPnSXNQl8NiIS7e+M2IU7ph7Ld
	uUBpqd/VNjj9Bkoi4GQpGy/MJFA4Bv3qN1dUVnmxJhLZiUatBLLWigAxCghydLQBOTAD0L4NLTk
	Wl4697U3jrOB09sFBA2UXtSwkYSfIzt0xF29y
X-Gm-Gg: ASbGnct/fKIMeKCyZRT72S9G2LlSX8RfLQTCJryYhmkZTSlCQ6z4goea7WVELt1bMuX
	NWDTXN7keY0kidrb57GZbFZU7b/3ekX4Yr6SWaw==
X-Google-Smtp-Source: AGHT+IHPS0BKg7I1i00QJvbS2BH5V2KMi1CXbkV2Zo5G5poOTalncPiGKPdW/Nlbriz/tRFqGOPGKlhrMyl9A1/kLvA=
X-Received: by 2002:a05:622a:614:b0:467:8070:1573 with SMTP id
 d75a77b69052e-46de98ab06fmr621241cf.20.1736803012424; Mon, 13 Jan 2025
 13:16:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <20250113023756.kgu7hdeow7ltsj7m@master>
In-Reply-To: <20250113023756.kgu7hdeow7ltsj7m@master>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 13:16:41 -0800
X-Gm-Features: AbW1kvbiO1aOCsS88NxHtrdu2gU7F7WIaMfeDExViX6HTEzB268kqR95wBANaMM
Message-ID: <CAJuCfpG3OMHpBg5BFcXH5935aYD9v7ON8dQrHr1t9HS3m_htvQ@mail.gmail.com>
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

On Sun, Jan 12, 2025 at 6:38=E2=80=AFPM Wei Yang <richard.weiyang@gmail.com=
> wrote:
>
> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
> > static inline void vma_end_read(struct vm_area_struct *vma) {}
> >@@ -908,12 +948,8 @@ static inline void vma_init(struct vm_area_struct *=
vma, struct mm_struct *mm)
> >       vma->vm_mm =3D mm;
> >       vma->vm_ops =3D &vma_dummy_vm_ops;
> >       INIT_LIST_HEAD(&vma->anon_vma_chain);
> >-#ifdef CONFIG_PER_VMA_LOCK
> >-      /* vma is not locked, can't use vma_mark_detached() */
> >-      vma->detached =3D true;
> >-#endif
> >       vma_numab_state_init(vma);
> >-      vma_lock_init(vma);
> >+      vma_lock_init(vma, false);
>
> vma_init(vma, mm)
>   memset(vma, 0, sizeof(*vma))
>   ...
>   vma_lock_init(vma, false);
>
> It looks the vm_refcnt must be reset.
>
> BTW, I don't figure out why we want to skip the reset of vm_refcnt. Is th=
is
> related to SLAB_TYPESAFE_BY_RCU?

Earlier memset(vma, 0, sizeof(*vma)) already zeroes the entire
structure, so vm_refcnt is already 0 and does not need to be reset
again.

>
> > }
> >
>
> --
> Wei Yang
> Help you, Help me
