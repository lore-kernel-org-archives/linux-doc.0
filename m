Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B35C3D78
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 00:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f6dVS94Z"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2E32117
	for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 16:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699837029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JSnhv2PPOYa4ZnCU0cai1bmRuczHu96zHiRWZODUn4U=;
	b=f6dVS94ZiMK9DgCqU/Wdz+xtA4ECxiXWJrT29KeRNoTqdUDNU+KPGII84sTmlCJLcjFPL7
	lYYFWm7A5VuCN6Dt9EOjFgx10CMokMSJK8buxGs01LyCZ0YIIa9KDdsRDp7y4C41SbvxZR
	OmXOFRLJzCOJ9MCmqRAQcsNU9JjSIBA=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-eSC-fCwKOTCDlaNl4J8eUg-1; Sun, 12 Nov 2023 19:57:07 -0500
X-MC-Unique: eSC-fCwKOTCDlaNl4J8eUg-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5bd26ef66d1so4602701a12.2
        for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 16:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699837026; x=1700441826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSnhv2PPOYa4ZnCU0cai1bmRuczHu96zHiRWZODUn4U=;
        b=pDbVZa7HYFm5+eQKidCClMCSkk/M4zsCS3xfgbhPT5SQ281gk/FQjUb+rBctEna20C
         uErGd37wiaEZZxKRyd6t7xJrjtHFCEzckjApMtkgPku3HDiX6OVBGd0AB5mIYv03c56w
         UWyZxcdKZBkoB/N3lYU0Uv/NfmkqXQWse0dp2YK7YZRckrkTyWqDOqwvUbInZqF3fuZT
         usldjBGvIQV9T/f+fDmJfmIccTp0WDyng4NoK7DwkExXDeFnK18lQVE9TmaaUQF0L1OM
         USdJzqe+2Euo1awTU0mXHK1SYdopqU5FOlrMVLjXsL8c1gA8f4lVQTGCzz0yvVNWwMpi
         pISA==
X-Gm-Message-State: AOJu0Yy6tOEgIrdP0hZFYaQ1J6aExqjxR5pzcTSzqWX1L/zOw+jmmT4g
	7+lXxf8Y5vwP3eLiCB2rqphdnGCB8czYCObw2FXBZlt+uyGvaTO5K6CasqjUtU4tMpKHLBKZekk
	7SCDEVnsQBPc9Q2SuQ0uJ
X-Received: by 2002:a17:903:41c1:b0:1cc:5ed4:7b4c with SMTP id u1-20020a17090341c100b001cc5ed47b4cmr8056795ple.35.1699837026069;
        Sun, 12 Nov 2023 16:57:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYB8Gjvjb9rpzJlKa/gGoy1/kAMp5o6DcRuutNzYMQOmMyg/HSI8WRyf/v5bwebYCVyW6+ig==
X-Received: by 2002:a17:903:41c1:b0:1cc:5ed4:7b4c with SMTP id u1-20020a17090341c100b001cc5ed47b4cmr8056788ple.35.1699837025799;
        Sun, 12 Nov 2023 16:57:05 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902eec400b001b03f208323sm3058989plb.64.2023.11.12.16.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:57:05 -0800 (PST)
Message-ID: <2c597d46-9e15-4059-9386-a811fa7b65dd@redhat.com>
Date: Mon, 13 Nov 2023 10:56:56 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/22] drivers: base: add arch_cpu_is_hotpluggable()
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
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLQ-00CTxK-Ln@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLQ-00CTxK-Ln@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/23 20:30, Russell King (Oracle) wrote:
> The differences between architecture specific implementations of
> arch_register_cpu() are down to whether the CPU is hotpluggable or not.
> Rather than overriding the weak version of arch_register_cpu(), provide
> a function that can be used to provide this detail instead.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/base/cpu.c  | 11 ++++++++++-
>   include/linux/cpu.h |  1 +
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

