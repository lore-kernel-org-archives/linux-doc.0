Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83E03081BE
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 17:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065562; cv=pass; b=Z6mIMJrDdyrxHLBSUdSj9SFSCbNFtD4JEk5kqmBIQPArvpl/OhEPaJgesoXNfqZ1RREOuI435lq2JMGbvhllreCNKuFFREN1c7xwdarrDJQuXthr/a8LWswUT/JKnJVSRcRL1eER3tTXFKHn3uT/pc1p4LVEb0uxXRUCS9z9FJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065562; c=relaxed/simple;
	bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfnnQ6Uol8OxGeUg+ifuHBqc2Gfp5RaFouwkmfOsCYj7av9jYwuiKvtQlz0QcoOZmBdoiZeB4fUgKmwDiwsGFzGXP0CYTkusVBhXxpr+tFxz6aeCwiXMS/pWJBzTddlUO3pznEFZlvUPQDaYiGzhGBz2Lk7eOw7wvw+CnFlOkq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuSB1yrt; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuSB1yrt"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c98928e4bfso5260eec.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 10:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065560; cv=none;
        d=google.com; s=arc-20240605;
        b=CVrcDmuz4hzu4xYcb20w3Q6y+2hrl+ay2I+AS/8kq8BUA0FeC2vddM810PRwU4feNR
         5A9aaDpYIN8UCeJ30Hi12JuxhGRkAFKBdJVYmN//WtFCZ/sRXRG0I5womROc4R8V80ot
         r7Ijr2G7ncX7GkyfKeOjpXoG1WPa8pg5bGfFLftJvko0WnOHWFjrBatlFAkXhZSFj5QA
         pJQgIpV4neIy1VgTXX7oO0xiBZoXRaNmP68AjbAUvcqBQamYmkEo0RNiguJzWfuozxIw
         RVpdMuvwJv/rHF2yEKi2XpU2Ol01hwtVwNgdL2uPQqnuDKjkxwaDpNEWjL0x6/d02uhI
         YiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        fh=B/acSdfFZ95m4RyH40Pvi9iDRPhwmtMzZa2HZfAc0co=;
        b=TEA4+sxldXDB5PKYsZDXZ/o7nYt98U5S2XN7+/3lZr7QpmRxC7Ehxb0iw8cvGkTYYQ
         09NvNzPkVZLoZbtpCs6vapDCEkoyKe/SBMBPEc4cKHiVqx1nOkd0dDoDlA+z8WeULtGB
         mbcBg0AGAkuhAopK0UqXItOGSqaa002u5R1YwdLj1P0q04k3cA27v4+tfdpo4NOiY8xX
         D2KdXnL5o6Bcf5LY7+zRDeswdCQJca9nYWvDMJeWIBooRi+59Ggx0vmWzMxKtHpdujiA
         7uAzkR7mI/Sn7RheHB3eXgk8E901qMzlhwg43pdTonFFIna7CF/RKrQNPEwbUa8/v4ng
         t9QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065560; x=1775670360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=KuSB1yrtfd8BjsI6YjeWCq5wxXfLwBoKXUpCsrVo6QhIUPYZyH8YZscFQf+sEFQGSa
         TZa26pVuuui5NNTB3TMLCTlNQdZUd5bNv5ckyZGKLMzmdHhcy7khKoBsPqwALzvfTqMx
         Tx4YahpYBU96LprRTqv163LXmagSQ2UWTUI5fXIc45fHuZJGblCH1AeRl57i/ejTj5Mm
         qxEZ/P7i0pLCCFWwjWNVkYKtF4Ldade03b80tf2gtS6iOo6Vr4UtiKUQABYe6b0oT8sT
         YwPzJUkCLIYKqge/KqQi71RrOh4/b3n6UY1Gp9QJ2fd5NIK8vlg3P30n21TqlTrKxzN/
         SiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065560; x=1775670360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=lFUvQK/35dWNyAgCbiJZ6Mtb0q23gcSTHeB0SuvNB9Y7eWxceOv4c4vCU/4M8l4O3o
         y4q7oQjErtNUXKZGCXQxk94y4FHchfAHpZx0SRIr1cR02DQnGU2KxxAkEaWd+fnEqPsH
         72+BnfyCRVfbeBW8dX9r9ydfQ8ud4++RKrIE2nHrTGHzjy6G71yDnnXDJlXhcCBMfsK0
         ZeXG6pnSrbsSyAMoH8asjE8sWQyWsilmURSizcvuq46Y+eM2EefOxU95VBc2bPrBPt3X
         SNo4WbXn7xPZWVf6/2lG3mKbSDrbBAqbNEw0iAs/i3LolrTmECHDlhcrNpE5bG+GAgDz
         /WgA==
X-Forwarded-Encrypted: i=1; AJvYcCUV0DoVZfWvlhN42Qi9A4qwfcqOhpNN94Gm5Nu3L6i5MrxSZDrP1YBhWLWTAyRc7atZr21bgKI4w1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYeVSXRcOVnbaNQA4bjuerstf/V2V7OXj8odxj/MKGey38EAx
	19IRx8kCDLpKPZqeJorM3y3eWqen5Xa5zWwd+T5bY4rxIU7Ap3u7p3q7l7I/yFeXgQF6en3ktSU
	5bGpbLiJ8+5PcbtOcM4nrDI0L0WGRIng=
X-Gm-Gg: ATEYQzx7mnEvb0SnmI2ejHERQKOExXC1O0uI3mwLEpiXsyjFfhYSrA9ZShkq5BMAVmd
	+1+x1lWDc7kbcgm2R1b3BvYuOSD5b/OVI02I+QpekXfDT6Iidl11CwpQVZd2bP7kQPQSxlbYE7l
	PwZtZv+pfrb3AIgy93ZJZF23vRIG0GnDDadBoN/blRwNpq1yaTiSzOtjSCm49kcFmCpyTkKT4A0
	JNcCU+Ps9adJglCAhGD21FJnnxZxPAXcy4mPVshcggKg/Sd1Y0OXAENH3K3ywGI0v5taQRYsEOD
	ncIIbw3kQxDO4wTCSwoudN1ZL/rhouPQ+FnJYKj88y5P0pN/PQSu7QsPEIW5Dpz6xGQHt6lcJUo
	5i2jI83uFwn7FgM3mtsslgGUom0lSlpp1pw==
X-Received: by 2002:a05:7301:2c05:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2c930798a4dmr1033595eec.1.1775065559731; Wed, 01 Apr 2026
 10:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-13-ojeda@kernel.org>
 <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
In-Reply-To: <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:45:44 +0200
X-Gm-Features: AQROBzDasvNfwm3irNcxLclKgLrVzocIHNQudR_c4deB-93-CSbalwIa-aYY_TU
Message-ID: <CANiq72=8eVKk0gqyvgWM_-VSsRZY1s2e7gx9AbAg+q0dRRYO=Q@mail.gmail.com>
Subject: Re: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO comment
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

On Wed, Apr 1, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> When I write the comment the intention is to enable the unstable feature =
and
> switch.

Yeah, that is what I meant as the alternative in the commit message.

I am OK with either.

(By the way, I wondered why you mentioned 1.85 in the comment, I guess
it was supposed to be 1.86 instead originally, i.e. "above" as in >
1.86)

Cheers,
Miguel
