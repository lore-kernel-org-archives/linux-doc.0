Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006905;
	b=YEPMGiCx0lj71ngF9reO/0SYp2GucFthb0Fpe1IGtTD7wvkdtVB9FRR4mZ+uXFxwe8lt
	 uaBemx32qz9M0ACRFldaXxWugmDha0TgfKb9IJUonBSpc2F4cpNjvfTuf8kVRN3Rip7Iy
	 AhWSOhaFDfPIX66THhSC20POpd1euwgEdn2wzSvIrGxwS9WXJlnWEh6Uw2QaBYGuv2WGk
	 nVO65hyYWLlzXls1xkB6bb95UGUB0mGnu/wb2TSa+hI6XyAew9JaymGcIS9yKDYjANNNt
	 o0+Gg6g+5bdSWu8FzMc1JpnJE1+TFEkV6wRXdjsveU3PCndTUGJTL4Ly4hfH1Cr9GdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6Q5jKmXgzoo+WiVGo4LfNDJTiePFUGEuuUfFv2a/kxQ=;
	b=KX+q4Z3KyM4GRIE/vrfBgfsmAUUr7BRJjpg6g/te86DjGNErbK5MYgaEQkEkGLRogp2o
	 vJooypRrBTgaqud+DM8B7WPj+lBChF3G8pGFi4B8aGN4PEhivtPB1LffGp/JhbV1KYd6v
	 i0EMNC4tbLCTumUehPWqLpu6fMp9sEr6Wv8dZ9/nP4YdEaaZu/8qzTPZavLpF2pU7FKCO
	 kqiCJv5QrSCVDYdGQdwa703TXZCxAvjl3dNLjGnRX3+4EX9f2xe0AkU8px0yUpaj2hnth
	 YyBwwF/YL9+NBL4PNXHkFfclLjdeQL93FhT4E4pirCmvumXXEx4517XTbpQ29bEaBBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CZ4B9P7w;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2050A60A2628
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 09:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2050A60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CZ4B9P7w
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so8449435e9.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 02:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006903; x=1793611703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Q5jKmXgzoo+WiVGo4LfNDJTiePFUGEuuUfFv2a/kxQ=;
        b=CZ4B9P7wQDiCoHwSght5HMF1Reu0ZpEa5W9PxymJM4iRKAeArJA9+p8mAQXrRP0Y5A
         533t1AnsPiaCD41CbQs4XdyVl85RGWOO2pjj95r+rqneOJOXEwburRPd+pn4RRpCkkjO
         9BynAhJWvsvPV8cU6J/Kj7PEUdurJMpgy/N0wkHcDKZPOtPNtlEZVJBt6agC7TcorWLo
         ZcoVuCinwHjIjKyFJwHBsfK3FTyHH8JKDImrVugE1Q0JThuEUCMT7WXn+R+Fgm8Zv8Vz
         F2ab9z3r5ovxvhgO8V5SRxUTac/RZ8vyZAKQD9TaKGf3RXpiJdWrhWVCK1SInHdQ/Qyx
         98JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006903; x=1793611703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Q5jKmXgzoo+WiVGo4LfNDJTiePFUGEuuUfFv2a/kxQ=;
        b=f2GiijB5MkQ1ic1ZQ1y2z5T7YLnzVqwg3YL9yBjMptZlh4GjR9Nt+A/+OlIcOuKGTo
         k+R8rLA9OarmhksRV3OJhMMWZZ+hukf17TFwLn5nAWxrvUhvUcVHc51HAKqkrfHKM6Qu
         yMXvEEsVG8pZAI0F3ckzctY7b/1ajgDbA1vDJpFinmEUknu8TIrZxX3wcR7dqy/El7hm
         +4QhemLWLGASwcFZ+qHWx4yMWL4bqOUqPgUgEfRt8rIJuBS00/C+Ps/6FoDLzNK2HB6q
         XF7eFlpZ7yG+ggd8kLQrPCLexLm9a12Q8xThfClzfjawO8Q6s9g0ghPEGMJHnIVNff1i
         uehQ==
X-Forwarded-Encrypted: i=1; AKwUvBywNcYSVVAJkhXASr8nQWkkRQ16dbcRLB5Wq6Yo/rLI/abDyK2+HIPqEBbt1z3zDiV+EmQgeJkujow=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO1xmAfXLGL/msVfYgdzj/AEalwYr896rrG4WOAAglRFFNPS/O
	EL/5se3UivW77qXXAkgf89Uwx7VI619B10cwCPvofGpJrXn/ypEGY2gf
X-Gm-Gg: AYBFou2nirhkFVJcH2I4NnqyNjHM1Ed2ui7GPQPjF65p+amLapdN+dbqapaTigjT2ZM
	cGMStpCIHnUAqtS+ZSD+dYvjfZ9t4pv72CMPL+4a+DjnfYHAwQbb6K7EZmI7ek97JtzO800RmTI
	v3uxfTdkYPYpomkL9G5iZAab+iqKfWuk0NddUn/3IqutEDIjo9b5kB9d+N2z2YvGQrvllWVw4QV
	smTLbYHoVQ58FYQIb9qGVlEzSPQ7/g/DMqaLhQM5SyJ2ekvIHESwuIRj7jpzazSQ2+/twJurO9g
	eX1JMtdhEhYn5bGRXKh3CaeXkIlATswwnA11ueaQXfYLDS21ran3s95NOo57HyydiPhiYQtz1GA
	yqKiuzP4iaisQKH/56co/X89Hm7M8S3jSOjiHtVDUSMeN/c+rars01V4uY7nhr7WhTwyNWQqmKy
	6nIbaJy/ww6uFsWY9gqbBKONyZw4Rs0UmRfjP3taLtitEph4azFnkFg0OoqTryzdQHca6srPypG
	ndMl4W5S8n7HNgJu20vZZMxzX94
X-Received: by 2002:a05:600c:3553:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a35aead203mr116295105e9.16.1793006903112;
        Mon, 26 Oct 2026 02:28:23 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::25dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm215058535e9.1.2026.10.26.02.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:28:22 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 26 Oct 2026 10:28:20 +0100
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
Message-ID: <at8dNNb4vwovNZcZ@krava>
References: <20261023001603.560210-8-wusamuel@google.com>
 <20261023001603.560210-12-wusamuel@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023001603.560210-12-wusamuel@google.com>

On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:

SNIP

> +static int bpf_object__query_ksyms(struct bpf_object *obj)
> +{
> +	struct kallsyms_query q;
> +	struct extern_desc *ext;
> +	int err = 0;
> +	int fd;
> +	int i;
> +
> +	fd = open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		return -errno;
> +
> +	for (i = 0; i < obj->nr_extern; i++) {
> +		ext = &obj->externs[i];
> +		if (ext->type != EXT_KSYM || ext->ksym.type_id)
> +			continue;
> +
> +		q = (struct kallsyms_query){
> +			.size = sizeof(q),
> +			.query_flags = KALLSYMS_QUERY_BY_SYMBOL,
> +			.sym_name_addr = ptr_to_u64(ext->name),
> +		};
> +
> +			err = -errno;
> +			if (err == -ENOENT) {
> +				err = 0;
> +				continue;
> +			}
> +			if (err == -EADDRNOTAVAIL)
> +				pr_warn("extern (ksym) '%s': resolution is ambiguous\n",
> +					ext->name);
> +			break;
> +		}
> +		ext->is_set = true;
> +		ext->ksym.addr = q.sym_addr;
> +		pr_debug("extern (ksym) '%s': resolved in kernel to 0x%llx\n",
> +			 ext->name, ext->ksym.addr);
> +	}
> +	close(fd);
> +	return err;
> +}
> +
> +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
>  {
> +	int err;
> +
> +	err = bpf_object__query_ksyms(obj);

hi,
we could also add similar support for libbpf_available_kallsyms_parse and
probably in some other places like bpf_get_ksyms.. which makes me think it
could be useful to have KALLSYMS_QUERY support for multiple symbols

thanks,
jirka


> +	/*
> +	 * Fall back to parsing /proc/kallsyms only if the ioctl is not
> +	 * accessible: not present (-ENOTTY on older kernels) or kallsyms
> +	 * addresses hidden from this opener (-EPERM, e.g. kptr_restrict).
> +	 */
> +	if (err != -ENOTTY && err != -EPERM)
> +		return err;
> +
> +	pr_debug("KALLSYMS_QUERY unavailable (%s), falling back to /proc/kallsyms\n",
> +		 errstr(err));
>  	return libbpf_kallsyms_parse(kallsyms_cb, obj);
>  }
>  
> @@ -9922,7 +9996,7 @@ static int bpf_object__resolve_externs(struct bpf_object *obj,
>  			return -EINVAL;
>  	}
>  	if (need_kallsyms) {
> -		err = bpf_object__read_kallsyms_file(obj);
> +		err = bpf_object__resolve_typeless_ksyms(obj);
>  		if (err)
>  			return -EINVAL;
>  	}
> -- 
> 2.56.0.257.gf7497c7d27-goog
> 
