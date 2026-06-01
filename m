Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3945E3A5E9E
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 14:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325987; cv=pass; b=maKeMOAFC3uvuOTR8CrmIbf+0lzTY9A6o/zLYwF1z2aT/TtehuOWpUG53PbyYdqo11nBJ96tm+Z3zEM1Ri/bJaGFzXjgGYcsUGXTLZDANjugssWAkiy93FuTrLrR41CHuPY+njKvYLxd1hiQ/hBBvxjYbfZZIvfYXR0l2XOINBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325987; c=relaxed/simple;
	bh=WzrBFZqfu8DnkLEv7f5e1V0F1EgR/vAbRBb+8qRzHsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ys+8uKIpQBWvwAsISydAwwfs6zYh5YOEKozSaMRt8BX6m39nUWHyDIPY5HeAM4IcZkZ7G8x5N2meoGH4V+9Z+WkDZgbEwMqjjEz+ghgV3YT3wJnnJ+UpSzBR6k6GolmauK4j1bsS6VuvQSEreQluYQkkz/ujRDhaUKnFweepIEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cosvmb8g; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cHhEGntY; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cosvmb8g";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cHhEGntY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780325985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kzh5a0tVq5+/8roSGK1F3W4YTaJGCvorVh1SK1J8QJA=;
	b=cosvmb8gNFWJk4+HEo2W9HkjhhyD2zY3JbmR+gTgPQRL5qfDIKSBdRSRBKC7Is2ypVxJoj
	jJ1oisarcUQUO2xEPXw1WnR5Fg8Lpjf0To7VfZp0jr9tC2mo1TZw24KivF8jxc41DRWWIj
	9TwZDTLm1Wgij+DkJBqI7AeKYb2NbK4=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-ECLW1AvIPcygt8RX-ImFXA-1; Mon, 01 Jun 2026 10:59:44 -0400
X-MC-Unique: ECLW1AvIPcygt8RX-ImFXA-1
X-Mimecast-MFC-AGG-ID: ECLW1AvIPcygt8RX-ImFXA_1780325983
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66032d92cdeso4375728d50.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 07:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780325983; cv=none;
        d=google.com; s=arc-20240605;
        b=D77j3GlKHXMAyWJwWWn+qiO2bgSn6z1dvGhzQYGsvoOw1hsxt6MQoxT8lrCT9oyfMB
         8FAJbn5Ojhx9Zwl8R9MvQamMa69ZY1kbc4yrZRuY5YiKIo6kgklMqpoAd26hS7m0sbBt
         Vck+5u5w/RqEq8jXMP2Uk2dgqmqr/En155npA+29Ub1NMQyHWzl6M60a/IJNMaCnrBP1
         r4W6c4w3IXpz3RWs2WodP6RJVv6F4MtBVuAyase2EwKBF/Tp16iFFpjdFTNVKI9R8VML
         cUjJ2+TOsd+xhie4r9ng6qsY/IM5a8MDOE4OviregSN7wg8174V/mlw4gzFR/tkIl4Cy
         R7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kzh5a0tVq5+/8roSGK1F3W4YTaJGCvorVh1SK1J8QJA=;
        fh=977z3ISM51mh4jkQ3aTfn4ahM1xJLMAeBmm9Iv+9RfU=;
        b=HQG1Zy9vlEAqKZGwwjk3f/y3r5JD5MSqp7yMUkDcCDbHRv0TWZGpdddAftPRuRZfXL
         JVAbuT+7yiDHK3XQcFld0EWykEP6BetCUbA9d/+NlvnbYTKlYWNbs+Dt/mXGDJuwSgL7
         PV5p9EgRvc23cJrr8Bwl0vyCAXHRPuakjqH3vNjwF9NumC5/RrRc9BW4osVZnIt3IDcc
         Wpl4IcVOU2AFhHB29wqNnZaMI7IlAG1bOUjFOWj8FjD+TEqoLAQTcKCPinHe9kpRQ1vR
         DO+1K1u7+FmuZbbhZSwoXZb7GtWMbX7SaAbQSTzoPa0/QFhS4nh6GTCVm1LWHEMNlM8x
         7VqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780325983; x=1780930783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kzh5a0tVq5+/8roSGK1F3W4YTaJGCvorVh1SK1J8QJA=;
        b=cHhEGntYladA+EVnljPfrs1j5vpKBk7JiJjGnQuMjdZPt+oKKudJ9w28Sq/CjypX0z
         sijPMFVcpeJLHOgKYIT26DNFZ6QaIWCzHAxTOamtRz4ovPpaBmVOZ7fIhq0O+WdAKNOm
         4I7ipI8Z2a+H9zFIywIcgeiY6h2WZN+XGmBDf4KdIbjgone82pUykkZPjZhngO+Ade4W
         F2V0A7AC3IKuqr6EoGimlz6gfWPrq4PWbyaYl3hVntjlZ/iUkSxUTy49OveIoX9Y1HIG
         ETr5/YxBYf4dVbi54yM/XyzuY7KgcIb5v0pRwqz6FNtU/DwXmi7oUKsXwICwf899Swh/
         jt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325983; x=1780930783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kzh5a0tVq5+/8roSGK1F3W4YTaJGCvorVh1SK1J8QJA=;
        b=OqD9phYwYjq4xvjBELuUtrvF6F9QOf+tVPpDJLTTCbRtRGGosu/BPGVkY29zzJcksp
         fwKU1uixEueEwRabZql2t/reEAqcHOLpYYvtTtyBWv6uVR6xLJXAqModwpvf+8adgVCr
         V56ZDrQ7Ekb/iwSno5/UzlBaSncDCag/8g/f1TxC20MrEE51J9owyKHhYjWqEAdPED4T
         t889bMB7zmZpmUn1pWNdXmi/eKM3VY3X2cOX09PIX0o1IxwWyMOE5fuUEkL0Fu+bOynm
         UtNcUqiDP9aVMaCJQdmy3KwAk5C70VeKVOWWLuA6y0c8+Rj+Jvr7bMY9bd8e6Wp18NTn
         H0cQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VZ0jvTgZ3RrHb5b75gJqmpEf+cK9kKo0QCgnJnZnPu6BROn0YSKmjS1UPH9DZ1WMqPpLYpAUbVcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT9/0IWEq8QhVHRgCQ8mHenKmUq4EJDNneyGzUvQNL8Ua6Afry
	1Dpys5zWWFH+/kQYvWKuXenUFKpZVp40I3hiZG3Ps/telj41as+flz3Z616HIwy2W8OXe1LX4im
	L6Md9UZHgEmdvJ4Jjy6csvWT2YWC9X+rxCPNlc0QRX3ejKWN+6F7rEf82RQYER9Dnr/OA8L6Bub
	7eUPKVHvzduAMSREdNiuk+k4OZng2gs0WfsJeu
X-Gm-Gg: Acq92OH2Fg+y6F+BbebpNYP6X/OIJamd4RX3rMubAgc/nxO43uifcZeRvfZ2CodYs8A
	YuP7Qu5a7rzO96svomGVY2CX/HDtpI19nOTLf21noeyvt9b+qMCBo4zxH67kkImhwfuOkvCvl24
	r5d6Smgv3bGmji6ILk03hw2n4VVrSPiMVNIZhdTMeAe3BStA4UWNvBlRNaaJ3aDde1saQ6hjl2O
	J8YGg/SbPZ7H/Or2w==
X-Received: by 2002:a05:690e:1593:10b0:65e:43a2:82a5 with SMTP id 956f58d0204a3-6605f9416camr7354341d50.55.1780325983519;
        Mon, 01 Jun 2026 07:59:43 -0700 (PDT)
X-Received: by 2002:a05:690e:1593:10b0:65e:43a2:82a5 with SMTP id
 956f58d0204a3-6605f9416camr7354269d50.55.1780325983033; Mon, 01 Jun 2026
 07:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2024af56-5e99-4799-a586-e9ba756cecb9@kernel.org>
 <20260601032804.96122-1-lance.yang@linux.dev> <f5d38f64-ab92-496d-afd3-29ccc17fec2b@kernel.org>
 <616de1a8-1cfd-40b8-b04f-7b324be40bfd@linux.dev> <6b11bf0a-769c-4ef2-ac6f-2af38200a6bc@kernel.org>
 <baa0a462-46e0-44ab-b583-c722ad253afe@linux.dev> <06d9b665-945f-4967-9ed9-b06514478996@kernel.org>
In-Reply-To: <06d9b665-945f-4967-9ed9-b06514478996@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Mon, 1 Jun 2026 09:00:22 -0600
X-Gm-Features: AVHnY4L3QcDds9Bx9nzJC4wMJL4H0KRuHxJDPSKQUpwkRBzl7EaLMR0JWfpdnXo
Message-ID: <CAA1CXcAeEGOsqp-ywAQ7GMYQzXEeco-rUxUkk2hEF69HybC4=w@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v18 06/14] mm/khugepaged: generalize
 collapse_huge_page for mTHP collapse
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, linux-doc@vger.kernel.org, 
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
	zokeefe@google.com, usama.arif@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 5:14=E2=80=AFAM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 6/1/26 12:47, Lance Yang wrote:
> >
> >
> > On 2026/6/1 18:23, David Hildenbrand (Arm) wrote:
> >> On 6/1/26 11:08, Lance Yang wrote:
> >>>
> >>>
> >>>
> >>> One small thing, I think we should probably keep the smp_wmb(), and j=
ust
> >>> move it before the earlier pmd_populate().
> >>>
> >>> IIUC, the ordering we want is still:
> >>>
> >>>    clear old PTEs
> >>>    smp_wmb()
> >>>    pmd_populate()
> >>>
> >>> so another CPU cannot walk through the re-installed PMD and still obs=
erve
> >>> the old PTEs, right?
> >>
> >> There is a smp_wmb() in __folio_mark_uptodate(), that should be suffic=
ient?
> >
> > Ah, cool! __folio_mark_uptodate() already does the job :P
> >
> > So yeah, no extra smp_wmb() needed here!
>
> Yeah. BTW, I think we'd need a spin_lock_nested(), so @Nico, treat my cod=
e as a
> draft.

Okay, I read the above and did some investigating.

I will try to implement and verify the changes you suggested :)

Or an even crazier idea... what if we ensure MIPS checks for PMD_none
before walking a PTE table?

-- Nico

>
> --
> Cheers,
>
> David
>

