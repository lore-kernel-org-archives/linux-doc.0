Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 55A627D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Apr 2019 21:22:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbfDBVWM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Apr 2019 17:22:12 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:47692 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfDBVWM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Apr 2019 17:22:12 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 311E2E7C;
        Tue,  2 Apr 2019 21:22:11 +0000 (UTC)
Date:   Tue, 2 Apr 2019 14:22:10 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Waiman Long <longman@redhat.com>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Takashi Iwai <tiwai@suse.de>, Davidlohr Bueso <dbueso@suse.de>,
        Manfred Spraul <manfred@colorfullife.com>
Subject: Re: [RESEND PATCH 2/3] ipc: Conserve sequence numbers in
 ipcmni_extend mode
Message-Id: <20190402142210.ba29c7dfc10d5a315a1c39dd@linux-foundation.org>
In-Reply-To: <20190329204930.21620-2-longman@redhat.com>
References: <20190329204930.21620-1-longman@redhat.com>
        <20190329204930.21620-2-longman@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 29 Mar 2019 16:49:29 -0400 Waiman Long <longman@redhat.com> wrote:

> From: Manfred Spraul <manfred@colorfullife.com>
> 
> Rewrite, based on the patch from Waiman Long:
> 
> ...
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Original-patch-from: Waiman Long <longman@redhat.com>
> Signed-off-by: Manfred Spraul <manfred@colorfullife.com>
> Acked-by: Waiman Long <longman@redhat.com>

I added your Signed-off-by: to this.  Because you contributed and
because you were on the patch delivery path (either of these require a
SOB).

And I removed the Original-patch-from line.  The changelog already says
that and Original-patch-from isn't a standard changelog tag.
