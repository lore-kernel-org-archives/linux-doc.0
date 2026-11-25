Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625140;
	b=4Q4lgN+6sxwSFl/vD+22Vwsz+2prGr+jFK4/VlqISQfQwh91WlRtqpi22kxg295zfyoM
	 jJlUzCOf+qWVy2u6zdLcZpxAe4lLVODFqVTgFl4eLG3Gh5R6sUUyytjxgjaWdUiI8qAzq
	 7P7s6lE2IMdOLxyrcE8x/GS4UYPHCRT0GohdTq+H9uVYm/eV83RJNVafjbV4ooFjOzN9r
	 EKsD1XtpwiMcebmfLIU6hGLzxGzC22lLihHuhFvKKOHJHlVA5UDs9FEc1JE8WfqaSRvLf
	 OavAreRJdPUSV2mgiU03vegqNRJirrQGhH7Q1qKtzfXJKO/8qYCJ+PFdJztLlTGSvuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qzSNzkmnLjAnm2o7UEPNC82u2CvWGqHDymHqRLR8nws=;
	b=lshKRoa9dArZLdNNsCc0KyBLg2VT2YP8Eo9gYgxnrI+GLFH0w/H0M/5365be0225yV12
	 +EL/pdE7ggr9kVkZY1es5IS2djjyK1+pBYhvUufkrAGBDzJqQ2jtZY+cfaW6eaRavB9ok
	 UIh3+JSaFKh3K6c5TxW46QuoX5K6puipVr8wdZvIOyUbyJnsiRPwlomfLv4PANABE9dzD
	 SM2Ay/JS+F145vHS5losBmVB++AEaxB2b8tUzY4bMzB6HHTakuLIzjylo4SB9Ind5VaqP
	 6MFX12EIc37UYvrvK7h7bxliRBNUyJzV397DjcUtOdQRh1bTCLfGArPV02FvCZw5Nyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VeMZMFlK;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D84160A2605
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 16:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D84160A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VeMZMFlK
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so4256078f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 08:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795625138; x=1796229938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzSNzkmnLjAnm2o7UEPNC82u2CvWGqHDymHqRLR8nws=;
        b=VeMZMFlK4XeBzwrDD6z4Doe5ujZ5PmFlBvgdtXgvDNgqyB2+a2sCMN2wk+r327T/uW
         /r2BhYppBsmLCfA6wEf9rqAgdyevRRA01ag2IXLdtngT05rT8V5qUBbFQDnjjQgYE2gf
         VRO105Wv3wS0sYOzpdh62UmMxKFuJZsiAfPK9beaxT/i9ZUHpkfJOUrelw8QBpX9lGS4
         m35Q/nRZpkrOo84dL5yj6BJK1saMLREXy289b+W8lcU1Li54eo2LPH2XZ2BzxTKFv4V2
         TU/7Cyf6kqOyQ8kgJ2U5PgB/NbN2a8Bu0WSQShF93YOhfgaUMd2kQPQDvfuKKEMIIK8r
         gfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625138; x=1796229938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzSNzkmnLjAnm2o7UEPNC82u2CvWGqHDymHqRLR8nws=;
        b=h9Z2xOW2Dtk2MVTr2fRJAcyI8qq6PmVo46IarqDlPObYoNZ98MbGH1o0XIUTGVRtK6
         rUiK3/YxlD0UrXqOow3mGQ7grPZgB4g9Kz24nCR1BkM46dOCVPl+A89RyZewxay/Xm1/
         IdzQpfk2A6p65laMSky5x4ZceqTbDynm1d6D6x5dZfXmXzStW6M38INb8tCfrJgtNM6c
         jc0m6gC8/aWxa55zJJz9JzJlMRtu0SrvwTDdJgQ7owkqGiiT6lC3nIgj6ZgY6SgegqB7
         08X0ghOvv9bH5eYwEAjqwdrOTJIZWY1zyoMBUYScS1PvXpYuNCMcGIUIBrNv/RDff3Va
         Mm1w==
X-Forwarded-Encrypted: i=1; AL+hErGn2JBbiqoEZVVextpyFn3cEAN9e60fCyW10lsGRuq6bmlLBhI2rgCXILQNrxvbvFXZYd7ZcfNCIL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bpx39aI3fgmdTiGafgBPm3EE+HJmxuShUeokEK3E6nRqEqCqA
	NtftSCeHEBiv6nfJ1OuFA2mv3ZWwvZ88symL2m5EWGJAM5ekmnvOzSRh6VwQfjuKDx0=
X-Gm-Gg: AZFdTZdh98VmWJ3dRcs8zEYP51PDzHIbvL2Vn6mMuY+Ari4Cbk8f54nZvtBSzQrStZ5
	XmWbQBSftNhV80qwBJDfvu1MDuS/+LiR7nBjGt9jj9IijXPMSqXdY4nFJXRWasFxiv8wCfXMHI1
	dHRP4mzAsx0a68WbsBCjns2Dx8rx2JyPgxZsZUccJgy/q6A+o1cou3cn7A1Fty122w05YCkuHEH
	vwpQb+szcSjt/w3FA4T1ihwWm/aNnJMjrY6Ceap6M6I4in+enYlIBWR2mz91i8MIGTpNKlFe7q0
	MQTY9MIExzuMWvrkAHPFoz0/+7uTk67+LNoPbdtF6OyN2IUDwcYz7XFX+81WzqZkiHguwaVbiGc
	5l02vooP0ME5h5yB9yCNWID58ze2S5AlgL5/D3LmO4LaSvzUfC+/E2Yy+0K4zjZi2w+36JNMOM0
	942cGaJ18NSADZfzsJssETYjfJpl9WITpe00V6+h2Bh/2CPPhljTzIsj5id+A6qz0YVVhs7awPg
	hsW7b5+r9/aWcFnNEWvnG58pWGy7eQ/UWXseZ934ehCx/xnZFrdtYRSkOzTBt3kiiCvubXG6+Qx
	cYtRjTYLDNdl+T1jb1lvwyxmju/TSEUIs1hSXk5yMgb2vFdGFNj2gg4vcWX500sV0A==
X-Received: by 2002:a05:6000:4617:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-4abb18cbe2cmr35982135f8f.27.1795625138335;
        Wed, 25 Nov 2026 08:45:38 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm34852448f8f.37.2026.11.25.08.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:45:37 -0800 (PST)
Message-ID: <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
Date: Wed, 25 Nov 2026 17:45:36 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 David Laight <david.laight.linux@gmail.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-modules@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-13-wusamuel@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261113221248.3535369-13-wusamuel@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 11:12 PM, Samuel Wu wrote:
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
> [...]
> diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
> index 1ff8ce857d92..72006c9bad42 100644
> --- a/kernel/module/kallsyms.c
> +++ b/kernel/module/kallsyms.c
> @@ -406,6 +406,63 @@ int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
>  	return -ERANGE;
>  }
>  
> +/**
> + * module_kallsyms_find_name - Find a module symbol by name or prefix
> + * @symnum: in: index to start at; out: index of the match. The index
> + *          counts the symbols of the searched modules in list order.
> + * @q: name query; if @q->modname is set, only that module is searched
> + * @value: set to the symbol address
> + * @name: set to the symbol name (KSYM_NAME_LEN bytes)
> + * @module_name: set to the module name (MODULE_NAME_LEN bytes)
> + *
> + * Undefined (SHN_UNDEF) symbols are skipped.
> + *
> + * Return: 0 on a match, or -ENOENT.
> + */
> +int module_kallsyms_find_name(unsigned int *symnum,
> +			      const struct kallsyms_name_query *q,
> +			      unsigned long *value, char *name,
> +			      char *module_name)

Nit: kernel/module/kallsyms.c already contains a zoo of lookup functions
with similar names. Adding module_kallsyms_find_name() adds more to the
confusion, being similar to module_kallsyms_lookup_name() and
find_kallsyms_symbol_value().

I suggest calling it module_kallsyms_query_name() to match the
kallsyms_name_query parameter and to express that this is a structured
query, as opposed to a simple by-name lookup. It might be a good idea to
similarly stick to "query" instead of "find" in kernel/kallsyms.c.

Otherwise, this looks ok to me from the modules perspective. Feel free
to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
