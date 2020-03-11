Return-Path: <SRS0=0k1m=44=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92829C10F27
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 12:11:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 677F6222D9
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 12:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583928667;
	bh=one5XBXJgUhhoKcF+H5sPl+DICmByqxFNl6AR4lofY0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=b7KIvNKo68UxZE0bY4jXe0XAC/VaSDTzI8wVqQpmQyJXPVghtfyWSRjd0rJGgjQS1
	 mMx/CCF6dClnD+Qhz53LS5QBkKGJYK+VVaihMI1rSfxASMfunGZOu5xACnqq/Xa7DD
	 MWPmWDqRiAq+i3wZpwYh+cJj+r+HYfHV14pKb5xk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbgCKMLH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Mar 2020 08:11:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:54196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729197AbgCKMLG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Mar 2020 08:11:06 -0400
Received: from onda.lan (unknown [217.110.198.118])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 601AF222C3;
        Wed, 11 Mar 2020 12:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583928666;
        bh=one5XBXJgUhhoKcF+H5sPl+DICmByqxFNl6AR4lofY0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sSBY/jVGdJ+l5J7/zszCb4gzRncMxCay2OJdIq7SqMXQe7KTZUSZTj1+AkNlZMRVi
         0/IbByai4RDHPBple3lvOW3PT5P/yLMSMDGfCMylKc/UIwzKBRm1osO7EKG1W1jjWg
         U7AJzHoGiBvigHQT1QG9OpHbFkGNZ0OuB4+z7nzg=
Date:   Wed, 11 Mar 2020 13:11:02 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/9] docs: watch_queue.rst: supress some Sphinx warnings
Message-ID: <20200311131102.65943e1b@onda.lan>
In-Reply-To: <765154.1583864958@warthog.procyon.org.uk>
References: <20200310115328.021999a7@lwn.net>
        <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
        <637fc605eb2fe6e27d9983ee5c30d78989618313.1583250595.git.mchehab+huawei@kernel.org>
        <765154.1583864958@warthog.procyon.org.uk>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 10 Mar 2020 18:29:18 +0000
David Howells <dhowells@redhat.com> escreveu:

> Jonathan Corbet <corbet@lwn.net> wrote:
> 
> >  - We *really* don't want to be adding more files like this to the top
> >    level; we have a directory hierarchy for a reason.  This looks like it
> >    belongs (mostly) in the core-api manual.  
> 
> Sure.  Btw, the core-api/ is a bit of a miscellaneous bag - errseq, for
> example, should probably be in filesystems/.
> 
> >  - Can the user-space example be instead turned into a working program
> >    under samples (or perhaps a test under tests/)?  
> 
> There is a working sample under samples/ also. See:
> 
> 	https://lore.kernel.org/linux-fsdevel/158375623086.334846.16121725232323108842.stgit@warthog.procyon.org.uk/T/#t
> 
> patches 7, 14 and 17.

Well, you could include the complete example from samples at the end of
this file, using a code block with:

	.. literalinclude:: /samples/foo.c
	   :language: c

This will display the Sphinx output files there at the html/pdf output,
as if it is part of the watch_queue.rst, and use the C code highlight.

> 
> But no, this needs to be documented in the documentation also.  Manual pages
> and testing (at least of key notifications) are available in a branch of the
> keyutils package.
> 
> Actually, I need to amend my document to remove references to usb and block
> notifications.
> 
> David
> 
