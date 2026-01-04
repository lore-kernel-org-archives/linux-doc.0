Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521F91FB1
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767516141; cv=none; b=HfOJfVRVoQEZs34VxPAhdtNo4HNkcIzWXPBoeVq6tErPK7WdTC7InnIS44pdLcSMTGylA6Gmu8mxjIQSIHOzfeULQsJCZ98sdn/1njsDm2qw5nPlI4lx/osDskbRW326DB3nKqPTPZ8aMhfo13c8sEM/e/8rGRFypZHR2c3p1Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767516141; c=relaxed/simple;
	bh=k0wGVvmnEVpw5W+EyOO4WdXDPDOP7A0Nufqeemw8gtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QME/G4DoFpbz6LSD2NWR5ttxhEFX3QW0fBE38fHUyreU3FVYOuTEE0n62Rps7FFYnTFhsVrw9aA8rHWir0rWwY+sn+UQ8OzgAjXyI5u/uQ7cGhHzd6wL3GcSBJpMDwyGXSs9WIwx4g2EA6yPQkUn4Lnp+PVBckuHYoB4nMuBgN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wrh/Z8P7; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wrh/Z8P7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0d5c365ceso175444815ad.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 00:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767516140; x=1768120940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5/z22Fzka8ulqAaAh+6EGgm/rh0PZWJ1w7v2/ghd70=;
        b=Wrh/Z8P7zgTMTmvCXNF+bLPoNyPEq6/FDQeP4XsPOvYX3pD5vyzyONCPCrdIDx/kSB
         QoCxdnS49lgYhGcKySCwR3GPE47evzV47//2gtVwNxYPHsMA9P7PpLsnaH796NQI3Zgb
         nCbwL72WjdzYkTuhlsy9nOkujn6WYIuLVM/yyClNzJ/47ySMm1+lJxQppo+0Tn/Idjit
         dGN08kXBc0SmPeVlxHdMwr1yAyZO30BQ09ZsbxF6QZyUZbMHlFg/Nc2Ts9vKhPOZ+OkD
         RjKBwEipTiHaiHN5QLe0/TSBY2QzeBUtQTNac1cyBuFkOdgZ11IG2rFBsu4zKGg4nTFS
         vm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767516140; x=1768120940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5/z22Fzka8ulqAaAh+6EGgm/rh0PZWJ1w7v2/ghd70=;
        b=OQAHy/KPgeEU2hdH4/5sTQ65IeeZog5S6xLHc7PTrm15MVCHbXKAdQmBxlL5bn0qW5
         wsLEzPAD95YPMm5elk+/esvW6YQPwQSp9cMo6VmnuHSfRLzsfXUilUoKHUNHZ7oCWFTp
         AeTBQoEgXDD3ddkyssvlQbBhKi02yksNF5dBuL516ChnMh9tmEgg7/JR8bW6mxoRDxwh
         v43v2Q0zswMjOLgGf3p7gZJyTOdaNgNvvKMdcQFWmjO5kWCU2j62jEbX/4JgGHmOdNMw
         gTJOzT3yu6PXseZ3Y8dd8i90AAwr0L2A5PF0Qg3xUsTDUY9dQAdI+yNZj9RxirfjjiHF
         scDQ==
X-Gm-Message-State: AOJu0YxvMD8S7+lZQRZ+HS4+kykim5dNcPCa6jW+LdMeLwG0FdEVjSl4
	dEap+Cc1p+bXJP3F9OxmSAZyL+rVu5FeAudMMakblD0fbFr+o+JhaEbZ
X-Gm-Gg: AY/fxX5XVYyts49GKzLoGxQ9csm4fswQmWP9tgdQSpOWBt+kcoE7dgaXNHqV8rF2lZK
	Y/4DsLN6fCvzMyfG8ulaZCmV9+ekwFZR+9V04+3BwtvURdYX5N1+VcRSH669pwKyR3LNj6lH8Xr
	2B0NHL2NyaL/ucvpHy+CIBrVyNZBJmrM4lUZUBW8o9oPCGCUsyaUK2+X0+OvJYgy2Rh0Jqm6iOS
	ACYikUL4ujxPE9kRGVW8RYm0sD4b7SkVeVH8sKiollasAgofl7XJMZbrAfayaeLGMzzZQDAlImf
	3XAMnooqAng5Lnt/7WxT8CEb8ZQA1V5cXDCbvqd9gpb+vgACcPfXf40FsT5SSzgjQMrUGbxc2aO
	ouLRQqSNnF1tJTBOIZUxZJegXMTGTMjZy9FSidcjmqGHDLw+hSM+b07bfr5BSwByCuEBMnB8++S
	QXP9RFkE7w71NwtbMCMVGSsPf/ZJsEC2xnN9rgNNjY+GNm60R7CW3pNgt5
X-Google-Smtp-Source: AGHT+IFdq3zsouh/RzYfm6Z6Cndj+9XPWwq+LxWXoF/VyV3/ehPcrlJT+iGaLehiLdfAeu1k7tJh+A==
X-Received: by 2002:a17:903:11c7:b0:2a0:d728:2e7e with SMTP id d9443c01a7336-2a2f272e96amr426193825ad.39.1767516139644;
        Sun, 04 Jan 2026 00:42:19 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82a10sm417087845ad.26.2026.01.04.00.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 00:42:19 -0800 (PST)
Message-ID: <fcd7fc75-2f56-475e-880b-f8a9edfe9db0@gmail.com>
Date: Sun, 4 Jan 2026 17:42:15 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs/ja_JP: fix translation of freestanding C
 environment
To: Masaharu Noguchi <nogunix@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>
References: <20260104-ja-howto-v1-0-53e5564a47d9@gmail.com>
 <20260104-ja-howto-v1-2-53e5564a47d9@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260104-ja-howto-v1-2-53e5564a47d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 04 Jan 2026 02:19:39 +0900, Masaharu Noguchi wrote:
> The current Japanese translation incorrectly implies that the kernel is
> independent of the C language.
> 
> Translate "freestanding C environment" accurately.
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  Documentation/translations/ja_JP/process/howto.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/ja_JP/process/howto.rst b/Documentation/translations/ja_JP/process/howto.rst
> index a47d7679364aa3da57b9802807a3571ca23b7122..9a807901dd89a88cc0d34607fdc613e68ebdbb9a 100644
> --- a/Documentation/translations/ja_JP/process/howto.rst
> +++ b/Documentation/translations/ja_JP/process/howto.rst
> @@ -49,7 +49,8 @@ Linux カーネル開発のやり方
>  
>  カーネルは GNU C と GNU ツールチェインを使って書かれています。カーネル
>  は ISO C11 仕様に準拠して書く一方で、標準には無い言語拡張を多く使って
> -います。カーネルは標準 C ライブラリに依存しない、C 言語非依存環境です。
> +います。カーネルは標準 C ライブラリに依存しない、フリースタンディング
> +な C 環境です。

Well, your change looks to me more like a "transliteration", rather
than a "translation".

What about: 「自立した C 環境」 ?

Its reverse translation is "independent C environment", which should
be close enough to the original wording, I guess.

Thanks, Akira

>  そのため、C の標準の中で使えないものもあります。特に任意の long long
>  の除算や浮動小数点は使えません。カーネルがツールチェインや C 言語拡張
>  に置いている前提がどうなっているのかわかりにくいことが時々あり、また、
> 


