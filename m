Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E850221FD4
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 01:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776044334; cv=pass; b=bzAju/S9BeEtsIe9z/LZ+o+9mk9X4l1tvOaZK9q8KRsKWupulyr3uAKezup0F+pL8y9lYyhTC8rOj/42L8z2okeG8IYRwvJYHlmBGB5rKDy+F18ErGQvUfbc8GWjtCUKNVRWJR7qYjF39iZ79PCBqOMwtEoS25wec7p5so7pseM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776044334; c=relaxed/simple;
	bh=MeZvaQLwo1Yi3CLdD755xqS+ZA0WcntRcM3F2Oty1LI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crasTgjh0cNyPsCKPB2Ob5jZsVLs6Dh0TZtUCTvnKAHuq2VkdcfPNiZjx3pCtYbFki7+ZuMmN56hrz3hfxKUQQtISmPFJKd/tKt/N22ZrMldcM8Yg2096ODaxgb/NmFFHElyRAuvZfWXC2JshB5YnoVLFPQgJvnpntYWqtPbpiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MwI2+FSc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=j2jlRzed; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MwI2+FSc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="j2jlRzed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776044332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/LczZPV43VeCs6q1pNCwBA1d/W1p8xMLArqty6Nu4c=;
	b=MwI2+FScWekLMA72L/KN3PUrP1U0loOHPyDhCbyFGG4OvsM5RD7+eDzidiUBurHGH7D/TI
	WSigbJ+rqY6/a4n2UnREGQ9J/a+eKDPKxv9EIG6XUH/4dP03I/SOC7WHuf5cejWzXPtde8
	GWxiCTtJI7PlFWrBTfVIMrZkWCHSO9I=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-TdcUCHbZNyaWvxOAG3cipQ-1; Sun, 12 Apr 2026 21:38:50 -0400
X-MC-Unique: TdcUCHbZNyaWvxOAG3cipQ-1
X-Mimecast-MFC-AGG-ID: TdcUCHbZNyaWvxOAG3cipQ_1776044330
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7b3635ae134so6085157b3.3
        for <linux-doc@vger.kernel.org>; Sun, 12 Apr 2026 18:38:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776044330; cv=none;
        d=google.com; s=arc-20240605;
        b=b7UyJ40tmhQPQuzIBxwwpsy+nDiQH0y59LoP6n0iHAmzSZYwJ6FRa0J3c6vtNc8Y1k
         bOcBSbcp43waTT/DEHodO3KodwIk8z1T3g4vpD7K+zw4yMV23xig0idBEKkFhpRPYqQ2
         Sf3tzH9uDVhc5UMyGyfEgtXPwpWT0EzIBmimAtfzAjoyCGK/bT7kgx7M9TA8SmTx2FyR
         jPufZ3leGR7KsqB0Wefu0MixJgOXo+AmWzHpjtO/MYDyRCsmmSYVYxpj7an6yq/Okr0t
         OXpL4H/Fyoup9uMqdGcZ0wlNq3nkXmCEohbbFtvV3bCOVoizpl6/aPXfwBAG/mjDUYLt
         ZxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U/LczZPV43VeCs6q1pNCwBA1d/W1p8xMLArqty6Nu4c=;
        fh=6RaaVIeCE6/BL0t/9ra50y4n0a2/2yi8jlZ7ENmcYGc=;
        b=d5wSirxRCn/+FESFNkptI9qp20wc49+yO77z9SEfqcgVu8ihs9WajBEMEldOqqBDbR
         AOCccpsjU8Sd/G3oow1Ytvec3DBSx1jIO54D6x91dwZhPlogvHrekwGrUUahAtWjIO5D
         QfzMn71oPlylErHynE13DavBFCJTdRck1DmKyzcLusz5JFxkJ4hLXqHUSwbI4naW2Eh0
         PUC332QXkGSLDF8y69/tl/38+1cY3fzT5y56IvuMYAubETrv4edWl/l0YGpji0q6xGn/
         qNflLj3VM1cITjYc/9e8MezgIXtGlLgoB7ISxqXgpizwPZZHO9Pwl65wnBE0aXy0lFd9
         VOww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776044330; x=1776649130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/LczZPV43VeCs6q1pNCwBA1d/W1p8xMLArqty6Nu4c=;
        b=j2jlRzedSENuaqdJ/ZeOya5uHEKUYJ/k3da8y9Lk2vIePkoceiARUzRgYD3yp0I9Dw
         UWC3JwFtEbmZO4P2gvxfU0bM3XkrPl0gWmYC+aMs20n1gGzLuXgG80VPyQih9Ys3d6Bv
         l3nrPeGDK+EVeJrgspmDtZKxAm7XYFJmyT8OdnkEEISe+gnfibw5kWqtxo6yTGk9Kn9/
         DWCA0DlSw2I7grjAQ5LGUp6lTRZLfuvMLZ1UqLCxrnYQUWzHa20eD1dN/1z22ZbbQ8ed
         tWhPKyRoGT/tFeqGv/3mCoj3BmK2u1/tmp+ohRSHNr1iN6ZQU051xOHcF932hgE2Sa2C
         lRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776044330; x=1776649130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/LczZPV43VeCs6q1pNCwBA1d/W1p8xMLArqty6Nu4c=;
        b=Ps+39jebrNrL8B6ar60dfF6y9Myyz0Mtbx6ULxiFvdjBSKSwie5hlL/r0daTMuQMBX
         qRYbUOJEWvaisu2Lutp1MM0J958fCaKcCGDA3OKL4EirqOvtlzmujItK2gkdIq2i1IA9
         uazXAbO/tdcCn6mY/LIaiMGlUYYXNHm48CF4b4v8Xo19zn49ekM+rdzDYIxQFtKIC/8x
         Lv91LDDcnBoZcoZ6yOL+YNmcpxUCnIKQieyohCrWEWjjAEl9qfHTqPt5j6/gIt1asN4Y
         MN4TrF/cQ0uW+FKe5mkSKOOLK4mIvow1JAHT0MdZeHl7do5iKC+Flx9iX2H1gKdk+16V
         IQHQ==
X-Gm-Message-State: AOJu0YyV/WQdAAzd+dB+ef2i227kqB1Ct0UgyoJtk9JjpoxH6ssJJ+pQ
	e75cdSg1hCck2MUXHk6aqXeKm7j61FA84T9iZ5ntueyp3IyHHtNaDyg+fkBHmsHdJfAJ4DEpnY2
	8/NMoMMRGjEojrYmcMs4YQbIjs5WF6l37WG6iTY2y6oTZwEkWabzJKZ08L4b2kJs0v1iZV6Lqpw
	xJ78QDP3qkrWRe0AI/kvgcugsEVoz1BQQ/NgQn
X-Gm-Gg: AeBDievKb7CYVXlTaWpO2WDBW+0fqN4+T7GT5PuEDeLuXOjlk9hay0+7GlLJ8vuXliH
	KRpy0Vk3SgPubHsvRLtbACyzRD4vXvUmrWbMKvj6gXLllZ1z7mNpsxbi7DMQxkhxmM6ewSRHa32
	OUVxM4sE5YtJI0NvctWfGp2WSQEJhufZ+cbCmmlEQhutwgBum1MDxtBi66LXrrDGnR/oJHDOAhT
	SjE9kbn
X-Received: by 2002:a05:690c:6987:b0:7b3:edc7:9b8f with SMTP id 00721157ae682-7b3edc7b61cmr1319387b3.0.1776044330319;
        Sun, 12 Apr 2026 18:38:50 -0700 (PDT)
X-Received: by 2002:a05:690c:6987:b0:7b3:edc7:9b8f with SMTP id
 00721157ae682-7b3edc7b61cmr1318877b3.0.1776044329838; Sun, 12 Apr 2026
 18:38:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226031741.230674-1-npache@redhat.com> <20260226032445.233437-1-npache@redhat.com>
 <94290ad5-f63d-4fa7-a898-dcfe6cd9998b@kernel.org>
In-Reply-To: <94290ad5-f63d-4fa7-a898-dcfe6cd9998b@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Sun, 12 Apr 2026 19:38:41 -0600
X-Gm-Features: AQROBzArl5XlylTlxjRxCzhfJiWfRtUhtNUooNt0wkSwTm8sXKprqqkTO6ix5Ns
Message-ID: <CAA1CXcDnz_7+16sDVbGJ2ZZPWxs7ta_Z0YU6x1dUe7yiSJ3OKg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v15 06/13] mm/khugepaged: skip collapsing mTHP
 to smaller orders
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	lance.yang@linux.dev, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, 
	mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, 
	raquini@redhat.com, rdunlap@infradead.org, richard.weiyang@gmail.com, 
	rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, 
	surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de, 
	usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 3:00=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 2/26/26 04:24, Nico Pache wrote:
> > khugepaged may try to collapse a mTHP to a smaller mTHP, resulting in
> > some pages being unmapped. Skip these cases until we have a way to chec=
k
> > if its ok to collapse to a smaller mTHP size (like in the case of a
> > partially mapped folio).
> >
> > This patch is inspired by Dev Jain's work on khugepaged mTHP support [1=
].
> >
> > [1] https://lore.kernel.org/lkml/20241216165105.56185-11-dev.jain@arm.c=
om/
> >
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Co-developed-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  mm/khugepaged.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index fb3ba8fe5a6c..c739f26dd61e 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -638,6 +638,14 @@ static enum scan_result __collapse_huge_page_isola=
te(struct vm_area_struct *vma,
> >                               goto out;
> >                       }
> >               }
> > +             /*
> > +              * TODO: In some cases of partially-mapped folios, we'd a=
ctually
> > +              * want to collapse.
> > +              */
> > +             if (!is_pmd_order(order) && folio_order(folio) >=3D order=
) {
> > +                     result =3D SCAN_PTE_MAPPED_HUGEPAGE;
> > +                     goto out;
> > +             }
> >
> >               if (folio_test_large(folio)) {
> >                       struct folio *f;
>
> Why aren't we doing the same in hpage_collapse_scan_pmd() ?

We can't do this in the scan phase because we are not yet aware of the
order we want to collapse to.

The scan phase builds the bitmap (if mthp sizes are enabled). I tried
to think if there were any similar checks we could perform; the only
one that came to mind is whether the current folio size exceeds the
highest enabled folio size. Is that worth checking?

Cheers,
-- Nico

>
> --
> Cheers,
>
> David
>

