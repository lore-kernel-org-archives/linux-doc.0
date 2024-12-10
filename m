Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C172D19F461
	for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733831778; cv=none; b=XJoPinz+dVrUhYRKPR2hs1QJP2e33a3B2kjEKEtiCuDvpuNQ4FGujXcGAhsu5+NQYGC3E3OQw1loooKSZs47jkQBl1SkrlCgnUsbp3CIWngGGXXfAocdh0bk+TdArB3fVbqBKcMSIrHgtkWkwlYeYWr3FqUr2BhFLu7UeS/sCfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733831778; c=relaxed/simple;
	bh=9D30XLU1YqyFDqV1u6rGU63M73Y+CHh8wTylgtao8T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVS/LeVZzrr3f6SM9/eIHBPwpGbZFjZ9qKxFYZob432WzGTkjs/kvBkBgRqUffp2FeQGfhXHpVcnvwx0iZlgoEvVlTrRckyaCG1RvYCNrSUIRZYPOYe/2J0xIgV8R/YziI+m3zVVItSgQrIV6OPONWdScm9QnXIDBRMNNeMFH7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fs8mdwvD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fs8mdwvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733831775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9D30XLU1YqyFDqV1u6rGU63M73Y+CHh8wTylgtao8T4=;
	b=Fs8mdwvDKqvK8HSpMnWMtHxeJRgSgQprpqrbd/hpkMA9g4TVU9Rc6Il5xCfxMCui2E8MRN
	FNU/qOxPin3KOLtNEtpUJAWQw9EYjn3rBuO/GIBV2L2hvup4Z8yXjQNPPDAGtYiFBCvcWX
	C1T3wAvzDb9AXuVdgaA5Df4/u9pFhMo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-CrLMuxP1PGuENzsSYgwNVw-1; Tue, 10 Dec 2024 06:56:11 -0500
X-MC-Unique: CrLMuxP1PGuENzsSYgwNVw-1
X-Mimecast-MFC-AGG-ID: CrLMuxP1PGuENzsSYgwNVw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-434f3a758dbso20504505e9.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 03:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733831769; x=1734436569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9D30XLU1YqyFDqV1u6rGU63M73Y+CHh8wTylgtao8T4=;
        b=Z7FvSkzgzWj7pZRoKMFdbA+uLUeMzsd9TOQZGh8q3/VZRHkFs8kkoqFva1N1uXAgX/
         uf6gQQ3u8kSirrdFpFDrf3xefhcwZ/38pUODZHhCKPaqzjuX44xY6rySo6F+20UUPv91
         wchNi+YDsvQQbqi9grP2k2ql08R01b2yICR76/v3Iy28zGtqJVHvlnyvcCeElduFHLcY
         32VG7TYNc/WcZXJD7DbfiHDKr1nTRixZoJGC4+CLv2v/sJw6jTmT/3JxClThkis7+uZg
         UTiA2ysGAQBjhLy2CMvWnoF7Qp+5VPKKPNpnueSOk1XhXKN4qT08NupNF8WvAC/I/O79
         iqsg==
X-Forwarded-Encrypted: i=1; AJvYcCXn+plNUCCRQ+0bVoZK8rChbTPOS8wi21Pu5PrPX06zKsGGiSm+V57r+owHBQ2xH8kd5vPn52AOU0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxvLk9+L1YZym4yQoSIl5XA1gQ0j0X0lYyB0/BzsJDk4hqp1PC
	GvhVqQAcYkBCXAdvi/2nywxBaPEUVvKasCh0tt6BZ1/DOlM4dcJEVMZGET7ZyEoODZtRi6/EEjj
	PTVuyV8ontObZxiEPEo68sV2grVxiL377//tx5OTdo5+7RjxBgw+y7inOPg==
X-Gm-Gg: ASbGncsxfpwPVZdAmY1B7LMjxtf88dGNtXm5v4h6RP3sYfzLj5AVMxtE83fJdBLDxK3
	Nd0lNkNyjEWVLwhUM33TP0n35yAUwkGE5H+fXnr2KJfyiy7jhbHDwdbDaYRDSq1mDSytE4Z15zZ
	0T+/ZArge9NG/VPhUKTKXMgvFp9abOyW4cepXaGjj2F4E1+Dqhz5T+sQtYuNPzuAwvNQDoywazT
	w+a8HmgDX3FjYQImCSb6cnI/3RpgEzd70ixcbTYJK0sSNg0KTT0D5Pz7tKCrk+wHEHUxrZFQtNE
	a6N4pPwJyysqh5ryhJOPhHs3zA==
X-Received: by 2002:a05:600c:1da1:b0:431:54f3:11ab with SMTP id 5b1f17b1804b1-434fffc8aafmr36672185e9.33.1733831769654;
        Tue, 10 Dec 2024 03:56:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBbN8A080kEtPt9BMjRTNDgrzEK3dfC71r4vFm7hnAFt6/No3fGb8mFcxtnMlmtMYyN/pmAA==
X-Received: by 2002:a05:600c:1da1:b0:431:54f3:11ab with SMTP id 5b1f17b1804b1-434fffc8aafmr36672045e9.33.1733831769373;
        Tue, 10 Dec 2024 03:56:09 -0800 (PST)
Received: from [192.168.1.14] (host-82-49-164-239.retail.telecomitalia.it. [82.49.164.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da119a96sm191300075e9.40.2024.12.10.03.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 03:56:08 -0800 (PST)
Message-ID: <e6a812ba-b7ea-4f8a-8bdd-1306921c318f@redhat.com>
Date: Tue, 10 Dec 2024 12:56:07 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 1/1] net: phy: Move callback comments from
 struct to kernel-doc section
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-doc@vger.kernel.org
References: <20241206113952.406311-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241206113952.406311-1-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/6/24 12:39, Oleksij Rempel wrote:
> +#if 0 /* For kernel-doc purposes only. */
> +
> +/**
> + * soft_reset - Issue a PHY software reset.
> + * @phydev: The PHY device to reset.
> + *
> + * Returns 0 on success or a negative error code on failure.

KDoc is not happy about the lack of ':' after 'Returns':

include/linux/phy.h:1099: warning: No description found for return value
of 'soft_reset'

Thanks!

Paolo

