Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A98B7D071
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Jul 2018 18:16:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731960AbeGSTAT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 15:00:19 -0400
Received: from imap.thunk.org ([74.207.234.97]:34704 "EHLO imap.thunk.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731839AbeGSTAT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Jul 2018 15:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thunk.org;
         s=ef5046eb; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=CsWiNSMj4wWO2YbzxVRcioQ6BwJumItbhbMgfCXRCh4=; b=u9HsvkpnRxpEJSJnO+BRB/sQKx
        NiP7kIdttOJfBuoNlqp6pj2DHcNZYjpXkABBKUOSPDdD+y2tIFiEWfn1tgJlYR+N+WR+ozVWvjLFE
        CHD8lIL31lOE1dsFVQf2lwuToTif0J1RTcNQQErJjI56obFzAumR5ghihkiSjtFAYo2Y=;
Received: from root (helo=callcc.thunk.org)
        by imap.thunk.org with local-esmtp (Exim 4.89)
        (envelope-from <tytso@thunk.org>)
        id 1fgDT5-0007GL-BZ; Thu, 19 Jul 2018 18:15:59 +0000
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 2CFC57A6417; Thu, 19 Jul 2018 14:15:56 -0400 (EDT)
Date:   Thu, 19 Jul 2018 14:15:56 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org
Cc:     "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Sphinx version dependencies?
Message-ID: <20180719181556.GA21435@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.0 (2018-05-17)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tytso@thunk.org
X-SA-Exim-Scanned: No (on imap.thunk.org); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Darrick has sent in patches to convert the ext4 documentation to use
rst and to be built as part of the full kernel documentation thanks.
In addition to that, he's imported the on-disk documentation from the
ext4 wiki into the kernel sources, so hopefully we can keep it more up
to date.

When I was experimenting with this, I had to actually build the kernel
docs using Sphinx for the first time.  I'm using Debian testing, so at
first I blindly followed the instructions by
./scripts/sphinx-pre-install:

Detected OS: Debian GNU/Linux unstable (sid).
	/usr/local/bin/virtualenv sphinx_1.4
	. sphinx_1.4/bin/activate
	pip install -r Documentation/sphinx/requirements.txt

But when I did that, Sphinx had heartburn over the ext4.rst file.

    ./include/linux/spi/spi.h:373: ERROR: Unexpected indentation.
    /usr/projects/linux/ext4/Documentation/filesystems/ext4/ext4.rst:139: ERROR: Malformed table.
    Column span alignment problem in table line 5.
    ...

After consulting with Darrick, it appears the problem is that Sphinx8
1.4.9 was the problem.  This is the version that
Documentation/sphinx/requirements.txt calls for.  He did his rst
conversion work using Ubuntu 18.04's Sphinx 1.6.7.

As it turns out Debian testing/unstable already has Sphinx 1.7.5 in
its repository, so if I simply install Sphinx 1.7.5, it works fine.
That's what I've done for now.

So that leaves me with some questions:

* Is there a reason why scripts/sphinx-pre-install suggested using a
  Python virtual environment and installing Sphinx 1.4.9 instead of
  using the distro's pre-packaged Sphinx for Debian unstable/testing?

* Why does Documentation/sphinx/requirements.txt asking for such an
  old version of Sphinx?
 
* Is it a requirement that *.rst files that are checked into the
  kernel repo have to work with Sphinx 1.4.9?  Or is it sufficient
  that it works with Sphinx 1.6.7 and 1.7.5 (which are the prepackaged
  Debian and Ubuntu versions).  And it looks like Fedora 28 has Sphinx
  1.7.2 if I'm not mistaken.   How many versions of Sphinx are various
  automated build/test systems using?

Thanks,

						- Ted
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
