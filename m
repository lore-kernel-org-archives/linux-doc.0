Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2BB7B7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Jun 2018 18:52:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754780AbeFNSv4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Jun 2018 14:51:56 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33238 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754695AbeFNSvz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jun 2018 14:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LE/VGaunhsekPrrqBfkf0dq8d5PiPsqYKvyNVff7HSA=; b=dmFbMJRChSCBmGYO4lXTzs68Z
        rNH9OWvoPVlyc/cduzKULLh5HnDowhINMAkOtkKmCV1FEzyej8YyvI1UwenRF4LOXm4S5CyTMAPKL
        VPRqwYr8TINd0zu59JRaC4HONlUpsZA5BW7SKgwIV8MCp3/XlJeYTYUbls3WEgUR5BmSOLUzs0Hj5
        CBZJ/MQmW39A0wP6XBmpX4VDgB7OVwKadfsQwfjZnvzbDuB5VrcPKZDkCJ1tmcFED4RbFQXYekdCj
        NpaqriOYYfOCOuXeLuIh8nCGCYFybBn6x6lgWknT2hYk4qYDGos++tEFiAMhqsXFirlYwyDfoxYSx
        x218Axwqw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fTXLR-00065G-NZ; Thu, 14 Jun 2018 18:51:43 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 86EB720268300; Thu, 14 Jun 2018 20:51:39 +0200 (CEST)
Date:   Thu, 14 Jun 2018 20:51:39 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Thomas Hellstrom <thellstrom@vmware.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Davidlohr Bueso <dave@stgolabs.net>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/2] locking: Implement an algorithm choice for
 Wound-Wait mutexes
Message-ID: <20180614185139.GG12198@hirez.programming.kicks-ass.net>
References: <20180613074745.14750-1-thellstrom@vmware.com>
 <20180613074745.14750-2-thellstrom@vmware.com>
 <20180613095012.GW12198@hirez.programming.kicks-ass.net>
 <69f3dee9-4782-bc90-3ee2-813ac6835c4a@vmware.com>
 <20180613131000.GX12198@hirez.programming.kicks-ass.net>
 <9afd482d-7082-fa17-5e34-179a652376e5@vmware.com>
 <20180614105151.GY12198@hirez.programming.kicks-ass.net>
 <dd0c5e50-ac14-912c-d31c-c2341fdd2864@vmware.com>
 <20180614144254.GB12198@hirez.programming.kicks-ass.net>
 <5a1076ad-3c26-d78a-5542-9e767d81c4a6@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a1076ad-3c26-d78a-5542-9e767d81c4a6@vmware.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 14, 2018 at 06:43:40PM +0200, Thomas Hellstrom wrote:
> Overall, I think this looks fine. I'll just fix up the FLAG_WAITERS setting
> and affected comments and do some torture testing on it.

Thanks!

> Are you OK with adding the new feature and the cleanup in the same patch?

I suppose so, trying to untangle that will be a bit of a pain. But if
you feel so inclined I'm not going to stop you :-)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
