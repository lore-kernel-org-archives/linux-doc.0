Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945D62E9733
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771860710; cv=pass; b=RddfUWv0Tz9bC/n/Xnt7J3ZT9EyQIUFL7H6/hs6o8Td4XIkVnCGn3MTAxmZEr0+Iw5+itCexYSKNMeGcFmcWglgVGF6NvcW574o1XiiSKFd01vavr+HBvwFqXR1me2ZI00rY8BLYjMgkqKmpjNWinNjSwg/ESd/6fF7wy9Ag7QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771860710; c=relaxed/simple;
	bh=uilEI5+tBHBNToSheDl6KMRwBNfeK6QgbgEXP/jym0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpV4yifqUFn89AzsMr+pGHcU1QmHMnHWnyD4saAsnBa1RvB1KTuKQ4dp8AvHpX6EwASIHZ+oP9QwIjGshMlISJwuGDUIzq+kf3FMQUx6CQ3pMx9IDFnVwwSW/2aKRdZS+LEJvKLonpIjuTLctXmTQlDjU2dxk8qO6qf1LCcVa2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOsjhHS3; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOsjhHS3"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124a5810e41so229884c88.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771860709; cv=none;
        d=google.com; s=arc-20240605;
        b=bTby5NdpV/wKVKdJIqUy3+fzMmeHsqmcdn12Xnykh1Q0aqh41RpTCkkoNrO7wR2IXj
         0m4qFvFx3nCURQoAvmPgY/x/iGQByXhvLQCNhefOxhlqg4aQXcv59y+pXwlVDdk1Q+gK
         HenVAMT93vOYbVhRjGsfs6KKNzbfwYD3nTn1azRjAWbhSPjkkRhMjBREnBv5DBfMcu3K
         ooQqbmivk0KZshlsMZS8OWSCFvrRDqJ+P5EN/UL46hMzRi6Qv83Alfl5Tx29/LlplmKM
         QscIYT0x8xdbve/ZQV6/E/rE5NrSVW9AzWCJBt1HyDOXX2crl9tvVuYiiGfB4GgUCfga
         63PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pAk8ejtYqNKil504XGxzm+aHwjMu2ZLiZ7Drb8rL6K4=;
        fh=7kJCVbArMbyGJB5NpldLt+Gx45WC74R/MImcUyQYHHk=;
        b=Ncss6iJXZAaYccDJ1l2ZfLChvc/yG7HupO4X2hKMSlLNYMHE9jyF0ojvHWyOFyAB/O
         VRfybCNZfBNsYz63ehtZV9IcqQpPfQIrk+aJBRqI3sg/WinCRBeIT69gOSRbTm99dv/b
         zVbn99d/0QPyGf1OVhWVlqWtlvPqyYR1YDdTYsowWLIZjhx6f2uGcsvKPxw3Go/jHuIX
         hZXW8+pEUdlbQe3dbNa7uIH36s/+oJwnvHlxhiUk1ousIL4/tdPwEP7it+3NfvaBfJTQ
         ir1rmraD1RAcB9mC0fJglXbUS//tQM3mUGAARz7JNyomWO6K+QdbtDksBS7jvYhDVMHs
         MKgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771860709; x=1772465509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAk8ejtYqNKil504XGxzm+aHwjMu2ZLiZ7Drb8rL6K4=;
        b=eOsjhHS3Ozmq1VwGODcQdkn8BEX6Q7yVxAxY5igi4hhVUKusDZPgKWiQaozpAx35g6
         1p8ZMVuHNvwWs5A47iMPpq71be5P4L+EaTb1V8R1hq2kxJNXrX8TUrXJsTtci63rqCN/
         BeurzxtsSreoLlWoQYtehE+m5SQI6yFnz2jYiS6WJNXGNqfdiEZ9gzZqt7DYUUtUw9sU
         CmLaFOIZex1RXh39QePeZp7Z0w2GYyJgsmgIbxSMQaDMj6dGRAto5UpDgm2OeyNoOreg
         jOQ5jYb31nrIMSHVa5zAj/5kZkQL+/jJPWyqa1PHlYNCV8NXI1umaCSFS671C+QCuX6c
         oAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771860709; x=1772465509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pAk8ejtYqNKil504XGxzm+aHwjMu2ZLiZ7Drb8rL6K4=;
        b=F5wihH556QAc6TtC8dSEpkbSBc40WA18KNINPixCCja54ZaPoF0/GItdxBOFIyb/AF
         av/gF41BCK4I6D2MyVAjA5Iep1fYKnrN1ubyAqh7064Pts8DseRLVWMe2HacjSGvkI07
         QlpcMOuCkUr3o0dtJPK9Z//gmRKhOm1H6X09lp7dpK8I11xdFh63emAosoXxPXAe8rux
         y7ws9p7qa08s2xWpxdL8yYPwkdPgHtcJUQER2MMntxJ1/12FWVJaolSAh6YC94vqnfn7
         OCS+a/Q+ZF62fgQaz36oF7T3X989+sbWwlSN/HYJZgTcUMmiviiUpZbaxagEZh/xgjK6
         tGiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfBFbiIRnz1LuEpaPe9BKh1eVeJ7pCqppTGEr0UhHRaTV9/k2DCYIkGojCFf6ymXTk/Vcp/UNHV90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Je6fOi6AjhVBoFjT35UaM+tuBzKyc0H1JcnSH2WjusvYX3xo
	EvCmD3Kbabl6n/6ZdpAZmuSwceCmckS/y2A362xZ4lBJRWXbJWygTeKR7qLGM5/YE2Q6EwDfDW7
	F+Ov488A2jbG/B97J5Z8006Eacn7ia4c=
X-Gm-Gg: ATEYQzzROKMXDC5s9xE1/b3p/hSYCCl6G1z0MXK+HrZWoJvx6lmDGr8Eax13J+M+uNC
	wz7D72M1x6OR/btv7duKLOdsFSvIwQXIn1D3S6xvgHaPPsSlT0EgknQZb5FyfKFrsDpZyrWKbRM
	2iowM9UqT1IQF3OxtqcJzKYvxODxggUaPLfCIW4/JeeM+aWpXVhuisiYqrEJ/PmdjT+UZPX6vEj
	CBDKJkgVGfwhoLpP1ogFxU9X2lzLCOZt3rcfImBGJc7lj9FRMJYSGMeaKA5CdZladKSMJmE2CHa
	rWT9TtgWbo2Vb0QE9wC+YThFJZtHS+ScobNVT0+LmJ4nTz2Rwwvjy31HU6MsRffE3xvyUDdI6DY
	bT/veQauv7mEN+P/aWXGhS6pu
X-Received: by 2002:a05:7300:e207:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2bd7bdaec6cmr1877425eec.7.1771860708535; Mon, 23 Feb 2026
 07:31:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna> <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Feb 2026 16:31:36 +0100
X-Gm-Features: AaiRm52K4i0fpTeiP2c0ziG19k4_bQVuvrLcSD-qpk6IrkIxs1psp6f0fzvc-cQ
Message-ID: <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Ralf Jung <post@ralfj.de>, Jubilee Young <workingjubilee@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>, David Wood <david@davidtw.co>, Wesley Wiser <wwiser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 3:26=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> I think, disabling altivec, fpu and vsx with compiler flag will work.
>
> What are your opinion on this?

It is really up to upstream Rust -- for us, i.e. the kernel, it
usually doesn't really matter much how things like that are
accomplished: whether via flags, a built-in target, a custom target,
etc. However, we need to know what the path to stability is.

My understanding (but I may be wrong) is that upstream Rust prefer we
use built-in targets for softfloat instead of disabling via
`-Ctarget-feature` (and that the other options may go away soon and/or
will never be stable) -- at least for some cases. For instance, for
arm64, please this recent change kernel-side regarding `neon` as an
entry point:

  446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfloat tar=
get")

So please ask upstream Rust (probably in their Zulip, e.g. in
t-compiler or rust-for-linux channels) what you should do for powerpc.
They will likely be happy with a PR adding the target (or whatever
they decide) as Alice mentions. And until we reach that minimum
version (in a year or more), we can use something else meanwhile. But
at least we will have a way towards the end goal, if that makes sense.

In case it helps, let me Cc Ralf, Jubilee and Matthew who were
involved in some of that discussion in the past, plus the compiler
leads.

Cheers,
Miguel
