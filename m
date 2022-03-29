Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A183AC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 15:31:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbiC2Pd1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 11:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238672AbiC2Pd1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 11:33:27 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EB0CA0D4
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 08:31:44 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:35::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D9C8A537;
        Tue, 29 Mar 2022 15:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D9C8A537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1648567904; bh=euuCBi4h/a2Jl+Q3Krb+H8O+bWHEuW0j7Cy1QFUMznU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=BP40kBtGdnyh4CQa/WmdCX9nkGWCxv8IeS8do3UF+x2qn1gjq0DA98vNn8cvXV8Mb
         sHwrxrLjyw6SEeGDcH1PZBJYIQeuiueQ5tHKeIcqq0SnsWpNC8g1CCGxtPG0F84k7q
         wFAAzzp+m1nrYLDzvNl+YTUE9BNxAYFQh6mo5beqtirJsQoz6pLS74BBUwZXfqnmSu
         zpxrueWEJCa+n8fk2FPcKgctdsIpyd7L/1b8PCkm5ttIqEr87LnXo1EToZVZUNuekk
         Rtrln5ZROU//OvK4RNrx2h0yjNLIdyxQIbW/UE2bCo4NpVaWvq8TbKB5ZDaUEUE2w8
         2LHKmGjXkvmBw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
In-Reply-To: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
Date:   Tue, 29 Mar 2022 09:31:43 -0600
Message-ID: <871qyk7p28.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> jinja2 release 3.1.0 (March 24, 2022) broke Sphinx<4.0.
> This looks like the result of deprecating Python 3.6.
> It has been tested against Sphinx 4.3.0 and later later.

*Sigh*.  I wish this stuff didn't feel like such a house of cards
sometimes... 

> Setting an upper limit of <3.1 to junja2 can unbreak Sphinx<4.0
> including Sphinx 2.4.4.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-doc@vger.kernel.org
> ---
> Or we can bump the requirement to Sphinx>=4.0.
> Thoughts?

It's probably time to consider a bump there, but that is a bigger one
than I would want to do at this point.  So I'll just fast-track this
patch in; dropping it into the stable updates probably makes sense too.

Thanks,

jon
