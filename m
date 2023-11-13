Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65638C131
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 04:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ddN/1lfd"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72114173E
	for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 20:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699848576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2bRjfP7yOuv9SAdAE0QP2CBFoAYrMs60Lu0SjYCCHg=;
	b=ddN/1lfdvUBGSAGu5PZerh23RF6OFeaJH24xWBekE2DG8H0aoVtdRNk70NAe19ront2h0f
	A+0O61KlzAG5mKZnzUo8OEp/Dnr0m5rSoTnrLe+cvKqC3Q/faRoAin/YI7h1/6144L32yQ
	DrNxQwyJlck+0YtZk7yLevhqMKCxkcY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-CUZ5-iBHPMmq4atAi4Ay6g-1; Sun, 12 Nov 2023 23:09:33 -0500
X-MC-Unique: CUZ5-iBHPMmq4atAi4Ay6g-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2800e025bc7so4044744a91.2
        for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 20:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699848572; x=1700453372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2bRjfP7yOuv9SAdAE0QP2CBFoAYrMs60Lu0SjYCCHg=;
        b=c3L2BAMTHMKNoXLn6acQKsYqShRM3fCrX3glaSv3rBLwwUItVC/XAXOxBJMwnzMxrX
         Uk0MUU34H8zESVXBKDwT3LHUXjV6qyTLbC4QW40+xc4K0KRdUUHOnHoCIEG3498u1tUP
         OD95XOUVTrKWbkwRV/JN+eAfzHQjU9W9Ff+saP47J14jP5UEKoiUlmHjiWX8GdvTs74Q
         MY3Yxcsub2xLSTYPpxMCjznxV/AZS26sQDgWjAkqzr7e8DKA+OHkYbPRBsPtLOe5eu6Z
         kHuhAC0j3aSCPEEIwy+ldqWZ7d0PrNeb1np/fH7xvpjpUPgGu0YJ+8UQNzlQlZbQfvAg
         lzug==
X-Gm-Message-State: AOJu0YzgI0jGYm4zaWSVWKKo6F3nEcZzTOQIOLFiX5ZTrghNVlN3HDai
	enhUE3QjgNUHhxcJEMHeiNR9bqmCGInqiNVxtL9cDgZaFIfrYghV2hiDyTwF1rVj9EMhrKsh/VT
	XCsiVTcCmUvucON8Eced6
X-Received: by 2002:a17:90b:1a8c:b0:27d:ba33:6990 with SMTP id ng12-20020a17090b1a8c00b0027dba336990mr3197164pjb.10.1699848572561;
        Sun, 12 Nov 2023 20:09:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2k5SwVakWG7zKK4WUWbKBo4uYLTXEgbcXMEekUsR8f4+eMr6ksf4A21GkOdsMSomj6DSw2A==
X-Received: by 2002:a17:90b:1a8c:b0:27d:ba33:6990 with SMTP id ng12-20020a17090b1a8c00b0027dba336990mr3197155pjb.10.1699848572281;
        Sun, 12 Nov 2023 20:09:32 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id b1-20020a170903228100b001cc3098c9f8sm3225162plh.275.2023.11.12.20.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:09:31 -0800 (PST)
Message-ID: <55e640c3-491c-4f55-b432-a41f48405a02@redhat.com>
Date: Mon, 13 Nov 2023 14:09:25 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 14/22] arm64: convert to arch_cpu_is_hotpluggable()
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLq-00CTxq-CF@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLq-00CTxq-CF@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/7/23 20:30, Russell King (Oracle) wrote:
> Convert arm64 to use the arch_cpu_is_hotpluggable() helper rather than
> arch_register_cpu().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   arch/arm64/kernel/setup.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

