Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EDC34321F
	for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 22:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770848605; cv=pass; b=jh2Gnh6Iob86gmtBT7oMOcsh1YF6fXdi57QcAuF452ENpArFWT+A7rNAqLhyyX0+XPhuNtoJp5yNxqBcRCe7XPEspEB9DLsTf5g2VtrNjg6AIi0GzDiNpXO8seJ2dBD3bU5iBKtXChPImL9Sx6mNhP62ewP8IhONqp93B4+e5ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770848605; c=relaxed/simple;
	bh=t7CmiueZQTFgB9OhTdQVtK4rAbqMocYVGmzF4dRfH2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GPpY8qP8wkpn0UyEU0sgEFWGy8mVLcmKBm0BELckrRYZ2HSkwdYqBhMw8zhbCILnh3t2zLOxipTMk0cn1zDBqKLZJHxtgqaX8MdW8Rb/W4BFbC3DgVyv8pMpS6QdV+SJ900KzWovmRCyY4QoMpW0erMKrihdQGHP8ptIq+zagto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWrORt4Q; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWrORt4Q"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba9324f461so100851eec.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 14:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770848603; cv=none;
        d=google.com; s=arc-20240605;
        b=B2sphZQL6jF6z0XKfpjYN7Ho2xePAG57btCBxBvGNxiW/J0DLmJ9smIx/olmuAuyz4
         2k/G0PEAexOkG6hE/wHFvh2gOrDearYVnH+8zJFuv4mzcvXm5kOKCgW4HZIHZb17BzeM
         FU/Eoj5SauJ65LMQjaRHNTmDPtZgE/34FDRbsyah6OY3N8E0VRcw8pEuDhYoAzh15UyX
         nPW3M6Z+XsSWEh1bX2j+sxc30oUbeOJaNDWCs8KzRm775xC30+QTicSDn0yqOjai1aMT
         jdwNbH17l9h95Cexsr7f0Bo617I6aNofK0pitn+3+9BrUSBZE3979cJ1QjJ+CkA8LLC1
         RPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
        fh=wBxprGh9i4UMIaU8Z4fItDP//uTrosbxrlG2Kj6BS4I=;
        b=T8dKt56BsY83ja9WCL0B2ig8quKSKk/zvzMjyOh0+txHmqi8iFTEO6GYtASrh7pS8Q
         HTeLgrnWx1oRkg5SDRI65nnMg36w35a5yeKYfNm+hrN9UwFeVIJbXqicKFUfuA9FT8m3
         45Vro7kARCEQSsqC/JIucXjthj2GuOYzRr85li3cz5REQvxpIC9NVUMOHzEgcIf6ctpk
         f+iOghLOVoX5VyxHCva82TGMFAXEOF6BqzKHelBIK96aJazWqJI5SY/gsf5KtIljfQBs
         ffEnOBv1a1vIbyJJqedVW5fvgYRrQeBe+yRuHXCTkXlBA3HY1heuEhP50rCLH/oPA12x
         wfrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770848603; x=1771453403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
        b=SWrORt4QrOulv6xL4I9BweGhu70T4bELABwNlzWH1KQb7Ba8Ae6ECEEnvKRThz2Nsr
         dmLHJ45TOhU98AxjedzV7uOQ4MqYPKqZHp9sliA2TR8wfdJZtCr8alirRrcDAW41kOdE
         j+qUfc+PhaIOF8J5nWUhBpXJ7xn3HU0YHZz6O3C4sheh3791V11t9cUcBS8zCoLkD/ND
         0naZQJNNf659jHl03ly8l0LuJYZIeUAkQyTNyvWgb1JiLT+VgW9ButkNtQtcwnxmBQFH
         7Qzawz5H7xUGGG2jdSW5ApVs7WglM8Rx+i6e2DdGNtso035NHkU4l/I2V0t4rY7RQkoZ
         KeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770848603; x=1771453403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
        b=YQRvwJ8v/MqHTj8mXI3qacbfnjLfSyl8TsS4bBv74JDOkEN6dqOUs9j/Ps7reQR9mJ
         vDuReKG3Z3qtIqgfE6dwhAFNeoU9Z7JENrQ9UhjD6iNKKsGZXtIJajRBd6QptBzVAQOt
         C+1x9jO6ZSWx9slltfapC7f1909cP34Q7d15lyTDqjPUBUO9m0a6Mr0z85WDRfJ8NQGr
         NXEhyYwnY6IXdrRDo5LzfW/miLnN50IVEmguZEegz0rS+D9OhAshxWwCuuXqb2BK56Wy
         WGFgBFwDeLOv7dHoXOgcZ27M4QcnPmOOm6ED9Ymp+ODBKjRODsMjOC3m1Xpvn/m1W48j
         sUIA==
X-Forwarded-Encrypted: i=1; AJvYcCX82MRyacv7WmHzyszvuQKe8wihLLwtCInG7V1wVKEsRGxClXHDArubkR3dM0AjFIZCWwpqteA91L8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy279gAPW0alYBeqntU2yQno8QLN50ofIBnnmF33aX8OZupLClT
	dEQ9/TkXPrVorEIlthXJKcI+yoRge4mMB6A7UCY/s+6/rusHDqyxR8JjSSK0JqicTzD2daR1ag0
	XUIVCc/VbmaWeEsOlRhxQ0b66W3DZBq0=
X-Gm-Gg: AZuq6aIqHuc/xhUJWU3ZC6yHHbi5Zowf0FuSF1Zxqc3qabxW+J00zDmmV1vqjItnmau
	DNvWiShT6Nfk/0dYfZTN+BHSWaRVf7EJFEVSBYYkGsB+xJfXwetavI1CP3JZBT/zkGq/TujJ3dZ
	eADGC5o4ThB+Cyk2wpkbbrlbdj8rXA0UkWRg8ENMmhn+DQ3qj5gcuFc26jf33OTVbgRcBWjJyjE
	Bg9QTCx2+Mi6UY9werGGYctz099uIAvsxya9+Er85ywwTbEg3VZOTmKk8VbsCQ6/yvQkNjuPdak
	rwrmKe2LPOKtNNU6j3mIGNuGfkWWWWz1+TBXB+j5CsHkERgM8E0PEKxfOmfa/+PKH6gWq6jF6jX
	gPcRFpLDb+uKPhA4M3UrYXsqX
X-Received: by 2002:a05:7300:cb0f:b0:2ba:7d5a:a816 with SMTP id
 5a478bee46e88-2baa8079874mr215051eec.4.1770848603104; Wed, 11 Feb 2026
 14:23:23 -0800 (PST)
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
Date: Wed, 11 Feb 2026 23:23:08 +0100
X-Gm-Features: AZwV_QiUruFZTWSfo62Op58oUYH2ayIoiaQzk5z1Tco-BdUXIDPQzuMLaoXlnas
Message-ID: <CANiq72=-8urJufUuZLnRtm6qKCUhsSd=kPF=_a3ga=nk-iMV5A@mail.gmail.com>
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

Fixed as well for Rust 1.95.0 (expected 2026-04-16) when using the
LLVM they provide.

  https://github.com/rust-lang/rust/pull/152428

Cheers,
Miguel
