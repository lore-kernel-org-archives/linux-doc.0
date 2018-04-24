Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 12D367DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 17:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750841AbeDXRUI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 13:20:08 -0400
Received: from smtprelay6.synopsys.com ([198.182.37.59]:50312 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750735AbeDXRUH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Apr 2018 13:20:07 -0400
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
        by smtprelay.synopsys.com (Postfix) with ESMTP id EC2AF1E05F3;
        Tue, 24 Apr 2018 19:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1524590406; bh=HM8N0h5nuEtc+Shifmx6bQTMjO/Uif+xj3OyC7PmKbI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ilSCzxP9RRJfA8QKD63rO4h+I78wlxxgvClCWiI1zOpC0matxbcqMOivJQnn2+404
         SiNBhiY4iQxmSpgPfhoW1kDPonVRlvSBoU5Basd9YwCaCEuj29Bwv6GwtYwQuJaroY
         rX/OmFhRSNVVKCn5qt5y5nz2lTBLtA3qDUsnN0OzOp5NzqC4nsxT8ma7xoPNjecfjh
         tzUxcoWMLn4nLQf5qX40YvRwNq3YhvKuke+VZ6VJ1Slec9+WGc7sJYLWVmlXklU+zo
         FrNHLruxgjVh/J4GUEO4RI68Kfso0BkngChKD0uZGqYPJdo6F6hsfH5f07oNwmVMrV
         ZHuDQyAONUTww==
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id B2DD948EA;
        Tue, 24 Apr 2018 10:20:04 -0700 (PDT)
Received: from [127.0.0.1] (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id DBC8F3DA53;
        Tue, 24 Apr 2018 18:20:03 +0100 (WEST)
Subject: Re: [RFC 10/10] tools: PCI: Add MSI-X support
To:     Alan Douglas <adouglas@cadence.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
        "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "kishon@ti.com" <kishon@ti.com>,
        "niklas.cassel@axis.com" <niklas.cassel@axis.com>,
        "jesper.nilsson@axis.com" <jesper.nilsson@axis.com>
Cc:     "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
 <9865822fb89ea84cb55fe93e151295afcd5c96b3.1523379766.git.gustavo.pimentel@synopsys.com>
 <SN6PR07MB45126298F09735193B0F0F00D8880@SN6PR07MB4512.namprd07.prod.outlook.com>
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Message-ID: <b51efe22-f57e-ee1c-ab00-87f34ea6452d@synopsys.com>
Date:   Tue, 24 Apr 2018 18:18:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <SN6PR07MB45126298F09735193B0F0F00D8880@SN6PR07MB4512.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Alan,

On 24/04/2018 10:57, Alan Douglas wrote:
> Hi Gustavo,
> 
> On 10 April 2018 18:15, Gustavo Pimentel wrote:
>> Adds MSI-X support to the pcitest tool and modified the pcitest.sh script to
>> accomodate this new type of interruption test.
>>
>> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
>> ---
>>  include/uapi/linux/pcitest.h |  1 +
>>  tools/pci/pcitest.c          | 18 +++++++++++++++++-
>>  tools/pci/pcitest.sh         | 25 +++++++++++++++++++++++++
>>  3 files changed, 43 insertions(+), 1 deletion(-)
> I found some possible problems when testing with the Cadence EP driver.  The problem
> is that pcitest uses the BARs for tests, but we also use one for the MSI-X tables
> 
> In Cadence core the MSI-X table is in BAR0 by default, but this is configured to a size
> of 0x80 in the test driver, since it is used as the test_reg_bar.  So, I changed the 
> configuration to use BAR4 instead, which is configured to a size of 131072 
> in pci-efp-test.c, and this gives me enough space.
> 
> However, if I run the BAR tests in pcitest before running the MSI-X tests, the
> MSI-X tests fail, since the BAR content is overwritten.  It's not a problem with the 
> scenario in pcitest.sh, but it would be if the module wasn't re-loaded.
> 
> So, wondering if we need to come up with some mechanism to specify that a specific
> BAR will be used for MSI-X, and that its size and content shouldn't be modified by
> pcitest?

I see your point. I have bypassed the problem by doing the module load/unload
(to avoid having to fight on multiple fronts).

I like your suggestion. Maybe we could have a bool variable for each BARs that
could be set to false if a resource have intent to use it.

However this change must be accepted by Kishon.

> 
> Regards,
> Alan
> 
Regards,
Gustavo

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
