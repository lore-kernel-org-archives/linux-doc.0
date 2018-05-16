Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A49D77D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 May 2018 19:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751028AbeEPTS2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 May 2018 15:18:28 -0400
Received: from ms.lwn.net ([45.79.88.28]:37742 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750847AbeEPTS1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 May 2018 15:18:27 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 811632E7;
        Wed, 16 May 2018 19:18:25 +0000 (UTC)
Date:   Wed, 16 May 2018 13:18:23 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Kim Phillips <kim.phillips@arm.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: documentation: update sysfs section
Message-ID: <20180516131823.4b1a3ecb@lwn.net>
In-Reply-To: <20180514121959.a9a3d2fb3d3d270849ffbc39@arm.com>
References: <20180507172915.c032cd71c07b1849bf419a5f@arm.com>
        <CANLsYkyQLan3XajOz2uuoOF8OQchGfeu2ZkZJ9H1Xm9q==aXTw@mail.gmail.com>
        <20180514121959.a9a3d2fb3d3d270849ffbc39@arm.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 May 2018 12:19:59 -0500
Kim Phillips <kim.phillips@arm.com> wrote:

> - Align and show updated ls devices output from the TC2, based on
>   current driver
> 
> - Provide an example from an ETMv4 based system (Juno)
> 
> - Reflect changes to the way the RAM write pointer is accessed since
>   it got changed in commit 7d83d17795ef ("coresight: tmc: adding sysFS
>   management entries").

So I was going to apply this, but it's been pretty badly corrupted by
your mailer.  Could I ask you to retry, please?

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
