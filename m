Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B003AE6EE
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244904; cv=none; b=nOaTdoui7IU4GIZoWY+lPrvXpD4f5bgjG+7+6ucS42UAAeuajF4Wd9bDEQN5d36BVnqN/25JqQr7WIgqMdeTQYSdycUtSWmfjpu9+t2o9lSBp/Fe73vDFgkU0LGo9w3bWfjmXCVcBoIfMtPQFg+qBU4d7eBIo/r6XR7/ESIINuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244904; c=relaxed/simple;
	bh=OSYChhkgL9QLYey1/J92a/3Xa/25vRaPcOHe0XnyVg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PT1MJbalJ7m0vH70HCsfG+sG4v/PikkWTP+UlYcRk1BB8yS2J56e/jvLEm+ues1riytLK38IMCX0sHW1ZBQuk4FGqFFa5qY/kOdJbTzafebSJ5wneNqytZM109nhFiRUtbiyJ+KU90ntAdcEE6OQJgchHWwFPYZ1Jj/mi6A/xuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b6LNihfH; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b6LNihfH"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d556c1a79eso75289a34.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773244901; x=1773849701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+XHylZPD43sAa0o/s0snunFXKESFhlWC7FjRf+5pW6g=;
        b=b6LNihfHj4zmwmUhHoJMDn9lu6Z6P+/WprEkwJxmXOnMTT/tN9Y72nWw1vF1mWPUsw
         KlGIA2cLtKkv0ZdMT0t+QiI7HUM0wQkdgBC1HtJpZY03cnU+yxO1Gp9o0U5hHSBHxOYR
         3kNN1ZGUQScQXymv9GNQZ56ke4tM9YicKoGRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773244901; x=1773849701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XHylZPD43sAa0o/s0snunFXKESFhlWC7FjRf+5pW6g=;
        b=mdE3gxlpKZHfjmC2NwreViQUJHK395WWYTZmnOx+Ap2pKTzQXLRQAJxuYcek80tNYh
         O1kxfwBSnQlqRNOMkIgGyJoMHoPFYNgzOmv2pd3UdPCYfCoHYjvsFJOZD4F9U4HeOVWU
         8PdPG1E754PL5MkSeRymklvGowP5kyIeM7fzwzvFV65KLvycFsYUCARHvh3sW1p9vsY4
         6lPlg/LlO5xDzNzczliZPzgfRFt3eL+hleUgEbbULWj0jdPLKyMNIWO7WJuTvpKCb5+J
         C8PNl13eigHWJY3CkcfmpPVk0dF1OVlRsIhxTC42uSnAWN9w3h7Gkm7jlQuQ7Dnn4+vB
         BLMw==
X-Forwarded-Encrypted: i=1; AJvYcCWi36PxFQ0/Di5lDF7Ws8nfmvCC2xrNiqWV3kvMkqxisG17Uu5LvJ4lfgdS1xNcE/Ml1rilfaB+6oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNtQgp1hvY6g1zlWzwhWypjBjtjk7Ry2IiWT73M5fRlSh4umrZ
	Na0QY8WPJO43jwY3owOAcasYQyIxQxQdNb/nBvXmJUiQhObncnHfqn9Iu0/D8Tgpv38=
X-Gm-Gg: ATEYQzx7LGd3/OVYeUqx8YxwAonBNWDmIiW+L6yQtR1Ob5qLCMkgOy0jHckVM9Yycuy
	UaYXxkEXSnRfLm/JlwohjXLgcyFOPSOzPRnaGHgeOwapZ2IK/xdHPmUktT79SSnKZyN++nhQLwc
	sBnS4WGtH+sT1KoOwu6t2qYsYDpgd1yJ37EQG6VkLu8p4lu5LW9XDSvoddfAzwrDM3y+HRyr/HY
	2Mj795R11Nd0qzQEVSoCrmCqBS7FFjlS9izw24PweWInQW4OzYQCIsiuPy+1csqExFC23ACb/Fd
	vB3u7P/Q4Sy47KnxEQdAaGfxMQhMNMSIOIlnTrMuIv8K0k1W83YXlK3wck9DwHkFeptSn/12kue
	KjiapKWe1HUKeUULO4rvV68wnujbPGI0C0/rwQaLvLzA9Mjc+Kf5Xj34nShbqm8AC5wNVskyquk
	rHeKvSNqLXR4NQH/YwOTfOtqSNKPR8Frx2E8Q=
X-Received: by 2002:a05:6808:17a7:b0:467:268d:31cc with SMTP id 5614622812f47-4673349dd90mr1688611b6e.26.1773244900597;
        Wed, 11 Mar 2026 09:01:40 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-467342ef6fesm1473123b6e.14.2026.03.11.09.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 09:01:39 -0700 (PDT)
Message-ID: <426c282e-862f-400d-9989-f3a572125dd3@linuxfoundation.org>
Date: Wed, 11 Mar 2026 10:01:37 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: octeontx2: fix typo in documentation Fix spelling
 mistake "Crate" to "Create" in the documentation.
To: ShravyaPanchagiri <shravy112@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com,
 hkelam@marvell.com, sbhatta@marvell.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, Shuah Khan <skhan@linuxfoundation.org>
References: <20260311024312.6760-1-shravy112@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260311024312.6760-1-shravy112@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/10/26 20:43, ShravyaPanchagiri wrote:

Missing change log. Instead of writing a very long short log,
you could break it up to add the sentence below to change log.

  Fix spelling mistake "Crate" to "Create" to "Create"

Also there is no need to say which word is misspelled - we
can see that in the patch.

> Signed-off-by: ShravyaPanchagiri <shravy112@gmail.com>
> ---
>   .../networking/device_drivers/ethernet/marvell/octeontx2.rst    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
> index a52850602cd8..c31c6c197cdb 100644
> --- a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
> +++ b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
> @@ -323,7 +323,7 @@ Setup HTB offload
>   
>           # ethtool -K <interface> hw-tc-offload on
>   
> -2. Crate htb root::
> +2. Create htb root::
>   
>           # tc qdisc add dev <interface> clsact
>           # tc qdisc replace dev <interface> root handle 1: htb offload

thanks,
-- Shuah
