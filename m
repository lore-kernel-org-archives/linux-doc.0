Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D03C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  1 Dec 2021 20:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352992AbhLAUpS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Dec 2021 15:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352912AbhLAUoW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Dec 2021 15:44:22 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F66C06175E
        for <linux-doc@vger.kernel.org>; Wed,  1 Dec 2021 12:40:59 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4D9E32C0;
        Wed,  1 Dec 2021 20:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4D9E32C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638391259; bh=GzVkJDus5eS8xCbKaVDWRKmErJ7yBcN+YxqWxXCJnGs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bEQ0LfuwqMHhWpvbD3T5Ec3sNQkJDFSLii+AOTO58+0blGGRQjk3w1AQW3KbqbsCH
         zjd80QaUyXPX7kBkKvwkc+FDWtFV3Iy+Sl5DRNJF4jr1ExdZ1+UMF97zmbC5tKWPMY
         XpeavMENxckqK2cmDkPpYsrLh0rYy2aO0fXLj95F4AzqAo9us4cDoAtYvL72uvrwkb
         UB0kXuvUPm+eLRFFYuR3DxsrH+miu+Q6wejBCMgYCJG2V/XBifPNmriAmei3N3fzhL
         iohSyksjsnduC7Ck1S1r6kh0hGFnIkYO56y0gLyqCsDV/6qtBUfb13E0tGqGzoB48I
         nuqrw8Hg5dlsQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc:     "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Vineet Gupta <vgupta@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2] docs: Add documentation for ARC processors
In-Reply-To: <PH0PR12MB5401E55A4E8D1D7360C02E68A1689@PH0PR12MB5401.namprd12.prod.outlook.com>
References: <20211112065059.7273-1-abrodkin@synopsys.com>
 <87fsresjx6.fsf@meer.lwn.net>
 <PH0PR12MB5401E55A4E8D1D7360C02E68A1689@PH0PR12MB5401.namprd12.prod.outlook.com>
Date:   Wed, 01 Dec 2021 13:40:58 -0700
Message-ID: <875ys8kqhx.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

>> This manual requires registration (with a fair amount of information
>> required) to get.  That should at least be mentioned if we can't find a
>> less obnoxious version out there.
>
> Well, I'm afraid that's the best we may get as of now. I wish is was available
> with no registration whatsoever, but at least it could be easily had now by
> wide audience.
>
> Anyways, I'm wondering what kind of mention do you think is appropriate here?
> Somehting like: "note, registration is required"?

Something like that would be helpful, I think, yes.

>> > +Building the Linux kernel for ARC processors
>> > +############################################
>> > +
>> > +The process of kernel building for ARC processors is the same as for any other
>> > +architecture and could be done in 2 ways:
>> > +
>> > +1. cross-compilation: process of compiling for ARC targets on a development
>> > +host with a different processor architecture (generally x86_64/amd64).
>> > +
>> > +2. native compilation: process of compiling for ARC on a ARC platform
>> > +(hardware board or a simulator like QEMU) with complete development environment
>> > +(GNU toolchain, dtc, make etc) installed on the platform.
>> 
>> These enumerated lists would render a lot more pleasantly if you
>> actually formatted them as RST enumerated lists - with lines after the
>> first indented.
>
> Indeed, I'm much more used to Markdown and there it works ;)
> So should I send a re-spin with fixed version?

I applied the patch, so please send improvements on top of that.

Thanks,

jon
