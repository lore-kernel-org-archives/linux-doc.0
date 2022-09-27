Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83932C54EE9
	for <linux-doc@archiver.kernel.org>; Tue, 27 Sep 2022 08:31:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbiI0Ibc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Sep 2022 04:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbiI0IbH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Sep 2022 04:31:07 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F4F9F775;
        Tue, 27 Sep 2022 01:30:47 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso768088pjq.1;
        Tue, 27 Sep 2022 01:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=3bWgi2kmcm2iZdU6oG03Uagj05nUu2keuw24Ok6vIHw=;
        b=nsbcrUMTYCzlX2W4YSQJicTaxEa8r2opjo75x+j6kaxQMZESaos+ItadATR5xXppxC
         aB6s/UJB5aYUwIJpTE72ycnemtDxu8GXrNcmm36k2nvhpRWcJYTxhP4ZBG6tA9hyici9
         Efg8ggvqHR0C61fuT5JkPf11XseTtnVmofD0rjvMqh3lZiT3XNS/5wbw9r67nUpdtZWI
         CL9wT7v9r/R/YQo6rcSBFphXglRBaaPaVg8Bt1rpT4iXV9Q7kZUw+Ze8+ur0BY5qf4Wf
         QO7wtnf/0kRd84xCpQjDBZnhqWAskjwnD5B414SLNCUujoiKSiV7a6stOGr+unEtcHAT
         JhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3bWgi2kmcm2iZdU6oG03Uagj05nUu2keuw24Ok6vIHw=;
        b=JgU8kV1ns8J/99EtjXK08jj0+AAFqhzuBfBzaC2Cye1HvvZ4/9iyH7KQVP+g2DzOzY
         sLdKsFtAK9cDG5Y6xsDXOdxH5+q8teD4cWmgIQuX5JLBR45mhWHdWz6Y31Oxgg1kaMM9
         8cGmLldspRPa0gvTrh9C8QLSmQ/ybEfetuhtKDJZQlO0I6AlGBwFwtapLFwgaNBI2aO2
         NovHrKSh8kfzc7SYKSlYr/qGokldOKHw+uhK6v/pXo1l5RzSv3uP94lPXI2NP6yL27Ky
         rum1t5u8WRFbcidz5lFF/fiDSSkKNRQ17s5CAM6cuRphlZDz4nGhF+DqbbKkoN10aH+N
         msDw==
X-Gm-Message-State: ACrzQf2G7RuFsldt+EIQehe11pHUmIv8ih8Il+xRuaMOEV0DBMfEdGnX
        YENxJRTVJuWV1497dqdD014=
X-Google-Smtp-Source: AMsMyM7Z+qRkfOnwhCMeqPbRHjqTn3kGyGuFWMwUc2eeHQAe/KdEm4V7BMsjVQwr96ZHDSnwMZ4rRQ==
X-Received: by 2002:a17:90b:4c0a:b0:203:6c1e:e730 with SMTP id na10-20020a17090b4c0a00b002036c1ee730mr3304532pjb.146.1664267446955;
        Tue, 27 Sep 2022 01:30:46 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-32.three.co.id. [116.206.12.32])
        by smtp.gmail.com with ESMTPSA id a9-20020a656049000000b0043bed49f31fsm890916pgp.8.2022.09.27.01.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 01:30:46 -0700 (PDT)
Message-ID: <b48636e7-1da3-bc1c-2f2c-d23e0a419f98@gmail.com>
Date:   Tue, 27 Sep 2022 15:30:42 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] Documentation/CoC: Reflect current CoC interpretation and
 practices
Content-Language: en-US
To:     Kristen Carlson Accardi <kristen@linux.intel.com>,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
References: <20220926211149.2278214-1-kristen@linux.intel.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20220926211149.2278214-1-kristen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/27/22 04:11, Kristen Carlson Accardi wrote:
> -The initial Code of Conduct Committee consists of volunteer members of
> -the TAB, as well as a professional mediator acting as a neutral third
> -party.  The first task of the committee is to establish documented
> -processes, which will be made public.
> +The Code of Conduct Committee consists of volunteer community members
> +appointed by the TAB, as well as a professional mediator acting as a
> +neutral third party.  The processes the Code of Conduct committee will
> +use to address reports is varied and will depend on the individual
> +circumstance, however, this file serves as documentation for the
> +general process used.
>  
>  Any member of the committee, including the mediator, can be contacted
>  directly if a reporter does not wish to include the full committee in a
> @@ -141,16 +143,16 @@ processes (see above) and consults with the TAB as needed and
>  appropriate, for instance to request and receive information about the
>  kernel community.
>  
> -Any decisions by the committee will be brought to the TAB, for
> -implementation of enforcement with the relevant maintainers if needed.
> -A decision by the Code of Conduct Committee can be overturned by the TAB
> -by a two-thirds vote.
> +Any decisions regarding enforcement recommendations will be brought to
> +the TAB for implementation of enforcement with the relevant maintainers
> +if needed.  A decision by the Code of Conduct Committee can be overturned
> +by the TAB by a two-thirds vote.
>  
>  At quarterly intervals, the Code of Conduct Committee and TAB will
>  provide a report summarizing the anonymised reports that the Code of
>  Conduct committee has received and their status, as well details of any
>  overridden decisions including complete and identifiable voting details.
>  
> -We expect to establish a different process for Code of Conduct Committee
> -staffing beyond the bootstrap period.  This document will be updated
> -with that information when this occurs.
> +Because how we interpret and enforce the Code of Conduct will evolve over
> +time, this document will be updated when necessary to reflect any
> +changes.

The grammar LGTM, thanks.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara
