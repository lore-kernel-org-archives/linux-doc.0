Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 70B117D082
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Oct 2018 17:31:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbeJMBF2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Oct 2018 21:05:28 -0400
Received: from ms.lwn.net ([45.79.88.28]:51176 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbeJMBF2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 12 Oct 2018 21:05:28 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8A54897E;
        Fri, 12 Oct 2018 17:31:55 +0000 (UTC)
Date:   Fri, 12 Oct 2018 11:31:54 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Nikolay Borisov <nborisov@suse.com>
Cc:     snitzer@redhat.com, linux-doc@vger.kernel.org, dm-devel@redhat.com
Subject: Re: [PATCH] dm flakey: Document "error_writes" feature
Message-ID: <20181012113154.7d2f4a64@lwn.net>
In-Reply-To: <1539073891-7701-1-git-send-email-nborisov@suse.com>
References: <1539073891-7701-1-git-send-email-nborisov@suse.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  9 Oct 2018 11:31:31 +0300
Nikolay Borisov <nborisov@suse.com> wrote:

> Commit ef548c551e72 ("dm flakey: introduce "error_writes" feature")
> added the ability to dm flakey to error out writes in contrast to
> silently dropping it with 'drop_writes'. Unfortunately this feature
> is not currently documented and one has to be either familiar with the
> source code of dm flakey or check out xfstests sources to know of
> this parameter. So document it.
> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>

Applied to the docs tree, thanks.

jon
