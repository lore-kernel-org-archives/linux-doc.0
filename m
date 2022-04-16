Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50CEC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 16 Apr 2022 08:16:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbiDPISu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 16 Apr 2022 04:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbiDPISr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Apr 2022 04:18:47 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64348183A4
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 01:16:16 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D57B12CC;
        Sat, 16 Apr 2022 08:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D57B12CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1650096975; bh=fKbbpUmHQtNqe9g4j9RzZmBRblJ6jiaa2gPqUQoM4h4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=XGZGGssx5qHg0bUC2wNf9/wRoIve5ZNAXLOmJTUPE6wgyyfRMqCimJe1pXKIwJEq8
         1EfI/ZASZZz55bDm7bmd4yAJrFrY0mZB0Ej2DHoo6lfYYT5nqJEN2qRIlskda5hBOS
         KIyemUxa60c4UW41n64947T/ztMaOT7mXmL0LuSmpHEeC130vca8pXWqAsWH40f+Ps
         j/d7TM36ureUiKzoULESJRlIJu+70Zgbj5mUXCqcSOma1jBAaNMkU0jMVB6zHh2QBB
         L/wFZ4Gr8HLqFzstSHO6wlHAladefJouOpvkE8pbG3b79UJv17xTXes7hmg+wyl+NX
         Lii6hlKHn/qTA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>,
        Kosuke Fujimoto <fujimotokosuke0@gmail.com>
Cc:     linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Is there any Japanese translation maintainer?
In-Reply-To: <15b941a4-c41d-3fc1-c4f8-9a6736f6b874@gmail.com>
References: <172fa015-26df-c978-853d-3aba67c581cc@gmail.com>
 <15b941a4-c41d-3fc1-c4f8-9a6736f6b874@gmail.com>
Date:   Sat, 16 Apr 2022 02:16:10 -0600
Message-ID: <87pmlh4f5h.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> On Wed, 13 Apr 2022 18:09:59 +0900,
> Kosuke Fujimoto wrote:
>> Hello,
>> 
>> I would like to contact with Japanese documentation maintainer for some 
>> changes. However, it looks like there is no one listed in MAINTAINERS file.
>> Is there anyone who is maintaining Japanese documentation?
>
> Existing Japanese translation has a note on its first page saying:
>
>> This document is maintained by Tsugikazu Shibata <tshibata@ab.jp.nec.com>
>
> However, this email address is not reachable any more.
>
> I also have a few things I'd like to fix/update in it.
> I'm glad to know there exists someone else who has similar
> thoughts.
>
> I think I can play a role as a tentative maintainer who can
> review your changes.

The Japanese translation has been effectively unmtaintained for some
years.  I would be delighted if somebody would be willing to work to
improve it - please don't hesitate!

Thanks,

jon
