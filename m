Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBB830F531
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 02:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777517199; cv=pass; b=OkHm3YNrSReEUnQt6NfAYcTF6m71ncSBO+gxhwo3v/NsSdDVsFh33u3fDnUp60JOx1M5v6BQtKLvlg9Bkdlg4E+StPyLScW/3VClHHGVgVtJVwI1UNnU+02HXB11EFyW0xf88fsD7NHAP+MGXBn24T4ocmECqunUaIs9uvv9CYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777517199; c=relaxed/simple;
	bh=aT11hkKef07wVt5TZXMpjctyPu05lHXAD49tSMD9BFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nu6Fq8ZKg18HEp2bTFV3Zfye4tH7AvcBK/O5ZhaTuQphoaeHGuRWPwuFHyjqjBazJFCcHx66Mpj2m92fNbyxrxk304JLUIzTDo3AzO5v9iaeITEFGVMGn+88LNpWnyn1GM/m7zkYrOv0Mhs7MV7KSOy9mrWe0ZXHJCxV2RmDges=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d4MUZKEu; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d4MUZKEu"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8ee7ffd738dso147625385a.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 19:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777517195; cv=none;
        d=google.com; s=arc-20240605;
        b=QvP8luajjMPAVtdS/EuaFEwB0TJSEH02RRYM5vLrG4X9BSSk060Bywy2L0zz3NAAol
         Zh85hn4xxEHfVs0i7fHRDnMdqLO8OSOHSxSjlkvefyPK9WRVpFGUtzJoKN4R7oPj0wJ+
         BhVK7r9gAGEyIfOExI5wKufbVpxEt50SoBRySpT4RSU1pPqXKME1LKnBDQfqdvpJCdNR
         zexs+4wIT+UFjFKU67uDcyc266i2sfBbai80eIjIG1G2q5zUxsi3erjkQAYyHT8JxHji
         EIeRMqlg3PKPYjkHA1EsmtL33BqIICbBn0w0hUIvEeNgucAGoZljwZKOAgjcMqHJi6ej
         M8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eSsA+Kw8J1H0AN7uzgMjjhL2cMAl5C4DIDhT6f092dg=;
        fh=mialB9NNN/eicW1TBdkthPlwk3ab9uABHLZLATeafAQ=;
        b=S1lcrc4bFPv4kUwLIm9lwvzrwNzsvOtMkyjS7cDl9eduQPH7B3YZWIk4BXeE+pA2l+
         JMeZgdGCYM88Z01q4BWgIp8ellu+o7hf/a3ybb1Dh2WjNTtWjdhjijj9QKkMYDUO8VYZ
         Nd0i6qr3JFcIRZOstuqeoMjDZpzlfbof/ToKFcuFZn8bs9EChtE9fqhj5QDgl8x5JP3d
         QHqnSHSFCh/CA29kzj3GUU1/3V8ETWRDy8t2BgLS8KnvSNG9dr8hjjVKdyGCrYYcnVq9
         I+FLqiw5DpjKqj8PFbj9qcyymY2LVE2Rd+P9J+2Hv2xRMaMWrEWwtlein9wga0X+1wje
         He3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777517195; x=1778121995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSsA+Kw8J1H0AN7uzgMjjhL2cMAl5C4DIDhT6f092dg=;
        b=d4MUZKEuWVjYak/nY3toeGapT3AruxjY+iP/uu7qUs1RkzF1bv2Rt27gf9zam/UL1g
         ayUO85u1QcT6WuMn0QNzLuuJyEhBbJbaxOYdrdnKmyyjVeDl/hiL87N3NKnb/nlcp2H6
         9b2nGgcOlQGz/UFblbuq28mOZBPWPIwtWfj8t3D5kdZB1I3S7h8seCERZzkOwzyTVptc
         exkj6A2Neeew4DQ36/UBO+Ore0tYRvpiIhYSgca+Wfwgv/OYXzBZzj8vvJiNxoNYuWf5
         OmPbl0zO9hh6gHpRyUjtIKJwtYLpbUHcnvl3NdrhhaHns/9dc06BaIADqJ5vvoZSIF2n
         iaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777517195; x=1778121995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSsA+Kw8J1H0AN7uzgMjjhL2cMAl5C4DIDhT6f092dg=;
        b=FykyIR02upuMIXH+oypSBG1fBI1nD/yYZiB3W0BYfoRFU9m1+sYQwXdR/wdKBLvUBQ
         Od1LfXHxs97wIkyAehcXl9KOTZ4jYs0PQdbJCNEdmpes811t/zwDkt0a8y27Bobr6x+8
         DiBSTHIyc1vRnOYh7WSGrrbj8ytm1PjYXiLlcrxQ0Lwb3zNdalpX/d+SR3UKt70xEnTk
         YUEpAn9EMBkHq+fvFsuD8e1Z4cGhDBJlGXs/UPYkJ6rZDPhJByYssYvUGFqN1zayw+IZ
         zTpX9FULLmU8KZPRF971xgHU9GseOdt4AwphraF3HaX+7jex1TAO54eGp2xk2VnqZdb+
         ee2w==
X-Forwarded-Encrypted: i=1; AFNElJ/p5DdIeVp+KxNGKMW4qoOjxLmyj/NQVCVnPYt3H9yopc1BUpyMyCIbeEmo35aYwVDOo50ML+0yGN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS78CVSRM2yGkqTQ8n6LHzMKIYe9O5RpHMbACKPmOkwupUTNMH
	iRVcDoooG1NTXO+6b/Z72KVIAt4sIu5fuBy24Gwd6ag3hJDuJ+fzDGAYVMa7qFPFCGrx49dj+WU
	zeAhCAfWzVA320Y+r1IJT1nP3IqCdGqVvzb6N72qA
X-Gm-Gg: AeBDiesdVE8N/Ah65etaIfRRaH6CooDYEx9NceF5GjFd7kesSkwpbOtcEOTNMU10I1P
	q8byFcKIuzQIKCCkO+AomI851qpsIMHlrXOF4CVRrvyDCFvtE1KZYOEAdtyleYiqqpe9aRgc4RK
	Nj+Y5xY0EAnBL3d+B37NkAb702cgv72Ukga5zCRzgCFothqRKK+GSzdxxBWZLIDEVi1Fcn1AbRY
	7JwpxghC8mHweezlJI0pwKvjQG0fzMlrYfJyuvToBK1WwVZcqRrQtDSDTqsRNK0P4hsCoSuv8l3
	moHVU/nL0Oq/FGZIgqQpSBIIjjIfuzjYqM8mccUDjZs/dXlwpi0BKcHsFrzgL+KoNQP2THAsGp2
	WmeOtWrU=
X-Received: by 2002:a05:622a:514:b0:50d:3efd:bd93 with SMTP id
 d75a77b69052e-5102d0d3e87mr7791921cf.11.1777517195076; Wed, 29 Apr 2026
 19:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TY7PR01MB172057C053E8D550485A29A08E0352@TY7PR01MB17205.jpnprd01.prod.outlook.com>
In-Reply-To: <TY7PR01MB172057C053E8D550485A29A08E0352@TY7PR01MB17205.jpnprd01.prod.outlook.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 29 Apr 2026 19:46:23 -0700
X-Gm-Features: AVHnY4Lwl01Xyj2g07tpoheIVw1AqnWlO4eliacZgKmPEOyIUAmGUIaTS9ZoNBs
Message-ID: <CANn89iJHUEio=hZPkKuh7MZLxQuU1h4RLyB4c6nkWGNifevexg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next 0/3] netns: optionally inherit IPv4 TCP
 sysctls from old net
To: nmreadelf <kong414@outlook.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net, 
	dsahern@kernel.org, horms@kernel.org, chia-yu.chang@nokia-bell-labs.com, 
	idosch@nvidia.com, ij@kernel.org, brauner@kernel.org, jack@suse.cz, 
	kuniyu@google.com, jlayton@kernel.org, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, lance.yang@linux.dev, 
	leon.hwang@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 6:30=E2=80=AFPM nmreadelf <kong414@outlook.com> wro=
te:
>
> a new network namespace starts with built-in TCP defaults.
> In container-heavy setups, operators often tune TCP sysctls in init_net a=
nd then
> need to re-apply the same values for each new netns.
>

There is a mistake here.  init_net is not the same as parent_net (or
old_net in your patches)

unshare -n  # Parent netns might be init_net
unshare -n  # Parent netns is not init_net
...


> This series adds an opt-in mechanism to initialize per-netns IPv4 TCP sys=
ctl
> settings from init_net at netns creation time.
>
> Behavior:
>
> Default is unchanged.
> When net.ipv4.netns_inherit_tcp_sysctls=3D1, new netns inherit
> TCP sysctl from old_net.
>
> nmreadelf (3):
>   ipv4: netns: group copyable TCP sysctls in netns_ipv4
>   net: ipv4: add netns_inherit_tcp_sysctls sysctl
>   tcp: netns: optionally inherit IPv4 TCP sysctls from parent netns
>
>  .../net_cachelines/netns_ipv4_sysctl.rst      | 25 +++----
>  include/net/netns/ipv4.h                      | 33 +++++----
>  net/core/net_namespace.c                      | 72 +++++++++++++++++++
>  net/ipv4/sysctl_net_ipv4.c                    |  9 +++
>  4 files changed, 114 insertions(+), 25 deletions(-)
>
> --
> 2.47.3
>
