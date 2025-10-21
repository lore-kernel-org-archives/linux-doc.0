Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C582EA17D
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761042168; cv=none; b=pRuOYTDfz/omlEh3lYjN0QtxgXX+t1ECNWTNcsUyufFGEi7+QA+mt05idtvRRM3IkWxGLSYorNJMP6nYeswIT4j9EtYAYCy5XfYI4W3ybErm9gjYl3karQx0qxb1Pe1k0/b++cQ8Mc78IE/8BAG83UCs+Z2YALdfkD7Fc1HSlaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761042168; c=relaxed/simple;
	bh=1A0W5xTaR9urVjOjv6uluJypcpD+sjwXrvub4CJRLF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGp9i0AxvjQ9enLrcxWagVzKbj4tlWiXXKCA9H4uQk/iWWkBat7Yn8kzA58CXrvJWx3L4Gn4BU4WxgqORIUgFhmcfsCIRRDISvfFi7y1BkSuhk3y9HUz11fTCOrOC/a5fUFEF+MWDai93ehO+t7TyVQFZbexQKPrCpscNtOkeR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g7l+S0x2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g7l+S0x2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761042166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nS+dBBoi0CBgHRidSyYtoXbkkZV3ymvifoheAJ29ALs=;
	b=g7l+S0x2+z7tPmySDEkiAVOPOhbBr8bsBol3s58NtkGuwdf8WuyM/lyZNPehME9HULwonJ
	aqX1f2iyfOHEKYplcWTwohDH3h6MWq5CQRGKfc2bkGuO2zfeyObL5h30OHH9yEojiPeScc
	2nirMPJHb32mWYhbzsOGe/qKRGp6Vnc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-uzTukj-EPU2x86KYnFgnqg-1; Tue, 21 Oct 2025 06:22:44 -0400
X-MC-Unique: uzTukj-EPU2x86KYnFgnqg-1
X-Mimecast-MFC-AGG-ID: uzTukj-EPU2x86KYnFgnqg_1761042164
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3ee130237e1so2363090f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 03:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761042163; x=1761646963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nS+dBBoi0CBgHRidSyYtoXbkkZV3ymvifoheAJ29ALs=;
        b=EYB/F8roy+D6BIz5k4HSV2zaJnqTn6ggx+taalN4+zDLPlYhcraeemZ7qNy612+OYV
         ETVMxWOUFCHF8KMqj5nYO97ItE3qsepQtzkjFauwhSY3eEhYGauWS/GAxEtq6zwEZ/1K
         7+b5qIT0Y+iCmekQCg3mFDw8VbsA1eyab14EB3HI5d96ahDgFfLRm/v8dZwjAHtFl1m9
         7JtMtQfl4LThiVrKNw/S0DtNjYmQKEdU2/Tp79PeUaS3wKtheitwn0ZjtHpbaZOOo3f/
         ERKZA/5JGnLCN7cWld4wIj+GMy9Ydu2OERqPkTQDR/I5/0YWS09rcSHMDIK5yDDm+kvh
         UUuA==
X-Forwarded-Encrypted: i=1; AJvYcCVxajudzPfrpR+DD4s/GCMOZlaytpjvZ0w5BUzlB6F2NT79DFlBQ6uJUCaWvwjzR7HhZzdJyb8I+Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVkNJiQAAV9LGbPkEP9KOXr7t3670E7i4r/GzY23AE3hF/86OX
	VT+KQN11QlhgL47nptj0E2XVsKZDbaNLtfXEPZEjkKrjon5q3zOr0lchWm8ni1lQFF/n7g+E94P
	VukM4IS9NdG9+KX0nGEZ1VLP1q410ELG0vzD30k64zf4xM7PyqPxckhyp//yX+w==
X-Gm-Gg: ASbGncspOF2XBWp0MdKkS3tIx5xPT7WMAxUoDZSlvVV4bqyj6op/wYUni7Mvz4NQxh8
	d2vv9Pq4H0VG4io0f8so5f5YMqfOPxHaBYTqHkmhYYhp4KM6j7sY5zdhJrpKa+1/IUoicmxcpc3
	WRh2raq7RgNVLdSoxu6wuz16XqSC252ilCCVC4LwyRaCDJdvt8/k7kNcmvk+NugxwkfIo2lV13W
	dR6MNdV15wZNXZvMGlIqe2bHqbRpshpe07+N8k2r0lXq4KQ02gD0+lX69Ej4/MjeQD71XmgOM8Q
	spwLeJw2VbODb9xBmZB62FfWvyaGdSrPeDMfNrh8ef2s5BkYsPRRkXLPswMFDSkQctqJuiK5XAA
	8urdjKYWmrDz5JiKJSm9n39IOKBdwmaC+SZulHiWyibXAxWM=
X-Received: by 2002:a05:600c:5026:b0:46e:477a:f3dd with SMTP id 5b1f17b1804b1-4711792a680mr122675245e9.36.1761042163607;
        Tue, 21 Oct 2025 03:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6qZ5b7OU/i07O/ltqiS9RbHNjqlvAjVcXuc/1BRt53UhZ8fu0lXE5nlb4ZYhwCLUDcfMkpw==
X-Received: by 2002:a05:600c:5026:b0:46e:477a:f3dd with SMTP id 5b1f17b1804b1-4711792a680mr122674895e9.36.1761042163195;
        Tue, 21 Oct 2025 03:22:43 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711c487dfesm268791525e9.17.2025.10.21.03.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:22:42 -0700 (PDT)
Message-ID: <e23988d5-4dc9-49d0-ba42-c3d1cbabda26@redhat.com>
Date: Tue, 21 Oct 2025 12:22:40 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v02 6/6] hinic3: Fix netif_queue_set_napi
 queue_index parameter passing error
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Markus.Elfring@web.de, pavan.chebbi@broadcom.com
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 luosifu <luosifu@huawei.com>, Xin Guo <guoxin09@huawei.com>,
 Shen Chenyang <shenchenyang1@hisilicon.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Luo Yang <luoyang82@h-partners.com>,
 Meny Yossefi <meny.yossefi@huawei.com>, Gur Stavi <gur.stavi@huawei.com>
References: <cover.1760685059.git.zhuyikai1@h-partners.com>
 <c4d3c2ef38ab788aeeb7a7a7988578eb2e70ee8a.1760685059.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <c4d3c2ef38ab788aeeb7a7a7988578eb2e70ee8a.1760685059.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/25 10:30 AM, Fan Gong wrote:
> Incorrectly transmitted interrupt number instead of queue number
> when using netif_queue_set_napi. Besides, move this to appropriate
> code location.
> 
> Co-developed-by: Zhu Yikai <zhuyikai1@h-partners.com>
> Signed-off-by: Zhu Yikai <zhuyikai1@h-partners.com>
> Signed-off-by: Fan Gong <gongfan1@huawei.com>

This looks like a fix that should land into the 'net' tree separatelly
from this series, with an appropriate Fixes tag.

/P

