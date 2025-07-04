Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A827F9
	for <linux-doc@vger.kernel.org>; Fri,  4 Jul 2025 04:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751602833; cv=none; b=HV73YoRE1mQp048PHtou6cboC8xbvBSJYrPmOflNzYfn/z4PnyGqTHOJGX8ReyoUFofjgx8ApL6irq+E9Zbqk82llXJHy73bf5Y6aPSf+V5rLUZyQAW3JCefrMQROiLRMVishZKmdG8UMwCyh+YmMjnT8nQ8Igxbpky5qayqgzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751602833; c=relaxed/simple;
	bh=NoT+4FNbSjwBg9rFgnrMI3Kmfnm6Tizyg7BbQeMGDT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mwDN3c98j6qTgHgrwkkq3NsdyZ+Z0lC+cBLNPfvvlxsYY6+UD/mTOPhjM8T4maom6UDpO2TwsABQhshpi3e/lrN0DtePa2NWAEIhLFA1afj6zlWwKguVirHx/wdrdmmybwOuffu5lvZHLnN4qkM0zOdqTjHgCZeopZxYyFnVmDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dT/iaYUN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dT/iaYUN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751602830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JYMNYv3akYsSWq5hIrlEh3zSlZe35V5o/c+Z5lpwL/g=;
	b=dT/iaYUNSvNXprAqv4HHKH+iejk3ghHxz1UaF9l/wvjsxqTzoTR24JAJ6crMLHjr9JHsLG
	1aDSy7+BtRLtgnq7t+/hvomvuPt7V/nsl3J5i0UYA0Jg45XcOgc26Gtz8BW5Exnd/a2xCC
	rIJzdzxJOXImNIcCd50BuWNR59scG8Y=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-wyZhJJxvPKGWjUIb050cGw-1; Fri, 04 Jul 2025 00:20:28 -0400
X-MC-Unique: wyZhJJxvPKGWjUIb050cGw-1
X-Mimecast-MFC-AGG-ID: wyZhJJxvPKGWjUIb050cGw_1751602828
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-70e2d495194so6070147b3.3
        for <linux-doc@vger.kernel.org>; Thu, 03 Jul 2025 21:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751602828; x=1752207628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYMNYv3akYsSWq5hIrlEh3zSlZe35V5o/c+Z5lpwL/g=;
        b=T4vsCdGyPMlwjwUhpssY1q4kPnBB/gpW77fafTCAguNf7Rzg9TyZO+KYYNVgLWP+Wm
         c9fIaK9S43GWiZGzYC2yA/DNKlEIVdswmhh3hJTwttlOvjtCD7zjZubDv9g2usXbjnas
         5I38sLV4bASnp3S+OnwS+35igoNF1qm9rvL4u36EMvW+OhdKCTVDJAJ3w3vEHATbqN38
         05WHBd9EXegcvdXShP4Sbnb7aidBOttU6WPSKsIFZnHQDI7cVnmHTSIQknOTsNvtv9WL
         U+Wzl5RX5X+C6OKE3CvYe2fyc5Y7KORmnHpc5U17jB5S8DAcIScMjc7sA7KH3daOld1t
         JL9A==
X-Forwarded-Encrypted: i=1; AJvYcCV2EcNgcB/ZJc7vTMPnTexmvw2PU0KZDMYK8ZD/hPjljEuaXz3CP7vwz7XsT5L6IqjmPkjUSp7vVBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuEj2rrvdcwPcgDCYsD0QgwKxmjwsypC+PyhVgESaE0sichGhV
	2vfDZytVl1JEJJPAudUm5ABYWs7PQ2P8FUTHiWQEj6mm8gzP1XhGDYbWOuq66XaLBjKAWE002N8
	T0RdW61fmYCuDbP2hLCBlvPdeKUrJBgeZphTWt3PTEZ8Pdofw5FfYIUymUNOoCP5lUWOWuC2fNI
	CBZLnMyRv6DidU5pVFkmVC9tvJP0QfNiRuEwDotY55/Ik+FnM=
X-Gm-Gg: ASbGncvxp+e6WCzQ04/3fXn+7dXdwioMWSUzJFtdSzwXMZ0mUP4wh833iw78UPNzkTx
	W58xBYmiXZH7hb5J9/3nKUqI+aCC457XcqmsCLkdTtyK7lkzLmc1P5PtLZaeKJpgPYdlcbUYJu4
	vUSoNj0Q==
X-Received: by 2002:a05:690c:315:b0:70e:7ff6:9ff3 with SMTP id 00721157ae682-71668d48d52mr14813647b3.35.1751602827895;
        Thu, 03 Jul 2025 21:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpWlttfaGVsemdXIFRiuyrfeV4wU2Oua20HKATYd8vQpxrAJPi7JNRE9ipCBD5L0WC9KAT+/YYm56OkcAzJRs=
X-Received: by 2002:a05:690c:315:b0:70e:7ff6:9ff3 with SMTP id
 00721157ae682-71668d48d52mr14813187b3.35.1751602827474; Thu, 03 Jul 2025
 21:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702055742.102808-1-npache@redhat.com> <20250702055742.102808-3-npache@redhat.com>
 <ca0d8c87-2998-48f8-bef6-3e99a92f28e4@linux.alibaba.com>
In-Reply-To: <ca0d8c87-2998-48f8-bef6-3e99a92f28e4@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 3 Jul 2025 22:20:01 -0600
X-Gm-Features: Ac12FXx0uN0QDJdFTa4DutceQ0LVRzGL8hH9npRx5BwNbhAuyhn2wB7v9-pBvwk
Message-ID: <CAA1CXcDH5xTSGHJu13Gb3EfNnntKwQn6Oq6rhS5uFoyLwid0Jw@mail.gmail.com>
Subject: Re: [PATCH v8 02/15] introduce khugepaged_collapse_single_pmd to
 unify khugepaged and madvise_collapse
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, baohua@kernel.org, willy@infradead.org, 
	peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com, 
	sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 9:51=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/7/2 13:57, Nico Pache wrote:
> > The khugepaged daemon and madvise_collapse have two different
> > implementations that do almost the same thing.
> >
> > Create khugepaged_collapse_single_pmd to increase code reuse and create=
 an
> > entry point these two users.
> >
> > Refactor madvise_collapse and khugepaged_scan_mm_slot to use the new
> > khugepaged_collapse_single_pmd function. This introduces a minor
> > behavioral change that is most likely an undiscovered bug. The current
> > implementation of khugepaged tests khugepaged_test_exit_or_disable
> > before calling khugepaged_pte_mapped_thp, but we weren't doing it in th=
e
> > madvise_collapse case. By unifying these two callers madvise_collapse
> > now also performs this check.
> >
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 95 +++++++++++++++++++++++++-----------------------=
-
> >   1 file changed, 49 insertions(+), 46 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index f27fe7ca9b86..bf69e81a3d82 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -2354,6 +2354,50 @@ static int khugepaged_scan_file(struct mm_struct=
 *mm, unsigned long addr,
> >       return result;
> >   }
> >
> > +/*
> > + * Try to collapse a single PMD starting at a PMD aligned addr, and re=
turn
> > + * the results.
> > + */
> > +static int khugepaged_collapse_single_pmd(unsigned long addr,
> > +                                struct vm_area_struct *vma, bool *mmap=
_locked,
> > +                                struct collapse_control *cc)
> > +{
> > +     int result =3D SCAN_FAIL;
> > +     struct mm_struct *mm =3D vma->vm_mm;
> > +
> > +     if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
>
> Seems you still forgot to drop 'IS_ENABLED(CONFIG_SHMEM)' :)
Hi Baolin,

You had me questioning my sanity for a moment because I SWEAR I did do
this! but now I see the issue, I accidentally merged the fixup into
patch 6 (not entirely sure how or why I would have done that given my
notes say it belongs in this patch...)

I'm sorry about that :< I'll see if I can work with Andrew to get some
fixups into mm-new (this was merged a few hours ago) for this patch
and patch 6.
>

