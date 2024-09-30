Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08089187FFA
	for <linux-doc@vger.kernel.org>; Mon, 30 Sep 2024 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727688552; cv=none; b=HjK7xJSSNCb36sLt46oBzEvnUIsz8SVbs/QrZdEU3cLDrUpGDPI4ljB2sM5wrrpkkUUJJwPOYRVP7VT2WO6sc7i3nHzISUtrhgnECSWEjJK1mf+wqjUpC0hvr9csmvGU9p39+Ht/9PF2KDyQXZ/Qwavf0TRTKA8T7tUTu/I4OJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727688552; c=relaxed/simple;
	bh=A1fGxWYRT+rLnLYY4XjZD7c/cviI8I+09C5LGo1sj24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMm+Jr04U4KMfsdkQffSPqqIexvGowtGJZn4tCXFY4soF3n8EGUs+Nb+O7YfpWd60YEMKOk8tJYBY3DNRzN3L15bQJWO5lL+1u99bK30zgeieG6AmUqd6+PV16zw4TD0/h/s0lB8TQkZa7nBod+Rp1XViZ7+nXOTQTFxoFVjaj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQujpbd5; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQujpbd5"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8ce5db8668so736472666b.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Sep 2024 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727688549; x=1728293349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WrSgKLXv963s8mVz9r3Q+1HNhsVnqhk2fQcNtk3Cxfo=;
        b=RQujpbd5eSjUtXpqSpyLjLt2blDEiQyxReHwm++fai1pW9OkUhlrWPKjsFiLaL+ujK
         w5+eqHsl6Kyciq3tqrNTk/s49nB6I4NrRY0K5KIWRLwtUGO1qz5UKKIAatynhsEyM7ks
         PlPBMXscJ5CeopXMcJfGtKngcdIDXOWRQB2/6OJKMgW+VV6FoRSHwTv7Ulliv5hhUoGT
         fIWU8txGGSxJ8NEhCJwTw+Kf51OUUZc8lyM4HflLmqMqVKEmpskp+BSInhYTFxi5z+3i
         vEg+xxa40wRg2WWjWLHD0+AY8XlTWw1wqXqE+MA15+InP/EixOKT5X0dhi+fWdCqSFli
         PGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727688549; x=1728293349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrSgKLXv963s8mVz9r3Q+1HNhsVnqhk2fQcNtk3Cxfo=;
        b=pr1ZuQ/utwxIy1/kv5EFJ4IJF139ufUhUNluNLuxIFEf6qk/GShLXpP+DsrsDqLEjH
         eyjB3t8BkGZ1eB0IObZyr3l5yLcLkjWyRk9wspd1d4u91czs9vBBZXLtBH6/0G7Q06BY
         bmQRQ0Sl5osB359JGWAzrlOMSrfeU8w3XBA1ISWVzgkyylPbwZ2ZWqnWGtQTu51eswcQ
         ZfgcCteEbrmiCFpBQMAHSPOxHaKnw4LUQnnSamndpMuw28uRvH7pqCXqVQ3Yh6fcD28K
         +9uX6Tc2t5/kTKKlr+0Wsne4+WYXMekOn7YevxaMhntwqrc5BuoQ+XT/QfVa6TqhmMNC
         4lTg==
X-Forwarded-Encrypted: i=1; AJvYcCWOMLdJO9i9R/X1pkTOKQVHYwsUMu+lfUJhfHON6hjeBxP3ukT4E4MtQmlx8jQ52HfTLdcLqgqppfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpVMtvL/ktyaTObRy8a2+8yX4EV7OM3krbfpt1THc60KJav+/4
	fueOsv4KIS0NBe9vYDfiMevhz8atsjJr7RKxEncwszqkIbe7++b4w8U4vEma7CnpG0d67lE+PIX
	fOrc=
X-Google-Smtp-Source: AGHT+IEkKrPJsUlHoyTMQaqjzeMWolJl4XDm5NPQqsWGGZyTSTe4MBnX5SWsdMBYeKWeft0bEIk64Q==
X-Received: by 2002:a17:906:f59e:b0:a86:79a2:ab12 with SMTP id a640c23a62f3a-a93c492a75amr1205266666b.38.1727688549160;
        Mon, 30 Sep 2024 02:29:09 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2997d41sm501776866b.194.2024.09.30.02.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 02:29:08 -0700 (PDT)
Date: Mon, 30 Sep 2024 10:29:07 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jason Wessel <jason.wessel@windriver.com>,
	Douglas Anderson <dianders@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	kgdb-bugreport@lists.sourceforge.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Documentation: kgdb: Correct parameter error
Message-ID: <20240930092907.GD5584@aspen.lan>
References: <20240925100742.1730576-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925100742.1730576-1-changhuang.liang@starfivetech.com>

On Wed, Sep 25, 2024 at 03:07:42AM -0700, Changhuang Liang wrote:
> Module kgdb had been converted to debug_core since commit c433820971ff
> ("Move kernel/kgdb.c to kernel/debug/debug_core.c") be added, so let's
> correct the module parameter path.
>
> Fixes: c433820971ff ("Move kernel/kgdb.c to kernel/debug/debug_core.c")
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

@Jon: Do you want me to hoover this up or will you take it? If you are
happy to grab it then feel free to treat my Rb: as an Acked-by: too!


Daniel.


> ---
>
> Hi,
>
> v3: I wrote a error change log in v2. Now fix it.
>
>  Documentation/dev-tools/kgdb.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
> index f83ba2601e55..a87a58e6509a 100644
> --- a/Documentation/dev-tools/kgdb.rst
> +++ b/Documentation/dev-tools/kgdb.rst
> @@ -329,7 +329,7 @@ ways to activate this feature.
>
>  2. Use sysfs before configuring an I/O driver::
>
> -	echo 1 > /sys/module/kgdb/parameters/kgdb_use_con
> +	echo 1 > /sys/module/debug_core/parameters/kgdb_use_con
>
>  .. note::
>
> --
> 2.25.1
