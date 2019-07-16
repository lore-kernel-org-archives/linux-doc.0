Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8E51A7D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Jul 2019 12:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbfGPMPX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Jul 2019 08:15:23 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52622 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGPMPX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jul 2019 08:15:23 -0400
Received: by mail-wm1-f66.google.com with SMTP id s3so18435380wms.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2019 05:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G49xlFZQIpZEZ4HZu+OG0eRgWg0SMkAve+hxHnDX8Yo=;
        b=PYDQGSdb8Ou06IQ6uIcRzy7mqzxR3rSY2FuCCQusLWbpYafO0jNU3ju6H7LfGJB94M
         rItgwRQY1qZZVHOUcU6AoA7KKSL+l/oewpkQTzFFyZLfNjTFxo2mTewrPD9M0cwOXaIb
         KpabVzrKwcFqQ6wSC6mZd+Dp5alcG9wA+z8YO0WxCUGS4V7r+44sGacQI/Dzixh6p5mi
         roiR3Or3ufknpqi+3sPmj178qPoehHFus2kNRNFfEdlaeikFLyT0R7mIV4ClJb/VoBCJ
         K2KA7udiNH08IFLPd2gbhFP5yhlDIl/go4bFIdXJwVwVziy/xHYGkSZQZe/lz4nzL9Rc
         y9ow==
X-Gm-Message-State: APjAAAXBlcpH6wmLxSFsNaQZ1Eq+pX+1jYTutR+yenxiDefBMfsl4gn0
        z5UxUF64Fc5kw1+DfXwmqIqI3A==
X-Google-Smtp-Source: APXvYqxAiYdNmDe395zHwRdMYB7YKpmc/1OxHgeLC6jP6813mcCsyTIe4yLVvoevv0i/tSWh6Niimg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr30658327wmk.79.1563279320853;
        Tue, 16 Jul 2019 05:15:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:bca4:e0e3:13b4:ec4? ([2001:b07:6468:f312:bca4:e0e3:13b4:ec4])
        by smtp.gmail.com with ESMTPSA id s2sm16599332wmj.33.2019.07.16.05.15.20
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 05:15:20 -0700 (PDT)
Subject: Re: [PATCH 14/14] docs: virtual: add it to the documentation body
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org
References: <cover.1563277838.git.mchehab+samsung@kernel.org>
 <4f3cb004a5597926ccf930e123cb063cd99f1cea.1563277838.git.mchehab+samsung@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <ecd9b68f-cc32-5340-e657-e1e8e4370a91@redhat.com>
Date:   Tue, 16 Jul 2019 14:15:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4f3cb004a5597926ccf930e123cb063cd99f1cea.1563277838.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 16/07/19 14:10, Mauro Carvalho Chehab wrote:
> As files are getting converted to ReST, add them to the
> documentation body.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/index.rst             | 1 +
>  Documentation/virtual/kvm/index.rst | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index 68ae2a4d689d..2df5a3da563c 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -115,6 +115,7 @@ needed).
>     target/index
>     timers/index
>     watchdog/index
> +   virtual/index
>     input/index
>     hwmon/index
>     gpu/index
> diff --git a/Documentation/virtual/kvm/index.rst b/Documentation/virtual/kvm/index.rst
> index 0b206a06f5be..ada224a511fe 100644
> --- a/Documentation/virtual/kvm/index.rst
> +++ b/Documentation/virtual/kvm/index.rst
> @@ -9,3 +9,4 @@ KVM
>  
>     amd-memory-encryption
>     cpuid
> +   vcpu-requests
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
