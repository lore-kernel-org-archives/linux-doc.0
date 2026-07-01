Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9488D431E6B
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 22:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782944685; cv=pass; b=i7JvoLVjhy3lny1GJUj+uVC306c5a302ALfR1gdCXko+QvHEX19d96FF2s7RvJgyEt8UBgGph3uJPrkw2pLarzqtBQBKR8rgcU81zxmdvHbRMZ1BS+sYP4uyvBmbkUQrKrB6f92fMuAK2whFq37kb0E/yI2v//i6OcjPb3t1gvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782944685; c=relaxed/simple;
	bh=IXf8gz5n5cCHK5E3rSG8n2wYfl5DmpNceUHuKVfskoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qw/ufPhQ5iLXqYsXoGpDwa/KPGyMk2enAIzIHFdUJetILi049Ybp1gXfJpQ6/trnbm1GB7/Zuv2P3DcwL83vhzYqT483SAJvi0QSLBEHww7OkWpDyO+0Q8Dmx+MNec8H3BktVd7vkwo5cmjUnKDqDomAu5aE1F3nE2L85ZAkEB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNgBN500; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNgBN500"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37f816d01e3so1044166a91.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 15:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782944684; cv=none;
        d=google.com; s=arc-20260327;
        b=lnSfudNFOi40xX1mIhssH5zkgHT2MKim6l2PEUC/cMLsOqugMC1n1NFoCfowk8neXU
         KqmlIGuuogpxbPknCH84oKHZhGaMm2Lgyu5jQUFeyKP08Fcx4BIXFnAOf0Fh0lS1SN1O
         CTcJM6ShPORiqVuVyfn2C39ClI9g7WDmDdqIx3pRESTNCGsJC4iSWoSgO0wr61F7Jf+U
         indF1NFvoxtHM7lQQ5LSol4OqUTaauc6qDaYqwntqPJvXnoa/zRgOqMeoxS5V8irhoJs
         HIJ5tFvaSJRvIFXWPRw6Bv+cRop9IsSFbTg7NAndOLgqXANxmHIWg/u6iZaIpsPxdXP3
         wQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1yFeJucqFnCUSeSRxPYIH9H5v+xydKmvVf67iGU/as=;
        fh=dZvosZZN8mLva+jsgYJQ92kwj76Fy4WqxvIc/Cqd9wU=;
        b=hq6pJ13xTP2gJ6NQqlUU4nzjlt5LSU2P1Pebs/p4Zob/PsQfBYQKaoEPd0zlNJTp4Z
         1CxyjTh+D/gb9nzrrK1fOGJhPt4esoBc9bO6WAwVE/rTvxWZQWeZP8V3hpv56qdoNBK+
         lzng4EwBnR1yjg3sypHJ9pVt8PO77SkRypEt9otRB4zkpvo5IWAjiBpd/dlskoYkq4EY
         m0KDvH4OewS0Z/JXodHa+JA3OmP2r556JGNjhMOcwoZmyjYc1nZF+tH6RzitDGIMSbl+
         EgQgcyR7Bhp4/rOPCqw6B/dbe0fLYXcWZHlSl7kYpdxgMrCS+mapZJFdnkp5c71O76D3
         7bag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782944684; x=1783549484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1yFeJucqFnCUSeSRxPYIH9H5v+xydKmvVf67iGU/as=;
        b=QNgBN500YbfhQ7K+nw7+F5DoNAmQ/rh66shGavDhRfQRnReuD8uVVRC5JdhfVWjE41
         0qMEMxv73cQA0dpJUNBeHXdEw5litE+wfYluv+LfXXsGFtJp6Cn4iG6k7d8PNjvnSbP4
         CWdJtEcPz/lXRRdsyQC9Aown4dgJpDCCkaRqdCzBgT2XR3KCK+Lo4btvTYuNAlaRpC6p
         akKLqfsx9jDNgFAFqwhVbzskwdpUR3fWeGry7Os+FESsZDYYF9N23ToUeWoEKeXEkUMQ
         QuUaVYKaTbAnJymXR2NKPwZILSO6b9cn2wZKB6YonXbfqcUlMkxKk4jIM2UyUwoVAmN6
         sGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782944684; x=1783549484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v1yFeJucqFnCUSeSRxPYIH9H5v+xydKmvVf67iGU/as=;
        b=SqebpOp9AjqUGnKxKWQQGrWVWeRnubqxBuO+tSrp85k9gQirbInDezE8dCYg3DAPHB
         4pUJ0xnQ4uN3ueRa5HoJ89pCqJg2hwSRADjzrwOC251omkN0nMzK9Z2oHgSRV1Q2rYyG
         pv49bX7STJv52dYZenshtYM/AfbYoslLyrPs4UjhfhJ8U+2ePIwjIqkjHgkg517hdJr/
         fu2G0WBLg6WRxJqLZk0ZVRBBXKUJwbdQdFBpq7tY4AgrfELBjTh5ATRvOZpSyWdXXUB7
         bFEtdbmbSpiep3EUldRuOPR/p8N7/JjG1yJ+yxXXDVn57R+bf5O+MVAnSOCr1HS0hnBw
         uluw==
X-Forwarded-Encrypted: i=1; AHgh+RrkAEskPWOS4QAuH3HCGHURCb+kzOoYw1poEtNsbdqdgr87iOYHr2jjQms5cOZKtbWIYU0K2j1cUjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1l4vk/1dvskYoIoMgK0J5ILik8VrMEym7EsB28wPrM7mlBCPS
	dU/YoSoZL6Qf33t+gU9OPR7E9GhSzIwYd5WOLuhwGQ1YQm7JS7psJPXfH8lU8IBr38oRm1RQU9I
	At2rIEw1rmuQ1mlERLsD8F8+0OLUH8rE=
X-Gm-Gg: AfdE7cn3fxIkedl47ubM1DG21AmydxOIcOquUqqjIdiOdR7zowYXbkSrlwFlPKwWw9w
	9ySWBx2if7kgb5hlKJPqPwKYbuidIBo9iUdHbo6yhug/I1xDjvui6lfmqm7QLfKUkAP4pRITFzu
	lD83RKpxmyPLedOOMIKmw+vXBUxMsYDW7dTuZoxCKdAVpUfF9p0eHPJu18XhRL8sqkfKiFble48
	xCEBNAqWoGXi+0NLoQvmpZUCP55z65QpVJhZrCEzz1TnqRm0YdrTYWrUrAU6/NikRFzNXzUM5iN
	sX8ngIkmF2I5vRoZ+93nlDDlag/lSSpKM+5U8bFjoOvznM4ndMMfcg==
X-Received: by 2002:a17:90b:4f4b:b0:35f:b6a1:8d27 with SMTP id
 98e67ed59e1d1-380aa184432mr3263591a91.18.1782944683513; Wed, 01 Jul 2026
 15:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626172026.7327-1-jp.kobryn@linux.dev>
In-Reply-To: <20260626172026.7327-1-jp.kobryn@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 1 Jul 2026 15:24:31 -0700
X-Gm-Features: AVVi8CdBHnAQ-dVGbD-wbbUQLjWhZ2YL-KT_zOSpJ4xXWUxIe8qhM2sm7BSyxYk
Message-ID: <CAEf4Bzb-3GA2OGTOBg-dgUNPJfH8-PDi=3gFZbyZLMmP9DFvLQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/bpf: make it clear that kfuncs should be non-static
To: JP Kobryn <jp.kobryn@linux.dev>
Cc: ast@kernel.org, roman.gushchin@linux.dev, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	bpf@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 10:21=E2=80=AFAM JP Kobryn <jp.kobryn@linux.dev> wr=
ote:
>
> The kfunc documentation mentions how the macro __bpf_kfunc prevents
> inlining for static functions. This makes it sound like static kfuncs are
> acceptable. Although static kfuncs may happen to work, it is by chance th=
at
> the compiler chose not to rename these functions and BTF resolution still
> succeeds.
>
> Make it clear in the documentation why kfuncs should not be declared
> static. First, remove wording that makes it sound like static is ok. Then
> point out the external naming needed for BTF resolution. Finally point ou=
t
> that sparse may warn on unreferenced kfuncs and that this warning can be
> ignored.
>
> Signed-off-by: JP Kobryn <jp.kobryn@linux.dev>
> ---
>  Documentation/bpf/kfuncs.rst | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
> index 4c814ff6061e..1dbaff8d4805 100644
> --- a/Documentation/bpf/kfuncs.rst
> +++ b/Documentation/bpf/kfuncs.rst
> @@ -276,19 +276,26 @@ This set encodes the BTF ID of each kfunc listed ab=
ove, and encodes the flags
>  along with it. Ofcourse, it is also allowed to specify no flags.
>
>  kfunc definitions should also always be annotated with the ``__bpf_kfunc=
``
> -macro. This prevents issues such as the compiler inlining the kfunc if i=
t's a
> -static kernel function, or the function being elided in an LTO build as =
it's
> -not used in the rest of the kernel. Developers should not manually add
> -annotations to their kfunc to prevent these issues. If an annotation is
> -required to prevent such an issue with your kfunc, it is a bug and shoul=
d be
> -added to the definition of the macro so that other kfuncs are similarly
> -protected. An example is given below::
> +macro. This prevents issues such as the compiler inlining the kfunc, or =
the
> +function being elided in an LTO build as it's not used in the rest of th=
e
> +kernel. Developers should not manually add annotations to their kfunc to=
 prevent
> +these issues. If an annotation is required to prevent such an issue with=
 your
> +kfunc, it is a bug and should be added to the definition of the macro so=
 that
> +other kfuncs are similarly protected. An example is given below::
>
>          __bpf_kfunc struct task_struct *bpf_get_task_pid(s32 pid)
>          {
>          ...
>          }
>
> +Note that kfuncs must not be declared ``static``. A kfunc can be called =
from a

it seems like we do have static kfuncs and they work fine... And
__noclone in __bpf_kfunc is meant to prevent compiler doing
.constprop/.isra and other transformations.

> +BPF program ``*.c`` file outside the compilation unit that defines it, s=
o its
> +externally visible name must remain available for BTF ID lookup. ``stati=
c``
> +linkage allows the compiler to rename the function, which can break this
> +BTF-based kfunc resolution. Further note that sparse may warn that an ot=
herwise
> +unreferenced kfunc should be static. Such warnings should be ignored for=
 kfunc
> +definitions.
> +
>  2.5.1 KF_ACQUIRE flag
>  ---------------------
>
> --
> 2.54.0
>
