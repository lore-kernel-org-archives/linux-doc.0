Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B507D7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Dec 2018 16:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbeLJQ0d (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Dec 2018 11:26:33 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:53110 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbeLJQ0d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Dec 2018 11:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=EwdIqZYk1Wml2JA2RBNPt9I8IB54sRZXzkIJ56jqPsY=; b=SstBYQOmioGYaHAlOesSuTHCX
        wg+noZ8tVfcV8KAGfziQdF1uGiIyD+a9JrlbdV1NFKi/bHKslmAcswQBqnQ+WGAIt2z46ROUk1iAi
        KA/ucTR5Sdf/qQlX/v57zq6EU3PYdSN4SLu/X/Xgro94JYiWLQd7LNEiDbEq5zflgQNLhiGm+vO4U
        zDu7eBuxwCIH8n1vmIkR3lsYAemtPjwAcr5JLawkls6UWXUxRs6KxlKSM10RoO0UHflQ1ck3LIyE+
        MvqfOKU0T6efbiL8XeOQumsa3NLFtm8tnvy+c92n1DSIXXOEHp2MrdaW3dRCVvaL5TptM3UNJ0vmf
        SZ6Aweigg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gWOO8-0007ik-Qr; Mon, 10 Dec 2018 16:26:32 +0000
Subject: Re: [PATCH v1 8/9] drm/doc: Add initial komeda driver documentation
To:     "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>,
        "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
        Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        nd <nd@arm.com>
References: <20181205102522.7989-1-james.qian.wang@arm.com>
 <ae6f05e0-d199-e9af-60c6-66fc73e3bf7b@infradead.org>
 <20181210114649.GB8863@james-ThinkStation-P300>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2c2716f5-c3dd-924f-fad4-b6d4ccfc01e5@infradead.org>
Date:   Mon, 10 Dec 2018 08:26:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181210114649.GB8863@james-ThinkStation-P300>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/10/18 3:47 AM, james qian wang (Arm Technology China) wrote:
> On Wed, Dec 05, 2018 at 06:08:38PM -0800, Randy Dunlap wrote:
>> On 12/5/18 2:25 AM, james qian wang (Arm Technology China) wrote:
>>> Signed-off-by: James (Qian) Wang <james.qian.wang@arm.com>
>>> ---
>>>  Documentation/gpu/drivers.rst    |   1 +
>>>  Documentation/gpu/komeda-kms.rst | 483 +++++++++++++++++++++++++++++++
>>>  2 files changed, 484 insertions(+)
>>>  create mode 100644 Documentation/gpu/komeda-kms.rst
>>
>> Hi,
>>
>> I have some editing changes for you to consider, although I did have a few
>> problems with reading the text.
>>
> 
> Thank you Randy, I'll correct the doc according to your comments in the next version.
> 

Hi James,

>>> diff --git a/Documentation/gpu/komeda-kms.rst b/Documentation/gpu/komeda-kms.rst
>>> new file mode 100644
>>> index 000000000000..8af925ca0869
>>> --- /dev/null
>>> +++ b/Documentation/gpu/komeda-kms.rst
>>> @@ -0,0 +1,483 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +==============================
>>> + drm/komeda ARM display driver
>>> +==============================
>>> +
>>> +The drm/komeda driver supports for the ARM display processor D71 and later
>>
>>                   driver supports the ARM
>>
>>> +IPs, this document is for giving a brief overview of driver design: how it
>>
>>    IPs. This document gives a brief overview of the driver design:
>>
>> (although I hate using "IPs" like that.)
> 
> How about "Product" or "Chipset"

Yes, much better IMO.


>>> +works and why design it like that.
>>> +
>>> +Overview of D71 like display IPs
>>> +================================
>>> +
>>> +From D71, Arm display IP begins to adopt a flexible and modularized
>>
>>              ARM
> 
> Sorry my fault, I used "ARM" in the initial lines which misleads you, but after
> Arm reband last year, the "Arm" is the right version.
> 
> And I'll unify all the usage to "Arm" in the next version.

I thought that you would know more about that than I do.



[snip]

>> So above, I tried to write what I thought you meant, but saying that Layer_Split
>> needs to be handled in user mode ... and then saying that if it is handled in the
>> kernel, it would be smooth and simple -- that seems to be contradictory to me,
>> so I guess I didn't understand it very well.
>>
> 
> Sorry, I need to reorganize my sentence. maybe like below:
> 
> Layer_Split is quite complicated feature, which splits a big image into
> two parts and handle it by two layers and scalers individually.

                handles

> But it imports a edge problem or effect in the middle of image after the split.

                 an                              middle of the image

> To avoid such problem, need a complicated Split calculation and some special

           such a problem, it needs a complicated

> configurationes to the layer and scaler.

  configurations


> We'd better hide such HW related complexity to user mode.



thanks,
-- 
~Randy
