Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43DD376BF1
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774253517; cv=none; b=ic/1vZzjC/hyNF9sjd3R2kqOUBcv9jajV7vHuDH7ltVBKA+v2TboNmjtuf2hexkvWOuqXVhQ+gNLobP4kkO9RbCoz3x26QO671U5afmJBd+ZyfgzTWFp2SnUtvm0LLUh6fQRcTi7JFUkW+VI6TT5SfihjBUm0aYLFUGuiaAZTt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774253517; c=relaxed/simple;
	bh=u8TwhwwrgHTBSTQKg/VxP/30hE9odmYKXI0gLQEmKD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYo68Ae3COhes83lgIsdQxq4nOdq3yOD9aXFoZCYH7gC4ccBpJcUvcbGoXQZiwoB9V5dhtR8oZsOmAxjStVTsUiKrihJ2iPioQ2puub0ERxV9CSdMoy7vc16/RyOfwHRzuxF/BnnBkYfy6R2wAyicWjulICraw+g8OVUfVwcjPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4wUbuM3; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4wUbuM3"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70f91776fcso1715534a12.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 01:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774253514; x=1774858314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8AUcQbexjBVMetrU5a/fon6YbeCsJd71yudyAgtyq2E=;
        b=O4wUbuM3JjOtKQQfp/vLgyTV8YyxcesypLgBKhCK7ep6jqMz4+SRx/n4ig1A/HwRl/
         uliytsze6YTuxIgz9mK0i/ULxM3NhYXvpO4+6O/LH9rwwnvyKfs3g6nh7LvCTwgVuNqu
         OF/wZekkrUdaJzA4gXOrbk8P+60znIi/c78QZskhHHKJXeCoxvADtKG/QJZukwHcvzjM
         kA1wjW5AA8Lmcztd1yDIIwnQ1CaktTFheF2yh0tKlAbeeGtu4jx2H+/4+y2kTgxiVNVV
         NUtZ2PmMUdjezB9v2lwmZhQGemmqSdzbHCVIzx9bkjuTYrVCAj0fHthjSzyGGqxcGkPS
         iNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774253514; x=1774858314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AUcQbexjBVMetrU5a/fon6YbeCsJd71yudyAgtyq2E=;
        b=qeYpCCmtE55EHTcUHij0vu08DdrGiDfXbKdF86d/TjRScYObzIWzKrbozdDNJMrZAs
         Cl94F1Z0bidzDe4XOADidf810WcR3wm7IK5q5v4HOv+4YzA8E/9kDP3Ie6twmFJ8MTLq
         4RVgC7OpiPbmVtDqxzJHLKyWnlkq/uFS2TjwYr75YoIH+87YNq4wFM++iiT5oaw2WYLG
         nA9Zq6DZNYN0AFOAdxZFMp6AVHIv+NSz29Jahkq4Pp2coipntLJJTvZ6Zig/qzYsvMC4
         XSYDuVZGWcrmPh8BQMRiGgMUPalXSO44VHSfbbQxvpShC7XWCbkXmZc+9pOVAUbX9iF3
         XHMw==
X-Forwarded-Encrypted: i=1; AJvYcCUAKhJCBWtCj1nsrAXd/rtJVkn67bDUc8au32SvmZNcOeLMMti8jzlG9DV+Kyx25CPu3JJRs9KY1rI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsVFMiyXR/hWIujcm5+3agZswkqBt5c1BWy9+8janQcLEhT+/V
	3YJ3BcsBRESoy8R1RyLNNUOhWvaIOkr/IrDecqQaZ3WvWO3AK+jtRjph
X-Gm-Gg: ATEYQzyOd+ku/DtXAmrydc6TcmhwMJQR5Cp/WoT7qnAZE7OKjjl3WoTo9IIjKta1Y4O
	UNKd7h1TEWlfjEJZ9d3Md1aeEcPjxkepHBZ6HPpYteALwRO25LxKeyhPK/4JhEr8SVH2XGtTq4a
	H6S3Qk4cCQ3KzR8IlUquS8HuoXCLjWs87aaoGBLn1uQHqyapMbsIrK4GNQJOej/9sPyWeQVBIgh
	mYu3xaP/XUJGtaKjgExeNQmZ1zz+sCTMInjJ4+4oDd7KifCMpe1sE/YoxaRYOlznGZqH15DPEO1
	Gt9Zc6/rZQ4avSKCeKmUeduwFEEs8/1I+tGXVUru75to7U3SfT5eTvj/JaNlAtUGL0IciUIfa1W
	8W6GZMDtMVRpwqSSg6bGjeKgP4OQajltrfpBunPapel9PMNYB3pN3SaDF/+tmgaykw0XVGrlkGT
	/g3AHFWd4fYWNp23K3xuJ+1KN6mFxphwCo4y2mUtwa43w/YD1HPUZFXq5EgDrWsmJNGzdy
X-Received: by 2002:a17:902:f60d:b0:2ae:829d:3c33 with SMTP id d9443c01a7336-2b0826c3d65mr108877025ad.8.1774253513855;
        Mon, 23 Mar 2026 01:11:53 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836744a5sm100532345ad.63.2026.03.23.01.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 01:11:53 -0700 (PDT)
Message-ID: <68e16682-aba3-4e10-8776-1c04c55b7ddc@gmail.com>
Date: Mon, 23 Mar 2026 17:11:51 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ja_JP: process: translate second half of 'Describe
 your changes'
To: Akiyoshi Kurita <weibu@redadmin.org>, corbet@lwn.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260309105015.309116-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260309105015.309116-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Sorry for the late response.

On Mon,  9 Mar 2026 19:50:15 +0900, Akiyoshi Kurita wrote:
> Translate the remaining part of the "Describe your changes" section in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Follow review comments on wording and line wrapping, and cover guidance
> on self-contained patch descriptions, imperative mood, commit
> references, and Link:/Closes:/Fixes: tags.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>

Acked-by: Akira Yokosawa <akiyks@gmail.com>

I have noticed a couple of minor translation issues in this patch,
but I'd rather submit a patch on top of this, rather than comment on
those issues in English.

I guess I can prepare a follow-up patch within a week.

By the way, now I see why Kurita-san is wrapping lines at 30 wide-chars
or so.  I guess they are broken that way so that each line corresponds
to that in the English text.  That makes sense.

Thanks, Akira

> ---
>  .../ja_JP/process/submitting-patches.rst      | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
[...]

