Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B5147DD53
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 17:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065189; cv=pass; b=qAfyV+jDB7yh1HwtvTylmbaqik9cgU5xHuIOCQy1MOUoTKTB8A/c6902gcQ7ha3POsH2SMX+KJAAVbtMQjW+Y+09GWt09au+c1yBqi4mIjGDhLPQ55v/Y9hfbxWlTxrEt5Qb5M/B28r7Csac9VrV3QSGttRmRF9zqp4dRUH2+8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065189; c=relaxed/simple;
	bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQatiFqGqR0v8yqDcglC7TCRGLcs/4JUXshQMmp9PXluAxrHgwKc5quK8MrPDXxg33McrTori6Lc0QlSDjSxMODLcHJ7cfMF2mDONI0haIp3iEdBc2zlh5F/CRvw8n6//NWlFLUkRZkPQ2XLiyE/Nr821GBvYY/eVBrNRNomMI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLIFWkhN; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLIFWkhN"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bd801b40dbso11142eec.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 10:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065187; cv=none;
        d=google.com; s=arc-20240605;
        b=Z6p2p9DOpkD8qCrwPir3Wfy2aFv95VhkilGxIx1gksxix/eqZ++xrR00S7Sr0y5Z3y
         6y8K4uagK1nkqYOdw/9H+pVO76v1ZqjgqzmBQk9stTAYdURH2TlQ52zzkkl+gn7hP0l0
         oUwW9K1BUSOfTy6BEeo6PYPFH9nAE2beFWnQeAv72vxqr+WEJyaVdhIhIycj2CLRSPnf
         e8cWXu2IAFG0nBnrQI0fZNWiLJjShsaDshGTj742m3TIRKPCZaWOWpLXnfSRVjg8M+LV
         g46cAqacIwQMtNxtvs7Kn7suVV8IRf7IJPXAzP9+7J+GI4zBAG9vYdklvJcrY20T4yje
         drKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        fh=BDUiXyAiFHvGeWUa1qRiqhkPnbU5ycdjmG6jBNFfDHg=;
        b=RvocwMDaZqMkpsnnaOG8fgCTQ9Az8Z+kzhzglJZKlA4eSB5hqozdLYen9xQHXxJj6d
         W0jbYQKE3FEcilGmS43wOZNE2QdNBeeCtQXXUPJ4op+cZrJklSFDqA8ooqEymDbXP53S
         BKpWLsNpu+HPloohqnj8oQj6kfX0NMtqQEX8CFeUXbe4haJOxVw+16KjqXF1/RpOAD2N
         S+l83XmTmrYrN3jcLkHMHJ/l2cMe/7mNLL0bIgowEiBmdeoga0ZqD7t0TVgcBBv1iMFc
         BaSbdYnRlX1HZI9VUP1XiqEstp2kJHatvNQAtYO9gM0UR9fGukQsAZ7X3y/zk8Jy3QkM
         moCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065187; x=1775669987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=iLIFWkhNhk2zFA69YpzwAULQXbWvF7ohNGaq94wT2RsrbuSSkLnK+cksQhSRRYzhK6
         wihpu5wvu0NAkb5yqMpPtzgZySKLadIEgQCsvkRTHkJOxdxPoRf+zq+A+TwMbp9j+U/Y
         zy488yPasQ1kGjlBBCn8r3kgkac6jUr8PS5zP/lkflUw3G8Iz+uCkc/4YjxjK5nvs95S
         IS/95BLAmQQdsvC/I9uPl8AUlISlPK7qmzo0vJ2NPqHTtPSpPC5/SkJ7X1XFbQJKhJ0g
         JqdBxVr0FbufR80FR0YkvsF3WbQvMKpmcTk6F9D7gUEH3zRUicIoxA/Z2XLwtQgH6TMT
         fiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065187; x=1775669987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=arlY0qgshAo+VNqeRb3xXLDMgqZyOnyhjABGy44756jgMU9xBCK4HS99z6J4ewQ6ys
         1ExXUoxcBnAUd8g74/avEQqvT9maDgY90TKC6AE6kcQJgozFCRvKNKxQgJFH8PI/gs89
         n+u8XrYoCjXKqRSwNGK5d4y4x1Dx0KKk6tud4TcKMrsERmj0zpY1oblGI1C7wdsk1i0C
         cDPvBH+fpjiTIyKqKLIWleOD/46Sn9UINZ4pATOGOrN4bZreh5yi1gvz61qTrKrYdHJP
         LC0EhWn0PtS4Dn+7DoBFM8OSMoadZUgDwVWPQJMd4bb3rANFdStPQfmVnrJMtxg6WXqg
         2mmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv/YrhsiM9qS1rH/dASNmqRPT2zYU8nhGMopxUOV7AT5HVteAriT6mHEUOZkTjxmuP03sfvhSOcm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBpKu9HYYS/JEiteXa3sYImVneAqAF6SkgOlNpKy/YD0Fd99zp
	LeoKgyswJZFcWQ5vVb2OVMD3gJIDidGHmXUPT6TJZEH3OB02ON7KGAgQ/MSa3tNon89ivtpfvVg
	+RPezv+rdY95SyBe9G1D18nxUd+9LuuY=
X-Gm-Gg: ATEYQzwvIgSUauoAHCzOG0G9xZ1xzx3TNKcDR7RdHIzCBgTXo/b3zZLggQsDxVv2Jdy
	y1CIv1HxEKXupwIAZlxM300bGo/MhWieoO5kCUnphJ7yD9L+fdlVBBE2eznbjbqCcjfjsoknjr/
	rDe3L12xi6Q2hVCeg5iCBz87rKn8RNgdxb5QNv0Pk/l1iNO3SsYTZU06EQpPWTnCR/ODwtq5u2L
	KVB+E6ohOuuqe4OPHJgBNM8a/YRSlW1WblekRHURf0IWKLdk1Rgkt0/q0y9do/otJ2K5Iwl9ElK
	Y6ynJ6rbXtqNIPm+tp593kQ2s9y4yE7WYQZs7Tko9aDIgfT8qYh8ye4haxj1OJqVQF/aQoa10ac
	vEqnmQo75TGzl1kKHCEujp5z+YUDhswY+UQ==
X-Received: by 2002:a05:7301:4586:b0:2c7:2cac:8147 with SMTP id
 5a478bee46e88-2c932cb3abamr970192eec.5.1775065186457; Wed, 01 Apr 2026
 10:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-10-ojeda@kernel.org>
 <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
In-Reply-To: <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:39:33 +0200
X-Gm-Features: AQROBzBO7Aafw_pbzha_JEZl4Ht2QE7dpytXYa0WjnL8RQv-FxGnezpSMqEOLn0
Message-ID: <CANiq72kSYFiS6zN+VLs2URhAeHy8_-aEXki1pyR0qoj7jO-qSQ@mail.gmail.com>
Subject: Re: [PATCH 09/33] rust: kbuild: make `--remap-path-prefix` workaround conditional
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

On Wed, Apr 1, 2026 at 4:08=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Okay, I see what the comments mean now. Perhaps squash this to the previo=
us
> commit?

This one was mostly to ensure the workaround was not needed anymore,
i.e. it is more "optional" than the other.

In fact, we may want to just not have neither of the patches, i.e. we
could just remove the workaround given the timelines of the branches
-- please see my reply on the previous one on this.

Cheers,
Miguel
