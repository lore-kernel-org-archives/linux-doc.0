Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 851DD7D088
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Oct 2018 11:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbeJSTza (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 19 Oct 2018 15:55:30 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:37754 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbeJSTza (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Oct 2018 15:55:30 -0400
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
        by vmicros1.altlinux.org (Postfix) with ESMTP id 78CA072CC59;
        Fri, 19 Oct 2018 14:49:44 +0300 (MSK)
Received: from sole.flsd.net (sole.flsd.net [185.75.180.6])
        by imap.altlinux.org (Postfix) with ESMTPSA id 643744A4A16;
        Fri, 19 Oct 2018 14:49:44 +0300 (MSK)
Date:   Fri, 19 Oct 2018 14:49:44 +0300
From:   Vitaly Chikunov <vt@altlinux.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
        Jonathan Corbet <corbet@lwn.net>, Shaohua Li <shli@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-raid@vger.kernel.org
Subject: Re: [dm-devel] [PATCH] dm: add secdel target
Message-ID: <20181019114944.syemvziebwfuruof@sole.flsd.net>
References: <20181014112439.8119-1-vt@altlinux.org>
 <20181019061945.GA7403@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20181019061945.GA7403@infradead.org>
User-Agent: NeoMutt/20171215-106-ac61c7
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 18, 2018 at 11:19:45PM -0700, Christoph Hellwig wrote:
> Just as a note:  the name is a complete misowner, a couple overwrite
> are not in any way secure deletion.  So naming it this way and exposing
> this as erase is a problem that is going to get back to bite us.

In what way it's not secure deletion?

It's secure deletion by overwriting discarded data instead of leaving it
as is. Thus it's secure deletion in some way. Level of security and
applicability (disks choice) is to be determined by the end user.
Because nobody could guarantee absolute security. Some three letter
agencies require just one pass of overwrite, some say that more than one
pass does not increase security. Some hardware disks advertising secure
deletion may do not much more than this target. Thus 'secure erase' is
applicable in that way too.


> If you really want this anyway at least give it a different way, and
> do a one-time warning when th first erase comes in that it is not in
> any meaninful way secure.

dm-erase or dm-wipe? dm-discerase? But still provide REQ_OP_SECURE_ERASE
support?

