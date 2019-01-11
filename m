Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2CFCA7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Jan 2019 00:09:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfAKAIN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 Jan 2019 19:08:13 -0500
Received: from ms.lwn.net ([45.79.88.28]:54300 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726217AbfAKAIN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Jan 2019 19:08:13 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CB0FE4B7;
        Fri, 11 Jan 2019 00:08:12 +0000 (UTC)
Date:   Thu, 10 Jan 2019 17:08:11 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Christian Brauner <christian@brauner.io>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/filesystems: add binderfs
Message-ID: <20190110170811.5d56f9cb@lwn.net>
In-Reply-To: <20190110235641.nhuodos74i67jf64@brauner.io>
References: <20190110231309.12653-1-christian@brauner.io>
        <20190110164703.1dd6cee1@lwn.net>
        <20190110235641.nhuodos74i67jf64@brauner.io>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 11 Jan 2019 00:56:42 +0100
Christian Brauner <christian@brauner.io> wrote:

> >  - Please consider doing this in RST and tying it into our documentation
> >    tree.  It's *almost* RST now, so the effort required will be almost
> >    zero.  
> 
> Oh sure. I simply didn't know. I was just going by the files under
> Documentation/filesystems/. Is this a separate git tree? If so, where is
> located? Or can I just place it as
> Documentation/filesystems/binderfs.rst?

The latter - plus an entry in index.rst.  Look at, say, path-lookup.rst in
that directory now.

> >  - Is it worth putting the example program in the samples/ directory?  Is
> >    it something that would ever make any sense to run in its current form?  
> 
> Hm, I mean I can write a small binary that illustrates mounting and
> allocating binder devices in binderfs.

This was just a thought - I sure don't want to try to send you off on some
sort of project if it won't be useful! :)

Thanks,

jon
