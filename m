Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752D441B8CE
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023092; cv=pass; b=edl8F24XesD5el5zTON/jRCL6WbpUi1nO4OJKEJ5yEr8swYvi7AL3beO57bQHXOsAKWKM0PRXMAzPu6duIODXby+AC6ZOh4aOxSjldW8MZZOAHT8WiqVEgV8zmKjCairmGRJx5jcAAGDOIv0VyoDEGSkru8laXPph5NrxYR2dWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023092; c=relaxed/simple;
	bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEwub0+ZnzVKDVPGKDz6KKmReezSCWsqLxHncd+0tdbspqVJQ3pRNF+8z4jJVOtQ4eVNuhuxX3OOSKU94XHJuZSMf+iQo4D5xhsVBlQdMrzPowp8/GV+E2xZvSXQQyHRKVrIhpRwr9UPlFTNaDOduYxHNMmN2xMkBxauXTDvqy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE86Z1l1; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE86Z1l1"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3510f8aef9eso29650eec.1
        for <linux-doc@vger.kernel.org>; Sat, 03 Oct 2026 03:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791023089; cv=none;
        d=google.com; s=arc-20260327;
        b=Lm7X0EoSl9M7XQd6h2Q/KTlh20V+p+cuTyYe9dTH974UsuNW5ZKWRoZFx+aDmjxkXQ
         +qYQ3Cutbkqg0xs8u8nxQGpPWc+7GrU9AgZbDQ1SRIHV72qPwOAm9283QShL52OxSjUh
         crnlUTu+aQiCqi8W9ypGg7o41Etqo0hF0lZN7mFlQndx5gk5UdwzksNwzetG0oHqUPJZ
         dI68U+V+xfEzUGcH81jhbaa1kcjw91WqyVnPzNkzqkbwSOfMEwInS6JY5MhAtlrXlPXX
         ij+vlfbe8mhm/IksCC70S0F8DOs5GNCtw3xWnrDIpD5VwfdLd2BhaVECzDF5TPvMcW8d
         99TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        fh=p4Zz8K1tzNij5jjaA6coY7CBXVTSIIPqZHmxUz+MGas=;
        b=GUOmb4Ud7iysHblI0nH4kmkvp+7etxpEHteNJO1DcXEHA2cYV5yWJdzmcVcMsc42S7
         jdSETgEy/QBD+T2SBHXWAj6bq03ak5CXsPwGqt/3BfQ5JuPACaNsgs7LLI7SvLrcsIiT
         f1OYUJoh1XsnJxLObpUamuEDbuY1IDyvtvJ87M6+8IIcjHOP2tUTmI1Jaj4OQXfuAbfN
         d3juFv68nXBlN6LcJOJlchDWgYGKLR28sU2+ZvQ3+7DKWtEeKvtYIC5pRJ/hqY8tLkh8
         iuWXQv7Qnl2pVD8ddY996DbBqEQdYvjqcdwmqkvKwN1KKamn2BvJIjDwCz1DnMC22En1
         1RXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023089; x=1791627889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        b=mE86Z1l1vdqQUIiYkieSEOBn9IBYP94La4QemnvpX3dnYKhpExdwYWce98bJS0Sy5l
         VVaxeAMtF4F65CqLlrjdrA3xPnedrITkfbsR1qSChG1vmRwhhAn0WJPKOPI6Sg5LIGs/
         DOwGLDB4x3igy7c9jLiyROyZL1kHC5oVQ5ZK1YdJaoFzwOjl16EGmPU6hCTLfGcNzL+S
         izjHeNgmCki7qRVMCj7lOntvx/OKpldpmvxHb6UOLbEFHmeNOVK7RLNt3WxKr+0r564p
         hP3Ll64Tmuu0w8MWdTl45zaOmwc1WkksQGlu45Nm7DWvu0fLZ0xnXhIhB0Gg74AfW18V
         ldMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023089; x=1791627889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        b=IjU/OmFrXCBb1r6Nq0jWzI3NSTUID5GygZ0n+PHUjve864b6CAMIworQP33JfBK232
         8XmcLCbOpxuyzxJCUfze/bJ648yCh6WRlYYBC1zuBm3hVj1sBPUVt6/nOGtRSUZ2/3Qo
         ve5nK3+a6bIkI+spWBFSxajbwJRkU/1lF9k7rNps1rA2adFV8SDlfINJZIqRk7Qf1Dmc
         xSvvlCViEI00ZOc+v/qnAOPhP7rsP49ZDovMsI1vkfh0mGr+Hhewobz3oS7PTr4RtHqw
         MQx+XANseLvSD5KtfuNx2oaNTmwWxSwlFS1L8fGJyleBtUNRLUe8GaQlDab0y6oalq/z
         3+cg==
X-Forwarded-Encrypted: i=1; AKwUvBy5jgDgqD1kow2f+VkJTgWiybW7aFuDFy3KUW/FrZUvQ5gd6mXicvlAORxtQs71aK+hK4/DhU4MBdo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzlZFyVvR9yaWtcqVLurOicZmxJ6EZTyI/K8+TVf/g6QvqDWwX
	/z8lZ3D3m/LVxzq4wCp6gehC4Iq/F919KbpeLi/RAlBYnuhjBdoFQpfSQFXFOAhioI2l7kpdKO8
	rMHtGKh9K02UTjt8PKFHEja4LcDibGbY=
X-Gm-Gg: AYBFou2AjD+5O2mbewr5dNAYUHN+ezAIKbo5v5aa4oDeR3qwV+6pcaWlmhq5353t5wW
	8YXfTdG0nYuLMtt+Xe8h4dIjLmQqcVGcDYgYWzHq2ksMQz204cMjAry/+Hc7ZY5XRtSENjFQvx6
	tP1OYhb0xhg7p/+sIOdgxFk878OSp9lSEIdpMJVAU0xS3gh/QAiS4x9/OGX9VG+nOr0dQ8EXhj1
	rE+N8vlvgHeBT8GiXIy7bxEswac//CtzVjQcDI2em92eBTtU4lFdzrUEzlcGQuDgQh90Uzu9NiS
	x4byV96zuCig00G1n+bvZsM5xv5V9+/RIsgyTEfg4oLQ02Fvm17Yw9O/ISNyQ9i+c0Vh325bYcu
	kYy14lrmD1oOlrdJ3DU8YgE6mIuh39NLb6mN8kVXfXsiai5jjOj49SkgLzy+QuuVSbQgcn241iB
	dxoL29AI9zr3fHAuJ91X/9JsOxAnxM8HnxpSEd7ZHuBxLMl0uUWa/xemjed84tMw==
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr10351658eec.1.1791023089391; Sat, 03 Oct 2026
 03:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003093827.77857-1-kmehltretter@gmail.com> <20261003093827.77857-3-kmehltretter@gmail.com>
In-Reply-To: <20261003093827.77857-3-kmehltretter@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Oct 2026 12:24:35 +0200
X-Gm-Features: AclHuK-MLIrX0vJiZQYXgDSKkkdNcg8lXBGZYj63LJj9lWkFu6OJmgqYprkqXmo
Message-ID: <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 11:38=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2

Great to see more arch support! Just to confirm, are there any
toolchain requirements to be aware of?

If yes, then we should add them to Kconfig, `scripts/min-tool-version.sh` e=
tc.

If not, then please test with the minimum versions too! :)

Thanks!

Cheers,
Miguel
