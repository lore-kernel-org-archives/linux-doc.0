Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500434014B4
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 15:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511602; cv=pass; b=oGC10obBgCpmRuXK2QwAumGmrlAutzkgDhKL0KUcHGAh7gchoefmkRcfOnpr4h+Zb9QAw6N7csHCJMtBIZdhdfYKc+fmlfK9gKlNrFanhQMbtbIllSydejN0t4JIe+KqUYd5vY0hp0eNXUG0konXlmm1tX57sp0Yw2vGa8O0hdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511602; c=relaxed/simple;
	bh=Tw/jTaTfevuD4j6kevhXiivmx/RspoclXlT/LcAGcBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHG10w35uIkkGINYMr403q/Tcdx3NnNi7uKkAbglVQqKeRIQIbw2z+cDLjg3RM7hZMPY3aOO/ok/H5b/s61QG/NscRPCi40bk4j17ZLMD1Ag0CjTWO0j+i2PEB7Uktpe+K+94buQL8C8ct1QrQZ8zxug3/TCcWiVMdtSGOKNZvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awalTV4+; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awalTV4+"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so7003301a12.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 08:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778511600; cv=none;
        d=google.com; s=arc-20240605;
        b=AxE74WK/+ZhOt/+OP4LVzkAjo1/q6HinHNycbnHy3vZPNrOX40wJY86o90LzlFfhZ6
         OU9DAi+lqJ01VVIk2U/CQ3+85GBASKAsZ4T014/t4ggHH3vrzD0lhIiG3wFptj8cMeug
         PPQtGbctiPlA/3QLicm9h29R0axJHUe4FXhSHds897u7Za4Je85d++s+VGK/pshWeEtB
         +hlXAh8DTIHbzaRaizy/4sjSnZI/qB1kteKw4W4KYip1XOYUe6F6ad1BIUsqAQxsNlHv
         H1py8bBXDbSg0PO3yeVEv8TFxQL8YBAY6fGuB5mAECX5W9Xp+ci6793EBB8uNwvmiJ9u
         TKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HXK9Qgle7Puv113jAKFz7L/yq22PTO27vhn58OjsUZg=;
        fh=2rsZZkC2cznOuemoT0m/Otvz8a7oADzfg/84GpNiVUo=;
        b=aRJdHk6tWB5xm8c297xL50Lu9YEzpxGnW9TlBrMdeEwtO82ooR/+ZhN4ustf2WTe2P
         jaEI8n/U7PPEE1FV3eVEwoxqZrOyA/yllaArVgzKUWRWJatrijKMDa5xm1hJIvoWShUT
         iW3HWp/1gSBbBVVzvnAgLSC8O5wWQB+XpLoEP7TJv/tc4gSGgIX94eETWXJ9XcYZI9n0
         fSK+T5JvGGEDKe1jASBmTaJL5R5BvPGUjOIMVlDPK9tRDt0bZeQWNz6biFBVJHcwl0/X
         SC9XDeq7Hc1Pl9UnaVfGnjQ+2k5q03UkJ6ssfuCWA8xcBCTTKCUJDJlnyvME2vikkSR6
         uLDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778511600; x=1779116400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXK9Qgle7Puv113jAKFz7L/yq22PTO27vhn58OjsUZg=;
        b=awalTV4+p6TSt25v2RvNXo9jfpO2kD8Jc852NOUVXBOW32kAHGmQmyWdmEgfRlOlPW
         s+si6KNB30TxPZBR/B8YlbHbc6+BXWFdaO18BVC+hJTftCT7yitQh+ey55IhwD0QjbqK
         VhEQy6jopBh4rUDM397UCxBxjV7SEATrJUfgqgvOvEXcLCc5h82ZhD74lUeBDdWLatuP
         KoTylRaA1/Ct2dFylssLzQ3mLOlxi+9AYqtNnhdNDQ7ZmLrELu5Ljunhul4lG6cP4BRa
         z7sciF4onkU28iGyBIbrVn9G8XjlPruckIHSfK/CCR8uesYWH4ju6gyaqyZo31QEsiIT
         Dugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511600; x=1779116400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HXK9Qgle7Puv113jAKFz7L/yq22PTO27vhn58OjsUZg=;
        b=c+0wWSsijGo+RC9SKJ/lKuNO9g6z/HXjr6mZmO9PSxfPO57pjHpkyv6pC9NefTzFTq
         nMuMFr+9dmdbD1vggToifmUY9lFwh1xxuwCErMSR6NdW5LLr7og8Hx/WWvPCD9AZgSUk
         YEbc14H9sP9LljTpUN5rIElUcQIFk6S4VbkKfENrapOvpprfMXtGSgT4aITf1uOD0TTe
         jbbB386a98KBvn3jz8Xl6bJvDo6ql12+dbNrH7thwe6e6SC0jY9Jr8BvkgZzxg17TQ1p
         y+cA0tWtb5gGr/Ar7Cs8aB+szU7gVyZ5fBdhw0YFcz0c1+sWUHb3VijmWlThaz0pc4p3
         sv7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9oSJMXF1FEe6N2xBd9OgFrip2v6nMI6dJAhhznKblu+L325RuOvap9YpDgb6il57dYWTLcphweLps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgWUqYvmaH9ZPaBvE8e5lnwa5HU1A0eYqvDmI5e3pxPlnrERm+
	QU4pD74VTNFCtB6M+n1eKDUC6oEc2K/xxMyboigZsLkk3kL0gfLu7Lq+a7I5Bjzhq65p8dj2Plf
	4GZo60Nuatd0qIN4vQg3FeBcmKz8F0yY=
X-Gm-Gg: Acq92OG5Gwu1PcfjmLdk7MXqmyyAy/ZZKjg2bA+yE+Omk+MjL3b4Of0uOrCXCx99aE/
	a0+i02RQg/bJgB68zYBRPk5SnLid1SJKck9XyGsLQJ1o0VAe9gy2To4NtCw2IMZLZZMI2KUpmkr
	+rzg68wRal0pEYoNGgRNqrej/JS7WaNj9B+szFiUkzZnnzyTsn6hiNyRDCCWfm+ZlX0QBSoKcOg
	i/YbqElRjmH6gCtmZAOMw4xI3tBRz9nc2OBGfdtPXUS//MJSIKyGfyoYSqHx42vU9UiBYxkmhdC
	oCaDHlsNrhtOaJQoIbf3kqIpNL7AKwqlfiYvCoqn
X-Received: by 2002:a05:6402:a587:10b0:66b:f527:c69d with SMTP id
 4fb4d7f45d1cf-67d63d8b66emr9561584a12.8.1778511599490; Mon, 11 May 2026
 07:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
 <tencent_CD11FE9B4A0B362E95E776C5F679598FAA07@qq.com> <24edd9d6-99f2-4d3d-83eb-69b406f4a9a0@kernel.org>
In-Reply-To: <24edd9d6-99f2-4d3d-83eb-69b406f4a9a0@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 11 May 2026 22:59:22 +0800
X-Gm-Features: AVHnY4JN-XJcvjTgr_FM1HBFd_31lstixyAZ5EE20tY16YbXFrjdSuhpS5x5o2A
Message-ID: <CAMgjq7Cokjb4-F9=cvwKmWR0q4==Vd61FHnjKbRdSHKH57erxw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] mm: swap: fall back to order-0 after large swapin races
To: fujunjie <fujunjie1@qq.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Baoquan He <bhe@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 9:14=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 5/8/26 22:20, fujunjie wrote:
> > swapin_folio() documents that a large folio insertion race returns NULL
> > so the caller can fall back to order-0 swapin. do_swap_page() currently
> > turns that NULL into VM_FAULT_OOM if the PTE is unchanged, which is
> > harsher than necessary and gets in the way of rejecting large folio
> > ranges for backend reasons.
> >
> > Move the synchronous swapin sequence into a helper and retry with an
> > order-0 folio when a large folio cannot be inserted into the swap cache=
.
> > Count the event as an mTHP swapin fallback before dropping the failed
> > large allocation.
> >
> > Signed-off-by: fujunjie <fujunjie1@qq.com>
> > ---
> >  mm/memory.c | 50 +++++++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 39 insertions(+), 11 deletions(-)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index ea6568571131..84e3b77b8293 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4757,6 +4757,44 @@ static struct folio *alloc_swap_folio(struct vm_=
fault *vmf)
> >  }
> >  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> >
> > +static struct folio *swapin_synchronous_folio(swp_entry_t entry,
> > +                                           struct vm_fault *vmf)
> > +{
> > +     struct folio *swapcache, *folio;
> > +     bool large;
> > +     int order;
> > +
> > +     folio =3D alloc_swap_folio(vmf);
> > +     if (!folio)
> > +             return NULL;
> > +
> > +     large =3D folio_test_large(folio);
> > +     order =3D folio_order(folio);
> > +
> > +     /*
> > +      * folio is charged, so swapin can only fail due to raced swapin =
and
> > +      * return NULL.
> > +      */
> > +     swapcache =3D swapin_folio(entry, folio);
> > +     if (swapcache =3D=3D folio)
> > +             return folio;
> > +
> > +     if (!swapcache && large)
> > +             count_mthp_stat(order, MTHP_STAT_SWPIN_FALLBACK);
> > +     folio_put(folio);
> > +     if (swapcache || !large)
> > +             return swapcache;
> > +
> > +     folio =3D __alloc_swap_folio(vmf);
> > +     if (!folio)
> > +             return NULL;
> > +
> > +     swapcache =3D swapin_folio(entry, folio);
> > +     if (swapcache !=3D folio)
> > +             folio_put(folio);
> > +     return swapcache;
> > +}
> > +
> >  /* Sanity check that a folio is fully exclusive */
> >  static void check_swap_exclusive(struct folio *folio, swp_entry_t entr=
y,
> >                                unsigned int nr_pages)
> > @@ -4860,17 +4898,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >               swap_update_readahead(folio, vma, vmf->address);
> >       if (!folio) {
> >               if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
> > -                     folio =3D alloc_swap_folio(vmf);
> > -                     if (folio) {
> > -                             /*
> > -                              * folio is charged, so swapin can only f=
ail due
> > -                              * to raced swapin and return NULL.
> > -                              */
> > -                             swapcache =3D swapin_folio(entry, folio);
> > -                             if (swapcache !=3D folio)
> > -                                     folio_put(folio);
> > -                             folio =3D swapcache;
> > -                     }
> > +                     folio =3D swapin_synchronous_folio(entry, vmf);
> >               } else {
> >                       folio =3D swapin_readahead(entry, GFP_HIGHUSER_MO=
VABLE, vmf);
> >               }
>
> There are some upcoming changes with:
>
> https://lore.kernel.org/r/20260421-swap-table-p4-v3-5-2f23759a76bc@tencen=
t.com
>
>
> All the of that logic you have in swapin_synchronous_folio() should ideal=
ly not
> go into memory.c, but into some swap specific code.
>
> But
>
> https://lore.kernel.org/r/20260421-swap-table-p4-v3-0-2f23759a76bc@tencen=
t.com

Thanks for mentioning this!

I think Junjie's change fits better after that change indeed. And I
checked the code, it should fits easily too.

It's already strange enough that THP swapin is bundled with
synchronous swapin, we better not make it more divergent here, and add
more bits into memory.c.

And this commit will limit it to anon, no shmem, which is another
strange detail. Or we'll have to repeat everything and copy these code
to shmem.c...

Once all swap-ins uses basically the same path as in that series, all
swap-ins will be able to have similar THP and zswap THP support too.
