Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0FCF67D048
	for <lwn-linux-doc@archive.lwn.net>; Sat,  2 Jun 2018 17:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751910AbeFBR5X (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 2 Jun 2018 13:57:23 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33848 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751808AbeFBR5V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Jun 2018 13:57:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CAFCC607E8; Sat,  2 Jun 2018 17:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527962240;
        bh=sDtINSpVHeZryBvZ+qAUCSGu55pYJlMM9rCZLho4iS0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HRVslMRqJH09wuCQL3Na9j8KKokpcrnbCnanbFsBpU+U6zeNNnUo2QuMGG8VBupce
         s+Fj3ry32ondy+riayfJHPNZ295XkHbdjmldd2HSelRky4BTw5E6keENmvOvZiHrFM
         LZtCST2bIarbnPoq4mUhP7GL4EdlTLtTEjng5WzA=
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 565EF60249;
        Sat,  2 Jun 2018 17:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527962239;
        bh=sDtINSpVHeZryBvZ+qAUCSGu55pYJlMM9rCZLho4iS0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Dj9bMWG+avv8cMoPZHcthWYfqlh9f2vWGqzh4nMm9fURgQH54suD6iVFVu46B/2Cb
         +M+ftljfizdr/sZgW93l9i1Xb/ycp38EKLMk0Vqlf/208SW9vGEP6aT5MRd+DpMre4
         Lz7hugPDBNKLl1jZKFYX8xTdZQrtoYVz7vXxrUdk=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 02 Jun 2018 13:57:19 -0400
From:   okaya@codeaurora.org
To:     Pavel Machek <pavel@ucw.cz>
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
In-Reply-To: <20180602174307.GB14870@amd>
References: <1527650389-31575-1-git-send-email-okaya@codeaurora.org>
 <20180530043103.GA19734@kroah.com>
 <6c317ed8-cca3-8862-5f3b-12cf14e4d53b@codeaurora.org>
 <20180602174307.GB14870@amd>
Message-ID: <f3d6c44829910cb09c6f72dba1c41b39@codeaurora.org>
X-Sender: okaya@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2018-06-02 13:43, Pavel Machek wrote:
> Hi!
> 
>> > And you should explain what exactly in PCI is "optional".  Who defines
>> > this and where is that list and what can go wrong if those options are
>> > not enabled?
>> 
>> Bjorn and I discussed the need for such a "safe" mode feature when you
>> want to bring up PCI for a platform. You want to turn off everything 
>> as
>> a starter and just stick to bare minimum.
>> 
>> I can add a few words describing them. The goal of this option is to 
>> keep
>> base PCI features with MSI only. Things like PME, AER, ASPM, Extended
>> Tags, LTR, Relaxed Ordering, SRIOV are all considered optional. 
>> safemode
>> is certainly not intended for production environments.
>> 
>> I can taint the kernel as a suggestion.
> 
> I don't think tainting is required. even modern platforms should work
> in the safe mode.

Yeah, concern was getting used to the safe mode and never running the 
full stack to fix the actual issues like getting away with crappy 
hardware and firmware.

It becomes a support issue for the community.


> 									Pavel
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
