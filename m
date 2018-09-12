Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 603C17D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 15:41:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbeILUq6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 16:46:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60200 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726640AbeILUq6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 Sep 2018 16:46:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 8DAC340122C3;
        Wed, 12 Sep 2018 15:41:53 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-55.bos.redhat.com [10.18.17.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 969D52166BA2;
        Wed, 12 Sep 2018 15:41:52 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] fs/dcache: Fix incorrect nr_dentry_unused
 accounting in shrink_dcache_sb()
To:     Dave Chinner <david@fromorbit.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jan Kara <jack@suse.cz>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Larry Woodman <lwoodman@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Wangkai (Kevin C)" <wangkai86@huawei.com>,
        Michal Hocko <mhocko@kernel.org>
References: <1536693506-11949-1-git-send-email-longman@redhat.com>
 <1536693506-11949-2-git-send-email-longman@redhat.com>
 <20180911220224.GE5631@dastard>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <538489aa-d021-5662-7a46-d358f8770054@redhat.com>
Date:   Wed, 12 Sep 2018 11:41:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180911220224.GE5631@dastard>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 12 Sep 2018 15:41:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 12 Sep 2018 15:41:53 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/11/2018 06:02 PM, Dave Chinner wrote:
> On Tue, Sep 11, 2018 at 03:18:23PM -0400, Waiman Long wrote:
>> The nr_dentry_unused per-cpu counter tracks dentries in both the
>> LRU lists and the shrink lists where the DCACHE_LRU_LIST bit is set.
>> The shrink_dcache_sb() function moves dentries from the LRU list to a
>> shrink list and subtracts the dentry count from nr_dentry_unused. This
>> is incorrect as the nr_dentry_unused count Will also be decremented in
>> shrink_dentry_list() via d_shrink_del(). To fix this double decrement,
>> the decrement in the shrink_dcache_sb() function is taken out.
>>
>> Fixes: 4e717f5c1083 ("list_lru: remove special case function list_lru_dispose_all."
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
> Please add a stable tag for this.
>
> Otherwise looks fine.
>
> Reviewed-by: Dave Chinner <dchinner@redhat.com>
>
I will add the cc:stable tag.

Cheers,
Longman

