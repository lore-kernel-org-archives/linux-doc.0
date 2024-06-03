Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F00658AC4
	for <linux-doc@vger.kernel.org>; Mon,  3 Jun 2024 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717403171; cv=none; b=NdigwXroiqZ/aVdsFtNIxEbyIDGa2uyqC8Aw0nUCS+nLEuEWxA0o++ywwMd4eIV7tSEaYdGr9uwJS6kj2xTut2BZNJb9lP9C1C9qPty7KHfVROZ7nuzBH8YN9cX+DQpNYaD9OyBMVMrMgQEl/K3F0xm6Jpaj6On22jTLweRcCoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717403171; c=relaxed/simple;
	bh=bSiPANs1zqvcKZQI2zpHQ/6pcDeUisEkCeFQwKMGNtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDVkwccUUf9JFg74EJPeoFjeWNUGYmqcKcjusWAm+4p9pU7IrGxiwnyqoMI93u47e1sEIS8yTF/qBIm7gwkWtevo4iuGOb/CqNnarX41WKTa6Kxd1XXmyN8SqNWkfUM4tFemR6hclwkUqg0R2nEhmdEayo8XLhdwigbwjjlqGGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fC2hui4T; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fC2hui4T"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5750a8737e5so15065a12.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Jun 2024 01:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717403169; x=1718007969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8dFqRUzN06I6td+1eA8YESyOb42WkNK5puVp1UusMM=;
        b=fC2hui4T3F52MLqPAbUVUUU0xfxICcCYkISNVk14KUO/WWV6RRs3QJI8aWAAuJ+TCb
         PRbfKMhCG7Rd3bHxrk6mY4o27b//w+mYyGhsTo8Q5MeTo0MsvY7QYb7vl7sgz24L+/sA
         VZiRfQPRVlxWp1sLOdGeiwitOUaR0TVVG5cCN1bUWkvRzOekWqLY/T+OV3AkQKMhr5q4
         h7e9e6MiUf7+dKFcqlsQhLOukCofDzzj/GoQKcLzLTPFaC6fu9Lxf5punwIzMf1zVFyo
         NcsDRFHsJD65Ty29jjenS6qqpiqO58mUlMGKdLIvWEKbVAqOmOGp+9KEKAot/D4+hki2
         NSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717403169; x=1718007969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8dFqRUzN06I6td+1eA8YESyOb42WkNK5puVp1UusMM=;
        b=cy8eStsxQpAno6HUQ19YyQQmnWGQDaC9/kb/luvi4eMCzMIBYlC8J0sv78IztjITVj
         2mPKRjFiK8w/Tnw0vK/PNu96fv3Q4I1tOZkdX3nonvrEqAeRfbmwgeBPTDvAuvHAlkLR
         6JpW/C+0C5AB8W252+SHD3eegWpsFau1dHWf4P7WjDAxde6u7ApI+E+iiTSeKSO0kU8Y
         hmrxSN3E2tMTdBdZefMOK5v2XStB3lPDBSiIHUzHffUxLUXvSAYnnjJvqphcnaNxSgjB
         08CM/OqEgDKh2/DyC3nzkDTk6F/PCg8cOXPgh1/bJco0bETHUBpfIR9hOP8t0vKeJhLz
         /3LA==
X-Forwarded-Encrypted: i=1; AJvYcCUBgQblMspwIEZ5E61kxN9G+Zzcj7vaTBWt3gozSLR64fpVz8vafZjlb6X2Tfll9vhZijx8h8LBK7tYyUV5huSUGYliTwPLgGtA
X-Gm-Message-State: AOJu0Yy1bMxD2AlbhHidPh2CEhuiemBij8VeHnNrm5BwzlY/iiUUanNH
	Ys9gUU5xRPUYTCTzzHxv86wY1gfgmwuHzOceWQtP0eSYvtNh427WJsjqtIaGudyEZhsfG2kQu2T
	lWwKwOvwUalSGqz4o8RksW7t5jecVYJPs9xyX
X-Google-Smtp-Source: AGHT+IGZuDthXbWoFSnEQ7MaNweVS5sD7QeK3KCUOLuZLtw+fgjft1YjRnq0rFgcK1OXGLQN/XyrGOdazbJuRadceCA=
X-Received: by 2002:a50:ee85:0:b0:57a:22c8:2d3c with SMTP id
 4fb4d7f45d1cf-57a45f1cde0mr245850a12.0.1717403168431; Mon, 03 Jun 2024
 01:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529111844.13330-1-petrm@nvidia.com> <20240529111844.13330-3-petrm@nvidia.com>
 <CANn89iL8P68pHvCKy242Z6ggWsceK4_TWMr7OakS3guRok=_gw@mail.gmail.com> <875xuqiivg.fsf@toke.dk>
In-Reply-To: <875xuqiivg.fsf@toke.dk>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 3 Jun 2024 10:25:54 +0200
Message-ID: <CANn89iJ5UzQGBMNvZJqknuTCn13Ov4pXp7Rr+pq0G+BkJ53g7Q@mail.gmail.com>
Subject: Re: [PATCH net-next 2/4] net: ipv4: Add a sysctl to set multipath
 hash seed
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: Petr Machata <petrm@nvidia.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	Ido Schimmel <idosch@nvidia.com>, David Ahern <dsahern@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 9:30=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgensen <to=
ke@redhat.com> wrote:
>
> Eric Dumazet <edumazet@google.com> writes:
>
> > On Wed, May 29, 2024 at 1:21=E2=80=AFPM Petr Machata <petrm@nvidia.com>=
 wrote:
> >>
> >> When calculating hashes for the purpose of multipath forwarding, both =
IPv4
> >> and IPv6 code currently fall back on flow_hash_from_keys(). That uses =
a
> >> randomly-generated seed. That's a fine choice by default, but unfortun=
ately
> >> some deployments may need a tighter control over the seed used.
> >>
> >> In this patch, make the seed configurable by adding a new sysctl key,
> >> net.ipv4.fib_multipath_hash_seed to control the seed. This seed is use=
d
> >> specifically for multipath forwarding and not for the other concerns t=
hat
> >> flow_hash_from_keys() is used for, such as queue selection. Expose the=
 knob
> >> as sysctl because other such settings, such as headers to hash, are al=
so
> >> handled that way. Like those, the multipath hash seed is a per-netns
> >> variable.
> >>
> >> Despite being placed in the net.ipv4 namespace, the multipath seed sys=
ctl
> >> is used for both IPv4 and IPv6, similarly to e.g. a number of TCP
> >> variables.
> >>
> > ...
> >
> >> +       rtnl_lock();
> >> +       old =3D rcu_replace_pointer_rtnl(net->ipv4.sysctl_fib_multipat=
h_hash_seed,
> >> +                                      mphs);
> >> +       rtnl_unlock();
> >> +
> >
> > In case you keep RCU for the next version, please do not use rtnl_lock(=
) here.
> >
> > A simple xchg() will work just fine.
> >
> > old =3D xchg((__force struct struct sysctl_fib_multipath_hash_seed
> > **)&net->ipv4.sysctl_fib_multipath_hash_seed,
> >                  mphs);
>
> We added a macro to do this kind of thing without triggering any of the
> RCU type linter warnings, in:
>
> 76c8eaafe4f0 ("rcu: Create an unrcu_pointer() to remove __rcu from a poin=
ter")
>
> So as an alternative to open-coding the cast, something like this could
> work - I guess it's mostly a matter of taste:
>
> old =3D unrcu_pointer(xchg(&net->ipv4.sysctl_fib_multipath_hash_seed, RCU=
_INITIALIZER(mphs)));

Good to know, thanks.

Not sure why __kernel qualifier has been put there.
