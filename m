Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6FF3FCB10
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182955; cv=none; b=lI9otiXqCZaL9tssmCV1gmQ0J0G0DDHsBnBLSEew0Y+StUXwnj6ZFPCK3RG/+0niuP/ye/B4cozrDQd+G0XToY1yWwgjYh1PB78Um0FUUqg4lNu85XEk9Es/0Bb6I1vUcqbe6UmIRifAP7k0hfqMBLtn5N8xnf1gcKKCPpeTtV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182955; c=relaxed/simple;
	bh=tCjZjgBY3r9OZllLAP22YI2f1t7uM28nGSzAOg+D+qM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mqNbr+H2KlNdZNlSWCr1OE7YH2XIXA1SklZIK9okXyCXL06L48MowV6Tf6PRcZLAFYzrJrhpFwIRipzDEKu30TgqCwwmtXM6niPHMuZ4r9HHokRAuKH4DzoPJTMUiQKzGCIx+HUABGl+nj8B9SHnKwCebUwMvj8c0+NIi2pTJlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KtPLBN0L; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ab2SFtRZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KtPLBN0L";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ab2SFtRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779182949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WltqGyX6LSgbCxoNJFtaPsurvESE3OwLgIknpaUUGUA=;
	b=KtPLBN0LPhOV6tykDbTIgEbM37jh9Hg6z5VehfXEHwv5r8XVql+ZOZB/1xc71xI6efAshs
	e7JUcTB9Wdel1I1Auoju6uhYTspl+1nyOrDRTz37wg0jFNspiGzsax4GaOfVa/ycFQvYiL
	mNHdThnVRFId+Tmh8xzh5ymnD+y8b8g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-wyiI3WH_NwmIpZioyO6BLg-1; Tue, 19 May 2026 05:29:06 -0400
X-MC-Unique: wyiI3WH_NwmIpZioyO6BLg-1
X-Mimecast-MFC-AGG-ID: wyiI3WH_NwmIpZioyO6BLg_1779182945
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48fd64c32e8so22724875e9.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 02:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779182945; x=1779787745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WltqGyX6LSgbCxoNJFtaPsurvESE3OwLgIknpaUUGUA=;
        b=ab2SFtRZ/aUymUZUeseGZxWW3HwrKtlly5cy04cAV5CiTR9HG0xC3bca3h8R0bmd1U
         IkIUdqhHuhkGiNKVdpXmfprJiFw3E6JGcVL764sMHP196X9Pu6HdNiIdDezXV1wY7FUA
         759iG83jlzXt+oi2Fu050BVFzMV1OeqVpPebln5/yLqze0Tk6vavDLG9OfWf5lXkeYHB
         MwuQ1SZT65oeVY0mBXsbmrbq5vINX01xTG6z25Pr+GIyqFXW/r6Dgjc1kpFHOGKhW4dp
         yfo8sxnJgvjmEAC03O04yYdlffkJll21gWbwIlCzuuwolELbc4m5fEvZdaj9P7Ri0LIX
         itAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182945; x=1779787745;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WltqGyX6LSgbCxoNJFtaPsurvESE3OwLgIknpaUUGUA=;
        b=LTG6lyLsY+E8qRFTDo8IMtlWeuqeYQrTu6wwA93qxEWXeP+kkW2gBkRxNlBhfVoDIW
         PIauqfd9Bzn48BsSWVO7WupxoQbeen/K/Wn4tqndK3hWMCPPid5x5bdErjT7KIA7DWsW
         3J4M8DrzbBZPer26j46ZcvTyLzvTru5z8fFDNFL+J9oN5qVQS+C3v+W2J2yjl4MGiqJI
         rSTkxbtOnJY5BMY1MA7yaBenNjKEnNzGzFehvANRST8XTOTf+/expnUThX4ICIOAGYt6
         ivFHPc0H9rKhMGu7Y5r5Z9MjF8yXCw5Ty6QaoKB6s+dhcyDCBTU1N18sQ88fMjhL27fA
         42dQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vXKejZu/60enHbFqjoDORP+NXQ/Y4PyhWF9byw90tvKrY/mIBFG61D7Ukx1XiKzuOe1EbhYY4nGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzACu9E1yPEgzoNtU/Q/oQyHYBudvIApiD5gK9ZbwNSQdVuaeK5
	SBQj/N0t1cF9PIQ2RLZcrOSnD7MztDX/1o8XNVmJXDbX6ciEPFHEn5TwUXe3vIVGUY25LMKIsvQ
	4MVRzzN5JhzluQOajKAIIeVx5OYym3vml7ZTerG0I03OGwqomlj1gzMu8VjBZ1Q==
X-Gm-Gg: Acq92OEysNf6ag7M5t4TdSHpd3TEu3WhHYdIV2Ox8YXwVGQXlMWbeYgZg5ZgTpRqEDa
	9eRxbTNm97utrRaz6q4dnihXUX1QQJuNsyLiZiSxIvi9Q4fHMGW8pDCT154w8oZulaG6/XV1w+D
	R1ezNxCzR1MrdkSnselduoptx8waeGEljuTZyd3vBjRSE7aVsBije6EOaxXi0EZ5vXD1t2R2DSb
	O6Y+4OwYq044WQ5EfqR6vEV53XWd7UhrXg3yhHsn3gcooN+VTnKlmwblc+DLX6GC9F0/NcVC2za
	DDUnNhhPwJD1V03kvodsxhpBT2COQ199YJpCOIMBjv1HDJQpr/0xq10OI14McuONPMfKZbnzjP0
	7o9eKen0ilcgvH6q5fQH8Q6xPxH0B7pvF9zxv0Hnwb8EAhDu2v4oJBJY=
X-Received: by 2002:a05:600c:34cc:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-48fe59b047bmr317369595e9.0.1779182945112;
        Tue, 19 May 2026 02:29:05 -0700 (PDT)
X-Received: by 2002:a05:600c:34cc:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-48fe59b047bmr317368795e9.0.1779182944663;
        Tue, 19 May 2026 02:29:04 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf81970sm144760595e9.8.2026.05.19.02.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:29:04 -0700 (PDT)
Message-ID: <b0e8121c-e2aa-476b-b8b0-3c799e712e90@redhat.com>
Date: Tue, 19 May 2026 11:29:01 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: ti: icssg: Add HSR and LRE PA
 statistics
To: MD Danish Anwar <danishanwar@ti.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Roger Quadros <rogerq@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Meghana Malladi <m-malladi@ti.com>, Jacob Keller <jacob.e.keller@intel.com>,
 David Carlier <devnexen@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Kevin Hao <haokexin@gmail.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20260514075605.850674-1-danishanwar@ti.com>
 <20260514075605.850674-3-danishanwar@ti.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260514075605.850674-3-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/14/26 9:56 AM, MD Danish Anwar wrote:
> @@ -201,6 +201,16 @@ static const struct icssg_pa_stats icssg_all_pa_stats[] = {
>  	ICSSG_PA_STATS(FW_HOST_TX_PKT_CNT),
>  	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_PRE_OVERFLOW),
>  	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_EXP_OVERFLOW),
> +	ICSSG_PA_STATS(FW_HSR_FWD_CHECK_FAIL_DROP),
> +	ICSSG_PA_STATS(FW_HSR_HE_CHECK_FAIL_DROP),
> +	ICSSG_PA_STATS(FW_HSR_SKIP_HOST_DUP_DISCARD_FRAMES),

Sashiko noted that this statistic name exceed the ethtool string limit.

/P

