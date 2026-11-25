Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638304;
	b=sK/2qy1x6gWIW6oEKsB/88NZcJiLZzwK6qZi0o6YWrw63Se7WXFr33plNTan0XiTOXN6
	 MU8iHYCCCwH6QGN0kKDnD3jfzLqYRoSd6f+RSpUDaM6zD/RPR/d1rSpn+A7D0xD5bfQ4k
	 Z+j3y2wF+bFtFHN159LolC1rdGvt9ad09M4KrwUfRXShjHYjC9wDGDwKkTD7PES6x3Ntt
	 S2R/46DpX2xRtZkQOVMsLED6YB6iBLdmfCVi+TsbAqLAZ+fwWYNhJrNJgBJX7QOcRPLT4
	 Kf1VS9kXHn7IJu5ziIDN1HCPGSb8vO8VSwLdDQUN7cTBSVnEfU6xP+JNkAuOyiLx80A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
	b=X2kpEocWlP3WV7nxtNYJf4GO4Hw2Ba6RsBYhnHie+XljqpgthoIp7MOrXY8sqRWW3U/G
	 WolCgFQtqrmrTNN2iA5FGlO6Cgyv6baTYDJ+E1fxgfeAQW3y9yt3gmEBsJqp4dqR4H5Rs
	 AnbJB+fJpiQ0iwpqciw9w5wEiZYvIiwaorsDk8DXLehbvz9ybTgMA1yNiBc6gEev/nSor
	 KFmEoBDfTRaDBFQ79CZsPOapamA/6WmKxtaJe/y5YOlbgCbrCEyVyggpAMEOFm11EwE70
	 3JMY2+RT4wBVmXbfNv+TsQpwKa/uZbT43UakfTWXUYog72xDCds3b7+zZAVwBGqVohw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxpVsnDh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF5606A338
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 20:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DBF5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxpVsnDh
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so50493445e9.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 12:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795638303; cv=none;
        d=google.com; s=arc-20260327;
        b=C701N7h6rGiSmzHjCFe6Rck9w+R3hCM4t9revAFYVLnY/ijURFb71kWVcbJLJFKWrU
         slpg2o9w3kOCqGYMo8QKaCFihplfY26r9C/mdBEMAS+yXMoJS34sYFSIQoG0rMuNt17O
         FDvMqNL9a7+Hn1MqZvbr+UMt+5LvW8Hy8nbmx2gK8AZoA0TqMlJN6rNm1IVKoFN3BBdj
         WvjFuOA+b7Sbrilw3ItHuF3QhuzK+Bsoiqy29XbehF+c35m6sRk0RpnL6ybRMGvuTTup
         PH8VLdWA2ajOoQv7HG9/fRT8bYmTlyvPD5hMhrkxdcg6ThhkkVF5WNixHl4tlFII+Tgd
         73PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
        fh=Nhkn2jdGew4cosNz4MCvzQxESFDdCtzcb40qXCo+2Jo=;
        b=JbfgIYwsXnXmMeItqBV2f7pkhfB4BnLHDCXLj4jWtlmy/sJfQnGPqv4Q7g6VVcrKbp
         Ocs7KcRis2XQB8zXsxxdpMVndE3Nm2WK/UDapNO74B4Y1Wta0njvYlZKwY6GpVa+iUv5
         iTHYQ0Qfj3cnfoAUfOt1Lk2FTBXxhyW76ZgvmxSzBtjzmNUOird+jAnsl6uPeIQ2N5dO
         /9Flx9HzEU5aPH7iin5tYho6WAh0jrGNTC+ntSRN0Z6Ca/Ky7ZixQp3hOdhASawjKxRF
         KfLB9WZu/SLc0nSCEG9lhE0IsfxKEvVfmmaksJ3QlpywXDJTnyadO3AE1vzQvvDdYNrs
         /Xpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638303; x=1796243103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
        b=qxpVsnDhKpASGf9nC11h7i3rrzbhgE1Ei3PO9P37aCNXYSI78K7dE3d/HkpdwHszrk
         LY2ewZzhpWyuiXGJ9Y/kVXRgwoqcZjc+AjjGTm6sKWOe26uegothRZycWdOMEmeKaehQ
         rcee0VmCBD9LHFqBMRGKRgu5+yxn/QVPc8+S1f0ZhA8k/QuPVe7lO4kH9kZ7PLYaSPsZ
         UOhEiycW2Hi29WbdqTe9JB7fMqfgVwt5DLrziudwFU1jlESg26yCSYwEh1zt9b/mn3Al
         7ZA2LJwSY/mdKqaAvIEdHaHjwDhtcY5fLQiXuVbUxvNBi+V1wIvq+poIXwdOZVw4io/Q
         3/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638303; x=1796243103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
        b=WI9XxC8j6VF9febG8pN7q1zQ616A9HfpbK+6egZ/YIHDlkkfCvYFziSg4EXCCVTnNg
         dsvAXs3Vcv06NZngd4cttgTltsG1iEk+h9+nz74HcAguH5NISSLgmW8HbMvi3jmAK5N1
         z8El0odmVxQkcVLGdewhy/+M3ZSf4V2AgTXT+vXQTx3dKsHJcmPm20gdl8M6qpUIP7KS
         V898XHEm135IBH5riBpjE8e6jlwlKYwFDt4OuadFIR4sS5gqiZugbaaLtIUYjh3MyO76
         b008hVJc0Qosd68Mwew5CaQ69WZx3R9LWGJZ4nUdQ+mODN/S/XPUq6BTxlLo8s79BjM0
         7OZQ==
X-Forwarded-Encrypted: i=1; AL+hErF9arChbyrGHUc4GjBndA1v9wGN+gucl/Zcw0kA4uv9kdSZpckmuzqxEv1rAGUVNT048ldCgttpepc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iZ204HVYB8IS4lnk0uLyvUOZ8aij80+kAfXb9phtOp/UXyhSn
	fZhAHD05VS+65h9MZPsJ2WvncBGRdvyrBzujPCnfjajEfCvTWzy/nqA2JHK5y+W4pAfob0jBShH
	yyAxuysCr1Yk46sZZTd0QtB2Rs6oGDQw=
X-Gm-Gg: AZFdTZfqEr/evfWLa7oL3ScwODaG/2PSxaY8LSIbagAq2S4M9YxgOtDuhlKV1FPFwCS
	UFDvTfpXcsOreolgR8PKokknebniIX9akQd7FLBaQU6Gcl2snUrbRUNOc2oRZxttirnFjSluSxr
	J16aNptFetykL+KHsld+ykBEO/WjSgqYzrxO+3YQO9zeHBqICUL4XCvRRhXFkzc7EB3NwH1ihBC
	UzL2xBewb76YyEnBs1n7Upk4vEwzzGGIeLDhHHXEUeU7y5VVcbWnFfBoazdz+9JF24IY5YJH7f5
	Lp4I4Q63zghyf1SnXk4zTXwUdfbhxSmmYxrH1nI5ZCN4WMKR94UnCllzFDp+8kBQ0atIWP1uKUz
	+OPlPDCJLqgKhdkZ2+kkLGFJgz36TR8XlGSt8xtcai/bGtwqqT1KLki/4zSq9BkY6HsAGVECl6C
	cMzLdVjU+40MRT4Wx5pw==
X-Received: by 2002:a05:600c:4ec9:b0:4bb:6a5a:782d with SMTP id
 5b1f17b1804b1-4bb88925fcdmr394635895e9.17.1795638302754; Wed, 25 Nov 2026
 12:25:02 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261113221248.3535369-13-wusamuel@google.com>
In-Reply-To: <20261113221248.3535369-13-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 25 Nov 2026 12:24:51 -0800
X-Gm-Features: Aa3M54paGFwRi6x8xvkBaed95VaPlmoDIEKWnad49yMfBgn6GjtOde1UijdiQkw
Message-ID: <CAEf4Bzb6LQmHHkvB8WBezU6YRtggycRvvA3L03mQHDr3WQM6mA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Samuel Wu <wusamuel@google.com>
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
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> KALLSYMS_QUERY_BY_NAME, added later in this series, needs to find a
> symbol name or prefix across module symbols in one pass.
> module_get_kallsym() walks the module list from the head and runs an
> export bsearch() for every symbol index.
>
> Add module_kallsyms_find_name(), and put the shared query struct in
> linux/kallsyms.h, so we have a more efficient linear walk.
>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  include/linux/kallsyms.h |  7 +++++
>  include/linux/module.h   | 13 +++++++++
>  kernel/module/kallsyms.c | 57 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+)
>
> diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
> index d5dd54c53ace..d31f2f436159 100644
> --- a/include/linux/kallsyms.h
> +++ b/include/linux/kallsyms.h
> @@ -24,6 +24,13 @@
>  struct cred;
>  struct module;
>
> +/* Exact or prefix name query, optionally in one module. */
> +struct kallsyms_name_query {
> +       const char *name;
> +       size_t cmp_len;         /* bytes to compare; includes NUL if exac=
t */
> +       const char *modname;    /* NULL matches any module */

will "vmlinux" match just vmlinux? or how can one express "I only need
symbols from vmlinux image" with this?

> +};
> +
>  static inline int is_kernel_text(unsigned long addr)
>  {
>         if (__is_kernel_text(addr))

[...]
