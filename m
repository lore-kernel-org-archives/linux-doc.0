Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4DDA37D048
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 07:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934903AbeE3Hoc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 03:44:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34378 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752842AbeE3Hob (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 May 2018 03:44:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7C38A6078C; Wed, 30 May 2018 07:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527666270;
        bh=53nMOEcDiP2M6s+LI/UjbonlWA/YKM/+Ox16DlcVSB8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Yvj8nc70+G3+qaPNLW85zU6t4ehykqUCxRePcFyhGP/zQXbZ5s3OBuyjIKNkqrSaJ
         oVNJIy6mn3ltd1Kgh2tEyuypnMmzVPuN7KuxfMkKiZiNGTnyB9hJo4ndNMnb3LZQRn
         eR0cpfTbyB6TDD8Nu6DkjlEmQmFYCIwEqN/nJF40=
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 3F8826060A;
        Wed, 30 May 2018 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527666269;
        bh=53nMOEcDiP2M6s+LI/UjbonlWA/YKM/+Ox16DlcVSB8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MSSI6znKfDeB+PusbRvOYWtNwOUUYE9GbBWB7yMxPUDWiV52IWM5vX2wvrKIPnxFo
         eGCxAEUxTnwaL5GqYSh7QricftXCcUao1Zbigjf1AggBEIhoLAmnfh8NXTq5Tmi2fT
         adfw2xje1jy7fBcCABoiE19sVwIDTazLxKj/U6+U=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 30 May 2018 00:44:29 -0700
From:   okaya@codeaurora.org
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-pci@vger.kernel.org, timur@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Corbet <corbet@lwn.net>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Christoffer Dall <cdall@linaro.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Thymo van Beers <thymovanbeers@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        David Rientjes <rientjes@google.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Keith Busch <keith.busch@intel.com>,
        Dongdong Liu <liudongdong3@huawei.com>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: Add pci=safemode option
In-Reply-To: <20180530073735.GA28793@infradead.org>
References: <1527650389-31575-1-git-send-email-okaya@codeaurora.org>
 <20180530043103.GA19734@kroah.com>
 <6c317ed8-cca3-8862-5f3b-12cf14e4d53b@codeaurora.org>
 <20180530073735.GA28793@infradead.org>
Message-ID: <6dfe2db8f974d94c9867f30ec83d9333@codeaurora.org>
X-Sender: okaya@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2018-05-30 00:37, Christoph Hellwig wrote:
> On Tue, May 29, 2018 at 09:41:33PM -0700, Sinan Kaya wrote:
>> Bjorn and I discussed the need for such a "safe" mode feature when you
>> want to bring up PCI for a platform. You want to turn off everything 
>> as
>> a starter and just stick to bare minimum.
> 
> Can we please make it a config option the instead of adding code
> to every kernel?  Also maybe the bringup should be in the name
> to make this more clear?

One other requirement was to have a runtime option rather than compile 
time option.

When someone reported a problem, we wanted to be able to say "use this 
option and see if system boots" without doing any bisects or 
recompilation.

This would be the first step in troubleshooting a system to see if 
fundamental features are working.

I don't mind changing the name
Bjorn mentioned safe option. I made it safemode. I am looking at Bjorn 
for suggestions at this moment.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
