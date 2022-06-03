Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431F7C43334
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 21:50:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348053AbiFCVuc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 17:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345538AbiFCVub (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 17:50:31 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3E057B3E
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 14:50:30 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A0F607DA;
        Fri,  3 Jun 2022 21:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A0F607DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654293029; bh=bbMT06+W6uktfSf09umNtrWBaFQQHmuASL+ZB4cJGRg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=M0PCCLfuGaxdClvKi9nhiYE1jDXbjsfGUBk7UwsocHorMWlskaHLgLtx4CuGVFyEA
         caxA1nJa+zr+Z93tDLKPQKlpYPReMAIdKmGahXF3zPlENDxRY0e27chUffaW2/JJpD
         sBop9LDMBeL/E6FS3By52PuQ6rBE9jNVs6bzEHIpiqC/VZCueW+MzFYKoyQzNlvDwq
         4ZbSjrIqn2CwdyqSgoYlvExOqnQqJu3EVLXJqjN8Q7D2HsN7+C5FRok4cFpLIcn/WD
         0NFPWAGgribP++wuufccUdB43ZFafOAwdStlUCTXMI1R2zBDl0NjZKaR3l4ui0m4He
         3bA3wNSjXaBdw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Adam Turner <aaturnerpython@outlook.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
In-Reply-To: <20220603162615.wto3fywuvs2wlb5r@meerkat.local>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net> <YponOKPBgE8pgBYD@casper.infradead.org>
 <20220603154229.sj5sfeaehbkfzgin@meerkat.local>
 <87tu91vis5.fsf@meer.lwn.net>
 <20220603162615.wto3fywuvs2wlb5r@meerkat.local>
Date:   Fri, 03 Jun 2022 15:50:29 -0600
Message-ID: <871qw5ju1m.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Fri, Jun 03, 2022 at 10:00:42AM -0600, Jonathan Corbet wrote:
>> > I'm happy to upgrade that to a newer version if that condition no longer
>> > applies.
>> 
>> Upstream is "happy" in that it renders the documentation just fine and
>> we've dealt with the incompatibilities for our modules.  My only
>> complaint is the speed, but presumably your automated system has no
>> trouble being patient :)
>
> Indeed. So, should I go to 3.x, 4.x, or go all new and shiny with 5.x?

Unless there is some subtle problem in the rendered docs that I'm not
seeing, I don't think that there is any reason to go with the older
releases.  5.0.1 seems to build things just fine, so I'd say go with the
shiniest you can get.

Thanks,

jon
