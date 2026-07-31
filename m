Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DE033EB1B
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 03:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467991; cv=none; b=mklZ92MKpY4LtAXzTkJ/TE5vkJ95I9Iui9OIh4VGnTQ07rzW32lQHWZL7bzb21Uk84pBe5UTOMjyijkwTGJp+W1YZanD27gBIVdVP9rgyWx8obxhvGtH6Jw/7GALshomYLiNxmPCvbwCuTzDQ7g1nfhsnqw8pU/3slsnlne+LU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467991; c=relaxed/simple;
	bh=FV8MFBYEphVrTjBPAGjCbWhQns/u4z4oUa+LiSet24Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=UZAkUVKvrlTh/bmdYO0LIGd7UBrctI69f7xctwZY8TlSAp2AgwP3d1S/IbLSAb3Ptm01LAuSiupg7LLu/QkR94WckmIWy45VXfWgG90e7519o7Vno/9EzEuI9jf3tdE9ZJW2Orl1QOZ46C8+EaXoI6m7b2hoHipmdiO8IXtyVzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGu0EnyE; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGu0EnyE"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso569053a91.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 20:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467989; x=1786072789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NzX+hRkU5KWllIWfAvWaKY5U9ZRh7FwCTJ1V1rzbgvU=;
        b=hGu0EnyERQ1ujltQljtEH94uYSg2f7mIpJeqOWuU/kkSYjb6MadCHXFmR6a/XdexWa
         439BqD5C/CP7qHw55i2tpsR5kX/3RqSHA8onNsgwlG1hu8r5+3+CuqpWH1tZMTtPhmO1
         P0vtQuC04U3RnTltGVaVrJ3Nr+Xijx4bBn8lXnMnCPlamguoNhkv6FhWKOduZTcBn9B8
         h/FOulrYa9jWQ1bW4elBK+/tqL527CnwwYmujDRIQ3WLrJBYEzSgg04bkD1GbA2MbPgo
         T/Othp1tjXIcqqaS+WwQKtVgoM3kuvqcA92A82Uvl5vh26wEzGUiAfQZRIa9L3d/34JQ
         NRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467989; x=1786072789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzX+hRkU5KWllIWfAvWaKY5U9ZRh7FwCTJ1V1rzbgvU=;
        b=TfT4ipE/lLmL29bg0fm3clPuFbG1XydLKONVwqej5hP7T4A/7GaSHsbrGdWJghxCS+
         dy//5ZTO5WBlSoWKPh+jWNfBbOJ6fFBIU329yq4VJ9yU/3GQY6o0Hyzj+Gx74NhfSxhf
         BIvfhgmXuSt/mTZmVaKmzMUgfsc7uzJp2VTRclGG/disCJdjYR+y2/3lThSs2BlBS/6q
         09f+38oC+VpR9R/uGHWqUr7CRBRE3qU3TujmceOhNgR4p3GtZkf1+6yAfCaQa8VbIsiK
         wIAV9SaRICmETFP1Eg9HWzp7km1vHYIh6sJMG9dStudFO6NpmpPgMW7WM7f4d921uqqi
         ZjBA==
X-Forwarded-Encrypted: i=1; AHgh+RpZs0jzw2FMfM4sUS4qjyv7YndwNnCB395sUfp2bm23NEGugDwJlra1h23rxqUQLRmb50EjDDS7O2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx10gO9zSoLNViThxxNsZP8OGNOy9lv7Zz1+Ozl+sO8UplVYJj
	hwhdAPSM4Utn37bwjvYcODbtT73TOp9xE40b3kfdwUyPa8XRB2aFpUoP
X-Gm-Gg: AR+sD119YYYVm5HoEMfTiFosmfTY29EfWBCgMjz+JUmS46OOVpRJqagJlm65kaOwAfh
	stu+QMJxH3QiEw9tBR8vtQsc5P/vBqiO0UTlZA6oYzwsl2nksWlFYx6fDHGGAKhDevV3kWGBXrD
	e1aANjZ/deDMR0UTPK2/0LmVgk1cl97ziOQN5euIjF5s7lqcKZVnx4/fpi9FRMdugY3CCuz+0Uy
	EBy2ZHtD0ef9ynMEIJ1uPxtHvr2kyr7QC0ZDXvwL6wg6k/ebHb/glHYNU6bY80/6v7Nzb1qYKj5
	AsrNLI1tAr3SR44lmUZ/zeRf5WCmlS5Ts0hY+Nnaf0fAQ6OEyWke5r7Gl9aXMMDrI7ZOG/0T+Uf
	o4ZIoLET7UgAThAufllUNbv+/KaA54feXnw4oxSm+Czto7fudhJ+cRPSt0wefpGluJXQp0KDnsH
	E5WSEff6RH/OmBuzFd0JB4OH+7H+SMYH54IiQMQP4ssgD6wTsMEadK0aYV1pz2IaclHBkBapfoZ
	2bWe7TPrOjQJ+F5Dr6YhdQgf7nUmCJs0g==
X-Received: by 2002:a17:90b:3804:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-38fb112ea70mr350173a91.11.1785467989242;
        Thu, 30 Jul 2026 20:19:49 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2e10549sm42623a91.2.2026.07.30.20.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 20:19:48 -0700 (PDT)
Message-ID: <22a9276d-c103-4306-a617-7f34abcd5c29@gmail.com>
Date: Fri, 31 Jul 2026 12:19:41 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ryszard.knop@intel.com
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, shuicheng.lin@intel.com, corbet@lwn.net
References: <20260717125753.634550-1-ryszard.knop@intel.com>
Subject: Re: [PATCH v3] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260717125753.634550-1-ryszard.knop@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Daily linux-next documentation build at https://www.kernel.org/doc/html/next/
has stopped working since July 23.

In my bisection using a debian bookworm container (python 3.11.2 +
sphinx 5.3.0), this patch, which is now commit d7758384ccb4
("scripts/kernel-doc: Suggest possible names for excess descriptions"),
is blamed as the first bad commit.  Reverting it resolves the build
error.

Error message from "make htmldocs" looks like this:

--------------------------------------------------------
Exception occurred:
  File "/linux/tools/lib/python/kdoc/kdoc_files.py", line 16, in <module>
    from kdoc.kdoc_parser import KernelDoc
  File "/linux/tools/lib/python/kdoc/kdoc_parser.py", line 604
    return f"(did you mean one of: '{"', '".join(suggestions)}')"
                                                                 ^
SyntaxError: f-string: expecting '}'
--------------------------------------------------------

I think this needs python3 3.12 or better.

Can you make this script compatible with python3 3.9, which is the
minimal version listed in Documentation/process/changes.rst?

Thanks, Akira
