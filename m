Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B97C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 11:15:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D373611EE
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 11:15:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236528AbhEQLRF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 07:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236514AbhEQLRE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 May 2021 07:17:04 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 946B9C061573
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 04:15:48 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so2669459pjb.3
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hgSOhI/WIIiglUginOv8+lYDLwfbenkym7tMchvfv1g=;
        b=anyx0GCtkUQ86DcChRtN3IstnlEh+O1GKxrv4Bt9G6nmv0znRlO0jKpaibUS1Co5m0
         JIELHADIg5iPcWepwD6AL8rdxSQsdcFQWNy5uo0k0mc90gTmYmKH7R7/TSkJSB+SnE6x
         W9mnR98h9JcBzdGPeYCuxaZ6t57Q1kbrUnqWEKhYqjqno6cEnHQnosZUSymRf7k5IXlu
         /+KqZfXdnnwOUL25ilro3Ny5ZjXbnpmGtIEt7hjw3/zcoySWRYyr2gn0xzuuMSsU0vey
         BSBbyQJPRbAsBhz39I1OWXai1Qfgsow2XKuHJKoUheW2+OgOBWM10cFYXpWlvPkYZ+i1
         PtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hgSOhI/WIIiglUginOv8+lYDLwfbenkym7tMchvfv1g=;
        b=PXCo9yyhgNzg9i7zQCJUEJo4GkJckhCwmIZKYTVcy4HA+EWKOPLkspEk5pzinC017w
         JtPoD6AFx1gLnGMqCrr6KqtnOraeSZLIjwLKL4SytFBCPh9apEvILxHAU5b/m1FXYOAa
         aU5KAp5Q2W1Re3wpOT86bWhn6q/8BTk4vQpIQ6Eb69iVNKAiiizp8/Chvxopg1pBaKWi
         TkjSQRNsMJwO6g+xNfdU54rmthoJHUHowyDnIbGcWPj2fRBmatDk+8X1Wia0g0GV8l1T
         TU4RAUwJ5rQHgK/Gddh/Ymy54lTFt7G6NtVeVZ9HY/Myx+gOFHR10UULmpZgnOph0ckC
         v5fQ==
X-Gm-Message-State: AOAM532jNVk62rinCl1dkQ4cm16zvISNtwrCGAmUePqQfxqgAyF2vd9i
        2dkm/8+X12ZF1arV+r8OpTI=
X-Google-Smtp-Source: ABdhPJwxYvWJyJ47jEiHb3fIY8qg5V4/uwrtqfxTD5BKvjblRkWuwR9tB2/R4p5idVTeHI4ZPZ6U3w==
X-Received: by 2002:a17:90a:a78d:: with SMTP id f13mr49002693pjq.161.1621250147883;
        Mon, 17 May 2021 04:15:47 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id k1sm3823722pfa.30.2021.05.17.04.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 04:15:47 -0700 (PDT)
Subject: Re: [PATCH v4 0/6] docs/zh_CN: Add translation zh_CN/maintainer
To:     Wu XiangCheng <bobwxc@email.cn>, Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
References: <cover.1621243426.git.bobwxc@email.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <64bb3d53-30c2-e51e-ddd4-66ddeb12af51@gmail.com>
Date:   Mon, 17 May 2021 19:15:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1621243426.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

All looks fine for me.

Thanks
Alex

On 2021/5/17 下午6:34, Wu XiangCheng wrote:
> Hi all,
> 
> This set of patches aims to add translations zh_CN/maintainer.
> 
> v4:
> * Modified translation of word "backport" and a sentence under Alex
>   Shi's suggestion, thanks.
> 
> v3:
> <https://lore.kernel.org/linux-doc/cover.1620932189.git.bobwxc@email.cn/T/#t>
> * Rebase to newest jc/docs-next tree
> 
> v2:
> <https://lore.kernel.org/linux-doc/87sg2q63sd.fsf@meer.lwn.net/T/>
> * Modified some words in [Patch 3-4/6] under Yanteng Si's advices.
>   Thanks for his review!
> * Pick Yanteng Si's reviewed-by tag for [Patch 1-6/6]
> 
> v1:
> <https://lore.kernel.org/linux-doc/cover.1619093668.git.bobwxc@email.cn/T/#t>
> 
> Please note that since each patch need to modify their own entry
> in zh_CN/maintainer/index.rst, patches should be applied in order.
> 
> Thanks!
> 
> Base on jc/docs-next
> 
> Wu XiangCheng (6):
>   docs/zh_CN: Add translation zh_CN/maintainer/index.rst
>   docs/zh_CN: Add translation zh_CN/maintainer/configure-git.rst
>   docs/zh_CN: Add translation zh_CN/maintainer/rebasing-and-merging.rst
>   docs/zh_CN: Add translation zh_CN/maintainer/pull-requests.rst
>   docs/zh_CN: Add translation
>     zh_CN/maintainer/maintainer-entry-profile.rst
>   docs/zh_CN: Add translation zh_CN/maintainer/modifying-patches.rst
> 
>  Documentation/translations/zh_CN/index.rst    |   2 +-
>  .../zh_CN/maintainer/configure-git.rst        |  62 +++++++
>  .../translations/zh_CN/maintainer/index.rst   |  21 +++
>  .../maintainer/maintainer-entry-profile.rst   |  92 ++++++++++
>  .../zh_CN/maintainer/modifying-patches.rst    |  51 ++++++
>  .../zh_CN/maintainer/pull-requests.rst        | 148 ++++++++++++++++
>  .../zh_CN/maintainer/rebasing-and-merging.rst | 165 ++++++++++++++++++
>  7 files changed, 540 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/maintainer/configure-git.rst
>  create mode 100644 Documentation/translations/zh_CN/maintainer/index.rst
>  create mode 100644 Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
>  create mode 100644 Documentation/translations/zh_CN/maintainer/modifying-patches.rst
>  create mode 100644 Documentation/translations/zh_CN/maintainer/pull-requests.rst
>  create mode 100644 Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst
> 
