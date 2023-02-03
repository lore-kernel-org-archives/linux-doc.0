Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4A0C61DA4
	for <linux-doc@archiver.kernel.org>; Fri,  3 Feb 2023 02:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjBCChv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Feb 2023 21:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjBCChu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 21:37:50 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160141A945
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 18:37:50 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id z1so3916041plg.6
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 18:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NAu/hppQCC01gCUFwOHpg8qV/q+qXELdiUcejWAliIc=;
        b=gwBT6i31Job98y2t+SgqrUPVsoIDsUh/WsBIRFnuUR9hOqagInjjjt0kM+qB6CbQBH
         o+hJntSwkC1CUO9FMV5Q1CsC8Mkc6ILEytN2563RhBUn+OnGZ/p9N6+OrvHOsYmr6c9I
         DL5Kz7KvTg2TDRX19com0EBUSzm9+3vTyohPPbDUL1C2I3M8jvL/9T80ftgjvEbgKyOV
         Dx/E+KO6w0UMb9dbbkv+oFs3N99Z5lfErV4/HxUC7ndTbKjylCQBLQC7bN5qAmlR3Ako
         vu24qy8RFdt7s9ZbZqHn0Bbve4oE9DPh86XDvHhkYYiU7LyBRTo1Y2uw7ZDYC+Bg73iv
         Dwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAu/hppQCC01gCUFwOHpg8qV/q+qXELdiUcejWAliIc=;
        b=MKS0TVihbB0J4c61S8Fg9QeWSBHQEQrvejYL6+PNA0mzNNJ2UszJT9r5hBnOA/WGdN
         ki/n2YnQTedDCffHRkFPEJAcf3jEfXoKh8WJVLJ//Lh/jMxzUchOJpbgVwXiMx9//L89
         nmEQHbO3fVA7XJ62bfwx3BABK1XevUWgzmffrCSpqKlBmzgOwzOvuXHkgyYRLpHFoHf/
         Rs3Fi6cVuk6++nYkJgPjSnsZbxue7caLDOrXlUtod4gYGH0TkNSXLXztlTUbX0z37gOH
         amKuYRePtrZWJ4m9neNTxxydadg4031ygFPslyMHXj4lHp4k8DdVbpjtaD3xKWZRVZOG
         R6/A==
X-Gm-Message-State: AO0yUKW4HD+AadqWso2wxlK4IuNd0FM9e/IXB0RYGwP+SjUoQkZjOS8l
        CUVQrWyo9pdeMXVKY14Ffpo=
X-Google-Smtp-Source: AK7set9ylDUfYubOy6yFtOyASsENqWYJILOFJdTal6iS5MQT8xCyPUrrmvPuuWdeNmD6IjbfCvwYGQ==
X-Received: by 2002:a17:902:f112:b0:196:77fd:abfc with SMTP id e18-20020a170902f11200b0019677fdabfcmr7073641plb.16.1675391869434;
        Thu, 02 Feb 2023 18:37:49 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902a60200b001962858f990sm366204plq.164.2023.02.02.18.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 18:37:49 -0800 (PST)
Message-ID: <1c9bb0dc-7efd-c664-043a-5c0453739166@gmail.com>
Date:   Fri, 3 Feb 2023 11:37:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH RFC] docs: Add more information to the HTML sidebar
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
References: <87o7qu5al3.fsf@meer.lwn.net>
 <CAO2JNKW9pL5097qdte1N4F=RSnRJtcnpaDf__ROJAFfHitooYQ@mail.gmail.com>
 <fa426691-c76a-8ab0-4975-6edacc9cb247@gmail.com>
 <8735855j4p.fsf@meer.lwn.net>
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8735855j4p.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 20 Jan 2023 08:19:02 -0700, Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
> 
>>>> Thoughts?  Is this headed in the right direction?  This view of the TOC
>>>> is readily available from Sphinx; if we want something else it's going
>>>> to be rather more work.
>>
>> I think this looks like the right direction. But how far do you want to
>> mimic RTD's sidebar???
> 
> Well ... that is kind of my question for all of the folks who are
> unhappy with the current sidebar.  What would you like to see there?
> 
> Things like sidebar width, whether bullets are used (I'd deliberately
> taken them out as excess noise), which text is which color, etc. are all
> just CSS; we can paint that shed any color we like.  The harder part is
> deciding which information we want to have there in the first place.  So
> ... is the set of links shown in the new sidebar close to what we
> want...  too much stuff?  Something missing?

Seeing no response from anyone so far, I feel like I need to express
my personal view. As you might already be well aware of, I love the
site navigation of RTD both on large screens and small (narrow) screens.

On *what* should be in the sidebar, I don't see anything missing
give or take the toctree depth.

To my eyes, there is two deficiencies with the alabaster theme in site
navigation.

  - Even with this RFC patch amended with the diff I suggested in
    https://lore.kernel.org/linux-doc/6b2e496f-d7f6-abea-6bbd-4b12fea76a68@gmail.com/,
    there remain "Where am I???" moments when jumping to a different page.
    In such jumps, alabaster's sidebar always reset to top with the
    main pane. RTD's sidebar keeps its position so there is no such
    moment.

  - On small/narrow screens, alabaster's sidebar is pushed downward
    to the bottom of the page. This means you typically need three
    steps to see where you are when jumping to another page:

      1) Jump to another page.
      2) Scroll to the bottom.
      3) See where you are.

    With RTD, you don't need to scroll to the bottom. Sidebar is there
    behind an icon at the top-left which is often used as "menu" icon.

      1) Jump to another page.
      2) Open sidebar and it tells you where you are.

I don't know if alabaster can be managed to behave similar to RTD
with a reasonable effort.

        Thanks, Akira


> 
> Thanks,
> 
> jon
