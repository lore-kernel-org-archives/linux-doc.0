Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C6AC433F5
	for <linux-doc@archiver.kernel.org>; Sun,  9 Jan 2022 04:09:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbiAIEJY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 Jan 2022 23:09:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbiAIEJY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Jan 2022 23:09:24 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0102C06173F
        for <linux-doc@vger.kernel.org>; Sat,  8 Jan 2022 20:09:23 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so12457745pjp.0
        for <linux-doc@vger.kernel.org>; Sat, 08 Jan 2022 20:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j518aeT1GmSliQwjwQXYERsigs5RFDAl7IA3wlri+5w=;
        b=WMmiGP4NudbaJY/uh/fF1EdHFTh1woTj7XF1N2ePFaWoTKo48nJMkksPN5H3TeW2Ag
         ZUhOC3QkTY3u1U3FIAKuVFMwKNTLABJb7FtHbBqGTjD0+p+nHjEdmI7KqlOQCrhOX7p1
         XmnDonmDo6YJDd3rHV5ck24+bf393h/0v2Y/xxt0Em+1h8/ENNdMdjQwsEc2W9LArBVs
         IAck5O1w00mDjMgC46M04wksBoDrQHHay2yE363D7JB/FAcl9x6BUNZ79Ljx+yBxv14l
         gwfntgQuWK/JqV6wOHq26XCraAJkwwzz2dm/bhv8w5nyK2jdiQ4eCidrROKbjnupOgQf
         J6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j518aeT1GmSliQwjwQXYERsigs5RFDAl7IA3wlri+5w=;
        b=t7sqDI4zduy1UA1iNA5RQSZGE6kzA7S1YdHg8kxp2qal3nxTax4g/7dt9dGCYV1wh1
         NaDkoDe1X/jejcZv/lwmPwSMpEsdwKgqhaBe9xBwGKUfrsOE1r13RN2f0nNUcMELe0RL
         IpiBd41zMtUKnPO5GEPo4VzCG9V8JL479yx/bA2c0erLQt7Otq/Bs3lFj0tMblpobyE8
         c9gxXVb7S1AVYrkvsBMdKG9rpnx5wuHsE0I6mEJIQLsSK/fn8ap8mUesgC61Oq5O5i7I
         7cnNFNPd3uiIIG8z6tzN6cadlYDAcarOvGdBzu3M5/WjvBkpUVt2O8NMIjnGlfELqLFN
         KiAQ==
X-Gm-Message-State: AOAM531LTzq0rvEIVdJx4a0MuKI6hAo71FzNHFoxr7UgE6htZBAYS6EX
        dWS8Q6G8hAf3iOTPV6jsGeyOphi6dYo=
X-Google-Smtp-Source: ABdhPJyueIXeoE7xMFMVBMiNhJ2HEGfnl/o2adZLQwD/WENHdbMi2i/llx2eUuziW/gCr1ttGzR1Xw==
X-Received: by 2002:a17:902:8c92:b0:149:848e:e337 with SMTP id t18-20020a1709028c9200b00149848ee337mr56316622plo.139.1641701363188;
        Sat, 08 Jan 2022 20:09:23 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id nu14sm3908446pjb.17.2022.01.08.20.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jan 2022 20:09:22 -0800 (PST)
Subject: Re: [PATCH v2] scripts: sphinx-pre-install: Fix ctex support on
 Debian
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
References: <84f90b41-7a18-d83c-8739-1d394175f74a@gmail.com>
 <63882425609a2820fac78f5e94620abeb7ed5f6f.1641429634.git.mchehab@kernel.org>
 <15aa5e03-8aac-af55-badc-b905ca91f281@gmail.com>
 <20220106043707.0d40cd11@coco.lan>
From:   Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Akira Yokosawa <akiyks@gmail.com>
Message-ID: <370ffe86-864f-5690-7304-cd4ea24aac9d@gmail.com>
Date:   Sun, 9 Jan 2022 13:09:19 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106043707.0d40cd11@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Maruo,
(+Cc: Jon, linux-doc)

On Thu, 6 Jan 2022 04:37:07 +0100, Mauro Carvalho Chehab wrote:
> Em Thu, 6 Jan 2022 11:00:08 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
[...]
>> Longer term (for CentOS stream9 or RHEL 9), we might need to ask
>> EPEL maintainers to add texlive-ctex.
> 
> Longer term, the script is actually fixing a broken dependency issue
> on distros. So, bugzillas for Fedora/Debian & derivated ones should be 
> opened for "texlive-xecjk" package to also select "texlive-ctex"
> (or whatever other name those packages have on distros).

FWIW, I asked Karl Berry, who is the chief maintainer of upstream
TeX Live, to add a dependency on ctex to xecjk [1].

[1]: https://tug.org/pipermail/tex-live/2022-January/047648.html

Karl has added the dependency to xecjk as of rev 61529 [2].

[2]: https://tug.org/pipermail/tex-live/2022-January/047654.html

On up-to-date vanilla TeX Live 2021 (>= rev61529):

    $ tlmgr info --data depends xecjk
    ctex

With xecjk < rev61529

    $ tlmgr info --data depends xecjk
    (no output)

This dependency is expected to be reflected in the TeX Live
packaging for next Fedora release.  OTOH, as I mentioned earlier,
EPEL 9 (for CentOS stream9) doesn't have texlive-ctex at the
moment, so we need to see what happens there when RHEL 9 is ready.

Note: the xecjk -> ctex dependency is already taken care of
by openSUSE's TeX Live packages.   

As for Ubuntu/Debian, it looks like TeX Live/Debian packaging
maintainer, Norbert Preining, has no intention of adding
dependency of texlive-xetex -> texlive-lang-chinese as can be
seen in his responses to a Debian Bug report [3].
I think this is a reasonable choice as most xetex users don't
use xecjk and texlive-lang-chinese is large in size.

[3]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=961703

        Thanks, Akira

> 
> Worth mentioning that the script dependency-checking is should be smart
> enough to not break once texlive distro maintainers fix such issues.
> 
> Thanks,
> Mauro
> 
