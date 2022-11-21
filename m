Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C7DC433FE
	for <linux-doc@archiver.kernel.org>; Mon, 21 Nov 2022 21:01:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiKUVBS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Nov 2022 16:01:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiKUVBS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 16:01:18 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C8ECFB95
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 13:01:17 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D0081377;
        Mon, 21 Nov 2022 21:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D0081377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1669064477; bh=UTLzgS/Ot7Cw4Jwqehf9Qt8ddICX72bIGmA9N7UDv4o=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=EInBu98uMTzC3jmT8ZPttIK2hQQ1qecHIhAIoBpDoDPy6RXP44iPz1bFHAhWPZDBG
         ++dlL4dgJMXQyjc71KIiO8Q+Gr9Ms+BKU4+RAYZP1ZJ48a3RQikTvKtylRqX5Kz5YK
         KztMiPRrZ87aRAwwTMZV6zuz6o3lQM7jQPE8+6JQKF2zXL758tzdZW7qN9FlnVrFmv
         X7YAo9LpQIL8hhxjZRolg4UgyAuthbGlAfR8PslRKl/IcC0IBWSTw9e3682Gx41er8
         krK94Jo9bAU8Nat/6ORQkikdlM0KSJ3Rb51Y3VaCh+PiIy3+e8isx0gdVJv7yhDYFc
         StT4iPLdLxG9A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs/driver-api/miscellaneous: Remove kernel-doc of
 serial_core.c
In-Reply-To: <9f23e62c-1401-cf58-f99b-fa804366cd4c@gmail.com>
References: <4e54c76a-138a-07e0-985a-dd83cb622208@gmail.com>
 <47514c0a-7d5b-5a0b-6bb5-d5c96d163838@gmail.com>
 <9f23e62c-1401-cf58-f99b-fa804366cd4c@gmail.com>
Date:   Mon, 21 Nov 2022 14:01:16 -0700
Message-ID: <87o7t09g4j.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> Hi Jon,
>
> On Wed, 9 Nov 2022 23:45:06 +0900, Akira Yokosawa wrote:
>> Hi Jon,
>> 
>> On Wed, 2 Nov 2022 20:48:01 +0900, Akira Yokosawa wrote:
>>> Since merge of tty-6.0-rc1, "make htmldocs" with Sphinx >=3.1 emits
>>> a bunch of warnings indicating duplicate kernel-doc comments from
>>> drivers/tty/serial/serial_core.c.
>>>
>>> This is due to the kernel-doc directive for serial_core.c in
>>> serial/drivers.rst added in the merge. It conflicts with an existing
>>> kernel-doc directive in miscellaneous.rst.
>>>
>>> Remove the latter directive and resolve the duplicates.
>>>
>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>> Fixes: 607ca0f742b7 ("Merge tag 'tty-6.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty")
>>> Cc: stable@vger.kernel.org # 6.0
>>> Cc: Jiri Slaby <jslaby@suse.cz>
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> ---
> [...]
>> 
>> Jon, Greg has added this to his tty tree and (hopefully) it will
>> soon land Linus' tree (v6.1-rcX).
>> I'll ask you a back-merge once it happens.
>
> This change has landed at v6.1-rc6 as commit 3ec17cb325ac
> ("docs/driver-api/miscellaneous: Remove kernel-doc of serial_core.c").
> Can you please consider backmerging v6.1-rc6?
> There is another fix landed at v6.1-rc5 which fixed another duplicate
> kernel-doc, commit c18c20f16219 ("mm, slab: remove duplicate kernel-doc
> comment for ksize()") authored by Vlastimil.

So the purpose of this backmerge would be just to get rid of a few
warnings in docs-next for the next few weeks?  Given the jaundiced eye
with which Linus looks at backmerges, I'm inclined to just wait and let
it all settle out during the merge window.  Is there any work that would
be impeded by not doing that merge now?

Thanks,

jon
