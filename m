Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3ECC61DA4
	for <linux-doc@archiver.kernel.org>; Sat,  4 Feb 2023 00:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbjBDAUV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Feb 2023 19:20:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbjBDAUU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Feb 2023 19:20:20 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F21384B7E
        for <linux-doc@vger.kernel.org>; Fri,  3 Feb 2023 16:20:20 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id o16-20020a17090ad25000b00230759a8c06so3471907pjw.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Feb 2023 16:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5zz0zROETrzNavRI3gp8WWblblMRWZB7wupQXhHwefs=;
        b=oJvj8A2JSbjeQY118AFm4dWbW96MZlcLmtF8XcmiS84Uqnj3SSHmlb00dTdkU5iyrp
         /bE7I12QrZ8tuBMRzWhb++4l4VcYoVVQRXfrLgR1k11b3BVh/x2eeRpfG8KKOBV2l73D
         oQULQ8Mzobmh9+VC3fHG9F000Hh7odeF7EGBkqh8V/CdRAwQzct1n6dzaWPzidJMsE3b
         03dvCXf9F+0BhfvG362T51eqcXDDGuy0Uy8COtKAfqsVXUyQX0iGem/vh/edNXAi6IaE
         Ora52APvM7nMvCIObWtVS4jipm6uCqlp8Kik4OJsyBqCeg4tl/zPxlAs15IXKCyut8Ri
         eg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zz0zROETrzNavRI3gp8WWblblMRWZB7wupQXhHwefs=;
        b=c3p+f9SB1FCdYBNnu+R378w4nBlvbp9X3EvYY7gN3QiBVDrFnkoF9QfyGLscN7d80Y
         uBkys5dATD8pnF65x7OGz9iXayGArinaNlniUGrlsGPvdH2Z2g/dFaCQ7XkqZW5W7jmF
         scWRwPL5z6HFjxdExShIz9HQj8pQgcBelADtWAtLJyorkyjz799NHIGSrjnBFQt5F9Aq
         LSkiLDoA9oUn03aCXS7HpmNV11aFD+P8TQEBgkIQEbKaWrpCxBcwTu30/vyKDoGRESLX
         tDicpe1AF5jeRSO8GF2YEySenz/epv9jum1ChcZsXJASFNcm1FDz8vExo3/YC8bHamZX
         UgWQ==
X-Gm-Message-State: AO0yUKUIJAc0DJdZoXRUIgai6lkaHH5OFIe4RPFMQ3anTjY0FoMbHKAR
        bcRqFasqexEk2RJsEbm5hcI=
X-Google-Smtp-Source: AK7set8bZ8vNa59k/Ise85yGZYsVkeRe40DmF4bh6zzTm7Uyvmf8fKbXXL94MsrfTabKakqlj97WOQ==
X-Received: by 2002:a17:902:d482:b0:194:997d:7735 with SMTP id c2-20020a170902d48200b00194997d7735mr15241934plg.48.1675470019297;
        Fri, 03 Feb 2023 16:20:19 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id ja17-20020a170902efd100b00196629652efsm2166969plb.286.2023.02.03.16.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 16:20:18 -0800 (PST)
Message-ID: <0749ec79-4375-e44e-f2b6-8f0a8bfa9ad9@gmail.com>
Date:   Sat, 4 Feb 2023 09:20:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH RFC V2] docs: Add more information to the HTML sidebar
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>, linux-doc@vger.kernel.org,
        Akira Yokosawa <akiyks@gmail.com>
References: <87bkmas5vc.fsf@meer.lwn.net> <877cwys3g6.fsf@meer.lwn.net>
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <877cwys3g6.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 03 Feb 2023 17:02:17 -0700, Jonathan Corbet wrote:
> Jonathan Corbet <corbet@lwn.net> writes:
> 
>> As before, the results can be seen at:
>>
>>   https://static.lwn.net/kerneldoc/
> 
> What's there now reflects a couple of tweaks beyond the patch I sent.
> 
> Hopefully I've addressed some of the concerns...  One thing I really
> don't like about the auto-positioning sidebar, though, is that it pushes
> the "The Linux Kernel" heading off-screen.  For somebody following a
> link into the docs from elsewhere, that could be a bit confusing.

That's the same in RTD. So this might be a point you hate RTD, I guess.

But I see a major problem on small/narrow screens.
The sidebar is now kept at the top, and by clicking/tapping a link in the
TOC, I can't jump to the section I want to see.

Sorry, but this is not usable at all.

>                                                                    I
> know vaguely how to fix it with CSS, but getting such things right
> always require a fair amount of dinking around and I can't do that now.

;-) ;-) ;-)

        Thanks, Akira

> 
> jon
