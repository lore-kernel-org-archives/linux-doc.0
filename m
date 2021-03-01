Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D45DC433DB
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 22:00:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4533E60232
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 22:00:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242226AbhCAWA2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Mar 2021 17:00:28 -0500
Received: from ms.lwn.net ([45.79.88.28]:43126 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244765AbhCAV6V (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Mar 2021 16:58:21 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3EEB22B8;
        Mon,  1 Mar 2021 21:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3EEB22B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1614635860; bh=i6jQL2vEgTZpDiPscbXFNSE/AGEJG68OoQFCzcs14eY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=m5sBTavMke52rPDsk6aPF9PVFu/38tbTbHO05WGk4Yxo2KFTQSKKW+4HchgwPXhZ2
         AiNq0lrvJhr6ZD3ClJtjAsAMPB+D/gvmnZBEOHN2Gqo/sS4nX2p8NrX2Kra541iyLe
         7APV/lFPjTnh3CvcptaIGCGTCeGvifyCY7arlJgzUfUkux4gOBrNEtbvLLF2A4xptP
         3M8jwv3thGIdhu5HGz95SQsB0M4C6VsiRhqW/SqrIRO4ivW+tSCcHaUTW0qT3PPUOA
         a+p6Hi7m3CKGtdVtw0AtdNY5EWaa7JMOqXaygxmiFcMYhcxVTDFocH2VqwoP/JxdYz
         iYWm5kTF3P/Ww==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>, mchehab@kernel.org
Cc:     lukas.bulwahn@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 0/3] checkpatch: add verbose mode
In-Reply-To: <70877984ec78d837159dc643e3ae2b05fd91561c.camel@perches.com>
References: <20210226093827.12700-1-dwaipayanray1@gmail.com>
 <87tupu36xi.fsf@meer.lwn.net>
 <70877984ec78d837159dc643e3ae2b05fd91561c.camel@perches.com>
Date:   Mon, 01 Mar 2021 14:57:39 -0700
Message-ID: <87czwi35bg.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Joe Perches <joe@perches.com> writes:

> On Mon, 2021-03-01 at 14:22 -0700, Jonathan Corbet wrote:
>> Dwaipayan Ray <dwaipayanray1@gmail.com> writes:
>> 
>> > Add a new verbose mode to checkpatch. The verbose test
>> > descriptions are read from the new checkpatch documentation
>> > file at `Documentation/dev-tools/checkpatch.rst`, which
>> > is also added by this series.
>> 
>> So I can certainly take the doc change, as requested.  Remind me,
>> though...should I apply the whole set, or will the checkpatch changes go
>> via another path?
>
> There's no dedicated upstream path for checkpatch.
> So please take the checkpatch changes too.

OK, I have just done that.

Thanks,

jon
