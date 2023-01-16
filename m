Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353F3C46467
	for <linux-doc@archiver.kernel.org>; Mon, 16 Jan 2023 00:42:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbjAPAmV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 15 Jan 2023 19:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbjAPAmS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Jan 2023 19:42:18 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8416A4D
        for <linux-doc@vger.kernel.org>; Sun, 15 Jan 2023 16:42:17 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id e19so113926uam.9
        for <linux-doc@vger.kernel.org>; Sun, 15 Jan 2023 16:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pefoley.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6baWnHaMeq//wWgiDgPtR7wttjvBbwrgF13EwkKD/cE=;
        b=fQ645zQjAeaiKdNcfuKaw5q60oC3763af0bKnIpQK9n0Vx7E11+DcrztbGRzukep0S
         6gn9f2ePl10gZ9WD3YtyNk5j9PZ8cm4v7znaVvfrc1pgU/VuuOre37Dh/k+MZ1rGQyhs
         m5VFC0p94hj68AHm7ID1eC1g8sPXhCQD4HA68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6baWnHaMeq//wWgiDgPtR7wttjvBbwrgF13EwkKD/cE=;
        b=U5hiUkOqsQ7pbKVuN2auR4MCKCYI6aavFykamxCJZOSs5pIOMoRkPYZARNOUMYIqHo
         VZaqFFx2lktGkO3KHsqWPlKIbf832NXe+YRsR7yyt8nzSYTBWmXgqUduzGnQ9e/Be1Nj
         qzyJWaek9kx3GGvrF96ApkRs+2hN35g2lxDVo6xcBO0msqfUaA29gJFYYjFSFbM+VUdZ
         Kg7SpF4f9v9q0Exy3vVvRly64jI88Q5vDRCK9DI+bLCzkhtY/wONtZ4+W77RDgdu7vwP
         z156jjvKsnZxepc9mPixPXlE3tIbb6gT9XI2hIcocgnmzsscXaH/YiMqJQhoG8VADXT8
         dxTw==
X-Gm-Message-State: AFqh2krXG37sniqzq7hIb1b3jgWSl3Z8JTKnfZZyd0mMRIrBMCMoI9ee
        Glc2AaFx3eA+zLdthyD1mQXaSCOpivrlPR3v7GXbTfolJEqVYbbpMAkAhg==
X-Google-Smtp-Source: AMrXdXtSGMQ8TmffqUbtzp62L6p2NM5X45zupfLjEjP0IhWRu0tTi2BUXLTEpKCnBUkxKouEjGEIu6c58810DbBvQ9c=
X-Received: by 2002:ab0:2b93:0:b0:60a:bb33:8267 with SMTP id
 q19-20020ab02b93000000b0060abb338267mr129165uar.47.1673829736705; Sun, 15 Jan
 2023 16:42:16 -0800 (PST)
MIME-Version: 1.0
References: <20230114-doc-v1-1-efec2689e423@pefoley.com> <87edrxgk25.fsf@meer.lwn.net>
In-Reply-To: <87edrxgk25.fsf@meer.lwn.net>
From:   Peter Foley <pefoley2@pefoley.com>
Date:   Sun, 15 Jan 2023 16:42:05 -0800
Message-ID: <CAOFdcFNKJacBVtrV-hJyUu6hKBVFaKdpA84cZ6WGnZ=ZGnb4kQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Avoid duplicate Kconfig inclusion
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jan 14, 2023 at 8:25 AM Jonathan Corbet <corbet@lwn.net> wrote:
> The duplicate inclusion does seem worth fixing, but I wonder if you're
> deleting the right one?  Having the documentation Kconfig under lib
> seems a bit strange, somehow; Documentation/ is a top-level directory,
> after all.

I thought about that.
Looking at the history, the toplevel inclusion was added in
b1663d7e3a7961 (2019-06-04), and the lib/Kconfig.debug inclusion was
added in 75442fb0ccaacd (2020-10-30).
Given the actual entries in Documentation/Kconfig
(WARN_MISSING_DOCUMENTS and WARN_ABI_ERRORS), putting them under the
"Kernel hacking" menu makes sense to me.
We *could* add a new top-level menu to Documentation/Kconfig, but it
doesn't really seem like an improvement over having them live in
Kernel hacking.
