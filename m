Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653871;
	b=bQ3ziOpbR4HCQ64FN7nFf9FqrHFtIyF+allZVaa6sTkLPxXpWBgCztHYInnmvgZ8ofC3
	 6oe3k41t9BoxEgpRigzZ2Xi13tN0D4gL7ZGE51iY4GhVuaDNGAl3kG9aljz7mm3udxdlK
	 USMFkrXNe/Eok2LA5q2QoYb5NfD2294CrKbtZJSgZokluRiZKSiG8g9q6hx+HHt9deaC1
	 VosWfQXHDUqC+hU4FtIzXtVL2VJP9VWcI/fft4hHw4kFTtrEMiQyKcuotn9zdRggMKsje
	 OdbrU+xHOKgDDk+OMRmNeF4VnWoSs+I/h2qw7BUdB1JQ8gpu5eee9gT/dFfBEh4sz7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
	b=X97UNMD8b1QAYq2T4G1AMIVniMTByRZvoLQiuS9Nq/kjFS+7fztwqHpqapPTLGw5Vf5R
	 kdUibya8hT7FgPtPUfA1BnHv8sjvCFxoaIQWrgNyS6k+AVn0VFu4QfH5SkeVJ85WvBZcT
	 kAU5LThVZ9+uRRv0pq0lUe1BbAHFz/JA52vzJqSouffviEyCx+YCJTbmOkLDXHMxV1NFu
	 3qZzLgYZ13QwQ1JPJ967+kH3+xoR8cE79SwhDyu5QpgzPw/SFigBdkfKYBqRFAjpsj3Y2
	 QYw6ce/CpHYE7VRJLq0F9FCGU+QGr4NYdEZOAEx9hDkKqcRaXYjC2S3+Cz9n/HCrQvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TFVWM1nN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A130A606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 00:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A130A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TFVWM1nN
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5133831027so909697266b.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 16:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795653869; cv=none;
        d=google.com; s=arc-20260327;
        b=CxG1oELjBwfig/8b/jwqCnFRm18IAqTUj2z/O6v5ZLboQGo86h4uVN13CNq2q5hL0W
         KT3OqhccVHim9jSdQRkYhGS/NE8JQUe58N3RHQHQEsOlK6ss0vABmTDQIAkObpL1YpSi
         d58WSwygxFOwfQse8Hq/30bxKOO3rqVHpjdhA7RHDi89yUskSTi8DGj9GAhtAHFvNKvi
         smNqE0kcI3CsF6ilThbS4sYuBsGhw5K7CnlmXDaSs8Piml2/IV0EaKS/Bcup9RM4d/6f
         daRXG1LSkDUNYueyRgDjydUuTILW831B9EzqBsHrBXUFazn26LJGwOJ96V8z+1HwQQe6
         214A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
        fh=zg9cThU7jox0FHC8HJq715XpMfIx1iKmQ+XFad4Cpro=;
        b=F48G4/8ev+jggjYYLWFWmQTYRRhnvAVo9WgJxAfE+0OKMWCsMm31wo6pneUZ1iIPUz
         pv42YXfl0t3VguFOKnubbG7wPB84GMmk1liUNokOtkk9ruV4w0k6f08IH+felx18ZK3e
         vGWYEyBpmQgOed14CEiQquv7WgveP8OGgjLti3NnfNXy5/xU4olI1DX6fQptOS+hY+0S
         M0M5toXeK0GFvJIuMmWGYhnX9vQkvAH6CPZJ4iBwlpUJdCUzswZddRk83b4l6OlRQcO0
         FaOx2o04CZe0RzLsSkjRUlDGhzmf8uXfggGvM6U03kdHjoYz7OHoyNoIInbyqPEQubFX
         fWRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795653869; x=1796258669; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
        b=TFVWM1nNu5gApS+aRUNGAO2b47beOviKXKAUtZcibEAeTqBUzqYaxbl/Ez5VQvaHiJ
         TXrTwu8x0jRe4t5Qky6cuxp9+qXTOVpIHPYaRTuFvweUNvzRuyVro3GhlyImE69z5l6h
         8+10BUgXaVnSQdQJL56ogVd0eoghwHYtJzCo3zCbsQwT+vD3SGCXtB3FiXNUreuGXelJ
         f7VR1BO5S+hnTUr9vyAHKXMc2Z8rg1qIpqzDfb7vnBqg8zVirP17bCZUWs0HZkfhTJwL
         aGZZfKvpUl1Z4/v5oLfuk517qMaRDnLShKckyF1bvlHNxOJLhAHLt0pu9I70jGnqlzcF
         ZJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653869; x=1796258669;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
        b=tPDvaclrdy7M/Y3h5n5PbQoZJHMzj4VougMjTWqSpwAWHvGXoxZd9HIfOdHMM5cudy
         dQcrQA+MTPFkkVhzYjA1wfRqwP/btFoNT1QE9rofrDh/WJW//rmX4YJJCMT+5Syx0rE9
         rqrXXUYrPktm72RhTxfWWp61R/ySHtiiiWZfLdygs2Iwdr+RvleS+x5/r8vvtm8u3qA8
         YJxrso3I6Go9fmtyIbkAMUxfCmUspFk2gfRElWo+Ys/AxYwVKBfGen9fmCCJWfXgt0qd
         kN9+cXK19f4B/R2yl001eLIMD5eDB60k/Ka+JYY51gStQx/jjllnCCq6sNoJY9/fumaL
         yvDg==
X-Forwarded-Encrypted: i=1; AL+hErGzdocwQJVU0wYBJL3HAXgVCSIu3TFOy0UtH1zHlkrPPE9COHhPZiyU8hxb146yoHmLE6W3pM0utLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z82Cv/mK4j3bjvwjM4L42CgTlwUm/8WSJ7GCN0C2CdKYNWFAAuZ
	bDoIyug+quJsd09LCiBw9iVQ8nFhb2J2t3ExJwA1u7P3ueosQa52kaPltfRJmkE2N+3QS8CK6sB
	l6/G2QDNiF3jAVYqOdvudPxW0FXVqn8rZB44UeF25
X-Gm-Gg: AZFdTZfNCwMmsEKtQ77nzeSDzRFxsMW0RKUqUbw+wYb4fPxFhe0+PvYpMy8eTakkHIG
	xTBmDNxeDO3QZlM1C9/JG7BQ0WdHpkYiRIq/GLPvymTN4NR+3GcWLIBH4b9Zii5Z2LI6ubYKgim
	0mCxFBmVXGCuPdGSAl76TDNHrfIMZTjQW1S6y+eMWegwvFw48klTWSIYYC61HSw0rgARg5AHHKO
	3kfmAhJiZ63JQ4dbIkVPzZv9hJSXG9LTtvvdlppe3xVAmEEA42dM1WkiilqG/9jyBV8BlineNmP
	dxgMxMLstHGyqZ7m+xZ2GpLK0GtgXFV4eK/gFTSWFyKX+Lddzxsj29TFoqgj8n4Gg8nRTO/koWU
	T15TKKOoIN84QQGY0aohVXZCnntUuP9kITi+wagM10HPgp/haM84AqZi82Sffq1ny61g=
X-Received: by 2002:a17:906:6412:b0:c51:24eb:e5ed with SMTP id
 a640c23a62f3a-c513aabb094mr1147878466b.42.1795653868573; Wed, 25 Nov 2026
 16:44:28 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-13-wusamuel@google.com> <CAEf4Bzb6LQmHHkvB8WBezU6YRtggycRvvA3L03mQHDr3WQM6mA@mail.gmail.com>
In-Reply-To: <CAEf4Bzb6LQmHHkvB8WBezU6YRtggycRvvA3L03mQHDr3WQM6mA@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:44:16 -0800
X-Gm-Features: Aa3M54p3EatRpTsPAm_mcmxJ6hPDpQs1114Xl7F84nCmfTvZhGsQScuZoJFkxmI
Message-ID: <CAG2Kctr+6-EESkYn+Dspg0FxTOMFRoj8269UZaNNDFNf3d+bHw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[...]

> > --- a/include/linux/kallsyms.h
> > +++ b/include/linux/kallsyms.h
> > @@ -24,6 +24,13 @@
> >  struct cred;
> >  struct module;
> >
> > +/* Exact or prefix name query, optionally in one module. */
> > +struct kallsyms_name_query {
> > +       const char *name;
> > +       size_t cmp_len;         /* bytes to compare; includes NUL if exact */
> > +       const char *modname;    /* NULL matches any module */
>
> will "vmlinux" match just vmlinux? or how can one express "I only need
> symbols from vmlinux image" with this?

At the ioctl layer (patch 3/9), passing "vmlinux" in query_module
restricts the search to vmlinux without calling
module_kallsyms_query_name(). I will clarify the comments in both
patches in v4.
