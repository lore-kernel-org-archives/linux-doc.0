Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653751;
	b=S+Mb4CpxPg454sB2T90DcYjVmFDKXeOBjiGs6SwcJjv4LrGWKd2rrhoebo5+ZWoyh6Wd
	 3+zKZGBgOQJ/kxXUAdr8JAcl1JFjn+hObrzz6BGPHi2puysjIWg9yznqPyyxZBlE3Cmu+
	 jVDiJYt2zSjF88Kcr7ejUzs2YpMJe547g5wwKddx2HJ1En3Zmk+83MimIeNmbTdfRelkh
	 K3uuJW3kLTvxiUzH8J6dSh+75xsxYF8tjkP9GzQeKnl1HniTm8BnJJ9scSTrMupmVpZNy
	 ZERVNKFYZcqJN0v6LKucKsDkJDnUhzBYQ+Xgu8HlMnXEPXVCI+2qDb5n7Fi1Nj1Jisw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
	b=IYPHj75859RD7NLUaRV9Tk8+uoQApij2rsZheVZ4n6bT/yriqDU4hRLGLteL2Lalaqeg
	 bnRYzORMtZxj/yj8/sHr3bg/RsTIwjwAcYo1PBNxLzxSL4TZSil6JoIILgoq3WGva4vdC
	 9ed06U5RTPBDKTkg5x/D5gDrqejVodponj/qQ8rKoZx6DzMWIazn2LVqNwdyOp61WyVj7
	 P7N24EwE4lbXzcSdNmQ3dV+tIE2rHTTBxz3KV8EHBzKFyXKZFwhlZZmInEBJdq7Pv/AbS
	 fEDCNUcIX8ylUA81H2n67ayDnzvlFH3WRPw8aDf2P654tEIPPAVlF89+kGXh6+elIAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpN49+az;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB1C606A32C
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 00:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB1C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpN49+az
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5188e17487so104398766b.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 16:42:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795653749; cv=none;
        d=google.com; s=arc-20260327;
        b=etB9Z14fkZtSP6CJdiWpULZMFYdVjKGwdMl4qlNo3+2f2QP2rPb2JiujUkcS8lspwj
         aXtSeQKhu4GmQ9SuLesS85v0ZabT8lwFFP7jb/SPWc/t+cy9kJnxzJzr6V6tSRfCLp+Y
         MIg9xbn3ensMgcIiIoDGX7r4tSz2UhsoDrjniqNWnSY2HtYTirwy4gqQ8AQG6QB+vQwc
         LUk5D3Sn019SfmhgkEp9RBmrrWD0x4m/oVAtsODAkHKdFXMvd3PH6oy+xz8kOuJ0J0jw
         ocjFkibQFYJMLhuv3MSbdGqv+C4LptfUkfJFzZQ6q9OnnAvzmAX2n2djJ9hj0piVFJx1
         79jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
        fh=/ldRkovH8mu4kZC4BxnLmReIdtRLxfNHU/vuIRnx/BI=;
        b=qfmUAEVGmY+7QNPj8sHBp3cYI10WPJFqVXcoBYp+S1x2DoRTzyKxfXJluVgyuCD6xQ
         L4uy3DI4dxStcpOqrUCKtwMCs9oZci6SUTYdpnLIYsbWoG2Riy2cXMNj1cVOfMlin0pV
         GYQ49MbaHG72C3DqM0jUgfR0YD1kqr8Wu6tA6PLLqvmIr3TFBfxfD3lbEWanHiOeV9z7
         Ix4dHBaMyG/IAykVYdTKiYPJsAa5H9BmeCsR9XpqD1MKxn5x/VwBH1/vrdBYkGnsRXkk
         9KEV+B13P6dU5xr5vfWKf4fvRWOttyOFcrUItQPI5sR659VSPEFWpXTCNLbNL0o0YYi3
         PrWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795653749; x=1796258549; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
        b=LpN49+azCIrNLot1wWdZkbi4Wt9+5r7MX19ZP740YGH95NjHPkEZ3J8iTn5nZs2aU0
         YtfDizzXcozDLpMOLK52IGL19BDPPkZBwwaARaxU027w//2VU6VirePpo9PC6B6/Gvyf
         w2GVoXFxRvXbXsOKb1KJ+C3LWAAUbXNTn5yq/DRtNMB33KVLBN+E7CMg2n3o0WEACasU
         2Rm6jn9HoFPOXbo7vWifWbukhD/T5j5US9xUFhxajKYt4rvNrF1rO1KNwomR3ZLuXZ6w
         QUOmuxgTXoYSvlHBVpUm9Y0LfNn1TpJbekKTAn/WwvKBAhjn4jwfG9HFJEBd61cyDiFr
         AG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653749; x=1796258549;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
        b=Lm/36/mNGVHjhhmDldxh9V85Gtghm8FrBp+i8BFyM3xYayvzsMkpw2S2g+84DFirZA
         imYXgAVDtVfCo2xAXF7JF+E9eTI5oj+R6BcLqKO+tY5gMqFCdCNEfoue7uPxFvsLeswy
         KCt2BxVoMa+4Mcin2E0aBzl9KOFCxPmwH4VOWmeUKITJYoXxe6yF3x7hIs2ytmwxuiRy
         yQLMii6h8MVxK5p+iF7oCVeFFXuz/UBkQjbKUOsV9RID5P89LcSBis/JjDza4yJpEE6f
         soV62B+vqP2NJMOi3cVSUL5U4sQe85mha8rHnralvppx4iLijeE+UCMSrfteV/MbTcRy
         qEfw==
X-Forwarded-Encrypted: i=1; AL+hErHIqxpZ8CN0lPczXRaUt9TTgygvg4q++BTaY7v28yLyiT44lGSWifngoOoF8GqjapHDqKVJEdCcJqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z97+Of9/2fAl2rXJHMopx8XlS7A198dVySrOtfx6U4IwqMNMzfn
	1jpIHTdn9twli4EeR4wR4+KgKYj0Iz5qc5/oGBh41g0OlIAg6fpDH/DV3h8Jy53EmUUEgbUyf84
	BmhjG6NJHfd/p8KkTqFB5/f20si3NgVGDeGqy0Jfj
X-Gm-Gg: AZFdTZfUelZlQM0rwgTG1/P4gNQjxnmiEmDV920Lc9Ckacgi9+PEBTlDXpIcRc5VsZi
	R2e+bWRLnFIOUfH6+FIt+Vn5A1so+lby1yLg5hs+JKDxIOTxpILoMUf236580K3UL/fCLl6+MqF
	dPY/Y2NBR3/P6HRapWjq4TgL3+4wppAIu56LJ4N8qRt2cyd+RjPtG1drZabp9pjHhEbtpHJ8N2Y
	g3T/AG5AaQsiQavyv7QGRoceXQg937+Uc/HtwzaqkpWdeiZ+g9+8QPrzY2Jgb/YoheukCqn2LK3
	TBLM9r6BeKtMo8tgqadGTrXYmJW0k9NhYnhdO9l2ripKPCCqHxAZ57cJTHGj9wejyn4V614pkI3
	+ZvCp182jX5fVVa7D1Covpq6JqWfJ6Z9e/a3umrWeX9MoR6XBamRf7cLmgDpZTBF5/CsT3iQKBb
	sfLgCzyDWfsEgk
X-Received: by 2002:a17:907:da1:b0:c50:5275:fb97 with SMTP id
 a640c23a62f3a-c513acb5e2emr1626085466b.47.1795653748662; Wed, 25 Nov 2026
 16:42:28 -0800 (PST)
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
 <20261113221248.3535369-13-wusamuel@google.com> <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
In-Reply-To: <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:42:17 -0800
X-Gm-Features: Aa3M54rYVczs2SqMo55_UQYl-QiaJqAFTx0CS_STMdfssfUbqw_TSopd5IfB7RE
Message-ID: <CAG2KctrMMo0j9Mnbg8fdNsSc-eQaaaW51dO4mqwVNn3hfSdx_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
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
> > + */
> > +int module_kallsyms_find_name(unsigned int *symnum,
> > +                           const struct kallsyms_name_query *q,
> > +                           unsigned long *value, char *name,
> > +                           char *module_name)
>
> Nit: kernel/module/kallsyms.c already contains a zoo of lookup functions
> with similar names. Adding module_kallsyms_find_name() adds more to the
> confusion, being similar to module_kallsyms_lookup_name() and
> find_kallsyms_symbol_value().
>
> I suggest calling it module_kallsyms_query_name() to match the
> kallsyms_name_query parameter and to express that this is a structured
> query, as opposed to a simple by-name lookup. It might be a good idea to
> similarly stick to "query" instead of "find" in kernel/kallsyms.c.
>
> Otherwise, this looks ok to me from the modules perspective. Feel free
> to add:
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
>
> --
> Thanks,
> Petr

Sounds good, will apply s/find/query/ in v4. Thanks for the review Petr!
