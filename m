Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215D93C1971
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065000; cv=pass; b=uh8u0xB+PYqrp79IVdvx5MXmxmSRqEsaMjLCxH3+egqeo1NngDAsOn7M4mau79tMT8psgGi5CIJPQJ2P2sAuhc3k/oo0T7fovzZOHkeS6I3KVTe1sSilAWsX8Kz9GZDUMKBR5nSJhZJYNF00uXnN7xe4fb7T7iWfcw9A14pVA4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065000; c=relaxed/simple;
	bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWZC0YERdfOJ13u4gPXlFLbijEK7ujvnCzxGV4/aJRrRLUqUeagUYVeDzdcq93mAUmc/pAvcqX7Bv1PPdvCTfbiWr4deHc01m7XrBgIcTRh+rWNprkYjvUzhwCI/hdFkhrN4lUdB6MyrtUWx42KZMiKBPWZg2C3BN5dluTRtdeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m47/sJ8V; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m47/sJ8V"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-127148c2112so7703c88.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 10:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775064998; cv=none;
        d=google.com; s=arc-20240605;
        b=CBz/DVIXZQzECPNoK2wCkB4OfIyBpqazEdKv/9vA0tdcFZIT59lgvGh3sbjD6fqPn2
         y9cOpVk913Cjx7it798/in/fp2DdDXSJ6tjZk3EKV2rY8J7Hv+l2tlhmz/UmXkjWHDto
         ilkEaotlOYVoPcw0C2b8TXjXhGEQ8jKapuNx3vULCTlBC/BRo4n5Doax+ao/17TeoF6g
         5WF4/CkM8cRoAxegvG9ZSw6EMMFK4JUWnKx2zjWRsPGYbD/LnOG0juRCpWlelPLmadtu
         OxJ4fNi+CKzxSA0GQpecs9sEKDUQqJm2qoNDg3IEq7CZxPeBaCkZhOAh0lkvOJtCgC/I
         HUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        fh=dvumBP4XRImWiVzxxY9iYMKAd4QyzTtwX6h6dA+W5to=;
        b=MhfyTuj5o/PqyV8Zaq/PWq8L9U8ic7dxnSKcH3/yGAB7ZZVgyK5Ja0s7G31Oqnd7Bo
         5kwscNh7HUYlsBnnFmtr4KemWynxs6c/ZAi5COecbUMlB/UK2ZurrP/JqYICAehuyHLQ
         mGjFsGMdjqvaTZZP8a4gDYanwlZXH8FBefF53SzGnUWZzH0YUlIzsKdWRdLyg31SESvA
         GnRcTGr235fWOpYgExflppGrLcn47BoZyN71N5VjwfVJGS02z3icc4GhUiFuwKbxrXWC
         DVllJZXFDmHqovS8088pFMJnmA7bCXyea063a4YWI5G7E4R8nW82fN8aTlpjVAbCTr93
         csFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775064998; x=1775669798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=m47/sJ8VF5zmkEbgvymxRwXRqMU1Z/SMQ1njp0gn1sBAbbZeHHcDZwn9Ov5QCfkASU
         IYCyXdshryWiChJCSKlCTLKnWq+cjV+SueJ0RS1kudCFliXnb1YcC/VNmS/glt0Ym+18
         i/hh7HaxM41rZ4fLKiMBtU+DCN5UMWtHllNzl0Lq2ZOhVCOgWKY9f3iMAc/ckyFgm2bC
         phA0/vIEnZ/8ZF/59f6s1sC6QR0J1Nfm78sLyH4nFLXJ5D/XhZh3PjfHWL6vp/vFlaYb
         FqY/DKSgpkqYWCMJ9Pt96U66Bk6BJy9seltRXj/JzBJfl/oFXs38w7bGYUrJGgoyxxWP
         wbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775064998; x=1775669798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=rjqCKmj3VfK0H6gtDrx/g5pkMaeOxe5OpQU8adzqkt6CxBGDMhSrfmq737RYUZE2VP
         faRZgOTzPjpKKcOknLHBjF97yXyBM1Ll2vkMyO9ZtADVJ+oLgEByWbc9qoKC7cqp0fPB
         onvoq7+FkPRoNbJtK+P4R53GAXAqfvouLalz/ZSRxvXe5H5DEZHgfBIbhyK3zftqO/tz
         OALlOe1SKHheIKIevPqeff7iR7i3s/l3ohwv6pK6mXvll98vE01rzIx9hh/q0SRmv6Xd
         t7G0SmY2F1FN2dxYdqUfsMrhm1qDyF8h8XCgoD0J/fht+/epYNEU/oxaMFc41FBPVr+k
         3GZA==
X-Forwarded-Encrypted: i=1; AJvYcCVBv3Ku/bQWUdjaj319IjBLgsHaEclr92pAWP4ZUnQv8yv4K+zAaNB4DMh8K4a0WBXbVh9qx7aifOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwhZOKgVDSo0lUAFeZdkt+tyJbr0wBlXRFk4lKZzX8Y4aJpON5
	ri+ikthVbG1eOPfnSNT1tb9iwwOG38QtlOYub/Ao77sPWjXphUJ+sY8TPFx5GsHunAJKx+69/JC
	wWD6aJ/bHzBmCogMGA3apzQJrUd20/vQ=
X-Gm-Gg: ATEYQzzMrEKAG7pd/49aiBP7teGcWeN4XG6QisZEZBgSestyaCnu4EhEg+D2/zMVowA
	Fivab6AuvyelJsu+aNwB9h/c921Z3KdXEuoziHKLqWpr5MKsEmkhc21rb8bX6S/CMPyNE4rfhuw
	7xCBYD1MRM1CnMdnoECqVoGXI6O5tKtwkMP7YBJs9WE38tWNWG0xhV+UZHqaOyxIH0MdtmOMKwG
	zoEsyYSqHksXUl0rLpn8j4ds8eo9J9bsiu700EmzOjC9J5F4Zy7hHPEK1hY5GCxp7QwXzmND7/5
	jjP3QQUfj9VzQDujMb2pJRqW5xoJ9YaAzv9rm/rmRzuoNC75lKkpXM6hgmnFBtZ3ZnYDrgZ6Dry
	WQ2+48W7gud28ivZRZETq8FI=
X-Received: by 2002:a05:693c:2c97:b0:2c7:2cac:8162 with SMTP id
 5a478bee46e88-2c9326aa500mr1010168eec.5.1775064998156; Wed, 01 Apr 2026
 10:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-9-ojeda@kernel.org>
 <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
In-Reply-To: <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:36:25 +0200
X-Gm-Features: AQROBzBeO_yfCUmMruxpBPrHPRt9Z-RBtWsQqT4MIRVUyc-eOkOj6bAx0WG8aNs
Message-ID: <CANiq72mnnro6UD3SYgTOG+kipwkTBvbEAGH+jXUa3kLTUNje2A@mail.gmail.com>
Subject: Re: [PATCH 08/33] rust: kbuild: simplify `--remap-path-prefix` workaround
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Wed, Apr 1, 2026 at 3:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I'm not sure that I parse this. You do remove the filter-out completely b=
elow?

(I see you saw the other commit)

> Looks like this is going to conflict with rust-fixes (which adds the
> --remap-path-scope). Perhaps worth doing a back merge?

It would be only a couple lines conflicting, so it should be fine.

Having said that, when I was doing this, I wondered if we should even
consider keeping the workaround. In other words, locally for
`rust-next`, the "normal" commit would be to remove the workaround
entirely because there the flag doesn't exist to begin with (i.e. the
workaround should have been removed back when the revert landed).

Then, when conflict happens in linux-next, we can just keep the
addition of the flag from your commit -- the rest can say as-is, i.e.
no workaround needed, because you only enable both flags in a version
(1.95.0) where there is no need for the workaround (which was for <
1.87.0).

It is also why I added the second commit here, i.e. the "make it
conditional", because I was testing that indeed we didn't need the
workaround anymore.

So it may just simpler to do that. What I thought was that perhaps the
workaround is good even if we ourselves don't pass the flag, e.g.
someone else may be passing it. But the chances are very low,
restricted to a couple versions, and the error is obvious and at build
time anyway.

Cheers,
Miguel
