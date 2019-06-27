Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CEBE57D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 27 Jun 2019 15:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfF0PN1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 27 Jun 2019 11:13:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:59712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbfF0PN1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Jun 2019 11:13:27 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8570920663;
        Thu, 27 Jun 2019 15:13:25 +0000 (UTC)
Date:   Thu, 27 Jun 2019 11:13:24 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jiunn Chang <c0d1n61at3@gmail.com>, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        rcu@vger.kernel.org, linux-doc@vger.kernel.org,
        paulmck@linux.ibm.com, josh@joshtriplett.org,
        mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
        joel@joelfernandes.org
Subject: Re: [Linux-kernel-mentees][PATCH v5 1/5] Documentation: RCU:
 Convert RCU basic concepts to reST
Message-ID: <20190627111324.1db0f1ec@gandalf.local.home>
In-Reply-To: <20190627083443.4f4918a7@lwn.net>
References: <20190626191249.21135-1-c0d1n61at3@gmail.com>
        <20190626200705.24501-2-c0d1n61at3@gmail.com>
        <20190627083443.4f4918a7@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 27 Jun 2019 08:34:43 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> On Wed, 26 Jun 2019 15:07:01 -0500
> Jiunn Chang <c0d1n61at3@gmail.com> wrote:
> 
> > RCU basic concepts reST markup.
> > 
> > Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>  
> 
> So this is a little detail but ... your signoff should be the last thing
> in the set of tags on the patch.

Note, I've been seeing this a lot lately, and then noticed, that when I
downloaded a patch directly from patchwork, it placed all the
Reviewed-by and Acked-by tags after the original Signed-off-by. I
checked the original patch on the mailing list, and it had no other
tags but the Signed-off-by. I then pulled one of my own patches, and it
did it to that patch as well.

I too prefer the Signed-off-by be last, but our tooling needs to do
this as well, otherwise it's a failure in our procedures.

-- Steve
