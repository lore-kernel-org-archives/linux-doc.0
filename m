Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5C2C433EF
	for <linux-doc@archiver.kernel.org>; Sat,  9 Oct 2021 03:24:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DC5A60FC3
	for <linux-doc@archiver.kernel.org>; Sat,  9 Oct 2021 03:24:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244025AbhJID0o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Oct 2021 23:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244114AbhJID0n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Oct 2021 23:26:43 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24952C061755
        for <linux-doc@vger.kernel.org>; Fri,  8 Oct 2021 20:24:47 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id g10so42534320edj.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Oct 2021 20:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IZRlkZIYHzl58za9sUnq4fOlO8pVB3H3OBy0aiY0iqw=;
        b=XZF1s2tHpyMwHJkpvi3Wm3uoo0wBTKfHYjYvXxYqbA3AlVRzHdNVT4Tj+Z7OUT5PtA
         yXqfo/f2nlfTw9O/6il2ubiIBy8xQWIZUHsQ+fxqituPD2UuugtFrzXMplXv9nof2HkH
         3G1CGdw9TP0oGI1RrvZbW7CGM03ELaFajceS7nsYn+vXx2WfzO6iTfmE6opBA1QpiJGk
         vmYpe0c5NlFywzyOgtUlP/rmkgODWu1SWu3YwywHV9qBGP4b8gi2oUs0qVrVPfdlRD/A
         TBzjod14ceAoHB0BjC4/FBMmU22oWHU466uWKYiKlQSWDyaZklDkc6ouiGNqwAkgtMbe
         MyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IZRlkZIYHzl58za9sUnq4fOlO8pVB3H3OBy0aiY0iqw=;
        b=2Q8n9Zr+JomJKk+6LcVRhBeqv5zRkZgOC+NvGtpvatA5qOtH4vhNOrUU95dVohgjh1
         G1Cmgy45rWG04eefArwLs5C5+qVIsDTSdeWSBcxSQuAw5mqda27kp1iTBXEsC94BrqLW
         gZZ5A/oez7kDE59SjGC9/7yYZTy0zStddzfFfTJ2EIxAsQdSx5jfDFTpBvR8NpCd3VeW
         uFH+j7uH7ZLZXlHwVqOtjIszQCcsSmvgEHyrGR4cffRRWQCwtz784YnJ3vlh8VMw99Uv
         eZUoimFBIsDH28LGBvPBuxiQRijD8pqm23fJ1ItU0Rq11h8pE/bMmiZ7ksjwIQk50Rhr
         D4FQ==
X-Gm-Message-State: AOAM531Eh2pbxQZQ0CdPsjvCLAqMkZaDmolTpCMBHFELOmTosvIll+7o
        ieBSVkGBxX59rXa8PAe/zoGjyjj9kU7fui4PaVkx
X-Google-Smtp-Source: ABdhPJyG2PqyTbN74aP30ZckkjH25mY7f9nlIIcHgynGPXVzG3aBnt4SvoNb+WWer8qY/2E+24r0sr3gDa+bHf7mgIU=
X-Received: by 2002:a05:6402:274b:: with SMTP id z11mr20848615edd.151.1633749885735;
 Fri, 08 Oct 2021 20:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211006202904.30241-1-rdunlap@infradead.org>
In-Reply-To: <20211006202904.30241-1-rdunlap@infradead.org>
From:   Yongji Xie <xieyongji@bytedance.com>
Date:   Sat, 9 Oct 2021 11:24:35 +0800
Message-ID: <CACycT3umszHAXOf5shB7_fg0WNTon0rLdrMRZtzX=hm7RxfRVQ@mail.gmail.com>
Subject: Re: [PATCH] VDUSE: fix documentation underline warning
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 7, 2021 at 4:29 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix a VDUSE documentation build warning:
>
> Documentation/userspace-api/vduse.rst:21: WARNING: Title underline too short.
>
> Fixes: 7bc7f61897b6 ("Documentation: Add documentation for VDUSE")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Xie Yongji <xieyongji@bytedance.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/userspace-api/vduse.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Xie Yongji <xieyongji@bytedance.com>

Thanks,
Yongji
