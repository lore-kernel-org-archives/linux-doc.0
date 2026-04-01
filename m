Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7233FA5E1
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 12:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047141; cv=pass; b=b6WEpISANFBKB9FipvYElehd3HfI9DA1y3SHy0I/eGRYHgoBQ1OhP7MZ0NCC3bX1LoyO2I1dJtrA2D7LE8B8/NwX5UU+uoGG1vqDtvaKONiyY1CwM/kqyWgJrUAwKSTRUmrzqFwfc/2wcbtR85kIxRtX0WmLtHbCF9nf+lrEYf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047141; c=relaxed/simple;
	bh=GodnwCNRPwhTIOZcCkQ43DAq+lvsz0DfYPnKri1+5dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rT5erftCquOdugp+LZGYNd+RrAxRPg3oQXXAwqBkBuPa+67sy9CTFGErdqe+OzrWVjXCnleSA5FtXNCDejAPpUVRtZxNWXplgx5inbE7rrhuvwYnGXi8yTynJgS732GQuwc5JVGzg8RV9rVoILlEQwpzM4NlpscSeHL3jy7b2Jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty6k57Rd; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty6k57Rd"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bd5658b901so279402eec.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 05:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775047140; cv=none;
        d=google.com; s=arc-20240605;
        b=ZYMiE4fOWT951P6vP1DpJ9bJSbkeR8ez1zQtoxk1Pc6vkTlhstCtDDGfk3ODp9jMEN
         yQI9eJUCtgPBbLaVLJi7PTvVgbe6KYS3Xtr9IKMbsvDSAmgV5lQgwjt1m/4evNIcZruv
         bE/Vs0D1WhoFO7RdLoX3VXT+wwelBkwDtEfXi2y/0hyfWHqkiTXW0K6/mPF4dCT5PAK6
         z+wKCEINzrh45qJuq+tHKi4/w669Qt5xsiuRK1li2yVSPx5dosnHKuuV3IwuGJJgUqS4
         H+yOrNzSVHOgb7l7ZKT5bfzkwwTkACDx1KTBur1RV9DH9LUb+Vk68b55czRlfi5vA+it
         padw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        fh=YmEk9tSMJo20F5HClhMa5BH3GTHqXjsA9fGuFxK0wP0=;
        b=ZW50jjr5cHgD6vfBHMRKd5luONxvsD+LFC8xntc7wNR1mFnPUefvANR6dTI3BZc0/8
         kYakjZwP9zG7nrnLMnmC9Ntj4Up/uHKNbcATQbVFuG7eFakmHRoM3e+Qbpak94p0u/S5
         vBPPvdSYd1lEQoS1zpExgPsjVMbSatMobNNzeu0QGgz5GDZRQdvqUE4Noi9UjRqjUKX3
         QnEyF87StRUDsigzCqpJDCLe/V7E7JT+YYtUxjRN29bae4cCoHYtLzRxC9q0p1DTK6eH
         K2rELYGXqGBIu+ZsvP1zgczDdpro1pwW7L7t7M+x6eaOBY98FrfQ6TW1MShGIiy5t9Rn
         QoYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775047140; x=1775651940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        b=Ty6k57Rd2b/j+l5SXT6wVtwVPCofZk6GKODuiID9Bw3DAg+mRwi7ZLqWyKUaY/F6YM
         NoA7tYlp7e7vj9yvAAnK6JUUKVsZuGQEDRy8Kk2VcKRM15hwDVNvDqKKYiugVNhP4Th3
         MM6AG71UacD6q+z9Z9DjlpZT+7Ferlmc4ZwbnQECzBSFC2yCpWCehJBygWufqD+E7Kmp
         19yTa2FPCd+7wB1vpq0YLo0qRK3jOFfh8n4m05FM9+fPCmmEHS0UYOorDiu2exuQrqzT
         UAmbuxKEi6TdpLW0Zn5cDAA8H4L2qKGzbxHskdXbg+o92URUDiHxvCoGu1tBMM7aXg0t
         EqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047140; x=1775651940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        b=WNA7KIFurnpWBDp/4YenPuxzc1pgSu4AwGC8vU+Qvl5fapvGmbpBwkP3bU0vcpbQuK
         xtuitS5aDlu7C53KF9isTx7be7rjp54N5XopxD9d/NOozqeteCfgcoxXmsFYwanW91Po
         A3OFpDR0vtnUoUE3JDx236G1oeIYVtBbNp8PVO8pXKyL+HZmLCNGAWEdBJSGJrPSQgq4
         Z7IOphfTPLOFSVGEPhvtmsLjHCT4HMHJw9Pf6OPvTyjSRRkXwwddYfuHzR0yrl7s6zPR
         CCHVeEA63GSE1Q6FRgMHV5rEcnQgM4do5H7QCwaaYkhA91sa0InsKJrHoWkm8q8YUmxe
         CBBw==
X-Forwarded-Encrypted: i=1; AJvYcCXn4Y5h4twartkQH1tzcRpU3gJL1QgrJSi6Y+s881Hl17lE2VSxypnjxE7ist434KB3ZbRxhAuSUac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgBQPd9pQrj6pih4OAU7W4kEgxgLLl4J+7G/Lx5h05KDmADVIS
	wNzQGXKzxh+66zar5603AGSgmCPov4vzVhGEP+kSUTBa6ZWK48Tjgea8xQTgt3978alxdc24Tw9
	lvgk/sC2i85U3yFdTtuX02s1t0C4Jafs=
X-Gm-Gg: ATEYQzxu75cghkwyHXWc9gfwD/aReWOf4yLnMfvunD0JAu3SlXdSbF7kIuklK7HtPBD
	hGrHI89xKYxhK3Hw13Iw5YI+WBTSdvgfjUHwEMuMYhi1La0RBZAxIXc/RdQx9k2g/rh4jp+cjL2
	ERnkrVs1yJbga4sGAaW3jIut/n/KYaf5N15LTq0QD8x0nRWEk3UTuGd1v11cQP6GERmWh7jDfh1
	LX4MTnkm2sU9/IyTCj28JKfGFyG9DijJR7DIJxNp/svx5d+up8YyNbx3MjYCe50IByBgX7tjd5+
	SkDy9TxfLrqOuRWJT+CkBp4XeABBMYpWY24kDo5ibKM++iIOkSqp4S+txu0xN7T4Lw/g9AZiiY5
	JLlvwsKL/BUnZZ+m87H6duUs=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr857984eec.4.1775047139826; Wed, 01 Apr 2026
 05:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
 <ac0Ol1PaRTWNK6O9@google.com>
In-Reply-To: <ac0Ol1PaRTWNK6O9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 14:38:46 +0200
X-Gm-Features: AQROBzB47ncfBs2Gvn4IVyEtA2T5y2xBZyqDi53mewiERXnAT8KcWfCgLbx6lUg
Message-ID: <CANiq72nk8Ti1bcjCO+5nPacz7JaH=x4+uTi3-+iu4H2ZfwfVrw@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
To: Alice Ryhl <aliceryhl@google.com>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <fabiang@debian.org>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
	NoisyCoil <noisycoil@disroot.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 2:25=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Debian really *should* pick up 1.85.1. It contains bugfixes serious
> enough that the Rust team decided it was reasonble to release a point
> release.

I asked them about their policy yesterday here:

  https://lore.kernel.org/rust-for-linux/20260331190053.482607-1-ojeda@kern=
el.org/

Perhaps they just prefer to apply patches on top.

The issue linked above is the only one I noticed so far, and it is
quite specific.

Anyway, it is up to them.

Cheers,
Miguel
