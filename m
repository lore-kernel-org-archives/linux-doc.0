Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 333B97D085
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Jun 2018 16:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S964891AbeFNQwS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Jun 2018 12:52:18 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:45776 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964870AbeFNQwQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jun 2018 12:52:16 -0400
Received: by mail-wr0-f196.google.com with SMTP id o12-v6so7144675wrm.12
        for <linux-doc@vger.kernel.org>; Thu, 14 Jun 2018 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KpB9FnWs3wUeLUnB/j2eOXcY73XZQo9x3/NiFvH51t8=;
        b=XccGtTvJPRf0jBaxLaxqtYS5+Gx5xcIeYzXsf0ddJKbk+4BeSh9oXLxw5LVihQ2q6p
         mk69o+B5Evz/w3OYWLDRpjhEJoikMtIKwg5LXZLO+gTj3lji6e6d6Nj4aQOaNz02LTuc
         tG3DzJlDfTUJ+ruguCgLTCQHFqSss2QIIwa0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KpB9FnWs3wUeLUnB/j2eOXcY73XZQo9x3/NiFvH51t8=;
        b=qUrR8jTRYMt9UKQiGrjURkrcQT8KyDzhBD+SvtgDPVY4k04Ge4yUTs7WT9ZG2twqGf
         W5TKYtUpgcE26nA1u7OOSekWq9HqNuDqBjAeyD7sFqHS0e/Gdtjmrug8GcIXoWec8EQq
         JKNxrXLUPFi8sg22LwYxrR8n+SSBvbj930ff5AQT14owjfyt8xV72M47e0kbgccyhOKq
         Hn7CL6O8Ds1dRe2S3P4mXOTmOBHBLTHKrV9zueDdV21PfI3285dvipIAai8NRDo80mRN
         WU6Zg+MaOq8EU08nntlDi6FGwfAmT04uBWH5b/DBx0GnipZFtYIgkBOSeFLgNshUNDdV
         NQiw==
X-Gm-Message-State: APt69E0SHB0OAttlQTNBPVAqa1I8//tmWOt8RMdbKqNFl9ZxgGqR6CRb
        7hEZbF6ss0yhIItpjM1emyRWYA==
X-Google-Smtp-Source: ADUXVKL9/VGp8aBgitUgkZIYjXq6qjzbKTOdfGe7O0aVKT4m06Dn5DvyHVWa3g/in0P3Bubr3Ikiww==
X-Received: by 2002:adf:e6d0:: with SMTP id y16-v6mr3247139wrm.35.1528995133771;
        Thu, 14 Jun 2018 09:52:13 -0700 (PDT)
Received: from [192.168.1.180] (cpc90716-aztw32-2-0-cust92.18-1.cable.virginm.net. [86.26.100.93])
        by smtp.googlemail.com with ESMTPSA id j13-v6sm7403912wre.38.2018.06.14.09.52.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 09:52:13 -0700 (PDT)
Subject: Re: [PATCH v3 17/27] bindings: nvmem/zii: Fix location of nvmem.txt
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
 <fcfc83951a2997c527126af1fdd6fb1e0acbe27d.1528990947.git.mchehab+samsung@kernel.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c6dd6c36-2b75-cc9e-ea9e-5ee70eb656e6@linaro.org>
Date:   Thu, 14 Jun 2018 17:52:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <fcfc83951a2997c527126af1fdd6fb1e0acbe27d.1528990947.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 14/06/18 17:09, Mauro Carvalho Chehab wrote:
> The location pointed there is missing "bindings/" on its path.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
> index d5e22fc67d66..0df79d9e07ec 100644
> --- a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
> +++ b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
> @@ -18,7 +18,7 @@ Optional properties:
>   Data cells:
>   
>   Data cells are child nodes of eerpom node, bindings for which are
> -documented in Documentation/bindings/nvmem/nvmem.txt
> +documented in Documentation/devicetree/bindings/nvmem/nvmem.txt
>   
>   Example:
>   
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
