Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A48907D161
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Jan 2019 09:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfA1JIk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Jan 2019 04:08:40 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42673 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbfA1JIk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Jan 2019 04:08:40 -0500
Received: by mail-lj1-f194.google.com with SMTP id l15-v6so13533561lja.9
        for <linux-doc@vger.kernel.org>; Mon, 28 Jan 2019 01:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0FEn/jn/6ZmaKXY4ewFiv4XfKfXIhmGqV/zM3n2EaLw=;
        b=e4qqhgBLbBj6Y9VthzIU9HCaiYZgOTkYQ45MJk5MFHHnh5rsMCf0a25Rcfv83zKD5n
         gKvpgQt6U7iSdH6NWJExvFu/jTYSvxqUIy+BIKag2R3meY0lF35vMOwUfQTW+ENwsB3d
         EvRGXKMm17E9wYImwE/fL3shvEQ5vpRKeqOjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0FEn/jn/6ZmaKXY4ewFiv4XfKfXIhmGqV/zM3n2EaLw=;
        b=JDlnHBqVN5izbL7aLYmomaZQjFYOMnxLCvecujAiF6FNUaJ319mrPL74+xovZqN2n1
         OBekRKij27JqykhY7h/bdDiYtKaHHNhBKvzOP9SsEjuy65HnR6bHT44uLs2whFzDKQHe
         F5X85x0nT7IogNyk/vHFvcnssNESHgMhMUXQCl7uIk01tqZ8hV7frp2iKsJlJHrNl2fK
         zGbKkPxNRd+oZ3Jq3Bilm2hAMhhDe4XE1E1+NTGvlKeEof2ttEV3IO3enWgAhMU5xZlH
         BR++JYcnFKjr/N+zy5O23JqDUBVPX9MLOFF1XAHQv+Uf3bnGPMt+d/mxPFoDqtzC1rQ8
         AUWA==
X-Gm-Message-State: AJcUukfMy0LBetblBKjjTaL2nGEypXewCc13kd9SyAyKZA4/EelFs1qR
        6SlN/QCX2zhBn02iXugykaYiuN6CxL58LQ8/Mh9JEopo
X-Google-Smtp-Source: ALg8bN7g8C0muF261PwxkGrap2+4ML4yaUpXFHweRhs0KTimHWgsMyXdOH5tTcvzMOG5/V03nDQiaPLNa1fFJJvOzmQ=
X-Received: by 2002:a2e:131a:: with SMTP id 26-v6mr15950792ljt.107.1548666517943;
 Mon, 28 Jan 2019 01:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20190121143822.20225-1-ramon.fried@linux.intel.com>
In-Reply-To: <20190121143822.20225-1-ramon.fried@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Jan 2019 10:08:26 +0100
Message-ID: <CACRpkdbgq-FdsBghLMgSpPWX0LrEBL4bhSXRh24E1oaQ1OdjiA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl.txt: Remove outdated information
To:     Ramon Fried <ramon.fried@linux.intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 21, 2019 at 3:38 PM Ramon Fried <ramon.fried@linux.intel.com> wrote:

> Returning -EAGAIN is no longer supported by pin_config_group_set()
> since ad42fc6c8479 ("pinctrl: rip out the direct pinconf API")
>
> Remove the relevant section from the documentation.
>
> Signed-off-by: Ramon Fried <ramon.fried@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
