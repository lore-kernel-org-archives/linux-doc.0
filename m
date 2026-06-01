Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C35131F99C
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 23:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355631; cv=pass; b=cBGXLFgvaMz0iUDlH+A7kNQLdmkeBhd02TLlmLbQVJx1qqp0eX4hrD5CSVoQGLXu2fgcDHhFtFESrPaSPwqmEpXgmc8/vowLiSTz8XakOgl9PZIP9n4T2JuR9aRcBt/0WyFRIA1fhumkT+Ag1OfGtgTJ8t3AsRiAcCFucweTM+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355631; c=relaxed/simple;
	bh=aHqU/GAv+Kwj1BqBbcVETpbD87Fi+TBisbMXFFy+wTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7/dv4DCffpk2HGir+WWBdOLvEq6uioJ7k1b3/3wl+OYJ3THJNvVGpaBHuruEahOWnUOtUxQ/nV2iqj67tniWYTNLj7OmZItMGF7qDJRw4l3r6I5QY5hxx0323CF62E8Hmm3clYkrpKdXHqHdbZgeMKU7sDb8BelXYL+dTAgAWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=LnIjykco; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="LnIjykco"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c3184c71so13043695ad.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 16:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780355629; cv=none;
        d=google.com; s=arc-20240605;
        b=Ap9roaN43WE+wXF+9WWsMxCDsF03M/mqKUyF/jXbKXV4vN0xTcxhexsreccwwuVwBn
         wkRHcFhEdw5kJoR0IQwEd56NT+nZX85Nn6Fu9OboaKQZAkvrkA22YE+yOEK0wXWrqDTH
         mBQeECv5Qa2XefNm2WgCnkDGDmcSZ76PoM3v04Gd7B7qROUdCVa7de5l2dofRa0KbLK2
         LzVaEKuZm9F9gAQ7KLMpiAfi7oTFDKzBQ8PI0SgRuPVtwMDQFAeg2BRRoh9/77xsSctJ
         M9pBywVzUDAz+XaLLNaCToDQA3R9ho0z20UmRebQANPnN/FuSrqBAQsxanVcDpgVyprn
         jdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vz7MwT4u5UsOtiG3xQsmDxW+jD8LsxAD2bqnbWJgenk=;
        fh=wzjWxCqLkzsn2u5smFgheOcsLH0cbw7rme3iiA5fzoQ=;
        b=CtLsBwo1aLAXDveGWOSEhu/UnRL484KTg+E2SVEOlKW5bNydVZ9acR95fATtWA23iG
         XyI448B7FdokYMiHZoThDeNGYnKLRJtEbxtBP7sO69TXYZ51qQUFuBWDskZqqcLHkwtv
         oL+cOHmvM4XYglfxCFDX8sFs0Cf9KnxQ+WOovRTud8HqytoVdcv3gAOdbfBby4j1EUSw
         W2BSZOmO51ra1VCH8/KsNz0bv4qyYrwn7lCSfXJX2SPz2By8n14TekbHl6dL/cltvRY9
         qowP4EokUu2+i64ZsncZihWh3eXmMvzfWf46qT3ot9jdIGQlskLM1dcA5mzZejd+WJ0q
         g2pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1780355629; x=1780960429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz7MwT4u5UsOtiG3xQsmDxW+jD8LsxAD2bqnbWJgenk=;
        b=LnIjykcojR6vyy08kHpOWVWsSFeDXGxpMMVde26QTGOjhFB60YFvmGgjCjuRfUuzFS
         J4NUevoyFi7xAgvDJeQjjRAuB3AxsbOb8aEkXZomD5dsOvR0G+tPFCCr9dkq0SLSz9TF
         YxhMcpdgKDKOjSdPI4sB4izsz9o7enwjLhNnEs9sdz8UGE5UEYeImQiB0DoIuLBf2iy/
         sRwWZKExf4h6mEZ92zOV9P5qXShSzvqGWFBpwPO7+a1/jXhmZuDSd9dsufalQP7hokiQ
         g771zr6u0J+RySuiC3tKdFp86Hg1O+1juFHYhY8i2pM8vKXcpaw/69fa7eG//m8ITQkp
         nA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780355629; x=1780960429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vz7MwT4u5UsOtiG3xQsmDxW+jD8LsxAD2bqnbWJgenk=;
        b=UhHwU8aK/8jbeKSMp+lcgJx5X6LKkmsaJnALOno6HtcFZiLwkf0tAcdejd8c5OZ18x
         2ERKFAVz2iC59mc5gcMn9qf4Ru5mpYDtGm3Rh5XM1v7i8ZHXE0SqGmt0JrNR1gCaEqhC
         RqzBnZQYavvOfKMhmZnsiFDN04kSFv3diFzI2dSUVXL83I24Ci5bHh2XEhXwXrATsFfd
         e0Q+I/f4LWEtFDoU15pec8Ni3PdqqsU2qCfFzl//ENS559gdzsnH5tkCT2OSPWyMvIKP
         XxuQK0h2J/b4HhPfiF7N+qvDwvZ250FsgcLgYyh2JfQxshE8VIuA8o493mA8OnJTi8H/
         NyNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TRdeLiTRMjzrSVK7UnhvYlVBG9+yO8H7bN730XaEDUMAld+wVIJZhHFkSwVLWlIwElh30N406tH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRM0iqgBYpEb71cMG3b8z72ICUgjfK4+1eJ7GdaAZQAZP7Gdba
	YJoU6DTHd7N0EgYqGpkt2StsRJ+udAFBz7rw77mKXBJYHPKlh4TLTZWwDF50tQN7bwJ2t54IHBb
	syHtN3gm+k2lfMHUcKG2RI7X51BwYp9vQQtgccmcC
X-Gm-Gg: Acq92OGQiID9cx7AVixy+ZFnesr8UW56KOonBkvSRSasMB22pmOnIVoBgDmNOXWbq3Z
	tFn1e5AKdRubz2LkYqYjsnezVOgXyD2LPBv1DxqqKuafizKk6h1dsGWnqsI0PUCJNpzRZ0/CMhU
	hjzptkW8oiVzc0zqb5BCd9VfEY1WPV+d3CXmbLE6FqhV7c/8irMUU7AgtSVgZ2a0sw86ymhX/E6
	xQboglQ4V0laLF7UallebVhO+xPSYkuHZqPxv33mw//0gsrpa+c1mvQJOTFjsOPb3zXNbUNM+LV
	ap/SE9P+810SpFlaUGvIiwxXpRdp
X-Received: by 2002:a17:902:f64a:b0:2c0:c940:dc1e with SMTP id
 d9443c01a7336-2c0c940e206mr79129685ad.20.1780355629409; Mon, 01 Jun 2026
 16:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-remove-task-euid-v4-0-07cbdf3af980@google.com>
In-Reply-To: <20260529-remove-task-euid-v4-0-07cbdf3af980@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 1 Jun 2026 19:13:37 -0400
X-Gm-Features: AVHnY4L0VLMjaF6hJi9yQFqw7kmnIWO5yk2GkkTGfjEcklH1ybYU-qiacr6meWU
Message-ID: <CAHC9VhR5Ca+WyP2OiNGtL1SqHn0SwLe=M9SB8D2bxtdS52quhg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Delete task_euid()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 5:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The task_euid() method is a very weird method, and Binder was the only
> user. As of commit 65b672152289 ("binder: use current_euid() for
> transaction sender identity") Binder doesn't use task_euid() anymore,
> so we can delete this method.

Given the problems from last time, it seems like it might be prudent
to let the commit have some time to "breathe" in a proper release, I'd
suggest merging this not for the upcoming v7.2 merge window but
instead waiting for v7.3.

> My suggestion would be to merge this through the LSM tree.

That's fine with me.  I'd also suggest updating the commit description
in patch 1/2 to indicate that binder is no longer using task_euid();
it currently reads like it is still being used.

--=20
paul-moore.com
