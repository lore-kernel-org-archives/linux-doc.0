Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W8b8xMzq"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE2A171F
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 19:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701402481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lkYkgQb1oSonM5Ah318XDYvX5RNZmhN/5LooxGJ95vQ=;
	b=W8b8xMzqUkxOrqytylop2P45XZpFjvsavV5pZXo+tGWZbO9elj9KP6uJYne8jUIExklptg
	u6ww96604We+YyRgjyBXFBhxAJsfo0CKdg8IrtDpcONUpMnHCCUGkz0LpWYqnlFdyW02Bv
	SGE3hrPWZgKRYdTLnVWafXUopmHJa1s=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-qjJddMNJOKyrz9DdDFjsQw-1; Thu, 30 Nov 2023 22:47:59 -0500
X-MC-Unique: qjJddMNJOKyrz9DdDFjsQw-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6cdfbba2c4dso678993b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 19:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701402478; x=1702007278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lkYkgQb1oSonM5Ah318XDYvX5RNZmhN/5LooxGJ95vQ=;
        b=OGPZoFcV77RMCPbyL+/xAGzWqKpszs98PfIFeEZhtoFgz2QAk+aJTqFRMkLLypiomR
         9gRP54guu8dB262PV9grLNVRApdUonRwzehQVNF2N7OtTY2mggdprNX0CyLtNfWxg3+X
         A1Zwx6U/teqB1IfqYP/U8ppik0SRzcnfTnlgY598GHlQDjYcl8IkBcY+LdvN8ksFUg69
         9mbLm5BQr3SptZcUAWqy+HxDnrRTNGmQM0qFzvxAhG2AMdPG3Zxq5Nb+728NQWfY7gjU
         qww+13r2E/a2MsSofgTcF56Ekdr/33mCqhxMpDj+Br/YtPR69gFLkP1Cc6JiaPDbUEcw
         twFQ==
X-Gm-Message-State: AOJu0YxIJi7wrKRCLeRG056stpfvItVAtV7HxFcutjtaNvqJb7/7Ot8/
	canGb535BmQeTlq0RhWH2I16VqUlL32ceFe2fI+5DeBAFfjX3gcg9TFEW3Z7ToQn/q/Xbag15eS
	3KYPFNtdALyoBabIH9ZiBVKgjYtfL
X-Received: by 2002:a05:6a21:3513:b0:18b:236d:3f0 with SMTP id zc19-20020a056a21351300b0018b236d03f0mr27000771pzb.43.1701402477951;
        Thu, 30 Nov 2023 19:47:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhKtgcw5NHksOzMAUau0Dc/qB+PpJdNsaezOVmfl0zRSeeAEUNdBUUxpUuWqCHC+jsRZjfoQ==
X-Received: by 2002:a05:6a21:3513:b0:18b:236d:3f0 with SMTP id zc19-20020a056a21351300b0018b236d03f0mr27000757pzb.43.1701402477684;
        Thu, 30 Nov 2023 19:47:57 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902e74500b001cfc1a593f7sm2185691plf.217.2023.11.30.19.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 19:47:57 -0800 (PST)
Message-ID: <c01d4958-1cf7-4428-9d97-f6a893f175ce@redhat.com>
Date: Fri, 1 Dec 2023 14:47:49 +1100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/21] drivers: base: add arch_cpu_is_hotpluggable()
Content-Language: en-US
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <E1r5R3M-00CszH-6r@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r5R3M-00CszH-6r@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/23 00:44, Russell King (Oracle) wrote:
> The differences between architecture specific implementations of
> arch_register_cpu() are down to whether the CPU is hotpluggable or not.
> Rather than overriding the weak version of arch_register_cpu(), provide
> a function that can be used to provide this detail instead.
> 
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/base/cpu.c  | 11 ++++++++++-
>   include/linux/cpu.h |  1 +
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

