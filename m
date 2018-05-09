Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 203767DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 11:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934336AbeEILzl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 07:55:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41768 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934272AbeEILzk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 07:55:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1cuJfujO5def6mPs8NK+8aWotXydoH44Ok+YO/KY8ug=; b=bHHx8YWbRPjRgzSjs4SR9t9I7
        fp3XMEWpDZy0JKxd3myqCZAXKkHJwTk2uY9QsVQHuuq7BiYQ7jD1hAf8a59gRLEtQQuiaf79RaIFL
        aDkAh568BgRFGZ61D+84wGZDSN+xIhja3kPP8hI5B/Q/s7q/boFbIEPsg7ubqxGOnpARF3S14gMrB
        vSMz1pa0Nh8L5anwZqalhs2wUSuamtGtjDrXBPa2AusDMENtt2QlqIZCcQcsUE//0r/rgQfLYbmPC
        YZ7ASmi4aHFTysgy2Io0EUTOkTVHx1d2Nb94m4QUN8fjmikiBtvsWuO51QmKb9vtnb7q5Bgr0sng3
        Hbr5bCP2Q==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGNh4-0005CV-Fv; Wed, 09 May 2018 11:55:38 +0000
Date:   Wed, 9 May 2018 08:55:33 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [PATCH 10/18] rcu: rcupdate.h: get rid of Sphinx warnings at
 rcu_pointer_handoff()
Message-ID: <20180509085533.54951174@vento.lan>
In-Reply-To: <20180507142322.GW26088@linux.vnet.ibm.com>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <a87d742e81124ddfeaa5b83daf10c91758c1b025.1525684985.git.mchehab+samsung@kernel.org>
        <20180507142322.GW26088@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Mon, 7 May 2018 07:23:22 -0700
"Paul E. McKenney" <paulmck@linux.vnet.ibm.com> escreveu:

> On Mon, May 07, 2018 at 06:35:46AM -0300, Mauro Carvalho Chehab wrote:
> > The code example at rcupdate.h currently produce lots of warnings:
> > 
> > 	./include/linux/rcupdate.h:572: WARNING: Unexpected indentation.
> > 	./include/linux/rcupdate.h:576: WARNING: Unexpected indentation.
> > 	./include/linux/rcupdate.h:580: WARNING: Block quote ends without a blank line; unexpected unindent.
> > 	./include/linux/rcupdate.h:582: WARNING: Block quote ends without a blank line; unexpected unindent.
> > 	./include/linux/rcupdate.h:582: WARNING: Inline literal start-string without end-string.
> > 
> > Change it to a code-block.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> 
> Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> If you don't tell me otherwise, I will assume that you are pushing this.
> If you would rather that I take it, please let me know!

Hi Paul,

Feel free to merge it via your tree. It seems that Jon prefers to have
code changes merged via the usual maintainers.

Regards,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
