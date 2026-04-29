Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F98373C1A
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473368; cv=pass; b=gVgPkdinH2VWgoukhZ+SAnb1p9WfSQb6qw/tQs9Q4gD0epN6wuJqsRoobF/NI149hl7hAI7pBmoRl/0kUYBkOJEd5+I9hmi0O2niZm5hkzTGfOVJjMHFTNECf6ehINjHoHFAcoALIbakopnGq4BaRRcNp8B9FvNqqbxeofNBFQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473368; c=relaxed/simple;
	bh=iQE2N9uDqo+wCoggLYHS+nb5L2Ud6xbnNHLN8AB2tr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiIx7OwV/rGsc5anrzr06mu5GmJUhPWGoEdQkz+TaME29KPbQqHstCZT83l6bqTCUya0RwRMhWdN0m1lVfKUMWkf3umfQcx0ZDoP2jCexH1jlXHnx1niZHRXuXLDG41551RuPt/KqtY+AWV/dKWzpvGGalE+PjGMd6XOwcoNDaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vsi/Jt3D; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JUW9c5st; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vsi/Jt3D";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JUW9c5st"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777473365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iQE2N9uDqo+wCoggLYHS+nb5L2Ud6xbnNHLN8AB2tr4=;
	b=Vsi/Jt3DF9kOwjg9GLMNx+uORcddHrQrGYHfQ3pYgq58HjLe4G58J2pJjx0+x/tyj4+Wqs
	F8Zwh0Ve9F2Y8BN4vgeX+IpI+a3h/SCcZxYpxeL7qSHzWZ9DnFZqInKmokYtEqwNX2Yagt
	dQ4RmTypt8kSTPVa5QKm4zUMpuidC6U=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-9UgZXh_hM7K7fVfMmkDOnQ-1; Wed, 29 Apr 2026 10:36:04 -0400
X-MC-Unique: 9UgZXh_hM7K7fVfMmkDOnQ-1
X-Mimecast-MFC-AGG-ID: 9UgZXh_hM7K7fVfMmkDOnQ_1777473364
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6546ccc8989so1304164d50.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 07:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777473364; cv=none;
        d=google.com; s=arc-20240605;
        b=bq06j42/VM8IpYzGqtq7Ft3cNfiVS0ozGA/Yxd6jfppY+WY2tT0EDLzf0JIq3ktDTk
         nj30UL3zVWSETalEsVksUzsTBFytoA7QXcbVg8TcCTmZcVRAZtOaY2MZEaArPgGY8aBn
         7qcCFaVXHAJRD+PBawZ936IXLzex2bTaQVpmJyaN85Qpi9JqWnvcgEBhTDx6RaYCUwRk
         3/nTLg7sbUL8GecAbwtbP6JCA478GZwbXs62PbvLkzc9xeWY90tMCpuguGKcSSQwvQAJ
         3Mp32j4JgEZv4DsKqadIjkfrMfu4Q6/uhO43f/r5bJHYXUAWaWVVP5UyeOcrj/UvotqO
         Lg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iQE2N9uDqo+wCoggLYHS+nb5L2Ud6xbnNHLN8AB2tr4=;
        fh=7Mkyi8BzNpekj29RI4FvfEGH592W6VQJcY7QiLMjQ1s=;
        b=YW4O9+em9OaLzAsICTbFbXONGPeQNXoMplM+akaUy7+5Jhpgss750D+10ydZloE+jd
         z3bSJLx94Vf4SLReBn+cmd8zCPkUHr4qFUPut0R0Wx4iDqhxs7ACeuLHDNLVWO5cu6QK
         iR8wGA9XRC1d+t7Ui/wUPGW0z5bqyE2kNpceFJu45vvYVtPSE7rucz5yyVDDbPcglslV
         4NvXQWoq14PSygj7zZSHQpPyHfFChz0mvYQsWWkuJ2t8DU3g1ZUlDpSgBDgk17PM/WV5
         ft6prkgPGc8Myw7o7STVTZos5XGObtnIfj/b6E/E3ibWfRm0MZVtEzZyMptBQ45H+0If
         qjcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777473364; x=1778078164; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iQE2N9uDqo+wCoggLYHS+nb5L2Ud6xbnNHLN8AB2tr4=;
        b=JUW9c5st4B1T1ZWAXyUD/4vlmZZgw5+X8pPA27iPkiGi2KrGzBgsB1/w6Y/P/M6XGS
         Z/W7c2uE0an9NLZOIcYQRJvrmfKQ1fRXNW6YFb7OF++7fj+QdLNjPInpAsx1XFApgGC/
         6+BqnZUzdtamyQEGT47/exKCiLtEqvxlIMBCy9zlkZfn/AtoHSRDHDHaXwmYo4v9ochL
         sc533fZew7nHmXOv/leRsArzn30estrKh0QrMZVd0CAgcWDPBXFzP7OI7ESeqLcLzRgJ
         RA2MLxIkMpBf/hlhG/4tyEVn6yAUYcc3/cO5wffIzas9CK+ZUsPFYvBdYxrgAZemGtb7
         j1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473364; x=1778078164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQE2N9uDqo+wCoggLYHS+nb5L2Ud6xbnNHLN8AB2tr4=;
        b=TTdYCXiTIHHiHt+gAWlYT9bbK0NPOAuaSeAv2yfWBUvAyPGfQE1fl2TC9UA/9fhMkD
         /VusQTysCBNGecWyuZPgHema0vE9IIsOyAa9U/w63kg7hB2desbtH+jMFJff2NEoGF2O
         HZ53S0HHHUfsxkHglttk2MA9tJrLcWsX4uIK/BsjKmK64AZC17i6QI8apPm7xn9S1gx3
         xiRMCkIrCEieNA/adb5Hf2PGnLDFCdfVJaN8DK8OUtc9Yq+HCb9suyo6sijDTtlKVEsH
         ZlxVqkIfFX9YtAO79e2SoHosyQ8MVtP0Z2/x/WyjbMMs/yXU2a+jU9Qqbw+vMQNXtfEy
         mROQ==
X-Forwarded-Encrypted: i=1; AFNElJ9s1BZX4Nc4JooRmZeq7wPTMZiMrdGYv7S16Rd1Xu+W6EF4tJ9WGgcJL/o0GUkoEmwWHazdhsxaigI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1BeT6SkCsoMZaBpqccdWYq6LONkoEovICQXeMq+bo5yftbWvG
	TYUqUj4zFskQn/s6WlowJ6IQaOGyT67MDmHYES8BndeWrx/lTVX1/fVY/VH9S7/R7+S5AMr8XGi
	jpv7hA13rYpvW17Q8a1bmGx7dHcEmeBSepoq/cJIJc/cucRVAovBUd89ZycHy6CjDk/3tmyWRhP
	fV4OoTDHDnvVUL+QlLerTOWrsqtBAI3wBqKBWbT2vOR/d9coA=
X-Gm-Gg: AeBDievLyhKahuZbGruJkMJgbe4MzW7QHW16vCEN6mhic6PF35uH9P+5KhMllyXAo1a
	ctP0sCR0ccaCeWMnA2vKqz8M+HreS19A/ltHlyaB5R2R7Yy0Eh1JWNFUF8SXvmQZ2tpKtx5+tDt
	55w5F8yVfYL2MhOOU1wuqfdVsGR09hhE5lDl+onIJevFrtLSAb852O8JEJsBFRgFwPDfy8g44Vm
	BW7FkfUyQWsV+akxz62p6RzrXzcQcW6SVyvdGNsSUuPsIhvKgI=
X-Received: by 2002:a05:690e:12c3:b0:64a:d479:bfbe with SMTP id 956f58d0204a3-65beed4aa28mr7450081d50.11.1777473363630;
        Wed, 29 Apr 2026 07:36:03 -0700 (PDT)
X-Received: by 2002:a05:690e:12c3:b0:64a:d479:bfbe with SMTP id
 956f58d0204a3-65beed4aa28mr7450052d50.11.1777473363147; Wed, 29 Apr 2026
 07:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419185750.260784-1-npache@redhat.com> <20260419185750.260784-3-npache@redhat.com>
 <06c7e6a7-60af-480e-afd9-700e985ca2ba@kernel.org>
In-Reply-To: <06c7e6a7-60af-480e-afd9-700e985ca2ba@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Wed, 29 Apr 2026 08:36:09 -0600
X-Gm-Features: AVHnY4LbQydeCo7Rl7wn3Z-HpTNHjOIv16EQn1nxmeiXqcsqhcLw56FreBf18Fc
Message-ID: <CAA1CXcA9GzJbfBhJo6yEahnTvUz=xzfzMkhi+KmpuzfNEb7Qbw@mail.gmail.com>
Subject: Re: [PATCH 7.2 v16 02/13] mm/khugepaged: generalize alloc_charge_folio()
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org
Cc: aarcange@redhat.com, akpm@linux-foundation.org, anshuman.khandual@arm.com, 
	apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	byungchul@sk.com, catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	lance.yang@linux.dev, Liam.Howlett@oracle.com, ljs@kernel.org, 
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

On 4/27/26 1:41 PM, David Hildenbrand (Arm) wrote:
> On 4/19/26 20:57, Nico Pache wrote:
>> From: Dev Jain <dev.jain@arm.com>
>>
>> Pass order to alloc_charge_folio() and update mTHP statistics.
>>
>> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
>> Reviewed-by: Lance Yang <lance.yang@linux.dev>
>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>> Co-developed-by: Nico Pache <npache@redhat.com>
>> Signed-off-by: Nico Pache <npache@redhat.com>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>
> Your SOB should come last, the order represents the history of this patch

Ah ok thank you, sorry about that.


>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> Co-developed-by: Nico Pache <npache@redhat.com>
> Signed-off-by: Nico Pache <npache@redhat.com>
>

