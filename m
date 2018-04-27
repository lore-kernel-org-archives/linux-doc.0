Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 533D57DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 23:25:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933111AbeD0XZZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 19:25:25 -0400
Received: from ms.lwn.net ([45.79.88.28]:55466 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933033AbeD0XZZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Apr 2018 19:25:25 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7602E2DB;
        Fri, 27 Apr 2018 23:25:24 +0000 (UTC)
Date:   Fri, 27 Apr 2018 17:25:23 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/7] docs/vm: update KSM documentation
Message-ID: <20180427172523.746d2ffd@lwn.net>
In-Reply-To: <1524552028-7017-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1524552028-7017-1-git-send-email-rppt@linux.vnet.ibm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 24 Apr 2018 09:40:21 +0300
Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:

> These patches extend KSM documentation with high level design overview and
> some details about reverse mappings and split the userspace interface
> description to Documentation/admin-guide/mm.
> 
> The description of some KSM sysfs attributes is changed so that it won't
> include implementation detail. The description of these implementation
> details are moved to the new "Design" section.
> 
> The last patch in the series depends on the patchset that create
> Documentation/admin-guide/mm [1], all the rest applies cleanly to the
> current docs-next.

I've applied the set, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
