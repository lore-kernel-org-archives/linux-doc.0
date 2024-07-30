Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C9518FC70
	for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 22:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722379056; cv=none; b=aTWcoMp81kwqjktjJV9y/xZnYkTE2e6v5l5P5hPmKMaIMNfrWNKdGhtUQrAJkyjvXarSd/HKCTBTQ8D49HvrY8c+QAOiSBdU0eXFNHW96wDSpfTWydQ0IIPwElFBaaURYm3eqwt/02WsDuO+4x3KtrP/aTeGe3w3jvmaGTuXBJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722379056; c=relaxed/simple;
	bh=E8eMTiJhd0Ye6PzjjjYVmgmN99KbTrswcdSCurXlsF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcCNSeqDnWvlzHNd0KAaJfrIr8I8RAR6NAM8tE2is+U7GNnjF7RfY/hsiM5rBM7LTkRooUWqAjxC2vnVXAnfrmN6O9uABpNLOavuPWVaj6FC0RYeZs631KKpI3zQ6DOSwWjL5HLxyMKlNmD5LGiNAPtfzVEOk2C0khs3lMF8I6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YvL1/4OI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YvL1/4OI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722379054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7E1BqsGKjEqQ6l0AIGJfqOuIv4xshIDsMPfwptgFsA=;
	b=YvL1/4OI9fuzHbZ1cyi2p1YwBLlWIFmwsT+idRxi8BZAYmJmUe0z8mzXOL2c/vGZSbVqgT
	KyvTgNbAjVapIAqOMO1YZGjPd0WtdX8DXndNRpmEU3fQvldVVt0lE1S0aaRE6kBoJxJEqJ
	G5nF8D4zi8LiOpvJszycp1T7ygTlXXQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-zR4CBVO9P9qtUML7H7Xa2A-1; Tue, 30 Jul 2024 18:37:32 -0400
X-MC-Unique: zR4CBVO9P9qtUML7H7Xa2A-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-65026e6285eso95964507b3.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 15:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722379052; x=1722983852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7E1BqsGKjEqQ6l0AIGJfqOuIv4xshIDsMPfwptgFsA=;
        b=eJHYiKVeSbJ1AkfQDbBS0yn5rX193tss06cdwqHBfgXp/AseRc3HJcvqmW+b3QbQBR
         8S/jfD0y9djnzepdlS2jwl9YRs0h0RdV/jtvLVbMR44zjkDt9uC2MWC3SwbfkybOafbI
         VMokN6a8caRx8lGo594xbn6SUWvcYXIL4o0V4f1VSNmYBJH9PrdSn1b2Ytk9Mi6zSi3t
         Ud2bnuaVMkBL6096nqaqlaq0MyDZVCfEqPjjLe4wcMozp/2Lp0eGaplK7S42sZR6B69F
         Dzca2v6DX4oO1msGsqTjVN1iH62tF8e/8Hl7PEtWqB9gb0wBI/EVjzPkcIHp9qbYeZhy
         oI2g==
X-Forwarded-Encrypted: i=1; AJvYcCVgLMzJpznBNIrWefr/w1kPQ8iEX82HXLKHaMLsfPizNjlEmGF60J4R+XB1ZezIQWyb4lEX+A21tdre45MgUKh/pQhy5V5o5rJS
X-Gm-Message-State: AOJu0YyPQMGOW1DTpBlIXrKaudbJX7t9ZqY8Szi6zqqCjmGy208sqfxx
	UCAFWzLX28y0gdrzB/jUY1YCYUJtN0hO9DVvPz6rVYvtiyRvjCxVxhNdHPVNyympDWSlSkpuwW/
	qrR+N+A8Xvn4n0hTjxyV4HEtSfMv+yfTqSpMPXlT8+tp6aQJL5ToMKdLNEPkARj+SbHEvkE9RnT
	DqaJaS+1iwHmzVjEvEztpB1KHzuJGdTADN
X-Received: by 2002:a0d:c885:0:b0:627:d23a:44ff with SMTP id 00721157ae682-67a053e0ec1mr139619187b3.3.1722379052004;
        Tue, 30 Jul 2024 15:37:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBo3GepYwO9ZNWghzq4hxO7KE522z6Icy+q1emIbleDAYd/B4Mw/pYiccytgB2gJ2Y4/Y8v90CRnnJIn0SDIE=
X-Received: by 2002:a0d:c885:0:b0:627:d23a:44ff with SMTP id
 00721157ae682-67a053e0ec1mr139619027b3.3.1722379051709; Tue, 30 Jul 2024
 15:37:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729222727.64319-1-npache@redhat.com> <72320F9D-9B6A-4ABA-9B18-E59B8382A262@nvidia.com>
In-Reply-To: <72320F9D-9B6A-4ABA-9B18-E59B8382A262@nvidia.com>
From: Nico Pache <npache@redhat.com>
Date: Tue, 30 Jul 2024 16:37:05 -0600
Message-ID: <CAA1CXcCD798gkLoZuz3Cd5-Wf2MRfnAG_EB0U3nbScZeFv09dw@mail.gmail.com>
Subject: Re: [RFC 0/2] mm: introduce THP deferred setting
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Barry Song <baohua@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Lance Yang <ioworker0@gmail.com>, Peter Xu <peterx@redhat.com>, 
	Rafael Aquini <aquini@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zi Yan,
On Mon, Jul 29, 2024 at 7:26=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> +Kirill
>
> On 29 Jul 2024, at 18:27, Nico Pache wrote:
>
> > We've seen cases were customers switching from RHEL7 to RHEL8 see a
> > significant increase in the memory footprint for the same workloads.
> >
> > Through our investigations we found that a large contributing factor to
> > the increase in RSS was an increase in THP usage.
>
> Any knob is changed from RHEL7 to RHEL8 to cause more THP usage?
IIRC, most of the systems tuning is the same. We attributed the
increase in THP usage to a combination of improvements in the kernel,
and improvements in the libraries (better alignments). That allowed
THP allocations to succeed at a higher rate. I can go back and confirm
this tomorrow though.
>
> >
> > For workloads like MySQL, or when using allocators like jemalloc, it is
> > often recommended to set /transparent_hugepages/enabled=3Dnever. This i=
s
> > in part due to performance degradations and increased memory waste.
> >
> > This series introduces enabled=3Ddefer, this setting acts as a middle
> > ground between always and madvise. If the mapping is MADV_HUGEPAGE, the
> > page fault handler will act normally, making a hugepage if possible. If
> > the allocation is not MADV_HUGEPAGE, then the page fault handler will
> > default to the base size allocation. The caveat is that khugepaged can
> > still operate on pages thats not MADV_HUGEPAGE.
>
> Why? If user does not explicitly want huge page, why bother providing hug=
e
> pages? Wouldn't it increase memory footprint?

So we have "always", which will always try to allocate a THP when it
can. This setting gives good performance in a lot of conditions, but
tends to waste memory. Additionally applications DON'T need to be
modified to take advantage of THPs.

We have "madvise" which will only satisfy allocations that are
MADV_HUGEPAGE, this gives you granular control, and a lot of times
these madvises come from libraries. Unlike "always" you DO need to
modify your application if you want to use THPs.

Then we have "never", which of course, never allocates THPs.

Ok. back to your question, like "madvise", "defer" gives you the
benefits of THPs when you specifically know you want them
(madv_hugepage), but also benefits applications that dont specifically
ask for them (or cant be modified to ask for them), like "always"
does. The applications that dont ask for THPs must wait for khugepaged
to get them (avoid insertions at PF time)-- this curbs a lot of memory
waste, and gives an increased tunability over "always". Another added
benefit is that khugepaged will most likely not operate on short lived
allocations, meaning that only longstanding memory will be collapsed
to THPs.

The memory waste can be tuned with max_ptes_none... lets say you want
~90% of your PMD to be full before collapsing into a huge page. simply
set max_ptes_none=3D64. or no waste, set max_ptes_none=3D0, requiring the
512 pages to be present before being collapsed.

>
> >
> > This allows for two things... one, applications specifically designed t=
o
> > use hugepages will get them, and two, applications that don't use
> > hugepages can still benefit from them without aggressively inserting
> > THPs at every possible chance. This curbs the memory waste, and defers
> > the use of hugepages to khugepaged. Khugepaged can then scan the memory
> > for eligible collapsing.
>
> khugepaged would replace application memory with huge pages without speci=
fic
> goal. Why not use a user space agent with process_madvise() to collapse
> huge pages? Admin might have more knobs to tweak than khugepaged.

The benefits of "always" are that no userspace agent is needed, and
applications dont have to be modified to use madvise(MADV_HUGEPAGE) to
benefit from THPs. This setting hopes to gain some of the same
benefits without the significant waste of memory and an increased
tunability.

future changes I have in the works are to make khugepaged more
"smart". Moving it away from the round robin fashion it currently
operates in, to instead make smart and informed decisions of what
memory to collapse (and potentially split).

Hopefully that helped explain the motivation for this new setting!

Cheer!
-- Nico
>
> >
> > Admins may want to lower max_ptes_none, if not, khugepaged may
> > aggressively collapse single allocations into hugepages.
> >
> > RFC note
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Im not sure if im missing anything related to the mTHP
> > changes. I think now that we have hugepage_pmd_enabled in
> > commit 00f58104202c ("mm: fix khugepaged activation policy") everything
> > should work as expected.
> >
> > Nico Pache (2):
> >   mm: defer THP insertion to khugepaged
> >   mm: document transparent_hugepage=3Ddefer usage
> >
> >  Documentation/admin-guide/mm/transhuge.rst | 18 ++++++++++---
> >  include/linux/huge_mm.h                    | 15 +++++++++--
> >  mm/huge_memory.c                           | 31 +++++++++++++++++++---
> >  3 files changed, 55 insertions(+), 9 deletions(-)
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > Cc: Barry Song <baohua@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Cc: Lance Yang <ioworker0@gmail.com>
> > Cc: Peter Xu <peterx@redhat.com>
> > Cc: Zi Yan <ziy@nvidia.com>
> > Cc: Rafael Aquini <aquini@redhat.com>
> > Cc: Andrea Arcangeli <aarcange@redhat.com>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > --
> > 2.45.2
>
> --
> Best Regards,
> Yan, Zi

