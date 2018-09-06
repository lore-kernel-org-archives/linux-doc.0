Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 298027D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Sep 2018 22:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbeIGDCa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Sep 2018 23:02:30 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:44932 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbeIGDC3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Sep 2018 23:02:29 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 649B1D00;
        Thu,  6 Sep 2018 22:24:52 +0000 (UTC)
Date:   Thu, 6 Sep 2018 15:24:51 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Davidlohr Bueso <dave@stgolabs.net>
Cc:     Waiman Long <longman@redhat.com>,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Takashi Iwai <tiwai@suse.de>, Davidlohr Bueso <dbueso@suse.de>,
        manfred@colorfullife.com
Subject: Re: [PATCH v8 0/5] ipc: IPCMNI limit check for *mni & increase that
 limit
Message-Id: <20180906152451.e8c6ff58a867646ff5209cfc@linux-foundation.org>
In-Reply-To: <20180817165008.GB32382@linux-r8p5>
References: <1529317698-16575-1-git-send-email-longman@redhat.com>
        <20180817165008.GB32382@linux-r8p5>
X-Mailer: Sylpheed 3.6.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 17 Aug 2018 09:50:08 -0700 Davidlohr Bueso <dave@stgolabs.net> wrote:

> >Enforcing the range limit check may cause some existing applications to break
> >if they unwittingly set a value higher than 32k. To allow system administrators
> >to work around this issue, a new ipcmni_compat sysctl parameter can now be set
> >to restore the old behavior. This compatibility mode can only be set if the
> >ipcmni_extend boot parameter is not specified. Patch 5 implements this new
> >sysctl parameter.
> >
> >Waiman Long (5):
> >  ipc: IPCMNI limit check for msgmni and shmmni
> >  ipc: IPCMNI limit check for semmni
> 
> I've reviewed the first two which look good and are actual immediate fixes
> to the bogus user input. I haven't gotten around yet the rest of the patches
> but are at least a bit more controversial than the first two. As such, could
> patch 1 and 2 be picked up once the merge window closes, for v4.20? Although
> -stable might want in, this situation is quite historic, so it's not that
> urgent.

Thanks.  Could we please have a refresh and resend?  Hopefully Luis
will have time for another pass.
