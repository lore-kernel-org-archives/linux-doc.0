Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034B61C860B
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767516447; cv=none; b=XpTVbr1uhdGmZ2mHOcbcV6di5hqbI0fvmvRZRg+O1k5vMGHQv72dhguXVUxwtSg7CyVLoEtVksnCVUzA1KoZZnwOjdUsS2oWQiI5mpXW09wLAswYXiGCk6JuxVXwBQZSA/e0E1THJvVu+l5aRgeHNsX97sR4fGJVmGPLlEqdOQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767516447; c=relaxed/simple;
	bh=NtL83AZ2I0DA3UuPrtv/VfK5xsvuv9t+TLu0RxWjJzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srfIaF1NvFeavXRaIftfZ0rINyMymG9Z7Fcp1wFnEgCcapsfzEUE0zK1tkjy9HbcIgW8ZhJf5VmBt7faYZ4fNMNIHtzKGa1kk8r0qd+orv9Kj1nThZC3pofmyRf5tJC42KPuYn6dJjE7a4yE7JAIoRUmblTcWMgQsO0ABv+KYc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fx/qPPT1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fx/qPPT1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a110548cdeso177744745ad.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 00:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767516445; x=1768121245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hSeTIvpTAnLYxpO7SsknGPdy6lTf7WuhDMQpVi4mSs=;
        b=fx/qPPT14OL3rwPZJ/o80fq4HRiMeCNnQb/ef9ubESo8ehRtYVC8+ICL3xZ4SNJFwm
         HCza0GlxZjWn7se2IdmA0kDEUlqTvhamGJ+aWe+H5yGjvkbKe6H35nOJ16PYQbQMZ9eG
         wWlMeKggBY1bRWX/TmHFgoTHRAdHvkYjTLLiiqZl3Wfb1P5jP8mgvNgCzqnlCju1pHgZ
         2WQkkFkJvljm3u19WUdim+WIf68sjaCgbr6SVQAzYaeTzg2a74qjm1JZlLcItx7pGqjA
         3UfcEC/oB+VWD6gQalWfcjxoOHbkQFOGVsS5XAHuWN/0JxKfUNf1/AXtw9qe+17HlztL
         9VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767516445; x=1768121245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hSeTIvpTAnLYxpO7SsknGPdy6lTf7WuhDMQpVi4mSs=;
        b=rdIr1mJzpuuQ9Z4mzmC8qq21q+TLL1xNKliCagxBKvsX6BjgyuV/4orFJkIXhj1Ft1
         4XqiyRSzbhoJdEeS96aVWeOOrw2wcPY0y6/nNLEMqwmeWs17YOHDGiQrXr4t1Lc/3n3K
         TiXeeIkT/P5hWmFt6v+sLHnb8qqzn1O0XlZYgf0d0F5M553JaP6ZwIAZCcwPmwAZh2Zt
         w0bzN2nWQ4clBaPpXJ16o5V0Ou1eao37tCijGLB4mPcRbE41Dok251EsaSvwFit/3HeC
         OayRUozpvBchVR3aTAc8Zi+HxRWpHa7SYa9rJZsuZV4bXaQDgoju7MWvCcvZjjOkj17r
         eAkQ==
X-Gm-Message-State: AOJu0YxlEwkFOOlTXwbhi1v3/fzU/qJ9cHoNlwU1rV9YpiXAwcJqMAyC
	QcvA6FltrFYIulSRNXXfRqK+bsN9sc7RXvqiW8PtWmtXSyFN1p34OAaw
X-Gm-Gg: AY/fxX7s6gBiUfmAIm+lTLOtz+9LZKlczPMLKrENVGUjycDbH4RbvG1Fg++cxX3sFiX
	+vi7R7fyDs9NXZVL6ErTGk1EDiok55haLl5q8qwV6SPzFKXEnB9EDjuPCrDCiSsa7KEyQUvDI9p
	7kNbcF2VfbFykrvy5D8BlOx6YPlcI5vYzrQnBJLf+Sq7do4IcQ+PBh94NFbOiT/ygsfOmeu1fHy
	KOtzE8VtpDDawyO7FcKh8zBlFxLos8LVLKRmvrzc6g+N/m4SjSdBs8+Hti6Pk6dwXGrjmfEgn+/
	UbomDnJm+Qj7tdNA3XUZ/1cNY1pH7KCsZUSbNjDr1lomoC5DP5aM01YwicoVKKOUrHnX+HwR+tT
	0GtzNivkShOi3b5a1VA2Blk+eFHdC7xWUNrS0+pFv/pXmjkMmuFuVmny45L6xSwV2u0YffODf4b
	pVvWETmI6V075kpZlgLwhEqjKu1SXBIT0Rb79g2mCLT8DR/4V3mrfJ5cgK
X-Google-Smtp-Source: AGHT+IFsDFvr6iXtCNWiKmktKqKwrx0pWsIgItUTOb5/wKHPE+kCU5M4crNvV5P61+Ro/H0PWLcRgw==
X-Received: by 2002:a17:902:e884:b0:29a:5ce:b467 with SMTP id d9443c01a7336-2a2f2a4a3a6mr454442845ad.54.1767516445291;
        Sun, 04 Jan 2026 00:47:25 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm426612275ad.99.2026.01.04.00.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 00:47:24 -0800 (PST)
Message-ID: <eec495b9-45ee-49ad-acee-4b21f06062f2@gmail.com>
Date: Sun, 4 Jan 2026 17:47:22 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs/ja_JP: fix typos and duplicated phrases in
 kernel development guide
To: Masaharu Noguchi <nogunix@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260104-ja-howto-v1-0-53e5564a47d9@gmail.com>
 <20260104-ja-howto-v1-1-53e5564a47d9@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260104-ja-howto-v1-1-53e5564a47d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 04 Jan 2026 02:19:38 +0900, Masaharu Noguchi wrote:
> Fix obvious typos and duplicated phrases in the Japanese translation.
> 
> No change in meaning intended.
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>

Acked-by: Akira Yokosawa <akiyks@gmail.com>

> ---
>  Documentation/translations/ja_JP/process/howto.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/translations/ja_JP/process/howto.rst b/Documentation/translations/ja_JP/process/howto.rst
> index 5e307f90982ca39576c40b008a80697559e40b45..a47d7679364aa3da57b9802807a3571ca23b7122 100644
> --- a/Documentation/translations/ja_JP/process/howto.rst
> +++ b/Documentation/translations/ja_JP/process/howto.rst
> @@ -61,7 +61,7 @@ info ページ( info gcc )を見てください。
>  発手順について高度な標準を持つ、多様な人の集まりです。地理的に分散した
>  大規模なチームに対してもっともうまくいくとわかったことをベースにしなが
>  ら、これらの標準は長い時間をかけて築かれてきました。これらはきちんと文
> -書化されていますから、事前にこれらの標準について事前にできるだけたくさ
> +書化されていますから、これらの標準について事前にできるだけたくさ
>  ん学んでください。また皆があなたやあなたの会社のやり方に合わせてくれる
>  と思わないでください。
>  
> @@ -363,7 +363,7 @@ linux-next の実行テストを行う冒険好きなテスターは大いに歓
>  
>  あなたのハッキングのスキルを訓練する最高の方法のひとつに、他人がレポー
>  トしたバグを修正することがあります。あなたがカーネルをより安定化させる
> -こに寄与するということだけでなく、あなたは 現実の問題を修正することを
> +ことに寄与するということだけでなく、あなたは 現実の問題を修正することを
>  学び、自分のスキルも強化でき、また他の開発者があなたの存在に気がつきま
>  す。バグを修正することは、多くの開発者の中から自分が功績をあげる最善の
>  道です、なぜなら多くの人は他人のバグの修正に時間を浪費することを好まな
> 

