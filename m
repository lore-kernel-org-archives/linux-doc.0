Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D44F1C5499
	for <linux-doc@vger.kernel.org>; Sun,  6 Sep 2026 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788728430; cv=pass; b=o5XXV2sJtaHONILJtkteHpxXJ9pWlOXq3JaSiAK6dbqJYh6YkjfEHLmF77R+6AkAQE1P5hxwHNWjY67LKBEHGOitPPXIKpjYXhWWNnaICrG7CnE9M1AaDpFHbQ/FyIBF1BLGICSLgydihD2T7Ne843+TY+TZw2Zq0avJjqZkGeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788728430; c=relaxed/simple;
	bh=NBPrvAIfRn7J77pp19LwaB//tzyaLAORi7qkoXMKdVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rFDs7b2cGDwMEFUsU8puoqW824JLz2Jzp1bGTifxIIqkAcvKSh6ehEXddWo2Tc/zkUIBzTsKIz49oDfNaflA91+7y5mA9yInS9OtA2+7t+hgCTlKSHD2EI5BeTGR4aK8PSyQdSlKM+7XBdLbqfQ4yWBW3ECCG49eTH8cRzY2hKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVTk29/B; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVTk29/B"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8520161fdb9so3111244b3a.3
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 14:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788728428; cv=none;
        d=google.com; s=arc-20260327;
        b=RRx3HBnPsHMqEHEe4ov5RsGoXRvCzDb6vg55pK8a17fp8l+X9Eysa+w8TTRJloVqYf
         wZZc7fp0R/6BFgo3bVeeUgej1cbXYYa+J3aqBfSa76oNsSU+L2smVKWy15IKddsLZXFv
         WycUjyUvQGK86ozGzw4yE4W8QXONLzGlMrxycfmJZtyegUpcxCu73uNkoySeDUkNPFSa
         X10uUKLhcEjU2Rhh7FiMUsOgsCv0EuY0viHsjyC1ytp61lOto8e2zNIyJXmVEcnYaroK
         ta8D2NvUqOR07HnOadVZ8ELPuG1oXaBvGZO5Tn2cb/XCGLl3gIBrgiYQ9YlBnSoygbbZ
         OCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NBPrvAIfRn7J77pp19LwaB//tzyaLAORi7qkoXMKdVU=;
        fh=vqq1BOk5A9lXxI/CYERlYDy0Lug2Uop7eHkhlBx55RQ=;
        b=ovsY1LEzRZlwQ/buWqSyY+hFjjNIgKU2HME4ENPyU6GUq7TfSd59+l/k29xU5ohvQC
         KH2e0HEV7SU8FnO3a2G1PPgmW2yz8YJAp6wrQJDYm8HO4P8j6i67eQaBjWQzxSJU/Kmg
         etTy+JsNB7nnY5UNtngmTgt0vOljfcQAV30jqhxBEGAD+x033DJRxWacu0mxwlvysXEM
         V5Muzw+/SSMUQ5pZZ697L1uwhWxRmISjrqNJ+7H60ZPLP14pSRfd2Mzfz1oqR3FYfkQB
         HL1cDqA+ZddQzerrentv2Klq3X721jnB4wyrK0qlibKIbXYTRfk7pOA3qTsYadEGRZ2/
         zazw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788728428; x=1789333228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NBPrvAIfRn7J77pp19LwaB//tzyaLAORi7qkoXMKdVU=;
        b=sVTk29/BWQGRkkgzWxzk+mxPaf9nsXkycpkHKV5o6cRndPaupmkrbbmui/W9Piz6Nq
         0sVQiw45bx3T+utKq/lY6VoAbIRA7BF0vZVFtDA1NBIQ1uv/e9v39vmyfJvLfUcUk1ty
         u9V3xpLgqqT/XaxjpyoE2B8JmoraufU1Q1pKJoRCT7WVfrofOiO9NipkJmh4L+MCSh6S
         s0V+A+n/8rMG1H+CM4JP9ewuLdxde65rChyu57guRrvfUTGOkRNdjFfLnyzUhsrU/6/y
         bhIkFsz9lUgrBy5bvnpNqEbhq9NRQhn57XM0DCCFHakYXw0VTM0onWY9GxCbjwL9/rFo
         IcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788728428; x=1789333228;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBPrvAIfRn7J77pp19LwaB//tzyaLAORi7qkoXMKdVU=;
        b=FNqWXvZH2cp/E6C08hFfhDDdI6/hTQPbUZXrTMznJNeR9Rd5dJp3T+uEZrfT4KenDA
         gOh4by8tN/1l+J9zPkQHdCVJiSpl9Igh1poH8KN/zXnaAQd/NBDyoMktAVj8TO3dJ+su
         ObZKeNVKcHP8zrWUghwc924HDTNBcPxQyS44l/1f8sV3Sa54KO9VAp2n7Wc64wnz1GiC
         WSemXyr7WiFa5A4IcO3J0q9bW/P0K6rut7noqnUnXuuJG0hl0kohbSsXZN96A0clSAKQ
         xAwF8DG2ToF1kRnQ0I6z2IXvEL2qDeg5qk4o/AkDBHUQHp5ZNUT+Cyj8DcOz+wbBsvhK
         FarA==
X-Forwarded-Encrypted: i=1; AKwUvBwwmTI5UamDQRS1RIb76WXMTA5HFDwdF76ehLQi+cSjPZtM3vLmklByizbjBvRuaj1NRVOmr2P5N0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ3SSqeVYb1xboQBZee3RS7viMeGBOr0AjjpYskMFwm2A7sUWg
	FI4LMqJXiR6hmJ8icVBP53mByC/ZOfzhICAZZw68KY3CYPmd2Sqn+ta9vMpXRdND1SukAdnU5AC
	qAYEALmX4qggMUX+rhiUNeNxRuNQ2eOo=
X-Gm-Gg: AYBFou059xbdiqEnDZyXXzJxQrFhllMh4oYMa9fTN/t4kaArqVF22ijo1JAyOFJh80v
	6bY2/Mp4cjHquhd/VwauldSDEmJaJEg59kRsOpXGwcY91ctwJT2kMjPJZsF2fapmbefZTTVoSRq
	i7tWjLVlPuzBKERF18eDAazUqbKh2/1XeVIsLqQh8cTbm2X+ps425Kc8CjZ3z0fuHUWidPfb74v
	vbdhMS5zWIsQ7Kk6iI0J1wtSFz7GzQUBHwv/Mkp03cZQYlauIS84Nca1WwVJN/ZPMoAv3VpjHI0
	26+eMpzWKxkHSdx8vv9RtGYimW0uyp1w79rVPzKxUjZqQCB8PkxVXiYHVonKo9kmgj/oY50Q42t
	F5Owm+2E9LoKy5hk390v5os5iZHkJ
X-Received: by 2002:a05:6a00:2d0c:b0:851:c2a6:172f with SMTP id
 d2e1a72fcca58-86169e749aemr23088612b3a.7.1788728428193; Sun, 06 Sep 2026
 14:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905095649.42351-1-kmehltretter@gmail.com>
In-Reply-To: <20260905095649.42351-1-kmehltretter@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 6 Sep 2026 14:00:16 -0700
X-Gm-Features: AcwNN1W0leQx7aOqOpgYlMw6jEVxRWE7KhwONL2bRxF0V7A_0KXDBokfekOTW-0
Message-ID: <CAADnVQL8xH+zpZEfRX4oi+gTWJeNVE+bQk6tGZQny2o10k+-3Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf, docs: Fix the struct btf_var name in btf.rst
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 2:57=E2=80=AFAM Karl Mehltretter <kmehltretter@gmail=
.com> wrote:
>
> struct btf_variable does not exist; the name is struct btf_var.
>
> Use it.
>
> Fixes: f063c889c945 ("bpf: add specification for BTF Var and DataSec kind=
s")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Pls combine all typo fixes in one patch.

pw-bot: cr
