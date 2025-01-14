Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238C522FE0E
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 02:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736823205; cv=none; b=BAWSahk+Ox2dca5oRvAZYHgA5dLWh1CKZGAIVD6osXPt2nLiPwVOQBsg1/DdZwqd3++6TfGGVyoBWy5bTW2wnvuuo9orWq831VjAbkaqRMuUcPuGkl+Xq6WO3LNCHAIQDtIW3Z/ue50V5QJbmWj5otJHx0GfLbr9Y0Gb3MZkoZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736823205; c=relaxed/simple;
	bh=3iMARzIsb3JhlgSTMVIwM0ozUwe9IThptBtyDCmoZqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ks2/EuuOFJc2Zsy+ln20R/B6dDyCI2pm9tOqNHZQRJCDbzJELig+0Jph+yvoE+80tsHcTQPmQ1+7Sko/R6N0qIPo5qRPXnwNOcVm26LBVdLRX5xdXFzuk6ac0/mEkxqi1viaVeZQEI2OfnK/5QYb3zLKj9yn0GyzFvXCD67KxPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ldw7Xyl5; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ldw7Xyl5"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4678c9310afso73351cf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 18:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736823203; x=1737428003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BfyNyKo5KucS/aGZShvaf2JK3tg461kD07EfW7epck=;
        b=ldw7Xyl598WttK9fCf7rJmWR208zJCvWdOakEosjZ/V9tjq3tu/YaVC1dCAQOXNwdP
         XB4RhqtPhg1Mbg0bbEf7gpVzdmhxzOB6cJuv4XlnbDXz8Ioar92hHawJzliIwkcCt0IV
         Yk6ym4vBQU2K5y06JWLCZNJrznazB22znxReqoyEza5znhAAtNOKjdFL7nALb0vRrG18
         PVY5F4MSRi0jMInydzwCOB/qDvGuelyzDZU7rzE6lII366adY8fXjWS4UxWoYOODkMAJ
         xZYzEROeCn6oayq+LraKZEBO/NRRMGOSH0x0d0bFYXdjjFx1E8WAxx6U9nnuECnmcDGq
         sexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736823203; x=1737428003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BfyNyKo5KucS/aGZShvaf2JK3tg461kD07EfW7epck=;
        b=O3prUGp4hzRnFH3CmonRuAvU+KZi6Nyz0iD3q76/c1NroT9BNGenNIpLhDQIlrOr/p
         lpXtaCl2agwhVXUE+YRzyVjS2jksw/271m2drgL8fxJEXLY+345f+A+OXfz0iYwfSVH0
         5MwpMK2SNZQuAu8kJBH+tXBnS0Xx0nuhYvo3Qu58sTy0gdzfGShAZjsjAjZwGZr64FzT
         iFob9F9ZdO9zeSFo83zngArC+fP1/4kRHMFKUW6M8R+5eOQYhxqtHJjggfdQFTGMZvKb
         ThEizc3DNdfheVB6AywJBOaLDsEVyJxF4Z4MOAPzKcSFlVToMGSCGpg7orBohwfYj/JV
         qYmA==
X-Forwarded-Encrypted: i=1; AJvYcCXlLBJ12aVljRjzj0H+41A6Utw488QK7ZRorc7P8rX/SZTA1vRCUEZGGx8xk6UWGInhdB5/eiMahG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye6X2FmMISgMxRqgahqh6qyiBbmtK1axbbLrB34+m2oOeuNrpo
	j8jNg9+dUTCPTrvVzKPmgYTLQF4LK4vJ1SRlR9OMT9syMxcjppxFjaD/GRj+h0TEjz+6XIyyeaU
	KmaSlNIxdYCSAv7SKh5yFVL94B/sln6dKcDIu
X-Gm-Gg: ASbGncvut2sD/WbjVehM8tzoeKQ7sV9Bi63IbZtM1YHM60khrBk0G7bGSe++aRU0/lj
	EFptuwfJ1nrwO2kwYVdjN9pUvtwsfLDlHTrpEvc8NGmu+ulai/5C2I10oWkQOan5FvLYJ
X-Google-Smtp-Source: AGHT+IHd3/cVX+cJ0woCNQTdkCoKLTOG2CQ509MQp+tH/UTd4jPCtVwTKgbEOdchvtXmdDLjzX5IC9wy9FDMH2Zm7zU=
X-Received: by 2002:ac8:5943:0:b0:46c:791f:bf2f with SMTP id
 d75a77b69052e-46dea6ae367mr1030221cf.1.1736823202793; Mon, 13 Jan 2025
 18:53:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
 <20250113174941.8c6d5defe18c8b1a7e477ace@linux-foundation.org>
In-Reply-To: <20250113174941.8c6d5defe18c8b1a7e477ace@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 18:53:11 -0800
X-Gm-Features: AbW1kvYiYhhSu3JX2T2sGkJtJPPnMb2EwkI2Oe2vRc-7KhUsAXKkjoZ0_P4EFBg
Message-ID: <CAJuCfpE0Kdd8EnsjOJ0WW8QcDYbWji3S_LEu+=J9aTVioFMQ+w@mail.gmail.com>
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 5:49=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 13 Jan 2025 12:14:19 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracl=
e.com> wrote:
>
> > A nit on subject, I mean this is part of what this series does, and hey=
 -
> > we have only so much text to put in here - but isn't this both
> > reimplementing per-VMA lock as a refcount _and_ importantly allocating =
VMAs
> > using the RCU typesafe mechanism?
> >
> > Do we have to do both in one series? Can we split this out? I mean mayb=
e
> > that's just churny and unnecessary, but to me this series is 'allocate =
VMAs
> > RCU safe and refcount VMA lock' or something like this. Maybe this is
> > nitty... but still :)
> >
> > One general comment here - this is a really major change in how this st=
uff
> > works, and yet I don't see any tests anywhere in the series.
> >
> > I know it's tricky to write tests for this, but the new VMA testing
> > environment should make it possible to test a _lot_ more than we previo=
usly
> > could.
> >
> > However due to some (*ahem*) interesting distribution of where function=
s
> > are, most notably stuff in kernel/fork.c, I guess we can't test
> > _everything_ there effectively.
> >
> > But I do feel like we should be able to do better than having absolutel=
y no
> > testing added for this?
> >
> > I think there's definitely quite a bit you could test now, at least in
> > asserting fundamentals in tools/testing/vma/vma.c.
> >
> > This can cover at least detached state asserts in various scenarios.
> >
> > But that won't cover off the really gnarly stuff here around RCU slab
> > allocation, and determining precisely how to test that in a sensible wa=
y is
> > maybe less clear.
> >
> > But I'd like to see _something_ here please, this is more or less
> > fundamentally changing how all VMAs are allocated and to just have noth=
ing
> > feels unfortunate.
> >
> > I'm already nervous because we've hit issues coming up to v9 and we're =
not
> > 100% sure if a recent syzkaller is related to these changes or not, I'm=
 not
> > sure how much we can get assurances with tests but I'd like something.
>
> Thanks.
>
> Yes, we're at -rc7 and this series is rather in panic mode and it seems
> unnecessarily risky so I'm inclined to set it aside for this cycle.
>
> If the series is considered super desirable and if people are confident
> that we can address any remaining glitches during two months of -rc
> then sure, we could push the envelope a bit.  But I don't believe this
> is the case so I'm thinking let's give ourselves another cycle to get
> this all sorted out?

I didn't think this series was in panic mode with one real issue that
is not hard to address (memory ordering in
__refcount_inc_not_zero_limited()) but I'm obviously biased and might
be missing the big picture. In any case, if it makes people nervous I
have no objections to your plan.
Thanks,
Suren.
