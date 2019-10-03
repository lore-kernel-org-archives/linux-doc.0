Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B4C727D982
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Oct 2019 14:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730661AbfJCO34 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Oct 2019 10:29:56 -0400
Received: from ms.lwn.net ([45.79.88.28]:60784 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbfJCO3z (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Oct 2019 10:29:55 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 70EFC300;
        Thu,  3 Oct 2019 14:29:54 +0000 (UTC)
Date:   Thu, 3 Oct 2019 08:29:53 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     David Miller <davem@davemloft.net>
Cc:     j.neuschaefer@gmx.net, linux-doc@vger.kernel.org,
        jeffrey.t.kirsher@intel.com, snelson@pensando.io,
        drivers@pensando.io, intel-wired-lan@lists.osuosl.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: networking: device drivers: Remove stray
 asterisks
Message-ID: <20191003082953.396ebc1a@lwn.net>
In-Reply-To: <20191002.172526.1832563406015085740.davem@davemloft.net>
References: <20191002150956.16234-1-j.neuschaefer@gmx.net>
        <20191002.172526.1832563406015085740.davem@davemloft.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 02 Oct 2019 17:25:26 -0700 (PDT)
David Miller <davem@davemloft.net> wrote:

> Jon, how do you want to handle changes like this?

In whatever way works best.  Documentation should make our lives easier,
not get in the way :)

> I mean, there are unlikely to be conflicts from something like this so it
> could simply go via the documentation tree.
> 
> Acked-by: David S. Miller <davem@davemloft.net>

OK, I'll go ahead and apply it, then.

Thanks,

jon
