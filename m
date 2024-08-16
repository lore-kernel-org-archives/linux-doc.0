Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9C31C14
	for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 02:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723776668; cv=none; b=RizvWO2d0NMEMHJj2wSTvhZxCapjuKQIJ/Hi45t1OS3o0GP6Lyo3jWyNvhKYC0oBKmW/JgUfh8/Q5hqs0f/iFSD560JiwZyAcJaxR/xXW8eogJQVerSnlbMCoFCRZplqPS9vK8WSnwAldV27DLQ6htdbXWweTTxAyWl6PgztLCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723776668; c=relaxed/simple;
	bh=xzdNlOE6NVbY6jRH0IluIxEb0mkUQhbkH9xOl7Xm5QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YrUYk42KzLpoI4atH52OV73ztn7mDyuWwFiTP3T9Q9nLJooHj9qCMQPNbkiedSlO7+vZMtrdZETdje4Yc0a9vtMzpAe6Kh1kZ/wOJSJgSD2RyCw2u4dzPGWvYrMxpkr+aFgvCqdZIkwBvYnQf0oYCVzKwmj2EWq2YqMv9Z//7P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZlewL0FR; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZlewL0FR"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-49294bbd279so514643137.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2024 19:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723776666; x=1724381466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ4wKjX5UNtk1yVhJjQe2lnH4gaYcg79CHV/ANC3+VI=;
        b=ZlewL0FRtecCXyLnwjvubOLQb5CkwpE5lWQRtbtj3rPK0oZO+CqcwUvX6O70umCoLI
         w0YpqIckg0TkcirToaLenuH6R3nOmF3Zr+kwEd6YsJW2rRUJ4bKWNJPBMjCyuioG18zs
         xABVMZMZc/AKWyOFb1A3UxeTnkmIyUrP6nw0vDok7rIhlRFiBhPZ6xqwY9OfQqD0H9NV
         Stg/n102X4a1OXLKJDP4bYVuVbOocD8llTu44SEHqoa1PI7qzaDAdQAsxieds+L6IsFY
         y2ZaDyxwThJR1L0OweTejEQvcHURV9gjZ0KRzyFpC0XMK8lmRamAnzwOId/US+/n94Zz
         uOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723776666; x=1724381466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZ4wKjX5UNtk1yVhJjQe2lnH4gaYcg79CHV/ANC3+VI=;
        b=DnSoYYxyAEPN6+eGm6612NCezrnnLSPpb44ndQvAmQU6A7puLKE61xQ5bQHxUg5pT/
         JFp8FUTdWDMAfAbpX9sunYYDuqEtXwRPNHmB0Xx4uB577o0M61tiBRr9ZVCCI25l5m6h
         vQPV/zqWfxfb5Mij/FkafAg/UWzhhJCtn5p1CsDYU07Wtk6jwxrSei6FLxrSC+ywnFsk
         8pWwhm3Se+ulxPWzxJ/+XLddSoRzmGDWy+AEqg3VUAodnKk/nncqP1ApfV4BBYDEI+g+
         8IsHNh49uELm2XOeQhmJYvIJwBfpJKmNgeCq8fitdfewqEclLyQEmd0K+G1OB7cHcApU
         pBog==
X-Forwarded-Encrypted: i=1; AJvYcCVLFGv61v71ArAWRaKlwNdOSTcLUERM2gM3fz/NOr6nXEGYiSdTih1NNN8mcrtHeQEKN0Lj7KhhbsFQuE8P0YtUR3J8jRlW5N11
X-Gm-Message-State: AOJu0YzH4zHzugqpRnaEQMyy/CdbwnxR7y0Pb0gbxdmOIhYRTNdd75mG
	OKBrTsPdzbiSznvTnPKbaNaaZ1XEy9h1F2EFGAMLqwqyoe+/2VyioYNFAWpT6aom8LSR8U0K3e1
	jCyMsNAddLw+L22zsm1Ldk8CoDXIZqYukLDSK
X-Google-Smtp-Source: AGHT+IHqwyaAFVLD4FMxP5y+Y6lD7lVZjOIcgrTDKtU/avRO6AmG9E1BX0dgvzWK/lpcEFyoXStfLJZE6Lu7OJRibMk=
X-Received: by 2002:a05:6102:c04:b0:492:9c55:aec5 with SMTP id
 ada2fe7eead31-4977993fe3cmr2271168137.15.1723776665944; Thu, 15 Aug 2024
 19:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <88d411c5-6d66-4d41-ae86-e0f943e5fb91@gmail.com>
 <20240814230533.54938-1-21cnbao@gmail.com> <4acdf2b7-ed65-4087-9806-8f4a187b4eb5@gmail.com>
 <20240815163013.2522e3dd83acffe70af9cba6@linux-foundation.org>
In-Reply-To: <20240815163013.2522e3dd83acffe70af9cba6@linux-foundation.org>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 15 Aug 2024 20:50:28 -0600
Message-ID: <CAOUHufa=KgKvd4+w_fFqCBDSi-nG638PW01KairXcn50VQ4x7w@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] mm: Introduce a pageflag for partially mapped folios
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Usama Arif <usamaarif642@gmail.com>, Barry Song <21cnbao@gmail.com>, baohua@kernel.org, 
	cerasuolodomenico@gmail.com, corbet@lwn.net, david@redhat.com, 
	hannes@cmpxchg.org, kernel-team@meta.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, riel@surriel.com, 
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com, 
	shakeel.butt@linux.dev, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 5:30=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 15 Aug 2024 16:25:09 +0100 Usama Arif <usamaarif642@gmail.com> wr=
ote:
>
> >
> >
> > commit c627655548fa09b59849e942da4decc84fa0b0f2
> > Author: Usama Arif <usamaarif642@gmail.com>
> > Date:   Thu Aug 15 16:07:20 2024 +0100
> >
> >     mm: Introduce a pageflag for partially mapped folios fix
> >
> >     Fixes the original commit by not clearing partially mapped bit
> >     in hugeTLB folios and fixing deferred split THP stats.
> >
> > ...
> >
>
> Life is getting complicated.
>
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -1758,7 +1758,6 @@ static void __update_and_free_hugetlb_folio(struc=
t hstate *h,
> >                 free_gigantic_folio(folio, huge_page_order(h));
> >         } else {
> >                 INIT_LIST_HEAD(&folio->_deferred_list);
> > -               folio_clear_partially_mapped(folio);
> >                 folio_put(folio);
> >         }
> >  }
>
> Yu Zhao's "mm/hugetlb: use __GFP_COMP for gigantic folios" was
> expecting that folio_clear_partially_mapped() to be there.
>
> I resolved this within
> mm-hugetlb-use-__gfp_comp-for-gigantic-folios.patch thusly:
>
> @@ -1748,18 +1704,8 @@ static void __update_and_free_hugetlb_fo
>
>         folio_ref_unfreeze(folio, 1);
>
> -       /*
> -        * Non-gigantic pages demoted from CMA allocated gigantic pages
> -        * need to be given back to CMA in free_gigantic_folio.
> -        */
> -       if (hstate_is_gigantic(h) ||
> -           hugetlb_cma_folio(folio, huge_page_order(h))) {
> -               destroy_compound_gigantic_folio(folio, huge_page_order(h)=
);
> -               free_gigantic_folio(folio, huge_page_order(h));
> -       } else {
> -               INIT_LIST_HEAD(&folio->_deferred_list);
> -               folio_put(folio);
> -       }
> +       INIT_LIST_HEAD(&folio->_deferred_list);
> +       hugetlb_free_folio(folio);
>  }
>
>  /*
>
> Please check.

Confirmed, thanks.
