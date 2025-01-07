Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BB32594B4
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 17:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271102; cv=none; b=O1h+fkZ4GyiJTbLm13vh15Y0LY6Xvooy33PoodvzMGhKVBEH0p+IXh15mTq0sthbX1fvhExh9u0K2X4hANEkUZSMxAWtgDigMy1t6uxWVCNY3uJhvbmakSZ6JFacJe97rweXYey01QTId6DMmrhrmLn4vazBtI9Ad/EeYr7JXh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271102; c=relaxed/simple;
	bh=1/uLGfraVc9uuztuNwm6ma/WbskbUjWbX/NmHV4Prxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RknExTuRDHQ2hrjQz6MP+VqxYNOgfErea6Oac0+DjdfKK2iVc/3cDUbvLR7xakaDpYO841SMdHn53U2hfRY4i7DvoOxE6Uodm1B8waM/gE/P3vjGQGKWEOJCbOeW2LlTashL64f3XLT8E0c7DGx/KMB6v/ELyf0LuEjpkRlnxDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O48VssKh; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O48VssKh"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467896541e1so314981cf.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 09:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736271097; x=1736875897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOPJC12oQeoFXzugz6Xmq13UmovsYYHifcT0iQkvNjQ=;
        b=O48VssKhdNTnUUJ0OnAlxqPp+PWtLDN6qZnGGTTACwv1iAxcXjgBVsKgd3bwuf+trc
         TK4hnCMlpyMQv84UKELRFLsvCJYuqsED0I17o86Oa6fM0tc6rnXDOWOWhUcOn5ddwNJZ
         hQJWaKd0bCe/1yvHowsH7NkONLoaWKfvKXPxwiy9ig4S5X88t2qQlVGxSMCQFbBsJ/qV
         pDHuP2fRxt2y+ZWzMIg2f6roE4FHilJz0dhFOdprTcnu/RLe8iwri0Ktp9LfWYWkjWY9
         UPniMBGc0tE+9OeCYsI2uZn/Tu2COCF7e0/aTy2D626mwYwf26sNoMqOhOCzPjOHn2Rc
         eQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271097; x=1736875897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOPJC12oQeoFXzugz6Xmq13UmovsYYHifcT0iQkvNjQ=;
        b=u+8r0KXG+sSq1/OoYQUkRsK3RJrzQf66bSSWG/KX8Vx9sJv8w1Mfj6ZStkFsq9ARdX
         slnK8zzDIlhzSVO/tz1HjCEvWSyVEdmqw0K27DPoQe4D7wqtwu4TFkQrmuhrHXT9rtSI
         MpgoSxPzT6uyFbNMfETR14IYh5cb5w/uhtlXnB3BTZTwFPz/Ky/Z2Io8zzeOl1Vmbu/D
         WH47eTppd+n3YvlsiL2drNaUupbvUbTX5AHkLfuheWKHtQvzRGkrk8HkgqO19gxnhm2R
         GONhyrLVL9sfpBkE8s7vDc/+lasXkPDe5eawE++qpIly41l31BxZobhQwSmKoU2qkR/6
         haKA==
X-Forwarded-Encrypted: i=1; AJvYcCXLu4nOmxd03jJVpzv+8GkHhtlB6LfLDZwc8r731YolI8As9GngXzb1QLJcHfYSw2/YLsQ2IMuLZ4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkJGsCnDyqYVNX4AnWOsKXZszJl7OiYRHqTcfK6Bo1JzfASDA9
	COMMXvQuegpZCn4GHFZY3gyNmWc+dS1IazPOTSKN3cxN92WbkF4goo+NEHZoHV6nEtFKDg/RToo
	DX4QsfTxheXmYc3u9WWTP3F9UfeNEjcOETrjs
X-Gm-Gg: ASbGncsK0aTWzisCM1yvkaYndwtcyxElicwh00heUJdZ7S3fa2rb2UztrqLPPUh7NOT
	XXAnaM5ciJxbiW5O49Ed1nhTGppnTCx8qfbiZKkEj/O+BnJTBWEAE5s0eXPwvM1/u3uKF
X-Google-Smtp-Source: AGHT+IHYK9UpwLg8g9p8WZ/+G+K2SlEb174x5VoCFiOsuQulmL6Q/tmn9ENXIRvGtPuqmCx6/lhi7nRXXekengkGOqg=
X-Received: by 2002:a05:622a:552:b0:462:b2f5:b24c with SMTP id
 d75a77b69052e-46b3c82797dmr3672571cf.29.1736271096520; Tue, 07 Jan 2025
 09:31:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-9-surenb@google.com>
 <929630d5-3a11-47f3-ac4d-4f162a11bbdc@suse.cz>
In-Reply-To: <929630d5-3a11-47f3-ac4d-4f162a11bbdc@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 7 Jan 2025 09:31:25 -0800
X-Gm-Features: AbW1kva3MR6uMiHmqOyu_HM-hFWVk-j1pZV9D6ZKWExGeVH4miRxOoAW-P1GQcY
Message-ID: <CAJuCfpEf06MfXBORqbCyOi20omJziz+ySBiDxsAzcUSY_OaoKQ@mail.gmail.com>
Subject: Re: [PATCH v7 08/17] mm: allow vma_start_read_locked/vma_start_read_locked_nested
 to fail
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
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

On Tue, Jan 7, 2025 at 9:28=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wro=
te:
>
> On 12/26/24 18:07, Suren Baghdasaryan wrote:
> > With upcoming replacement of vm_lock with vm_refcnt, we need to handle =
a
> > possibility of vma_start_read_locked/vma_start_read_locked_nested faili=
ng
> > due to refcount overflow. Prepare for such possibility by changing thes=
e
> > APIs and adjusting their users.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
>
> (I don't know if this can break some uffd users?)

I checked with Lokesh who added that uffd code and he confirmed that
uffd will handle errors correctly.

>
> > @@ -1483,10 +1484,16 @@ static int uffd_move_lock(struct mm_struct *mm,
> >       mmap_read_lock(mm);
> >       err =3D find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, s=
rc_vmap);
> >       if (!err) {
> > -             vma_start_read_locked(*dst_vmap);
> > -             if (*dst_vmap !=3D *src_vmap)
> > -                     vma_start_read_locked_nested(*src_vmap,
> > -                                             SINGLE_DEPTH_NESTING);
> > +             if (vma_start_read_locked(*dst_vmap)) {
> > +                     if (*dst_vmap !=3D *src_vmap) {
> > +                             if (!vma_start_read_locked_nested(*src_vm=
ap,
> > +                                                     SINGLE_DEPTH_NEST=
ING)) {
> > +                                     vma_end_read(*dst_vmap);
> > +                                     err =3D -EAGAIN;
> > +                             }
> > +                     }
> > +             } else
> > +                     err =3D -EAGAIN;
>
> Nit: { } per style

Ack.

>
> >       }
> >       mmap_read_unlock(mm);
> >       return err;
>
