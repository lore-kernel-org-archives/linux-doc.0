Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E2BC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 16 Apr 2022 09:03:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiDPJGW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 16 Apr 2022 05:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiDPJGV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Apr 2022 05:06:21 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28921066E5
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 02:03:50 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id s14-20020a17090a880e00b001caaf6d3dd1so13443979pjn.3
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=r755sEHS6XKHg2sFZbGwHYnpwi1Rp7A12cZ06QPHbdc=;
        b=MLC7JQ6aQUGV5rPBkez+gYUL9psM2ggrs1jAqzFDWJLruf11fmATFsOtoy94NHzoPT
         sjwJGDPuWBtA+79RYJlTq3B5E2U8+MO+4jjRrl0Qkrk8pFpzdu6vgTegAGUN9lSQljlE
         AVY6/4XkQcdEbRXeyk1C2nAUXBlzFY9VTfgK+whPUPPYVEjRMOo4XRnqaja+Ta5OcmmT
         wYCrg9sKqaGsvlbyb0yIoUSkF8ZNh2sQE8XBmY+PeB/qvLi+hnf8H1KjpmHsPzQk975l
         w3mkszl7gyG4Nqq28vw0Be2pj227RdVX4im7DLgpXcskPcpKi0TeOaQhzTCYlnp7S3Kd
         nUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r755sEHS6XKHg2sFZbGwHYnpwi1Rp7A12cZ06QPHbdc=;
        b=AhE2bDhIGcvOhAZvMgCncL4B/CtQEaCAONJfpPhWA617KxtgiIYFKnzDVZQKXKQM5E
         +9zMgbwzgZDzAQlenEYZR5uHJQLAhkeLiAXZUWI/US0UzN1Kz/c0KO+J6g1ZdP2hnpCW
         /xLu+G2b+GD8q/dCiuVnAtVjkgwK27qFdatZz9X4FCOcp0LzTWWCYTiLgK0EQg9P+YNJ
         paCGGeDTRo7IC2lQmKGIIXr4xGR4Bf25CJ0tQuo1waHnmSbLUG+quAmSJTzJU6xkqGyf
         Zyg7B2ipGV78x5pYo/JnGGkmADsSYSUi/Kdl4QG4rDwZv++PLw7ilySWqDBFZkTT597T
         Sh0g==
X-Gm-Message-State: AOAM530/seOiP02kXC9Ccavh1dGTFX4vYS6TD9bRYZSVCm002cu6RWsD
        0d13XD+IW+2xCVrUiKbIsNg=
X-Google-Smtp-Source: ABdhPJwfBrbUhWF1z0UBHxhGErrDKYlvqim44SjGpgxAl1hWz1QyFEo+5o0lCxr85+IGOFTgjHQXZg==
X-Received: by 2002:a17:902:f605:b0:14f:5d75:4fb0 with SMTP id n5-20020a170902f60500b0014f5d754fb0mr2729015plg.101.1650099830157;
        Sat, 16 Apr 2022 02:03:50 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id pi2-20020a17090b1e4200b001c7b15928e0sm11634951pjb.23.2022.04.16.02.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Apr 2022 02:03:49 -0700 (PDT)
Message-ID: <09f5e92a-286b-afe3-ebea-2054363173d8@gmail.com>
Date:   Sat, 16 Apr 2022 18:03:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Is there any Japanese translation maintainer?
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kosuke Fujimoto <fujimotokosuke0@gmail.com>,
        Tsugikazu Shibata <shibata@linuxfoundation.org>
References: <172fa015-26df-c978-853d-3aba67c581cc@gmail.com>
 <15b941a4-c41d-3fc1-c4f8-9a6736f6b874@gmail.com>
 <87pmlh4f5h.fsf@meer.lwn.net>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87pmlh4f5h.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[+Cc: Shibata-san]

On Sat, 16 Apr 2022 02:16:10 -0600,
Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
> 
>> On Wed, 13 Apr 2022 18:09:59 +0900,
>> Kosuke Fujimoto wrote:
>>> Hello,
>>>
>>> I would like to contact with Japanese documentation maintainer for some 
>>> changes. However, it looks like there is no one listed in MAINTAINERS file.
>>> Is there anyone who is maintaining Japanese documentation?
>>
>> Existing Japanese translation has a note on its first page saying:
>>
>>> This document is maintained by Tsugikazu Shibata <tshibata@ab.jp.nec.com>
>>
>> However, this email address is not reachable any more.
>>
>> I also have a few things I'd like to fix/update in it.
>> I'm glad to know there exists someone else who has similar
>> thoughts.
>>
>> I think I can play a role as a tentative maintainer who can
>> review your changes.
> 
> The Japanese translation has been effectively unmtaintained for some
> years.  I would be delighted if somebody would be willing to work to
> improve it - please don't hesitate!

Jon,

As a matter of fact, with Greg's kind help, I could reach
Shibata-san, who is now with Linux Foundation.

I'm preparing a patch adding an entry of DOCUMENTATION/JAPANESE
to MAINTAINERS.

Fujimoto-san is working on an update in ja_JP/howto.rst as well.

You will likely see both of them shortly.
Stay tuned!  ;-)

        Thanks, Akira

> 
> Thanks,
> 
> jon
