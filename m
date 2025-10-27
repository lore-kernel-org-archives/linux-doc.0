Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EAA2BF013
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761607211; cv=none; b=deIdLHRgXlouJ4T/GElAYS6gWD8Q0vk8oyyokCt/m898iC3rQWALBjEbGKyF0LpJfCOqKYa/G0LhgbZLw5G/KEx4gp6cNczgk1HfidZzjmTuqQyjJAsxsjRJvPXgYf6Ik/Xo/w31V2DiuIuL8MSLi7y+GaPMMEBwwRA3ktj1LBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761607211; c=relaxed/simple;
	bh=II9+d2ApwC/wxNtqBbQr4o0FZhWbU3TZTEczkDQu3E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IF7MrvAkjfMClm1cYC6XxmRie4voS/FF24UGNB7ezlyOCWAxWzOMzE0HNVSnR3VvzZ/8hwq/Ayl5vFUPODm3FdchpMbRP0X/r0O7eHgPc0ksnOFT3DdliVdgNgehvwp5Z3bGB3fZl4fe9Ux3VysukCuC1Ut0Wgg+Qw/VJ5ttUkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZO0EsU3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZO0EsU3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29470bc80ceso58227345ad.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 16:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761607208; x=1762212008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xi63kXliKsSMCxzduN4k+9oFp4ypHAQf4DADOGFNDwc=;
        b=EZO0EsU3zBoIMOu/bBoRCDE3x38BDbaFvYTUX0QRmU0u+LJm5b58SFhtE23vQtt5+q
         hTk6C9uzVI2/SBoLCeiB5ylN7rzHpf/uCDpl5/rovlbpnmxMoOsbmdJg4yZdmYoXmZ2S
         mVBVoxI/AF1YhD/nZd2Xu71Sy7jJd8ds3dWUOR0OBydSO+xEdS07b7JBQbW4d5kxn4YT
         wWbVluggBTde5l7Q3VhReOlIx230niKDVGs7vcyLBZHmKjn34iQp9re3QigPdMvtgPeb
         TTMbtD6vUJJICN3Jlc4xyRmQB9jKaKCw3W04WjGE9IQNGTaAGOYXtct8CS0MIt0vxshw
         LIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761607208; x=1762212008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi63kXliKsSMCxzduN4k+9oFp4ypHAQf4DADOGFNDwc=;
        b=lZ5naYY/xAuZIs7MVCMykjKK990Q6gvnKC22e3xpTzhY7yof/TcxeZCWwoqBN3jWA6
         j+e1k/CdLFjpN5PGlqA+pk9983GCyAK6OygY1fkpkPclOApInTfkFiFLM/+pZnHVaLp8
         jICtVjrsGpLPqulxS2+O7UjAi5RuQWA5miYiaFkdf0LEjpIVIyz+MdOwsh8Dc+RCmYXU
         Vl/Yu3RyBMNJ73O83XrZ0rAfyUcDWRlZ1J7Ow8RhJC738c3tp8M0qAmPy/RGmsW9USls
         FDvB/v+cBxP5J28q+c5G13oprHQab/ZDNM2PxYH+y38jfZA55Rl/klFu7AGmei2IvLZt
         rFDA==
X-Forwarded-Encrypted: i=1; AJvYcCVLRsPTC1fEHFVxW9fctDjOIb5mVIjOwaeg6Y5UV+b70eI9bhPhSkDXD2s5jPNj3rPtQGMUQ2gWChI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcCgXbkjxgycE7q2XobNvliuOXX8mq99GKxHMpb0tGHh0jjSJf
	S51b6+EQZxNJfbb014JV8s5184sQyaqfFfc7a4VNQfIvnRoJdxJJlmA4
X-Gm-Gg: ASbGncve7ju3R1sYR+2fTeb8EppgKnYBNPEGkjIqLVOMJe7WZQCfdvot/nn8pig64Zk
	VE8+8Q79SMmpPJix36FmuMh4XlWX4X++LXN99w1fU+z/HEi7glK6mHhYdbVAK/CTMYrfuSOi6eB
	t4ZI/j2anoxKgvSDNZgpc3bzidC2rMG+Q2tt7AObZqrJ/oENcSpwbP3EIeq8DWt7UQ++F/xA73u
	46zuNz33dccx/tzm+AC2nLX3fOzNWkh15hbJw6Zn55tKvRODik8XOGfqomlI/P84XZOwI3VBvMa
	jzdOn12SJaxaZEV2eZdMC8en10IDlWL7K9a0zUWR5zkg1Z2BmUdLyK2E6Hzf+BwavRBVG0sUYqi
	Z24CHEqMeCrxTkaDGza2l9JrEi+DW3mvfGCko59ekB+8GAOtK10BupaeDx30EMTEsY21MIfKm3b
	ODFgMFf4j1p3gxfvgooyI=
X-Google-Smtp-Source: AGHT+IHZ2qadCM5rYqMQYVKyhlBv5HvKNvb9k9ckLfbx8eC9hrLnINLgfUIlXvdTpmdKdXhJAT5K5w==
X-Received: by 2002:a17:903:2f06:b0:290:ad7a:bb50 with SMTP id d9443c01a7336-294cc77aeeamr10558295ad.27.1761607208375;
        Mon, 27 Oct 2025 16:20:08 -0700 (PDT)
Received: from [192.168.0.150] ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3410sm95993255ad.8.2025.10.27.16.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 16:20:07 -0700 (PDT)
Message-ID: <e1d057e9-0ce3-4049-8667-24c5050ff996@gmail.com>
Date: Tue, 28 Oct 2025 06:20:03 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] documentation: networking: arcnet: correct the ARCNET
 web URL
To: Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
References: <20251027193711.600556-1-rdunlap@infradead.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20251027193711.600556-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/25 02:37, Randy Dunlap wrote:
>   For more information on the advantages and disadvantages (mostly the
> -advantages) of ARCnet networks, you might try the "ARCnet Trade Association"
> +advantages) of ARCnet networks, you might try the "ARCNET Resource Center"
>   WWW page:
>   
> -	http://www.arcnet.com
> +	http://www.arcnet.cc
>   

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara
