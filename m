Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5D7C4320A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jul 2021 14:53:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A2CC60F5C
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jul 2021 14:53:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239276AbhG3Ox0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jul 2021 10:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239320AbhG3Ox0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jul 2021 10:53:26 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259C7C061765
        for <linux-doc@vger.kernel.org>; Fri, 30 Jul 2021 07:53:20 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g13so18365361lfj.12
        for <linux-doc@vger.kernel.org>; Fri, 30 Jul 2021 07:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WwILEX7NR1VzEi/uBdrHjZ2rhekLFtKl+IjEJ6PsRbo=;
        b=eSRscB5LQZ42d/wJxzzYPB1M2Ev+d8TH1pk1kq7FZs6bBPalAKZ3cFxeJSuSpu3dN0
         Em59MuepSMmpBso4Ynu1+27CaFcZ/iVxU8JvxIa1juSCTwjR6YMwx9wll3fjX5aCGryx
         45DqbbN+Vkr/RNTQXWcM1pYi75BmOfzzVzQXBH9/jduPm+5mKvBVTvWDtNNS2TWuLZA7
         SjJ+vWgQYQe8cUdVUakQ72OAzF+V4E0mXkB/PO+kFm4hQvjmJr/4XUmQZIE0UtBv6/no
         Cz6pNjN2L+umPZr0BsmaHwqvuBPvKfnA6X6V143fY0lGA+TJgx0m3RbMz7Vh66AHtjOK
         lPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WwILEX7NR1VzEi/uBdrHjZ2rhekLFtKl+IjEJ6PsRbo=;
        b=oxXLbO2guCNCTqDUv94ZymnVocQ1kBaJicE2tsDeO+jhsDkZcqxaiZOu5/4/cSFLNK
         H/VLqou7m5AGRuQ/L+CA0nN6xa91Eh/Gw65dFPOJpSLuss+p9oKtI7f5DjkeEdwvickU
         uZBkXDAWLOHOxJn0yAOOQ6PvbrQEqPMFyJGZjY4Q3IuUggTCM5uP6Aylz8RhM6jBZl10
         TcJybacPhJBIkP88UU4ortNzqBsILmm1u2OIoUYawn39GWuO6DEihbiQjzn8QHn4tDan
         IITB/guLzfDJj+RwQFqjxMG/JT64DXcsqVQ+Zelip87sS2oxEOwEfEvsxZMOUeDZEaC6
         HctQ==
X-Gm-Message-State: AOAM531gL0W8JtSn3qjXVeF633ZdETD5xsU/ok6I8XyJc223NfKFZFZP
        cRc6fcFGiceUgo9iOQcP9orfgzmhc4ga1hh7OfAWWg==
X-Google-Smtp-Source: ABdhPJwjcrWpoUYw/qBMqmhargQPTVX8q6Pq2/amq2QpdOcbNvK2a9I91gSNOQFdTDGdy12DFX+Mc+m7GdywLBd8974=
X-Received: by 2002:a19:4803:: with SMTP id v3mr1839747lfa.83.1627656798290;
 Fri, 30 Jul 2021 07:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210730051605.2626-1-caihuoqing@baidu.com> <0516372e-0120-ff52-bf9a-cf1cda9a633f@email.cn>
In-Reply-To: <0516372e-0120-ff52-bf9a-cf1cda9a633f@email.cn>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Fri, 30 Jul 2021 07:53:07 -0700
Message-ID: <CALvZod6sUh0XQGVb4wEfzGNDcrLabgmjEdu+wh0g1c=cvvci4Q@mail.gmail.com>
Subject: Re: [PATCH] cgroup: Fix typo in comments and documents
To:     Hu Haowen <src.res@email.cn>
Cc:     Cai Huoqing <caihuoqing@baidu.com>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Cgroups <cgroups@vger.kernel.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 30, 2021 at 6:44 AM Hu Haowen <src.res@email.cn> wrote:
>
>
> =E5=9C=A8 2021/7/30 =E4=B8=8B=E5=8D=881:16, Cai Huoqing =E5=86=99=E9=81=
=93:
> > Fix typo: iff  =3D=3D> if

This is not a typo. 'iff' means 'if and only if'. For details see
https://en.wikipedia.org/wiki/If_and_only_if.
