Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E01C17D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Oct 2018 17:27:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbeJMBAp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Oct 2018 21:00:45 -0400
Received: from ms.lwn.net ([45.79.88.28]:51138 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbeJMBAp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 12 Oct 2018 21:00:45 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9DDBA9B1;
        Fri, 12 Oct 2018 17:27:13 +0000 (UTC)
Date:   Fri, 12 Oct 2018 11:27:12 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     John Garry <john.garry@huawei.com>
Cc:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <peterz@infradead.org>, <mingo@redhat.com>
Subject: Re: [PATCH] docs/completion.txt: Fix a couple of punctuation nits
Message-ID: <20181012112712.64ae0e72@lwn.net>
In-Reply-To: <1539183392-239389-1-git-send-email-john.garry@huawei.com>
References: <1539183392-239389-1-git-send-email-john.garry@huawei.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 10 Oct 2018 22:56:32 +0800
John Garry <john.garry@huawei.com> wrote:

> This patch fixes a couple of punctuation nits which can make the document
> more correct and readable.
> 
> Also missing "()" are added to some function references for consistency.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>

Applied, thanks.

I agree with the suggestion to move it to RST - happily, it's already a
valid RST file, and would really only requires a few small tweaks.  Of
course, perhaps the existing RST-compatible markup already renders it
"inferior" :)

jon
