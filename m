Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F6730DEBC
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757499015; cv=none; b=pCb/G4EeJ46VfQcCD1LjmepBfmhO9k9eS7BuwoTGNw7PDHe0gpjByTWoQrz2ttFTlhkt63mCKBTKcSXUKT8VLGdDyRfASoOCA7gaD7cZNhDkQxMBoZofz//jHAFtWJD23frhPdZ+XIDlSoYw6u7ZzpvIVSDrd+w3wtjR2Wh05MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757499015; c=relaxed/simple;
	bh=0wzAX6XLcPfWv4S7WjABIA+S/nn9xC+k9TcmNTAl62g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsUF84iTuTFuiCt649P+6OQ+0SjI9HsV7Nc6PXjHyAqZquEbKFM754z/bPXYCgKjZD15mPA3FhGr+Z1RJGBbPbE+oUOMN+BWFI/imK+x2vxYBRbZtK0USmXZo2IFsdZhOFDERdccp0mypW4iXSrLQIr2JoY5/r3TacIsrGEEUmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9ZPgArC; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9ZPgArC"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77251d7cca6so5597559b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 03:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757499013; x=1758103813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YZxYlfJSrjlXVbtmua7/1wg5EWnu3hRQY8kU5+OMn1k=;
        b=Y9ZPgArCwSzZtAhXNdVTJOKSEVHO/ovDyagUVdxFQ9qJKLIIpgZF6OCWq/mzEb3CAe
         Scvac0busq3jVnt7tTK48Nexx58A4qGYTWjFULbE42e+w6zzLhlq8Zin8vqgq8BWmNg3
         Ag9vn+5/+6+nJvF1qGx91Vv2pT3rA1B4XT5v0V7kf2bx39vN/bDZvrEHTGM7DgzuBekA
         etqIFyZE6V/HHRCGXpaIygEPqvJv9Gy0SI7rb+LVCPEzjhiR/HwZsA6yfyEK7egFTZCr
         8oi0Mn7ey7kdAeiS5xu8efNPrQ15raqefjQp6++WBUGjlJFnZ8q5rCeXqAhKsOUnp/DK
         m+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757499013; x=1758103813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YZxYlfJSrjlXVbtmua7/1wg5EWnu3hRQY8kU5+OMn1k=;
        b=G4Nw3nWBGQeLp2jjl0CeMNZinDKOIItAp1aEpk0SD7juq3RpgxwsqA7nK4gAAy8BC/
         58yiooKclt9fIg8nkQxYBZ3DFyG5sPXTsWKzVwUHV3LGPdoCS1zfu31kBb69UK7cFNwT
         axxPXgTXAP36k6NToT0PFlBy7UAVAux+zV3lhR2PjsKlHTeaSaO25n7rpArqFmGbZAja
         gh8MhP8Y0ypHc/ZZvEVsgf4WRw+DjmzOK5PXcgXBIEIwvz2mQ4Ifff08xBxJdUV1YOkT
         xHeJmyFLh3LCmZaT4MOJLXTYffdQklJPDvWSxELEbC/ZHX00I3xfkL+gMzeok3gxMV0N
         zetw==
X-Forwarded-Encrypted: i=1; AJvYcCVkkY/UYzp4HVZp3tTAEDWmm7fJ/H9ClHaEocmWygQWUd2Q4QGL1uCO8x32G4IW7nONMW0FsPrQlLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhmhycVLjJuf0UMyc2RMdM/5pxag7WAZydyTv1nvlrqKpZyAAG
	YzVl3VrEyhsKJEwbjdnI1qkgtT/1k94glm0uLDm7gaAb0BNQgMj3Ldu9
X-Gm-Gg: ASbGncspL2O5XNC84i5iYnPC6OKVBHbNKqk19Rgs/fLCCoSbfmpnX3tsRlqZ6S5FkXa
	Z1nj6grewziCc733ZNIICdshGVXghheZJBnM98Tt7nWNCdfWLKxKivuURqc+tyojj2hQnB9NBfz
	VLtd/CdKOBJSMmqAwygfF/mm1XyXWwQof57O/VQViOQXpRO29GMOygVqAvw5+iRqSjgfytZx6FA
	XKuKxy7Lf4k9qSPYVIu/4wN8lT3woV7FB66VUQR1Uy+WesIgd7rsdbbnwIQEvDt5HTIyNK2D6Jy
	KjHrcCAN7e8sU8aaZaocYLz8JD8Q84zFpJKokWiAu+O6WqP8C5GWHpZuOLRVNDtsA3ueLCzjWnV
	pfcWclplzgCTx/H1XeBBmNzWldTq/9Cb2R1DQODYKjOdOQ3UX2djbQ84imNm9wutYajWZ/efRWQ
	ofW98=
X-Google-Smtp-Source: AGHT+IEiqPtvulEqXvlbxC9thsrV5txImnHY1UJ/R4NtYAywySUcO/eKgpetuP6Dde4Uo58Yi3WsHA==
X-Received: by 2002:a05:6a20:9186:b0:249:824c:c61d with SMTP id adf61e73a8af0-2533e853406mr20841414637.17.1757499012955;
        Wed, 10 Sep 2025 03:10:12 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b548a3f28b4sm2148203a12.6.2025.09.10.03.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 03:10:12 -0700 (PDT)
Message-ID: <8ff91be7-7cb7-492b-b1be-2d03516c8386@gmail.com>
Date: Wed, 10 Sep 2025 19:10:09 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] docs: kdoc: a few more dump_typedef() tweaks
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org
References: <20250909204349.123680-1-corbet@lwn.net>
 <20250909204349.123680-14-corbet@lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250909204349.123680-14-corbet@lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jon,

A quick report on minor regression. Please see below.

On Tue,  9 Sep 2025 14:43:49 -0600, Jonathan Corbet wrote:
> Merge "typedef" into the typedef_type pattern rather than repeating it
> later, and add some comments.

I'm seeing new warnings after applying 13/13:

WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno ./include/media/demux.h' processing failed with: NameError("name '_type' is not defined")
WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno ./include/media/v4l2-ioctl.h' processing failed with: NameError("name '_type' is not defined")
WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno ./include/media/v4l2-ctrls.h' processing failed with: NameError("name '_type' is not defined")
WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno ./include/media/v4l2-dv-timings.h' processing failed with: NameError("name '_type' is not defined")
WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno ./include/media/videobuf2-core.h' processing failed with: NameError("name '_type' is not defined")
WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno ./include/linux/hte.h' processing failed with: NameError("name '_type' is not defined")
WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno ./include/linux/xarray.h' processing failed with: NameError("name '_type' is not defined")
WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno -function gen_pool_add ./include/linux/genalloc.h' processing failed with: NameError("name '_type' is not defined")
WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno -function gen_pool_alloc ./include/linux/genalloc.h' processing failed with: NameError("name '_type' is not defined")
WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno -function vdso_sgx_enter_enclave_t ./arch/x86/include/uapi/asm/sgx.h' processing failed with: NameError("name '_type' is not defined")

Thanks,
Akira

> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  scripts/lib/kdoc/kdoc_parser.py | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index ad9df0536bbf..8215948dd548 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1026,13 +1026,15 @@ class KernelDoc:
>          """
>          Stores a typedef inside self.entries array.
>          """
> -
> -        typedef_type = r'((?:\s+[\w*]+\b){0,7}\s+(?:\w+\b|\*+))\s*'
> +        #
> +        # We start by looking for function typedefs.
> +        #
> +        typedef_type = r'typedef((?:\s+[\w*]+\b){0,7}\s+(?:\w+\b|\*+))\s*'
>          typedef_ident = r'\*?\s*(\w\S+)\s*'
>          typedef_args = r'\s*\((.*)\);'
>  
> -        typedef1 = KernRe(r'typedef' + typedef_type + r'\(' + typedef_ident + r'\)' + typedef_args)
> -        typedef2 = KernRe(r'typedef' + typedef_type + typedef_ident + typedef_args)
> +        typedef1 = KernRe(typedef_type + r'\(' + typedef_ident + r'\)' + typedef_args)
> +        typedef2 = KernRe(typedef_type + typedef_ident + typedef_args)
>  
>          # Parse function typedef prototypes
>          for r in [typedef1, typedef2]:
> @@ -1048,16 +1050,16 @@ class KernelDoc:
>                                f"expecting prototype for typedef {self.entry.identifier}. Prototype was for typedef {declaration_name} instead\n")
>                  return
>  
> -            decl_type = 'function'
> -            self.create_parameter_list(ln, decl_type, args, ',', declaration_name)
> +            self.create_parameter_list(ln, 'function',_type, args, ',', declaration_name)
>  
> -            self.output_declaration(decl_type, declaration_name,
> +            self.output_declaration('function', declaration_name,
>                                      typedef=True,
>                                      functiontype=return_type,
>                                      purpose=self.entry.declaration_purpose)
>              return
> -
> -        # Parse simple typedefs
> +        #
> +        # Not a function, try to parse a simple typedef.
> +        #
>          r = KernRe(r'typedef.*\s+(\w+)\s*;')
>          if r.match(proto):
>              declaration_name = r.group(1)
