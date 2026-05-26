Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708BC37EFF3
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797229; cv=pass; b=SP7W5EfuRg7iS6NKolbzOTXW6KPXWSuVufE+bDaGi0gl7x3moSI+zEZeBpNhv8VFP0av1zu5AO3OUJDBxA/+jUqc45pjXkpLQaDtpdb6ifBLyUthMRXcQHxKoz5+n1nTnP1aBWRdaM1VsNwnRP7wEjJSN2R56zSZPUoqLynFGps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797229; c=relaxed/simple;
	bh=gjn7irxVASWEua9zhhchtRuYD5Juo9ZV38SI3YWleII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6YbLJREveNb31DeevtCiqd+r7pG36hRRsZerNu2+LcDqCD1xEOXSfpYV19dh3p0U1dh+q0oeP+3hP2lzZHSwkTx8IWgnvFVYhGTFlvXgCYTkEs0aSE+pRaSa8Y7i7q6oyQu8tEMv9UVy5ahDevRiAmEJ/Pmlp38SIQq+1QweoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HVfLzUdF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tIhrCdXC; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HVfLzUdF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tIhrCdXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779797227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eiAFrFRbjd4+RPbTvUUvKWoOw3SyaKiqWrxbSKz7lDc=;
	b=HVfLzUdFsXzTQaZXilIzZ6HO3cqMnKiyJksV14dvWzuCh/5s5snF7PBsabi/ExVLhj8Uvb
	lTt7PWF41tJKTXkORP5r6PzKmTFg2Bf1NaKPRwPpkjpxjdoPHT01RumLBRxFOo1uw3n6qQ
	IqZxkBPQsxniKdseE0JHY8yPuO81sOU=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-Ja8lapiPNQW9ei79iWpDkQ-1; Tue, 26 May 2026 08:07:06 -0400
X-MC-Unique: Ja8lapiPNQW9ei79iWpDkQ-1
X-Mimecast-MFC-AGG-ID: Ja8lapiPNQW9ei79iWpDkQ_1779797226
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7c9e610f273so126860857b3.0
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 05:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779797226; cv=none;
        d=google.com; s=arc-20240605;
        b=VExPinMXW2rsYntfvvRqMzUalsYRvdn4XxCDLnjRkSrsu+Qagm+QlVe/pL4cn/ZpBM
         HRRNBx6EYO/M/MqphVSLea1ZaDZz57o/eWHRT+FVnsPx5Rkem772iF/C3ER/OE+jkOGn
         l6XhboZU9DywMdfjbv1rROALI24A2jarlIHIkBKLDwb9d+qNKRK7+XNXDVrWzSBkThO8
         wnY943GWONDJWQtPPr4EnziS4nZVgsAA1vhLrfHwyTV7F5+IEN9ndMEA2ZkxFrxbpIUH
         tbhVpwN3KsmfF+hB7mAMblQ8Aq/vmFp9r6mY+979Rl2mPnMPtHBxpOA8dU2Jd5ORsq8v
         KCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eiAFrFRbjd4+RPbTvUUvKWoOw3SyaKiqWrxbSKz7lDc=;
        fh=p4K4+c0vJsWIvxEOYDBUxHusLdHnQEh7UVBZLcu2eqs=;
        b=M0I9BLcCMhtdqgO26Ypyjhjc5WoGJ63OU73PcZVKdZgGLrnEmIjAMnDw+dV8yO9Z+U
         toiQac54i0HaqAB9m5RK4cMZdTiGV106azLvT5DxqYLs7SclDkSZmtCYZ7HOGFHyTX5K
         y7fvvw3+9jYuImIkJtItJFD7Bmhk/NkGWFZm9paQrdqF1YUQXSpBL7/71XCzH5zJ/3SQ
         dzrjBIw9P78DdVR/GGY89p3XSG5wS4wV06ZVF7X2Px595P2JVD4zeK/LanKvPbOpmQvg
         X0A4uIuJ/dbPj1jcYcTJ7UANf5GSwZ/sU3F+KH2iTemxqsfg/mHlTfXHn5GDFfrAiRVE
         mU0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779797226; x=1780402026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiAFrFRbjd4+RPbTvUUvKWoOw3SyaKiqWrxbSKz7lDc=;
        b=tIhrCdXCQn4s/fOG4KJdAdtisaWygfNkyvkwGOr1BurSDyL7p+w/4aRLgRER/POXmd
         U4Fho3FL1jY6yWzPO6LQWDQ7BQ26wqT/ao9Em+fDWlJQkikqntp1VPVv02HQEVoBULLQ
         W8PBwmYObmfzliVzab/nY/OGaJ5ydGIe/XciZRd5+KGF/uUSBdJFcPxfSuSVWZZemMHd
         UpMdm9XDcaDcfIYLeBtOelRRDHOaO92Hv1swFSknH/MZtfGeUJT/Hab/CXjyvXZAbDAB
         6tm8/2jtFow8dHIX15I5y5C4AiYZmBBI8WGIyvTqaoYTTDLTLOMlsH6O7w1Yh9XA+RJ9
         Lj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779797226; x=1780402026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eiAFrFRbjd4+RPbTvUUvKWoOw3SyaKiqWrxbSKz7lDc=;
        b=WwNDlvGTQyb/+000T7efXsPwgs7xOI+jhxrh5JTQFnbdzlAcmxfGenaeyATNbloHFh
         7jRtkGk2HtYBp5nJg/aRNK1EfnTt4dDnZYntYMaIMRbhUm6AgFSsdiM/0pRon1LRJBvY
         DpaKHyd2xXUVPvTYvuU42QtVQVbOlSQcSBrvsypdPDNO2MYhXb7BmosFuwaIKQ3SHWFb
         hdT5BAXsV5UQEBaWFkCRA+BvNVCBnqP6pQawPQkAHNzNBOX1Se8eydWTEkD22D1KVtN8
         eSLdWTfys/IJWZhbYt2y5LYLj2eAzY3fwf7hePF83PT+JayCq6YyZ97OjT2kX3bYQISr
         hvDA==
X-Forwarded-Encrypted: i=1; AFNElJ9r5liigdz/WY+zSoUSeX6tW/ONHRHb3nedikLIIc09ZaQdP9eR986LLmOe0uKXkrBH4OAtipyj2TM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1d/P1UNRZcCRUCod55Pbt6HPWAhRfXhZMsgUTUoa4Q+t7A7J
	o6Rcj0yqxe/NTerZvNHYFsmvgI8up0sI0okHsdfJ1swJ5kezAgpTiAgS8FF2rUrxiklyq4N++hE
	COk7KUANdDvCW4Tc2fDPK4tmQOrbgUZ8NB9sK2Iy8Ryu1iB9F23vV/hhofCcjK+lLaX2PyMNrXA
	bd54F6Qv3plbu/CrEeMW8PfS+dYNKLiL91ns2L
X-Gm-Gg: Acq92OEDVHR3+I+/kJC5CF2gAAudSKTBw29KMf1OOcrkD/ocURsMspE5LJ8CS/hOtad
	uK6KGNRx1jTGwJdby2ebP9MYZ4VbwUhAo+2HO9Nqsd9dPg6FJOeNnYmFKjevqCptMVMHkffIJn5
	rF0CB5wOfxTlG8CMA2r/9FFnRYVXmT6/0mzrIocMHGH0PMvOMIeNxECBkBFAAHzldH6fMw0BPHF
	/QapdHjv5fcubT7
X-Received: by 2002:a53:ac94:0:b0:65c:4a37:3975 with SMTP id 956f58d0204a3-65eac8ffbe6mr17560439d50.0.1779797225561;
        Tue, 26 May 2026 05:07:05 -0700 (PDT)
X-Received: by 2002:a53:ac94:0:b0:65c:4a37:3975 with SMTP id
 956f58d0204a3-65eac8ffbe6mr17560402d50.0.1779797225094; Tue, 26 May 2026
 05:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-1-npache@redhat.com> <20260522150009.121603-12-npache@redhat.com>
 <2b2cda8c-358a-4a5c-989c-ae42593ef2ea@redhat.com> <20260525121041.2f2508a4f627c338cddd837a@linux-foundation.org>
 <20260526065708.oyyddmt2zgfwu2q7@master>
In-Reply-To: <20260526065708.oyyddmt2zgfwu2q7@master>
From: Nico Pache <npache@redhat.com>
Date: Tue, 26 May 2026 06:07:38 -0600
X-Gm-Features: AVHnY4JcK8OmA0BDu7BZOR--WqtBBKWM2GWs1qml7WVs0MOjDwCnB55pWKWIb9o
Message-ID: <CAA1CXcDXyDhMyiVAb8XbusqMU10JXA8nOUw6b4_2i9H-kV2vwQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v18 11/14] mm/khugepaged: Introduce mTHP
 collapse support
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	anshuman.khandual@arm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, byungchul@sk.com, catalin.marinas@arm.com, 
	cl@gentwo.org, corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jack@suse.cz, jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev, 
	liam@infradead.org, ljs@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, rientjes@google.com, rostedt@goodmis.org, 
	rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 12:57=E2=80=AFAM Wei Yang <richard.weiyang@gmail.co=
m> wrote:
>
> On Mon, May 25, 2026 at 12:10:41PM -0700, Andrew Morton wrote:
> >On Mon, 25 May 2026 08:15:53 -0600 Nico Pache <npache@redhat.com> wrote:
> >
> >> Can you please append the following fixup that reverts one of the
> >> changes requested in V17. The issue with the change is described
> >> below.
> >
> >OK.  fyi, what I received was badly mangled: wordwrapping, tabs messed
> >up, etc.
> >
> >Here's my reconstruction:
> >
>
> Hi, Nico
>
> I tried to reply your mail, but found it has some encoding problem, so re=
ply
> here.

Yeah sorry I didnt properly configure my email client after getting a
new laptop.

>
> >
> >Author: Nico Pache <npache@redhat.com>
> >Subject: fix potential use-after-free of vma in mthp_collapse()
> >Date: Mon May 25 07:38:59 2026 -0600
> >
> >Between V17 and v18, one reviewer (Wei) brought up that we are not doing
> >the uffd-armed check until deep in the collapse operation.  While not
> >functionally incorrect, it can lead to unnecessary work.
>
> So we decide to tolerate the behavioral change?

Yes, I believe it is ok for now. Either way we needed to remove the
potential UAF. It only affects the behavior if mTHP is enabled, so the
legacy behavior is kept. And the uffd case is limited.

My future work involves further optimizing and cleaning up khugepaged.
I'll make this part of the goal too. My first thought is to do the
revalidation at every order (between the locks dropping); but that
essentially pays the same penalty... I can't think of a clean solution
at the moment.

Does that sound ok?

Cheers,
-- Nico


-- Nico

>
> >
> >We optimized this by passing the vma variable to mthp_collapse() and usi=
ng
> >the collapse_max_ptes_none() function to check the state of uffd-armed
> >preventing the wasted work later in the collapse.
> >
> >mthp_collapse() is called after mmap_read_unlock(), so the vma pointer c=
an
> >become stale.  Remove the vma parameter and pass NULL to
> >collapse_max_ptes_none() instead.
> >
> >Link: https://lore.kernel.org/2b2cda8c-358a-4a5c-989c-ae42593ef2ea@redha=
t.com
> >Signed-off-by: Nico Pache <npache@redhat.com>
> >...
> >
> > mm/khugepaged.c |   10 +++++-----
> > 1 file changed, 5 insertions(+), 5 deletions(-)
> >
> >--- a/mm/khugepaged.c~mm-khugepaged-introduce-mthp-collapse-support-fix
> >+++ a/mm/khugepaged.c
> >@@ -1502,9 +1502,9 @@ static unsigned int collapse_mthp_count_
> >  * If a collapse is permitted, we attempt to collapse the PTE range int=
o a
> >  * mTHP.
> >  */
> >-static int mthp_collapse(struct mm_struct *mm, struct vm_area_struct *v=
ma,
> >-              unsigned long address, int referenced, int unmapped,
> >-              struct collapse_control *cc, unsigned long enabled_orders=
)
> >+static int mthp_collapse(struct mm_struct *mm, unsigned long address,
> >+              int referenced, int unmapped, struct collapse_control *cc=
,
> >+              unsigned long enabled_orders)
> > {
> >       unsigned int nr_occupied_ptes, nr_ptes, max_ptes_none;
> >       int collapsed =3D 0, stack_size =3D 0;
> >@@ -1524,7 +1524,7 @@ static int mthp_collapse(struct mm_struc
> >               if (!test_bit(order, &enabled_orders))
> >                       goto next_order;
> >
> >-              max_ptes_none =3D collapse_max_ptes_none(cc, vma, order);
> >+              max_ptes_none =3D collapse_max_ptes_none(cc, NULL, order)=
;
> >
> >               nr_occupied_ptes =3D collapse_mthp_count_present(cc, offs=
et,
> >                                                              nr_ptes);
> >@@ -1749,7 +1749,7 @@ out_unmap:
> >       if (result =3D=3D SCAN_SUCCEED) {
> >               /* collapse_huge_page expects the lock to be dropped befo=
re calling */
> >               mmap_read_unlock(mm);
> >-              nr_collapsed =3D mthp_collapse(mm, vma, start_addr, refer=
enced,
> >+              nr_collapsed =3D mthp_collapse(mm, start_addr, referenced=
,
> >                                            unmapped, cc, enabled_orders=
);
> >               /* mmap_lock was released above, set lock_dropped */
> >               *lock_dropped =3D true;
> >_
>
> --
> Wei Yang
> Help you, Help me
>

