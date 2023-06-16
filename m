Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA2EEB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 16 Jun 2023 14:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjFPOS2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Jun 2023 10:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233955AbjFPOS2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jun 2023 10:18:28 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B47C30FE;
        Fri, 16 Jun 2023 07:18:15 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8B3E737A;
        Fri, 16 Jun 2023 14:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8B3E737A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1686925095; bh=odIBNqPoiXABW0BduiorRVrDpZ9WhVwG1HBETs6UEj0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VApDqHGxFeRQbNFHqcj7wJ3XU1Dz9qbFqzOY/0R81SLyCuv0xK7ookFgJsLatgLNR
         dFMUBkvBLuHDO+v3ilU8c/6ubrngmALU81ruVgoHEe4eL0vtxi1/eoht9pW1LRj2US
         wU5Nm049QR3wBTksUN9D2kuhsijm2eItrKHKhGeLAdZq/dy7wuH59w6tKtESvv/wU1
         gC2TYYvnxys4fita/3U7tsYu/XljzuNPFb1egu+IaR2x4Yzu3XDazPKscEkJaTsG8y
         G9141Ce3ZAF65fXMs0PQlwbz8lE8S6WpUpuDWWSzFK3e/x0xVtiXDDi998b09/ewun
         OOnQqMNYhclYQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Marcelo Tosatti <mtosatti@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: virt: correct location of haltpoll
 module params
In-Reply-To: <ZIcqkSzHGTZB6spQ@tpad>
References: <20230610054302.6223-1-rdunlap@infradead.org>
 <ZIcqkSzHGTZB6spQ@tpad>
Date:   Fri, 16 Jun 2023 08:18:14 -0600
Message-ID: <87a5wzze1l.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Marcelo Tosatti <mtosatti@redhat.com> writes:

> On Fri, Jun 09, 2023 at 10:43:02PM -0700, Randy Dunlap wrote:
>> Module parameters are located in sysfs, not debugfs, so correct the
>> statement.
>> 
>> Fixes: 2cffe9f6b96f ("cpuidle: add haltpoll governor")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Marcelo Tosatti <mtosatti@redhat.com>
>> Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: linux-doc@vger.kernel.org
>> ---
>>  Documentation/virt/guest-halt-polling.rst |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff -- a/Documentation/virt/guest-halt-polling.rst b/Documentation/virt/guest-halt-polling.rst
>> --- a/Documentation/virt/guest-halt-polling.rst
>> +++ b/Documentation/virt/guest-halt-polling.rst
>> @@ -72,7 +72,7 @@ high once achieves global guest_halt_pol
>>  
>>  Default: Y
>>  
>> -The module parameters can be set from the debugfs files in::
>> +The module parameters can be set from the sysfs files in::
>>  
>>  	/sys/module/haltpoll/parameters/
>>  
>> 
>> 
>
> Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>

I'm not sure why you're offering a signoff for Randy's patch...?

In any case, I've taken this as an ack and applied it.

Thanks,

jon
