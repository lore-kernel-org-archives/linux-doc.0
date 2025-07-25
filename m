Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B79821858A
	for <linux-doc@vger.kernel.org>; Fri, 25 Jul 2025 22:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753483071; cv=none; b=dHzZEEaBq9hnJ9A1sF8Ucw68VfdnjhURc3pFQ7tjvsijkeZYR3hp4cF83S2sgA5BPSSOBLKDPQADqSqKVueEoJhQp/awJCMw3MHekBqU8MO/pHLEacUcOkdUIWHCl4STEJ5XOCKS826uUp2GHodeF7565Ri0292jF+1fVVYjlyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753483071; c=relaxed/simple;
	bh=PxMQJ32P9TM5LgrkFm1FLN9ED8pQui3GJRtf4HfC5h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJMobEVOo1pUlhTzt9B48PfqgeRx0qFdPnesahWaw7Xk1SDDJT6fey/7QbrMprji+Emzw1CTZWxs9tqtm2BO247pxY50er/ipA0d1dpCZJ56ue8R3rEbnBnKaNEiwZgKYhZoJtXZn64X8WaMTMfJRz39lzLCaDRpt8o35CRpVKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HLrWBITs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HLrWBITs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753483068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxMQJ32P9TM5LgrkFm1FLN9ED8pQui3GJRtf4HfC5h4=;
	b=HLrWBITsS8zgU/vH4iAPhs4UCRrHuraaL9dC619wNHtl3I5VJ+3xCqVdoggmjWEQm5ZKjA
	lrvNkjGr2eESy6/hfbeqjExx4vrPUdWgCvVHAVsN9p+Fc88fbXL4ypdq+/yFbLQp53O6lN
	/GeIUDt6Dhd1fznXArGUxYHZDpi35cA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-uR00KakKM8-SSBAbI75ubQ-1; Fri, 25 Jul 2025 18:37:47 -0400
X-MC-Unique: uR00KakKM8-SSBAbI75ubQ-1
X-Mimecast-MFC-AGG-ID: uR00KakKM8-SSBAbI75ubQ_1753483066
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-707cf1b0ecbso42044747b3.2
        for <linux-doc@vger.kernel.org>; Fri, 25 Jul 2025 15:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753483066; x=1754087866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxMQJ32P9TM5LgrkFm1FLN9ED8pQui3GJRtf4HfC5h4=;
        b=VQCuTggu2QRrjcNPAxCM8U0o3/4Fat4htwMnSjoELLq29aZOYwXEYZ4/SIXiOmi0Uq
         fCCeKGoVeFBAcJzCXGDWC00XDBB5M++XOum6pCOolvAZhrWHLwTL+xift+DqjAFZzHXY
         aGRajjoXs+35GZxy3gsqXCv8OQuWFfQOzqiYPhkoC+vmbAWifm4U7VBIoP5FKhHqK3KP
         AnqEBNdKOCaJaeSzaNxgzA4zTi7crlPFRIUnKOJEk+cTbvd8tV/X5mfSbRQLeuKq2rSD
         FqMKZgmX3mRaL/V45jBrYnN1KVvelq7RV839bxWJgaVqOxCICQlqIN25dniL59DjDdZd
         5tgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXURyM6QnpqN1ic7QMKPSNG38zQOUDRbKKMP0agRoZf35tj65Gw8FptYM1Rk2Ym4RpW4gGImE3n7+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+R02bwocPfzLSEWxVEPK9v3ZmlErU1ZcIDgeB7yW/ZQHC7CUP
	gCV3penDsK0Te/vuLDSPitdSJV9emqaOl6n64tD5zRfoiwZe0DslWTMxQlDZhyb5VEHMYcfnDz4
	AkFJXuao8Y8f6wlvNysL1FHtf74Ee+zNp8aCRr5ef/MzXrQKUl0cG5QBVQOWrlFRoXarrlBdsWq
	5SRVo8Ac492MSx0VEjztLQRk/PbR7eiGeSMsbB
X-Gm-Gg: ASbGncvC0h+eaRDeUBpWoIEJzl40Fa4gMIK5UfRP0EyEgcbNbaWXZcYC/JeIWU7rVzg
	EDNmweQ5hm/BUJigp/+u5hl+/S1WXMDmrWneQuA7Lwi3lJslU7UpeZsaaR0o4t3scOiyK3pInnd
	gkyT92Jb48o0AQtQTFXKUZ34k=
X-Received: by 2002:a05:690c:4513:b0:714:3e:f424 with SMTP id 00721157ae682-719e3461242mr52042737b3.35.1753483066621;
        Fri, 25 Jul 2025 15:37:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfOqA9QhdPY+M0vEESx6VKf5ml2IvqKk9pj3fqjSjpp95LtZTi4ZjJtdc1Jt2Guhr63gv18jpOEl7GBVnJQNw=
X-Received: by 2002:a05:690c:4513:b0:714:3e:f424 with SMTP id
 00721157ae682-719e3461242mr52042437b3.35.1753483066311; Fri, 25 Jul 2025
 15:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714003207.113275-1-npache@redhat.com> <20250714003207.113275-6-npache@redhat.com>
 <f87dd075-59e1-463f-bc36-0f6582abf31c@lucifer.local>
In-Reply-To: <f87dd075-59e1-463f-bc36-0f6582abf31c@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Fri, 25 Jul 2025 16:37:20 -0600
X-Gm-Features: Ac12FXy2-qDATzXIVs0g2RONSMMgciAzDMU4oBvRHpQajDJJel4xlOl2pw4wSCs
Message-ID: <CAA1CXcD0qKMqR4KSD-uqVORk=_gB=JwfkQ5owYV792B5Ng788A@mail.gmail.com>
Subject: Re: [PATCH v9 05/14] khugepaged: generalize __collapse_huge_page_*
 for mTHP support
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 10:15=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> FYI this seems to conflict on mm-new with Dev's "khugepaged: optimize
> __collapse_huge_page_copy_succeeded() by PTE batching" patch.
Yes, I did notice this last time I pulled. I haven't taken the time to
resolve it, but will shortly. I want to make sure I do it correctly
and that these two dont conflict in any undesirable way !

Cheers,
-- Nico
>

