Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEF5C38142
	for <linux-doc@archiver.kernel.org>; Thu, 19 Jan 2023 04:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjASE13 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 23:27:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbjASEVm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 23:21:42 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780AF70C6A
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 20:08:11 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id cc13-20020a05683061cd00b00684b8cf2f4dso538437otb.12
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 20:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAal0ABxTUOthK5NVhi8iunngRBuIWwZl3qwDcO6bJ4=;
        b=BXvEvVsL0ihOhRg1ItgsculO56sGTYE92MTgf32f+gIX1M2ohLfZVTZThWW223P5XY
         j4vqTfOC540B4OKKCFsvkcT/HTejQzDlAFV7tLq90WL+2hvs8M2lr5WVBIY2XJw800JS
         IgXy/il2hcbV8oJH7PMYKymfJtSKbVzu2kCRUAXe0nBsNlB2Hkq8udK9XATuZvJbzvvN
         AuarLQV+wxN4ZDOqMJl9kyZakTDbM5jox0pxv6GVFSZwryrgYs0Cg9xzLLrl9LEdl8dp
         TRKiZ1brl48ZPLW5JojsbHC1L5KrWFoPsKYRw/5SY7B+sJDLdeM+SE6qtZ2YIz2Gw5q7
         fkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAal0ABxTUOthK5NVhi8iunngRBuIWwZl3qwDcO6bJ4=;
        b=b3QgmRHApmSUYnnHnPtGYXd1DyfVkYWKyCN+br+QmDfvupQduadQU606PZnqxYGXbS
         KU7n/wFUpMceJzaXwa0QJVnLGbOrl0I1RzFTRUEZQ3kcl1p6ZdL2wzL4CUVCYc0Ppm6a
         8nWNthgYpuLUJSzJAx+EVTb2s1vl30P0q8eqVN4yAXbuVGHa/MUby61EhUpmaIxD674W
         eVnosVwqKkizdPjwclEVd1z3fpxPqFqbhZz4t1TSwF2QTYwyWN6eUAT/q82sDjX4bOVH
         TTdW7+b4oVMNXRaH8YmKV/G7o1Rkh4qih22kW3qwNLdM13/fTBYX5vFYh//63rkEydS3
         EWXA==
X-Gm-Message-State: AFqh2kqq5pPztDhJ0LDS6JGwh2AV1Lr4ds9rxf2kvhdX+bKRRtbKO08f
        5gEjWkm1r2+cRbO1R8lYmGeGx91mqI8=
X-Google-Smtp-Source: AMrXdXulZOhiqcgqcIx8iKE8PZzZqxDEwKgIeKfk1TuffdQCHC/5CVEI6HPvNI3wn41YhC2qgcZxXA==
X-Received: by 2002:a05:6a00:d54:b0:58d:9306:4f24 with SMTP id n20-20020a056a000d5400b0058d93064f24mr9218999pfv.0.1674100844703;
        Wed, 18 Jan 2023 20:00:44 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id k27-20020aa7999b000000b00587304cbd3fsm20383327pfh.181.2023.01.18.20.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 20:00:44 -0800 (PST)
Message-ID: <c00df839-9429-891b-5682-3dbc2d6edbbe@gmail.com>
Date:   Thu, 19 Jan 2023 13:00:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To:     Sadiya Kazi <sadiyakazi@google.com>
Cc:     brendanhiggins@google.com, corbet@lwn.net, davidgow@google.com,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        Akira Yokosawa <akiyks@gmail.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <CAO2JNKUA5DWxNk2cCZwj8DEFF-acf6ZpxwBqn2qTwn4fTW1+BQ@mail.gmail.com>
Subject: Re: New theme - Alabaster for Kernel Documentation
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CAO2JNKUA5DWxNk2cCZwj8DEFF-acf6ZpxwBqn2qTwn4fTW1+BQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[+CC: konstantin]

Hi Sadiya,

On Wed, 18 Jan 2023 09:55:04 +0530, Sadiya Kazi wrote:
> Hi all,
> The design of the new "alabaster" theme used for Kernel documentation
> is nice and minimalistic, but I notice one issue with its navigational
> feature: In the "Alabaster" theme, the TOC appears at the top of the
> page. For documents with multiple headings, this design creates a
> usability issue by forcing the reader to scroll past a long TOC to get
> to the actual content. The previous "RTD" theme used a left navigation
> bar that allowed users to quickly navigate to the desired content.

I made a similar observation the other day.
I'm glad to know I was not alone. :-)

I've got a response from Jon.
See: https://lore.kernel.org/r/874jswyat3.fsf@meer.lwn.net/

Quote of Jon's words:

>> But before looking further into alabaster, I'd like to know why
>> you picked alabaster among those themes which come with Sphinx.
>> Could you elaborate?
> 
> I picked it because it looked a lot cleaner than RTD, better supported
> small-screen devices, and was the Sphinx default.  Like so many
> things, it was done in a bit of a hurry and I cannot claim to have
> thoroughly considered all of the alternatives.  I was hoping that people
> would respond to the RFC if they had a better idea :)
> 
> If there is a better theme to use as the default, we can consider
> changing it again; I don't think there is much cost or inconvenience
> involved.  I do want the default theme to be one of those bundled with
> Sphinx, though, rather than requiring it to be installed separately.
> 
> That said, I have no objection to adding configuration support for other
> themes as well, should people want to use them.

Returning to Sadiya's comment:

> 
> To try and compare both, please open the index page of the "alabaster"
> theme given below:
> https://www.kernel.org/doc/html/latest/dev-tools/index.html
> and the "RTD" theme given below:
> https://www.kernel.org/doc/html/v6.0-rc7/dev-tools/index.html
> and navigate to the KUnit page. You'll notice it takes more time to
> land on the KUnit page when using the alabaster theme.
> 
> With the "RTD" theme, the navigation sidebar links to other pages
> (parents, siblings, children, and all top-level pages) as shown below:
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html#

This link is identical to below. Did you mean

  https://www.kernel.org/doc/html/v6.0-rc7/dev-tools/kunit/index.html

?

> Alabaster only shows headings as shown below:
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html#
> making it effectively useless for navigation. This is particularly a
> problem for the KUnit documentation, which relies heavily on being
> able to find related pages. Currently to navigate to the related
> pages, the reader has to return to the Home page, use the search bar,
> or manually edit the URL (i.e, only if you know the chapter or section
> name).
> 
> So, after comparing both the themes, could we modify the sidebar to
> match the "rtd" behaviour if there is a way to do so?

As I mentioned in the above mentioned mail, there looks like a room
of customizing alabaster. Yet, I am not able to get a sidebar as usable
as that of sphinx_rtd_theme so far.

Maybe due to my inexperience in CSS customization. :-\

>                                                        If not, would it
> be sensible to either include this support in the "alabaster" theme or
> even temporarily roll back the change until we find a solution?
> 
> It'd be great to hear your thoughts on this.

sphinx_rtd_theme can be chosen by:

  make DOCS_THEME=sphinx_rtd_theme htmldocs

Konstantin, would it be possible for you to add "DOCS_THEME=sphinx_rtd_theme"
for the "latest" kernel documentation builds until the new default theme
becomes good enough for most people?  That is if Jon agrees.
For the "next" builds, alabaster theme should be OK, and easier for us to
compare the two themes.

        Thanks, Akira

> 
> Thanks,
> Sadiya
