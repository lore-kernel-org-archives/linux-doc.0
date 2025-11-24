Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EEA17C21E
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763948927; cv=none; b=AaFN496g3DJ3lzovq46Uah/CWnSGBBC6DlYE4UM0O4a4KbiHgbVcfegLYzE+KzfQrNNNqoYeTWwkNJMotdKWHxiH4CRxPShIbnrccQDWd/wrurewq3hEFXrJpgEAMvqHahk4kUzCFRTBt7ltXGWAq77BUnZt7yZeVIHVla4DRjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763948927; c=relaxed/simple;
	bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLC9RC7Q8+nQWmWZYRqsn58ELqluDVN+sYjPRzVi75jX6M8uTIx3f6jtA7Tre/2PERKCG0vHHo+ccf4oibCEXuYqtnjWCLjjtJ9DqFeTln7IGYnKt7WilCHvul4Hyef+1VFatxZrG96HpbFhZFCCJbqQwif0Vii3NGz4LwCTx4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+R7KS+c; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+R7KS+c"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bc0d28903c9so413490a12.1
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 17:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763948925; x=1764553725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
        b=Z+R7KS+cp0DR0Si5CVWNw1LJqMRci2Rw8vcCRU88AxxAFN0VMeXicm2mvXI0DanGB8
         eqL4+6PRMk4mBA60h+Tx8JlEi9hHsc+UV+6dbEciHT0/bYQOrPmGtOO+Xi6bs8DKpOYj
         R6H4XVCUx1YWY5PLFkdVeyEBb9utxEGCYKP6y1N0Eua5LJQSFLNon32Pk/WVdEMdqypK
         VvP5wg6eqIBQ9TWEAgi10Mrb4nJp5FTvzgIP/6elr1ibBfssHy210PKveWa4XupXH4OQ
         jwrWahH+DqA3rjGyzkEKuOgOcoRM9oFW3dRsp/VvCoUoZWYMqH6l98+VLxf09buuxfOw
         NQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763948925; x=1764553725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
        b=c94/eUpV+z7E0X2xS9o0iVRRq/N7gCe6JMP0H/MTHvNUdTA8UThH7POf9RotJ21xwl
         ByNrv53YyPRRSX7KuPLkFbCISLl8wv0omHDVjaggFTOqCnRUuivcZhK7+CUTQMAJQB8J
         bz3PcfWQxlbPsh0VWKZtXbskDE22r4lbentKOCBRSj6S2zTPuCZ9zMe7SvYDB+L1v75W
         6rnfw0CIgbWbZ0/sY7/kTaKlk0x4nwjchJLqEzoLyIK9kkNgaESoJWltbRF1HJBKInZw
         Ce2/FVDHVBIoirH5Ljnzyajk5Z3dUMz/bcEaxDV6HTEiAMIhL850Jkdz6sBy8ycRtCN+
         9E/g==
X-Forwarded-Encrypted: i=1; AJvYcCXsmHtbDAHtDmtgYD/e7O5Uq+XD+fNIGq5TSPaUgVEPi2N/JkondwSGp40y+dwM3W9HzlkQ6K1uhpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9LRhIJNVnvgIe4WyMJVKJx2M2veVORKgiK8kSkEI4vqSZFPez
	T087FFBTshsceeX2j82OGk2MgJk8g/1qBLBFqXbRx7stniMnGepo7ckDdNM8VRc4jSRggWarWt3
	i6YJoWbJhW3LOSQ4781kUv192IZkc+0I=
X-Gm-Gg: ASbGncuA9bPV/IJiNvddWrIDkINk4uAqtjezhUpiN/kX9IbhpTtYvCuaaHg1tbMPskH
	7ey7jkUjVPq/njr8kM0ZNtyuEhYbW/JYWPly9NLlJGe2vL9CoiIibJHTOyBx9VyzrXh26wM+fqY
	Vge4Z7trFSsumNywxZvnlajdHw7lMlVZ099TkPUZCs1cWf7mBWNbyHD/lpJE/HstmwP/43+MQ6u
	IQ8uH/0YuJk47yB/3Lc6znWHvX/beOOJspHrFbQY3oUVY3sT4zihO7p3KIyyczUBNc0vIjCfslw
	96USrwe6EN3w2lWjNy7gFdQp3+HjvxsyatIOB2zEhfD6p+zNM7KwEMylAhD90dUZnlscwh3q77N
	IAwZowHVsx9fapQ==
X-Google-Smtp-Source: AGHT+IGn1fQWUtfuo1zOBYncWXTAQy3r5XJCczzktuyTrIF4ISG4pCB6BfmuhKsOzi4ofGGWNC1ayRtxHafCtO0nUC8=
X-Received: by 2002:a05:7300:ea14:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2a7243d9794mr3793745eec.0.1763948925113; Sun, 23 Nov 2025
 17:48:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:48:32 +0100
X-Gm-Features: AWmQ_bkQhmxLSFViZmcLEfniv1-_q0VIV-sH15dOpedbSpl6O0HvgiWJ0WM7vVU
Message-ID: <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Use the `BINDGEN_EXTRA_CLANG_ARGS` environment variable to pass the
> `--target` option for cross compiling, so that the function can be used
> to test both bindgen options and bindgen backend options.

It seems this explains part of how it works, but not what the commit
adds and why, i.e. could we start with "Add `rustc-bindgen-option`..."
etc.?

By the way, shouldn't this just be called `bindgen-option`? Up to the
Kbuild team.

More importantly, should we just have a separate function for backend
flags? That would be easier and would avoid having to use the
environment variable, if I understand the commit message here
correctly. And, anyway, it is actually the only function we need so
far.

> +# Return y if the Rust bindgen supports <flag>, n otherwise

Maybe just "y if bindgen supports"?

Thanks!

Cheers,
Miguel
