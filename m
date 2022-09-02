Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15230ECAAD5
	for <linux-doc@archiver.kernel.org>; Fri,  2 Sep 2022 16:11:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237175AbiIBQL4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Sep 2022 12:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236676AbiIBQLU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Sep 2022 12:11:20 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC42D83FF
        for <linux-doc@vger.kernel.org>; Fri,  2 Sep 2022 09:05:37 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1225219ee46so5833559fac.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Sep 2022 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8dCdssbHxdmRg9kpNW1ckRyuV7LDGfaqP/6/uKsyA1k=;
        b=fH+pptMq+fzJaMfs68XlpqPxyFpFVU5P+jgfcIrvSKlqXkGr2og+zut6xQy1B8HKtT
         FlknUkaqp8FLsUPDCaZcJJSWNR98iC9ADZFCL+hlNCmWQqcippLqfqQC9MBXs1UWOpT2
         qJpVMLKofbgE37SZf8SHZM4txDIxvQHAbuc6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8dCdssbHxdmRg9kpNW1ckRyuV7LDGfaqP/6/uKsyA1k=;
        b=Fa2KkgJP8Q1pkVgMr1ziM+zBPjzCjAd6f5LpKhUXUatL6cZDaS89RBrauwCY44bYLi
         5XNxSj76gjMXMSx4hgsSXclLDvCEhN5DtdEp2VblR0FMo/iVQ7nzKjgfrN973M5QXCLs
         uvsGm22fsPWsN3txNZ3lEg4GvjvS7wK2R7g4RlxJb0q6/OJ9FX8/Tlf0Zogn0OQPNc6K
         ostkadDmHF6As7eKpWCLqCcWfVUzZ7mjgJznigMLbVRko1XxI5RTgC9EQHkDHsOL5EJL
         MR7LVbZ3+rfHxZVo04U4dslN0lcNnJ9y8aIjSwN/BPu+mxQiXNj7BAQDSCKhc26TyGLH
         R7+A==
X-Gm-Message-State: ACgBeo1UTYhnzxzIEzCGy5RNo53agPPbIg7DlNCJ2DR0r0E7GURwsfMm
        ruL/eGd56yJjhcza6HQ6wGYxnA==
X-Google-Smtp-Source: AA6agR66E1bSPsaHYaDn0YGw+zMoKwav/GR23CH3g9BlJpDKjnsPtKUuIGRmWLldPjfWxdVoiI3ggw==
X-Received: by 2002:a05:6870:a7a5:b0:125:76da:1bc1 with SMTP id x37-20020a056870a7a500b0012576da1bc1mr81319oao.272.1662134737084;
        Fri, 02 Sep 2022 09:05:37 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id x5-20020a9d4585000000b0063711d42df5sm1196165ote.30.2022.09.02.09.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 09:05:36 -0700 (PDT)
Message-ID: <270dc10d-bc25-0b88-7eaf-b97fb68fc010@linuxfoundation.org>
Date:   Fri, 2 Sep 2022 10:05:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] docs: update mediator information in CoC docs
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>, gregkh@linuxfoundation.org,
        corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        joanna.lee@gesmer.com, Shuah Khan <skhan@linuxfoundation.org>
References: <20220901212319.56644-1-skhan@linuxfoundation.org>
 <110faf8f-2578-67f3-741c-02182b485769@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <110faf8f-2578-67f3-741c-02182b485769@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/2/22 01:57, Bagas Sanjaya wrote:
> On 9/2/22 04:23, Shuah Khan wrote:
>> @@ -51,7 +51,7 @@ the Technical Advisory Board (TAB) or other maintainers if you're
>>   uncertain how to handle situations that come up.  It will not be
>>   considered a violation report unless you want it to be.  If you are
>>   uncertain about approaching the TAB or any other maintainers, please
>> -reach out to our conflict mediator, Mishi Choudhary <mishi@linux.com>.
>> +reach out to our conflict mediator, Joanna Lee <joanna.lee@gesmer.com>.
>>   
> 
> Why had Mishi be replaced with Joanna?
> 

Mishi is unable to continue to serve on the committee due
to her current commitments.

thanks,
-- Shuah
