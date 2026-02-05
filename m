Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F231277CA4
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770322545; cv=pass; b=ST66BfwWO9Hnec5Bhz6p3y28n3A4fbH3WUe1jC+IJbFhLQkz153ja+xoKJXRgevrF8zRhiykhkh0iSvyl2CPLN+UcVTWWs9h1jkQlmkYaLz5bFBmvubAHZJRquoJ4yB5VBISa+9o8yTvYDhsHGMJiJj3wgIJAZk4mev2PH+NHvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770322545; c=relaxed/simple;
	bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYbfKDbHr/SDQO10UuiIzG+KSrmbpfSFrHrSiIAg/Fcm1+BKtE6TXFk07/vCWNMPmrIggo6DrAW5ZQcOuomFb6u5VCizO99yC7y1jG7kH7rbrkceAuGpYsAlHZgVia2i2HCqOD4S6T0wi321cmFDLNWsDi9RFXJ8tg3zQNLOpNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkRbydmW; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkRbydmW"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b8095668ebso142722eec.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 12:15:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770322544; cv=none;
        d=google.com; s=arc-20240605;
        b=ggIr9SVXGV+9GbOGx9cDJNq6kw+oScoU2GBVYkquYMqP9+8XJ/YKOoNGv8yiDvS2wL
         3dn9VJfKCdM91t2HsAP9e5RW0qvGbagfVD0dVf+nZ1uxKqDNrm+RmKapbawSWgNmLxms
         nnSHN4O9VdyExEV/yob+Sr5zyFMbLozxd2QtA/wCqI4jSH0d7Lv6d/57ILVdyMobLivi
         CYjaF3hHBes5JXlCYxC6+tNXHpjic/IHnkxMSpQztrm7lDUWH47KQkl32Ev/0jjfpeo5
         N7b5Px+0Yguem5CK/apGlPnEPfLlpNrwj0T3sOjJMr85xGBci4FGpjf6EyqHk8nSwWYJ
         JoHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
        fh=XPh73DQwDJGIZ6svrMtIRADhrcVtwS05xqZZmD+CjmE=;
        b=ZH991w1YNY3S5bGVyFQhLSjHbRQxJXj42jPPtxEnff44w8Tap96S8/lRBf8RRgBAJr
         CSXiiJhZpmzQ/fLygOte8ZIp8ixITAaJORgXwbMFybWRGMaoU8+XrwtwtNRXcHttte/r
         dqrdC0WWGELCGHVPkgJWg/g+nqj4huSaOyUdFbQ7e5pbP5pRpxXIP5F+W5Xg0E59rYnb
         X3fNf4QMFEDMYIT4ymZ0YsMZLuC0S2hLJ3FzZEWYO6pMquwGsq3H5luGC/qZaAPAsuIH
         PrMifVWB5Ssu3mdDtE/1I0Oy4BgICThxkS2Em3UX4PKP7IT7JsWLgS0ibF/5NVo4TFBA
         rKaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770322544; x=1770927344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
        b=SkRbydmWc40sUZraebaYWCGOsX7MAxsD/UVl1MSQbXWJ78XVD0xmQYTgGf8ixXUGz6
         uJcAnntvcAil3yZ9kfyEPQPrHsViLBpiwkp3T1nwWPKkWoua1sGxQp7MvEckBW94VTyN
         qGO/FjxlrmrxWPy62tZnu7W7c3AtXJ/Fbd77pToG1TFNRDiRuJceHpraT3Lozv9MIHgG
         Azv+/X5vTMn52uIQLKITWNMNdILpAkLpHVAeMOFmh3ZM55S2rzlkzZo/chUv5+HG+Dy7
         wTrOK4zjuxg3eOM0uVp3HnCVt+cbmFy/FqLU39ewN2lqb8wKU00n4Uotv7raVp8suw/Y
         FSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770322544; x=1770927344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
        b=drEDAEiAs4xXwvW0yTYmftbZafDVc6rl3S0O0fQWax3zhdwg98z2Q4ZGSbkm70P14+
         xdZNwNZfvNJki4IwgYeE4oBAfLcLT54Q09ahvdt2w+OjhkT1Yyw6khMEUKcYvXC7Tq9n
         S2XO8YwpMbEcOZ1IYY1+4RA70S3OQiO3WCcF00pVB1wIPnGclCWRoV56x3pdWrzPTElP
         YYXeTuRyoZn0znyEDsh1ykeYeabmBLqCUkzEAdmipTJF2VREGcI1sI0RpfDjqFSZ9kY0
         46jOlmeygqFXwMUklEX/ocFDPErC9/C/ZP8zLuh5leNZwpQl6R2CRcG24wryNLgq6iyx
         tSxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZC9zLQ143S8o8RCgURdGP+mMUOpJnrIG8gT/72nAngoJmD0+wn5jdNUcZGPdPPNMuoJj6chAzR4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYAzV6/9wcqmNZwI+Mj0iYxg9IjtDvQZIWQgkW8CfAsCquN3i4
	2AyK7xodHSJxthoRM/Vwput2zE+tjGCvMa7v1ownYknxKpBOb4r017QMIlU3+o2qDgHDc/2ggkl
	4mCEjqFWt5ltHIhA4pk7NTkIY829FBDA=
X-Gm-Gg: AZuq6aKI7TRa/xxJU1ncYqcKwU+p/sq92yvAfQZe/aSSZLZUkuK4z9+Qu43v9PTlQlj
	zCbTUyMcsu91MUZeygesV9no72T8iiMFpJVX5O4y5bzQimH4/2mkogY7UAnYVBk0+5bGLpQkE3B
	nvxlx9i0KR743xqOceYl5PNVZ2fQAOqyjdW7Kyhy9DWMd/6FGprcsZW7xdA6VmOHqXWYjCTMDzS
	qkjNEUFEFw8eVvRWox81a73+ie+7e/kiSV7pWYRigy8wnXmC1NHBFaCaJSZBpX6SztK4u8dv1/4
	gTPW1x64VgoMCAhG7XZOISkh3EYhx24uYbWkuv5cyfssm6B4JenVeQ9g3lgFLJlPMZciJEVIuqM
	Pf27fKS8zQkn9YKBDarmGIto=
X-Received: by 2002:a05:7301:290a:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2b8565170b8mr67598eec.7.1770322544408; Thu, 05 Feb 2026
 12:15:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
 <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com> <20260205200222.GA1298159@ax162>
In-Reply-To: <20260205200222.GA1298159@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Feb 2026 21:15:32 +0100
X-Gm-Features: AZwV_QgYb-zr50IKZRngiPF2__DedHoXx9O8lOBxwz2l3ih7SO-AZRhJAl3SJvE
Message-ID: <CANiq72mqVNGJSFAm2UhjXRV=5cWQ1Z4xN2aVeYQ5Tn-veym3+g@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Jubilee Young <workingjubilee@gmail.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 9:02=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Thanks for the CC, I had not seen that issue. LLVM 22 is currently in
> the -rc phase and I see that the fix has been merged into the
> release/22.x branch as of yesterday so it should be in LLVM 21.1.0-rc3
> when it get released on February 10. LLVM 21.1.8 was the last release of
> the 21.x series (hard to keep up with all the numbers...) and it sounds
> like this is only a regression from the LLVM 22 development cycle.

Yeah, sorry, mixed up 21.1.9 with the potential 22.1.9 in summer this year,=
 bah!

Fixed my comment in the issue to avoid confusion.

Thanks!

Cheers,
Miguel
