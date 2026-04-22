Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1CC23E33D
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776869739; cv=none; b=LVFN4uAezTbt6cbf4gFAQCqHNLUOGhVBZ01LqCoLJY1fYLDSRhfVn/Bfu78n2QXmhAOUQBV+r2N5ZY00jVx57V8HIo605zzNIoPGWRLXos1TFMqp0u46kgPynWA+NiuvEgYoojQMI8Nq4E/44sgl5Fv7nRq7yCc/aO93hAlL5eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776869739; c=relaxed/simple;
	bh=mdFMI//Id30zN2aq8g2ejgZDnQWsIKMzLh12OdRaYN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjeLD/zmo3p4iLsxpx8B6OxOOTUO7e02wtPDLEfmAg+i1HbxSv9INqMeEtiaPNb7GIqp7HKCJ3ZI/yvC/VbXBQt7plT+33k76JypNfPFbh4S22scFkLYf0+1e/eYmKPI2KiriNjERiaaOO7TwjkHClIduVZBI00KZLR2NPbbsKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MP2ZhiPY; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MP2ZhiPY"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35fb16e56efso3663356a91.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 07:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776869737; x=1777474537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TgygZcdqXMYTxXtA4zUWZDxXXuEyYRzJdq/+ENx9HQQ=;
        b=MP2ZhiPY7Mst+WnMtFyTXC9L6gJ/ZhzZocB4FafR22ANIzhW6BWoTIdSNJwjMRKie1
         AU/wsv5xLpC3H5f46xrt1sMNm7+9udlX8LkTnpjHwSIV8kzvcvGJgvmzxoQlS2ZfGPl4
         mCqhs0ugHKhgGt/B9KKTunNM6pWkxv3wdrDdKHg7sfqAzlqDSIEWazPuG7Oz049WO0eN
         DbLHbRnRt4MwGhSLFi5IvKD6uVEMEt4CjwxMxE6u4aysueToy2Lfv5i2MQAaVfJTm0VT
         RQ3+9zvE84LZ0TW2gp40WvozjsBTK26oWmYTTAlXorUQIsf8r5rbFIgmM94/a+kep8gx
         Pulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776869737; x=1777474537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgygZcdqXMYTxXtA4zUWZDxXXuEyYRzJdq/+ENx9HQQ=;
        b=orFVoTGDCMfgDWaCzbdMoQEA7mz6Ko79uqswhtKbKNSA/K2qUr5QkE4s245rsPUjJG
         t93W1L3ckGs9ZfWxksM+m+agDqLPAUq9pCHwzIaFzaWghMf/IfhuRjK/0lSQYpuJxQMk
         8hYoji13TMJ8eWunVvZ/cAFqvOo6YkaDF8sqEdb4jX64+Ro3vLXxwgEP43PAQSiSeYbS
         aMFM1DCEGGDgP1Bhkfi/sOshlU0EAwGF8d8eQW/21g3VFH6ae1PCwQ+/qSAplK08XrsY
         3uRXEy8MrYHynA9Kwf0oKES8NpfNpELmUa7RbCf7PiKG8jFxnNJl544sY7d7i1W9e/fT
         JpNw==
X-Forwarded-Encrypted: i=1; AFNElJ/YmdehghsOr+wj35zxJNgEnyQD7CUBGqM5A/TR/IdLa/GSLzq4CONkZaNMIOecDP3V3S5LawhI8lQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPkiEmhBw7PX/0JjxGLMEF6UJOybtQ9ZuqwH7vm+K3HJd7uVh1
	KtrAdc9TRQXK8TJngioM5AIy6OK12WyWSZyREfaRi9fpnQ1tYE6HsgqkrAoJgxLT/ls=
X-Gm-Gg: AeBDies7P7RRm67UCngzSUF8q1AXqpn8ShmUlQU9Comt6N/oSScv2rZr7wf43fn55Oo
	KQFSDBunjTdmPJWOPfSvcweq4hO5bXe1XkUvMMdgHP0lg2LVuvMYkPGllx6cmlRX8da1vEeh9iP
	BWz+HeaY0w+aiftuhqa04adkBt8mXT4cE5nUFvA3pL33PAg9D22doceIfLSQQVh3UwlW0Z8Vscy
	RJcgdNvyU0GahnVUFSv8vDXp0SEznRVpHOtvcPBlykTflOaDj5MlhX2pQgq1Ui7ex4XRnjlgUJS
	WWlK2Go6JNqcp81Qci46K4X6Ah9wvZD+u0DyEsKMb3cA2bo25eeyfwCEE8PEL7NwQiPtzOBfo/1
	ep3U6iTQfRXXq513o5dO8nVAX7MBr0HUE/okUtO0Pl3WKlKQ5YcUisEREtJ+/6jowi7mU7VgYIW
	Tyh7+BR4K0caXqq7FucoC9ePp5bo5CaDolRV5aokK4z4644oKS
X-Received: by 2002:a17:90b:2ecc:b0:35a:1762:92fc with SMTP id 98e67ed59e1d1-361404a0678mr23611737a91.26.1776869737067;
        Wed, 22 Apr 2026 07:55:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fd65:9224:aee7:cdd9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cf81sm164424055ad.43.2026.04.22.07.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 07:55:36 -0700 (PDT)
Date: Wed, 22 Apr 2026 08:55:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Zhang Xiaolei <zxl434815272@gmail.com>
Cc: corbet@lwn.net, ebiggers@kernel.org, andersson@kernel.org,
	ardb@kernel.org, skhan@linuxfoundation.org,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: staging: fix various typos and grammar issues
Message-ID: <aejhZQl0Yke9ZDIa@p14s>
References: <20260416105854.788-1-zxl434815272@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416105854.788-1-zxl434815272@gmail.com>

On Thu, Apr 16, 2026 at 06:58:53PM +0800, Zhang Xiaolei wrote:
> Fix a few typographical and grammatical issues across several
> staging documentation files to improve readability:
> - crc32.rst: replace "decide in" with "decide on"
> - lzo.rst: replace "independent on" with "independent of"
> - remoteproc.rst: fix word order in dependent clause
> - static-keys.rst: add hyphen to "low-level"
> 
> Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
> ---
>  Documentation/staging/crc32.rst       | 2 +-
>  Documentation/staging/lzo.rst         | 2 +-
>  Documentation/staging/remoteproc.rst  | 2 +-

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  Documentation/staging/static-keys.rst | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/staging/crc32.rst b/Documentation/staging/crc32.rst
> index 64f3dd430a6c..fc0d9564b99c 100644
> --- a/Documentation/staging/crc32.rst
> +++ b/Documentation/staging/crc32.rst
> @@ -119,7 +119,7 @@ the byte-at-a-time table method, popularized by Dilip V. Sarwate,
>  v.31 no.8 (August 1988) p. 1008-1013.
>  
>  Here, rather than just shifting one bit of the remainder to decide
> -in the correct multiple to subtract, we can shift a byte at a time.
> +on the correct multiple to subtract, we can shift a byte at a time.
>  This produces a 40-bit (rather than a 33-bit) intermediate remainder,
>  and the correct multiple of the polynomial to subtract is found using
>  a 256-entry lookup table indexed by the high 8 bits.
> diff --git a/Documentation/staging/lzo.rst b/Documentation/staging/lzo.rst
> index f65b51523014..2d48b2667dd2 100644
> --- a/Documentation/staging/lzo.rst
> +++ b/Documentation/staging/lzo.rst
> @@ -75,7 +75,7 @@ Description
>       are called under the assumption that a certain number of bytes follow
>       because it has already been guaranteed before parsing the instructions.
>       They just have to "refill" this credit if they consume extra bytes. This
> -     is an implementation design choice independent on the algorithm or
> +     is an implementation design choice independent of the algorithm or
>       encoding.
>  
>  Versions
> diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> index 5c226fa076d6..c117b060e76c 100644
> --- a/Documentation/staging/remoteproc.rst
> +++ b/Documentation/staging/remoteproc.rst
> @@ -24,7 +24,7 @@ handlers, and then all rpmsg drivers will then just work
>  (for more information about the virtio-based rpmsg bus and its drivers,
>  please read Documentation/staging/rpmsg.rst).
>  Registration of other types of virtio devices is now also possible. Firmwares
> -just need to publish what kind of virtio devices do they support, and then
> +just need to publish what kind of virtio devices they support, and then
>  remoteproc will add those devices. This makes it possible to reuse the
>  existing virtio drivers with remote processor backends at a minimal development
>  cost.
> diff --git a/Documentation/staging/static-keys.rst b/Documentation/staging/static-keys.rst
> index b0a519f456cf..e8dc3a87c381 100644
> --- a/Documentation/staging/static-keys.rst
> +++ b/Documentation/staging/static-keys.rst
> @@ -90,7 +90,7 @@ out-of-line true branch. Thus, changing branch direction is expensive but
>  branch selection is basically 'free'. That is the basic tradeoff of this
>  optimization.
>  
> -This lowlevel patching mechanism is called 'jump label patching', and it gives
> +This low-level patching mechanism is called 'jump label patching', and it gives
>  the basis for the static keys facility.
>  
>  Static key label API, usage and examples
> -- 
> 2.53.0.windows.2
> 
