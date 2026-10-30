Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793320095;
	b=ES6MMLOFfFuIr1cWp1b+5fwdsnpzYsCi588k4M+F6Rl2Cw7KpE0HJo6YcQXH8MA8G9Ps
	 V4iZF9JCGbTGbmZolc9MbSdbm7wTQorPMo3IJ6xB41QwrVujFNMpZ9TeTj/Jh4guC17VT
	 k1h4/Z5ZADNsnjhs3OmIN/wmqd0K5oMxzJJ07zo7P3y/ah02p6zesZDU4YtuAzTKmDa8b
	 RYjQ1Cto6NaTIzyQ/80fYLXwd6R4L89XawwS5zyVOv9aSsQwP0xaGhSQ0QqBxBW9HvwPW
	 kbJVrpcoXYKLfHDZ1XwyNHQ96mlK+wKT+OZMdDQ9Pskgws+qN+7uDKJ2YEqeexbdnMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793320095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
	b=doSwrKQekmUzhITcuFOGH+F+TQ6npVx46CcY5MWhlHVCBsRuaDpSKH6Uf9t7LDf+WRwW
	 NVHR5i8pi+d6LWKRLrsxr5BKxrL9Jld8oTnmF0nmAMPeJwhCE8sWuI2dwxx0vnt5pCaxr
	 Q1hROSC81xr+/CCaq7T7SmmIQ5NIU/rSnPzEjOzkdTnVUbhTIllWseGnBCIaD83dsTUaX
	 /hgwd3EYbjy+HKpZz1r7TiAk/+JyRKUk5oEABZFirbjlwpwmdvBXcsaMTJaKKITxE/7Nt
	 FJJeFlzduDdwKFez2zW7B+b13Zx32LepRbPJOKa3WcTWkALMUC749oHohQU5dvrMtPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EPx92SD2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58809606A31C
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 00:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58809606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EPx92SD2
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c247f6687dcso15445466b.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 17:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793320094; cv=none;
        d=google.com; s=arc-20260327;
        b=nmKuA1VLYjdWvz0n7PdjfKMsNgtzbAhbHVOQtQewu49Ulb2CReuTQc3nRVmsn5riul
         1Hh8M9m34bNCWjvb5Sa7LHYmXi47mLYSvt+QuaFv7jBmMxyj/O4i8B95JrRVfQ5KuOE8
         4bgZsT0g0bkCzp/LatxzBGObiBFRdWcWz5B3S63Sz9RzJoJ7jyUzXcSrE7qA7pp/enax
         lByugc0tIfigvlfU5fTSj6NF/h+zWE/wFmpU+vPeFOIQ1ZyjrhyyjuhasOoA8Qggydv6
         nv/E5C/T9w+jIvET0Rn6hn5FItglAUZ+gyUWO5ilhpAg3CtZaFW9AEya87AEUu6wFbku
         f6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
        fh=qrsQYv7b44fTPG9UKObTSlZ68Z8kaWEB7gh3umiGKmU=;
        b=cSrHj3qfjh8ngdEQIVSAHkFAs044jZ/8bGydCfcU69rwrm6Oza2gU405X7z9UV/jRW
         YaINRmmpdvjezyXHrm9YSk2qyKCgedmgyl7sEc8RBTLhlFUKauSFX03sVOx4gWEnhYYB
         TCM1R8PkcU5IDv1XWg2nqZ+FCtnroWe1DM3uIHeNVyylTC17Nk99bQLW0F2gABc6zId/
         ZF6xZTESH8qebt61Cq1CPE12qOZtkTz3OlL7OSrEhCOlqNyE1GUyGF2DYumcd9xPBXwy
         SEX6HqI8ZuOToDnplTVoCwBKRFt7VpXz7f4KW5OaOtGM3paW4JLsxZK6o9rn3lh12GMZ
         6o6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793320094; x=1793924894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
        b=EPx92SD2/nlj7Gy51oiGKSuUhEEV6f/QjPP90GOkDFVvLeS6MkjDeipocwNmUYAOHo
         Nma4hshQFzy8X4MAfiLVXTjTch8fzebGbKsTHtFJVZmvtcJ/XLqiU+X5MXeqsCMVmIYv
         Za79hAeh1NeJmDlCqaGo8wCd2EdswfqWUwrXH4+pxbUG3u1MGAduayGdfH3uUrZKg2FG
         eri6QEgtNhdn53F3TkjFc1eyvmQSMpWYENciLq1Xsp6jUql6lXYYI0BBLIWwe3DleuAP
         Gnl0sybHD7FswrWEWSln9OeTt7tTQs+RyhYAc6FCxYbGnZJZKGP3TlK3uV0H5AyQZyiV
         9+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320094; x=1793924894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
        b=tzFRGZMcFl2UcGDEd2LGnsoq6xlFuuZA8kKV2x7d9IBTB5275F8wJvDD/TYuHb8pMz
         +gcXZtF409zRee2wtQL8wLvYfkJS5/SsBRef57ro3Zt8XaCOuPk9cuOjMgmi4FH5Ls4E
         X781UoDDR+dVil9zpKAKVIT9GJYF3aQb42CKWyoxQ67VjVogkJoIj9PHa8nvcsCusCW1
         s615GcmOqiYHpOPSHoZGMBQug3kl7ary6V4uy2kwjOiFHE5RRj2P+Qf8vzCAE7vtvwct
         N1WfD9xPeRGVNVtmVkUjJaJ6VjIijBlDRt83u0tUahOza9eqMwBr6DMPPHJ0c4p9d4xG
         171g==
X-Forwarded-Encrypted: i=1; AKwUvBx2hRe3Us0BZEPRkBP5MN39B/3CKHTzWpXN9jrfOAr6mfuW3PZqT64C9JFhBlnc7Wfy7TA7WlPEfuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLXk6Hpdbpuud/Wqk1GID9F+JJzc4Li2dECoEWoYExig1dMyZJ
	8RD/6hxOVaw1WlZ/grLzeRaN4iPAiJfUCZEmO88OGTrpk7tS7sHJomCt11ftdTbWydvDmSZ1OZx
	1L3F0rzpEGQR9NWN2Z35feJrL+S5RFflN23qHWXOi
X-Gm-Gg: AYBFou34ORmN+RiUj+qSRCoynCxU9didYfg28MPdVMYRUh1syU5rEo9xgW9j+uSqH+1
	Bpw9Y+5cLDe34unlFfmiQzgtZ9XK0+bwX8zOz3gfpwWi5++GCtKewQQpsCJYXOU3ApaiBagQjeb
	yMC0qwPJjJJJJlesWzhMjtfrFLSImgiVJH3NmH3CVSeFul8ZFb39ljWP1NDpLu54YEvbHmgIglu
	TyiNYwsnhGbkCkw4fQpej62kLFGPS6A8as9uK7Q1Q5IbwXB2mwPgWpkNyp+H65qfv0moHGGyJ4c
	pz79VxvhdI3gnCGh+sy3J+dJ/FYHPFhM7+I2NYH/hlyN8xuLlt0BgtpnrnBb34B3Z6I9FgFYvCf
	C9d0OJZkXjSR3TTUk0+jlNVUSp4gRJGZOZzpWd1JzcI6rr4/A33n97chsnndsnEBbBrWYlL0=
X-Received: by 2002:a17:906:730f:b0:c49:a849:cb90 with SMTP id
 a640c23a62f3a-c4ca7a9b33bmr56944566b.39.1793320093443; Thu, 29 Oct 2026
 17:28:13 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <CAEf4BzYT4rvKwbOJ6UQ3zcp4wdsSBqRsMz-2=U1DA2RyUA3XSg@mail.gmail.com>
In-Reply-To: <CAEf4BzYT4rvKwbOJ6UQ3zcp4wdsSBqRsMz-2=U1DA2RyUA3XSg@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 17:28:01 -0700
X-Gm-Features: AclHuK9TILtLrldY6faAGXZBT-kc2c2frEEMYWdaANb8mW26TierZlqcroORRGk
Message-ID: <CAG2KctrwzWGFRs6CZcSRaFOWx49WbH9LQVQJunWsPD3MOXn_iw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:16=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 3:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > would be different symbols at different addresses. Please correct me
> > if I'm missing something here!
> >
>
> foo and foo.constprop0 are different functions with different
> arguments, so I think we should distinguish them. The only special
> case is .llvm.<hash> because that suffix is added by compiler for LTO
> and I don't think the function itself is any different from the
> original

[...]

> I do think it would be good to spend a bit of thought on how to
> support at least one-by-one pagination from the get go. The same
> mechanism can then be used by batch version. I.e., think what can we
> use to provide data back to user which they can use to continue search
> after the symbol we just returned (at least for fixed set of symbols
> in vmlinux and modules; we also have dynamic symbols added for [bpf]
> "module", etc, we should support those as much as possible with the
> least possible deviation, IMO)

Let me sit on this a bit and figure out how to distill all of this
into a clean interface. I'll keep the .llvm.<hash>, pagination, and
batching in mind for the design.

[...]

> user code can be easily written by always setting buffer size, even if
> kallsyms_query is reused. This is the pattern with PROCMAP_QUERY,
> let's keep it consistent.

Ack, will have size in the struct for v3.

> also, returning actual size even if buffer is too short is a good way
> for user space to "probe" and increase buffer if necessary. unless it
> adds tons of complexity, this is a good and flexible UAPI

Ack.
