Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CF4667DE74
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 20:22:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751878AbeEJUWj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 16:22:39 -0400
Received: from ms.lwn.net ([45.79.88.28]:59174 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751438AbeEJUWi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 May 2018 16:22:38 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 97046318;
        Thu, 10 May 2018 20:22:37 +0000 (UTC)
Date:   Thu, 10 May 2018 14:22:35 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Fix some doc build warnings/errors and broken
 links
Message-ID: <20180510142235.221da447@lwn.net>
In-Reply-To: <cover.1525870886.git.mchehab+samsung@kernel.org>
References: <cover.1525870886.git.mchehab+samsung@kernel.org>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  9 May 2018 10:18:43 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Patches 1 to 5 on this series contain the patches that weren't yet
> applied from the past patch series and touch only at Documentation.
> There are two changes there:
>   patch 2: fixed the description and added a c/c to cgroup maintainers;
>   patch 4: rewritten according with Louis request, droping several hunks.

Of these, I've applied 2, 4, and 6.  The networking and crypto folks like
to apply their own documentation fixes; I assume they'll pick these up.

> Patch 6 rewrites scripts/documentation-file-ref-check on Perl,
> adding an auto-fix feature.

Applied this one.

> Patches 7 and 8 fix things that would cause troubles for the
> automatic autocorrection tool.

#7 is applied.  #8 doesn't apply, though; I'm not sure which tree you made
it against?  In any case, I've stopped here for now.

> Patch 9 touches a lot of random places (including MAINTAINERS)
> that contain broken links and can be auto-fixed. It could be
> broken into one patch per touched file, but I think that is
> overkill. 

Let's keep this one (and the ones that follow) aside.  I'm happy to apply
them, but I think they are best applied as an end-of-merge-window thing.  I
envision lots of conflicts, and I already have a pile of those to explain
to Linus this time around.

Sound good?

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
