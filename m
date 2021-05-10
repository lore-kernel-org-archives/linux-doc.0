Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B718C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 02:46:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 318D0613D0
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 02:46:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhEJCrr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 May 2021 22:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbhEJCrq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 May 2021 22:47:46 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1345BC061573
        for <linux-doc@vger.kernel.org>; Sun,  9 May 2021 19:46:43 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id ge1so8908594pjb.2
        for <linux-doc@vger.kernel.org>; Sun, 09 May 2021 19:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EgEgJpPSYf/eY9Vy0sjmIvhJpoGgghkHnIiDNv4FFDE=;
        b=IQYDdN6rUhIxuZZ1nPIWXj7/P8+WK1Ow/72YtTtT1wI0akY9c7OJoYbJQmdxSFMYY9
         agsNyrf7Rm1Lda0XkHWSkQpEhW93Yd4sm9bcCp2oeCWboJIur2VPRw1oo4/QgbT/2GOd
         GURH2L4fbL1+0IpjcbEfeo85soJSbEE1y40dbWGj9pe1vJmPfYCbVx1cAcU+n6wMv8++
         kVj2WaZ/8Zc5a1r+tYJ1eOyogiCaLe9W693bn0MschLhW1EYNbT0l/RhId+lRnnsZR0Y
         N578q+YkPxYUI4nNJt+QgoDm9rP2PYBB5fiFVrLebHSFHTnKw0SoL2Qu+vOJ1+BjTXUb
         NO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EgEgJpPSYf/eY9Vy0sjmIvhJpoGgghkHnIiDNv4FFDE=;
        b=pKoHUhtrWY4XyiUfc4ldLZDbtT0es+NT94ViOJlHtZjB9NI+c7sfEXFGApxgWqUbsW
         C7OVcCci+2EnfgZKcFGCWRL5fpkp97wdPURl11spxiR5+fZCWLAfssyZi5DxhbM6+4I7
         0NAhjs3hEQHYmrZsvFGQu+SffehrqPxYQ6rj0V1rL0/0BfYO1IEnr5ona0kHwoUjGkKn
         x1H84xCp/wAktkizCySsqdKnP3iQmXVA8Lv9UXizD15cGmPMSI/6dTDBwAjGldrZ1ByJ
         Biml+4IwW54LpxwXIMw16M8pOuRMhTejQZaSg/NSHJDMt3V4nSzG0KIfH8Xjm6PiQaxw
         cmEw==
X-Gm-Message-State: AOAM531LQRc8M8l63+hqeJ1gdPe0W9PR8DkHbLNgtbrCtKxP/H5Ugyi3
        kamslTQHxY0DTf6/gx70G/64B6Szryc+W0oCIKJITQmPZM8=
X-Google-Smtp-Source: ABdhPJydlcQSLCD4pOUtpJkReD9BqCpNtfsYEt+070ouQdc0cCNhA/km/mihBqOUNRqLAHbxVMPmLvmBFHPsBPZiZyQ=
X-Received: by 2002:a17:90a:b292:: with SMTP id c18mr39809623pjr.179.1620614802627;
 Sun, 09 May 2021 19:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620286208.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1620286208.git.siyanteng@loongson.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Mon, 10 May 2021 10:46:32 +0800
Message-ID: <CAMU9jJpJpF-2+vqL87ewWfM2oP5Z11q4eXr5MedoNR_zmV9tWw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] docs/zh_CN add three core api docs
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        "Wu X.C." <bobwxc@email.cn>, Yanteng Si <siyanteng01@gmail.com>,
        Huang JiangHui <huangjianghui@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all:

>   I tested it on other computers (at least three) with no problem,
>   But on my computers it prints 1000+ warnings, I tried to find the
>   cause in the past few days but no clue.
>   So, the two patches may print as follows:(maybe your computer won't print anything)
>
>   linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:235: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:235.
>   Declaration is '.. c:None:: struct list_head *prev'.
>   linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:235: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:235.
>   Declaration is '.. c:None:: struct list_head *next'.
>   linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:235: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:235.
>   Declaration is '.. c:None:: void (*sync)(void)'.
>   linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:283: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:283.
>   Declaration is '.. c:function:: void list_splice_init_rcu(struct list_head *list, struct list_head *head, void (*sync)(void))'.
>   linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:283: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:283.
>   Declaration is '.. c:None:: struct list_head *list'.
>   ...
I've done a lot of testing and found that these warnings are only
reported in very old (sphinx 1.7.6)
 or very new (sphinx 3.5.2, this is the version I'm currently using),
and the default version (sphinx 2.4.4)
is all right, so the current warnings can be ignored.>_<

Thanks,
Yanteng
