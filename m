Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDEC23C4FA
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 06:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773037642; cv=pass; b=GSvxI6xhSd4Uy9RxaoCzFiOHE/jXA/kdPCdUM9b+s/AD1Gov/vldElg8D0TvPwub6fig5syvz5u6mPIa2H9cBac1vjbeAuUfqIl9afcyfuRzB34X2J5IS0J8FJ0PXePevq2lY4+FRq/5dc+4xeZxfRIGdfSxAnRJcCik9iswmIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773037642; c=relaxed/simple;
	bh=tWJ/fX3Ckxq4WEzhukQr0K7T+NWwaaBTCqm8O0qx06M=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T8+g4jk6iTHUtMsA7zCga2Aj/u1ICo2d+0c/I1yaSQLtDXOPPD++4LFc2PhSiiyOcHNzp4XOa5O8E/ntYWsF6FNuehUCH6vj2jHIrj/ThZsn5rcfEwETHYFBgD8qZZ0Ajw/h08K4slpPdMzVMLZZWCJ/v6wkhcNxOafn1vf8frI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3H5gmW8p; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3H5gmW8p"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56af4aad3e5so1388065e0c.3
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 23:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773037639; cv=none;
        d=google.com; s=arc-20240605;
        b=C2RT6yTLovy1KdWBMvRigHomMeozWOw+g68tbAp0UHNaRWD4DQ4L18B9wfUvpRZBxR
         t73Y99xKUGBvQHbQShJRG2Znk1NH2BRa/5nkvpOFjEqh6QXZOGABE2ofvPiC4zu3e61F
         FiRAJGRoddZGkDHG4rkDChIROZRONv7vYUM8La9TkteOvNCOAUZykLJkrJKTK4cXEUvn
         NlodJutrgZ2gEhW3YETNkODpPWlg+K54gqy+T14KJE2gc87QwyrArVVyEPemiDqCC056
         x6OZVI9XhhBRqsCU+GT1yBz8iUsqL/P6yTTuuaDRrli/1Vnk5snoHJqJiMR+rsdpuC5Q
         lJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=uthJSqpDGuue4aeWUw9ODMGHbGatL8hg/W+VDtshmKs=;
        fh=XYvtfMKnoVI4oqOPy01CZi36VtlydFdqANydXhR5Rq8=;
        b=FKTisRAduX62j0rPyoPbot8xrGAewVCqOioWJmZ/9mH6WsRQ4++crqcfdUH4YeDi5T
         2v8sXu1MN47aJkTXwA3U7eEaXbXRWyZQoI0jVc6KNSDpHn9qP9lvpqweonTFX8cddupE
         eKqv1g3P+yWRF5rgEM/yB82Cm1P02hs7WqIQlrahd43rbJE38zqzKfJCzDJXDjZDarQ/
         eKPu/cK3GM1uJUzyxLqh08qRg52ZpljmEeINKSFDJa8aM1f4KO2olPvj9am+azlTTkw9
         fjLDlBOthN4eE5BY2cmBtH0OlBnc6pqSvxf28p3uBwQKTbDpeINFPgwac90wbD3WgQJW
         88oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773037639; x=1773642439; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uthJSqpDGuue4aeWUw9ODMGHbGatL8hg/W+VDtshmKs=;
        b=3H5gmW8pbkQt69icUXiv31N0ppI1uLaAEqyifhieISaamd2DQXxiSdiw/bbIO37SVJ
         X1pBQSNU7GI+tUOy3+b4aTGzxu+37Yg+1+4vv6t3twVSI6jCIlg6f9zIdu2T9vIQNej6
         hDiMmHWc+VrL2Q1LFkpMpRic9ARbdPSQNGqLtjDDJtDp/jTb2IVWiFff6tbb4dFpqSE3
         GfcNHOufsmcO/76Ul1Rmq4dfLvocgx6k6ypYW7G1i9D83/T1j0Nt546VOkwkp5DYT782
         gxfv/MpWu0oNlbuw/J1gkbumfoNooYyAC/quLQ2OyfmxIrG+UFcfLuhHwfIzX62eAMdj
         6StA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773037639; x=1773642439;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uthJSqpDGuue4aeWUw9ODMGHbGatL8hg/W+VDtshmKs=;
        b=bIr2G4wrYY3IEgHAPRz5tOCnyJCYMifjTmdmzWU+YdLEea2/D1j3FQCPYNRyuz4dqy
         KPETThfJkqMekwxO6/H5pU+HtOSL1gPZUnX3dB1ZO2R4HGat2IvzwO8jVKlF8fhFNWO6
         3tBw2tq+TFcEjQ9vGcgDZil/Euzn8faDArUPIcP94u1t6zgl6hOkdA53FkvOX2Ih+1eI
         vBpLmcSrsMh9aMX12vFywBjuL1Nnh1B25GAyNuWI2nWDeRLOgZeClJvqF9Oj2DG/Q+7W
         zEEu0/fuWcLsCZ7/jOZ4Y1mfi1y1mQe6N6q7IDj1tMI0kYlyBoGhGQOGxb6TCH+h8+uI
         i0Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWVeY64jbPjb+nv+Q8a9+aWW7CK7tiL2DQB2uSzGiVnh0JKrqw2QlvROvhwmSBaTIcejy1FUtp7Nog=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyIL24OLDQkIHXkwCdT0LXN8qf9T1t5MtkkfMRsPfRNx1TYtQd
	2mbqNlC8FsZWThxIh3VKnIH8m3dQbCw6Xx+xV3S9a3siTHor861sjcnpTi/Jwjw8uDqQrbmJpuj
	Y5C95BnSshp9Vp93WCCMjNaawdXGY5g8gpxGoTAS/
X-Gm-Gg: ATEYQzw9EAFtwLnwh5xY61KCoVaJGLE2fPwPKBop5OLvGo1+GmcOukJWkWKCAnw/Az0
	78C66MCoeifdG5x59y1rvzuHNmiKeGFam6PUhl3cRcTzRT9KLVDOX2bbt1bc6tgOJ+vNV2l/Jx1
	KrWZflOOHagtOejYzf9qc8HC7srhzYRKKyrKCpPbpK0exBUcfKlBFZeDy39nUU49lq4O4RGEUFH
	/7Igwz14BC+yW29CDbJhB4XALCtzaVYi6LA0dF0UycHygIm3p9yCpBHKhwJ+PibFu1QiTjl3Inm
	CYiOPiatEuJpsHhm2DmNVi2L68mb6E0prA//TeUtmNoRfrTFtGGZ5TI8iOxSlWt2I6Rfcg==
X-Received: by 2002:a05:6102:c01:b0:5db:f920:fa9a with SMTP id
 ada2fe7eead31-5ffe63cdb3fmr2925679137.41.1773037638925; Sun, 08 Mar 2026
 23:27:18 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 8 Mar 2026 23:27:18 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 8 Mar 2026 23:27:18 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aaWlxFh-bqUYXgUo@groves.net>
References: <0100019bd33b1f66-b835e86a-e8ae-443f-a474-02db88f7e6db-000000@email.amazonses.com>
 <20260118223110.92320-1-john@jagalactic.com> <0100019bd33bf5cc-3ab17b9e-cd67-4f0b-885e-55658a1207f0-000000@email.amazonses.com>
 <CAEvNRgHmfpx0BXPzt81DenKbyvQ1QwM5rZeJWMnKUO8fB8MeqA@mail.gmail.com> <aaWlxFh-bqUYXgUo@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 8 Mar 2026 23:27:18 -0700
X-Gm-Features: AaiRm52XcCdEx1v_REqqEWCzJAbxKWYQSWfQ7emIhDTUFVwrkCx8Utez8oZPcxo
Message-ID: <CAEvNRgEzb6Ux+iVFT=F6jc_R8V=LTYCigHp+yaHFkdrX82-yvQ@mail.gmail.com>
Subject: Re: [PATCH V7 02/19] dax: Factor out dax_folio_reset_order() helper
To: John Groves <John@groves.net>
Cc: John Groves <john@jagalactic.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	John Groves <jgroves@fastmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

John Groves <John@groves.net> writes:

>
> [...snip...]
>
>>
>> I'm implementing something similar for guest_memfd and was going to
>> reuse __split_folio_to_order(). Would you consider using the
>> __split_folio_to_order() function?
>>
>> I see that dax_folio_reset_order() needs to set f->share to 0 though,
>> which is a union with index, and __split_folio_to_order() sets non-0
>> indices.
>>
>> Also, __split_folio_to_order() doesn't handle f->pgmap (or f->lru).
>>
>> Could these two steps be added to a separate loop after
>> __split_folio_to_order()?
>>
>> Does dax_folio_reset_order() need to handle any of the folio flags that
>> __split_folio_to_order() handles?
>
> Sorry to reply slowly; this took some thought.
>

No worries, thanks for your consideration!

> I'm nervous about sharing folio initialization code between the page cache
> and dax. Might this be something we could unify after the fact - if it
> passes muster?
>
> Unifying paths like this could be regression-prone (page cache changes
> breaking dax or vice versa) unless it's really well conceived...
>

guest_memfd's (future) usage of __split_folio_to_order() is probably
closer in spirit to the original usage of __split_folio_to_order() that
dax's, feel free go ahead :)

For guest_memfd, I do want to use __split_folio_to_order() since I do
want to make sure that any updates to page flags are taken into account
for guest_memfd as well.

>>
>> >  static inline unsigned long dax_folio_put(struct folio *folio)
>> >  {
>> >  	unsigned long ref;
>> > @@ -391,28 +430,13 @@ static inline unsigned long dax_folio_put(struct folio *folio)
>> >  	if (ref)
>> >  		return ref;
>> >
>> > -	folio->mapping = NULL;
>> > -	order = folio_order(folio);
>> > -	if (!order)
>> > -		return 0;
>> > -	folio_reset_order(folio);
>> > +	order = dax_folio_reset_order(folio);
>> >
>> > +	/* Debug check: verify refcounts are zero for all sub-folios */
>> >  	for (i = 0; i < (1UL << order); i++) {
>> > -		struct dev_pagemap *pgmap = page_pgmap(&folio->page);
>> >  		struct page *page = folio_page(folio, i);
>> > -		struct folio *new_folio = (struct folio *)page;
>> >
>> > -		ClearPageHead(page);
>> > -		clear_compound_head(page);
>> > -
>> > -		new_folio->mapping = NULL;
>> > -		/*
>> > -		 * Reset pgmap which was over-written by
>> > -		 * prep_compound_page().
>> > -		 */
>>
>> Actually, where's the call to prep_compound_page()? Was that in
>> dax_folio_init()? Is this comment still valid and does pgmap have to be
>> reset?
>
> Yep, in dax_folio_init()...
>

On another look, prep_compound_tail() in prep_compound_page() is the
one that overwrites folio->pgmap, by writing to page->compound_head,
which aliases with pgmap.

No issues here. I was just comparing the before/after of this
refactoring and saw that the comment was dropped, which led me to look
more at this part.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>
> Thanks,
> John
>
> [snip]
