Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DD2D97D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 May 2018 20:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750924AbeEPUZC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 May 2018 16:25:02 -0400
Received: from foss.arm.com ([217.140.101.70]:54416 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750847AbeEPUZA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 May 2018 16:25:00 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6BD61596;
        Wed, 16 May 2018 13:24:59 -0700 (PDT)
Received: from dupont (dupont.austin.arm.com [10.118.16.87])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F5A43F25D;
        Wed, 16 May 2018 13:24:59 -0700 (PDT)
Date:   Wed, 16 May 2018 15:24:58 -0500
From:   Kim Phillips <kim.phillips@arm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] coresight: documentation: update sysfs section
Message-Id: <20180516152458.d392b0d1e09393da30e2aeb6@arm.com>
In-Reply-To: <20180516131823.4b1a3ecb@lwn.net>
References: <20180507172915.c032cd71c07b1849bf419a5f@arm.com>
        <CANLsYkyQLan3XajOz2uuoOF8OQchGfeu2ZkZJ9H1Xm9q==aXTw@mail.gmail.com>
        <20180514121959.a9a3d2fb3d3d270849ffbc39@arm.com>
        <20180516131823.4b1a3ecb@lwn.net>
Organization: Arm
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 16 May 2018 13:18:23 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> On Mon, 14 May 2018 12:19:59 -0500
> Kim Phillips <kim.phillips@arm.com> wrote:
> 
> > - Align and show updated ls devices output from the TC2, based on
> >   current driver
> > 
> > - Provide an example from an ETMv4 based system (Juno)
> > 
> > - Reflect changes to the way the RAM write pointer is accessed since
> >   it got changed in commit 7d83d17795ef ("coresight: tmc: adding sysFS
> >   management entries").
> 
> So I was going to apply this, but it's been pretty badly corrupted by
> your mailer.  Could I ask you to retry, please?

I had sent a v3 that corrected the issue, in the same thread, here:

https://lkml.org/lkml/2018/5/14/1190

Mathieu acked that one.

Thanks,

Kim
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
