Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D6CC61DA4
	for <linux-doc@archiver.kernel.org>; Sat,  4 Feb 2023 07:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjBDHeG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Feb 2023 02:34:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjBDHeF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Feb 2023 02:34:05 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FD4618F
        for <linux-doc@vger.kernel.org>; Fri,  3 Feb 2023 23:34:03 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id t17so5244134pfj.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Feb 2023 23:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2yxF4uy+nsmjqh4OsgWP9Zt7ELJWpmUqx9zqYoQPx8=;
        b=VzwwFCm7Y68LF9IbYNw9r4rg8XWbJe9KzlzaJv1plhrEb4L0gzAN/aoB0o6aSzBgYs
         MV43l1P4JAGTJwAcodOha+C9AtsVHJNPikEQJfkcG8p5shYVZhWpffAiVyfzUHW+ljwB
         guQXEGQ9JCquC+fLccLrXKsclr0ovyRuopd4YW+USTjOlqKfdvzg9zJ5FAqA8v7Tfj16
         /vUSmzAu4BvptzXw4Zx1IcEP6jJKEGScm9hjbVWUHVQKpqD3HgqEUuhvpv8xQdI6iDkS
         AbDEsX73/yzmHNpTTAqyz3HZgX+4u3jtOkdcBY0v3pPbqA2tvsP5fYUOPzul2g3qQa+t
         sNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2yxF4uy+nsmjqh4OsgWP9Zt7ELJWpmUqx9zqYoQPx8=;
        b=451PmwTl30cDzaY3tLQgzsRvkeyEXxMQ/3NkF+1ehXzToBALMk30Nz3zc29cw4E+fa
         qxsx+T8Xgf0nwQa8RHxCZsHuI4WEhnoK3bOJdK1UpPWC2YoJRq5qhGgez5IrMpYy2vEb
         9uVQtn22ht04BQNLfcidJ9bosl/BFhag4RGxrPY33BPABbGeolpRkyK6nxLlhz8JlU4g
         /OB62lkCowrRA3yGoyI9KNCv9QX9guLH7POPi1dxWWC+SbyxmnESP5bJJCAAgqZVpXri
         fG3MNwZykof2kbTOeOsYAwfz7QBo6iKfGr3dMB++kiGOBPCOHyUKIFKzyOaW8nmUIbK6
         p1yA==
X-Gm-Message-State: AO0yUKWn0m2YlhRDl07mKc01meXwiJBWORrP5DTga6ZBovxCnyLaIdFD
        WJlCh1DrG1xrF+E/iqfFOg6s5Tc7UGE=
X-Google-Smtp-Source: AK7set+t6IyqWTVHFLZpiM4+CdDlPmUag8beT6pZDL4/odNfU1x/D4tKqaHU/HduWIgPIAcUESgREA==
X-Received: by 2002:a05:6a00:124d:b0:592:fc9f:8ae5 with SMTP id u13-20020a056a00124d00b00592fc9f8ae5mr14239372pfi.23.1675496042607;
        Fri, 03 Feb 2023 23:34:02 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id b14-20020aa7870e000000b00593bc1bee3dsm3033947pfo.88.2023.02.03.23.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 23:34:02 -0800 (PST)
Message-ID: <cb0d683b-8abd-ecb1-389d-c45550e7bbf3@gmail.com>
Date:   Sat, 4 Feb 2023 16:33:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH RFC V2] docs: Add more information to the HTML sidebar
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>, linux-doc@vger.kernel.org,
        Akira Yokosawa <akiyks@gmail.com>
References: <87bkmas5vc.fsf@meer.lwn.net> <877cwys3g6.fsf@meer.lwn.net>
 <0749ec79-4375-e44e-f2b6-8f0a8bfa9ad9@gmail.com>
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <0749ec79-4375-e44e-f2b6-8f0a8bfa9ad9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Date: Sat, 4 Feb 2023 09:20:13 +0900, Akira Yokosawa wrote:
> On Fri, 03 Feb 2023 17:02:17 -0700, Jonathan Corbet wrote:
>> Jonathan Corbet <corbet@lwn.net> writes:
>>
>>> As before, the results can be seen at:
>>>
>>>   https://static.lwn.net/kerneldoc/
>>
>> What's there now reflects a couple of tweaks beyond the patch I sent.
>>
>> Hopefully I've addressed some of the concerns...  One thing I really
>> don't like about the auto-positioning sidebar, though, is that it pushes
>> the "The Linux Kernel" heading off-screen.  For somebody following a
>> link into the docs from elsewhere, that could be a bit confusing.
> 
> That's the same in RTD. So this might be a point you hate RTD, I guess.
> 
> But I see a major problem on small/narrow screens.
> The sidebar is now kept at the top, and by clicking/tapping a link in the
> TOC, I can't jump to the section I want to see.
> 
> Sorry, but this is not usable at all.

To be clear, I meant "on small/narrow screens".
On normal PC screens, this resolves the issues I mentioned earlier.

So I'm OK with this goes into v6.3. Maybe add a note on small screen
devices in the Changelog.

BTW, I very much like the way LWN's site navigation behaves on small
screen devices. LWN is designed to be accessible without hierarchical
structure of documents, which is the opposite of how kernel documentation
is managed based on the nested TOC entries.

        Thanks, Akira

> 
>>                                                                    I
>> know vaguely how to fix it with CSS, but getting such things right
>> always require a fair amount of dinking around and I can't do that now.
> 
> ;-) ;-) ;-)
> 
>         Thanks, Akira
> 
>>
>> jon
