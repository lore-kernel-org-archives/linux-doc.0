Return-Path: <SRS0=87kO=6F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B10C2BA19
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 09:44:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8C972098B
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 09:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS+2/hYn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgDUJoc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Apr 2020 05:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725920AbgDUJoc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Apr 2020 05:44:32 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D7BC061A0F
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2020 02:44:31 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 188so2813633wmc.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2020 02:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=X+mMYA3qFXoBccYe5Q1v2EYprBmty90vAJWRd3ogZ1U=;
        b=CS+2/hYnNasWB2jsNLAmXFrYZj8KcOi1PYvpIWp6wKqjGvOCuCI2lSZfP5MXBoo+ke
         Kl0z2hM6tvn2msODMVuoBnHYnqHGyvDF6IUOI7773QcN563zNqJQ3u3fDQRvKcb3AOFe
         CoHiFyfhJG6sJg/NwrfdePa1/9a/jqOA6yPNQAVD6z5cRhDf5pxCgzIR0axw8l0NlszG
         53PChfMNSfEi9xSUzqxed/lB/u4OqMF3s/MXqDrsT/ggKrFkLEFg0zK7boJLczbI9ybe
         hqZwusLORpg7O7OXosC+twm6CnTP48tPeDvBrMvsQQwf4GhPPju1DbCJk6FZlD03dDcx
         O9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=X+mMYA3qFXoBccYe5Q1v2EYprBmty90vAJWRd3ogZ1U=;
        b=eLhiM622B+otbu7+/+4Y3l1IQYywDh/iCg1fi+aau5gU+o2fF0MaRsD8R8DeO18d6z
         XGP6PMYp1qZA0eWVcxUW1Wu3cR2cSBpqE/wIlEiGGy+wzjalctcDjb+P7d3I2pgtYpf9
         ykEYMG21DgWGqTB4lcgbBy15IlU76/sXhU9/ErtlL7T3xPFVuu54r37ZtGNsLbw9XojT
         x8ZNHalzWXM3xUNME6n/cLKObsta7czUioFgery7AlgkT4wBOKPkfkUp/rkNrU27WKCY
         i9peVQbMQSmi+2o5Rn0Zmwf4YnEodxM5VYIh005vZxiCR+GnHwZncc4axVARVI2i+iIL
         yakA==
X-Gm-Message-State: AGi0PuYmOEYRJCOyX8TMUVPwBwC6Mv4ZacKQuvFUFAsgK1eH0Au7lwYA
        qJS9NQV6f6hRDSM6W02YhWNjpY9f6GY=
X-Google-Smtp-Source: APiQypK9RmLpEkjqKlDlxU2Llmi1B5lIMlL8Bl1HFjjxcyZpessuLIwBnke97WzNyp52okucfTPVTg==
X-Received: by 2002:a1c:dfc6:: with SMTP id w189mr4140181wmg.180.1587462269984;
        Tue, 21 Apr 2020 02:44:29 -0700 (PDT)
Received: from net.saheed (5402C526.dsl.pool.telekom.hu. [84.2.197.38])
        by smtp.gmail.com with ESMTPSA id n2sm3280622wrq.74.2020.04.21.02.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 02:44:29 -0700 (PDT)
Subject: Re: Clarification on the behaviour of checkpatch.pl
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org
References: <445b3e38-123e-eb72-2bbb-c40ac4ea9899@gmail.com>
 <20200420085641.5d8f1a0b@coco.lan>
From:   Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <db880a02-6dc8-7844-254b-682aa41fd54f@gmail.com>
Date:   Tue, 21 Apr 2020 10:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420085641.5d8f1a0b@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 4/20/20 8:56 AM, Mauro Carvalho Chehab wrote:
> Em Mon, 20 Apr 2020 02:20:19 +0200
> Saheed Bolarinwa <refactormyself@gmail.com> escreveu:
>
>> Hello,
>>
>> My experience is that checkpatch.pl will not flag some warnings when I use
>>
>> the '-f' flag. This especially true for .rst files. My understanding is
>> that this flag
>>
>> is needed to use it with a raw source file instead of a patch.
>>
>> Please, I will like to confirm if this is a normal behaviour or is it my
>> system setup.
>>
>> Below is an example from the current stable release linux-5.6.y
>>
>>      [saheed@net linux-stable]$ perl ./scripts/checkpatch.pl -f
>>      ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
>>      total: 0 errors, 0 warnings, 279 lines checked
>>
>>      ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst has no
>>      obvious style problems and is ready for submission.
>>
>>
>>      [saheed@net linux-stable]$ perl ./scripts/checkpatch.pl
>>      ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
>>      WARNING: Possible unwrapped commit description (prefer a maximum 75
>>      chars per line)
>>      #6:
>>      TAA is a hardware vulnerability that allows unprivileged speculative
>>      access to
>>
>>      ERROR: Does not appear to be a unified-diff format patch
>>
>>      total: 1 errors, 1 warnings, 0 lines checked
> If you don't use "-f" flag, then you need to pass a patch to checkpatch,
> e. g.:
>
> 	git show --pretty=email | ./scripts/checkpatch.pl
>
> That's btw what you need to do with all patches you would submit upstream.
>
> The "-f" flag is used only when you want to run a check on an entire file
> (and not to the lines modified by a patch).
>
>
Thank you for the clarification.

Saheed

