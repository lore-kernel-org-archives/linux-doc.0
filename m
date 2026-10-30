Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793319844;
	b=bW8ckXAj0aXpEQMpoFyd5OaAaO56/ar0lHEuYXfBBHC/LFLumm61ssw2q3/SjV9wP1PW
	 ibHmXWK8PaUISrN/z8P0I4qH0guteEM5d7r/iM5M302GhU40bJlmjsBpesU+vQAvskmMT
	 o6L2NNxpGS/n15fO+pXb1ParT8p8UNqJOeAvCH0SGqk0QOgK/W7HmkE1JjzpVHYj4JjgT
	 vznh7P4iMTtP5VC4/GpPHEcDWQblHougSd8A70I2rJfeMTmER/Dy9aZ3/M7uGzJSGKWOz
	 rXrv55KG1xW/PEAFHzCWYZYlzWICyzkLdpe9qWiayAC+0hk0/ornCMdlGQH5GTU2Q8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793319844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
	b=hN4Q5Jg7NzJlqD/gYXa7hL7twFHlpt1LO6csZZQZqa5Bu+0R5W815TRsdmATqUN+d08b
	 0mJhnK4/rW31FmeyNDQO2aTYdsWRP12V3MOp/a9wROuZgZltSSELzx0qfTCD+95O0kKb3
	 /EDzcjQRpHNCi5OWVlpcpMppDwNw4D7M4QWr7IXJUqo9hP8c050Q3LwvSnlM+t7u3U5rh
	 EycvQm8a3/TJ4Kul1KN1DnVsw28QlmrnIPMaakE2uacUnhhzz/ScJpqodUxV9s0OWjsvC
	 noi8+hrTyRv/ZhOaJ7n6fwmWPfBiWzbqkh2Rb0yDWe/49Mz03aYJyxRoReDJYHO0JmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpGlNmog;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E6606A32D
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 00:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5E6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpGlNmog
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so188349a12.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 17:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793319843; cv=none;
        d=google.com; s=arc-20260327;
        b=oKNkCi0wDA1zZtafPuttcn71fbZje+/VOcBM++mU7HvYayNe5z6gFTIWh21BvwEpfy
         bfEFVI70NVRhzVMgVezNXdxxV0fn0QXq/ijLKbwMclAWelOcoZ/tmPY2gGC4YV8NN2k+
         0khplD6rR3OiZTe0dE0M1pHFFcy2mbJDKxIFnRCBcY2KKeIdyIKqwXJ1esLmUmVkPA3b
         rAaUf7wbwPKOAvwwgDjS/wi137flYRffJy9DGEmJK5/Hg2ZH1QZmdtCDQ5EyvnekUq/S
         kaH9EBxkbmRceOwf8eij0eUNNGpyn8DuRC8dwolVn/LM04znRvb1r1nsybGI2dZ9J2CN
         zDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
        fh=IG+qsJj8Dk0UdMnlkMWUbd/7gtoBAtzwJX0+x7UKt+k=;
        b=ruVTXsqMcHFhmygaknky1i+DcqO9ChaMHL41k7+wMBRF9PioKhu8+eLJqB6sgEJZD1
         FzGDbOIPcP1jlPIo7wbPwQto9InqQEyEGyKrkB9BYcL+6jSutS/+xiu2U8arRjZnUcMr
         86vhAVv/jdbsJQJcGFM42IZhYqejz/yPl5wXqXCL5KDlMvYdvgkmG+Z+9lUkymJmHoui
         jmHECsXiR+GrW7WlvDnn8u4x21kKKRlx1zJM3VL7DyN8/QozhDowkAMyeIjSZTYc2g6L
         Bu0L47km/DBzdiuroXrkHcd5aChbemznECrgOGBQyaEiyVy/LYibsRWRFG/N5k5GjwhC
         c4nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793319843; x=1793924643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
        b=LpGlNmogTRImOIcoGkVK6kX1FwvGGuvBqIqbOQmm5KJ3xSt2iFKkzmTKCxMImHdVaB
         aDfTjwZqyoMW2Iv2ufgeHFBdYwUo31Cysp7oHlTZ5mddkgutsSip90Yu0xuL4dwsjPlG
         H2d2o1NYWkpAmpZotlXfjCTbgYadKtl2mltD866hVzSHDvqBS7/xSgXNB9gCvo5NaMp6
         UR5LppzANcnsvAThS9ZzZ+t3lqd2cQjUINGMXJlzmHMLf95KKq7TGISjrOlO8RGNlmd6
         PEsSvEAPMgc2Des3Z6s7C7VBy/qcyKQWcN9VLLn5h9MLqOJtFhjlOBczCmc7Ss729Ap1
         cjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793319843; x=1793924643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
        b=J8Zro0KlpSSPRlAgUKUatOrdFbPyeMT6Hcq/Rudz2Nk3UcHXjK8/K9caFfJQTQrxuq
         cnJX5m8phIurEZlDglLJRvj6190LCQNMOVcf/SM5mpUqEVxzBDPU6edj1bDkX3+VF3IK
         Nnrk9ZOLQaKmLW5FNDUDaRmWb07169jEGQyyWKCaBvhnn3EgN3tpWvnqDfmLsf7wtEu3
         YZ2/cVuZvfH7DwplbFTazno3SKGQ/LkVdJFZeeZrdMpHAYIBUwByrBBwGOX/wEREM5IB
         yZFU2ORxKLf0dMAXPGuol5VfQQyOdf65pLB30GTDhOndwXjbiPe+lgwnyXaj7O0TR+5b
         wx7A==
X-Forwarded-Encrypted: i=1; AKwUvByyNcCG/N5/3pFX2r5jx/dTQB5CNT9xMzLDV6HNG0Z8904exS7UpXwaCkUhGlOrPmJP78mJz4dzLbM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG1GMg7Y+ngj2U6gPMwDbwG+VgR/PBJ3gaCihJpgBIxUvtw7k5
	8ITtQ4QUROnNFixHcq6n/8JjfLfT3MkJe72zgSKJPxGf9IEvFP4ppqp0Z3C46urgfgn/2/mitf/
	LbJpYT2swokyp6Kq6Rnm7BwKDkFLPB5lw8J2WmYeh
X-Gm-Gg: AYBFou3QixvXHol1DFfXE4XIG7s19f1J3uX6cmXjTPoT5UmLAPtXbulxIH/Q1jXbC8z
	ghDTFdGZ3TQRWooKdO1uq4adaMNXzKLamyzFaOWWeWdexfDzFiba8MS4lmxKF/4zgeGCC3vhTd8
	uW+Y4hdXWRKz7wHPRAmLPFKRIiuQSL1nh04LJ3ddFctC8WWdGg1G1n70f9Valy5RYO4MxfKd5vS
	IZgwulnrSNVIv4mSThHlx8NF84/0Z9y+rN/fVN4FqURzDl/5xxen9/PsgmXOiShu6yM0/GA/R5v
	KtHQKuQ0iD8Pj0EBd5fU8Nkr6shJkYfG2V21V8WYJji+YaSmW1k0wz26C5rM2g5p2rf99q4vtPz
	MeUmUC1/R874rGzMcNdjuuXI9u7vGvHbLOycotDgmLtZAD6BfelYLYT7INpRiMTQ3zvRPdgZes0
	PLXNZ67iVkxb4TQHQN
X-Received: by 2002:a17:907:6d20:b0:c46:7643:ae91 with SMTP id
 a640c23a62f3a-c4ca7a08673mr59997166b.8.1793319842360; Thu, 29 Oct 2026
 17:24:02 -0700 (PDT)
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
 <CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
 <CAG2Kctojb7xiOqTmwWqoAKFaNUECjOzXVc_t6KbG13Pqm2dbng@mail.gmail.com>
 <CAEf4Bzbs8F1DPBz=WXVTExrrNjzvaFsi4L+HEj+zbUTpPSTX5g@mail.gmail.com>
 <CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com> <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
In-Reply-To: <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 17:23:50 -0700
X-Gm-Features: AclHuK_8kDb2R9N0iMUoVO0Y5pzDVtS-1XOT4NszWcH8axoYKkVXrpd6hnWmpKQ
Message-ID: <CAG2KctrkKOTdsjWVRBEHuH45-9xpYsxDTk8PpZ4Gu6Ygq1Azew@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:54=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 3:36=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:

[...]

> > I envision ALL_MATCHES to do some form of lower_bound() +
> > upper_bound() on vmlinux since it's sorted, and then linear scan of
> > all modules. Of course, just one of the two or both aforementioned
> > things depending on the module filter (any, vmlinux, module).
>
> no point in upper_bound() if it's sorted, you just start at
> lower_bound and go linearly from there. I don't think it's realistic
> to assume large number of duplicates, so I wouldn't optize for that,
> one log(N) lower bound + linear scan will be faster in most cases,
> probably

Ack, lower_bound() + linear almost certainly will be faster in practice.

[...]

> > My understanding is that the size is encoded in the ioctl command
> > itself: _IOWR() puts sizeof(struct) into the command number when
> > userspace is compiled, so _IOC_SIZE(cmd) is the struct size of the
> > header the caller was built against.
> >
>
> oh, interesting, I didn't realize we embed struct size into ioctl cmd
> and match it exactly. I see that pm_scan_arg has the same __u64 size
> in the struct approach, I'd stick to that, and when we extend any of
> them we'd need to make sure to either ignore or hard-code the size
> part, hm..

Ack, will include the size in the struct for v3.

[...]
