Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503583B6340
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 20:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779222794; cv=pass; b=WYBRGUhNaDcJvt3EMycSyYkD6APef31qvX7Wkhus5gzA73xu7QChqKcYIv7AZfyvvMtxjX131fTLAyOZfNnc3/vWKXLC6tyQ2THeWY01Ny0Vw3u7KBgvBP5CCKXK3YcY0+LBzdwvOMlXApxp/nP2b/pUsmhxQ/rI6R14WIZJS1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779222794; c=relaxed/simple;
	bh=xDYLrGydvdDUag342oQXfooXnJpQsQ+DkeB1khpduxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXw84idCsSrMNdKSqwsemr0B+rJM0bAlSOFQjQfYCV3s7/3NVaNCcb5VaYIlwquVQNyhcLi1Z5GqGPUOFnSw5LgLKWMIez76pG2LtTaAhJn5/FJfvPAKQ7PhJdTFaioQxixNhJKjSwHyINjAnAg0xmPGrIbeSu9w/5KKyGpr6go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=GbCk6K2w; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="GbCk6K2w"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8027e876fcso1754097a12.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779222793; cv=none;
        d=google.com; s=arc-20240605;
        b=XVHohMUi3o5xvyLV2HHaDzyZtLvbF6JbwbbeYlLCdgd6PUURSvtgYkRjQjnUUePOdw
         hVeqQYImG83PpDFeDrpa3TysdzzwCbWHHTTFx1IF0y224VmWapi+9DNkEF9rSrt8HOZA
         1NpJdg2ACtItdELme712Xs5Jbtfdg0UEegMrfME4u6TUsiMGzKWcfNZbEwZ4wsRrH3P/
         2l4EIbYwlydxhlyCShoch0czsdqzFUzAfFUPKwstN8+806JdVFQNWNBScpjZWlO1+ld9
         c9cUvmpWtGICXvJZb1NyNzQd86RnfWVgiuIJo8WM2ptD+ELqUPNtYsBdADdACb3XT677
         mIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sYPyOA3Rtu9ZHZqq3A5dveESFOwy6WeEsdfBtKhsDgk=;
        fh=S564CyiayG+ek9MFbm8WPe3JaRIQhMDKmzmq0YxpJ50=;
        b=IsFHoohp8R8pep8wyPrgmbJFryvNU0V3KjWxFw/2MkkFFqLw9ib/IssRrfE7wspRkP
         ucyV1adlJFgAmHRPtpIl+LlCNTtiMEAXFUFlZogc0uCU1aufxdIiXWmbjSsV4ozfWfnz
         QeIb+xXW18pM/XzG47p5NTHQxoQ8qCTZYBT08A5YDX8xqkrcmUzYz2T6eBGFvNv5Cs62
         Sv9CgijjOH0F4OILSFIc2erPUuI2iTatIjZC/feaqW9hyCMhski37eCW9iTRbP6wAhcM
         pRUz/jUAI5oFe5ZX04JNYp18bjES4dki+dWvZr+EVg9oFL0jHocph2cr5N04snSHdo1A
         9zIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779222793; x=1779827593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYPyOA3Rtu9ZHZqq3A5dveESFOwy6WeEsdfBtKhsDgk=;
        b=GbCk6K2wIXg28uwwXxFQ/qGMVCX6ONXIoZCiPgQbjF4kvcixxOK0TugCvISaRwVBn8
         XEaKbnr7nusCRAE0zxw3ejto6KlIg6puTJYHKc9jZ0KmelYXVhAXtbSm+xBKvLUTxgCA
         59oI7dztEPYmpU3AwvoCw22C5BWIj8BD3mr1SiUwS6uAUVuvCbyWQdSLurPP2Hmz817d
         tZU8D2rhpf0itdZ64YZa6My80jT5E0RHusnp9UL1jWIKWN6KZs4L3AnSu0H/7eFRDmu0
         HwqkqP5ECrzpr0MaPdNeULttZppkploMdhjs7bOf12vhIpxrDFUdi6fvRxal2UZJe1ra
         ZAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779222793; x=1779827593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sYPyOA3Rtu9ZHZqq3A5dveESFOwy6WeEsdfBtKhsDgk=;
        b=VC76riSZP7wUlgz4RVTemu8J5Df9k6fE1ciTP1uyc3pZAQHoJKw4ApYZO1Vv4wcZsl
         8pm0XEidjRtRXENBVP1MhAlR6GGFPo44aFbD5ZtEiT/AOlU3qmF/KvqkHr2yYvwR68dZ
         mKo+qiRXMG+ufsSI2KXIEVBQUA7CyHKWtooy7IE1Hluof/pEyYIxVNPjj0IigBnsFetF
         SncuSTlnOQ+RqtUxbGaDNoPvGLp5eAub1H1kPvAjF8tKTgu6dZ1kEUUZEGaHQIrmJp9s
         Xe9PjHGSzQ2p46k27n3yVkPzmwB/WE5yaSLdus524YaPiOcex6Y6bZxVLKsyV/eVqnS4
         4y9w==
X-Forwarded-Encrypted: i=1; AFNElJ8tvH9cA3VPIfOdn49efJzVjYrFsgHlJ+KZf+OZ3sb89d3f8nf7rDmNizAD1nQp+s94Gk+8YjFLYC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywybx2h6jGh6O7MGGXIGdF10wi+suNODuhHY8Mq420L1M7O3DBG
	Q6TF7/vEpUEZYgqOjbiChGipLOrqRxnoRRRQnlcPajAI8kFhPgXR8PtXD3oNzStBihDI5crzT2o
	yInwTiZPdn0kc+V6Nec0+izyXN0WmBPZUT+PzzOe7
X-Gm-Gg: Acq92OFfeAKNpTUeUaEXHa8VrhyHwLBqZMb+tTKARABHhpIbp8Y859SpRq2tQ0u+bpP
	r3XkQJUqOo8tadIMyI6Og3C2r4T3cJFznD+nRT+Hk/10/jxOzfrLs4P/dwd7ODh4DaRHzAvrK91
	BRG4M6h2wQfczwnGmhD9WrugkHjpT8iafpVSD8BdBccmPeL56JU+QtafjfOh2slyjYyAUMcjBo+
	Ykl8zqlgZMpblQsg/aMx8SGARhOdQtoGCGufy9g1sl53/UTIjt5g1jQSMOpCfnFzn/lFU0L27DT
	M6YFgWY11qByOvRkIw==
X-Received: by 2002:a05:6a20:939d:b0:3aa:c99b:5c64 with SMTP id
 adf61e73a8af0-3b22ec58a69mr25040640637.42.1779222792589; Tue, 19 May 2026
 13:33:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org> <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
 <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
 <CAHC9VhS1DJNs9gDB6gD9WKhL08giSVajBskZ+=mY0AWRCAsw7Q@mail.gmail.com>
 <aguvV8QCxK28ZHct@laps> <CAPhsuW7Rhdh62AoceQpsfm0+kVsvz8zq97fupm4mtBEyVTkkcg@mail.gmail.com>
In-Reply-To: <CAPhsuW7Rhdh62AoceQpsfm0+kVsvz8zq97fupm4mtBEyVTkkcg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 19 May 2026 16:33:00 -0400
X-Gm-Features: AVHnY4JRRQcTVbhrcqMWkMq0TNU3br2FjZXs2xDjkFMyXvEps6l2ylKGgBsI8Eg
Message-ID: <CAHC9VhTv8sAgpP9Bd-_tZftemSVEQC5R5jkJ2mVGqiYnLj1KxQ@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Song Liu <song@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net, akpm@linux-foundation.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 1:29=E2=80=AFAM Song Liu <song@kernel.org> wrote:
> On Mon, May 18, 2026 at 5:31=E2=80=AFPM Sasha Levin <sashal@kernel.org> w=
rote:
> >
> > On Mon, May 18, 2026 at 05:29:32PM -0400, Paul Moore wrote:
> > >From my perspective there are two different issues here: should
> > >killswitch be a LSM, and should killswitch leverage kprobes to be able
> > >to "kill" security related symbols.  After all, are we okay with
> > >killswitch killing capable() and friends?
> >
> > killswitch doesn't do it on it's own. It may be instructed by root to d=
o that,
> > at which point that is root's problem.
> >
> > >In my opinion, making killswitch an LSM is more of a procedural item
> > >that deals with how we view a capability like killswitch.  I
> > >personally view killswitch as somewhat similar to Lockdown, which is
> > >why I made the suggestion.
> >
> > Maybe I'm not all that familiar with LSMs, but we would need to be able=
 to stop
> > "random" code paths from executing, and I don't think we can create LSM=
 hooks
> > at that granularity, no?
>
> There are much fewer LSM hooks than ftrace-able (killswitch-able)
> functions. In this sense, killswitch is more granular.

I don't know if I would say it is necessarily more granular as its
ability to filter access is limited to a breakpoint set on a symbol,
but killswitch definitely has a larger quantity of control points.

> However, LSM
> hooks allow LSM policies to make different decisions for different
> arguments. In this sense, LSM hooks are more granular than
> killswitch, as killswitch can only set a fixed return value for each
> engaged function.

Yes, I think we agree here.

> With current LSM solutions, we can mitigate issues like Copy Fail
> without breaking other features of the system. In [1], Cloudflare
> shared how they mitigate Copy Fail with BPF LSM.

... and Android has been shown to not be vulnerable in the first place
due to their use of SELinux and a well crafted SELinux policy.

--=20
paul-moore.com
