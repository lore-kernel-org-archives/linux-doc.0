Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC5C267721
	for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089140; cv=none; b=Dp9EX8D+FbqluYwDriCUrMd4w+C0CO79DqCXNb3rkZk7xvez4OXqtb7GVpm2UlCpn3cEFuWlsQfZyUS7XNo+5DIeZA0d6j0/GMIsjgkRfGEVYIziCIkyXqmOezzrpgtf9xTeSdEEr0ni9Ib+4Gf65e2h6stlo4e86Ekv6+G2q8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089140; c=relaxed/simple;
	bh=cgvgta8aciMoxErXIYuF2aSDop9idzFQFduLa/KczfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOU6Gw2jadsJugwpiCfiFLlJoyEiXgqgUvhlGc5pWTDsgK+J+XRDfA2PmI0e2Q4sdLX0+taNSkE4jh4vZg56jbR2J2Z1sJ/2rTYWrZYBCjk8nLUQDG4dJGe9HRbwp4rIEOBj5YwDxqwz+4wEsXS7OgDzTq1Ic1Po6gSvdOW395o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FwI1crum; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FwI1crum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750089137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgvgta8aciMoxErXIYuF2aSDop9idzFQFduLa/KczfY=;
	b=FwI1crum+6sDSY8I6SAH1U9Ei4gFbgW7lIb6eT8ud716xsA3n5FqKjt/aDGu0wRBbM09vG
	dudwm7ZJmMPFQVe0WYrroF02niCOjQeIret7dUvkjiMCtbTSpp0rT9KYqbaG6bmNoHAkUH
	1sndlpmKyyEoDFwQ2FHpC/+aYkO8KAg=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-1ZomHypYNQmKwJrmtnWk_g-1; Mon, 16 Jun 2025 11:52:16 -0400
X-MC-Unique: 1ZomHypYNQmKwJrmtnWk_g-1
X-Mimecast-MFC-AGG-ID: 1ZomHypYNQmKwJrmtnWk_g_1750089135
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-70e86a2a1b8so64520767b3.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 08:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089135; x=1750693935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgvgta8aciMoxErXIYuF2aSDop9idzFQFduLa/KczfY=;
        b=X7Hg+obO87HSl6is65CePvpfyhU3tL3Cxn8d4foCVfVdV/AJXBT6eDpkxoJWwAppjD
         gXG/dmkWcK1COoa2+59HF+x4hnhQfalNu0/LM/mI0Y2HuzTPnQie8zRV85h91dyKJY4j
         Qr2ZJGOJVrDpKyS0QQd4Xz5t0RmV6UF1rYsXAQzcRuaDIw2UwPi36h0nc5mnGMLVCYUT
         yn8tcUIn6iXGNhLrYDH3hjDmWUoKJ4+RG1uNjvYulSoguaLMomQfIuRFLfIXDr7n1yJi
         K7Rw1jZJdHqCl9kz588qG9jZm0m8qAaFQ8WWllT01lSMjafY2wMmgDnLs5iVZqSuLQ9L
         jt7w==
X-Forwarded-Encrypted: i=1; AJvYcCWK50Z5gye61uTERxhVnDCrsMIw7Hs2jB25q3CzD67P3o0gpxDPcF/3urPiCrOlxEmBgPZ9xNFUzQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YySOiEQ0KRm9yE5pqSNIJrk4HnGom7TxYBwVSdewBuqQMAIXDjc
	r6BMQRpv54xkjqzPGmrXAekxh1Yn6+SvcC5kQMfFF8GfiiyoMZRbzii3N4xkCtH8Sw5L08IdXFz
	CQXBhWJgryVsHswYLqKZJFmVzvhqIu8uwFZds8KC8Lt/E9GgRnn61vpSaMFwiZTf8dF15Ys41Md
	KLa8sOLUovDCJKXK/CHkzAaPIVmR6OHse5N0zR
X-Gm-Gg: ASbGncteGpirP9almhViKn/w1u2dB+N4OonzQ0Ee42xnLA2IpqRUGn5hRqk3UdQr0uz
	N5Wr3KNoYu8Aeul4YguuNdmY1njUzQKc3qhrXJMZU9mL5lJ58ikj+LVaw+4ryEkIHlHCksHP8Yz
	UZxyCjdg==
X-Received: by 2002:a05:690c:385:b0:70d:f237:6a60 with SMTP id 00721157ae682-7117543cf7cmr125890827b3.7.1750089135460;
        Mon, 16 Jun 2025 08:52:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZXG6wclfxD90BTesxhzMtrDTqbltqXOg871c5dsmQbh0pbJek5ygMMH70krpIlhvDmoHznJlg+ptMx6vksPc=
X-Received: by 2002:a05:690c:385:b0:70d:f237:6a60 with SMTP id
 00721157ae682-7117543cf7cmr125890177b3.7.1750089134944; Mon, 16 Jun 2025
 08:52:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <8621cd4f-a206-4440-9b02-52e9277ce212@arm.com>
In-Reply-To: <8621cd4f-a206-4440-9b02-52e9277ce212@arm.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 16 Jun 2025 09:51:48 -0600
X-Gm-Features: AX0GCFv_bntaKb1uWoTVlmOvBCUrEspFcRe-M6VQE_1ShbpjFnXLzcNhSs4x95w
Message-ID: <CAA1CXcD=MOEfa6XBp3+e3dSMCmgfx0NgB0DgnxRWTAS-KKZx-g@mail.gmail.com>
Subject: Re: [PATCH v7 00/12] khugepaged: mTHP support
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 9:52=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
> On 15/05/25 8:52 am, Nico Pache wrote:
> > The following series provides khugepaged and madvise collapse with the
> > capability to collapse anonymous memory regions to mTHPs.
>
> Hi Nico,
Hey Dev!

>
> Can you tell the expected date of posting v8 of this patchset?
Hopefully by next week, although it may be longer (as a try to catch
up on everything after PTO). We were originally targeting 6.16, but we
missed that window-- so I need to repost for 6.17, which we have
plenty of time for. Ive also been releasing them slower as previously
I was not giving reviewers enough time to actually review between my
different versions (and this creates a lot of noise in people's
inboxes).

I'm also going through some of the testing again, this time with
redis-memtier (as David suggested).

Cheers,
-- Nico
>
> >
>

