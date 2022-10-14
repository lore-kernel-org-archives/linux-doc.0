Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6658C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 14 Oct 2022 15:51:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiJNPvh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Oct 2022 11:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiJNPvg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Oct 2022 11:51:36 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1041F1B2BA6;
        Fri, 14 Oct 2022 08:51:36 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id r142so4189937iod.11;
        Fri, 14 Oct 2022 08:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sRuGYF3F7gEBXEg+1BmF+nQvrywCcoMxUyO3qHOOhe8=;
        b=B3N4JdLquttdgdp/WGJ1+k90x8MtWc9jsMbbHETgT/G72NlMAfG90sWopQ+VqARUB1
         omcS/qWrl/AYWcBaP/9Rbx4nxbcLxfjJIspfDopg2zmOWf4kmaoYWb53UDWjCeYU49P0
         RJOkytT7/vNuFezPcgafDbNw4LXsjOxD7skY2xAIkgoGJQtq+0UYQyNsYyaPZAqPR7C6
         UWUTIZs1FCnZ/N8A9VWokHKQR9vyq6hK/0zPY2/koc2i1aPFSnFPBKpl1sk2pzRo70+v
         LqteXemsyw6W+5W7BmkAdtRZlQliidJCAoCJqBrd/CCnI2HOordARBP1MrQpY2OvM5yS
         0Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRuGYF3F7gEBXEg+1BmF+nQvrywCcoMxUyO3qHOOhe8=;
        b=svNkPzYyFc2CApZfHE3cqeFxA/TMEXmqQxkS81L+lFROcSX86ZfHq8mVzPYLyduEbL
         M6aXfsbXmWxUPT3laqFLhRnIUGlvZVonMGv3t08+RspzuDvowZcRgNzPrHIQ39bfHgkU
         YU4jCaO+ybwokqSxvwwQOQ5WIt0Cm/4iJGaGS6gog08fvTnoOw5hbpH83upY4WMdZN4I
         gbfh7WNe7c4VxFXQGWHdC0Z1XMI4JCpVBwz3DZFvF0IMCAkwLQgv03lkZF5/0osjPUsF
         YkDJGu9V+y9xElW4UG8Jtmzhjc+1vYYodR1Vy6lGZ3I6b+/3Jyr8J/BP+5cVk1cNOY5j
         8vAg==
X-Gm-Message-State: ACrzQf0op5r7i1eSn7kHyvYq7FuQeLRIReMc9D5RpvsR/lms0nRtZXn+
        9Zs43TC2kXMhN9iXQfoVDX/vytjuXLC0Lr4EHx4=
X-Google-Smtp-Source: AMsMyM62u9VBc/D1k0F1ANTlaBNNfbTI13oHfNp+dpSERIzoXV0RL6YBgoilqVF4edFSfk1gJAQ9HsNB2f2pZ+mav+c=
X-Received: by 2002:a05:6638:14cb:b0:363:ed95:ce4c with SMTP id
 l11-20020a05663814cb00b00363ed95ce4cmr3161318jak.308.1665762695510; Fri, 14
 Oct 2022 08:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221013184816.354278-1-carlos.bilbao@amd.com>
 <20221014142454.871196-1-carlos.bilbao@amd.com> <20221014142454.871196-2-carlos.bilbao@amd.com>
 <CANiq72=DuRw_0AiC7LtWA7n_0Rpsz3cExXj4YX4zu4o8RxugJA@mail.gmail.com> <735f9ddc-01b4-f9ab-8d28-6d10630c994d@amd.com>
In-Reply-To: <735f9ddc-01b4-f9ab-8d28-6d10630c994d@amd.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 14 Oct 2022 17:51:24 +0200
Message-ID: <CANiq72nu=48iksDnWskqJMez7sXo143JDrX9fXuCro2U8LXXcg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Documentation: Start translations to Spanish
To:     Carlos Bilbao <carlos.bilbao@amd.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, bilbao@vt.edu
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 14, 2022 at 5:33 PM Carlos Bilbao <carlos.bilbao@amd.com> wrote:
>
> Thanks Miguel. You came to mind immediately when thinking about CCing
> someone else that's a native speaker.

My pleasure!

> I believe the idea is that, even though we inherited English terms, like
> "bug", we should try to translate as much as possible and don't fall into
> what people sometimes refer to "Spanenglish", mixing both languages.

Yeah, that was what I was thinking. Personally, I think translating
common words like "bug" is fine, but more technical ones like
"spinlock" may make things harder later when the reader goes into the
source code or English docs.

Thanks!

I forgot, by the way: with the typos I mentioned fixed, it looks fine to me:

    Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
