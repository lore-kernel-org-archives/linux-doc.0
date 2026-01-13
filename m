Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332C42ED164
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 22:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768341683; cv=none; b=JzFvq09QRKQ8/LlwdaqZfTT3XPdwUmzBwexfR+xPK0nxvtuu5qSeC/6H6pIrk03N4Yp6a7AK2ag5lAPOSS25DhG0w0ZZmUGQX5Gm5dm+pH4hZ/oAddbkeIxP3MVgJCjsTmySDZ0NPH0Vau17YkTd1mYN7XkDeVlPIMlORjP/lPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768341683; c=relaxed/simple;
	bh=LFZYRedxA/dOfRqaPpVPaG9kpYZqtR6uMO2q1QSkh70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDlvgJLKWLz5MOVtZ/oEDBzF27wibFyn1Ea5w+lqovmLIkwb8d7g4BkUw+fjml7wIJExhX5rrHOudRZGk3+4HA9VywU9DjuL5ENoWb9UeYp6vgbxo6SPXY2+qH6Gccsc0g5c89ucIza3QZMgLNdKT95sZPvwN0Sj4rO6rMAiAvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3Agh0L/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jt0dwKrH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3Agh0L/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jt0dwKrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768341681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFZYRedxA/dOfRqaPpVPaG9kpYZqtR6uMO2q1QSkh70=;
	b=A3Agh0L//2UhUMAMGWmRAiQ6Spe4S+KKcxNmG73VoGddK+ayVoNiT6wzPQq4fCS+AzUbQB
	Ran9TSUhKmIXWxr8s1OtpW+ZPTfe55kkg1q1uBSqgBRXyK69kC8ET6lczGTO2gJAAo0kY6
	M0w+T931Dr89cujqvGP5cZb1dBN+sK8=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-x-5-9twNN2GtTh-QfJu1Kg-1; Tue, 13 Jan 2026 17:01:20 -0500
X-MC-Unique: x-5-9twNN2GtTh-QfJu1Kg-1
X-Mimecast-MFC-AGG-ID: x-5-9twNN2GtTh-QfJu1Kg_1768341680
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-647119b06a3so11142844d50.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 14:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768341680; x=1768946480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFZYRedxA/dOfRqaPpVPaG9kpYZqtR6uMO2q1QSkh70=;
        b=jt0dwKrH2snhzYWLvwH75MksqHQbDV0wUGUi1FuF04vyWMFas/oPD7KuU99/usCi1t
         KxI3yVqh+wp0/RKoQIUP8cWG0BNawaUSzio72tEkMAo1swd0NaFeZQeTJY3VBiBzqT8R
         omQ1N/ZW4rEZAsjaBGg8f71gDQbfZz+rBLKlHQrqXaiIQZDES9gGYu0MAScWiZhHHcMS
         XhGPEzFMUax8Gz9nm0Kg+Ym4WaOHEa7Hfw25e5EqiutJ/R5JEdeI2CQs2ucwlNTEtXde
         vOo8PnZk3zyaUdgXgu4FvfzonBeIM4ItseEHMVuQdgPC3F6VQXRGPl+5+90CxHbC48b2
         0sWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768341680; x=1768946480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LFZYRedxA/dOfRqaPpVPaG9kpYZqtR6uMO2q1QSkh70=;
        b=Zfzb/oX3T7NJ60DVE9q45KHr+/zzQ6sS+TyIACSNVz8cUfQBI/dC9Nlw0ve+6Kz2PT
         t0T6R/IaA+PO3Sauz04Tv2AX+RdbZPnm2btJdTWdK1lrx7xaP2DxqFb2lU0/S3Rl1Vnn
         Q5h+oV2Ihk7M6BwSu2YWNPBvQl12VGQzUNITQy7ey8q2uoWYY++sGVEfxyvooVpFwU2U
         ozdjGH2ORrxqAlKRF2s9QENJJFsjSI4c/pk3P7mO1LgSHX1dxU36T5SGxrTL8tIIrIEk
         exWpzt1S9Dem/sl+QK3tCOZmazKHIhpfUIZh3JbeB98SX8hE54bzKGlMSlLoVYGTgElJ
         pYbA==
X-Forwarded-Encrypted: i=1; AJvYcCUcG1RpgRhyJ3xs7CZohfCi8eCQaPSKtp07qoWLH0ugpQz6cWq5jGShvxfxOEgLOQwCxLzjGbKLXNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNAnzRBZqCZNF4f8woglJUncPrWAYVDEvA2gJFpX5zkvhU0+KA
	wDfEmq23pQTIfNF/jQMbdusLjrt8vI24qwPH0aHMXk0eoMv3mQxC4tCVwJj7gPjfSjpv2dsmeUa
	N9rjKJWBO7Vxi5tuUyNdx1EZp9r1TiLG0p04nyXaxUKTmPnFARBirW69GhsGpy3iBANxIbyixqW
	wvtepvClMx3DoCXesiw4ry0SAcSfj1zEhVL5iC
X-Gm-Gg: AY/fxX79uZarEUPx+jkMb/Tb2LFV5xMoY/wWCR3b40Jxh6HsVXTUS3assp9aUGZ3W0s
	2HJttpWlXeZn5YKe9XXI06nHMpzF3qxmMJ5ksd8CuiSr8EheV5xtFc52jmhR8n3gH8YmYXGPaZN
	pNaKvcBcypSD+vupRP1nuTBN31qLDx6XSyhUnv9WJC9rHsQ0gciJmBOd0rs7dxT/EEFv8WX3hHd
	0otuF3k
X-Received: by 2002:a53:e21b:0:b0:63f:55de:63cc with SMTP id 956f58d0204a3-64903b0533dmr47275d50.31.1768341679498;
        Tue, 13 Jan 2026 14:01:19 -0800 (PST)
X-Received: by 2002:a53:e21b:0:b0:63f:55de:63cc with SMTP id
 956f58d0204a3-64903b0533dmr47240d50.31.1768341679129; Tue, 13 Jan 2026
 14:01:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201174627.23295-1-npache@redhat.com> <e54b6ade-e2a0-4a68-93c4-23af85479567@lucifer.local>
 <4cfb49a2-f0fc-4796-83a6-91db3a0f2a97@kernel.org>
In-Reply-To: <4cfb49a2-f0fc-4796-83a6-91db3a0f2a97@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Tue, 13 Jan 2026 15:00:52 -0700
X-Gm-Features: AZwV_QhqB272ApR0iCFfYvM28UwTr7qE89tJbFmOhDFMYK8UOvjuB2zu6RzyXUE
Message-ID: <CAA1CXcCP6yrYNAWjo2vsXC959Yi7GPq11uWB-eEv-Qvv+zmw7A@mail.gmail.com>
Subject: Re: [PATCH v13 mm-new 00/16] khugepaged: mTHP support
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, kas@kernel.org, 
	aarcange@redhat.com, raquini@redhat.com, anshuman.khandual@arm.com, 
	catalin.marinas@arm.com, tiwai@suse.de, will@kernel.org, 
	dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, jglisse@google.com, 
	surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com, 
	richard.weiyang@gmail.com, lance.yang@linux.dev, vbabka@suse.cz, 
	rppt@kernel.org, jannh@google.com, pfalcato@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 6:57=E2=80=AFAM David Hildenbrand (Red Hat)
<david@kernel.org> wrote:
>
> On 1/8/26 18:19, Lorenzo Stoakes wrote:
> > (Sorry for multiple mails replying to same, lei/lore are broken again s=
o my
> > setup isn't working properly).
> >
> > I tried to fixup the conflicts here to run tests locally but there's to=
o many
> > and I messed it up.
> >
> > Could you please resend this series rebased on mm-unstable please?
>
>
> And maybe send out the two cleanups that can be applied earlier separatel=
y?

Yeah I can do that. I'll just add a `dependent line` when I post the v14.

>
> --
> Cheers
>
> David
>

