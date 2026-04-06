Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB3C385534
	for <linux-doc@vger.kernel.org>; Mon,  6 Apr 2026 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486289; cv=pass; b=N4+eScQR1ehn6x3awWB/Q07ugPCHT1GmpBf8ei2LKcddk2fantv/jmjUuLiaR6IDA1wdHWXR7yZXfIhFZ2iVTS4amNnpCuv82X3/uErK9GBqLoRWleYjiX5BAGXIJxS8XZpooaigaqmaY86yNpa3DsQH3B9aaofon9ST0P/b3zU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486289; c=relaxed/simple;
	bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hok8C0cBMrC5Y2sFN4BgVnzCZ8dkkzjuN4S17vW0Oclku6EbWyySre+y39/J3uVzdsFLvehGTTT++fie1fWkW0Q9PWQIwIoEI6jyu9KW6yT5uKn7GozM7r6ig48lvS0rwJ4uFYuLO7+Z7/fQGGqYYjmBeeXP2zZZXgpQe4l6jW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgwhN/LO; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgwhN/LO"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2d13cab02d0so2839eec.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 07:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775486284; cv=none;
        d=google.com; s=arc-20240605;
        b=VquSrCDy/l5ni1sw3m8Hone7hrPv5AzuBnlh68mb5lm0h/AXNRZqkVmSnL9vbCGGve
         GwAwpVXv6Org9eZdEH9H6CREg1Y8oLMcKCpemUD0cGXB+SobQytZXK4NicTUUYSTYWUJ
         u1xKwyIx72JYBMFOA9KKcYZMt44UwCHQsnfoxamUu0vypWAiyIR9Eg/sUbZgdJ5y5/9n
         ALJCkKfgs6jM9EE3cZ4OVnqvR/oSc9GidhgTpcyElK+xYuEWKHKhrkLGmdf5KKHD1QG8
         0LSNNC0hL4M/+j1+OnkVdU9R7QqCW8QJYxEUa4jSgnrfx/IBURYkOj7/0E0YA16ZcsYs
         ACsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        fh=Q8xvkE9M4vX7Z4rLMQVE5ruX0N/iMHcyCwrFqotd4vE=;
        b=GbXfH78EhaFbHRF9sNSWeptl93Zi72TIiLWdHedYpZzY9VdD+tGrbSqQhprseizTx8
         lCSVdwShp4Qif+9spW8/GfB5U+a7CFeuwIKRSHmLfnDLmhUF+NgbDv/m3N3jtFQRV0wx
         1EfX46oAhr4X/RUcix0gsy8+c61lNebU5C5jkiix4k+1RXnV/ZSnsleqilOiMoN0PsyR
         GFb1KbJSH6iB5zxneO1ZaG1hU/CH5gDX3xT7fo1HJFxm8y3XQGI14oC9gtNUwqoUMHeA
         Njuvd5wc+U3SN7hubawHRc5kH+69NzvOzRn8cu9FwGVcyPxg0A6pwardbK2Gq8/KPW1H
         YeMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775486284; x=1776091084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=jgwhN/LOCRUuz5UtuAxbMF3jgJnFp6nKylfYyZFBTJc1ux/cteBqbZhrHUpd0SVrJ6
         9hhlLqqaYpY1c0QaNN6MWPPAIwh5+uX2vnAa59YCd3Q2Ao03JARshIQClxScR2gU23q6
         1Yi78Tqo3Y4/iAxKQ+p+X62sVoaB+OFZJCt2n+9UhA+AY6ZbTDd1LWJ9E3QbIJgzyByS
         8zBdW1BmZbAb+cnapbsOd4q15lxIceJHUjgfEn/NiAWrxrT0gr1mHOyFTsaOq+RvDLti
         a6G+lGC7X5xWVSu975ZjophQliZNveh4HFzgRC1AO8zyzB4RALb+QOAALbUrIIiMWMGm
         AnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775486284; x=1776091084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=ZLN0LnfF2JkZVVkG5S+ZUNFRYRnVMtJuB57OgN4jhaGyifcOAms5zhmuES6nhh5Zdr
         JgKA+foJgd3j+QC0NjAKPZU/zwR0Lbq4Vf9Gbpd8hgmlcCFTND2sUvu15naUdKHYaqG+
         b3mbTNmM89RW7EstQClCUfmhHYY77EA2dHS1fszW0d7g0Vwp5SFTbdjJbiZt7NRNieiE
         FrP5OuUgGlMvXJfrCOUzcwaAvXX/ydFDUJ/mqSClwz5IRqQKQCWhLeUppg1wJkdMOSha
         g7uqUPlylWnRzUJbzRyEmLc4vud0I6Zc2qL8x6o+Qz6eNk5RJWtg1TPqayomDTkzgTel
         CyEw==
X-Forwarded-Encrypted: i=1; AJvYcCXUA5/OrbDK53S57eec8WaEA6f8oRjoDAthE0f5IZbqHts0/ZQYYOEMFXWohoXBO+/9wnGtyErd8mA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxdcq+730M1BkLu2dVxE2+a+ieraVWumzOJUYVkUcs0+UDDKg2
	MN8yMz5y5D7BQMbnQZqx+crPulPl9uYdKfcwL6etEH9xzJW5EtKvobOeh4ZXMGczrbaruY0yrig
	7aBzknHhReTIkqcXWGG1G0KGu+AE4pBk=
X-Gm-Gg: AeBDies78TtMkbJoGXx0qwsOaDoS96lUM643aY0M6UpQv3+jAc7QYZk+NKWSzzkOdl7
	2Da+NRYko8qtcDJxUViIKGPqOzY8J0/eG4FPKSSJRGCJxEgKAJTCOtuUhx7jYkyR1wilkqbOUSe
	NfqwPMkaOv/W92kQL2uJxUtuv0wJGkV5wJhn5H3YxPevU477SANe26HO7zYt4KGx/85vrT9d79m
	6Nh11aaXgceLRunuSnXRNS9o1GQvPgOtZOtPxK6IDkLA4tFbEEETdv6Pw4EgGa4+FIooJnvpuZN
	hHYbgeTINe1cFvQsoAzH71+YWMKjKGlTTrrnwQzGjYyyOjMR713lgQTs7l18j4EvJ/Ef0AHTknV
	/PtAhFOprX6MdeXJhOidCctMSHyc6Z8Tprw==
X-Received: by 2002:a05:693c:2c06:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2cbfbc7d828mr3020598eec.3.1775486284289; Mon, 06 Apr 2026
 07:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4>
In-Reply-To: <177548573697.95472.13544191227699996309.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 16:37:52 +0200
X-Gm-Features: AQROBzAshONAZRL6Bf4qdEX94VdiVWUdtgExWPcnxvz_Z_wjuLZH7VazFmpsU7M
Message-ID: <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 4:29=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Could you add a reference to the upstream bug report [0] here?

Of course, thanks for the tags!

Cheers,
Miguel
