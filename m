Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEE6C433EF
	for <linux-doc@archiver.kernel.org>; Sun,  9 Jan 2022 07:48:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbiAIHsH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Jan 2022 02:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbiAIHsG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jan 2022 02:48:06 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96058C06173F
        for <linux-doc@vger.kernel.org>; Sat,  8 Jan 2022 23:48:06 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id c14-20020a17090a674e00b001b31e16749cso17301667pjm.4
        for <linux-doc@vger.kernel.org>; Sat, 08 Jan 2022 23:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d5ZnqQUYxwH5Z+nTOQEGdiZMg4OSCqJRpQe5IRjKmKw=;
        b=bDa0yzC/i2KXd9tohP0HTTtOMeu/RG3uUlRWi6U3W6eQavXmB3ic3Kjd7M67aj/2MH
         VJLrKuCRDqxLCtz1GqAzW4CCv6XaeG58A0KdmJM8+SgV6Q4AtwszRCoNXVSnZPS6pPgk
         vmDfUUybPDJZvLCvfyzpbrsCjFHPw4amjbbi3GYn4U5O8Z/pL2J05H8qTxZNnwQBvOOt
         mNCfIIGNyVZ7Xh++Faiwjz+wbdVVO4FzQQ1XbL9lsvcJxUGJjjmx7mPxaA6oaBkmTAm8
         NyFBm/OZvu51YEPDmoH3Ui5i5aqkAfQAHCSh1Ll43iyYTZfQ0fxVzrANmVf4WtnYF/YW
         ckAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d5ZnqQUYxwH5Z+nTOQEGdiZMg4OSCqJRpQe5IRjKmKw=;
        b=y2dDa7l04O5tLSjvr5/0Tzm5sUjR68aqojeEFbU7oloWeInJchLl+gCrdX2Tw8mjJe
         iSEmTdZ9ub4eLJoGsfYVveDhb6OSf5DQ/MYs9Tvd3t7Cz8Ke2h4QWdMXeFFdU0x/QALR
         kKObRoDkjGtrzTchQMHhXhhgu+UZ7D0FTQ9kZ6dfBUs107Bi90Lqe9DDzvQHED1tVZVR
         aKjnnN+xk0J6zADTcWwfev6XY3qqeEOa9iZcrgLbye9kBQJfTAo6ogWFo3yGCK4UPfMQ
         w5nwL8aYufezeL5EIq2tusXk+8s7LPiq2RZNGBDlXSrskZ2F7Wv4tjE5ZzQf0DxEJJjU
         PEUg==
X-Gm-Message-State: AOAM5321mEduHumOsNhCCiqIbY0/1CwiTvTaTn+reXswl0F2QyUzIL4p
        Vfj0E+A+5yAibwGQpZeHW44j2LsEwRQ=
X-Google-Smtp-Source: ABdhPJzLSAtqCOMyhgAyruond1igJafvq98DvTz68DQ+SDcKOdFjAC0CCo/EUgFuVuPXRshB8JN+YA==
X-Received: by 2002:a17:90b:1b4a:: with SMTP id nv10mr24557319pjb.245.1641714486022;
        Sat, 08 Jan 2022 23:48:06 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id ot6sm5597677pjb.32.2022.01.08.23.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jan 2022 23:48:05 -0800 (PST)
Subject: Re: [PATCH v2] scripts: sphinx-pre-install: Fix ctex support on
 Debian
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <84f90b41-7a18-d83c-8739-1d394175f74a@gmail.com>
 <63882425609a2820fac78f5e94620abeb7ed5f6f.1641429634.git.mchehab@kernel.org>
 <15aa5e03-8aac-af55-badc-b905ca91f281@gmail.com>
 <20220106043707.0d40cd11@coco.lan>
 <370ffe86-864f-5690-7304-cd4ea24aac9d@gmail.com>
 <20220109072851.172675c5@sal.lan>
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b49a5e14-6aeb-a9fe-f29a-095c79c21f88@gmail.com>
Date:   Sun, 9 Jan 2022 16:48:01 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109072851.172675c5@sal.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 9 Jan 2022 07:28:51 +0100, Mauro Carvalho Chehab wrote:
> Em Sun, 9 Jan 2022 13:09:19 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
>> Hi Maruo,
>> (+Cc: Jon, linux-doc)
>>
>> On Thu, 6 Jan 2022 04:37:07 +0100, Mauro Carvalho Chehab wrote:
>>> Em Thu, 6 Jan 2022 11:00:08 +0900
>>> Akira Yokosawa <akiyks@gmail.com> escreveu:  
>> [...]
>>>> Longer term (for CentOS stream9 or RHEL 9), we might need to ask
>>>> EPEL maintainers to add texlive-ctex.  
>>>
>>> Longer term, the script is actually fixing a broken dependency issue
>>> on distros. So, bugzillas for Fedora/Debian & derivated ones should be 
>>> opened for "texlive-xecjk" package to also select "texlive-ctex"
>>> (or whatever other name those packages have on distros).  
>>
>> FWIW, I asked Karl Berry, who is the chief maintainer of upstream
>> TeX Live, to add a dependency on ctex to xecjk [1].
> 
> Thanks for forwarding this question to him and to address it on distros!
> 
>>
>> [1]: https://tug.org/pipermail/tex-live/2022-January/047648.html
>>
>> Karl has added the dependency to xecjk as of rev 61529 [2].
>>
>> [2]: https://tug.org/pipermail/tex-live/2022-January/047654.html
>>
>> On up-to-date vanilla TeX Live 2021 (>= rev61529):
>>
>>     $ tlmgr info --data depends xecjk
>>     ctex
>>
>> With xecjk < rev61529
>>
>>     $ tlmgr info --data depends xecjk
>>     (no output)
> 
> Nice! Yeah, this is the long term solution, but still won't prevent
> people/distros based on older packages to keep using packages
> without such requirements.
> 
>> This dependency is expected to be reflected in the TeX Live
>> packaging for next Fedora release.
> 
> Yeah, Fedora is usually keen to changes.
> 
>> OTOH, as I mentioned earlier,
>> EPEL 9 (for CentOS stream9) doesn't have texlive-ctex at the
>> moment, so we need to see what happens there when RHEL 9 is ready.
> 
> Yes. RHEL/EPEL is usually a lot more conservative.
> 
>> Note: the xecjk -> ctex dependency is already taken care of
>> by openSUSE's TeX Live packages.   
> 
> On both Tumbleweed and on Leap?

I mean on Tumbleweed only.
Leap's xecjk is v3.4.8 and has no dependency on ctex.

> 
>> As for Ubuntu/Debian, it looks like TeX Live/Debian packaging
>> maintainer, Norbert Preining, has no intention of adding
>> dependency of texlive-xetex -> texlive-lang-chinese as can be
>> seen in his responses to a Debian Bug report [3].
>> I think this is a reasonable choice as most xetex users don't
>> use xecjk and texlive-lang-chinese is large in size.
>>
>> [3]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=961703
> 
> Debian package maintainer could reconsider it after the upstream
> dependency addition, but probably only for SID and yet-to-be-released
> versions.
>           Debian is very conservative on their releases. 
> Even if SID gains such dependency fix, I would be surprised 
> if they end porting a dependency change like that to Bullseye
> (which should be the latest version for ~1.5 years - with LTS
> extending it for ~3.5 years).
> 
> It sounds worth mentioning about the texlive dependency decision at
> the Debian bug.

I'm afraid I don't think so.
At Debian Latex wiki [3], they say:

  If you want to add support for your language (other than english) in
  TeX Live, search for texlive-lang [4] and install your language.

[3]: https://wiki.debian.org/Latex
[4]: https://packages.debian.org/search?keywords=texlive-lang

This is the Debian's policy of TeX Live packaging.
I wouldn't complain if they say "Just install both of texlive-xetex
and texlive-lang-chinese if you want xecjk to work."

There are a lot of inter-collection dependencies in upstream TeX
Live, but many of then are ignored in TeX Live/Debian packages.
For example, ctex has a dependency on xecjk (reverse of the newly
added one) in upstream, but Debian's texlive-lang-chinese does not
depend on texlive-xetex.

        Thanks, Akira

> 
>>         Thanks, Akira
>>
>>>
>>> Worth mentioning that the script dependency-checking is should be smart
>>> enough to not break once texlive distro maintainers fix such issues.
>>>
>>> Thanks,
>>> Mauro
>>>   
