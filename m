Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D9AC7EE24
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 13:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbjFENXo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 09:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbjFENXm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 09:23:42 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162C1A6
        for <linux-doc@vger.kernel.org>; Mon,  5 Jun 2023 06:23:40 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 01E27736;
        Mon,  5 Jun 2023 13:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 01E27736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1685971418; bh=+SzphAvLDAfv8fZdRooqr35cwekxRaZQm371Mn+kpWM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=koWbcXIzZjaSJq+il7TX7FoHeCyrweEIEnmQC/PSYZdw+Yu72vc3pkZqUxSH4awjw
         vh24a6nCXo+kMBaYmnkYk3NJBuR0NAoenc8ToNwiY70VjHxdYUZESloeciDeqp9Xia
         QN9S62h/7BG77VHatGzLdJ4oeRr//EOvqlMwrtYx1zegpmRRCmBZ2I8uPABTC98PCF
         7YUpL6GtLfKt5NGoDhC1x1o1d1c1kKJ6UQcFYgAB8QqhCPQQPoyGaHs6Wh6R54pE1N
         8+MEf89agwPFJl0AHHxJW5yiKbdTZEgoQNF9n9dSVnkJeKiBdoa1tcDxR9iDBm5ji3
         n2KKi0NgxKuhQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Russell Harmon <eatnumber1@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 3/4] Document dm-integrity default values.
In-Reply-To: <ZH1TmkyVJbIlNUEE@debian.me>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230604190604.4800-4-eatnumber1@gmail.com> <ZH1TmkyVJbIlNUEE@debian.me>
Date:   Mon, 05 Jun 2023 07:23:34 -0600
Message-ID: <875y82yre1.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> On Sun, Jun 04, 2023 at 12:06:03PM -0700, Russell Harmon wrote:
>> Specifically:
>>   interleave_sectors = 32768
>>   buffer_sectors = 128
>>   block_size = 512
>>   journal_watermark = 50
>>   commit_time = 10000
>
> Your patch description duplicates the diff content below. Please write
> in a mood that evocates curiosity to read the diff (and make sure it is
> also imperative).

Bagas, this is a typo-fix patch.  It does not need to be nitpicked into
the ground.

Russell, Bagas is inadvertently teaching you another lesson about the
kernel development community; it includes a certain number of people who
like to push contributors around with authoritative-sounding messages.
These people do not always need to be listened to.

Thanks,

jon
