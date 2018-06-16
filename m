Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA5877D048
	for <lwn-linux-doc@archive.lwn.net>; Sat, 16 Jun 2018 23:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756928AbeFPXzm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 16 Jun 2018 19:55:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:54874 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756924AbeFPXzl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Jun 2018 19:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=j9rIWq3rg7vYeb46Vui1y2XyWkUDLMM4qE5kSki24xs=; b=Uneo1jW1SEBn7PZMq72R0kbNK
        ue1C63RqHdr8XkfM7tTilhSEP9lBre3WCYLmmr+hLDmhvoWtS0cGUhcSasW6KRaV2iI42gLop1O3c
        YXPEkrWaFy2/IUKWEPpP+qcO3wlgjYXZiio30AHgPV1EwUfWllG7WHv8iIosyD8jBLR859eLjdkh6
        8veUNwIMP/uJmLABNU1veGjioAAW+K5gIeI+HENUN5dmpGZNQWvixlKrqRwpjQJhuW1yUgW9/4eud
        Q57xw2MxPqr5YeEAa+2OWrdZkbsDawNlx3iXIeuu6FOk0qbdNWZVOpYY471kG3SgJho75BNSMV3qQ
        LvGW0a3rw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fUL2g-0001OC-Nw; Sat, 16 Jun 2018 23:55:38 +0000
Subject: Re: [PATCH v2 0/5] FireWire: clean up kernel-doc, add Documentation
 chapter
To:     Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Randy Dunlap <rd.dunlab@gmail.com>,
        linux1394-devel@lists.sourceforge.net
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        linux-doc@vger.kernel.org
References: <20180414012722.17420-1-rd.dunlab@gmail.com>
 <52b34674-f1bd-311f-8bc4-9eb0ceb88c97@sakamocchi.jp>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ed4b0f15-a875-4273-696a-65006c5f0364@infradead.org>
Date:   Sat, 16 Jun 2018 16:55:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <52b34674-f1bd-311f-8bc4-9eb0ceb88c97@sakamocchi.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/15/2018 07:10 PM, Takashi Sakamoto wrote:
> Hi,
> 
> On Apr 14 2018 10:27, Randy Dunlap wrote:
>> This patch series cleans up kernel-doc warnings in several
>> FireWire source files and then adds a Documentation driver-api
>> chapter for FireWire.
>>
>> [PATCH v3 1/5] FireWire: clean up firewire-cdev.h kernel-doc
>> [PATCH v3 2/5] FireWire: clean up core-iso.c kernel-doc
>> [PATCH v3 3/5] FireWire: clean up core-transaction.c kernel-doc
>> [PATCH v3 4/5] FireWire: add a Documentation driver-api chapter
>> [PATCH v3 5/5] FireWire: add driver-api Introduction section
>>
>>   Documentation/driver-api/firewire.rst |   50 +++++++++++++++++++++++-
>>   Documentation/driver-api/index.rst    |    1
>>   drivers/firewire/core-iso.c           |    7 +++
>>   drivers/firewire/core-transaction.c   |   10 ++++
>>   include/uapi/linux/firewire-cdev.h    |   22 ++++++----
>>   5 files changed, 81 insertions(+), 9 deletions(-)
> 
> I reviewed all of the five patches.
> 
> Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> 
> We're on development cycle for v4.18. Your patchset will be merged into
> mainline in next merge window by pull request from Stefan.

Stefan, are you around?

The merge window for v4.18 just closed today.

thanks,
-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
