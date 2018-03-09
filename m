Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2A1737E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri,  9 Mar 2018 17:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932074AbeCIRlW convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Mar 2018 12:41:22 -0500
Received: from ms.lwn.net ([45.79.88.28]:50118 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751255AbeCIRlV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Mar 2018 12:41:21 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0E2021307;
        Fri,  9 Mar 2018 17:41:21 +0000 (UTC)
Date:   Fri, 9 Mar 2018 10:41:20 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/8] Move most GPIO documentation to driver-api/gpio/
 and ReST
Message-ID: <20180309104120.40244f8a@lwn.net>
In-Reply-To: <20180308234024.24145-1-j.neuschaefer@gmx.net>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  9 Mar 2018 00:40:16 +0100
Jonathan Neuschäfer <j.neuschaefer@gmx.net> wrote:

> The aim of this patchset is to move the GPIO subsystem's documentation
> under Documentation/driver-api/gpio/ such that it is picked up by Sphinx
> and compiled into HTML. I moved everything except for sysfs.txt, because
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

[For future reference, if you're going to CC me on most of a patch series,
I'd really rather get the whole thing so I don't have to go looking for
it.]

From a quick look, it seems like a reasonable RST conversion to me.  I do
wonder if sysfs.txt should just be removed, since it documents something
we don't want people to use at this point?  Historical purposes are well
served by the repository history.

I'd say changing the headings is worthwhile if it produces a better
result.  OTOH I'd be wary of adding too much "polish"; we really want to
retain the readability of the plain-text files.

Anyway, I'm happy to take these through the docs tree or see them go via
GPIO; Linus, what's your preference?

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
