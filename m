Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677110;
	b=5UB6CWlbQI3651OhUePm5aZGeiV4I33rKKbxKcg75gu11V6k4+O+DjkRZ9x9v9l191fp
	 7yuqhS0O4/YQuqPnZfBsdVO5h9ISgqvz/giIJyPBuZLLd1vmYklC8iVvFdyDwxmLm8g9L
	 34BVJ8mcdISb+/ArMQ38J6h0Ld2t15C6zHJe78gC37/NSQnog26Re/3vbL9wb8hvwn6uK
	 qKKE7QaUxKuik4rs8AzttYj3RPmw2A+e7g5DTYeqNI4L3SpKI+av793D/wICLo8pki7a3
	 /PA601gVdx+MAceeWY8nMW6vT9KVT0dPkW/exjHUFGnkCjjBu4LOkHn48Os6buT0Gqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=h0xEqPZPyZSvEk4q4GfAAXI1OYobmiwWWcxbzy243zw=;
	b=JrP3ZIrZn8IbzOAvUpp212PYu/8vSpf7eI1Cw5PgDR5Dore1gj2eyE3yyj3nyIezsDoM
	 GZpq42kqq2D+NTWSSt3CW7FKcE7vuVL90DxnVrtlZDnm0u1zu2StaP2pXWIMngkKJCGLO
	 gZ2YZlzSnT/kB029bDjplvE7wjJiK5v1ktU6MRBwH5XIh81ZueYHePNaqR4hWJQbaIbbT
	 81Cnvv2Ost15ho1gCoCzQFvp8Me3ncJddoZ9EK9+riQX13rXVMlUSSPm4HsWIuW+bVlM/
	 R187b+QrVbIGFVYxSwZE4+VnCoaxHgJkCKYhA2nraTzF/wVlxzAq8DXODtU9dC+e47Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TEm/dmZH";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AF1606A323
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71AF1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEm/dmZH
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1021762a91.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677109; x=1795281909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0xEqPZPyZSvEk4q4GfAAXI1OYobmiwWWcxbzy243zw=;
        b=TEm/dmZHhBs0Ple8gwcpThb6q4glfvu0ea46PbbTPWpZa3Qh+gyuWm4CpM5B5ZJ2IH
         p25p+zNz1m4drXpInICQlnfmXDtIPakmU2qbY5whTtRlSMtH44PIIfNsexDaE+GvOWVN
         EttuqLOaoZOGeRu5ji8sqs0zsP/DHqM7MqY2N1UB4O+wcK9MYXI2M8K7MGkBARDDK9P8
         palj9CUuGQxpCvaKn+q243Cw0qvMgzjJyhXeHtPxxvZuMbKIWDMkboGsMGtzA8kGijuF
         MrMaOOmml6cxeEIw//cIaqJ9Df18+DvB5r+5fSPBu+DEy61mOshL7euL4e80wMyT14OV
         cIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677109; x=1795281909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0xEqPZPyZSvEk4q4GfAAXI1OYobmiwWWcxbzy243zw=;
        b=J5Kt4yTX8EfFzdYtH/Weg9BigThBubWNN+vxH/+Ydfof6PiePn0DBkl42uOseVHe+9
         6LM2LRdP9GslTc4KO51eCaJhmcCKp4vCD+32hUm4aQ7IhqsR7j9k3FJOM6SAFycaYO0d
         BVuctZ0I/kpnqoTcM3N7n4G0+lq4WSL6/hWZN+oO6B42cr9Quk+kSn8pH/4lTkXIwHoS
         q1VUWXcLIYFcQ6wucamfVjW35LrPJvfGTWCAKwCVtGKRZRU3KKv0/8/02QDISUAC1VjD
         lDXIMJ1OgsoW/6M55ZeudztPR1ZO4cyqrAAMOwESq2W7OY44MHdvTjWbXnKFoXPowpdE
         c0eQ==
X-Forwarded-Encrypted: i=1; AL+hErHVnbG3q0D+Y3Ooe/qb9H2/zZqMsGyzWFpJTqiZQ/fuOxnM7Sj3PwllOfUQuLd7T3cl82oTAZDhsN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1J8Qr7o6w2ZQ76ZiTc76VX/NXSgHnWKYjOe7YQM3qeV2VNQfn
	IbXxg8IEhhXF1mBysYVjWFe0ky4XpYIV4J3a6Uh0BDC+iMnzlvm5LDza
X-Gm-Gg: AYBFou1YeIGR5a401L/VhuzkqO8KHcLayJz0NxB++iXYEW9+Vxtb15ydEXAoOFQxAHY
	s0iK4lwHPkgWbDg6OaD4FHwLLTrHFn4JbAohfKsrm1cWAVxFS6TD2hBxZ2LUkKg8FgcxCP86uNe
	gFYg7tVXvmeuxj5+lTiaI6AznVQOUvDqheKxWqogFz7UjP5rjIOMW92uFuj7KBejUlPpeCQodnj
	dU+XB03noUfWTdTdQr2EYMtv5t2O8tF2Zd8QuMoiwi2fS96hVc65cYLu5XVfTHIm4NH8PHuH5sX
	FyKJEzCx8sS4t8gXcbXq+L3ojrXE+u3V5LUdXnJRB2sztObSwgCvWIBvhQ4qJyAZjoE/IIMJnQD
	ZfgH9DlTK/zwy9aElhvone1IDwE8VIdRA5FERuspvDJ9RDri7tucIl5r1zABIqnSIw3KQXNj+EK
	Xa9l6Xj1JWKa1nla82mqMlbadxJlOSAgd+IuwUqo3CYM5IIYO+d2WJlg793YheFlEP5yjGR9GUS
	bvwSZsPeMycx9z5GYSPZ+rChR1r5ifyvyIl4KYb2iCzFvWgMvb1nZO1iU4+k3dNxQ8LZawChph7
	uRFmB4Zk9CBfoary8Sv5E0p86+OztNsMjnStENKz6iadnw==
X-Received: by 2002:a17:90b:1dc8:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b1b0b5becemr3918051a91.8.1794677109388;
        Sat, 14 Nov 2026 09:25:09 -0800 (PST)
Received: from [172.20.11.208] ([64.141.80.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce49d6sm14999864a91.4.2026.11.14.09.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 09:25:08 -0800 (PST)
Message-ID: <dcaab84e-cd40-43d7-b747-51f490d4e8ff@gmail.com>
Date: Sat, 14 Nov 2026 09:25:07 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel-docs: Update book info
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261114124813.1056807-3-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20261114124813.1056807-3-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 11/14/26 04:48, Manuel Ebner wrote:
> Update info about Lorenzo's 'The Linux Memory Manager'. The source is:
> https://nostarch.com/linux-memory-manager
>
> CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>   Documentation/process/kernel-docs.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/process/kernel-docs.rst b/Documentation/process/kernel-docs.rst
> index c67ac12cf7..dd5bef154d 100644
> --- a/Documentation/process/kernel-docs.rst
> +++ b/Documentation/process/kernel-docs.rst
> @@ -79,11 +79,11 @@ Published books
>   
>         :Author: Lorenzo Stoakes
>         :Publisher: No Starch Press
> -      :Date: February 2025
> -      :Pages: 1300
> +      :Date: Spring 2027
> +      :Pages: 1350
>         :ISBN: 978-1718504462
>         :Notes: Memory management. Full draft available as early access for
> -              pre-order, full release scheduled for Fall 2025. See
> +              pre-order, full release scheduled for Spring 2027. See
>                 https://nostarch.com/linux-memory-manager for further info.
>   
>       * Title: **Practical Linux System Administration: A Guide to Installation, Configuration, and Management, 1st Edition**


Reviewed-by: Carlos Bilbao <carlos.bilbao@kernel.org>

