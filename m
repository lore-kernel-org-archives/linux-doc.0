Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 036147DF94
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 12:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933959AbeE2MMt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 08:12:49 -0400
Received: from ms.lwn.net ([45.79.88.28]:34588 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933793AbeE2MMr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 May 2018 08:12:47 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C40A4C36;
        Tue, 29 May 2018 12:12:46 +0000 (UTC)
Date:   Tue, 29 May 2018 06:12:44 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] docs/vm: move ksm and transhuge from "user" to
 "internals" section.
Message-ID: <20180529061244.348b6291@lwn.net>
In-Reply-To: <1527588818-7031-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1527588818-7031-1-git-send-email-rppt@linux.vnet.ibm.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 29 May 2018 13:13:38 +0300
Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:

> After the userspace interface description for KSM and THP was split to
> Documentation/admin-guide/mm, the remaining parts belong to the section
> describing MM internals.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
