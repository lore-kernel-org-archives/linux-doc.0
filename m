Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BF24F7DD31
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Mar 2018 18:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752322AbeC2SrV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 14:47:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37874 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751750AbeC2SrT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Mar 2018 14:47:19 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D9BEE402314E;
        Thu, 29 Mar 2018 18:47:18 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5183D84455;
        Thu, 29 Mar 2018 18:47:18 +0000 (UTC)
Subject: Re: [PATCH v5 1/9] sysctl: Add flags to support min/max range
 clamping
To:     "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>
References: <1521224030-2185-1-git-send-email-longman@redhat.com>
 <1521224030-2185-2-git-send-email-longman@redhat.com>
 <20180317011021.GB4449@wotan.suse.de>
 <35f54e8f-b80e-aa3b-b008-79ba7ca3bff2@redhat.com>
 <20180329181515.GL30543@wotan.suse.de>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <3e2b8e6a-f6d1-f80a-ed43-e937d8ca8383@redhat.com>
Date:   Thu, 29 Mar 2018 14:47:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180329181515.GL30543@wotan.suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Thu, 29 Mar 2018 18:47:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Thu, 29 Mar 2018 18:47:18 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/29/2018 02:15 PM, Luis R. Rodriguez wrote:
> On Mon, Mar 19, 2018 at 11:39:19AM -0400, Waiman Long wrote:
>> On 03/16/2018 09:10 PM, Luis R. Rodriguez wrote:
>>> On Fri, Mar 16, 2018 at 02:13:42PM -0400, Waiman Long wrote:
>>>> When the CTL_FLAGS_CLAMP_RANGE flag is set in the ctl_table
>>>> entry, any update from the userspace will be clamped to the given
>>>> range without error if either the proc_dointvec_minmax() or the
>>>> proc_douintvec_minmax() handlers is used.
>>> I don't get it.  Why define a generic range flag when we can be mores specific and
>>> you do that in your next patch. What's the point of this flag then?
>>>
>>>   Luis
>> I was thinking about using the signed/unsigned bits as just annotations
>> for ranges for future extension. For the purpose of this patchset alone,
>> I can merge the three bits into just two.
> Only introduce flags which you will actually use in the same patch series.
>
>   Luis

Yes, will do. Since the merge window is coming, should I wait until it
is over to send out the new patch?

Cheers,
Longman

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
