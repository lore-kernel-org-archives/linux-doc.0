Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33D328627
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 08:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603102; cv=none; b=CVhE9wQNnBDZWggK/+wFgiv4KNpechBDcJMkgsSSTBLy+fOM+OrGjd+OjUaUr+A113kA8H2KzlmKuA8kChHytCEhS3sHKYhcAFvLwTujl0vChOGTjIyYC2XXziJtSK5Sqe+exY8M3b0Ncsapd2DuN6xakhxh5/nhK8WbRIPayg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603102; c=relaxed/simple;
	bh=OAo5K/otowRMfSN0d0G/teKYtxIelTfpBkceavpB2MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=owUMqxIRHMqGvMePBV/xl9sPhoK/r0f0erwOrF/AAyAOtFQCzb/LyFZWClEi3Fw8c+M1T/u63kalSJcQ2ILXu9gyJqwrVYQK9IRQvcA2h+tnoPbhIrl8O+zsoDkpD3diHwG0J+q1UuIa+9HUE1BH5/0Ku+s6TmjMDNVYEpz2Z0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exV/CKEL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exV/CKEL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a09d981507so12807155ad.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 00:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767603097; x=1768207897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNyutVNOdn9lYyBQdC+62RBrW7qhdeP17iFCxftrMsA=;
        b=exV/CKELEW7igI4zk9wrsBrWz3AxJDrIYd3mOieUjmxINyoKEW5bApRv4UPufKIoAC
         Ak8783i4rIsyww8QeEKXcIPf1UkxT5OdcLqCVaHPNscrFgLhqKe9kkqnfn6PZ0kZe4fJ
         0THye8Y2xxvneYUy/Qh/v/sSAkMUMti9WexNpteE479M2G6nc0CAE9eIV00A5M5/jpQI
         fcXCyKhlOAOHhwa9WhI4oN6qetQCKytz7Rn1wKKXjRjd/yfriermSG1Hukeu8CaAY85J
         VttoxfN51LUAh3oKWu79TKjJZxF4D8aUlO0LC4FE9Oqckow5NfXbD4KaNQukGolLhqqW
         MCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603097; x=1768207897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNyutVNOdn9lYyBQdC+62RBrW7qhdeP17iFCxftrMsA=;
        b=t5K33o6trEZZHFBEk3JRXshMQeLpyPt/mmnwK+lu1SiIlscUqURR4EiaJQ2i8Z7zlW
         DfiMnYBVXZpICDOtfb7MGQnB4VOb+yR4JUfzXLCTxC+rkd+v/YXLB6oyrFkAW6KgboPS
         k/WUM41z5f9h25j3/NOOdW24WzokmCzqOJk8aeVlZ1JmBsOGGB605k8mT0TH0Q7yL4eW
         IKP8fZ7HtvoY/E+5+Jy9LJRETnGMgeVH7tLoOTmKgUrYsbkkV4UBOb4VD9EerMaYdRCa
         LShbpm+PZC7ML1TDtHJkcH6YbCe+/BbcLoCuHHP37Eq5tvmBoSMI+LwnMmex1XHfkjhP
         YqRA==
X-Gm-Message-State: AOJu0Yy4GIU7HNZFwruOjwjOiMv7LoaHk1meG5WlRQr//yKWgRjRQ/wK
	sLoL13tNAbCwJGL64nBNCUx5Almk+zUkXT1QN6GT5Um1FP3FAgZaWFSV
X-Gm-Gg: AY/fxX7U5KqPhZJqWA0IW6eE2uiLMxdKczxjnL4CtNrNR27mDNq6g6QLNu1FT8wgWsv
	6C7D4iDoN/CuPXMdpd+q+SPD0f24XVD8491jnzJm6SOK+Scej11sOfaxqTdHmKLi7lxjQ4gfCyl
	8yBp56E/luDl8ysRvo/Y8ARE6kB1EbTos6ZoWcjmtAx0f6RJXHpyCPVedy4TaW3DVYGMH1j0Mt9
	FSrFFm1wPBKM5+2DJIbgZkxeU103ss5auhHAbJLDngHi4GhHXGSYsc2lssX4qxJQOuzqhmBQyTH
	z3UbBUPKxlcpHqFPG4V/yZ3ZHNhFrjILfFBXO+9Z+GHBvIGOm8CsgDkJ8LtBTVjTcodVDD4qqBS
	zFP6ntIHToI6/dzG33h2GLN5apcXYXydbJMrpThqbVwawGr/oMuUXwedoBtuPQcs+8P5CWygRoL
	rvaKeJeCn1hrUFL4tjQ3DDMpCbE7UM/sM2wxcyrLpRewffHiS8+IWuPa0BEwKVHdpSL6Q=
X-Google-Smtp-Source: AGHT+IHYi7ScUNl9v0xyyHGINVgQdOMBpkV5Y2gRHPqj1dPoFDyyYBwCrUfuzT59Q9HNslAaZta9JA==
X-Received: by 2002:a17:902:e88e:b0:2a1:3ad6:fab3 with SMTP id d9443c01a7336-2a3c094092emr58285075ad.1.1767603096650;
        Mon, 05 Jan 2026 00:51:36 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d2bbsm448650865ad.55.2026.01.05.00.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 00:51:36 -0800 (PST)
Message-ID: <f3246e93-aa94-4191-b09c-4d8c15d3fa8d@gmail.com>
Date: Mon, 5 Jan 2026 17:51:34 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] docs/ja_JP: fix translation of freestanding C
 environment
To: Masaharu Noguchi <nogunix@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260104-ja-howto-v2-0-8cac525b3dfe@gmail.com>
 <20260104-ja-howto-v2-2-8cac525b3dfe@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260104-ja-howto-v2-2-8cac525b3dfe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 04 Jan 2026 20:58:41 +0900, Masaharu Noguchi wrote:
> The current Japanese translation incorrectly implies that the kernel is
> independent of the C language.
> 
> Translate "freestanding C environment" accurately.
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

> ---
>  Documentation/translations/ja_JP/process/howto.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/ja_JP/process/howto.rst b/Documentation/translations/ja_JP/process/howto.rst
> index a47d7679364aa3da57b9802807a3571ca23b7122..8ab47fc710fc14da30edf75e9e415f88cb110734 100644
> --- a/Documentation/translations/ja_JP/process/howto.rst
> +++ b/Documentation/translations/ja_JP/process/howto.rst
> @@ -49,7 +49,7 @@ Linux カーネル開発のやり方
>  
>  カーネルは GNU C と GNU ツールチェインを使って書かれています。カーネル
>  は ISO C11 仕様に準拠して書く一方で、標準には無い言語拡張を多く使って
> -います。カーネルは標準 C ライブラリに依存しない、C 言語非依存環境です。
> +います。カーネルは標準 C ライブラリに依存しない、自立した C 環境です。
>  そのため、C の標準の中で使えないものもあります。特に任意の long long
>  の除算や浮動小数点は使えません。カーネルがツールチェインや C 言語拡張
>  に置いている前提がどうなっているのかわかりにくいことが時々あり、また、
> 

