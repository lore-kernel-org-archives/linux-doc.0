Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1C68D7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Apr 2019 21:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbfDKVaP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Apr 2019 17:30:15 -0400
Received: from zeniv.linux.org.uk ([195.92.253.2]:32836 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbfDKVaP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Apr 2019 17:30:15 -0400
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hEhGv-0003Tj-IZ; Thu, 11 Apr 2019 21:30:13 +0000
Date:   Thu, 11 Apr 2019 22:30:13 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        axboe@kernel.dk
Subject: Re: [PATCH REPOST] docs: Add struct file refcounting and SCM_RIGHTS
 mess info
Message-ID: <20190411213013.GI2217@ZenIV.linux.org.uk>
References: <20190411142308.179247a4@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190411142308.179247a4@lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 11, 2019 at 02:23:08PM -0600, Jonathan Corbet wrote:
> docs: Add struct file refcounting and SCM_RIGHTS mess info
> 
> Work up some text posted by Al and add it to the filesystem manual.
> 
> Co-developed-by: Al Viro <viro@zeniv.linux.org.uk>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
> This is the third sending of this patch.  Al, you *did* ask me to run it
> past you before putting it in; do you think you might get a chance to have
> a look sometime soon?

Will do, hopefully tonight...
