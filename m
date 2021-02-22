Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17070C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 21:57:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF9B664E31
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 21:57:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhBVV5l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Feb 2021 16:57:41 -0500
Received: from ms.lwn.net ([45.79.88.28]:35496 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230010AbhBVV5j (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 22 Feb 2021 16:57:39 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 06AA630D;
        Mon, 22 Feb 2021 21:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 06AA630D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1614031019; bh=9lS+NZu9sgjxT9FHaeuSRfHl+5NsQdvEOiPc+WxLzQA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=W49wvn6mwhJczzebg0kWDLHaGvi+OQtGpze5LDx1LTAPCHT8B0FRAhYX/ZAxbC+ki
         g4Ug9sMVBXpUT6KAdG8hmJqEv5HlSoL3IQl/mXZ1OoeIEX0kE7NzITPeY2w6l69dSb
         PAHRrJS5ZDeHzFUZ4nLlAyTgLgz+G7IADHb26cNaEGZZysbAgQ10JGOWxk/SGFvHSp
         Ot81fiWs/Uepk3W3VQ/4EZBthoISl9cf4f2pfly8CPhapp54XowWUvPIrr3S8OJmqp
         sjwjk3w0HaNBZegb9dr7LwqofzO5Roh9cprY/MBeu4rbuqIdSCLuRQ03j0fUTmEbbd
         EdUqxlCE01wXQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Aditya <yashsri421@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org
Subject: Re: Investigating parsing error for struct/union
In-Reply-To: <5933570a-7768-26b2-40d0-1acac999d9f6@gmail.com>
References: <5933570a-7768-26b2-40d0-1acac999d9f6@gmail.com>
Date:   Mon, 22 Feb 2021 14:56:58 -0700
Message-ID: <87zgzvkbpx.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Aditya <yashsri421@gmail.com> writes:

> 1) A large part of this error(~80%) occurs due to the presence of one
> or more lines(such as '#define' lines) between commented code and
> struct declaration.

See my other email for this one.

> 2) If struct does not contain any members, for e.g., in
> include/linux/xz.h:
>
> /**
>  * struct xz_dec - Opaque type to hold the XZ decoder state
>  */
> struct xz_dec;
>
> Here, it causes error as the curly braces and members expected by the
> regex, are absent.

Here, too, the real problem is that the kerneldoc comment is in the
wrong place.  There will be a real declaration for that structure
somewhere; in this case it's lib/xz/xz_dec_stream.c.  *That* is where
the kerneldoc comment should be.

That said, the above isn't a kerneldoc comment anyway; it doesn't really
describe anything useful and would generate lots of warnings if it were
in the right place.  The right solution is either (1) write a proper
comment describing this structure, or (2) delete the extra "*" at the
beginning of this comment.

> 3) Different Syntax than expected. For e.g.:
>     a) struct xyz struct_name {} syntax. This syntax has been used in
> arch/arm/mach-omap2/omap_hwmod_common_data.c file

*Please* give an actual example, from the source, of what you are
talking about for cases like this; I spent a while looking at that file
trying to figure out what you were talking about.  I assume you're
referring to silliness like this:

/**
 * struct omap_hwmod_sysc_type2 - TYPE2 sysconfig scheme.
 *
 * To be used by hwmod structure to specify the sysconfig offsets if the
 * device ip is compliant with the new PRCM protocol defined for new
 * OMAP4 IPs.
 */
struct sysc_regbits omap_hwmod_sysc_type2 = {
	.midle_shift	= SYSC_TYPE2_MIDLEMODE_SHIFT,
	.sidle_shift	= SYSC_TYPE2_SIDLEMODE_SHIFT,
	.srst_shift	= SYSC_TYPE2_SOFTRESET_SHIFT,
	.dmadisable_shift = SYSC_TYPE2_DMADISABLE_SHIFT,
};

...right?  Again, the problem here is that these are not proper
kerneldoc comments.  We're not describing the structure, this is just a
comment describing a specific variable.  The right fix, once again, is
s%/**%/*%

>     b) "static __maybe_unused const struct st_sensors_platform_data
> default_press_pdata = {" in drivers/iio/pressure/st_pressure.h.
> This kind of syntax has also been used in
> drivers/iio/accel/st_accel.h, and drivers/iio/gyro/st_gyro.h

Same problem here; the fix is not in the docs build system.

Thanks,

jon
