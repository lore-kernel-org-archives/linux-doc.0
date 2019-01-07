Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DDBDE7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 22:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfAGWcU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 17:32:20 -0500
Received: from ipmail06.adl2.internode.on.net ([150.101.137.129]:32023 "EHLO
        ipmail06.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726638AbfAGWcU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jan 2019 17:32:20 -0500
Received: from ppp59-167-129-252.static.internode.on.net (HELO dastard) ([59.167.129.252])
  by ipmail06.adl2.internode.on.net with ESMTP; 08 Jan 2019 09:02:17 +1030
Received: from dave by dastard with local (Exim 4.80)
        (envelope-from <david@fromorbit.com>)
        id 1ggdRO-0007A0-Qa; Tue, 08 Jan 2019 09:32:14 +1100
Date:   Tue, 8 Jan 2019 09:32:14 +1100
From:   Dave Chinner <david@fromorbit.com>
To:     Waiman Long <longman@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Davidlohr Bueso <dave@stgolabs.net>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Daniel Colascione <dancol@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 0/2] /proc/stat: Reduce irqs counting performance overhead
Message-ID: <20190107223214.GZ6311@dastard>
References: <1546873978-27797-1-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1546873978-27797-1-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 07, 2019 at 10:12:56AM -0500, Waiman Long wrote:
> As newer systems have more and more IRQs and CPUs available in their
> system, the performance of reading /proc/stat frequently is getting
> worse and worse.

Because the "roll-your-own" per-cpu counter implementaiton has been
optimised for low possible addition overhead on the premise that
summing the counters is rare and isn't a performance issue. This
patchset is a direct indication that this "summing is rare and can
be slow" premise is now invalid.

We have percpu counter infrastructure that trades off a small amount
of addition overhead for zero-cost reading of the counter value.
i.e. why not just convert this whole mess to percpu_counters and
then just use percpu_counter_read_positive()? Then we just don't
care how often userspace reads the /proc file because there is no
summing involved at all...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
