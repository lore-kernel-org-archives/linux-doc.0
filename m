Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7F83AA187
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785245796; cv=none; b=I0t4yJOHc3o3nFadGc4DL9dTbZuOQgZKAsnOSQN02txG4S190/VB/4OmV0mATz7OnxqMPPs3I23mnnNWb5h0G1+Vnan4wV2gPhaVwJDdpzHpw6XvnL+84C+cp2o01lh35LYkybXfF+wtOtZKMkrllpUm0xdYlw8+vvAyNiH+W08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785245796; c=relaxed/simple;
	bh=vbgAs+zytInZMmC03u/fg4DFgbYYnZnec2JWVmP74ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4EB9+eU/QThy4D7paalVDDuabwL+SgEKjNsvSrYsO9kWUAjYjDJRf9Z64i2wn1VJYp0/HAUcxnL+qw+0iMKxzAkwPGi7N/j/RF+Mpxf1xYni5a+LDCgU8WJJjd4Bp2KzOTP4EAafRsysPCV7vOjRb5l7NebzxB6R7vWVvB4UN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URr+6M1t; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URr+6M1t"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso910034a91.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785245792; x=1785850592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VC94oBbot7aS8qu8J5xnlBGFIrty0y9sPy12nPBVO0Y=;
        b=URr+6M1tdAcpm8tiOBWN8tEEZS92CA/4IA0k6wVaPjBkxUHWS0kfDzNLSDmBgAfzV9
         Q7M5oOiRidlpZVvQAjM4wAMtup+8anMhhekdd1wBVDIDc4XSjYzFLDA+GeRxw0cMj61w
         8i9Pm7IJKL/YJk30xr0i9N+7IcFyj2g+CgTMTKdCXu9qPpnLb1pg+hCrqzrdsDSok61V
         k0bSoxH3l3WGvmE6XrrQ3ffAMKNH7En16TqfufIAu/HAhRvwwm5L1okCpWIM6ztzl2bG
         BPcG6tUbWr/dNKKGKmzIFFwU/JDTi32MR8VZTYBlR+0OoMk2tFhy5BRvw/2eg4+FIXYS
         ePBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245792; x=1785850592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VC94oBbot7aS8qu8J5xnlBGFIrty0y9sPy12nPBVO0Y=;
        b=GR2vrJL4gWRfRtl5pCuzzxEf4oNjdC8yqfcS/GFwtvq3XPeANnatm6ine6zcisdU/b
         xQ7yDH5lyAAAz7nsdJQ7MPadK++yD5QP9seV558DEznFb2NAR7k17Bzcz4v0EJKbLCVL
         6oPzdUfxhHB+sqGsl1tjXJClWbaEDHfdeqQlZquSSUh2sRoedPrPSt3AJ7ObV3jt+8af
         xPr03pj9NjB5t6bhYnPgMNxoeDGOdc7ROg9yBuY75qThWfd85BB0Jws70UxSS3Yzf/Qm
         3SJUMBZQPdQLFUuOeymzqYw6OMrxEoS8k3m0EclBcIBvrZ40XacvZ8RW6Fmp0kZsvI45
         TVqw==
X-Forwarded-Encrypted: i=1; AHgh+RoZHknBpvEQ28LOqoNBjoLzEU3Mj+b+Wvrf7qLAPyCZ6B1InY7HC6j+nV/Z6k711KbLZENuM8UDkYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbRbiaFRCRYWpa+3pWAUgPsKyJnOk0VxAY7Kk2IQLz7GWL5Gh
	Tso7xvvFi6rDkP9C0klJMoZWmd0ylPPFJGDUeGDklSKLJKzVJ3GnGWQG
X-Gm-Gg: AR+sD10GTjGECpe0yOkXZyJL9hmo36WAH3r4ewMUJ74jnxiDdU8MvYwn7vZS9AYm8Yh
	loC+jjjGnflr3KEFbV8VV2D5lZo8DMhHR9irlOrW7yy+G57cI559FUrDRBnguIWjmz6mrqoyQw9
	E39YtZrGuKxQICOvgAvwVSmV7VzdRGSC3JfBTzgJGuo/vlBvcwpPOpjT+74g82VaMBkOAI7V1/6
	Zat0QARLhg3tA0h4U4Hiuqj/9CTvNlGQVTPTmz52StDS6jA8na6mbUtsHnNd5seK5DQ6ey6bhnX
	3xSEMpFXhCdYKaOp8pUuO/Ls2hYvdTSmzDvg3UIhPJgaUn/67xZDMkOzoXSoycWqSTLfkVlNNJF
	p1Rjb5MwEUdIlyC5lcPmBP0g+wP6hC9F0+da67Oq01+kbhjSKbIW+oU7K5Cxu2VgOPwF+Qky5uI
	YMVaIat9ZY4G0SkyjjfFnWy2e78JrXbZ7y8VOOsgV7l3NW
X-Received: by 2002:a17:90b:3ccf:b0:38e:7f22:f674 with SMTP id 98e67ed59e1d1-38f6a30cf0bmr2482576a91.11.1785245791765;
        Tue, 28 Jul 2026 06:36:31 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:3a01:5e90:ee3a:3c0f:c2dc? ([240e:38b:e68:3a01:5e90:ee3a:3c0f:c2dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642e342esm1352882a91.15.2026.07.28.06.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 06:36:31 -0700 (PDT)
Message-ID: <e137128c-0289-42e5-87ea-4de791cd1808@gmail.com>
Date: Tue, 28 Jul 2026 21:36:24 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/16] docs/zh_TW: Add a glossary for Traditional
 Chinese translations
To: Chen-Yu Yeh <chenyou910331@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
 Weijie Yuan <wy@wyuan.org>, Hu Haowen <2023002089@link.tyut.edu.cn>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-17-chenyou910331@gmail.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <20260728091038.171033-17-chenyou910331@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


> +術語表
> +======
> +
> +:作者: 葉宸佑 Chen-Yu Yeh<chenyou910331@gmail.com>
> +
> +本術語表列出Linux核心繁體中文（zh_TW）翻譯所使用的術語。zh_TW翻譯以臺灣
> +慣用的資訊術語為準。新增或更新翻譯時，請依照本表選擇用詞，以維持整個
> +zh_TW文件樹的一致性；若遇到本表未收錄的術語，歡迎提交補丁補充。
> +
> +下表同時列出常見的簡體中文（zh_CN）譯法，方便從zh_CN翻譯轉換或對照時
> +使用。
> +
> +一般術語
> +--------

This is related with copyright. At last, you need to ask the original 
author's permission, and give a reference here. I guess...
> +

