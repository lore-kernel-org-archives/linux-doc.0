Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E8EC25B4E
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 14:09:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbjATOJv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Jan 2023 09:09:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjATOJu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jan 2023 09:09:50 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F76C4E87
        for <linux-doc@vger.kernel.org>; Fri, 20 Jan 2023 06:09:39 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id k18so5417914pll.5
        for <linux-doc@vger.kernel.org>; Fri, 20 Jan 2023 06:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGPQvZx2mA1GFg7uw0rvj1+iQ+hzMZKdzKohNlCbJWE=;
        b=XGwr2hT36NfBdQVpEbr9IdoWrr7FPQx7qMPrEQrmL0twoO9fLaeXgFOqXoraSqkxT5
         F+CzWU0BDWRMY0mEtl7PLZRT5JfD+ipkP4EDf/p7CD6yCAzjHcJA3AIbaNCKHcyj8EAX
         Evz8sFcQYsMSJgnWSvqY0B93KjGZbhUaDSwEx9Nz/EW267F64EnmosOvDymVn2ndFbVX
         dl4JrTvbh2dq9+dFw3IOwtLIqNCRJyfwCYjon9A1YR6Zs03K9mbC075SOPOlla3ulnSb
         M2sYLjPiujn3BVPXprYX1N+XYWQqEYHtGSPRYANjYFpG6VkvVo8n4ezcQF7xHTiGJuNR
         BUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGPQvZx2mA1GFg7uw0rvj1+iQ+hzMZKdzKohNlCbJWE=;
        b=6h0Ajy/5p/a+Z3E110QvLs9tChWSn6B9uFyRYOWF8v5bl0kXohJ4tvXAWmYc3sX8MT
         DlzvFiGZQGRxmSk9bOvsilsagAmKigKgrQMhi75Vz1yuVM4Tnue0xH2PcI+zKJ9lCNmm
         CVZ+6GijmwKP9u11/K8AYde/gxpAsd4asILWrhAA/oS2kZ/epe9jtXLYxmFGBuC+nuv9
         sr8AMD5yEbEy44KbCbG39+quaTjgPouOJWkT6V9ymX49eE32HezQG7Nb6TCq/veR5cEk
         of2ISl+bIYKrjzMolOWUuNghexXoxACHSJUzJv2njSSWvuSWiMZlibgKJ9J1VAhtVRh2
         CDUw==
X-Gm-Message-State: AFqh2krNUi+PAV8nr+tjsrzN5pwrpAqhJY3i8v4igsaZkhlGDM9XYu8b
        3fDup1CEuFom4sgJAaNgNx9QDbkW4Z0=
X-Google-Smtp-Source: AMrXdXt1r6sQtvN3UmpV3d0a6q1JZWHPsvtAQuHe3uobtrsvkYBKBqEBBV+OLna7U1yf0mwMYAk8xQ==
X-Received: by 2002:a17:903:328b:b0:194:cd07:a8bb with SMTP id jh11-20020a170903328b00b00194cd07a8bbmr6167400plb.30.1674223778992;
        Fri, 20 Jan 2023 06:09:38 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b00176b84eb29asm2453945plf.301.2023.01.20.06.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 06:09:38 -0800 (PST)
Message-ID: <fa426691-c76a-8ab0-4975-6edacc9cb247@gmail.com>
Date:   Fri, 20 Jan 2023 23:09:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH RFC] docs: Add more information to the HTML sidebar
To:     Sadiya Kazi <sadiyakazi@google.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, David Gow <davidgow@google.com>
References: <87o7qu5al3.fsf@meer.lwn.net>
 <CAO2JNKW9pL5097qdte1N4F=RSnRJtcnpaDf__ROJAFfHitooYQ@mail.gmail.com>
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CAO2JNKW9pL5097qdte1N4F=RSnRJtcnpaDf__ROJAFfHitooYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

On Fri, 20 Jan 2023 19:08:14 +0530, Sadiya Kazi wrote:
> On Fri, Jan 20, 2023 at 5:41 AM Jonathan Corbet <corbet@lwn.net> wrote:
>>
>> Add a new sidebar template that creates a more RTD-like "fisheye" view of
>> the current place in the document hierarchy.  It is far from ideal, but
>> some readers may find it better for navigating through the documentation as
>> a whole.
>>
>> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
>> ---
> Thank you, Jon.
> 
> This is definitely an improvement as we are able to see the second
> level headings in the
> sidebar of the main page. But I would still prefer the "RTD" theme
> kind of sidebar due to the
> following reasons:
> - This sidebar toc list is not bulleted and the same chapter name runs
> into multiple lines making
>    it trickier for the reader to click the exact chapter they are interested in.
>    Perhaps this can be handled by increasing the width of the sidebar.
> This will avoid the
>    chapter headings to go to the next line.
> - Comprehending "where am I" is difficult. When I use the table of
> contents to navigate
>   to any chapter, such as https://static.lwn.net/kerneldoc/dev-
> tools/kunit/architecture.html,
>   I'm unsure of where to go from here because it's difficult to find
> this chapter's exact location
>   in the table of contents. Is there a way to get the nested headings
> in the sidebar until
>   depth 3 and make it collapsible?

I have mostly the same list of possible improvements.

As for the "where am I?" syndrome, it would be helpful if the sidebar
could be scrolled independently.

I'd really like to suggest some code changes, but unable to do so.

> 
> Regards,
> Sadiya
> 
> 
> 
> 
> 
>> So this is just a first attempt to create a more crowded sidebar; the
>> result is somewhat like what RTD does; I'm not hugely happy with it, but
>> it's a start.
>>
>> I've put a copy of the rendered docs at:
>>
>>   https://static.lwn.net/kerneldoc/
>>
>> Thoughts?  Is this headed in the right direction?  This view of the TOC
>> is readily available from Sphinx; if we want something else it's going
>> to be rather more work.

I think this looks like the right direction. But how far do you want to
mimic RTD's sidebar???

        Thanks, Akira

