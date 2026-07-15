Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A1C1B3B19
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 06:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095370; cv=pass; b=up9lTOa7xvvrXQ+SouffDUlTiQdC/g8b82H6wE9O+mTHzRiOFmvug9tjleJM5yeD6iRdstxSUgB3zIcfChbxBQEvv48ALiVzONbYV+sp185hHHn9vNXdDswJJVgCrCgFShfCkEowQAgkI/FFYLKdPcZC6RwCmve/xsmZPGw+4Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095370; c=relaxed/simple;
	bh=Ijoqf0ec2RdqKtOn96GHfoCSkwbv7/3jSmFCRSr1q4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+d5flYPT53ui7xtSO6AL9sbNsJatglTFbBOs6FRYhBQAjZ4h9Cg21YwscotuXT/pdB+dh2WaTeUS7DLN4CqdH/a6hr5XNnyDKvBavAaGuqWDM8vfJiMcBHQORixe9cH6189Vgo6CHgjEi8dgJysxxCuHLnLgNwY//81mFZB3sQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MH3dWC4Q; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VG40j7kU; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MH3dWC4Q";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VG40j7kU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784095368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PrASbahY/Qy7obVvL45H3Rafw5ZiA82ZX0ehxoKnjaw=;
	b=MH3dWC4QpLgBoFoVCSTL7ZotUV9br9NpYHQ+p5tNTc1McT6JcLIG/YqfeoNuf6b4ex3zq0
	BQYOwRjhvp0CQ3xDJkHFxVhU5j7Jl5AI+ErfMZ93VrE0JS+4C+2SrlHRHWI0rJMgyfUjKK
	K4YhwDw43ULJjUWq5da3dpmQr01Yn/U=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-SRzZftf9N4mxTFz8HlH3Qg-1; Wed, 15 Jul 2026 02:02:46 -0400
X-MC-Unique: SRzZftf9N4mxTFz8HlH3Qg-1
X-Mimecast-MFC-AGG-ID: SRzZftf9N4mxTFz8HlH3Qg_1784095365
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5aea2b3e942so2863755e87.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 23:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784095365; cv=none;
        d=google.com; s=arc-20260327;
        b=NF2EIgzdbqeBVuHVWP+8WPw0fGVUiqnrPX0oNeU6qrOJo+ITu/uIwpyQLFYVby/dyy
         rVMNx2DbGaki0NWc2LCnuuJUGDaUHd+I4rCsAeFh/A63x92uJhaOyc9any4HNzNGZrxj
         Td747UywNm0hAhad7P0F/wi+RaR0XfsFfIB4Inu+EQyfx7bqx/tzPrfmotB8VibU3Crk
         1RD7KMG7E5NLlobnkNUY+8Q4UfFTzV8VvFQZSui3VmlduT8bliPu/R6FE+wXQwwJJzHN
         zvxZtPf8MDx7oU/u/1R31iKBTjn8IiqSoufFv+lINPuBsTG0sVgoJE0/DLtoE4FntMf5
         PxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PrASbahY/Qy7obVvL45H3Rafw5ZiA82ZX0ehxoKnjaw=;
        fh=5XMgd4vOJPP1vKT2tSzUNisNT3cxq78JjeG9RmKsveo=;
        b=J5u3wYtlT06QlHKeB2shVavtKUoYb/7rPEgOZU1vfU+vmlSFRwQlMwiMYEHOvDyjZV
         QexOu06ibMZmFkyV56IfUDq2aUz8c7rFyHSP8xRDiDHFL9vB2g1uiiR8uGNQhG07VinF
         Ce7TstMe+Dc3iAcPSMwr3ReBK6847sZxwOUmEVU9SoRA2K3AR86J5jNhYPgrs4hltUJx
         yxadgDOzNe9KhiD5AUYW/8jwnjhKPzRh4IXwW/8mhCqwn01ZdNJlJnMd+ABeguI2QNu+
         ysciaKJj1WQc/+Dhd9+PSON3n1iCHz6hqgnO2kQJ0SSgxhiPPFxOU4UTVkSFCJP3dIwo
         u/3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784095365; x=1784700165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PrASbahY/Qy7obVvL45H3Rafw5ZiA82ZX0ehxoKnjaw=;
        b=VG40j7kUq52noesMVPiGy81YRkjN0KSffUKQutaUujWpa8lxXeGOlT3GbYLItmT+t+
         FFX/gS3lR+E7T5E8qgp8wWa4SZCThwesubdtUz84Y+WtFyTugCMFfMjlrs6HTGK6i+86
         R+Mt+BpgSekbi+jrzysba/fwh3CZ+cNk0ArwhBF8H7YVv9V9avjGQYzYPPgdq6o42NHn
         lA3GFKNIafQ31T0ybemtX5wn+smeZvxEHRC04ylv/IWMZwREdBbkqpWa39zWkMMdgFIc
         eh06EpLJx6Rop71BmO6KwYr0ZLUf4ayWUEyYVejKilgrmbbp8moZWprKyfWeLexlRBUd
         UgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784095365; x=1784700165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrASbahY/Qy7obVvL45H3Rafw5ZiA82ZX0ehxoKnjaw=;
        b=BDPagD9NRiTF3lQLhEnV/gEh+74TKecfJLSpsTamrjeRn7h806sUmYSBhioY8BAnZU
         Yp7qShxA/2iyXa84XsNr7Lk/ANcvSnF5HhBW20flJ3Kw54bzcqhSG8T4pajOWnDM3YtE
         mbVJQ03dred7uz18QwGTQECxiKbwdqysxftN2rsu39wHrYrqjApJpXCN0lAhW2sBPPka
         tl6oIPyvpOKvhjQoTMK2LhKYr4xCSb4ZqPCiEBGozAKaRTKDQTWSDzTmaZtS6wPUpcqv
         Qt0lQwa7OLVlYbCJ7EaRq11ACAWhhJ8hnEoGtBXpdVCyOS88D81nUS7+pZDrU4izB376
         P9BQ==
X-Gm-Message-State: AOJu0YzpGWIhzs1Fs2Bmh5nMDKQWVZ+CkyKOsLX98CBJiRuB10fsAq+M
	SiPvA0Q3gWQFNo2B7g7BYMmzx9+ylKdnNmQ/pV1WMHMagrcAAKoh9vS2ThX/DMKP6JMcLY7gVko
	wRSeblIWBrXaEDcUQoghWq/zSvbryiW1rVKYa1Hz7eKGPJfynzs9O/s8vUo+XuEQg3vczENqx/I
	PrABsjA/cwGMkDDMdTbG7olqrmpdWZAlgMqTMG
X-Gm-Gg: AfdE7clgGJkt1TM5751JFpjrUNDl27UjU8PQE96PE6AmISO2rXHec4UBvRabrqqxbUh
	qGTa5sKKlDkNJs1OO/LoEQYlomvUhnqwcizLv+XOA8a6Uvux/J2SpKABTsK6EHPsVf80FIraljF
	P8zRT35CbT8mXBTwqgp0oXXpzJCHSWz5otAF0ZkeIb0Wwwy+Z4ngNCgsOt4AnOk+z5
X-Received: by 2002:a05:6512:3a84:b0:5ae:b88f:311e with SMTP id 2adb3069b0e04-5b15d77b4bemr314763e87.15.1784095364785;
        Tue, 14 Jul 2026 23:02:44 -0700 (PDT)
X-Received: by 2002:a05:6512:3a84:b0:5ae:b88f:311e with SMTP id
 2adb3069b0e04-5b15d77b4bemr314749e87.15.1784095364339; Tue, 14 Jul 2026
 23:02:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706154500.39178-1-npache@redhat.com> <20260706154500.39178-3-npache@redhat.com>
 <62b2bd29-28d2-4440-a970-526dd5d5bbe0@linux.alibaba.com>
In-Reply-To: <62b2bd29-28d2-4440-a970-526dd5d5bbe0@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Wed, 15 Jul 2026 00:04:03 -0600
X-Gm-Features: AUfX_mzGez_fioxLs-6g6DVioRkkyNpVFUjvQPV3BbkUgYUzwFqfNlXABcR_X-k
Message-ID: <CAA1CXcD7Mta7y3j20TXjWWfMmmYRSjt5Vq=fbbS=aYWcepppug@mail.gmail.com>
Subject: Re: [PATCH 2/8] mm/khugepaged: extract young page check into
 collapse_is_young() helper
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 1:41=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 7/6/26 11:44 PM, Nico Pache wrote:
> > The change deduplicates the "is this PTE young enough to count as
> > referenced" condition that was repeated in both
> > __collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it i=
nto
> > a single inline helper function.
> >
> > Also move the comment and use it as the function header. While we are a=
t
> > it, updated the comment to clarify that a young pte is a recently acces=
sed
> > one.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 35 +++++++++++++++++++----------------
> >   1 file changed, 19 insertions(+), 16 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index b3985b854e77..48b008a3c891 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -675,6 +675,23 @@ static void release_pte_pages(pte_t *pte, pte_t *_=
pte,
> >       }
> >   }
> >
> > +/*
> > + * collapse_is_young() - Check for enough young pte to justify collaps=
ing
> > + *
> > + * If collapse was initiated by khugepaged, check that the page has be=
en
> > + * recently accessed (young pte) to justify collapsing the page.
> > + *
> > + * Return: true if the page has been recently accessed (young pte).
> > + */
> > +static inline bool collapse_is_young(struct collapse_control *cc, pte_=
t pteval,
> > +     struct folio *folio, struct vm_area_struct *vma, unsigned long ad=
dr)
> > +{
> > +     return cc->is_khugepaged &&
> > +            (pte_young(pteval) || folio_test_young(folio) ||
> > +             folio_test_referenced(folio) ||
> > +             mmu_notifier_test_young(vma->vm_mm, addr));
> > +}
>
> collapse_is_young() is somewhat confusing to me. Would using
> 'referenced' be a more appropriate name? collapse_folio_is_referenced()?

I went with collapse_is_referenced since it also checks the PTE not
just the folio.

>
> Also, it feels odd to put 'cc->is_khugepaged' in a helper whose purpose
> is to check whether a folio has been accessed. I think this helper
> should be more self-contained and focused solely on checking whether the
> folio was accessed.

While I don't wholeheartedly disagree, the point is to clean up the
code and abstract some of this logic away from the parent functions. I
prefer doing the khugepaged check inside this new helper because the
code is much cleaner.

Cheers,
-- Nico

>
> Just my 2 cents.
>

