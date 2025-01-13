Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C05824022B
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 17:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736790991; cv=none; b=KmA+xVG2YD4+5QmRsorv/MEFEHQnQu1zBOfkzkvnSIg65VtgzisofB/jk7zOIhwwu3GGpH5J8BOQ4jtKxFB9+8b9BRJQeD7M+NPxEPjmGkrANIwgK9q3NZhJXnsGE4XhjWjZaJXctZcPyo5X27ZxsLnIXhnONt3wQ/3TaYH8LNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736790991; c=relaxed/simple;
	bh=Ifg6nDI9U1xMBYRJOYriGmFwv2cyF4H1su8gZ478Lgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/du6T4rXGPqGheQugPDIjXD6O5CCgKjYVP0jjcQmyRLQEVWQuiIwZxmRdGU+fbioaw3fqsjGW0kX12dBc381FT4WNIvp6lyQm3ixfHyVHa0ung3iLDW24rBpdnXdlTw01P5eSaurHxevvvXPFhnbOQqk9jZ95GixkvkapxBZCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Zn0yWNq; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Zn0yWNq"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4679b5c66d0so111cf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 09:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736790988; x=1737395788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwdunmyEgD4eGVjGrUJ4iYmqoGOBTcVI0c7l1bxrO24=;
        b=2Zn0yWNqyOjgo2j8PtdBnGRyBcBox2p6cfoCektfxErE10Yq/oipjiyPTQyRQVNY/4
         3JNHlGiBcKJcGDJYHkYE8zwO+ATniOGgmCbCZUeUpuVIXIjm0pwkUSW154LVHZ1IPI6R
         3bjeh/XwKW5iKVPK+40x0bz+2wMRrxakzfHeey21zYBhdwfCSTFO/6zdiQq/RCOgp4jd
         nqASLeLiAsWzovWE4veWK7yj6VQfhEF9yYv+NXIGgrqEgwS7437jBWAfe1QKxr5vPbU5
         +BQYfcfq3lDM5FCG+POZQLBF6EhYED/cMYtLs4PxcYCpvSn4CC3hb55aqLR7QT4zPTRe
         /njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736790988; x=1737395788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwdunmyEgD4eGVjGrUJ4iYmqoGOBTcVI0c7l1bxrO24=;
        b=FwN/W+35HSlr7ImIAV24FlhOHzDlSQ1NvmavqoDMYd7NGrPY2B/r0/34dnP/lYGjTW
         z/GtE+0+seWrKr/wV/vFPWCejai2LhhXguLJ8nVsUbZFsBBe2z1hSu7dz99+/F6xYYQf
         l9H1F4zU3p2Bs3r1xc9dG0DbB/0QU9xtZF5zgH7ujLpy1561wy0VV9Kmw3s+9v80ihQN
         XmA2vf2/xKMOi0h4XbXBbAfuEhseA0+iHH9pmm0vRseZ8quqv3YQQSy3t17h/zTJmZ+l
         Hb2R9pR91f073CPncgKfUhQExGTfki5Cnx0nRuMm/PZDESBJWkffjd87I3WKViRcqelx
         cunQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdDpf0KOonzs7iX6Cs49OmToaJvfmO1Rgjjzr4m3PiGu0RK1QXMx+Mp1Fx+S6mugtPGKX/vhRPysg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx64Om8nRBWYNFHKVjBu6GE3SPKOiV2RderU/sQMBUYYrUvsC6P
	558Yqmyy2wSjwEpQBr4YJuCGIF1NUo78VrZ7WVz/dVdRuyrQSEyGZZTSTJPhvF1FDzAhdT1juJD
	cShhtyqAnhwf7NKyBNMklr8lgF/a3I+uKL7vD
X-Gm-Gg: ASbGncuACA1nioLx04FNbzLb/MSeoYfJZkO4XzN90nzTULIWAStZdJ9xz8EItNu8rfB
	a4wGYJHZ4U4xJALatwjMnCCMhpcDaADMot2pu7g==
X-Google-Smtp-Source: AGHT+IGlRLcr2NLrZwcstPg2fFrJr8j6xR/0O4XvFSm7OjRNUPhxrCrSKVu8b9zkaYl7F3H4ms/rSpd+4496bclLehI=
X-Received: by 2002:a05:622a:342:b0:46c:726a:14dc with SMTP id
 d75a77b69052e-46c87f3c1c8mr14205071cf.28.1736790988160; Mon, 13 Jan 2025
 09:56:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-15-surenb@google.com>
 <5b1d82dd-bb30-4a5a-8f3c-949be4a81c45@lucifer.local>
In-Reply-To: <5b1d82dd-bb30-4a5a-8f3c-949be4a81c45@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 09:56:17 -0800
X-Gm-Features: AbW1kvanmkAnXwIMdSfgJhrYq8_HLelqWwQ5_a52w3MkvQRox77UAx0X_VNTTJw
Message-ID: <CAJuCfpFrtZnbA5Xr7iy5BT1ANkT_wqRsu_2A+sWToLV5=faxKg@mail.gmail.com>
Subject: Re: [PATCH v9 14/17] mm: remove extra vma_numab_state_init() call
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 8:28=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Fri, Jan 10, 2025 at 08:26:01PM -0800, Suren Baghdasaryan wrote:
> > vma_init() already memset's the whole vm_area_struct to 0, so there is
> > no need to an additional vma_numab_state_init().
>
> Hm strangely random change :) I'm guessing this was a pre-existing thing?

Yeah, I stumbled on it while working on an earlier version of this
patchset which involved ctor usage.

>
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
> I mean this looks fine, so fair enough just feels a bit incongruous with
> series. But regardless:
>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> > ---
> >  include/linux/mm.h | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index a99b11ee1f66..c8da64b114d1 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -948,7 +948,6 @@ static inline void vma_init(struct vm_area_struct *=
vma, struct mm_struct *mm)
> >       vma->vm_mm =3D mm;
> >       vma->vm_ops =3D &vma_dummy_vm_ops;
> >       INIT_LIST_HEAD(&vma->anon_vma_chain);
> > -     vma_numab_state_init(vma);
> >       vma_lock_init(vma, false);
> >  }
>
> This leaves one other caller in vm_area_dup() (I _hate_ that this lives i=
n
> the fork code... - might very well look at churning some VMA stuff over
> from there to an appropriate place).
>
> While we're here, I mean this thing seems a bit of out scope for the seri=
es
> but if we're doing it, can we just remove vma_numab_state_init() and
> instead edit vm_area_init_from() to #ifdef ... this like the other fields
> now?
>
> I's not exactly urgent though as this stuff in the fork code is a bit of =
a
> mess anyway...

Yeah, let's keep the cleanup out for now. The series is already quite
big. I included this one-line cleanup since it was uncontroversial and
simple.

>
> >
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
