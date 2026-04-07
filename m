Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBC61A9FAF
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 01:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775524523; cv=pass; b=evOCthCbcBqOuKF72rGe0ujyfRm4vVsO6EKAhxqtZ91qXaMRYiz63yjb9Ovy7oLCEfFgZN6NXBA1a5ZTKe46vDKhN9092vzbIHwHGzQ/1X9o3iUDf6AZAhmr8ZplNJlzKox152QRtZnrmdowU/f3D3OYlAWn5DjxdJuO/Xnu/10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775524523; c=relaxed/simple;
	bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIWbqUok76OdEh3d+RUcfxqaYxIf731uwoqACI8khm0y0InehNvsSnHFDKPGYd5JPD0ZDUhSYaA/D0FWE3q3B66rUWI/Y4U6o3jKUbDspB0dhEbvRZsRUvgdNeC6cr5T+7mil0cV4IVymBoRvJL0jAk6o2mIV8k45vw8PiMy37w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGQ703As; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGQ703As"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ce4b60f855so72251eec.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 18:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775524521; cv=none;
        d=google.com; s=arc-20240605;
        b=M1BrqfejngGokulzTjg7YZVuQh35z+lg2462Be+74MPmeM2zXhKvYrH7RxraAts3sF
         tj1tz9hfhYY93sFnjD1j3Ek64r20Aw8Jo0UUq1fYSMKFIrvuxyqH6rOnxGzckWMq9ftT
         ooqIU5nxRNpX+87hFMPae0iNij6RSy+DIRfPX1pJPvHY/Th+BRPqFUJN8CHlj/afq6UU
         W+v5iMm0fXmnKzdSuxqh0TaQ4Udw561RNU3IpDYAqcLKdQ7OewPTWnqF9I9JuBfaxJOr
         vI0tUguz9jQG1m4/Xrq4p0z18LXygdfgfMyX5CWbaggdCpaLM96cmxPxIZcde9hhyedC
         f6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        fh=+aWF0jnDVng59AJIlpohgiMBF2ou+grA1e9H1q0dGjo=;
        b=amkdYdSW+u9yJFe08rEwXWYBXxrsnyxlD4jmZjVPBi2c0NmSaQwOOl/2xff+uQhqOg
         dlstHgO3Eo6DUneK2s+yJEA1JXinfidkHVRl/3BZNQr/Hex2SLEQFeSVmy14ZtjXF9/Y
         w6uO9GyGfvr+KRdqCTKSph8+ZzbmC+BOzFOflQ3yOviCkUJzfnK4DP0uJ1xRV2YIB4JX
         XaodWlZTIMEtkz98+JjPqLGBY64SwoEFsHHPIXoX/hVFv3k20YjlyLq8mDZLY48v/R9X
         a5SACoO7cndkZjWRq+RtSfVL6t9Zz4+sAXCcNJ/KiECHKdKh6Qxy8J6ljopRYs6sDQLb
         zT8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775524521; x=1776129321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=YGQ703AsCty0gWvo5XnlPxhjc5LCMeOjJ+5VaBNrHpu+0TsSyjrNcWEWd/m0xKLvux
         Fz5M7QK2bIoG18YbdIV5pRHLUt0VRJlRNL3J2rM62DhKJfRPvZiTpFS5LoAtuErROO2A
         i5cq6rZGi0/DoY6biOvoAPYi8iZftts1ZmtoQjeEvt3xZ+dK0jCer/1bDx9ZChZ+Zp0s
         7rRkWYB/dNzrdFZyyERvo07rZGCl1n5PabJoeFVP4Vr7eDLp+plO3A1tRXMKwwL0NCB4
         seVG8RH8bxEcUVp89x1xzYmOL6jQnuRQvt7t2bQgN7B7U8eQ6d27Ci+Z9zrMJMknNpl6
         Tbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775524521; x=1776129321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=FZqoAtXAfC/p528+tmFilFv5DYY7HiUdb4tBxmDaRnDQ5/kxmYPmBwPwUJyLUMNglB
         CRsB9k3j+TGY57pV2bRKF3OgrwWE+qWhsukT4LRjtWlKY7rFIup7HWph/EdCdKNQciQp
         PfJm7MAjPWMaYGuXCZpiPIQL7gVGoapcxywiIRuX2fO4nyevlILg3/biCN0kIsVEl857
         3h1wo2leuggJFRoxQlIXFdrG+Ra217Q8ssgS5FDypkncfszzDmsBvNEYExmlvDf9ncmD
         i2LInHNZFZhCrCHgQg6Sf1arvOp6gQqweotC9oTSJH7BrCGDvBIFg9EafmKIz7Jym/Kp
         G8EA==
X-Forwarded-Encrypted: i=1; AJvYcCWgg5zTfiz0iQSaFhfisFKvF5cgyEAWkH6trmIRDaMTWSPk/jtHT/t2RgZ3N9PVsR5CC+OQAHD9l9I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuu7AtDALKVzQFeKpuLvHeFEGJ6MW4m3PqS65qFesY1GGZJpTI
	WOv7eD6pkyO5pRSyKAAF1HKh+HaAzaJhD3Pr4/UwqMdNXq4jpwa7zQDbOGgTVk5hTJ0rug9BFek
	kVD+7gQFxpd16FxcQBmjF4UuqNa0lLxM=
X-Gm-Gg: AeBDievGfV8lbB6GWoLzQDV21+XaOyhCMjW13iEpBgvJWPG4GNvEyfK6OMyM8gumd4p
	GV4DKYSu5sj0K86+T0kGv0sjC3yxKJhtzEYOWRoH23Jzw0ZaSvR/cbFRhhqgd7/UDOxRWSAj9KZ
	pwhBgCZ6Fc2urylx4o1912ZvIvRhpymWiszJx7S+6p+ipM1cb6n6Yz4hYPzGy6LoZhhdqU5Sksl
	ozKHMBS8U46LAaPQo1FvLqKh+6UJJGNBGuWTaVv1um5sWPLv3T6Nb5tYYKbvx6ciwlxXHV56s6V
	Pxa0qRWwnfM0qTdxB/TB7Hj2WQDFbzA1kROhk2by9YgCadr052wpT4BpRw5okkNNZjcmnzxsfiQ
	YaP4rL3Ytt+VCbf1lIm7a868=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr3516734eec.3.1775524521173; Mon, 06 Apr 2026
 18:15:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com> <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
 <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
In-Reply-To: <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 03:15:06 +0200
X-Gm-Features: AQROBzCpjGVGSHiqD6WWW0AkLWSnE3ic7jf8UnYoPnV_5tut3XVgaNfJWwQj0o4
Message-ID: <CANiq72n84On9UxQ9CNqyFb5wpJZKrBzb1Xej9ZRqhLim--ftAQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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

On Mon, Apr 6, 2026 at 9:07=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> That's what I thought I recalled, too. Weird that it is not in rust-next
> already, though.

It is normal -- in the kernel back merges are generally to be avoided.

Cheers,
Miguel
