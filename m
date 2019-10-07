Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6F07F7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Oct 2019 12:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfJGM5g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Oct 2019 08:57:36 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44398 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbfJGM5f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Oct 2019 08:57:35 -0400
Received: by mail-pg1-f194.google.com with SMTP id i14so8140836pgt.11
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2019 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aocaeZMfZ9hT1EEiaU0xOTMc3IJ4VzpKaEgRI9ie5fE=;
        b=ZhFbFiiHtCKCosV3Gn2FCXKw9AwihfF7XQVdDSBeJotoyhlPotRUTaFyDjpxxeDYSW
         zzCnGqhAMLPCa9e8K7S8zZp1ZPZTiUf63TJyFoNgHPqWhwMFFvBCe5R+0YVMqeqMkGNi
         DOpodt8yK0JIErdl9cOqzT2fxarJfNk7SbwuvkzDzTxuxxzawyWNvn2Or0xk+BXhLYJZ
         Q0Lu2dHJQjcJrqmJ4WWdD/AcKKY0WhurGy681WFnCwzdy56fZQuUddB4HUbzl3NxqEow
         S0H1QCL0KJCkCAOu5xawCvfI2QvSVB5fFK4TutzOfsIRXRoji9ft6HNOPlMvoEe54kVY
         yQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aocaeZMfZ9hT1EEiaU0xOTMc3IJ4VzpKaEgRI9ie5fE=;
        b=kMOAa3+SKEsIKuYs9pY6mfGPiocNQShM+5yrGp87lW4K33rSJhzaoyKgaar9WSslLh
         tuar2pSOU4YF8PVPrudgFCnLvpuGy5YvNddMh81oO1QwaemGd0TvCuhPIl6tHsxs2GWP
         O67gQBvc9+nTFlUqj0mC/Y46hQnzEGlRFJJ57dJH2/Vhm4VcXTrFKfOVFZFJxIJxoliQ
         GDsjs6GQTlVPwqjRGn5q2d5EljTm9kAWyCgfAmaPoTCk0/agllyUaVb4ywk4K9b0bJMc
         Vbzgcy/6xXA+MOh9g+a4y2IwA5NRTFH1HF29D7GAHccEkO8RmCEtj6aAZHcjK5VkLanK
         MlQw==
X-Gm-Message-State: APjAAAVpKGdaIEcp/OGzRyDc2uKpUAXRK+LaWeHhHv7z4QJdEc75cRvS
        Mvtyyaf8ACzHk/35AZ9DrdV8Kbip
X-Google-Smtp-Source: APXvYqwpQWt17c1aiiWWkDfoD1HdCFAKyu6Jp+nRJNcxbpXOs8zcZJxXL87+a/pd7gr6IKyscNa/aQ==
X-Received: by 2002:a63:d343:: with SMTP id u3mr25087580pgi.313.1570453054873;
        Mon, 07 Oct 2019 05:57:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c16sm19066294pja.2.2019.10.07.05.57.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 05:57:34 -0700 (PDT)
Subject: Re: [PATCH] hwmon: docs: Extend inspur-ipsps1 title underline
To:     Adam Zerella <adam.zerella@gmail.com>
Cc:     jdelvare@suse.com, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20191007023657.GA24341@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <328fff33-5640-88a6-145a-590ba43ccf58@roeck-us.net>
Date:   Mon, 7 Oct 2019 05:57:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007023657.GA24341@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/6/19 7:36 PM, Adam Zerella wrote:
> Sphinx is generating a build warning as the title underline
> of this file is too short.
> 
> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>

Applied.

Thanks,
Guenter

> ---
>   Documentation/hwmon/inspur-ipsps1.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/inspur-ipsps1.rst b/Documentation/hwmon/inspur-ipsps1.rst
> index 2b871ae3448f..292c0c26bdd1 100644
> --- a/Documentation/hwmon/inspur-ipsps1.rst
> +++ b/Documentation/hwmon/inspur-ipsps1.rst
> @@ -1,5 +1,5 @@
>   Kernel driver inspur-ipsps1
> -=======================
> +===========================
>   
>   Supported chips:
>   
> 

