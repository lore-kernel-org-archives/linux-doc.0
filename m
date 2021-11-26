Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC2CC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 26 Nov 2021 07:18:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359208AbhKZHWE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Nov 2021 02:22:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359220AbhKZHUE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Nov 2021 02:20:04 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35CA9C0613E1
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 23:16:44 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id e3so34938121edu.4
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 23:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tszJl3nRrOBevJxO8tAz11+YJXfp2nVs65aqfAK7OeE=;
        b=ItPWoq8OOtt+ENwFjKXv6Iku99UMURX/FYI1SFTacqs2+qJFsbGKH0vsirTSwKeihA
         CGNdCPG7ZXoWPXT7VxgRV2IrjwYSB0/02/k+p/vunK7KRsy2OCgKdV5ja1LVKOTG8Dwm
         U2lVS65Uw8QfC1Zf1TLc2Pr5kN3qfER/WsJXq9iljPLBqY/FNPhhYIPXRl0j5q8pZUn8
         220vE19DkXjLXqTjIJj2Nd1m6WTvh3prxskaR/1QdHgpppgvtpOuU3TDyw+VDWO6dH/6
         U6+bQ7XlO2Cb8qyi0nRw8BXbUrBxLI8QyiIymMwXawKBQOSONFNSeXJNq3qpK8ZH2nVo
         +MpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tszJl3nRrOBevJxO8tAz11+YJXfp2nVs65aqfAK7OeE=;
        b=i1U1r/g31Fl+IIkC3JxK0uWNhhuF02yFg1MJmiZ/RcmyjzcUmkeKcsD8pIAFrCpGUN
         X8otgK3cQBv4gSjY6d1V2SDp+SxVIpgUq2VRNp4Qawas4mAYUGnPsRjWqnzad6Qhqwm1
         5dnN0ClDuW7XfT25lgzwtrTnAeUBJCgZX8GQHVzQuvJxtRFubRtf6SIRrIrDVsoAlf0t
         UKG0fwboZL2yp7H8n1z4k3dayNbbdUTuF1FpVMvNnH4i+WcIHKRqcxgBhquz2voxkoG7
         Ad0zDzWpSBjPuPiI4/jT2x6H8Tn3t1N4ke4iUiemA3qsLQygMmEFUk1v/ksyHjXcEX0x
         ygIw==
X-Gm-Message-State: AOAM530AAqWZmiMcqImWuyXhTOahiYMO83b50xE7CVgVmoWBIJ+JqC3e
        wBiq4Gqbuco34dWq0RfDz9Lqzr2L/+W831ReLhzFtAkFAAN6Fg==
X-Google-Smtp-Source: ABdhPJxr+mgQO/tGGWGLCgVfXM57lHwgCuStOtBvO+BkRLqSdhcZQgx/wmlYjWPThHxA/Amw5eONTAX4fSbMtwP8eVQ=
X-Received: by 2002:a05:6402:147:: with SMTP id s7mr45728798edu.8.1637911002824;
 Thu, 25 Nov 2021 23:16:42 -0800 (PST)
MIME-Version: 1.0
References: <7df04f45-8746-e666-1a9d-a998f1ab1f91@gmail.com>
In-Reply-To: <7df04f45-8746-e666-1a9d-a998f1ab1f91@gmail.com>
From:   Joel Colledge <joel.colledge@linbit.com>
Date:   Fri, 26 Nov 2021 08:16:32 +0100
Message-ID: <CAGNP_+WRohG5BMPvJUM1gAm8gOk=b1jn0_+TMr3FyqxnP+_EmA@mail.gmail.com>
Subject: Re: [PATCH v2] docs: admin-guide/blockdev: Remove digraph of node-states
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Philipp Reisner <philipp.reisner@linbit.com>,
        Lars Ellenberg <lars.ellenberg@linbit.com>,
        drbd-dev@lists.linbit.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Joel, are you OK with this change going through the -doc tree?

Yes. This has my ack. Thanks!

Joel
