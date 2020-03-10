Return-Path: <SRS0=92oT=43=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41028C10F27
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 18:29:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1218D20727
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 18:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U4x+Hf+O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgCJS33 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 14:29:29 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58448 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726283AbgCJS33 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Mar 2020 14:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583864968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ti6QI7xQ6eYMCmkpbrxl58wrJMibjljy9s4mxo1fsrQ=;
        b=U4x+Hf+OMwsR69X+a9syJb1ivIO6TmtJqW5eXVAQ2/I4fCU6cwI3TzupWYcXawA1wrqsF6
        +RbUZqFzApr2Q/1nO3FkRgTGqEfqTeTyDAYWIknE9FFn1mBCoCUemQhOBbmuQAJkl4ypYu
        IeZx4jwMYxgbtGNaA0ihCU3WjlOPx14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-Wj7FByqxNZ-w3bny00luTg-1; Tue, 10 Mar 2020 14:29:21 -0400
X-MC-Unique: Wj7FByqxNZ-w3bny00luTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38812102C8D5;
        Tue, 10 Mar 2020 18:29:20 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-182.rdu2.redhat.com [10.10.120.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4E89C90779;
        Tue, 10 Mar 2020 18:29:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200310115328.021999a7@lwn.net>
References: <20200310115328.021999a7@lwn.net> <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org> <637fc605eb2fe6e27d9983ee5c30d78989618313.1583250595.git.mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     dhowells@redhat.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/9] docs: watch_queue.rst: supress some Sphinx warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <765153.1583864958.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 10 Mar 2020 18:29:18 +0000
Message-ID: <765154.1583864958@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> wrote:

>  - We *really* don't want to be adding more files like this to the top
>    level; we have a directory hierarchy for a reason.  This looks like i=
t
>    belongs (mostly) in the core-api manual.

Sure.  Btw, the core-api/ is a bit of a miscellaneous bag - errseq, for
example, should probably be in filesystems/.

>  - Can the user-space example be instead turned into a working program
>    under samples (or perhaps a test under tests/)?

There is a working sample under samples/ also. See:

	https://lore.kernel.org/linux-fsdevel/158375623086.334846.161217252323231=
08842.stgit@warthog.procyon.org.uk/T/#t

patches 7, 14 and 17.

But no, this needs to be documented in the documentation also.  Manual pag=
es
and testing (at least of key notifications) are available in a branch of t=
he
keyutils package.

Actually, I need to amend my document to remove references to usb and bloc=
k
notifications.

David

