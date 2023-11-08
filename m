Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13A03033C
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BA2lTtmh"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3046D1BF5
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 07:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699457539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ewskCS1rF9gOVBYcI4anbJ8kNzbRSyhUgQwAklJHaeU=;
	b=BA2lTtmhWi/VLJWzqUEDECrcBcOgnWUkNuG818L0EmP3TyBv0IQhO91XdA6hOQEPkHgxPB
	WZcEu8IAwLvkAIPj1/RAc9wiMQ+jBIC26Pe9k0WAcDZsr1piPrSiqwfRPkVU1gCYRLhWG0
	4VoCg99t4ACkQkHH7nTSd4NPYfrl4Sk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-Q_JFqS7rO5-sFzCB6VNEPg-1; Wed, 08 Nov 2023 10:32:15 -0500
X-MC-Unique: Q_JFqS7rO5-sFzCB6VNEPg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7789a691086so811182085a.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Nov 2023 07:32:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699457535; x=1700062335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ewskCS1rF9gOVBYcI4anbJ8kNzbRSyhUgQwAklJHaeU=;
        b=HAeG85ykETjALq4V+qYZiMJ7vkF9cmDqHKCTZkZ7ikw6rtoA1sv38CL42mxLUCDs6O
         y5qBhpUzl/x4sauPYOYIJXURDAbWqXSBKmUi5PiOsgTv5sRGrwS0Dkv46wRco4q6B8wg
         TK5A92kG/TNcjgmRyjwiP/hWzs5cw4vHQeQa/35kCICOYLXk+LRGMIcZPLUEtnZ4EQS/
         W0478m+8gEdH81DAMgoR7e+WuXkEa9urqT6i4NYYIxst3aGPjlQ0khJIySguLd6V1gZC
         UK2As06gFf9CcQdmt1e/xsiIT5pD+6Rsb1p6QBG3tve7Dtp5rGQbMdXbTx06sl4PvKa3
         FQNQ==
X-Gm-Message-State: AOJu0YwS9oc48HvDjuRHAoqVDNwnkqunQnsxpwBUnWlUldwHI29rP0Q/
	VElUU7eHoAkPGxaH9EUUGliyHJUA38il+VXOOW580SDXu9fXYh9OeL0Vvb+vY1IexbhmhL1zhDE
	GYGGRPwFNpcRAvwFmxQLq
X-Received: by 2002:a05:620a:bce:b0:77a:76c8:24bc with SMTP id s14-20020a05620a0bce00b0077a76c824bcmr2431342qki.45.1699457534999;
        Wed, 08 Nov 2023 07:32:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+05dp/d4w5qESRwSH9UXiHx3gamIz41M+iD584uZhxsaLrmlTItJlkFaR/98f9dz0F85Fww==
X-Received: by 2002:a05:620a:bce:b0:77a:76c8:24bc with SMTP id s14-20020a05620a0bce00b0077a76c824bcmr2431311qki.45.1699457534699;
        Wed, 08 Nov 2023 07:32:14 -0800 (PST)
Received: from [10.16.200.42] (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id f16-20020ae9ea10000000b0076ee973b9a7sm1152477qkg.27.2023.11.08.07.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 07:32:14 -0800 (PST)
Message-ID: <99645b01-f297-48ed-81f2-b6ce186085d1@redhat.com>
Date: Wed, 8 Nov 2023 10:32:13 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Enhancing Boot Speed and Security with Delayed
 Module Signature Verification
To: "Alessandro Carminati (Red Hat)" <alessandro.carminati@gmail.com>,
 linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20230914112739.112729-1-alessandro.carminati@gmail.com>
Content-Language: en-US
From: Prarit Bhargava <prarit@redhat.com>
In-Reply-To: <20230914112739.112729-1-alessandro.carminati@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/23 07:27, Alessandro Carminati (Red Hat) wrote:
> This patch sets up a new feature to the Linux kernel to have the ability,
> while module signature checking is enabled, to delay the moment where
> these signatures are effectively checked. The feature is structure into
> two main key points, the feature can be enabled by a new command line
> kernel argument, while in delay mode, the kernel waits until the
> userspace communicates to start checking signature modules.
> This operation can be done by writing a value in a securityfs file,
> which works the same as /sys/kernel/security/lockdown.
> 
> Patch 1/2: Modules: Introduce boot-time module signature flexibility
> The first patch in this set fundamentally alters the kernel's behavior
> at boot time by implementing a delayed module signature verification
> mechanism. It introduces a new boot-time kernel argument that allows
> users to request this delay. By doing so, we aim to capitalize on the
> cryptographic checks already performed on the kernel and initrd images
> during the secure boot process. As a result, we can significantly
> improve the boot speed without compromising system security.
> 
> Patch 2/2: docs: Update kernel-parameters.txt for signature verification
> enhancement
> The second patch is just to update the kernel parameters list
> documentation.
> 
> Background and Motivation
> In certain contexts, boot speed becomes crucial. This patch follows the
> recognition that security checks can at times be redundant. Therefore,
> it proves valuable to skip those checks that have already been validated.
> 
> In a typical Secure Boot startup with an initrd, the bootloader is
> responsible for verifying artifacts before relinquishing control. In a
> verified initrd image, it is reasonable to assume that its content is
> also secure. Consequently, verifying module signatures may be deemed
> unnecessary.
> This patch introduces a feature to skip signature verification during
> the initrd boot phase.
> 

I think this is fine to do.  There is some risk for users who may use 
this without realizing what they're actually doing and then would end up 
creating a security hole.  But there are far worse ways you can do that 
with access to kernel paramaters.

P.

> Alessandro Carminati (Red Hat) (2):
>    Modules: Introduce boot-time module signature flexibility
>    docs: Update kernel-parameters.txt for signature verification
>      enhancement
> 
>   .../admin-guide/kernel-parameters.txt         |  9 +++
>   include/linux/module.h                        |  4 ++
>   kernel/module/main.c                          | 14 +++--
>   kernel/module/signing.c                       | 56 +++++++++++++++++++
>   4 files changed, 77 insertions(+), 6 deletions(-)
> 

