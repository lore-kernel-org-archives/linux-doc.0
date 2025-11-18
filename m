Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C6C3081B5
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 21:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763501680; cv=none; b=n4C5qaLPH43VpTlV/ehOGY1PdiHJuWcevG6iiW4N6kmNTKEM818atZ4C4VBc3y+cjzij6m0zQKQVR24BxM20p9khf2vIv28MQPIBZvZk/YEM6+Y2LWznS45vdVgOXlt/hLMcLi0dbZcZ9YXdlQ8aUuu6vu5RQ4lVntgXNldqPu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763501680; c=relaxed/simple;
	bh=ayhkjtnG5oYSTvJU9zGgngy6Vk4K8yB8TSicqsdscXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLlepHTsDutfZg3lq8V6aflcwi499mIy6l0AF+Fei+U+lozDDcRv/h2IikPsVXPx0vIgopA2cETfTQtsHLefQ5LKJ/857H0a5LKeowWZ67moiUa2q5y82Xz7+ehJDvRQ3mCfwznsGg7qWz2U4FGQeimi9Ma4207fCEmyv+/UzDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9uaJGz+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9uaJGz+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297dfb8a52dso4696405ad.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 13:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763501678; x=1764106478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayhkjtnG5oYSTvJU9zGgngy6Vk4K8yB8TSicqsdscXk=;
        b=W9uaJGz+p74rKUsqI94CYziohwg4v5ZwzQ4bzu5ynceDGsEQ4Faz2W+2G/D4oQrAPo
         lYyjnf2sLssVbmsBBDt618MNULgkKqa0+4RGw3tcE9EGVNEi+U69u1fonrg+kCPUgUOd
         xWaasW9vhX11UAHzuGIfHyrxw6nIthET7zAC0rLb7N0/QE7lMrU63aF9N5xQShsQd308
         aoTyw7ctJG6TsgMe5VMY375w03DTIuVGMGVSkt+B7OKSNdZNZoGAreGYoLHfsqgUu912
         ImIVzQ6weO3DarJO6mOiXNSU0NdI9wGnPoAxmlpP175OeZt2cD32aTB91DBCr/z1xl35
         mbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763501678; x=1764106478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ayhkjtnG5oYSTvJU9zGgngy6Vk4K8yB8TSicqsdscXk=;
        b=R3QPO64B6YiIKmj2d4kBajToX31GGMNiezQupav6GaXS2N253VNQqWaF+EuYhGDO/W
         /x1GmN3KjPi+U33WK/UWdeY2UBr8M+texl9rTVPrguY3KMz17y4FJGn0HIMb8VHTvLJD
         jsFgR+ywEQKGm+cu7d4oELoMtNH4SsHSYNewNFUWPMPQVG5YZW4dWxueouBsi4Rxwhny
         roeY5RWIv9RqWhBhvRNssEpQ5l2JSTvXaN9qoQykkN6EDrRxILRZqU/vqWHWtnK+Z0N6
         Q6Od1f7/4c3EqwXOcbXQhrWXyAXDSQa82Mp3VOjZOlFps4BzcPndqOMrfAmBhQaksC4Q
         +vKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhkK3ZxqGEazxQFA/eFmsmbu6Pj1jB2hHGzSJKykDnyj2gpig01QZ9E73A4bocZHPCHqz5S3QRFm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi/Qor+em51Q3Cqm1fW0H97JoIWbbv6ENAFt9YIw0ubTT4H+Kl
	/10yGOLmVsSg/pKejKK7gHj+WpPMoN+H8IV5G+15Du1qY7ZOI984F4eZLdW9tuNLwPW4uKcWNDD
	dGiHvd8wgwyWyenzKT+xCxf2MsdZJosDPF7+CM+w=
X-Gm-Gg: ASbGnctPGF/BohCqWTKifa5aNB3Qm5iN+tvSgubaarvERWhd+p4BSxxK0o8dq5NeVjM
	txpIp3LJNffCW/UtHJO594va8xcwpVSZkKvendZYHGo7rVvenTxOCUGtiRX3MEQvEKA1zr9xtjB
	S55+z0xR0bBxdGOh5x8MBbHrj8X6qBURcDD2rs8clmFYsjBNH7OJ/WRHVSrWE7yP/ljpjwlAY7F
	kkqDOkuUJIrNk+Evj2VjGRy8Us0EjpLmF8AfEIVp8nEICenwm4KQSE4Cr2sC/7MDJ/fkdEPeeQl
	GB7uOxhU7PQW6xs5kA8s1XCCdn+7luQ3zMVBFXrMXMhCHJQY/lQ3Yp7dRQygmR/5dJHNi+cfPR1
	/WExYBQ3u19OnSg==
X-Google-Smtp-Source: AGHT+IGX8h4A6zcGUTs7X+eFMDyXhW51vmSf1uAf38sUPQjSauuE8ZKK+X2wdAA3Xa+2TFJLQgCs7ZBrD2+fbuc8h68=
X-Received: by 2002:a05:7022:2217:b0:11b:acd7:4e48 with SMTP id
 a92af1059eb24-11c79421cb9mr1445567c88.2.1763501677839; Tue, 18 Nov 2025
 13:34:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
 <a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
 <CANiq72=bYzj6iU7PCm+VMBTeBbgUcL8nwrvUut9p4ph+3+itaQ@mail.gmail.com>
 <kjpquyekvw7fwrndoomtge7fnxtfefihqlikj6xcqtazrr6l77@424ufup7v45o>
 <87seeb47pk.fsf@trenco.lwn.net> <20251118201152.038e2749@foz.lan> <20251118213210.0e8b173e@foz.lan>
In-Reply-To: <20251118213210.0e8b173e@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Nov 2025 22:34:25 +0100
X-Gm-Features: AWmQ_bny5AGEF8tykWZe5kPsPO31JUToEx5VVlr6EVeQl93Nod6ZibZYR-vFH6U
Message-ID: <CANiq72kYaFsY4jyFvXLK9KaDnZ8493A_7eiO3pE9UdWqGzgm+w@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs: makefile: move rustdoc check to the build wrapper
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 9:32=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Btw, at least here (Fedora 43, upgraded from 42), rustdoc doesn't build
> for docs-next.
>
> Perhaps the issue could be due to some weird things with Fedora 43.
>
> That's what happens after sphinx-build-wrapper finishes handling
> htmldocs (after this patch), when it runs "make LLVM=3D1 rustdoc":

That one is fixed with commit 16c43a56b79e ("rust: kbuild: treat
`build_error` and `rustdoc` as kernel objects") which is in -rc5.

Cheers,
Miguel
