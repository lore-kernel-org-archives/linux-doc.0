Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3923F8714
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002190; cv=pass; b=qbUxg3MMcjG3TgGkPzyxhHti/w9LPlkB3+6wrg56F95GWDbvkb3N1zvzPYhWh+r0gAj0P2+GCy7GtxaaNGeK86DHpBItpz1kFGg5ihPyHQNWU+P/vjEfNpb0JZ3toGMF47TgfFVv8pxvRvxKpnU4s3Rw/miM/PRaCDieUXCpNbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002190; c=relaxed/simple;
	bh=6CAvEDz43yKdOGhFNUEWaYf/+bgtBO1ehTPPArgHn20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezSDYXB6nQT6Ac7tfqZGjutj2YRU/9nWGdhoWxU06DfHkkyAp6/5ApsEYYMd/eV4jEWadnW/O4h0JYCff4+zX3IU6hqNXvvRed9Vvnl2wXpfD/dhKPJleIG5N1A00OEqqD8pXSsXlc4xZ5bGsOA/2x7/3obSib+3mz5lCAjvzHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c3jKzHFN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hJ0G7zOZ; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c3jKzHFN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hJ0G7zOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781002186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oybSjy/BUCusB5v0qku6caRMlW4QF0kXV4iZvPCHaIo=;
	b=c3jKzHFNDJwEUkxjLjXAjnr8WHGpu4C/jVbXNZukTYGoE56CXmp01U1ob1+zfKxEfc8HCb
	c+mPOhqA4XIk79ThuGw4MOdznOZOY1ZUzBlGCYUFnKUQwSrlFSi4YYunLEetuusgLrY6Gx
	2pGbpnD3pSfyI7VzwTXlxZQXTa2I0Js=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-Ao3aM4U7NaCsrS3iHzYlTA-1; Tue, 09 Jun 2026 06:49:45 -0400
X-MC-Unique: Ao3aM4U7NaCsrS3iHzYlTA-1
X-Mimecast-MFC-AGG-ID: Ao3aM4U7NaCsrS3iHzYlTA_1781002185
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6605859ed2eso7831648d50.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 03:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781002185; cv=none;
        d=google.com; s=arc-20240605;
        b=etUKL59jmQngHUqziP/Ts/Z8M1yV5o6prDkN7pQyrQgry5bT4kPYmrg07BkqZal+Ot
         9lYJ/sbPm+yM35fNdcluXsQ0vDxCk+h4zyYw5c3D3LW7mwqPbpDk6RgFT2S+JY3P1OQO
         9iwCJL852eF4GUSprbonNPMiUtplpz7uhKz6ZuZfSjd5ka4TmCm1gfijUsZV6hzY405V
         0/dZp7UEZ8FGSeT1jGBJSzsHp+BqjWQD49AqaORENGpqHGMUJfzv5dmiHurSb3L6u9yR
         kvuuXt0EqRPqAAOcnIZacQBUZEPUzoBM9E9TjI3wK7qmf166zc001tdeLZSd/7nl69Y5
         JjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oybSjy/BUCusB5v0qku6caRMlW4QF0kXV4iZvPCHaIo=;
        fh=suPXEcNfLQSQkiSLqjkFGiPzmKdoaDFAxKyxkupADxQ=;
        b=L9vXFe+644tGMXnwFo++jMC2wur6rJyiRGw4gdw52hbnmBnmZtom2CPed+u2vMdUMQ
         OzxlxYTmLWUgFhKMLNLXoZqCv+mjbPA82TQs3rj6r1nPkxd7PjmJL+Kax06j8Iatq4Ki
         4vtmTPWiMK3ygy4k4Ml6jzfR+TNari/H2GOGKy4lOJaT+e80DyBPTCef7ZZlxNlVQzUA
         DpqIoAETj7l6JssQNbzXFWzEaQ6uZ/zkXoMPf5TUX3QSp8ccohOqELljtL26QgSOx847
         x4l0NnYTswHKJuFDbz1XOgsoTyQndvBVzD2sdnVE+M1B1Z6rOT94MUbmxYAglGknubuT
         TNvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781002185; x=1781606985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oybSjy/BUCusB5v0qku6caRMlW4QF0kXV4iZvPCHaIo=;
        b=hJ0G7zOZtxxeu+7d2GzC0WSYZEQbUsAvMcfcpRto/9TxBnL7JvuU4Bc6jRoRSk9u7A
         nbJ/bMnNqfoKL81yX0TGB5Bxqdp27FodryMv48J4bgRA7TNa3Sqokbol9pWV/mQx3HqD
         oy1lfobR3aLFKOZz3NUyqXqqpRdeLOiMDw+W9BABhIDZWcCRzuqwsXD+7LY8/7KLvsJv
         R6re0kqNCsS99+RioO43nfyGUchkLZmeBh5+iG9IwN37pGvf4kETkgXA44NolZERNibd
         VMP4mgqRB5GnlhvzvKiIHZKv74mBd/+zzSJy+HcBeAZLng3gcSQDCNDIEBw80pelD8v5
         eYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002185; x=1781606985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oybSjy/BUCusB5v0qku6caRMlW4QF0kXV4iZvPCHaIo=;
        b=d7oxz3N3Ngf/P27mdCdLJWDxQJmpgGbiaSYEfBVxShiGMEeLrg+AR3WFh5bgZlgQA8
         TzZvzA8fx3v14hYI2lp/IdTljVgK0mG0/W3iEwAAg4GghtpFmJjmxLkab480CUqXkC8f
         xsreTLWUTB9zZ0vlk/VcVAZGrqloOEns7rYoIX89HGJrZ4bIlfldnjIN8Ay6m06sZaX+
         tWHKYSrhVrq7JbOJ0cNgJxffYoGSp0MhRGwElAG0AToMA0ADSXq9mj1WcA91x31nfq+B
         5jlIYt/YnA7SxcoW9fsJOhTJ89X3j1P7apAkymXLTfAlmZv5unuyROvJmRQq6+zCYE8h
         AkrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+OImzJoKo+E/Xp8Twu4giL8T5cvLnYgE+IpvBDQrLphdnr6XSLbfzVO7YEqgqk6L4hg7lHhfH2EqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtqPOIEvcHpLcXxJSWdoasbUyX5B4ZFUmtfLRTzsa6VaZuBQJb
	l8ru6NknVAtNhOx0gCbst0scqT9Zf4fQxABwRv5eI07ooZxV/IOfyuHNnYMNzpuOKZvtsGNDHRK
	Q1+pscEa3rX974lJlK650FVT2M8iFir8Xnc3BTWO+SJd6Tkms1EaGGlrjlVEWdxpT0fnAngqbyN
	hqHjlCzoyGwhCC8faKFlekIrkgR3uoLXLkp2nk
X-Gm-Gg: Acq92OH4B1afGNYYUEfuKSljAy42uVi6JAFqmDM8PmL01nLTuZ216n1WqT/8Yj/qu5I
	Pa8b1Cp1wSz2pn3sK80bbWGDQXLjwCSBDBDlbUrYG6uBq5ykUfvbJnKZO9EyuPbo2bS+yU+nCbr
	d/8o8A5IYLY21Ns8XaZDCqS00J0lEnsjpFEVwzmR01XaMhlR1PG8WExEX/QaLdebxRw0/PO20Tx
	j2J+Bruht/405AJ
X-Received: by 2002:a05:690e:bc8:b0:661:1307:3d48 with SMTP id 956f58d0204a3-661130740c1mr14942553d50.23.1781002184860;
        Tue, 09 Jun 2026 03:49:44 -0700 (PDT)
X-Received: by 2002:a05:690e:bc8:b0:661:1307:3d48 with SMTP id
 956f58d0204a3-661130740c1mr14942464d50.23.1781002184142; Tue, 09 Jun 2026
 03:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605161422.213817-12-npache@redhat.com> <20260606102800.26940-1-lance.yang@linux.dev>
 <2553caae-9e0e-42a7-8b61-d1216f1e81fa@kernel.org> <CAA1CXcBY_2372eJru8VoCq90rUMxn7w23hHou68MmXRv48NRXg@mail.gmail.com>
 <b7fb4184-7a99-42c7-8ee2-4c7fa20827c4@kernel.org> <CAA1CXcAhw8V+_dYcrqmtZ9ht4Pqz5PPB8EOcDrVCp4DA4y7pLg@mail.gmail.com>
 <7e36f7f0-b4d5-41c9-b399-9e0079907d33@linux.dev>
In-Reply-To: <7e36f7f0-b4d5-41c9-b399-9e0079907d33@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Tue, 9 Jun 2026 04:50:30 -0600
X-Gm-Features: AVVi8CfEmBBiPisLcTlQkrBGxz8hwbio2e3oUzPtBYwEihX4RcQI0ruEO3CUrE4
Message-ID: <CAA1CXcD7WAiA1b9GTLAuNZ+kHaFx0SzZwpBkqAZ=s+RHsTUaow@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v19 11/14] mm/khugepaged: Introduce mTHP
 collapse support
To: Lance Yang <lance.yang@linux.dev>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	liam@infradead.org, ljs@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 4:37=E2=80=AFAM Lance Yang <lance.yang@linux.dev> wr=
ote:
>
>
>
> On 2026/6/9 17:32, Nico Pache wrote:
> > On Tue, Jun 9, 2026 at 3:26=E2=80=AFAM David Hildenbrand (Arm) <david@k=
ernel.org> wrote:
> >>
> >> On 6/9/26 11:06, Nico Pache wrote:
> >>> On Mon, Jun 8, 2026 at 8:57=E2=80=AFAM David Hildenbrand (Arm) <david=
@kernel.org> wrote:
> >>>>
> >>>> On 6/6/26 12:28, Lance Yang wrote:
> >>>>>
> >>>>>
> >>>>> Looks broken for swap PTEs in PMD collapse ...
> >>>>>
> >>>>> collapse_scan_pmd() allows them up to max_ptes_swap and record them=
 in
> >>>>> unmapped, but they don't get a bit in mthp_present_ptes. And then
> >>>>> mthp_collapse() does the check above:
> >>>>
> >>>> Right. I assumed this is implicitly handled by the optimization in c=
ollapse_scan_pmd:
> >>>>
> >>>>          if (enabled_orders !=3D BIT(HPAGE_PMD_ORDER))
> >>>>                  max_ptes_none =3D KHUGEPAGED_MAX_PTES_LIMIT;
> >>>>
> >>>> But we perform the check a second time.
> >>>>
> >>>>>
> >>>>> nr_occupied_ptes >=3D nr_ptes - max_ptes_none
> >>>>>
> >>>>> So max_ptes_none=3D0 + 511 present PTEs + one allowed swap PTE won'=
t even
> >>>>> call collapse_huge_page() for PMD order.
> >>>>>
> >>>>> Shouldn't we account for them in the PMD-order check? Something lik=
e:
> >>>>>
> >>>>> if (is_pmd_order(order))
> >>>>>        nr_occupied_ptes +=3D unmapped;
> >>>
> >>> This solution seems good for a temporary fixup. but longterm we may
> >>> want something else. I'm still not sure how we plan on supporting
> >>> swapin without causing creep. So I'd be ok with adding a fix for
> >>> legacy PMD behavior until we know how to handle mTHP creep correctly.
> >>>
> >>>> As an alternative, we could either 1) skip the check there for
> >>>> pmd order (as the check was already done); or 2) introduce+maintain
> >>>> a bitmap that tracks non-present PTEs.
> >>>>
> >>>> @@ -1475,7 +1477,9 @@ static enum scan_result mthp_collapse(struct m=
m_struct *mm,
> >>>>                  nr_occupied_ptes =3D bitmap_weight_from(cc->mthp_pr=
esent_ptes, offset,
> >>>>                                                        offset + nr_p=
tes);
> >>>>
> >>>> -               if (nr_occupied_ptes >=3D nr_ptes - max_ptes_none) {
> >>>> +               /* Check was already done in the caller. */
> >>>> +               if (is_pmd_order(order) ||
> >>>> +                   nr_occupied_ptes >=3D nr_ptes - max_ptes_none) {
> >>>>                          enum scan_result ret;
> >>>>
> >>>>                          collapse_address =3D address + offset * PAG=
E_SIZE;
> >>>>
> >>>> 2) would probably be cleanest long-term.
> >>>
> >>> That would be best for future swapin support in mTHP, but I still
> >>> don't think it solves the creep issue.
> >>
> >> It wouldn't, we'd simply maintain the state we collect + rely on in se=
parate
> >> bitmaps. On swapin, we'd have to update/refresh bitmaps I guess.
> >
> > Yeah, I'm saying for the future, it obviously solves this issue here
> > as well, but if we have positional tracking of the swapout, shared,
> > and none PTEs, I think we can use this to determine whether the
> > collapse would lead to creep. If we detect creep would happen it may
> > be best to automatically collapse to the N+1 (or greater) candidate.
> > Just thinking outloud here.
> >
> >>
> >>> Perhaps we could combine the
> >>> two bitmaps to determine if it would make the future collapse eligibl=
e
> >>> again? Not sure but ill start thinking about it.
> >>>
> >>> Should I send a fixup for this using Lance's solution? Or does Lance
> >>> want to send a patch out with the fixes tag?
> >>
> >> If Lance could send a fixup, explaining the situation, that would be n=
ice.
>
> Sure, happy to send a fixup :P
>
> Should I send it as a fixup to be folded into this patch, or as a
> separate patch with a Fixes: tag?

Id assume a seperate patch so you can keep credit for the discovery :)

Thank you for all the review you provided on this series, its been
really helpful!

-- Nico

>
> Will get one out soon :)
>
> > OK, I'd appreciate that :)
>
> Cheers!
>

