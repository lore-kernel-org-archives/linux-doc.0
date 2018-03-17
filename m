Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2AFA37E66E
	for <lwn-linux-doc@archive.lwn.net>; Sat, 17 Mar 2018 01:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753052AbeCQBKY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 21:10:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:56458 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753044AbeCQBKX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Mar 2018 21:10:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 26CB7ACBC;
        Sat, 17 Mar 2018 01:10:22 +0000 (UTC)
Date:   Sat, 17 Mar 2018 01:10:21 +0000
From:   "Luis R. Rodriguez" <mcgrof@kernel.org>
To:     Waiman Long <longman@redhat.com>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH v5 1/9] sysctl: Add flags to support min/max range
 clamping
Message-ID: <20180317011021.GB4449@wotan.suse.de>
References: <1521224030-2185-1-git-send-email-longman@redhat.com>
 <1521224030-2185-2-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521224030-2185-2-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 16, 2018 at 02:13:42PM -0400, Waiman Long wrote:
> When the CTL_FLAGS_CLAMP_RANGE flag is set in the ctl_table
> entry, any update from the userspace will be clamped to the given
> range without error if either the proc_dointvec_minmax() or the
> proc_douintvec_minmax() handlers is used.

I don't get it.  Why define a generic range flag when we can be mores specific and
you do that in your next patch. What's the point of this flag then?

  Luis
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
