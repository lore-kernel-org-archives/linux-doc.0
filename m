Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795362990;
	b=Hvpw1J872p93pDuU3OtJTTPDh6iKHz+lYHXuJZsXYGrQgTvgrVWFdQ6BYA5oEL1P/VeL
	 e7ROw1gDTBmxgXr1Q1aBK//6eEgKY/Evh8S1aPmPGsXrOPevA5m+4n+hyc7izQk3+KChK
	 cFACfN2X9DTfCSNtKFIZW+nnRodifQY+v1KIgjpXw6s9/k7HXx5AWaie9fQBp2bp32Hjh
	 DzLVkWijTmHdnBYUEcYk1u3b2WM63URXvtXO92NcON+pN4PD8gZljI4RdF02YtminWhK0
	 o797m0rB89wkmDFJK32mWOH435eIhc5p8S0r6YfnEd5mZrIoawGgUq/U6MxULcp6ahg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Akf1BpTp14qWXCyAghifpSssp7kKGHr8uqx+uiX8vCw=;
	b=wIKW5CRl9OnmdyaRYm1B7zQq4S2IVIJftuBY+hVx+WPdKDGKMBl5g/MDz7T8xRkXcx36
	 eLfaq7+jGWiOH3IG/KcEhp1YI1WFHCiWegnULW4+JWFU2Z85mtia2Xkyvi34GB2cYeXan
	 FqxE8B6GtP/JEyLoQ7ifU6DV+8+fwpCPOa96X+WCF/E8lPu2+LI5vcoOVMjgfZKW8aO80
	 SrCh+igodMFKeCJbR5Td8T1uGHbeowXUyZ/OOLaKWFtNEuI6Jr6rRp257Fy6xKHKsfTze
	 BMJ38x/c4jzXvHANyTfBeM+6uThPzkNNBUlImgZz6qbQfmvPczdU2YChfcbd5vlG9Iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fdh9zgU4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F16606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 15:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F16606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fdh9zgU4
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9211bbce3abso21134096d6.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 07:56:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795362989; cv=none;
        d=google.com; s=arc-20260327;
        b=ZY0AKtVPearCKPP4KUQ3qfoo/Tjfx403RwwH5ea5Gjk9D2jWlT+Tk5EtXXWDdeKl/g
         k4Pkr8yFHZTEVF3Wx0ZKsyi1D+8WMy6KqJR5k/zcX+KyVj82tge/XYux0tg+oC5ODdYy
         OzjxX/I5hdVmdS/abm1++h5gWTRJpsPoptL/ZFCd2e4r5DtDopurr0ckAdqM2YzOs4mb
         oZ03b79en9+Cw34jxwne67/siTFMhDsu9Jv8r8JOjqETGYdLI6Pmq43QC0fYAGNMqqO2
         V2t/SCOOpzH6KqUL+rfEVLSEKZIz+RtDxSUwKPARoUEu+F9lGzXoF00AFj/TEvmhqj+9
         TqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Akf1BpTp14qWXCyAghifpSssp7kKGHr8uqx+uiX8vCw=;
        fh=cYhNIEYJpjVNslO41TR/i8FZZnfCz6Y/J8ViMpYP+ag=;
        b=QkfH8rg1opdW4o+i8UN4XAhn+fnceD56GLtZ0o7R5XdqOmGsgY4ZnF74+EpZZXSm9j
         S5wy0+k7oLroLLbdBUasHaPWd/D/U8A1ZtBzX2AzRNSpQ/Irw6dO6QZxEr6HxXFxNnOX
         w7uJwj/Ryn0HrUQRNk21qdYZtcN1UpKqiXH/NWqT2PLmh3B6mDEq9W97QpzkRdJaRNWq
         Z103VvnAz4u1iSLga9jukbKr/gw1eli7pdn25+epIsORABcKKDbv5/Mdm1Y62zUu/gto
         s/ml6uDuLe25UbYuuLUyRyq7og8ItsiiMmED9cR/gMeRxKLwrpJ2tA0ED5ZMByn02+ZJ
         DXkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795362989; x=1795967789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Akf1BpTp14qWXCyAghifpSssp7kKGHr8uqx+uiX8vCw=;
        b=fdh9zgU4yyFiqN3/pGNONKtUXItfpLZnESdf/pS0xpZiZK9ca+C7LtMrntdKJfCM4B
         QXh7aYZeVifmZtS7mwwOqEz8WEQixXtF34RCUHXAXoFKYkiUZ3be8s43F+HFhMkAmOot
         h6FKi2FxF9pO+WBvKYcbodF3jMmdn0rygiCQ0DgKBBCUxXUr3++RzX+baAzk5dCv107O
         0id8Vqx+rVhcTGcosaBBrQ98pyYO6Zx1qoisXmPU0HhIvYyMX4z7/gqS8rw1V7NuiS1U
         ZenXXIbUJ9us4+wj1HvVp2C87PpyZju3mXCtmoVkpkRbWEz+6dPcBnzGC1r5+cDR3itz
         sjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362989; x=1795967789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Akf1BpTp14qWXCyAghifpSssp7kKGHr8uqx+uiX8vCw=;
        b=Dg5g3KzyTfV6RIxnpwkQmFtGtBmazDymL+bQUfLsTyzHn5hfHysYl/5M/kMaw/dpgW
         W/K4JgkeHAOKXqiyzP0XMUPxYipmFk0u0N2MphYinhOHuQiPlI6n2w6Hl8WFLGEeCicS
         lkWSwG3EVlkuqQXN1hB+hxY503XPjkVToLgUjJRmKjVXcfn2A9NvF1DRXco6ksYk8yj5
         cJVlZx8qTE0q8z4IsVoAwNBkYSRp4UNwOOZeOxaam7AmsTcpnAP08uax6LPDqCGxDj6G
         +BMPI7Z3s4m0a+kSfXjhRqU0KKxARdAY7WGcX7B65oiQVS8wM5+7goBM2SMGnu6Mg2iv
         80BA==
X-Forwarded-Encrypted: i=1; AL+hErEcFufiIpKR3jooi0c2mteSL1fkB8b0x312dnA4BFWOg+NA6H8DMQ6k5pc1+lDwX0rE2ZDrlBVm2CM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V7dwUSTo1XlHMc1sRiapEJgO4Dg4GAEO7pvGlornuvW/b9u/y
	dflXSEuaSUMOj49BVhEtSm21jFUmqm172LtYPhAwQ5Xuu5Y9PjCpBVaGjHPslRXrTjMqJ9blct3
	6g37QU1jmSFMu8yDjBUZKOm+Za2OZDeo=
X-Gm-Gg: AZFdTZf8ZEVYwsn/+lhSJAXS+O1ZVUkS1/EuiL73kJME2ePOKiw10AlD6qegSFLDAYX
	pJuUInQTVBLWZ9tj1la/IpGGca3OvwmHTgeLz/3BX3Bnk26iANQ/yWcc8NPoDLe6qtSx45XFkkm
	v6r0y+8mlE6FpNYkDVoY/vbagniTVYssNR1JUGIX9fjfnWZaJMR/r7dVgdp9Kezyu17J/AikbEp
	yNrDVa+JowZK4viGcO7epHITdVxctHNz0BCzlYxiuZJM8GEr3X0VQf+WruYKudYtT5qPPQQ8KTw
	GHzrYDMLAgN+r14zQ14N/KNWhpkRxsEabiC5kbP0ytv79KUfobbGEQRoC3YlfM2o5sYAa6l2vtC
	+5p36ys0CgFvmp2fmNsUNvmoTDv3hkTQk8RqrFEKIJ4aicvUhZocmL78Vp2bsJSkpmI62qfLqxf
	tDLeV71hv0+PYv/a5gDSo77rk2AZZCm4xZgIrSWcYQ9wi+HWq4EMjYrYA5CxrwWFy/gHlmWpP4u
	8oILp25Q0V3iOYBpw7GEM3cJA==
X-Received: by 2002:ad4:5c85:0:b0:91f:312d:c404 with SMTP id
 6a1803df08f44-92134a770c6mr150462736d6.13.1795362989127; Sun, 22 Nov 2026
 07:56:29 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-programming-language-pt-br-v1-1-a48a23d365ee@gmail.com>
In-Reply-To: <20261122-programming-language-pt-br-v1-1-a48a23d365ee@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 22 Nov 2026 12:56:16 -0300
X-Gm-Features: Aa3M54pCY0MmdQPj1uzVeMQr4RlttHxF37xfnwyE8a_6G2pz33Z8UoY1C6U9M8o
Message-ID: <CAMAsx6f0o1fYOqipy_ohJm8KwVvenFsN6UGbDy9L_Qi6PYqXBQ@mail.gmail.com>
Subject: Re: [PATCH] docs/translations/pt_BR: process: add programming-language.rst
To: dreduardocruz@gmail.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 22 de nov. de 2026 =C3=A0s 11:34, Eduardo Pereira Cruz via B4
Relay <devnull+dreduardocruz.gmail.com@kernel.org> escreveu:
>
> From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
>
> Add the Brazilian Portuguese translation of
> Documentation/process/programming-language.rst, which documents the C
> dialect used by the kernel and the attributes conventions, plus the Rust
> support under CONFIG_RUST.
>
> All eleven footnote definitions and their URLs are kept verbatim, as they
>
Hi Eduardo,

This document was already translated by Gabriel Ribeiro (v2) and
applied by Jon on Nov 2, so this patch is a duplicate.

Also, the label and footnote names clash with the English original and
would cause duplicate warnings in the build.

Please check the list and the tree before translating a document.

Thanks,
Daniel
