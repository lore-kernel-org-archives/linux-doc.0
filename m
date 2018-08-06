Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CEDA77E3B8
	for <lwn-linux-doc@archive.lwn.net>; Mon,  6 Aug 2018 13:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730390AbeHFPXZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 6 Aug 2018 11:23:25 -0400
Received: from ms.lwn.net ([45.79.88.28]:50674 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730262AbeHFPXZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 6 Aug 2018 11:23:25 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6CB2D6E8;
        Mon,  6 Aug 2018 13:14:22 +0000 (UTC)
Date:   Mon, 6 Aug 2018 07:14:21 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Ben Hutchings <ben@decadent.org.uk>
Cc:     linux-doc@vger.kernel.org, valdis.kletnieks@vt.edu,
        905116@bugs.debian.org
Subject: Re: [PATCH v2] scripts/kernel-doc: Escape all literal braces in
 regexes
Message-ID: <20180806071421.081598c4@lwn.net>
In-Reply-To: <20180805164108.GC18030@decadent.org.uk>
References: <20180805164108.GC18030@decadent.org.uk>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 5 Aug 2018 17:41:09 +0100
Ben Hutchings <ben@decadent.org.uk> wrote:

> Commit 720ac2ef479d ("PATCH scripts/kernel-doc") fixed the two
> instances of literal braces that Perl 5.28 warns about, but there are
> still more than it doesn't warn about.

So where can I find this commit of which you speak?  I can't find it in
mainline, -next, or -stable...  

The patch looks good, I'd like to get it in this coming merge window if
possible.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
