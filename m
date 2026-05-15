Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B503F3CF674
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 03:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778816929; cv=pass; b=RQs41XlyKgSALxOrakO3I7cIxa6nEv4+7Qarq2BbHYaGPsD70KrT2MQW6iehGmts518EEpOTk+J45Ktk7tbguIn8IDKq5AgEsqbGEfwUhyV3O0u8Eh3wZAysPryaD7Wcq3Rgm8+VIbpJKsM8xKxyHVFEWD3shB+HTyg/Um9ZmqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778816929; c=relaxed/simple;
	bh=axJimQpTH54Vk+wcEK9CMzTx0gjIcv6uLIP6tuXgnsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o2xNbUSZ5OQvddcMu8z5h9cyVZDV7hWTfSK8TFDL1mKEUGhbhinuVgdgvSE5v0jkIkKJxnX58Q4b/8Xvz4YhUgWFXQadn5ZOi/bualaymzu+vVVstMW2zpmRCh0ZwNk1rjVxgLUWvfHKgldpJWIcKp85JP9ClL/RhuLYl9QCayY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=eCuJcjog; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="eCuJcjog"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso3831037a12.1
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 20:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778816924; cv=none;
        d=google.com; s=arc-20240605;
        b=TTnMsm42cK8uFI0Qq2QwxcH4efaaRztzZAseM8LL+n9+ioVNnzow7/Jg1bBJuucMI3
         aDtywO5lZOQrpNyoadFPvgSgUlWiY8GLT1rNywjJqclmj3OA9ccaPSd3gkloDetjooDx
         wcqSAjKH1VC93doAYGOze/SbmtYCm1AaJjI51f8sk4i4psT8rON+Ub8WqTScPpcV+Pt6
         3SHqvTq/Ph5o9BlndhFfZPitw97yYYXWW+9vI3jabE6U2EjoMhpMzcc/Q2SlSachRwG/
         GaA2Bt6E7AhUqU4HYajai2vAfr4+1Aevg9nrOitP0OeXUgVWh6H+CQoL0i0L7EMDtRtk
         uAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kbAj3QkbSA9sXO8i6EDoM3LNbpdhiqhg3HK+8g7Mcbs=;
        fh=zuXVmt8aTGp699WPF+XyJ32BmNREnrf1HB2SGMkpubU=;
        b=UJqdBmyU9Mu5/nK44Q6RM3JrF4zD6dsHCo4jj5RFfw/9xsmHNh++jBfnGI0CBZHLmr
         PI19OHPJH3lUeWC+X9VH5oUbfMHsEgaRD1+84ZYrsYZPkU8vMDRjDPoz29zceYxsq108
         oKTnhhI7tNNBUXGjUL12iRZavtp39d11h+SKVxBa6FLpjfvdjcDki8/SJcr2aB4rkbXP
         8jM9sMjv58gwPTr63IUkfDyVTciCiC/ymQZwtRVmQJMA+4hPHYer16CQrLxpRrk9Pbzd
         K611oqYLbgNYfuJHMu9cVRavEyDssj4CO8Vb2U8AnXwfNOq78OwisJ0KjKoq2tjZeFow
         cDaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778816924; x=1779421724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbAj3QkbSA9sXO8i6EDoM3LNbpdhiqhg3HK+8g7Mcbs=;
        b=eCuJcjogazgHx1HmwNxl9a51S3GLjs5pS4nDxe37/8LXdA5Fu20goCgJtAKS42+Cor
         mHvNYms0FnDGEwfsiM7okmTbroOVgHRULZWDAUGjSqqm2uW6r4QYOeNXDTf+xkXkOAiq
         65BxlH+Eo/WolkI1yV/IpGAP6AWP52cMtBLNwXtI5vfDmltmGae2mNMOLAlQvtbXUeLC
         j9kZnmJfUEN+Q481D79Rsui32+CMPNJhP+4XqD9nBglVufmX1xONPMSyZVa7oS0mviop
         Ic83TUblVdcReOEiWKWyt0tqysvXvQ4IJfXhQmN++N89i0is1gU0xe9EJNz/lSyzdYEK
         e1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778816924; x=1779421724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbAj3QkbSA9sXO8i6EDoM3LNbpdhiqhg3HK+8g7Mcbs=;
        b=ajf3MRsjaZWdRb4UiYbaM5mALQ8+zgHDMINkHu+9qqexs2POUT0GCLy/QBwTf7X3CF
         slmU4cu4XCRY2Vt6HBAhvUgYtqb23XJvgwH7lCdqo5i3IyTkXfqDanOAgXGH+j0/c/Mx
         3CXZ6o7xaNDpKbCwMr0BecJHkZLagiFQaJaIt+A7KiRiI65nOAJsFdl/4WEjUQOBHEbs
         ZaadfmFv/tkdfXl2ofZ06khANU8Jku8IyKLZxHE/IArkISbl7gp/QFuJGmubtpVqp3eT
         nWZ+cmmuIkhB7imlOzsN/L0xWh45Vk8M5TUhWYW1cZoCi7AN1hQxaojooFy5UmrKTWUs
         BVgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GW9/saA6oNWJ+3bmFlXXLFwsR3qLfp+pq6cXagacSiOsW2iIK2fyltQPW5ww6r2DufArNUb3KSXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWxmw71pJze3Shg0Y9yPXH/nTHBLn9BFgmpyKK292amgJts09J
	FD8sFOZEQYYQi4c/GZTxKnqYZrLwAzZ34Xpx55rCLhHm4S/ITUh3EcFjz20tccZi+7bNWs8PYV2
	33j7mhiZSQXPBBYWaD9AbfQubZYGJ6ywQckm0xg75
X-Gm-Gg: Acq92OGlX1j9TTF0zr7wUdNf9tpNWx8uMrOm3Wi5x36ONol+DFtlOWZWK/qXDR5QP4i
	p8QYH6q+VVqMh1OqGOqOPnKKs6nVo4CJ6eiE/Z6sQgPbwiR/nwRH4H1kx1iZMz88iwErAuyayTD
	PAFaGRR5ft651w3mrm18wLzGHvNvOPiBxunCAkGO5SCqB3eLajsRcB4PymHHJZOL7sUxO1Sz8Is
	fffQuFbpyDPNE454e6pMlxOdjAQBKignsbIe6U5HwnhQecyFgbWUuwhB/CosJwMQsZgFu2gKB05
	Mln4904=
X-Received: by 2002:a17:903:1b4c:b0:2ba:7610:3f21 with SMTP id
 d9443c01a7336-2bd7e802964mr23892325ad.5.1778816924539; Thu, 14 May 2026
 20:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org>
In-Reply-To: <20260507070547.2268452-1-sashal@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 14 May 2026 23:48:32 -0400
X-Gm-Features: AVHnY4IFjeygqhvOWHf7nnff2hcSoElhRffZjECjs-fQ1g-cwaO4KY2xNXWLrHM
Message-ID: <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, akpm@linux-foundation.org, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 3:05=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> When a (security) issue goes public, fleets stay exposed until a patched =
kernel
> is built, distributed, and rebooted into.
>
> For many such issues the simplest mitigation is to stop calling the buggy
> function. Killswitch provides that. An admin writes:
>
>     echo "engage af_alg_sendmsg -1" \
>         > /sys/kernel/security/killswitch/control
>
> After this, af_alg_sendmsg() returns -EPERM on every call without
> running its body. The mitigation takes effect immediately, and is dropped=
 on
> the next reboot.
>
> A lot of recent kernel issues sit in code paths most installs only have e=
nabled
> to support a relative minority of users: AF_ALG, ksmbd, nf_tables, vsock,=
 ax25,
> and friends.
>
> For most users, the cost of "this socket family stops working for the day=
" is
> much smaller than the cost of running a known vulnerable kernel until the=
 fix
> land.
>
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/admin-guide/index.rst           |   1 +
>  Documentation/admin-guide/killswitch.rst      | 159 ++++
>  Documentation/admin-guide/tainted-kernels.rst |   8 +
>  MAINTAINERS                                   |  11 +
>  include/linux/killswitch.h                    |  19 +
>  include/linux/panic.h                         |   3 +-
>  init/Kconfig                                  |   2 +
>  kernel/Kconfig.killswitch                     |  31 +
>  kernel/Makefile                               |   1 +
>  kernel/killswitch.c                           | 798 ++++++++++++++++++
>  kernel/panic.c                                |   1 +
>  lib/Kconfig.debug                             |  13 +
>  lib/Makefile                                  |   1 +
>  lib/test_killswitch.c                         |  85 ++
>  tools/testing/selftests/Makefile              |   1 +
>  tools/testing/selftests/killswitch/.gitignore |   1 +
>  tools/testing/selftests/killswitch/Makefile   |   8 +
>  .../selftests/killswitch/cve_31431_test.c     | 162 ++++
>  .../selftests/killswitch/killswitch_test.sh   | 147 ++++
>  19 files changed, 1451 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/admin-guide/killswitch.rst
>  create mode 100644 include/linux/killswitch.h
>  create mode 100644 kernel/Kconfig.killswitch
>  create mode 100644 kernel/killswitch.c
>  create mode 100644 lib/test_killswitch.c
>  create mode 100644 tools/testing/selftests/killswitch/.gitignore
>  create mode 100644 tools/testing/selftests/killswitch/Makefile
>  create mode 100644 tools/testing/selftests/killswitch/cve_31431_test.c
>  create mode 100755 tools/testing/selftests/killswitch/killswitch_test.sh

If we made Lockdown an LSM, we should probably also make killswitch an LSM.

For the LSM crowd who might be seeing this for the first time, the
original thread can be found on lore via the link below:
https://lore.kernel.org/all/20260507070547.2268452-1-sashal@kernel.org

--=20
paul-moore.com
