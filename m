Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3B9CC7E66E
	for <lwn-linux-doc@archive.lwn.net>; Sat, 10 Mar 2018 11:51:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752188AbeCJLus (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 10 Mar 2018 06:50:48 -0500
Received: from mail-it0-f67.google.com ([209.85.214.67]:40892 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752173AbeCJLur (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Mar 2018 06:50:47 -0500
Received: by mail-it0-f67.google.com with SMTP id e64-v6so5936984ita.5
        for <linux-doc@vger.kernel.org>; Sat, 10 Mar 2018 03:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Bh3VO/oq8IsRlMheJrMmELN550OgTEynA/VkNZtWCkw=;
        b=d0hHCs2zjZE0WmKyEpsJAHN3ztS+kiaXsQlmF8v0ODiRSTVebu1UTvjpIcNPeJEJJZ
         r/RBKrkE30cLxmB4Ni9UYdD+07cTlKC03Vl5PVeUMTVY8lvX3/SRNsWTBGrraYTE8DmJ
         BWXQUfT3WDLY3xAT6bQkqOj6Xgh5r72f7DP6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Bh3VO/oq8IsRlMheJrMmELN550OgTEynA/VkNZtWCkw=;
        b=jBVIxG1hVvtro/owzrTttAwZHG9p8BJFAYVkJepWIWzkEXlRVkguQHoiC5oY4qLND7
         b+dOZ2yGCc/qqKtfGV0U7L6N7JmsU7EKWaGilEwoVwhAiFGqVkbXV1U32nVh4WGKFj3z
         uZtDMDi5+mdmJuHsMufx9KE3ImlZHllJMaqY4G4hTOfS5obLobd08yaJw7teX7f6Ov5u
         Wy1dRp7jX4WI8W0Wm4Bh/8SALZyK6FkF4nbsLNsh5j4WeWp0Mo0ZI4ai9dsTQU0NsOI4
         TwtleS9r87CK6SlVLrlfSLt9u7RP1cdmPxTWK5GTZD6qQw13+KzMUOVto4sCwJTpg4Qh
         JGdw==
X-Gm-Message-State: AElRT7HslT9424KWT87+k1+cyVjIjPUFEhMnuwpT2mGuVtBk51xACTJ3
        rESKqTXxCJ3R4cxXLKYUpWQao+gDPxJLahZh5OqgfQ==
X-Google-Smtp-Source: AG47ELthCQiRMkAchHEQbjseRzxW2uPAfTNNWzXDC8TH/pr7CfuLwDEP2r8cCVen65jbYo6iF4tIbuJtrok7YGIPweM=
X-Received: by 10.36.104.1 with SMTP id v1mr1418811itb.70.1520682646715; Sat,
 10 Mar 2018 03:50:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.230.25 with HTTP; Sat, 10 Mar 2018 03:50:46 -0800 (PST)
In-Reply-To: <20180308234024.24145-1-j.neuschaefer@gmx.net>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Mar 2018 12:50:46 +0100
Message-ID: <CACRpkda=5i-j=W8+yosF9WiZRKFF=iRC-djja7MJE+k6b1xtaQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] Move most GPIO documentation to driver-api/gpio/ and ReST
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 9, 2018 at 12:40 AM, Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> The aim of this patchset is to move the GPIO subsystem's documentation
> under Documentation/driver-api/gpio/ such that it is picked up by Sphinx
> and compiled into HTML.

Awesome!

> I moved everything except for sysfs.txt, because
> this file describes the legacy sysfs ABI, and doesn't seem to serve much
> (non-historical) purpose anymore.
>
> There are still some rough edges:
>
> * I think the API documentation (kernel-doc) should be moved out of
>   index.rst into more appropriate files.
> * The headings are arguably wrong, because driver.rst, consumer.rst,
>   etc. use the "document title" style, even though they are part of the
>   GPIO chapter. But the resulting TOC tree is consistent, and I did not
>   want to change almost all headings.
> * Some of the files could use more :c:func:`...` references and general
>   ReST polish.
>
> But I don't want to make this patchset too large.

It's fine, we take it one step at a time.

On Fri, Mar 09, 2018 at 10:41:20AM -0700, Jonathan Corbet wrote:

> Anyway, I'm happy to take these through the docs tree or see them go via
> GPIO; Linus, what's your preference?

I might have some doc patches that could collide so I can take them.

I take it there will be a v2?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
