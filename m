Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0600247F6B
	for <linux-doc@vger.kernel.org>; Mon,  3 Jun 2024 07:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717399808; cv=none; b=IhiGMKFQZwOmJ8c5XxsgkKepWIJE9DHqwyr6DrgSMiFy9htPm9dzdJxOEBaTi7IOprEZBNfkd42ritwOhqczMAvf7xcTIuutwA1u6YBjwkz889CQp/8UKU0Eb7Px6f9GaLPNTP7l1KFhfccA3g3m+VbpDEEy9tfajtRD5Thj4L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717399808; c=relaxed/simple;
	bh=TBaGszon3mFIeXU68gQM5CDSneTfzPvNaj6TyqTP1Q8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kH5SsVwx4J0uWPrz95iQSBjMRzQABfvAt5bqzelul5KL46rRW9zhlcGnyDwfk3U/0ZBwg/JWWUJ2rLvBFOfI0TFSXlolCORwDfD3WjRwZcpXQ1ODotXwEqhfr5qTR1+ri72Q4y+Nko1B8pbQD4PQ/O8K40HX0JAkRKnv+Te7NNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BIwU9Rs9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BIwU9Rs9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717399806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ouM0sg5bJmUOXnAkDCV0pxODjPk5RxFX/OfwRyv9Vzs=;
	b=BIwU9Rs9E9VrpAdJUoQ3kk0UxOU98k/0ml2q6Pia++0DD+JNWp5GOB5NtqowoIvyW6MfM1
	mt5TggqCBoCisKkssvd01iu7/zYrXKe2n8lVvw4SGj44rmZGWoAVM49S4EHuJ7a7+A9mB7
	2QIrTZEyA6tBmy4MF2UYmASrfGB72B8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-XrZpc5FmN8Oi51KsquLlZg-1; Mon, 03 Jun 2024 03:30:02 -0400
X-MC-Unique: XrZpc5FmN8Oi51KsquLlZg-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7027585e006so345864b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Jun 2024 00:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717399801; x=1718004601;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouM0sg5bJmUOXnAkDCV0pxODjPk5RxFX/OfwRyv9Vzs=;
        b=DtTG3VjpEwr5nWQemIAggnKEoVSvHPL7UABGKUbFTMguRparpXltgRcPxKmCSoub6o
         NDKPoN79CH/M53oMtQrQHpxD88s8ZtEOY/vQAsxJVfZhOTc704dRGzgT4GYZ/pIrjvhv
         jwory8LCf7c4zWnRsfNPo7I9gymw80gVqmgaAWM9eI/N2BJvYxvlxb4HjZmgAUw280Et
         wIZ5pya7eNVAVOT2yGVs+bgGGWv+CoddT8NzPQFbLjpJnJVk344PxCpcJNOfjq5mW8Lo
         gSGz97Ft4YrqFLyiM3pruiHnahorbCmWCNg4Zs1ohNzVrdXM3xp49rXMK3UySGK3Vlv3
         tb2A==
X-Forwarded-Encrypted: i=1; AJvYcCUNoPRplz1YVufMf5B1dk8KbOXb0QfocritzelD4ujg36ogIWHp22VKghXRsdjrJbrnKezV7jDKGyO1qWD1y+jU5I/+1o6kqckJ
X-Gm-Message-State: AOJu0YyPSbFGx/wAY3X4G+75I/YSg5PWjCbIY7FQI9NXYFLrqPeb3SU/
	2jdePUVKG7pod02ZMnlhqsjvS/fg56WElwUWiNfd9Pp6ACreOvdk1UPkFyho1InjKg0BOfO6bm0
	k1bXom5YHsuzlY/MF9dhni9OHmc/qnrnmStS1YJ6wtvSdJvN3lRmINrtCdg==
X-Received: by 2002:a05:6a00:98a:b0:702:3a47:2b1b with SMTP id d2e1a72fcca58-7024780ceefmr12740152b3a.20.1717399801175;
        Mon, 03 Jun 2024 00:30:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpkWa3SzJr0Rdd/mO37tXK8peMm9jhly2t+o9IOFzY7JHX4dNSgYjdYw2iplWMW+34Bbottw==
X-Received: by 2002:a05:6a00:98a:b0:702:3a47:2b1b with SMTP id d2e1a72fcca58-7024780ceefmr12740132b3a.20.1717399800748;
        Mon, 03 Jun 2024 00:30:00 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423cf27fsm5085996b3a.12.2024.06.03.00.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 00:30:00 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 3728113850D8; Mon, 03 Jun 2024 09:29:55 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Eric Dumazet <edumazet@google.com>, Petr Machata <petrm@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Ido Schimmel <idosch@nvidia.com>, David Ahern
 <dsahern@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next 2/4] net: ipv4: Add a sysctl to set multipath
 hash seed
In-Reply-To: <CANn89iL8P68pHvCKy242Z6ggWsceK4_TWMr7OakS3guRok=_gw@mail.gmail.com>
References: <20240529111844.13330-1-petrm@nvidia.com>
 <20240529111844.13330-3-petrm@nvidia.com>
 <CANn89iL8P68pHvCKy242Z6ggWsceK4_TWMr7OakS3guRok=_gw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 03 Jun 2024 09:29:55 +0200
Message-ID: <875xuqiivg.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Eric Dumazet <edumazet@google.com> writes:

> On Wed, May 29, 2024 at 1:21=E2=80=AFPM Petr Machata <petrm@nvidia.com> w=
rote:
>>
>> When calculating hashes for the purpose of multipath forwarding, both IP=
v4
>> and IPv6 code currently fall back on flow_hash_from_keys(). That uses a
>> randomly-generated seed. That's a fine choice by default, but unfortunat=
ely
>> some deployments may need a tighter control over the seed used.
>>
>> In this patch, make the seed configurable by adding a new sysctl key,
>> net.ipv4.fib_multipath_hash_seed to control the seed. This seed is used
>> specifically for multipath forwarding and not for the other concerns that
>> flow_hash_from_keys() is used for, such as queue selection. Expose the k=
nob
>> as sysctl because other such settings, such as headers to hash, are also
>> handled that way. Like those, the multipath hash seed is a per-netns
>> variable.
>>
>> Despite being placed in the net.ipv4 namespace, the multipath seed sysctl
>> is used for both IPv4 and IPv6, similarly to e.g. a number of TCP
>> variables.
>>
> ...
>
>> +       rtnl_lock();
>> +       old =3D rcu_replace_pointer_rtnl(net->ipv4.sysctl_fib_multipath_=
hash_seed,
>> +                                      mphs);
>> +       rtnl_unlock();
>> +
>
> In case you keep RCU for the next version, please do not use rtnl_lock() =
here.
>
> A simple xchg() will work just fine.
>
> old =3D xchg((__force struct struct sysctl_fib_multipath_hash_seed
> **)&net->ipv4.sysctl_fib_multipath_hash_seed,
>                  mphs);

We added a macro to do this kind of thing without triggering any of the
RCU type linter warnings, in:

76c8eaafe4f0 ("rcu: Create an unrcu_pointer() to remove __rcu from a pointe=
r")

So as an alternative to open-coding the cast, something like this could
work - I guess it's mostly a matter of taste:

old =3D unrcu_pointer(xchg(&net->ipv4.sysctl_fib_multipath_hash_seed, RCU_I=
NITIALIZER(mphs)));

-Toke

