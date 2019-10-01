Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A53D97D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 Oct 2019 12:53:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731525AbfJAMxG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 Oct 2019 08:53:06 -0400
Received: from ms.lwn.net ([45.79.88.28]:36462 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726464AbfJAMxG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Oct 2019 08:53:06 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 91A1C6A2;
        Tue,  1 Oct 2019 12:53:05 +0000 (UTC)
Date:   Tue, 1 Oct 2019 06:53:04 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jon Haslam <jonhaslam@fb.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <hannes@cmpxchg.org>, <tj@kernel.org>, <guro@fb.com>
Subject: Re: [PATCH] docs: fix memory.low description in cgroup-v2.rst
Message-ID: <20191001065304.07e8ebf7@lwn.net>
In-Reply-To: <20190925195604.2153529-1-jonhaslam@fb.com>
References: <20190925195604.2153529-1-jonhaslam@fb.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 25 Sep 2019 12:56:04 -0700
Jon Haslam <jonhaslam@fb.com> wrote:

> The current cgroup-v2.rst file contains an incorrect description of when
> memory is reclaimed from a cgroup that is using the 'memory.low'
> mechanism. This fix simply corrects the text to reflect the actual
> implementation.
> 
> Fixes: 7854207fe954 ("mm/docs: describe memory.low refinements")
> Signed-off-by: Jon Haslam <jonhaslam@fb.com>

Applied, thanks.

jon
