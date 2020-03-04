Return-Path: <SRS0=BeNN=4V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51361C3F2CD
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 11:37:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FFCC2465D
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583321852;
	bh=EnJ48mBqSJNuN4pur5d9rPaOtktt8Bg5LJqlLCktZOo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=s6g3o1Edxil6X1h2qOL8gDAHhiDJqYGyb3itBpJmAJYNq2VPaNEtOVtBNJ8Lkyixf
	 OA13FtFe5tqtQRUWTHaW1yfpAxScyzI6SH4WuRgAumf1uoVnPxZ6wkoFz/oKTF7d4e
	 JteKbgiacDTDNi21gjmBUyUkV/2xN3qvHqeAorzk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387814AbgCDLh1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Mar 2020 06:37:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:60042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729261AbgCDLh1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 4 Mar 2020 06:37:27 -0500
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2311920870;
        Wed,  4 Mar 2020 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583321847;
        bh=EnJ48mBqSJNuN4pur5d9rPaOtktt8Bg5LJqlLCktZOo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SwU1LASd5/2lSKALZC7pvGkWl05Sb1JkPB43thx8zoYj9QZX7F8y2aY0ETGeuF6gi
         nPzVe6rAksGD/PZ5WXe5/JHK9hSXxEi5A6aFfRfFBx4PxPqJHVFJhFyktiREXlnPBp
         PuZldeM963PVB6sDwEMgnE3NzwiF8xVWx7E2hSLA=
Date:   Wed, 4 Mar 2020 20:37:22 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v4] Documentation: bootconfig: Update boot configuration
 documentation
Message-Id: <20200304203722.8e8699c2a3e0a979aae091b1@kernel.org>
In-Reply-To: <ad1e9855-4c64-53bd-7da5-f7cdafe78571@infradead.org>
References: <158322634266.31847.8245359938993378502.stgit@devnote2>
        <158322635301.31847.15011454479023637649.stgit@devnote2>
        <ad1e9855-4c64-53bd-7da5-f7cdafe78571@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Randy,

Thanks for review and good suggestions!

On Tue, 3 Mar 2020 20:55:39 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> > +Boot Configuration Syntax
> > +=========================
> > +
> > +The boot configuration syntax is a simple structured key-value. Each key
> > +consists of dot-connected-words, and key and value are connected by ``=``.
> > +The value has to be terminated by semi-colon (``;``) or newline (``\n``).
> >  For array value, array entries are separated by comma (``,``). ::
> 
>              values,
> or just
>    For an array, its entries are separated by

I like this latter one.

[...]
> > +Tree Structured Key
> > +-------------------
> >  
> > -The boot config file syntax allows user to merge partially same word keys
> > -by brace. For example::
> > +The boot configuration syntax allows user to merge same parent key using
> 
>                                  allows the user
> although I am having problems with the rest of that sentence.

What about the following?

User can group identical parent keys together and use braces to list child keys
under them.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
