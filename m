Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5D0887D90D
	for <lwn-linux-doc@archive.lwn.net>; Sun, 27 Oct 2019 18:17:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfJ0SRb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 27 Oct 2019 14:17:31 -0400
Received: from ms.lwn.net ([45.79.88.28]:60810 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727069AbfJ0SRa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 27 Oct 2019 14:17:30 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8A2E2736;
        Sun, 27 Oct 2019 18:17:29 +0000 (UTC)
Date:   Sun, 27 Oct 2019 12:17:29 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Sphinx parallel build errors
Message-ID: <20191027121729.59c1d539@lwn.net>
In-Reply-To: <8305ffe2-51ba-eb4b-4d44-2defe45aa68f@infradead.org>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
        <201910091929.0C058BB@keescook>
        <20191010124832.23bc4362@lwn.net>
        <c6263597-e9d0-5a1f-effd-d1706c24e666@infradead.org>
        <8305ffe2-51ba-eb4b-4d44-2defe45aa68f@infradead.org>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 27 Oct 2019 11:11:57 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> > Yes, I see oom-kills when building docs for 5.4-rc2.
> > But only after I ran 'gimp *.jpg' for 22 photos.
> > 
> > I can see anywhere from 1 to 4 sphinx-build processes running.  
> 
> I continue to have oom-kills when building docs.
> At least 2 times I also had system freezes where I had to power
> cycle to reboot.
> 
> I suppose I can only hope that other people start running into this
> issue.  :(

Are you still running gimp at the same time?

Also, are you doing a straight "make htmldocs" or something else?

Thanks,

jon
