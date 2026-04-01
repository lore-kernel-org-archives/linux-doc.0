Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE9F2C15BB
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050312; cv=pass; b=I21S0aeX6KadKjW7GGVDtup3KbRJQzqtoWc8BNAjPxCmltVrF9yA0bOnDi6XPR9nHrtAA6SU9FNjYPfuBfhfT0YBAFyXseXWP2An9k05yFsiOOj7f+Ct3drGEXWSW6eDoHFLOFjUtbKgPv3YMkqnYaxgMLVGGWqFDIPsSoSKSZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050312; c=relaxed/simple;
	bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJyLW62d1N539xjN6P9Sv1F9W65ceWEY6ub+kTUmbWfcvJeebwa7/6iINDDR4Tm44MjMKKCjoNn9VzoyLjJzCoSWWRhk7GLixtpvoLTb2qE94FAeuBUS5E9SfsrTvSg4Yj5/8FkJlTOFnF+SZXfK2uwhPzJe51QnagFRtBstfNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iheeSOM/; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iheeSOM/"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c5cf871adcso173651eec.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 06:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050310; cv=none;
        d=google.com; s=arc-20240605;
        b=i57Sr3rqaxgDPQnnxbL8X9Psw2B0KobzXeXQT+/il8yOeIg54ot+alGxIrRDt0klGU
         sdFaEHInQJWCKJaGwK49emNtkYapJVXdgr0b0mxSHtBTcvoxizjJtTLlhBPF+yXPtlqC
         gIkGsZklyaVudoSbZZvZHMVQrsiu9fMT8LmJqPa8FASX83TvcZHoDFRFLRcw4aKa2Bk9
         T/Dl/tuvYJSJJonORii9fx54S0jdv5kMg29nkjkwLc48M0vM8ayRbBbWKZui9JYnQEX8
         8RkbM7jHWD1Fgea4iDqw2PhmlNpm3Eh6rvOwjiVZSsNPD52wKNO50NdvZKrgRsf8HNqU
         yePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        fh=64wFaHIlIo3PptUqkHJWC8BkMcE21fB6uJh0VbEwszI=;
        b=EzCb5zBTTl8xKxglfqc1nSwrVpZLfCvPEGdA84grFMbOj+zfV+8H+azI+nohW9pbae
         WOrhPfsBxoem/bqK/G4GQJGdW0I2oSXCB5nuaTL1ji2LHKtiCMxMVFZQyHENt8Eh/R83
         VtviBDMd/8BeenuEN+X6Mi0kF4Qdpa6v8jxNDFrGVTONAAIS6gmVyajTRmctRLKBXUgm
         41Qni0j6yvaMlklzWyYUzW2aP9pdlly+DPn7P/TRpfUCzDaztQofd+A365KTWfw5pkKA
         w5xw1U+mL7dA87kjyDMUq9gEIFLzBHW2h6d0lpv9LhUfFtSE5x6oqDz/vP+VLIZYc2Pb
         27iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775050310; x=1775655110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=iheeSOM/qlwTqLbVsiJefeHkwYJF69vrE0fo5V1kfgUbcsb7yyWjVh+FtzsiFxYiB2
         Yn3EwIwdZP+mACB9dZIA7vmKuA1Tcg9dv/f3cjoFxkJYVO9azMYPXgpyaMmaM4e4tBvO
         RDxhhh7h6nJ0A/BWEimRwqTrxCGYPHq4vNd97ByVCZWz8s+jXyAPuLqczLW+IQLFINvG
         ztceSgS4vwjmS7nMFkpjeeEWlaF6zj6d0u1J9WU4s2F8p9gGYdA55JoJpDLa39r4g15R
         k7k2jhHIWMp1fXuk2bWDz1caK4xkHT/kWjRb2JGQmGLRXECgWUmFL+30Iry6wfepfAIq
         tI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050310; x=1775655110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=ARMlDGadUjFUUd00+JMVEhsrbe7UIR8g5ZDzp4pN1jNQ03wS1ik5WhGWeZCgxIXA99
         q8W5nC5woBHOR2LgNxhHYSmdF+2nUYG9mwXb1kTMPQMe08ws2aOilvZ+jfESN1fEsojq
         WsMjHGVgJyvjltIsmCg1a3nIewO7Vd64WA7JIdo2oOdaz8JUZlBcFfk+esYnsH1xeTyH
         z4XQxS03Qmdth43pB6qLMLYWyYiKgLWPdwtU0kgwtCznrDk+o/yxRMgEYTMdkGfwF4pc
         aJCXo+pfSq5wkzUGJRCUNMZcaC4avksmON+2xeOCpYlmanDTxKqUOnLBH5hCh84ge7XG
         FTog==
X-Forwarded-Encrypted: i=1; AJvYcCUkLB9e/3HiarKJ6FgauP+QPewoxPh5B2eOAkOgbd60RRrLIsLWnXvexqnKmDeDnTAddzz8Tj/qKoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7vQD9oBSLIyk0q8OfggnmNne8o8ff0SpQAlFjeRoV7jTc4x++
	XzM197dwMDukKurxYAK9cde6AdNBUDP7f95TMVAp/KfuARHqAnO6K0J1OwbA+5sU1WbD1SKam53
	lbLIjLT1GVpO0o/fQGLDKIp+xZhMd1kQ=
X-Gm-Gg: ATEYQzwh3Y4Gl+i6PDD5x/XuCYXnC6QFeqPhOJSjx7QEEoVYAYvQH11e2QJXAdwlFTL
	9Va43RbA7UgYtiSKhbwDgd3bt3iBk8ftD3kd7sfYzsHT5TEZ+W4wU/OjBPcjEsMZA7qFfGVYWMy
	8wNq07+hPFwYvU8dQDUE81UakABx3K66WQxx8FrSqWiqNLsTaoVgOfGYrUEVvOpEtAluTtXZiV/
	+7jGMHBVvZIJQ4P876c5PXxxzi+DgpyvagjvXmMOmXyGQv/JQTKtIwrjRQYTaxxAAEWwiJJc5jU
	iMsI2Zl8fBbRn/LvND5UCGNRow8kZyxTQKsqD+t5/z2bta05zI3gw9nVTKD6ASqGzimagW9M5Qx
	o5wyH61oKC9TPleAm83dcNSMStekE5FxD+Q==
X-Received: by 2002:a05:7300:fd16:b0:2c4:6ec:141e with SMTP id
 5a478bee46e88-2c932bab66bmr849425eec.7.1775050310241; Wed, 01 Apr 2026
 06:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
 <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
In-Reply-To: <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 15:31:36 +0200
X-Gm-Features: AQROBzD4KmXruNHpjUyy0X5nLhLhXQUuTTY9eP3fb4LBTyRyQ4wVkUjvlUGGI0w
Message-ID: <CANiq72=FBbJ--jrzYyKe3T56YqT5eU+0DXzPG3Ho7a+D9rfu=Q@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
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

On Wed, Apr 1, 2026 at 3:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This diff fails to apply on linux-next, due to conflict with ece7e57afd51
> ("docs: changes.rst and ver_linux: sort the lists").

Yeah, sorry, I should have added `--base-commit` -- it is `rust-next`,
i.e. 3a2486cc1da5 ("kbuild: rust: provide an option to inline C
helpers into Rust").

There will be other conflicts too, e.g. in the list of features in
`scripts/Makefile.build`.

Cheers,
Miguel
