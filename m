Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D9F5678C1
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965568; cv=pass; b=HpAig+tlq8tsTAMNwHPfRvf4yTTRkSqUOEVn5poI0xZAIsj62KIJdtMSa8Y4T0RyQIIF1/MBkD5wnJ+C3ihrCO00BaO8wn87lCiFlmqb7EhjYQHZ289pn4D0JLyse3Er0IgbNaMgVyD2zOYbMpGD0IOXGkvWfmqHAyNOMKe5tck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965568; c=relaxed/simple;
	bh=nlL495Rwgq5pTxpggaWR4Kyh0bctH6OQcmcJP4kB+LI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwr2wtXcaVMQYjOzsTRWg2d2xfuVp2HnLmQJityZy5+JNyH730Z74fDDL+mEPrQDF/ddCqkVrTqvRJId5IA3pAVUeVeNnyTU6T3NqhPOfQNg35gi7mvaVic4tB/mLtpmiElJ7mZS0TE4NnRWUoNyJ/b/qXj35UF6VHu8MBI2KKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q8i3qMhU; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q8i3qMhU"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-87f4e914a45so16424587b3.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 07:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965565; cv=none;
        d=google.com; s=arc-20260327;
        b=NMckwLJrDRR3f+UndMlD0EIpQR7WQxuCfubep2OXtuB3ieX+e8KZxsceIKSXKYZido
         aTIdXfqMLh2r/FYiB7ZSvACJm/fF3ovWLfUTNhewBWVflWRfQEW1N8qZ6BwhaMGzuyAl
         eC7uPr5aZXr/yj0oBD1otWQbpEt35qzm7cZi8vjK30lz7ism+GkMOsplIsqQgRFk3R8S
         dNvsEMj7mQhKnkCjaezTYD7VyxrmtPyZ8ku3W0JMiMR/GBw5A689czieriqBJGBA8CWB
         QXNnuy5VpzG0I9l6hqqFoxQMHTwVz7nR9j4Qw2cktpD4lGrkzt2icRWrN0qk0AIPdxd7
         1QTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=QRvd1Tt7kpHM/AxQHBaJz2yfsVBadJLI9GFkxk7vpJA=;
        fh=qeUAwndhttxr7pU+kBzl5+K6GOWTTqDV2TMV/yFltco=;
        b=c7InIEW2PySxb54tDY4l5xrixV00kdsBip80x3Wj2RgiBPYXmdHb5hFDmJnq/9ZJ0B
         mwwXB1T/+o8KhFcvZaJD8WWzAIAAUr3TvsysGL0YQHwavqZ9sYtp/G/aIG9M+tbeg5qU
         s/Rn/edFeXeRZTwhH8ZrT6RwbLYZJ20YiN1PgHb8EICMBqCXnasL/hQasHyO3Hy6bPAA
         Xj9N0WZw1fri6uZJbljV1CVc9Hkak6YQ7KauTcMRyyUah6KUz7hM1yXRt3MMNPMf8K0S
         0h8A13M4Fdj5jb/WhjaVX2VWkgMJmP+7l1ZiKHBsjN210j+EZ7XwdMGqFU6FVjDIWrtv
         nmHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788965565; x=1789570365; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRvd1Tt7kpHM/AxQHBaJz2yfsVBadJLI9GFkxk7vpJA=;
        b=q8i3qMhUp5t5ZXPUqJ2Q7wyst4pkqzz6PPNiA9qPABvr5TxyN6xE+mJfG4pvM4uaZ1
         hXgisclAU/Lka+Zv9mMs6hWHgsuGeUiSnXazvtjRlDl+mRcyhK0QxGsFG2fOHKEJuLDa
         uSnTA6nhxga6hmxGoPw6Bvm5LBSqKV83ZZFkqSv3vX8KHfOO6/t2ZvUNFNJbwxl7oaU8
         cGzs9DnJlC6Bly13MaOpMSLyMWnKPMOMtGDtRzL+H4BuT2m4ucPCGKrl063UZ+FXGWOO
         HUnv3V4svnbBaQst4Gv9XvhVy8D2/4PMcgO6j6/BMPC0aGQEZjOtYe/60bQqzO9HDEVV
         X3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965565; x=1789570365;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRvd1Tt7kpHM/AxQHBaJz2yfsVBadJLI9GFkxk7vpJA=;
        b=s6sthE9XsxpIJXwFB/osp+nhXOzPgdOI9+Z3+KvjtpmVe2hnaCPMFPCL0rZV5pxaLT
         1k8rD+5XfVHpqRcG9rYTLy0cU59QvLb3zY1lILZF7lE7JwbB/4Fp18xoXdpjQk+didyQ
         gRbmZKH9dFYrx/7Tzj7JVITU2Gb5mhZ3oGrPj2axYKRuFTkj0X0g4gCRoUDeb1O5srXt
         CWwHtBOeiTmYfPb6lyNZl4E7WBeaPadz+6+p26xae/+GMqliisj6XmbhS2PTDpF/0MGy
         AFz5WbGOZKKlp/p5C2aYFZSqb3m5q+oCmekfkJ9r4cx5nMOSFhKwq8MvUFFyUnMYzqfC
         RkUA==
X-Forwarded-Encrypted: i=1; AKwUvBzgeCs5DR2C3Gho0H4yoV76cZZiGYVsrctsi3tPVCzHgBWkN8APEwG1oISBGHZOtt9nRWjWHYeT5I4=@vger.kernel.org
X-Gm-Message-State: AFuF++nj7QTMd8XR1lzQJnPfkZ0KnwKTcRh2c5QBvA8iXWlB7QCMqmXQ
	Ypfh+I1rbqvIDXzYWiZ2/W2so73SntG15ia/HzwngbH+VK8exTmXAfUDAXACrGKcDlS8oZ5GNkQ
	nNKErTIuaclQf0bEKNtUKskfZfM4zHWN4aGsm0U0S
X-Gm-Gg: AYBFou04jqAvvIdb4ECu/7qBYSPbojOxxC0hb2EuZcbgjdVgd27GCjhW/h9I/5jg+2R
	stwlwWBBDukEh4s3v9/RmEvzFhnvnRlzWAtrRtlVmPDEMqm+85Dhfw0kDcR920WNAjnZer4aS0B
	Ud+Htmu51mn04JnbXdNONcRFFvb0PzZv8fcvquYl57WumPNqYZWWhH3ApG/ZDA4teYcbT0hbuLD
	lifcUfZ1FA4xnjieJUYIkujR8OWEooQ80KlM7aieBL0k6+6kBBzGBP5CRbj0N243Bc0+iYSnH+M
	jc8UXVHP0XwGKaJf9sdkNSk4i63NLF/Dn8g4uh76IJ9AsOh3L5mQ/ATAQwdAI4PxDSexEf+jT+s
	hNu5wnGK9asc=
X-Received: by 2002:a05:690c:6b88:b0:845:ddf4:a3a7 with SMTP id
 00721157ae682-87126aa77dcmr145268997b3.16.1788965563207; Wed, 09 Sep 2026
 07:52:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:52:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:52:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTyU1Ldbw-qqdQOx_P8jrt85QEcKSGae2h+AahsDQdbmLw@mail.gmail.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-14-85e5fd25252a@google.com> <CA+EHjTyU1Ldbw-qqdQOx_P8jrt85QEcKSGae2h+AahsDQdbmLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 07:52:42 -0700
X-Gm-Features: AcwNN1XhqWHW23-sQN5ajMsWY1WhBdcubAUAi4IgbeOekiJ8g-YJ7YTjJ4UYzFA
Message-ID: <CAEvNRgG36aXk8UW=Mi7ey-6vUe1EOKnkgNRNzdSUz-QJih4uAw@mail.gmail.com>
Subject: Re: [PATCH v12 14/45] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <fuad.tabba@linux.dev> writes:

> Hi Ackerley,
>
> On Mon, 31 Aug 2026 at 01:25, Ackerley Tng via B4 Relay
> <devnull+ackerleytng.google.com@kernel.org> wrote:
>>
>> From: Ackerley Tng <ackerleytng@google.com>
> ...
>> +.. _KVM_SET_MEMORY_ATTRIBUTES2:
>> +
>> +4.145 KVM_SET_MEMORY_ATTRIBUTES2
>
> This section number collides with the existing 4.145 (KVM_PPC_GET_COMPAT_CAPS)
> below, so api.rst ends up with two 4.145 sections. One of them needs
> renumbering.
>
> ...

I'll add KVM_SET_MEMORY_ATTRIBUTES2 as 4.146 below
KVM_PPC_GET_COMPAT_CAPS. Thanks, good catch!

>>  4.145 KVM_PPC_GET_COMPAT_CAPS
>
> Cheers,
> /fuad
