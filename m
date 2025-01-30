Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4EF7482
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738237356; cv=none; b=TzpafyKnxMOF/9ykFbfFXFhnERKclH7YuNmyPO09VTBRLihPO4ROTDQ+QEMsPwqxEfOFDsazU4E5L4XBojgvSBnq045VueHEgZOOEkzeNjEOG6TV7zf4GxOVMDZUHSXb2OArduiAs9PoZPg9pmJuVatxsa/Ln1PwAKLtYuDFoIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738237356; c=relaxed/simple;
	bh=xChPNf21gZ9hvw87pO10XU88QiztckLeG6j2EvC1S28=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CV8213i09xJ1EBD4TCuPulOD6IaNZvDFDZpuHDJ5ZfUQdNlVbUeG723J15o++b+GLj/kN5s1oA4r+g/yp6FKdcQFU9KgmNpaCchd/yXD9GaIbKOka8cfeSLmEvjPAaIX82t5i/gvt5NoZiPfLTpu15USB4j0lRXP6OsNKsNJwFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AhZIKnG7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AhZIKnG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738237351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OvJKFUs/4w46Q4QG1QX7ObxGqlReY0noE2BTZvNWIjA=;
	b=AhZIKnG7L989UX7EV7EgfHHGj4MU/81EjFeZ8KPz0apbtngn7KpxSKlSl9oS0Xu3CZRHLx
	EF0a1sLvR25eQtAMivO0pPSNaiV8BUC+/Wuh9AY7LcSSUMkygXIEqjyYhjl/mJqrb4Cwge
	6WQbH3Vw+ahL1KO6P5OIlByPO+2hkcE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-fQEsj_ZSN1C3TUPL83sY7A-1; Thu, 30 Jan 2025 06:42:30 -0500
X-MC-Unique: fQEsj_ZSN1C3TUPL83sY7A-1
X-Mimecast-MFC-AGG-ID: fQEsj_ZSN1C3TUPL83sY7A
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43582d49dacso4509165e9.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 03:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738237349; x=1738842149;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvJKFUs/4w46Q4QG1QX7ObxGqlReY0noE2BTZvNWIjA=;
        b=YnUO9pG4Uk4JaTgjDlZJfcqEXe26yv84OdqWR34sLd4YQHQVKkOhaK2LqM6Q/I4FH4
         ggQwzZ7mgoJy7v1qnGNCNnyizZk8Oc+vymTddLT497F/rDOmi7gjrL1FwI+ljM+5Ee/8
         gqprAL0hoBJwUeZMW8C4COZeny0olAIhuSJ+taOgCfqTNQGPhulzbCpoilhxsJiPgJzu
         JE3cElpdqQXiQFQ0sl+qa98nD8LjEqxbyheKF3dKbHZvhcUy7DxZSJsj/10/cTospWci
         N08h0owXfFCc/pnvjmkb8LUnXGROInPLXF6fgWwRviyUT0kAFSlR8Kn8B1IFTki8HoCx
         tCNg==
X-Forwarded-Encrypted: i=1; AJvYcCWCgo8Wl5cC6fKbGTmyYvvWKk0rlxfprefGAupjkj0z+opqmMkpu75ZolKA4QflLfCaMN+1BNqksNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhsU6wDFx6qcTl5vG2g4QN0u4bI8/HRSdAEoDuArh1SYA37YNL
	gZLV3q15gjtPxZtkUgxqukKoq7U7dhBOIO/S82fRPqzbhhcz+UZ+xf9jblpR1Un5Rws0sgSrDKG
	Q/9sxC1wjtjIcGT1X9aCj6/8IojPUIQrDDI/DpRGvaGEj5VSYwJRiQTsqgQ==
X-Gm-Gg: ASbGncvapvx3YI0bESYi8VxF/FznPRaU6B/8KeWJm1mzOKdRKVCbQMSt1hcM3kc5Gfs
	cYbeVEGmgHmPfjN5+bPHxKTqegOqzsKq9TpvEhkP4Qjtf3uzEQYIK1RfFCfpITJm3jjiLjx2hPB
	YQwdauXbY1JK+GfFDzujKtGVvNeTjvhgfpoi9BcX59S0yTtKogpwHSW2cxIs3FIwpqYHzBrDzSu
	VR7TTx/KFpB7Gu0duAeTZM7DuK+qR/IPRJY8Ha7sw5v0pEn6sPvVy6RWd7fDwQxEAqVk35wj30M
	DamFFWIqA4sejhdISjP9u9tBq5Z4ybtyXKI0g48dqS7aEzcmFlel009vGMexyCWGm4rCJ2non6+
	8lQsPM+ouuBmZNz0N9P5eHdLJIqVzZsrc
X-Received: by 2002:a05:600c:b89:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-438dc3bb62fmr58826965e9.4.1738237349107;
        Thu, 30 Jan 2025 03:42:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY9Z+9uBiFOagJR/rgrq8LfD84ufQR1bgPvqm2p4jGDLTMjXvAkn0iuB45i+xIkXC9mFPx6g==
X-Received: by 2002:a05:600c:b89:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-438dc3bb62fmr58826765e9.4.1738237348745;
        Thu, 30 Jan 2025 03:42:28 -0800 (PST)
Received: from ?IPV6:2003:cb:c713:3b00:16ce:8f1c:dd50:90fb? (p200300cbc7133b0016ce8f1cdd5090fb.dip0.t-ipconnect.de. [2003:cb:c713:3b00:16ce:8f1c:dd50:90fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de772sm20187955e9.13.2025.01.30.03.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 03:42:28 -0800 (PST)
Message-ID: <887df26d-b8bb-48df-af2f-21b220ef22e6@redhat.com>
Date: Thu, 30 Jan 2025 12:42:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/12] mm/rmap: keep mapcount untouched for
 device-exclusive entries
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-13-david@redhat.com>
 <Z5tWYpwpUfgEmeKj@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5tWYpwpUfgEmeKj@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.01.25 11:37, Simona Vetter wrote:
> On Wed, Jan 29, 2025 at 12:54:10PM +0100, David Hildenbrand wrote:
>> Now that conversion to device-exclusive does no longer perform an
>> rmap walk and the main page_vma_mapped_walk() users were taught to
>> properly handle nonswap entries, let's treat device-exclusive entries just
>> as if they would be present, similar to how we handle device-private
>> entries already.
> 
> So the reason for handling device-private entries in rmap is so that
> drivers can rely on try_to_migrate and related code to invalidate all the
> various ptes even for device private memory. Otherwise no one should hit
> this path, at least if my understanding is correct.

Right, device-private probably only happen to be seen on the migration 
path so far.

> 
> So I'm very much worried about opening a can of worms here because I think
> this adds a genuine new case to all the various callers.

To be clear: it can all already happen.

Assume you have a THP (or any mTHP today). You can easily trigger the 
scenario that folio_mapcount() != 0 with active device-exclusive 
entries, and you start doing rmap walks and stumble over these 
device-exclusive entries and *not* handle them properly. Note that more 
and more systems are configured to just give you THP unless you 
explicitly opted-out using MADV_NOHUGEPAGE early.

Note that b756a3b5e7ea added that hunk that still walks these 
device-exclusive entries in rmap code, but didn't actually update the 
rmap walkers:

@@ -102,7 +104,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)

                 /* Handle un-addressable ZONE_DEVICE memory */
                 entry = pte_to_swp_entry(*pvmw->pte);
-               if (!is_device_private_entry(entry))
+               if (!is_device_private_entry(entry) &&
+                   !is_device_exclusive_entry(entry))
                         return false;

                 pfn = swp_offset(entry);

That was the right thing to do, because they resemble PROT_NONE entries 
and not migration entries or anything else that doesn't hold a folio 
reference).

Fortunately, it's only the page_vma_mapped_walk() callers that need care.

mm/rmap.c is handled with this series.

mm/page_vma_mapped.c should work already.

mm/migrate.c: does not apply

mm/page_idle.c: likely should just skip !pte_present().

mm/ksm.c might be fine, but likely we should just reject !pte_present().

kernel/events/uprobes.c likely should reject !pte_present().

mm/damon/paddr.c likely should reject !pte_present().


I briefly though about a flag to indicate if a page_vma_mapped_walk() 
supports these non-present entries, but likely just fixing them up is 
easier+cleaner.

Now that I looked at all, I might just write patches for them.

> 
>> This fixes swapout/migration of folios with device-exclusive entries.
>>
>> Likely there are still some page_vma_mapped_walk() callers that are not
>> fully prepared for these entries, and where we simply want to refuse
>> !pte_present() entries. They have to be fixed independently; the ones in
>> mm/rmap.c are prepared.
> 
> The other worry is that maybe breaking migration is a feature, at least in
> parts. 

Maybe breaking swap and migration is a feature in some reality, in this 
reality it's a BUG :)

If thp constantly reassembles a pmd entry because hey all the
> memory is contig and userspace allocated a chunk of memory to place
> atomics that alternate between cpu and gpu nicely separated by 4k pages,
> then we'll thrash around invalidating ptes to no end. So might be more
> fallout here.

khugepaged will back off once it sees an exclusive entry, so collapsing 
could only happen once everything is non-exclusive. See 
__collapse_huge_page_isolate() as an example.

It's really only page_vma_mapped_walk() callers that are affected by 
this change, not any other page table walkers.


It's unfortunate that we now have to fix it all up, that original series 
should have never been merged that way.

-- 
Cheers,

David / dhildenb

