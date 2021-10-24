Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB01C433EF
	for <linux-doc@archiver.kernel.org>; Sun, 24 Oct 2021 22:08:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0413361002
	for <linux-doc@archiver.kernel.org>; Sun, 24 Oct 2021 22:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhJXWKt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Oct 2021 18:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbhJXWKt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Oct 2021 18:10:49 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE170C061764
        for <linux-doc@vger.kernel.org>; Sun, 24 Oct 2021 15:08:27 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id r6so5433129ljg.6
        for <linux-doc@vger.kernel.org>; Sun, 24 Oct 2021 15:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8kIvvEhKum1ywgv+3tY8SIChEwJdC5TWn28Ac2GrFuk=;
        b=pNpAUHWwRO6+G6C0zrKOSUrJJJGo51qvYJ4g6w73CDOpvDbxbn8NjdrCSk7QkXDNei
         Fzua9e/+HoESqEDzQKrOaPFOZOe2OfUs7QgYAbKleqxvTm2vhSvReTCue3MXiwtwXwIB
         F5Rvj2ZgPVW/OlQuqt7B0cLIWu9OoLgybVLjDN6ldiAl1xlVWlcWSRlkoqxBPiqjkH8D
         B3Mq8dHMMd0KdI60DFFt4JSYitiZn75KySwbL/55y73Db9CMZemcgXsK167imyWi7jk6
         UPCYdXklrQ1tG6ItQIMeLh/zed9k5jHFfv+X1iiaBU6GeVnG3Dop1lHWzUkY4j5WE0cW
         wB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8kIvvEhKum1ywgv+3tY8SIChEwJdC5TWn28Ac2GrFuk=;
        b=GcTzgSuEs4LhLrEvwgO9c0N/G6ZnCZIsa/s5bwUSJBIM1OIaUhNVE1XHrHOzVfUjB5
         BENCayxVyzw8wSi3U8+l4fx8vW7hplQ9GDzRBE5ttDaP3LcK3UEi6pg+tVlPbXpLcA23
         LoNLO3+EEtrzVmuQihkYdypbL7/XvukS5s6jZlkKIaFk39qfpL/t51Ikd2s/jmSdc6EY
         kp2J5mMcyyI8HQn0rgFYf/UE2oChJVFA85L/13yI0VJO7vgVD9eMnwuRM1T9VmGMRmpY
         nHuAaghZG8d7lqdmhpvo0GUOcrT5kRgxqFRLok9PU70wgrVcJrREtSvohILLMxma78gj
         1xPw==
X-Gm-Message-State: AOAM5311HQ7BODJjzbQsy038xa5ABWXHK4Jfh4i5UQzMSagBwFpTd+X2
        dvWPu4XjJNqPmXHL61qKgxotoC5NkFywlhhrkQyX6g==
X-Google-Smtp-Source: ABdhPJyfkCusDTMQwPI0B6mAHJxEV7u5zpWtXUN4E9KRw0d7rZdlpy2GooLTeUqHzrtswf841yqhK/E33Qe9Gq8V0n0=
X-Received: by 2002:a05:651c:a05:: with SMTP id k5mr14932298ljq.288.1635113306156;
 Sun, 24 Oct 2021 15:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634630485.git.mchehab+huawei@kernel.org> <ec54d0aa65a3b98ae425721663f196b499a59513.1634630485.git.mchehab+huawei@kernel.org>
In-Reply-To: <ec54d0aa65a3b98ae425721663f196b499a59513.1634630485.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Oct 2021 00:08:15 +0200
Message-ID: <CACRpkdZMSsCmJhsNsP_aTvT7xanOQQkDRk6gK9PAEAnTgTU3qw@mail.gmail.com>
Subject: Re: [PATCH v3 04/23] MAINTAINERS: update arm,vic.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 19, 2021 at 10:04 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Changeset b7705ba6d0c4 ("dt-bindings: interrupt-controller: Convert ARM VIC to json-schema")
> renamed: Documentation/devicetree/bindings/interrupt-controller/arm,vic.txt
> to: Documentation/devicetree/bindings/interrupt-controller/arm,vic.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: b7705ba6d0c4 ("dt-bindings: interrupt-controller: Convert ARM VIC to json-schema")
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I suppose Marc Z could merge this into the irqchips tree?

Yours,
Linus Walleij
