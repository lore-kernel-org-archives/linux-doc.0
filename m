Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792516189;
	b=sa+fFrR5y0qTY2uTwEDZ9obsmbv3u8Upn05Z2Unef4oak/uRCEFCQs3IBMGHGUYToX7k
	 VKaGe4yAfBrnfTbRGodWf31elr6CH108YQnURFkkolVzAxZ2shDiFXp5YW8DlunDajsnQ
	 IKsE1c3RV6XnjY/x0op7HW0uQ45z46OZQ46/Zigk4NctE/viEttgz7hz92sdiwBA1TSVP
	 kS0j/0KEJo3tYZYYCAj+Sc63wtLZImPnCV7Fz5boMYPNjHwDZEWM2tpOezQd8gvl2kK0U
	 bm+CzTtEBix91sxgWQQhiDpmTk6DU6d5UCW9nYKh299fYdu+vWlv1eUFWFNpTRko6rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
	b=dTT+wueISpaJQjM0xbMac9FALR1LG3pE9eRMtZc+6ucPOnEIpVJIDJnqpImpJFfPvaXn
	 tGkueztqH1KRowt8mEXxiaFceUF/kEgucTgoBLlI7tjfCdadku0qpDHCOPCxLoCPxXdzV
	 ow3Bg2Rv6UtyfHIXhwH/16pNB56gBAd5oaN6FDOOVhhQwi8Uy3dvFVhRzsP+CJDKzmFVG
	 c99VeTJ5h0ejbrOIdeKpTR/rJrxYLXBdHVE+zhSMXi3AAXAZaFHZgImWiJTr7xxLeDbGr
	 tmR+WPWsLx+Do9UD+YPybbgC4Clr0e2490MnpMwdIMRM/pUyXX83WCt29/rBqZsicNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GgmF2Jax;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A60606A31E
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 17:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A60606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GgmF2Jax
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-34c522572bfso363800eec.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 10:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792516183; cv=none;
        d=google.com; s=arc-20260327;
        b=Ww0ewMjWJ33AbNOIW2rTcD5jD12lYYQbqZXHbvjMqWdFkHMDLekY0DDrsMP+8Ht7LK
         72bFgt04tf+Arm5vzrw/P8PrTUpwZZ9Rvu1kaqiqf4nVK0waf6Pj+hqiSXg9bCvlUPEH
         FTbIjkFvNcgzhLUm6T1Ew5y26eKm2iKFk4+qcAcJtqyLe8FzeeMlATcnK2UXmFW70aEL
         H0c5eEHMxIcZC/5fKxMuzUUYci8wd2/c3XPUnMzSX8Kp45qJ0JozJcVUOatBiSLERbN+
         g3e6D780NYptDNyA5FxXFE9ZsvHW0XGwDVICsPC1UOXdsbplSddriA/cafJ4fMwDaLGN
         fbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        fh=I5Yg30vGkLhiycMyXZCFAY+l7SFBzsXoBjweDv7gK8I=;
        b=L2jK3hIdi/hbv9aJqe34xPm21MnGjfQvSBsOMWoI116ctMmIZkAspqEvHp4RtLOlOe
         Cgw+uKYOl+Oknm3kmsQ2C/CJBvaDHofE8I2DdXvbaV4n92/3td5PbqjwWtFjTvR5YuVG
         6GGJ5u1+im98RBZUBSH7mak9XVuynJLtdX5YTq+hgoDN8mLCXqHCt9QQRKwYxHobYuCB
         iMSuMDSZfx6pBTvE8GmJBDSk44cOJm56C7g69Y4UovyvFnHs/vp1VeYOGGXy6W0/B0sI
         +hxkXfdK7xlD7TtgMMsREuRnt4v2zu5vBzTKFZPkuzkbC2e008cBHidUzHNkF0jvZQpo
         rnow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792516183; x=1793120983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        b=GgmF2JaxWihTIKDQ6w9Iw49mFFy5aK7i+arMpdqj1xFBZLC/BS6rk5OF/MK6uP3C5W
         Jm9AVWMUFJh71vwBZX3czhYiBhPmmlT5Kac9X/v+QcHpJQ8f9DqjtSVviuIYnrEbUEQN
         HrLBLhDBH6fz6JaVN/0P8fjbNrPFw2VkAC4oSASuN5StwnebufW+K5n02y4z1Brz8C2j
         Je7MfkrR4VD6tZWibyrGI9bieSv5thwGC5hCQFe3lz7lL1hplpRFHxXl1e6ZlXE0+nts
         pLDPKbetGl6E42S5j+URmNQBC5/Z5LZ9ilfOpLld+c9Fpb3jJggJWBhJRv1wg7lcyCL5
         xQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516183; x=1793120983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        b=T8OOjJBkNd3f67KPvpwSMqtnC8agtoVNmI4MVxB/yQfmtAd3284JGKh1yNA6Fl8eVc
         bxKkyXQfx8nKeHE6YDj0RRbGYVsMtL2HH3HoWN2u9HwtRLrqWP0PMWVwW+glt8p+HJe/
         jkS+D6fEcRnLfRmO7YD2aebo8Dq2kacNzUFVfNGhAIBqmHw2fboEdjsFuCehKgFKC/bM
         dF7xmvgV73mNktxoUzdVDjwbW3ui9OFiwT2SYlMO4WjklMoSg+L7v12eqcw/swkIuiGP
         JXdoNj5CERBzE9kMrWhjLlnIa94qAgJLVnIbJT4IIIxwwwZGxGW1FyStN4mO3KO+LKYB
         FjdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo2P2aS9VAYiqHUIPjoliZowJFIP2Yf+74Zn2E2uHDaySRURJwrMQLPq8JdA+QzSJB10wOpZ+H3xQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVW3JF3zsr+wYiNj4LzJaBS1DNR/zAdEtuEYI2XdAcSI+IOS2Y
	xflmIdHiAuweprbcB8kOroVa7toonEGRqWBSgIkpLDRi/5W6gHibZdQywDuj+BZDX+uZQm7D9vk
	sR3Fip/F/5UuEl5hppAFleo2PvIyktFg=
X-Gm-Gg: AYBFou2SnpISB9yIJULCsIdcSqCECHH9adyaRpOj/XN62W5Q/Tj0iOgRA+vxtNcMUmP
	1Nr4IMRp6u1rGt7soF/83CVZPBbci6QwL8DgyTZuMCpRa81Rzp97qqmNciTI4aCrUu6XsaCzGLW
	XEnCSPhFtUyTdSxHmm+VSJD8blB1DSm2qkPp/HK5u8SM/64pq/hYNwvMSuxo/BgE+sw+f0cBdvf
	j6Q8Ypk6WJW1wovX+sdpY8bifVVwrwc8VsbnFHRn0Ma0j9j4alkZ5M5MJTKNpexD+kIkK1M+Cho
	XmP8Ld2CRjWZDeVurPidK1xoWK9hvneNitJKSSLCt1DBgh6Sa4SCavjMiQCd9QdtPtaLV3tPvdw
	vWd413nF2mjyvH0CgoNRimKjuNQFa0g0tpABNB0cQdeROXley3Hjl3q4EwN0/bUFsJDZWGKEl9g
	GJx3MSEOAdVKOOJzY2ps56APbYfRFYp5cuqX8j764tsTOtqV3WoXI=
X-Received: by 2002:a05:7301:da84:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3619b212ef3mr24985185eec.0.1792516182799; Tue, 20 Oct 2026
 10:09:42 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com> <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
In-Reply-To: <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 19:09:28 +0200
X-Gm-Features: AclHuK9D4Eg255wKZ2sPBwolmAnynFBIgoIfmMAgFcQGyxFl5TrsNoPPIa_966w
Message-ID: <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 12:34=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Happy to take it - but in the interest of avoiding conflicts, thought
> it might be better suited for the Rust (or Kbuild trees).

Same -- happy to take it too next cycle, whatever you prefer.

> Needs some -next time, too.
>
> If I don't hear otherwise, I'll pick it up later this week / next week.

Do you mean for this cycle? Linus may not like that, but up to you of cours=
e.

Cheers,
Miguel
