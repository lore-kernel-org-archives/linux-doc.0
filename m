Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792671495;
	b=jMHVg1uFMj/SCTpVWUoUxW5me5oPCfWTlfFdJPTb29iL1lHMRNnruhEw47uCd3jw8qf2
	 tiq4/UhRkp7XzryBog/2XNaZwj8ohe+V5s9+FN0fXsEyHGami5KQwxUwRzRqWG2Kc5cKH
	 T9uveJsNBVkLF6xVAFfc+ikJ4dRO4rgfDvKyeTsXaqWMa2vMZ0Tun9rGe7QiWdoVjvHSF
	 gleVa8kES1KtjxwPpT50Hw2fQwXQ2rT4K0C+aCgKsOZxKz5+CokYSM1b7asuyvfSUkadM
	 00cblYTYUPopmA6/fJkyf97uM9V271qXwvp/yppweXLCn9BfgCQnQi4N8d1bj0zF9pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s9csG9KWZuFtxhPYz4DLhAe4WCwNkF/v5W58eA6JDUc=;
	b=5ESZ6lRQb0Ls3Qe/JMhiDPysFrD1wU73I0b3b8TlsENtdwXchCDVuLdCPbZtPLh3+1c/
	 9Lrz1zLfj2o9gc8i9rZs61uY/y4dokkta5SppJkyaFo0kPOV5Bsf+Vfc3tMzNkH9Pod4R
	 gUvMIo5Fapd/50IvX873TqUYd5QrmP096vaTKyIIIoZjaJOrQi2mSjKHFWTr/rEArH7W+
	 Mn9g0p+N7FVZFU53RCzC5IV8Ucm+EvRD4lSrsEXwkcmRNZTk0P8h3vCCbfd8cNiNaLWyA
	 1d53zXIwTJx/VDVOZVE4T7ZlZCuO4IPy+BcKG60svB27IDDbLWDBn31BuN7OcbEyvgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nfo8KPDj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BCF606A31B
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 12:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BCF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nfo8KPDj
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b54d1e9cdso14271666d6.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792671493; cv=none;
        d=google.com; s=arc-20260327;
        b=EzuSTvMCtzvRFNAli1dPbzodf9sV+7LgNHKy8KPYwO9OPNtxwhsYbSuwRXFGnH19sX
         G903N96ijLMHfWzjkOAvrvbm6OIW7KCAAz7YPIgkdS2a336a2XHOa7jHJ//M+CdXlchl
         IharZrnSaRxJI6ybKggNi5pjK8JHYMC+cgqPjDrn8tuhPxPIz1Yid7AOWBIWPDPl2rcI
         FizRxcLs0C17d10HGiHogsbHYulDv/C/gtMQCyogXtYmwfrOEz+Xj3umo5rzfr2S73L4
         6gKcExZqCDMdKJDbV8OM/RCTDbwOVVi9VGCZAP+4Hy7lyM+4iuKwfWQ/Xd6w3Vbe7rGU
         dZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s9csG9KWZuFtxhPYz4DLhAe4WCwNkF/v5W58eA6JDUc=;
        fh=dmnexhLNa1RQpBvHtgkOJCMu2c3C1EzX9lgnxZHfGBg=;
        b=ndo75fiDOvt14GDPpI+bxpf70AZsmk+WG3JkWlpY2UpZFMUKFK8IKGTCqQZiMapXZs
         qRde/1pijnUyo/z8OouJfDoitk2sdgZRR2pmyZHTSG5yuU0xwguJy+b8mwzd8CxxWT/8
         mgadXRPqDyzkWia8higviz/9tiBbHyn2K4KJ3OHj9WhRLWLR+temHV6kpRKBpZ++nLYU
         y9NUu/ETXXP9+gscBE5h9pBm5rCvHRtRt2c3r09R2lmFsuBj26c/oUC6YsXpGpaZxuKy
         i74a0WRNzvXrmo3zE/1vRKHP+0lxPKDyEn0gw7IAE3YzYC8Om/jmco6CsbJQWT5271tT
         zwuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792671493; x=1793276293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s9csG9KWZuFtxhPYz4DLhAe4WCwNkF/v5W58eA6JDUc=;
        b=nfo8KPDjyKEJpgzULPrceeBYWsK9Ok38Hs4nq02eAW3+P2brsvGKOT1ZuW4AeDiJfI
         5W/NAiNtHcQKXeKJz8ouhNGxB8ays7SFK03TU1KU3uVamTn8YyHKfpUOJaH5hPpIE5EY
         dSsRN8jxdow30RgCWkQsGmH/dVXjRufDV1+SUZO8ZA00HDYMZd4Vmuo+dg8uNaOcrHBW
         OFmr92ZogU1/M+hE9nm6H3jGCHVbfSCTG7nBiDp+TOXEEa748pMeTt5z1I0Q/r9EgvIL
         cpqLbNcpXp2i9JZe02yeuYGWgBNy6CPJTRf0ZHiDLjdwZyzT1fG5nb2QcpgRBFsuzIM3
         cSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792671493; x=1793276293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9csG9KWZuFtxhPYz4DLhAe4WCwNkF/v5W58eA6JDUc=;
        b=ElI8ajbaMwQ7KQeP/+lRUBLZi/GI0PaC/iMq+gGxgc0Ts3nVZBAQMhuv2HFjJqL+Pe
         uTrfzKpI2Qcgkt7WKpJvVSBxPLJBQvzF+Nx1sJzt0sQd3UhYqnj2IYtVnBb9ia9VkRrR
         H1qWQbQ+lDhokyUufg7nf+tLxEYYeFE3DJ8zo9sKBKusUw1EKkQx0Vf8XYNWpOKdzXtq
         kgyRnDROS/xg1Ph3yubqjA2km6pM9DIGtVSHk/xDjcrEAemifuZcHgv+mAE27X10i4fJ
         BqagBMo+Y/6BdJCFAr20NafRnzedZKBr9vsuEXdJAuu0P/dAxkomjFJAX9AZrW/MUyNc
         ANbg==
X-Forwarded-Encrypted: i=1; AKwUvBwCFuJbDf5jhH3R9OMUv9voowpPVHS0tbCVkR/1TKuybzj0UrHEIlU1CLy1i5alCEnqTKznMgdQtnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLcCBuCUREwf0JboGDTBz4q2FS788nH01xB6a78fqsSAKa9DVT
	sTCLuHd0p8t8zvVbyQRvOKGnXX/HhCmE/ArZic+ACRMlILc4oWaVwdxIiwE1713JcjTDRCPwUlJ
	/zoMd2VnUeiKcbjz/TqtYwt03oMQVcqGQVRqFbA37ljxkkaE=
X-Gm-Gg: AYBFou0g2ECLOMxw0rrvr6jX6HFz58YhTjiAbmaD0guQ/D8tpwsxQcu/uqaZc9MarW5
	QxVT1V/2j/G9zz8pWpvDeB2rtAHi6ZFDWJIrLvGZVBqQcWtNlVhdsfZ17xKp6ZiIUPUnqJuWH00
	/ltiLVZTFuoeDgiNfB6sUQ7uUCSiGew8QXLGkV1P8H7WvYZwKo4KqHx3F+dhUIomT4T8o2LbLpp
	v2/FeMC4BmrL8uG2ife2Ixj6pcyfKDUFoknya3S7SnKJNuAPE6A+zV+bmgDBirJcV7wnqWDX9fx
	pLLW3gBm9AA+1oqA5NAwfWb8lZmMWsSraF2rkOQqBAVNLcIriHz1EsnGwuap1toBaPLWuR+HXTw
	i0vpaO0nhS1CAefJ/QQEM7C2ASXq00zV0efyL6qhSzzg2vwL6OLySHAVvNqSeG2K9Iuc00dPw8P
	4WkbghqKmSW9TbKsTaAR3KQ+WYyfaaOEKQkjsgphpV+NR2HcQx
X-Received: by 2002:a05:6214:2506:b0:91b:549c:562c with SMTP id
 6a1803df08f44-91c12dfedc8mr84841876d6.6.1792671493137; Thu, 22 Oct 2026
 05:18:13 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020010421.77388-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261020010421.77388-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 22 Oct 2026 09:18:01 -0300
X-Gm-Features: AclHuK8uc0Pdi9GgPH6cqCilUnGisH2EujO3679uE1lxCkMR2VbSk610iugPnpo
Message-ID: <CAMAsx6duwRdErofO+NHGbZ0crCCU+rrc+2BL31eQGRrDZMVsLQ@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate programming-language.rst
To: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, randy@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 19 de out. de 2026 =C3=A0s 22:05, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> escreveu:
>
> Translate the programming language guide and link it from the pt_BR
> process index.
>
> Assisted-by: LLM
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>

The "Assisted-by:" tag is no longer necessary, so please drop it
in the next version.

I also have two small comments, both about labels that clash with
the original document and should trigger Sphinx "duplicate label"
warnings.

> +
> +.. _programming_language:

This label is already defined by
Documentation/process/programming-language.rst. The other pt_BR
documents use a "pt_BR_" prefix, so please rename it to:


> +O kernel Linux =C3=A9 escrito na linguagem de programa=C3=A7=C3=A3o C [c=
-language]_.
> +Mais precisamente, o kernel costuma ser compilado com ``gcc`` [gcc]_
> +usando ``-std=3Dgnu11`` [gcc-c-dialect-options]_, que seleciona o dialet=
o
> +GNU do padr=C3=A3o ISO C11. ``clang`` [clang]_ tamb=C3=A9m =C3=A9 suport=
ado; consulte
> +a documenta=C3=A7=C3=A3o sobre
> +:ref:`Compilando o Linux com Clang/LLVM <kbuild_llvm>`.

> +Consulte Documentation/rust/index.rst para mais informa=C3=A7=C3=B5es.
> +
> +.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
> +.. [gcc] https://gcc.gnu.org
> +.. [clang] https://clang.llvm.org
> +.. [gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-=
Options.html
> +.. [gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
> +.. [gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-S=
yntax.html
> +.. [n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
> +.. [rust-language] https://www.rust-lang.org
> +.. [rustc] https://doc.rust-lang.org/rustc/
> +.. [rust-editions] https://doc.rust-lang.org/edition-guide/editions/
> +.. [rust-unstable-features] https://github.com/Rust-for-Linux/linux/issu=
es/2
> --

 Citation labels are global in Sphinx, so these collide with the
 ones in the English document as well. The other translations of
 this file prefix them (it_IT uses [it-c-language], sp_SP uses
 [sp-c-language], zh_TW uses [zh_tw_c-language]). Please do the
 same for all eleven citations, e.g. [pt-c-language], and update
 the references in the text accordingly ([pt-c-language]_, etc).

 With those changes fixed, feel free to send a v2 (with a short
 changelog below the "---" line)
