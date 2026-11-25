Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641932;
	b=us0QGLaoc87EUK3oo8QMNEhJ64ztYWPeeaiVwe1e1NyiWJ9uYoDk8gYcJpl0X5IeuFXJ
	 tzEEiE6EjG7q1jrc26XeYJhZ6o9TqDPO3lbgs3u1dZx1GgLCyu6G7ObpARMQSseLMhd10
	 vfp6T4TB2ydZqU2kRQJEvTIm7sOnDIlJqLt5YVjmP2ImkblUzry/gKXxuNvTla4HpvsRM
	 PRvFU+VT7sE+9M0GSfhxOgGbSuRnTW5bZvpLmapCqgkK5qV+CQkNIEcmjEGPzBTwEJBs2
	 l2g3CCD7C2uG0wrwDkuyJSO4SchfIZRjdZIeNq3PlpMLulkV0dewoymI/I5bVkaYQgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=24/tAy177JKP0owGUloJsJ9O1cxGKyGsp+3cRmkz8Hw=;
	b=ltGE4eR/cSVbBNpc6WNYpfpcO4ca3EZdVVl0qZ38hJL9mIIf2ua8XIVTXwmA0GsJVs/R
	 1nB1qHkNhoZ9/4+IYkHxgE6AGIpWF2icDi6KyYdlrSxGJo1pa4jT3y1RXwbsFdzbxCeea
	 jWEptX0l6X/iADrDXztQYejSJs2hWsBNg4CB9jHqlz5lXPv4PorAWteQq555qX+eiH5NL
	 lFlYDArMPoZDvXdMMrehB3pmTJl/9qtatiLInW24djENuq22LQ+HqDm8/mlrOdvmEa9U2
	 HMlC/oGShR9Q9WQNRuLKSJdYQrFr0ozwW1yyem2OOCuVB5nhGHUYxT9AQeeGa6Yl8oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RI0PEVo8;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18B0606A32D
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 21:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18B0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RI0PEVo8
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so10452985e9.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 13:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795641930; x=1796246730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=24/tAy177JKP0owGUloJsJ9O1cxGKyGsp+3cRmkz8Hw=;
        b=RI0PEVo8e/bM5LpLPZ+ED0hsyThViRRY4VFXcvOC3yq8ssab9D3GWTn/NExxaMUXZ/
         SCEfAUzxIznLHW4X8Ux3FmsnGjVl8+Tu2I50vFro4UF290hC+aOGoCx3seQbB/Kkai92
         i2zbpMXrHM1e+hdoZw3s9g8KJwVNLFn1XzFiXMwhZLLCZapmock/E0+9J3LFHctwNKM2
         1wJUObs/t1OyGzg2ZnBNFqAphLTJMLH8yCwqrFBvoaxKN25zrCKYmaShH0vjh09I3jpG
         Uz4nqzrg6/yfBT6SdKciD9tyk2az1dmjbdzWK08Rn0x/RK7kdBz6as33XNA2CJWx8x3B
         BHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641930; x=1796246730;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24/tAy177JKP0owGUloJsJ9O1cxGKyGsp+3cRmkz8Hw=;
        b=bYWrFk/18cmBf6YWIPbsrQqNiMpQZPMeTsopgdn69pt+YVbmWTIM8dg9OJw9jjzhD2
         9fSBRJHY6hywjYHlKkjcTzwqGmxlq4hz/y5qwflZTy7qSdDCOHn76g8H2IGq4+iX8xpe
         Y48W7JDngZJlbXBQDOyI3bmlkDPRjk1wQa7i+ER81Hh9zKYNeuOI/NhgbLFF3AToahgz
         tmKZabf40ijZX7xgr6VDOaF8pXArSQvMPnDJv1vaigARMuqbXpWalYhk+0s0UH/zIdSc
         nRCbv2Qco6EFB5d8xLStpxmYbxBzxgy34+ODlDPABdW+HVBtGxjY8wJCk0Q5hk2b/qyI
         XTrg==
X-Forwarded-Encrypted: i=1; AL+hErFmjGYGfkeZX/JGJYyfFM1g/bRUFBf/yb3wYZo+oToyHsqWd+U5WaE3vlVKwcfN667WlTQgruXjX38=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dnSjSrI8BpU9iVHqYbnaqrkd9JAEVvCuPTcmKZTfeIdBt/kdp
	w/VmrCLMc1JRUzuebYB+UxCEBqkdifI7uOh9bwSdkP1D9dqtvBS949G3
X-Gm-Gg: AZFdTZdOHyfQ+souQ6RJP7iL0+GCtxBjD50KNNDhNQ5kYqTm2KyVCCL8C5xEhAgPBYo
	oM5o4p5K9LTqxjXMuyPZCHb8VrwBPbDqGG22yxAdoKg3QZB6EDG2p1I8mqWAS3AFDTi8qVjED8W
	a6PWf7UKvGRXFg1tbm4EkQy7dtJ/5LgR4OzUNkpVw5DDFEVRCNdfh1Hbo1glHtWtNKjQ3DLezp3
	2MoO9usAWwaL1gHENNvxooAKvr0uGEGNvivEmC4HDhFeFcA9TYLI+HssPEvTRp5L8R3tZbdIihm
	tBtX9MfLGnAV4qRk/tGqUpQM7gzIM1DueHwUYao5jn0mC1kUzB/uUlgpNkXdptIe/dc6FYF+wlw
	7QAq6mKB7PQojdgsBFD305BUjQSnaqnew2R3QksdgUUA3yD4Qg3bQJYB7lG4U0E9xviSzsSgd9D
	vvoZNZAffapuYGB8P1Kqeh6h3cA31WholKTWn0SyXnTO/8+YVzbnQIcGyZOSLiqpkIx9OuKbd4w
	WUDXkPckYr96p4uqmS9sPRuHrT/vuTp8I/eCj5PuSaY58aNDcs292YiI5uwQKfW+rlQjbj9qHp4
	PzKX6EiUlljB5ur1aEiXOkM+rtdOqJpWZaQfBOQx3OprDHMPw57yac3qLWbJzLqtdg==
X-Received: by 2002:a05:600c:4584:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb88819bcdmr380720815e9.31.1795641929874;
        Wed, 25 Nov 2026 13:25:29 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm615777065e9.14.2026.11.25.13.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:25:29 -0800 (PST)
Date: Wed, 25 Nov 2026 21:25:28 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Samuel Wu <wusamuel@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin
 <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song
 Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
Message-ID: <20261125212528.239ab6bf@pumpkin>
In-Reply-To: <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
References: <20261113221248.3535369-11-wusamuel@google.com>
	<20261113221248.3535369-13-wusamuel@google.com>
	<0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Nov 2026 17:45:36 +0100
Petr Pavlu <petr.pavlu@suse.com> wrote:

> On 11/13/26 11:12 PM, Samuel Wu wrote:
> > KALLSYMS_QUERY_BY_NAME, added later in this series, needs to find a
> > symbol name or prefix across module symbols in one pass.
> > module_get_kallsym() walks the module list from the head and runs an
> > export bsearch() for every symbol index.
> > 
> > Add module_kallsyms_find_name(), and put the shared query struct in
> > linux/kallsyms.h, so we have a more efficient linear walk.
> > 
> > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > ---
> > [...]
> > diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
> > index 1ff8ce857d92..72006c9bad42 100644
> > --- a/kernel/module/kallsyms.c
> > +++ b/kernel/module/kallsyms.c
> > @@ -406,6 +406,63 @@ int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
> >  	return -ERANGE;
> >  }
> >  
> > +/**
> > + * module_kallsyms_find_name - Find a module symbol by name or prefix
> > + * @symnum: in: index to start at; out: index of the match. The index
> > + *          counts the symbols of the searched modules in list order.
> > + * @q: name query; if @q->modname is set, only that module is searched
> > + * @value: set to the symbol address
> > + * @name: set to the symbol name (KSYM_NAME_LEN bytes)
> > + * @module_name: set to the module name (MODULE_NAME_LEN bytes)
> > + *
> > + * Undefined (SHN_UNDEF) symbols are skipped.
> > + *
> > + * Return: 0 on a match, or -ENOENT.
> > + */
> > +int module_kallsyms_find_name(unsigned int *symnum,
> > +			      const struct kallsyms_name_query *q,
> > +			      unsigned long *value, char *name,
> > +			      char *module_name)  
> 
> Nit: kernel/module/kallsyms.c already contains a zoo of lookup functions
> with similar names. Adding module_kallsyms_find_name() adds more to the
> confusion, being similar to module_kallsyms_lookup_name() and
> find_kallsyms_symbol_value().

I've thought of splitting the file in two.
Separating the core symbol table functions from the /proc/kallsyms code.
Might help here as well.
The cut goes just above the extra structure the /proc code uses.
Three functions have to be made non-static, none are that internal.

David

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

