Return-Path: <SRS0=WnF+=5Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F49C2D0EA
	for <linux-doc@archiver.kernel.org>; Wed,  8 Apr 2020 09:49:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C95512074F
	for <linux-doc@archiver.kernel.org>; Wed,  8 Apr 2020 09:49:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/Ej4FlA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgDHJtJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Apr 2020 05:49:09 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:43390 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbgDHJtJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Apr 2020 05:49:09 -0400
Received: by mail-il1-f196.google.com with SMTP id g15so6107065ilj.10
        for <linux-doc@vger.kernel.org>; Wed, 08 Apr 2020 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5Xq+OUaqt6tB19LBWnWtx+hhIOsTCIsEzqhRisFwtEQ=;
        b=W/Ej4FlAQVJMyLx0WbI6vwLpNxBQuzM1p6z8wmzxmTsXYGQwnfmHEiQzrFn3jKdfEl
         C3E0dIo4jMzmewXO4dwFUd8FS9H6IccPcFG3mc/xMiBOuoJGEuIfFXzJn5AKZwnRJxap
         zLAR1/Ffbf8d94aWKDmDgL71l91j1tU4xwB8n4bYtWp7xJX5Bwa10Mhw8nueZ0Hshnvw
         7vL76Bwd42U3EsJiGmKsRIhXN0Sl0g+pK/icQPaKrZIXlonR+1AfcAgLsKAjtcqsm2W1
         C8Y4Qc+aCC9amMl2jqYBs9GseglcMYqALwr9uz/vpFQGCQxggJLt4dh+nQmlKeUY5Uby
         uA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5Xq+OUaqt6tB19LBWnWtx+hhIOsTCIsEzqhRisFwtEQ=;
        b=Rya6I77+7Hb00ibFjMGjf3KEVSQcYK+i5W01qS6ey2k+9vzfsOtt4Sh8vbzTFchTFE
         mJxhE5sX2aCtoIou6IGCHP+PYIpOCkM65L78PB9VdkBHGr9/h3h9jlKmeKwRAcTMAVeg
         oRazAroXRqVXlInb1/i0btG6t6VadmLw9A76ARBxPdEyAWd2D4kEgRSarf1ZtMsChZR8
         Gi6kXdSDHzIMoSXeKODW40MN+2JZ3J5ndQa0OO95k0arXAflAa9cg5bhgFQy/RIhzUH4
         4uGMu22N9oL4KSrhQlXXQR8/BIgAZxEbzSGO/7COmQPBLW6r/o3Ux+hmXTLkmC1oSAOP
         T0vQ==
X-Gm-Message-State: AGi0PuZ8XC+wQnuON+vDfqhB9SZk2Iy03Z9ZpJojzB8lVKnjL9scpSAw
        73CplDDh+fwPoVrUOPzhoy3KNXIkBVNzcaDPECg9fXrX
X-Google-Smtp-Source: APiQypLp8aIAd8CfkDLKY5qUJ70G/23rR3AqdIM6yFDqxq0TLysxhfgwTV793P4Cxc6pUp8qbXvFNnGyqMxOARfOJ/k=
X-Received: by 2002:a92:d11:: with SMTP id 17mr7015182iln.145.1586339346413;
 Wed, 08 Apr 2020 02:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200312201354.285839-1-joakimlonnegren@gmail.om> <20200407134414.77b1c34b@lwn.net>
In-Reply-To: <20200407134414.77b1c34b@lwn.net>
From:   =?UTF-8?Q?Joakim_L=C3=B6nnegren?= <joakimlonnegren@gmail.com>
Date:   Wed, 8 Apr 2020 06:48:53 -0300
Message-ID: <CAN1Azk5fW62-Oc0RDQtJSYkgKAJYsK+hRgXwUFQO=rQQGpOB6Q@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: driver-api/usb/writing_usb_driver.rst
 Updates documentation links
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue 7 Apr. 2020 16:44 Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Thu, 12 Mar 2020 17:13:55 -0300
> "Joakim L=C3=B6nnegren" <joakimlonnegren@gmail.com> wrote:
>
> > In writing_usb_driver.rst:
> > Remove link to https://www.qbik.ch/usb/devices/ since it seems to be in=
active since 2013
> > Update link to linux-usb mailing list archive
> >
> > Signed-off-by: Joakim L=C3=B6nnegren <joakimlonnegren@gmail.com>
>
> Applied, thanks; sorry for the delay.
>
> jon

No problem, thanks!

/Joakim
