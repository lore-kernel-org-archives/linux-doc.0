Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA54C4332F
	for <linux-doc@archiver.kernel.org>; Sun,  3 Oct 2021 22:10:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BA9F6137D
	for <linux-doc@archiver.kernel.org>; Sun,  3 Oct 2021 22:10:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbhJCWL6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 3 Oct 2021 18:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbhJCWL6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Oct 2021 18:11:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6F1C061782
        for <linux-doc@vger.kernel.org>; Sun,  3 Oct 2021 15:10:10 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id e15so63514360lfr.10
        for <linux-doc@vger.kernel.org>; Sun, 03 Oct 2021 15:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U9Mf9GI5Pm+kL+VrrV0E+/1cX+8MmlfNpjuTrHIHDBU=;
        b=yz+MMKs016NPuE07ZM/SC+j0anFa+U46jg+mEqlMroGgSo0OVRX/iofinaFE6ejX/x
         VmzstodfD09SW17AUy8oeN4nfpEg1VsLCoPIb3qX1pz40qF5uWpt7PQdZfFt4IkANUkT
         kbO945a/obo21YaI+yunotwvgZA8hGf4DX4wS+5Fqkd9lGVGx6BrKMR9YONncGZPmD2l
         Tay+n7KiAFQIa9c81prLgONI+BqzyXEFY5hXEdfBGz8n4MuJHHMfJAs/nVy7IAfWj2zF
         Od88lzNIPSr8M89btm4C01W7RyiHdr7I1IN5cmBmIA39pWY3OBgpEFZGEJrVPRfiQUmW
         aJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U9Mf9GI5Pm+kL+VrrV0E+/1cX+8MmlfNpjuTrHIHDBU=;
        b=z759WcPL2BFl/FrlTIZkhuvLPoIDTDwSe71jX2vDApUStO9XbHhxt8LgyYHELUW7vD
         eUNxvuHY42a0I2Vo1fnY8+pSRCyNXnawC8bipVFYm633DBiUFvRyy6U5CQZZe73YcClC
         lQrYdvIFcY5MCnnJgNbYvvLcNN7q1w1M8GqnY4PWt8GdnzifxjuXNbXv8KQ+mJVNo/GL
         2M0o7jAXZb4YL0LzbgfffoEHaj2Et4J8myXp4MlvhajEIVRxW3aOXblotVwnihxaQ7qY
         LOhqpG+8x1hoTWATHXYwB6NxfD0TnEQziO3He6qRQUHYCcyws0T++oepOky58620chmW
         rVyQ==
X-Gm-Message-State: AOAM533q08Ct72+n+S+OH68TV1vpozW9bLc43+4XP74Kf69Jfel06bcu
        dykPXQucGKd+AhjTgaVUUfAvFqqun/gH587L0k/X3g==
X-Google-Smtp-Source: ABdhPJwXQxgJnBiCJXHiEECucos6gkDzEYPUpOuN9ryCXhy30bNBzWy6TPluZ4UpN7159wDQXClY4Uo7sDaMjt8BupI=
X-Received: by 2002:a2e:510a:: with SMTP id f10mr12187903ljb.358.1633299008538;
 Sun, 03 Oct 2021 15:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210930232617.6396-1-dipenp@nvidia.com> <20210930232617.6396-9-dipenp@nvidia.com>
In-Reply-To: <20210930232617.6396-9-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Oct 2021 00:09:57 +0200
Message-ID: <CACRpkdaO8ydTEkPU4LT+ibzb_-5VEw9mdvMbu+R9cR6zv9MsDQ@mail.gmail.com>
Subject: Re: [RFC v2 08/11] gpiolib: cdev: Add hardware timestamp clock type
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 1, 2021 at 1:26 AM Dipen Patel <dipenp@nvidia.com> wrote:

> +       if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags)) {

I don't know if it's here or a few other places as well we could sneak
in a IS_ENABLED(CONFIG_HTE) to make sure the compiler will
optimize out a bunch of the HTE support code if HTE is not in use?

Just an idea, I guess it's not the most urgent.

Yours,
Linus Walleij
