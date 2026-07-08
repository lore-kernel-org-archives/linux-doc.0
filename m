Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06703F8248
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 21:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547330; cv=pass; b=WnpUCYUOpjDoFnFQZZkp3s7FhhuR9wBeDBEqwdhrTpI40H5dv7Nvduy9Lbz2McHxEefDeI0kdqRxL66KjhNsHKxfSykc6g92VmVFmmqj9wfDDq2DAor1X6l1dzgYcn92p0YR1mvIxkXFiBSiM3g4e5niDnsz3wM3ILpVLky+R90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547330; c=relaxed/simple;
	bh=NLMDF7I6FstMAQAeirtdi6wuSf+np5zuq01Umjpc8ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obVHnW8/YoH+dxL1jf6KavFcS9Gq4t/z0OQIZ0pwA+7f8hchXlGQ2S+KNePlG9VlRvwPwp4g52t8BfAyMUWZNxSILs7UsTjlewS3GEOUZ2CgWS4uZaxDRl8GKqONiW6mmFrw+1uyL543w3Nof5Fdc3HMxLS4Q5LF7eIYv8dnSos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=snlbuN0T; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="snlbuN0T"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-698b78c05b0so1849a12.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 14:48:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783547327; cv=none;
        d=google.com; s=arc-20260327;
        b=IX+FZdGty7ha78RcDC9MuK1f5p0pEm2GhVQ7FwQ6D+wvZtNbDiY8k+BHYFfxh0Y6MB
         IZojjjJreDHj6BOpekaUfw84hHppC2lNdtW0ZsUWPlqJaUBOK0KdG+QZuvQ9aOEdBcYn
         O4yNZFtXcUDn7/ZcMiWip8RECO512T12mFRPvLzjjQU9RPmxTq+6S1hcsmbO7vrZI9uL
         AF3QPE4mWTLteQKW6vrJOONPObqkqxdIxwPEPi95RR+JAPXk/ZZbtKEhNNrXZt0muG38
         1G+WYcIPek3nQEMDd1AsMFUMiD3Ppsjb43OHeSq5xilK7CjIBBujj4DsGH+Yjqcy3/U9
         J3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DKUZ0lFg17Mh7sHmvQEAtUOIrfiiXO1vlZnioYWzL2U=;
        fh=kxUfw2gYvKYC86D39AJOFjMHxUF3dwcfgbki/p1uE5Q=;
        b=GD9rWyJ0Yfxm6FNVVPtwCOKpSNNE8cJRMXtYK8cCmThooYeQB2cm/sikGrsf4tVIKa
         ENIStVZeaPAicsnRdHemifQzp8hB/K9dRgAPSHOJJadvOxR4Y3EtTupK8dyJrWagwAs1
         sTKH25WakoJWFTi4dRRGOiuPA52qhtqGP25ovaaDz08g5RApw7yqh1XeNBZAa0XIHHlB
         RI+krgMVGav4ar1PElLB3en9MicTVQO/5y1RS7XfR4DngEjo3YViwWAZDbQAlqT78/YO
         0ITQqMc9vWPc3N9/yGhMcoHn1QnI944zydYkzMeA4GALRABRsKLNudevWMyTsSzWsX4j
         TCzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783547327; x=1784152127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DKUZ0lFg17Mh7sHmvQEAtUOIrfiiXO1vlZnioYWzL2U=;
        b=snlbuN0T8wHaa3tJ6R7Fw8Fb5eUHt6G3EXUUvM5WAQORi5t7JPHtSIy5M92Ks3YRX3
         uMkpvZ61V7xs8nrwJaKD9O+EV+SgKRBDa0zO7a4pjr8KfsRybkpAENjOPOuCR8VhB0Z9
         YdqlK6dbq/Gnue3JmHc3zsG8ghahOfaiYS5ZuIgjcGbrYdkRSvxpV9lPpEuvxKmEsphD
         Sa3G61FmTFDL7XZYUtqbh4TjLBb2mLbJRDwY3UtLR3/IvEhjusmf1j4BCRRb9Efjt4fC
         ECbDQkacrWhg9+76fw/w/Pf24meRV/r7zjudYOtKmIhv95roFCjcpxMMUa3fAK2jhhih
         qolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783547327; x=1784152127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKUZ0lFg17Mh7sHmvQEAtUOIrfiiXO1vlZnioYWzL2U=;
        b=JNjZUNXKyvkFQ40gFAVYb4/Te+azWQCRCQ2gHJU7fXUa9J2PNUZbTlb9dWzbeOye8n
         YSkqM02P72BIy0hvb84XHA/IJIuB4dSrqWY5Ar6FwnArgoXAjLE2GHqc3AoZUc7oyEAr
         AR8X8pOmf/J0eqtlYLinxNbOOLX/UVkpWjeR1JOgeJ6YkjX7bVu/ZPkvSwVV0wF3OEey
         9lazZN/v0SllFANWR/UYsyQhcDv3+dMiYFp77hu9OmxcubGqWn0OhlVU0Y4YGfSuLyCV
         ReKJSuEtlm5cRT1FK2THWcYgc61cQXVh+y+B8yP1ThYlPleJoYxBy+8Gvln5D2mqnMy2
         4xkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjWEvtiJalJZ/i4JgZb6tz9HK4Een6bd5Kf2MK02PerqJ+MW/nPqTZaWgbvWCtERVf9rUyEYY+pCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YztC3MD6pab53Ez1RKcGOkoP2+0nTkjjthJg5gItZQ8nO4B3VtK
	RoBV3q4I6gtlrzEpQjUvUJhHQTeqBLObOximBcwJ4fpCwK/ma2KxsoFFBwGDUQKikQdbNWTNZzt
	80Q3Gv/loGz3Exx5fdfBSqX9sJEDRrHYJDHb+T5H4
X-Gm-Gg: AfdE7cmb7sc/IFH3ItTLCj/Nd7wfINwCuCaXUAY8eC/z2LbaBh0+hfPiyGB2pj1cU5s
	nILgpQ+0+nOdQaGnfk6T/8dF2FthnE8/jiA+Rf7bS/61oyNJ8U+Y8VCf6UCREHAuwGlJNK9zroO
	BQS8zINp1ZPaU1Gdazn/t+a7Ukd2mIRBuNnlF+ry6Cg8i/Fz39xRccrliWQc25Fo/r2WniSIs1+
	+XOGMPify/6rGEYxzD/QU3lWBf4+pmZnflqU4NMU8q2K7Pw3p6uMQrHweipDmKzBcfyrtZIFmvg
	zizm9CXFvBn54ErRrBKqNsea87Gk+L7/4DWT8yr6YpZsAgCdG+59+Mu7u1Loq8DVRHx5
X-Received: by 2002:a05:6402:2053:b0:69a:fb2d:e84b with SMTP id
 4fb4d7f45d1cf-69bff1b2bacmr4833a12.9.1783547326726; Wed, 08 Jul 2026 14:48:46
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707210336.2060040-1-mic@digikod.net>
In-Reply-To: <20260707210336.2060040-1-mic@digikod.net>
From: Jann Horn <jannh@google.com>
Date: Wed, 8 Jul 2026 23:48:09 +0200
X-Gm-Features: AVVi8Cd70VXTPmi6Yd7YJ6QWdP__iVuKDOVFxgYsM6z5t2MksbTZvyWjknkN4Wk
Message-ID: <CAG48ez3ywK8FZ-TZFzp1GwiW6Wb+DeO3OFt3Ys4QAeGTS0jv6g@mail.gmail.com>
Subject: Re: [PATCH v1] landlock: Document the threat model
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Bryam Vargas <hexlabsecurity@proton.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Justin Suess <utilityemal77@gmail.com>, 
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, Leon Romanovsky <leon@kernel.org>, 
	Matthieu Buffet <matthieu@buffet.re>, Mikhail Ivanov <ivanov.mikhail1@huawei-partners.com>, 
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>, Paul Moore <paul@paul-moore.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tingmao Wang <m@maowtm.org>, 
	Ubisectech Sirius <bugreport@ubisectech.com>, Willy Tarreau <w@1wt.eu>, 
	Yuxian Mao <maoyuxian@cqsoftware.com.cn>, kernel-team@cloudflare.com, 
	landlock@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 11:03=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <mic@digik=
od.net> wrote:
> +Sandboxing is layered
> +---------------------
> +
> +Landlock is the access-control layer of a sandbox, not the whole sandbox=
.  A
> +robust sandbox also needs steps that are the program's responsibility: s=
witching
> +to an unprivileged user, dropping capabilities, setting ``PR_SET_NO_NEW_=
PRIVS``,
> +and confining all threads of the process with the same domain.  A
> +single-threaded process gets the latter for free; a multithreaded one ca=
n
> +enforce a ruleset atomically on all its threads, or must otherwise synch=
ronize
> +them before any untrusted work.  Landlock is typically applied last, to =
tighten
> +access and make the domain identifiable and auditable.
> +
> +Stronger isolation can come from combining Landlock with other mechanism=
s in a
> +defense-in-depth approach, notably seccomp-bpf (see
> +Documentation/userspace-api/seccomp_filter.rst) for what Landlock does n=
ot yet
> +cover.  A long-term goal of Landlock is to control access to any kind of=
 kernel
> +resource in a way suited to sandboxing.

I think this part is something that should go near the top of the
document, and should have a title like "How to securely use landlock"
- most of the document is focused on telling kernel developers or
security researchers what the boundaries of the threat model are, but
I think it is also important (and maybe even more important) to
present this from the perspective of "if I want to design a sandbox
using landlock, what do I need to pay attention to".

I think it would also make sense to give more specific guidance on
which sets of syscalls, with what argument restrictions, can be
permitted in a seccomp policy because landlock covers any accesses
that these syscalls can perform to objects to which the process
doesn't already hold file descriptors or such.
I think it would be helpful to have instructions like "you can safely
allow socket operations if you ensure that socket creation (socket())
only works for AF_UNIX, and that the process has no existing socket
file descriptors for non-covered socket types, and you have fs_access
rules, and the kernel is sufficiently recent".
