Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E049A495AD4
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817455; cv=pass; b=feOd0jAYV4B/ka4RFyAcNeAoUg8PcX5jBGTG6zuu2vLf7+/YliGoIvVjXOKqYqYVmwaH95axOxZ85A2kPdg4sjUUUAvHszNOL/NhNFOAx2AHCCG9jnnI0GFFCcav++YwIHGxayTtzbU5sZZq0czfzRv1fI7gEpJA4Ucqs0nXCwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817455; c=relaxed/simple;
	bh=ct2YHHtAR1NATrFfSOMu/0HJEb3d5oH3R82Bkhe1BMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrJO2JywRsBTv+wutKXF4IcS4PlkBfT1YiF5CDWe/nzESSb7voK4bo1W013mmd6Oj9JdAIAcWuMkAP7EYRomK6vdnbRnnbg5KOxqSS+bmPTBPywzxO3CP2GU8dhG0hLWdJqXPPwDj3bhWCq5RRK6yiahLZ3npHKA1d/jsfNlkW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HKw0COGX; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HKw0COGX"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-141395927feso3522142c88.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 08:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791817452; cv=none;
        d=google.com; s=arc-20260327;
        b=fP37aImElRkt4zgAMFLNC2o2pv3ERDjDILd/IwvI+nej0kdYEqgL/ciWv22olFcc4U
         QHsYX6YM2Jw+clz8o+97CkIAOINqtcRP58M0gForec8uzyxeOji7RY6p9kpdCotf3CSz
         bqzKtCmELlhgJ9hj3gKzs1bs26E+zsCa64RgsvHhdBPl/NQ7omZ/xQEn5VO0++hopPP1
         4F1kueMjtO3m+mUYKeau/uznEiffPrhZ2defZyJQWYQg8Z7UC/VMctil5hM2Cig2w7Yi
         mgMS6UlsC5Lwhw0Be2Rd1kFXTdAeKeC2qMS8g/PRTkB25RATPMOt4BdX4OzL8BsQM74T
         aN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        fh=Fb5v5z8tvBdXlxiSV2bRJYPVz7aOwex+EBkEZpRg8iE=;
        b=KMAxyic04GC23Whkvnz7xyu9XumRVjehYZIYke3fiQ4aBq/d3aUpcbddxfoZx8Qqj7
         LqOOF3ijybJasJl2ycniuIGcsx47FxDYM2kRX2x5zX/KntzwU1p3zcS2EelfCWlPln/4
         ngO4wE9y1tq/pqaI2mnA/ARIN7q6sPfZ3wjtTi9JRYqvEEdiSgW35C0zC090mS0uR37a
         cq3WYRbELcbiTzqWXwIgP4UqLQIpTcEJcMMWtqbvyDHo/f4rUxcMRN4Vcy750CJj+OIE
         BLB0WpP+NuKocAEEDAWfbzTnCpJsP6CG8qaYn5q18gQVAaBrkkYUwZ3xHJGbE0TKLKjO
         Efhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791817452; x=1792422252; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        b=HKw0COGX9Ot2fd1g2rSqSxW9WorjwKzFbnZBPRmuYheEoiNNqEeriMmw16r4lieTfb
         Sal9x/w7lL7N+4n1RjZM4lfzI1mTypDafCvVTrmlz9u5fztU64oxznlBDZk9t9H6+NPa
         jjDWxMeqWrT9i3wksytlwMPNdzo25VCkqTHq2xFzBLeHthnCG4jY0M2+rtTvCiK9T/KQ
         17+OOu4pmHQZa4qCYCiEwlFCQH5Oz5mdAOCUdi5RuvuQTigFNKygGiDIh3QMpyULNw3N
         JeKmUAOjn6qiEL+8h6CXLKoRJXjzdp3mqCzhPYnsSF4BcacUqlOUuftE31fqu+/WUOKT
         N3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817452; x=1792422252;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        b=vOj+RcdhXDRywQzxe12RJzkH+U+Ae7AQgkSWhp+uULWiQ8Xv3S1/oZrzHYRGK11kSq
         JUZu6RCeN+imdgOD1XRltoCU+eDusKFGlyaVbnPK17lh3sb3mo0H3vqjs/NzHQa8lNKc
         hXRuzY6qtmw5jeTyx/gWQFRaH7bRU3uRuPkD4Qjq5C9iyQsup0NIt7wY+sn3zY0qhKC1
         0vSvJYnr8bp/n6+G8xmHRznjvcDR8cpSuPIBf4heGFZw/+7YNNtpKaOIDMSi/a9QmTiw
         tJogzZWZPhOwKvUaTaVQYUVhwIt/jtGmJY985gqW35GqU/kbT6VX4+a0vrIEIY+YUy10
         WPZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnSx5QcF3WI1yjRz6VZu2lDCkVh+xMDDvsO3L87Dl4PEPzx6M7cOoCLMiGXtwhraELEkTU/0dfHlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPfb9qXfTybUubtnVqcVQKdUb9m5hhnUCwg7geJpGhku8BygO3
	cTfaRBBaCg7apcnDaf21hsZ157heWNS7h76fOVuktsUkv1y5DxjR8WmClNxnn7gqZNnOU9ZgApk
	3Fi8n54Y9vck0Vo2UqI4tVcU6QcVGWL4cdd11UxLQ
X-Gm-Gg: AYBFou1pVkBrumfCzPb+ss/89gIb9jdVkNiPS7a2qpqv9ODj+vV5m3Tjy1ONCBj0jaH
	IPWOUQHCOYww9Geinaj/Wpm7+RF0w8SwkO8zG22NyBYxOHKxvvTosWFX6dY9ViuvHCNbS/O6cBs
	dF/YCavrVN4fkwPA68F53yF3lkFFouQ6m91z3vfr0y8v2m3yJutMB3+JN8CWM/p/h6j1xjt73HG
	ytAZHVErJwA77lXRRqzbEMdyqtZWmWgX+5dEVp/FDvat8Dxpj0QyQVsak/1XokK0NlBUFV+DOwI
	r39BkGuNVpUaTVY5OeD369sNy8ZkZr1TaidMNeLG9M77NrDgvKIggFva3fyOvr7dsU3LNjtSkXp
	HE9c6Lev4Ow==
X-Received: by 2002:a05:7022:3f0c:b0:168:3243:c91a with SMTP id
 a92af1059eb24-16a5dbfde08mr14809417c88.13.1791817451365; Mon, 12 Oct 2026
 08:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
In-Reply-To: <20261012134159.912183-2-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 12 Oct 2026 17:03:34 +0200
X-Gm-Features: AclHuK88gg1MNQf0tKC3CQVs4jdrfXCck0NjLOHXH7T1xUhHlrbtWu0XiGM6pmY
Message-ID: <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/Kconfig.test        |  11 +++
>  rust/kernel/kcsan_test.rs       | 120 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  5 files changed, 135 insertions(+)
>  create mode 100644 rust/kernel/kcsan_test.rs

FWIW `make rustfmtcheck` fails for me on kcsan_test.rs
