Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 98B757DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 15:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755271AbeEHPoS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 11:44:18 -0400
Received: from ms.lwn.net ([45.79.88.28]:35702 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755059AbeEHPoS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 May 2018 11:44:18 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 409F72DD;
        Tue,  8 May 2018 15:44:17 +0000 (UTC)
Date:   Tue, 8 May 2018 09:44:15 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] docs/vm: move numa_memory_policy.rst to
 admin-guide/mm
Message-ID: <20180508094415.6cf78e6c@lwn.net>
In-Reply-To: <1525762930-28163-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1525762930-28163-1-git-send-email-rppt@linux.vnet.ibm.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  8 May 2018 10:02:07 +0300
Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:

> These patches include minor formatting and spelling updates to
> Documentation/vm/numa_memory_policy.rst and move this file to
> Documentation/admin-guide/mm.

Set applied - thanks!

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
