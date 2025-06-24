Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6EA29AB1E
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769643; cv=none; b=rbgkcvvuuwoQ6PYQ//groc3FTtk5phmJgB1t5stxsAyqDaMiCKofqih+cXoLRFFpSUXDMnri97+e0L6jQvb1uaVNCMRoE95J7832zPdhNH6s83iZbMtnmZWybQGEaPBqE+8bUhFNyKobRhgpU52v/WZfL4VQAaK4AglefSagliU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769643; c=relaxed/simple;
	bh=2kOE0t10Ys08qMax53uN1Ij++jJiV3VlExemldFQM8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cjk2xACbEcBCld0CSdbe87JoS6vTL+jo2gGdPuNX7+bIws2PC6ywlr1SjHESpe05aIZuqMUJeHcsIvmDAVQMJGsfYYJDpMxeLZyjaDqtEQXYplk14UGmNoZw6xA8/MCHKWgWaFk8mK0vrhwcP3ILkyMZ2cbr/2VOAB/iePXn7G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UmQVu5Hq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UmQVu5Hq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750769640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T1zTpwcC335IMGuNVVSMsviTgOOTgO+DQI5xktWwQcI=;
	b=UmQVu5HqnY6DnVKVatuvmHBBsERCTrUiqBDjAUBB9a6bkSyxkrrqxUfziLMqZ7LV0syaw2
	FaSK0gLbMiV8L7TMa4Tm/7+p3BQvg9PDdL0/bPxWgmibK1+MHptoZj6SIcrwGKwkNXukRK
	Qz51IkDDoIHSCjcu5O6yiqhIHtVIP7c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-R2Jn6Px2P1WIbmBR0owr8A-1; Tue, 24 Jun 2025 08:53:59 -0400
X-MC-Unique: R2Jn6Px2P1WIbmBR0owr8A-1
X-Mimecast-MFC-AGG-ID: R2Jn6Px2P1WIbmBR0owr8A_1750769638
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4537f56ab36so2722385e9.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 05:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769638; x=1751374438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1zTpwcC335IMGuNVVSMsviTgOOTgO+DQI5xktWwQcI=;
        b=MA13U+w7rOD7QxoR8NCI+9olzQT99d4d5hNcCKb0kqYXMJRiB7MfwkSP3V3Ep+Ukpr
         VKv8iV+jKEIpgMzycjTWa97gBasxViQG51E0AY4Rek9Jmpy+oOvi31pyFDdSc8djwdEK
         VhU3+S2r0YmMZiDdKVbmB2VlZ2+sAewzaLwZkuS8YW7jm0oJt3FXUs4y8OW+jGMFCuEm
         GYnIRGfJvk+kzPI/aEDQ9Qs4o3LksgHxmGbq+yQQZiJdsYs+4QOQLi/odnxAEUS15FTH
         9RjYkieBT7N5JssSjA3OGx5yREe3hDU2dzS73zxlY8MeQ1MIo1BbwjTBpqJcBuEwY7qp
         UE8g==
X-Gm-Message-State: AOJu0YwNE4l+Yxfm/MQH//e09JJcg6FIQ7ToCtp1kbPW6pVCznh8fRdQ
	7zhUcHAHBhHdt8LEzscC8iGDvdJS4Kd2akpcgtDjT6Q+xv0tpPvUV+R8TYFBLYv7hPZy/gQf2en
	AzCA+ByvM4mN1KY+Qb1gMIRFM6j5fhzfTh7B90cycpLwdqq1TDy8RtknnfQgJ/g==
X-Gm-Gg: ASbGncvpQ7upNQAZALLrPKpra6/iPcTrT9LZ5LKeCFP+X1jxdejXHPx9OZqEg2VwhNp
	9xemnCYnjgfH6lPtgnpJWN+bmDjtv3j1YSjEACAnBJ0Ja+nYKkRavN7jRS1Dqf8daIPs9t8KasC
	c6+80bS1BEWEkUg7gcCceRC3XaOD4VTElE+wJB46AubSAfWG/lkz3OXfbSGn8ZiFePOnJwzy3Sq
	PQxRnTsNC6NX2BHfXUOTDOB5GeHQMiIM+LFjSJf4wEbdBmldWqhJ9RQViFaiZueHy35+ZZFeOMO
	6JbfaNOyIpeC3kySzj8b/Z1MBCjSNQ==
X-Received: by 2002:a05:600c:b8a:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-453658bac1fmr127799345e9.20.1750769638128;
        Tue, 24 Jun 2025 05:53:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY7lMZVaWFiRWIPG8b3cMXMdvCcNTK8MZjjGLVmokK+tCuYyoVQ5c/x3K3fImoxj9zLjbwsw==
X-Received: by 2002:a05:600c:b8a:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-453658bac1fmr127799095e9.20.1750769637706;
        Tue, 24 Jun 2025 05:53:57 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646dc761sm139345745e9.17.2025.06.24.05.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:53:57 -0700 (PDT)
Message-ID: <fb0f1e3c-2229-4860-b46a-b99f6dbfdfe6@redhat.com>
Date: Tue, 24 Jun 2025 14:53:55 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5] docs: net: sysctl documentation cleanup
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, corbet@lwn.net,
 davem@davemloft.net, edumazet@google.com, horms@kernel.org, kuba@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 skhan@linuxfoundation.com, jacob.e.keller@intel.com,
 alok.a.tiwari@oracle.com, bagasdotme@gmail.com
References: <20250622090720.190673-1-abdelrahmanfekry375@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622090720.190673-1-abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/25 11:07 AM, Abdelrahman Fekry wrote:
> @@ -593,10 +629,16 @@ tcp_min_rtt_wlen - INTEGER
>  	Default: 300
>  
>  tcp_moderate_rcvbuf - BOOLEAN
> -	If set, TCP performs receive buffer auto-tuning, attempting to
> +	If enabled, TCP performs receive buffer auto-tuning, attempting to
>  	automatically size the buffer (no greater than tcp_rmem[2]) to
> -	match the size required by the path for full throughput.  Enabled by
> -	default.
> +	match the size required by the path for full throughput.
> +
> +	Possible values:
> +
> +	- 0 (disabled)
> +	- 1 (enabled)
> +
> +	Default: 0 (disabled)

This uncorrectly changes the default value: should be 1.

>  icmp_echo_ignore_broadcasts - BOOLEAN
> -	If set non-zero, then the kernel will ignore all ICMP ECHO and
> +	If enabled, then the kernel will ignore all ICMP ECHO and
>  	TIMESTAMP requests sent to it via broadcast/multicast.
>  
> -	Default: 1
> +	Possible values:
> +
> +	- 0 (disabled)
> +	- 1 (enabled)
> +
> +	Default: 0 (disabled)

Same here.

/P

