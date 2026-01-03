Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F2E2F3C12
	for <linux-doc@vger.kernel.org>; Sat,  3 Jan 2026 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767429910; cv=none; b=bIa/kGPDLOxpJEzs7Mk88ucAGtRMkd9SNExFpNymI+Pmn+jF7sZ0YZhdcGoSwIzDAEzShNU0nvX7F7ZnWFHynIBScSFpuxaxadeRcEw8lMfi562rKVJmBG9W+swKbMNd/MfuZ2tdqcHwpev05xT8uyY5UKlu1QbmBT0NXxUukNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767429910; c=relaxed/simple;
	bh=/CaF2iN8pMgurqn4wpbSboetmoIjsdl4fxR7dHGlIAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kt9JpIdHPQ9cpg4b8L0zDGjDYPcKuKIMXCAwUA4h+sZhpKAr5Y1bSm3O7vp3i1a7TAsRihkaNzNHLbHVJfdqMdIRnzGpVhjfqQLaP6xkyP84mN5rvZc96STrEndGlXblvzgLhjDVjDP2/k0nmO/MFkmXpQLcS6/+ZyniQnjqwXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmImi084; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmImi084"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0b4320665so196064105ad.1
        for <linux-doc@vger.kernel.org>; Sat, 03 Jan 2026 00:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767429906; x=1768034706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wr4cUp9yuTMrNCmPZq3B1VWoJTYFXAF5+yz0p1y/2Pc=;
        b=lmImi0844dWmq+z7UkRN0WhRKPqZrg2TUtLsB22tPvcnu7fkv3yQ31wFEdBStQpf9Z
         MjtJadoUXo2552/5iFP9Ig69GhilGDlbHoONfIDZ2XF4DBkfxEimofhWNk3a0XgB8yCa
         DU4MBamOssfZVK0OU1D2Xbe8GR01HzMqUb/nB99gpk301SbjKsC8bnImF2uWpkBl+GQW
         G6x3+gMCW6CfDQ6SqeRpUjbkXxPGT7ubhDIYKp8X0ovNFveroPZDqBsvzXq+gwnpoOlg
         DRJ2Hw7XCpITlEN36o8ZLiQEFXmQq3x+KYJvxzi/e0Z0ygIWKlkdYC8SBWDpWTIzo+La
         8LIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767429906; x=1768034706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wr4cUp9yuTMrNCmPZq3B1VWoJTYFXAF5+yz0p1y/2Pc=;
        b=jLlsfeeNSkVUsaJ5/gzkvenY3fRPd4+BQiJa5lE1clpVcAwsXsJ+0vxgymISfIFqfE
         RazAzxuPczJ3ELaLwoKOmQqys6ul04tLCCK6lixV0Ud44SSbXnm41rJ7NjW1ovvZwKIi
         Sn1rw33gagWKSS2HDNezVXZ0RVcqbovm8gnsYkfrv71nIhFXuOO/2CbidJWoZYUNKqsS
         wKy/u9ZUAyLliC5BpUQy+pazQIY1izIgNSQlKz+66HqIjB1KA3QI8NWL+NYO+6Xu05wb
         88jDJZGB5fDt0OsPMgobRYDaw2Gcic0fcpzSVI3+VoJdoxLyMyN21Eu5RISCWWW9gl0G
         oa+w==
X-Gm-Message-State: AOJu0YyyRsOWx5O4d/U2qTDZv0jzoc+88BXD0DvIWcOc7zzA1f+PIzep
	C/sowiLhk9A5iTXBeUx6sJrqP5N4hwRxTdl7JHff/RcJzMZI5k8wYHq8
X-Gm-Gg: AY/fxX6u3ZKxi3AE2NKcgyz4GVBS1beR17RYDtvz6HAMDoC6SNe6kWbiEogmLlbHidi
	vLoVRlXSEuKBV39ayhE2CHQgePYyLXstzq9KH0Oq5ku98tRiK4ET9O3POsG67p6NMAOPTY4GisO
	Jqj0ivPGySjGmXUxSZveUuHixH5eVjlbZe/K8DTCaqugv8NYy9bHM9XewtERhW2HXHZec5L4qYL
	I6nWWYwRm3iTXL6rBSrmoqfaw6bRPg16OU3UHq4S3ky93LUPTpNDJmxMIQB5ThCdvHAT//1IiE3
	uVsETng4AbcGzSJMyAF2T4n+pjkWCshT8f5DlGNiUIWWcpUtR4/cIwM9ZT0QvhYK5lcU37nTOkG
	Jqdw8rrumINo3+dzRv6YqCdEJUqjlDlm5zUzMIgy3Z3y9aYVrqx6RvFiCMnHlrtKRGFPmSu92x9
	LvfdekH7BOChUv6xHO2r+Ph8A0M+7ecDcE9PqSHqSzobI9emH1pdLTlDNT
X-Google-Smtp-Source: AGHT+IGYex9lV8Fx3n391YEmcQFYTjU50yabLrjuS2U01ILLSzGcIwwuL0zHKbOM9DAAYpsIWKBuqA==
X-Received: by 2002:a17:903:2f50:b0:2a0:d636:71e7 with SMTP id d9443c01a7336-2a2f2425b08mr462056515ad.13.1767429906427;
        Sat, 03 Jan 2026 00:45:06 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d407sm394290845ad.72.2026.01.03.00.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 00:45:06 -0800 (PST)
Message-ID: <bb248145-096c-4e2e-b95a-0ab8b6c4370e@gmail.com>
Date: Sat, 3 Jan 2026 17:45:03 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/ja_JP: fix typos in submit-checklist.rst
To: Masaharu Noguchi <nogunix@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260103-b4-practice-docs-typo-v1-1-d68ad6a22ab5@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260103-b4-practice-docs-typo-v1-1-d68ad6a22ab5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 03 Jan 2026 14:42:39 +0900, Masaharu Noguchi wrote:
> Fix spelling errors in the Japanese translation:
> 
> - "Menu attibutes: default value" -> "Menu attributes: default value"
> - "Documentaion/ABI/" -> "Documentation/ABI/"
> 
> No change in meaning intended.
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  Documentation/translations/ja_JP/process/submit-checklist.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/translations/ja_JP/process/submit-checklist.rst b/Documentation/translations/ja_JP/process/submit-checklist.rst
> index fb3b9e3bd8eea318bdb9985238a9be66ebafac26..c118b853c44ad525a90b486e26a12347b398897c 100644
> --- a/Documentation/translations/ja_JP/process/submit-checklist.rst
> +++ b/Documentation/translations/ja_JP/process/submit-checklist.rst
> @@ -52,7 +52,7 @@ Kconfig 変更のレビュー
>  1) 新規の、もしくは変更された ``CONFIG`` オプションについて、それが関係する
>     コンフィグメニューへの悪影響がない。また、
>     Documentation/kbuild/kconfig-language.rst の
> -   "Menu attibutes: default value" に記載の例外条件を満たす場合を除き、
> +   "Menu attributes: default value" に記載の例外条件を満たす場合を除き、
>     そのデフォルトが無効になっている。
>  
>  2) 新規の ``Kconfig`` オプションにヘルプテキストがある。
> @@ -75,7 +75,7 @@ Kconfig 変更のレビュー
>  4) 新規モジュール・パラメータが、すべて ``MODULE_PARM_DESC()`` によって記述
>     されている。
>  
> -5) 新規ユーザースペース・インターフェースが、すべて ``Documentaion/ABI/``
> +5) 新規ユーザースペース・インターフェースが、すべて ``Documentation/ABI/``
>     以下に記載されている。詳しくは、 Documentation/admin-guide/abi.rst
>     (もしくは ``Documentation/ABI/README``) を参照。
>     ユーザースペース・インターフェースを変更するパッチは、
> 

Nice catches!  Thank you.

Acked-by: Akira Yokosawa <akiyks@gmail.com>

> ---
> base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
> change-id: 20260103-b4-practice-docs-typo-eab9f424b792
> 
> Best regards,

