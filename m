Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7604F7D08E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Dec 2018 23:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731895AbeLTXU0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Dec 2018 18:20:26 -0500
Received: from mail-it1-f196.google.com ([209.85.166.196]:39685 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730098AbeLTXUZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Dec 2018 18:20:25 -0500
Received: by mail-it1-f196.google.com with SMTP id a6so4214091itl.4
        for <linux-doc@vger.kernel.org>; Thu, 20 Dec 2018 15:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aJCstcpioKX1kDPN9Do4ajl4wQrLRjEEgz6HAK8MoUY=;
        b=jq9FmGN4dEMDtMTdoSlw+U4KYxRXJEWTp0D/E5gKQxakIGOQlDSyOpAf28F3X6D93Q
         zBWTouplLsJzDsBHyzbPw5I5cneJ2jm5gNKicFCRLDOnZkK23qJn4Olt6gCsRkaBV4ys
         ff+XaSkC4mwtm7wQHD6ms6kOp4MHJ4ZTcCjH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJCstcpioKX1kDPN9Do4ajl4wQrLRjEEgz6HAK8MoUY=;
        b=jvRQ+8XG8ypdLk0kd5oJTdWitCRNLWXTgw2l1yqoLcT2pgzTv8E6EQmdYorS3fiWKb
         FCWZl31KL+uZO4WJZp68zn5L4MhILCM6xQUGQ3wX5k8rNElTRPbgTQkk+2pojXRbZMBA
         AImafY//ja5yhc3AMybkfqESZdt9DqXpRueqaUwxu2QpPB/ufF/whxKmQtqYgPbkUR31
         awHfFjxnrm4pCgXjj14beXfrDGDGF41K+hpfcv2xE8kE8kaoR93ed63VrL7VV18UlPz5
         bCzUiZLwDgV6sOjLJWQPdcLP7gAwbARnegrkxFLb+xdHLYIGvS3CR5ANiVAHGTNR14ei
         431A==
X-Gm-Message-State: AJcUukdRUaWHwKwgffWX2s3u5N9R15MnW2ghBtTnpuFT3FPdNIC1a8wW
        66IWdqPO1qN2Y9To/gndMYo6bgtgdj++kdOkLnypIQ==
X-Google-Smtp-Source: AFSGD/WPKU3M+3Jvw6zAtXzZltMyw24jz/yuzayxY6/Dl1M0Ds3Tovkz1K5Cs+O0YvNmtCqawmFHb/ey5XpGON0VQjM=
X-Received: by 2002:a24:bd0e:: with SMTP id x14mr502314ite.123.1545348024331;
 Thu, 20 Dec 2018 15:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20181024013132.115907-1-dbasehore@chromium.org> <154534054131.79149.12015186156265337224@swboyd.mtv.corp.google.com>
In-Reply-To: <154534054131.79149.12015186156265337224@swboyd.mtv.corp.google.com>
From:   "dbasehore ." <dbasehore@chromium.org>
Date:   Thu, 20 Dec 2018 15:20:13 -0800
Message-ID: <CAGAzgsq=p-2N6ybFXNTnz5SDkcdktA+Gk6e3gxrjpJB+L8389A@mail.gmail.com>
Subject: Re: [PATCH 0/6] Coordinated Clks
To:     sboyd@kernel.org
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        aisheng.dong@nxp.com, mchehab+samsung@kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 20, 2018 at 1:15 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Derek Basehore (2018-10-23 18:31:26)
> > Here's the first set of patches that I'm working on for the Common
> > Clk Framework. Part of this patch series adds a new clk op,
> > pre_rate_req. This is designed to replace the clk notifier approach
> > that many clk drivers use right now to setup alt parents or temporary
> > dividers. This should allow for the removal of the
> > CLK_RECALC_NEW_RATES flag and the implementation of a better locking
> > scheme for the prepare lock.
>
> Are you going to resend this series? I can do a review but I wonder how
> much it will change anyway.
>

I'm going to resend next year. I got distracted trying to get other
code to work. This code has bugs in it, so a new patch set is
required.
