Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 350877D071
	for <lwn-linux-doc@archive.lwn.net>; Thu, 12 Jul 2018 23:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732368AbeGLX2d (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Jul 2018 19:28:33 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:49092 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732326AbeGLX2d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jul 2018 19:28:33 -0400
Received: from localhost.localdomain (c-24-4-125-7.hsd1.ca.comcast.net [24.4.125.7])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id D0158BBF;
        Thu, 12 Jul 2018 23:16:45 +0000 (UTC)
Date:   Thu, 12 Jul 2018 16:16:44 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Michal Hocko <mhocko@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jan Kara <jack@suse.cz>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Larry Woodman <lwoodman@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Wangkai (Kevin C)" <wangkai86@huawei.com>
Subject: Re: [PATCH v6 0/7] fs/dcache: Track & limit # of negative dentries
Message-Id: <20180712161644.02dec2142cad842bc8b73a41@linux-foundation.org>
In-Reply-To: <c68aa6ad-9e35-f828-6373-39938fd6e2a7@redhat.com>
References: <1530905572-817-1-git-send-email-longman@redhat.com>
        <20180709081920.GD22049@dhcp22.suse.cz>
        <62275711-e01d-7dbe-06f1-bf094b618195@redhat.com>
        <20180710142740.GQ14284@dhcp22.suse.cz>
        <a2794bcc-9193-cbca-3a54-47420a2ab52c@redhat.com>
        <20180711102139.GG20050@dhcp22.suse.cz>
        <9f24c043-1fca-ee86-d609-873a7a8f7a64@redhat.com>
        <20180712084807.GF32648@dhcp22.suse.cz>
        <c68aa6ad-9e35-f828-6373-39938fd6e2a7@redhat.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 12 Jul 2018 12:12:28 -0400 Waiman Long <longman@redhat.com> wrote:

> The rationale beside this patchset comes from a customer request to have
> the ability to track and limit negative dentries. 

Please go back to customer and ask them "why", then let us know.

Could I suggest you stop working on implementation things and instead
work on preparing a comprehensive bug report?  Describe the workload,
describe the system behavior, describe why it is problematic, describe
the preferred behavior, etc.

Once we have that understanding, it might be that we eventually agree
that the problem is unfixable using existing memory management
techniques and that it is indeed appropriate that we add a lot more
code which essentially duplicates kswapd functionality and which
essentially duplicates direct reclaim functionality.  But I sure hope
not.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
