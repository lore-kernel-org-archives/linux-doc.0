Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A865C148850
	for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2024 08:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732781316; cv=none; b=pkGbTptUJfYTulV5fzMFEHYTVc/jhUG7cQMd040JEyJ0wGvNY6Eb1TpXxCTnhcTXDh0Dz8gnfdGLrKlIOqahj7gg+6H504EjNcP8yMloiP39VIn8HQeCuwe7mGugah1m6wORGv8VIvGnBZ6odqhvemeJ3hVMKonpf1Uqa6BXboc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732781316; c=relaxed/simple;
	bh=LqKrHC5XDSttnyGGxHHcASvJVoryjRYX4TBifEno7Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZG3W1RxawXO1vMXr81CsMdS2/BuXJDW4GXKG6wDr7OqxWcCcMIZ9RX132aaNDhll5Iz5JRjdG05iWfK6b0QQ+mqW5WJf2zaM4M4DtbLgBg71QK6Z/Xvlrt5GSgIcOolAclblXAB1pY8z5jw3H1UoYKvGGVoxHjGe8kA9rfQ2BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FXDtxPJk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FXDtxPJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732781313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iB3fddQT4tuu1zwH8z5Ad5r52CJZWD+J8s/aw6uP5ZM=;
	b=FXDtxPJkG9dh6kMf11vIM/KwcDNXm4miFdG4PUFiUn53UcefDeNl8yIBWKJf2ia7cGduxD
	HNrCa6IR8jqdkZv0iRxiIaJjOIrnCSf0wEiUoxZHtTAMN5WhZ5SxeCYlqs2aCgMwTs4+F5
	unZJ1Tpa3qgA39YT+FiZ0LkzFRIr3DE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-pT2E7jYrOkeQkC00OwCq8w-1; Thu, 28 Nov 2024 03:08:30 -0500
X-MC-Unique: pT2E7jYrOkeQkC00OwCq8w-1
X-Mimecast-MFC-AGG-ID: pT2E7jYrOkeQkC00OwCq8w
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-434a27c9044so2577415e9.0
        for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2024 00:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732781309; x=1733386109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iB3fddQT4tuu1zwH8z5Ad5r52CJZWD+J8s/aw6uP5ZM=;
        b=s2+uBNoHYs7B/U+ZEdK3HqP8fdqhOh10tkyALaLql3bcu7uw0ILkbs9jCVKgwTIqpr
         UdZ5FLyVjgav/Ph9xaxE74eBHOF45NV5iUow9g7eW3qwXVSlijn0DyjUNX5K28lUu2Aa
         PEYHdExE4GIMCU7XRmCpBGrNbYo79IB7ccN9HnnpTnbFESiq55SpjUb445PZo3C68Gwh
         MycaluAkb7JksyAiwJywdCR+QgvZizw0x9DM28nz34SCth4yXqSTGWWqcSBmL0BY4b0/
         JaIbR62OiWL4WoyBQd77PhT6SK8MkvHJkOWNdbjPSyMFwNIJH5MO4f05YKogwLlPWQe2
         HQGw==
X-Forwarded-Encrypted: i=1; AJvYcCVIHIrYeRa5M0ogNh0XH1FI8YT3jC4xcQLXJ4IcPMEg2fgDSnCWX+wHVP1PFkK1K+/2jZMjZJKZEtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDgsolKuC/hKBE8yA7PbS7zJFC8AhUsbQQ9sSTFOpUvE5l+v4L
	o/bET2sH4hSiXt5SjUKCYoKFTxZe6zD3Wws/wwARDegUof/TVyy/vqu9246WmTZVS5xGK+H/QTU
	4UUrHVKTJNDyTGfe9+43PmODWf6vjuD6dNTGyT/zQ4kAzqrtXCAc8lLMOfg==
X-Gm-Gg: ASbGncuI+qTEHxzYIDGB/FDyRs4oOeOcdvC+tE+KjAo85XwIIvKvlyUmW9NxV69VlF0
	mHA7sFCvDpgBza2bjGVEKarSJ+Ia33OwVIi+pYP6KnaG6b7r8lbxEBhpmX1BBdn9uHEVjIhz3sM
	+zcFTkTNXzGr8yD2QqVRwEISnjFphVOGd7WHk3vvkwNMZOatqkJm0cN5g/xOie5cDoNFZcPUIZO
	7aBdoZOWDhJKnTtEKLf+MG/uMpQZ0tC/31f1T1jvNObd56tqYnm4+bnvIbBDcZbsVaX6sM2v5xu
X-Received: by 2002:a05:600c:3ba6:b0:42c:ae30:fc4d with SMTP id 5b1f17b1804b1-434a9dbba7dmr54214945e9.7.1732781308911;
        Thu, 28 Nov 2024 00:08:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGk+Ev0FiGTZ+5npTOH3uvSEBKkeXq267aYhyzXY/a73ITNd54dI3/rjALeAZ3U75RkmBZRsg==
X-Received: by 2002:a05:600c:3ba6:b0:42c:ae30:fc4d with SMTP id 5b1f17b1804b1-434a9dbba7dmr54214665e9.7.1732781308551;
        Thu, 28 Nov 2024 00:08:28 -0800 (PST)
Received: from [192.168.88.24] (146-241-60-32.dyn.eolo.it. [146.241.60.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bee2sm13761925e9.1.2024.11.28.00.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 00:08:27 -0800 (PST)
Message-ID: <fc0bb8a7-8c6e-49db-83ba-f56616ebc580@redhat.com>
Date: Thu, 28 Nov 2024 09:08:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fix spelling mistake
To: Vyshnav Ajith <puthen1977@gmail.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org, corbet@lwn.net
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241121221852.10754-1-puthen1977@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241121221852.10754-1-puthen1977@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/24 23:18, Vyshnav Ajith wrote:
> Changed from reequires to require. A minute typo.
> 
> Signed-off-by: Vyshnav Ajith <puthen1977@gmail.com>

## Form letter - net-next-closed

The merge window for v6.13 has begun and net-next is closed for new drivers,
features, code refactoring and optimizations. We are currently accepting
bug fixes only.

Please repost when net-next reopens after Dec 2nd.

RFC patches sent for review only are welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer

