Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917EC35A390
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772138895; cv=pass; b=gGv3kSVRDpvTaK51bhhQD1ThAJs3XNqApKEhZOIGtKBh7k9ffv3zYn4qzjsv5Vsh6Fby8/WuGTIFE8DqpYrTJv0YN+PYd+dPMVpjqb1VcyqkHLgwaFTGHWqlS3e0bna0WCYaMbSN7RPl8Sx2wT20XL7s4+QOOHeSwCViOk3zG2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772138895; c=relaxed/simple;
	bh=pGelGEWoARZEbYWVtNHAIN0oEiqW0sUUQSCnGat00B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sG29N3u4A+7vsIEZWz7lzSLnTdRDlqa0+h7jN8YbzLOlXiEc8EiOfnOb1ef6VLHwiJpC9v33zohzli0EK2bxcquALyYNpDmWW4W3/IZOCkqyVoixbnZttsBI/GfVuGD6l9NA8nBcXmdj9DbQiStE0ixm38UwIDk/FRDeDMnb7t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FAPpkHye; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=d91UWEoK; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FAPpkHye";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="d91UWEoK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772138893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DBGoyglCoH58OEzLS/UrEve2JlXeuQURn1O9kwrT3LQ=;
	b=FAPpkHyeOTu03lXk8Qcc931Rj8bvst9PsLdU1FpUGgWBqiTTfL6i1a8aL77m+cAdLIBk7X
	tO/+gBWl2F8XenYIdO4Vpm3HKZQtfHptSNU5eBvKwJK8eXiA6A3JzpXw9OamFjvoDc5L3P
	g7uLQ0S8FZCvnhOBJEO9B9pt43SIq4Y=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-SjFLOYQ6NviZfU4XlCQJUQ-1; Thu, 26 Feb 2026 15:48:12 -0500
X-MC-Unique: SjFLOYQ6NviZfU4XlCQJUQ-1
X-Mimecast-MFC-AGG-ID: SjFLOYQ6NviZfU4XlCQJUQ_1772138892
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64ca09f2064so1982971d50.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 12:48:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772138892; cv=none;
        d=google.com; s=arc-20240605;
        b=Ka/lrUIU/4iDPyHBUnXgdNfJSmX0bfIckGfoTrDNiR1ZHRcaguSBeHBx5rjHZY1wNm
         rd1KnrFvMHGE8lNJCE5nO2ts59eJBmMR43SjUswXegWrpDQuYJ+tSk1784Pagk88s29l
         57kilD+MGYNWdeJzpI4xSBXgVsSq3U0dTHcLi34kPQI9G03sBiZlXBQnkBK3vqqcWo75
         sB1ZtkcxVZ/zBghF6ayFWIhhfBPPaPNxwFPB2n8sfBCEWypzW98tASK8YKZJSN5Dwjb6
         d500xlRk7g68CxAZ6rMeG3xMNW6dWJwpjTpXK5MphRCaq/ncG7zeVd8iwnIhAzZFXo5d
         MzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DBGoyglCoH58OEzLS/UrEve2JlXeuQURn1O9kwrT3LQ=;
        fh=0bN9RU41EthfMrqRdgKzBCPhByXS3vVd3APWu3Ng7yM=;
        b=XAkvzsXJLmosdBAZkua37MoPG5FGLje7xGoLrqyLCSrhSDqNvT15YiCsaK7POYlt02
         HBJbQPcd/VnDboxoDKhIc+evV+ZClB41FTUyP7EJ1Nm79SZKiwsp/Q7vQu2IQuGPpP0D
         LyRtPsvWuOh3rhCFcIg+kRM401SjStUsQhoOnJ679uT44AeL2MRCd9m7IK1x4cY59Urq
         8bzqNtOErD/dQyiRxdRWuD718BprR86MA7SNRNGkPOOdPTw3W1Z4RvjYz5PFyUMpcVOV
         Q9KBaX8rLcRxnVwmJK97kwAxq0/bVnEDRs2QEbvjrsTwbaibErwnQuAAHQlqLqD2I/iR
         5Nwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772138892; x=1772743692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBGoyglCoH58OEzLS/UrEve2JlXeuQURn1O9kwrT3LQ=;
        b=d91UWEoKtF9SUylFgF73Fsx5aNK/B4alWifOOVSojC7up7MeJyMg2iiT4k9vQx3gD/
         InCDpXTB8QcYpfUcGjeWevamBwj8WFBgbXYHoR7RQNXaQhNN+plnE9WnSfr8L4olr77p
         +c4jJlEuL7QqbEeUMZPiTQahhof0SNClljCKOl/jWOGPhDqb1yfI7nAAGKVuyyeuCQPG
         R/WJNIFpQynSdz/5TXbKg6D7mZskFl7csEhKlN7E4p8pUFRha7cY34whx4M+8xzVj9Qu
         e0kNmxdIEhnJ36ORBb81SkGijlJ6tjCRe4Oh7xuctLSQtPzcEs3jQQkCUE/P7T1AInuA
         viqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772138892; x=1772743692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DBGoyglCoH58OEzLS/UrEve2JlXeuQURn1O9kwrT3LQ=;
        b=v0c6ZeXS+8dII2yLYOEu0vBxc1L8p9E4ggthC/YSOwJNqzF6yUfkN2TL+XEmvncQ48
         9dLqKk5cJTcV1KAks/jddtqHyUPVYXb2HypDAeaaUGRDqSk0zEv/Rm63P4mm/aeG9S3i
         foeKMr+q/+VAjbxT1XmVhqlMHIp6Tzic+lLUGzIGbEyvEaSTYKYTdaSnBX9BTBXuqXw0
         NEkO1O28gn2PywJNBh5or7O/arDum18s9y4b6iR9kGyR1VE0w6ztVvkU9NA3LD6jmaat
         HCXq/ODcQf0N2cTNVMHNJB9uDdqyhMhJL3yHrUIJy9pMd7fSLIm6GQYnOBbb6+Gz6eGV
         qX6A==
X-Gm-Message-State: AOJu0YxdztBQKUxbILf2rDnVTq5iNbVgcrgU8JvFlXUWj/wWppyFzylt
	6qscUS+4UC3hNER5In7XXBxZGwPMyPKfwC9SZCq3qcZePylh8zkYY8YXJbqOaREuSdNyiaLbSBl
	OkDWHFJdRSngvL1r+N7ZV/kVg06c80RwGT9D+HJIMHYedWgTlIRmH7JMSNOrc5lW4ugwN7cshou
	o2ySEJExRpFko7dNujeFpd/wMmNW/k4UhHnf0o
X-Gm-Gg: ATEYQzxEhE4hWyEOvlBmaPP/nP7SLpafgzdf81gZJa9fWH1zQvyX7600ZOQJuD70GGW
	PcGm2gmqCPNuaFYbCsfuY1MN9IbbObTdhwei3wseInmIBJ1S/m7NPMZQ/kXauDct8ljsbdDHYlj
	1ktUPsmlCflW0u7k7QTZi7BPzz0al+aXtsPdKcpZwQ/kqX6yc6TzwnkIA+HGGv6Yw0PmyKeAlyG
	36L
X-Received: by 2002:a53:b3cd:0:b0:64c:21c4:d017 with SMTP id 956f58d0204a3-64cc23040bdmr466140d50.78.1772138891667;
        Thu, 26 Feb 2026 12:48:11 -0800 (PST)
X-Received: by 2002:a53:b3cd:0:b0:64c:21c4:d017 with SMTP id
 956f58d0204a3-64cc23040bdmr466079d50.78.1772138891111; Thu, 26 Feb 2026
 12:48:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226032631.234234-1-npache@redhat.com> <20260226162653.3802758-1-usama.arif@linux.dev>
In-Reply-To: <20260226162653.3802758-1-usama.arif@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Thu, 26 Feb 2026 13:47:45 -0700
X-Gm-Features: AaiRm52157O9qaaRKfnMN5AsfoDvaP_wlb8rkPZ8cTI77RXDfAxJaKiPZ96ZOHw
Message-ID: <CAA1CXcCwXAn8uSidF52o=PBUUY-JwT14U70yxtMuUX=iQqRaPw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v15 11/13] mm/khugepaged: avoid unnecessary
 mTHP collapse attempts
To: Usama Arif <usama.arif@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com, 
	gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, 
	jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev, 
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, 
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

On Thu, Feb 26, 2026 at 9:27=E2=80=AFAM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> On Wed, 25 Feb 2026 20:26:31 -0700 Nico Pache <npache@redhat.com> wrote:
>
> > There are cases where, if an attempted collapse fails, all subsequent
> > orders are guaranteed to also fail. Avoid these collapse attempts by
> > bailing out early.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  mm/khugepaged.c | 35 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 1c3711ed4513..388d3f2537e2 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1492,9 +1492,42 @@ static int mthp_collapse(struct mm_struct *mm, u=
nsigned long address,
> >                       ret =3D collapse_huge_page(mm, collapse_address, =
referenced,
> >                                                unmapped, cc, mmap_locke=
d,
> >                                                order);
> > -                     if (ret =3D=3D SCAN_SUCCEED) {
> > +
> > +                     switch (ret) {
> > +                     /* Cases were we continue to next collapse candid=
ate */
> > +                     case SCAN_SUCCEED:
> >                               collapsed +=3D nr_pte_entries;
> > +                             fallthrough;
> > +                     case SCAN_PTE_MAPPED_HUGEPAGE:
> >                               continue;
> > +                     /* Cases were lower orders might still succeed */
> > +                     case SCAN_LACK_REFERENCED_PAGE:
> > +                     case SCAN_EXCEED_NONE_PTE:
> > +                     case SCAN_EXCEED_SWAP_PTE:
> > +                     case SCAN_EXCEED_SHARED_PTE:
> > +                     case SCAN_PAGE_LOCK:
> > +                     case SCAN_PAGE_COUNT:
> > +                     case SCAN_PAGE_LRU:
> > +                     case SCAN_PAGE_NULL:
> > +                     case SCAN_DEL_PAGE_LRU:
> > +                     case SCAN_PTE_NON_PRESENT:
> > +                     case SCAN_PTE_UFFD_WP:
> > +                     case SCAN_ALLOC_HUGE_PAGE_FAIL:
> > +                             goto next_order;
> > +                     /* Cases were no further collapse is possible */
> > +                     case SCAN_CGROUP_CHARGE_FAIL:
>
> The only one that stands out to me is SCAN_CGROUP_CHARGE_FAIL. memcg char=
ging
> of higher order folio might fail, but a lower order folio might pass?
> That said, if the cgroup is that tight, continuing collapse work may not
> be productive.
>
> Acked-by: Usama Arif <usama.arif@linux.dev>

Thanks! IIRC, David and I discussed all of these off chain to confirm
their placement. I had this in the 'next_order' case at some point and
David recommended it to "fail" for the same reason you state here:
collapsing or charging large order pages in such a tight cgroup is
likely unproductive and not worth the effort.

In contrast, SCAN_ALLOC_HUGE_PAGE_FAIL does not necessarily indicate a
resource constraint, but it could. We might fail to allocate an N-page
size due to fragmentation, but we could easily find an (N-1) size. We
could also have a scenario where a lack of memory causes the failure,
iterating all the way down, which would be unproductive. However, at
that point the OOM reaper should be active and the system will already
be cornered in multiple ways, so it should be ok.

Hopefully that gives some insight into the decisions made here :)

Cheers,
-- Nico

>
> > +                     case SCAN_COPY_MC:
> > +                     case SCAN_ADDRESS_RANGE:
> > +                     case SCAN_NO_PTE_TABLE:
> > +                     case SCAN_ANY_PROCESS:
> > +                     case SCAN_VMA_NULL:
> > +                     case SCAN_VMA_CHECK:
> > +                     case SCAN_SCAN_ABORT:
> > +                     case SCAN_PAGE_ANON:
> > +                     case SCAN_PMD_MAPPED:
> > +                     case SCAN_FAIL:
> > +                     default:
> > +                             return collapsed;
> >                       }
> >               }
> >
> > --
> > 2.53.0
> >
> >
>

