Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D92DB7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 May 2018 13:41:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754895AbeEANlF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 May 2018 09:41:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35714 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752182AbeEANlE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 May 2018 09:41:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3392D406C753;
        Tue,  1 May 2018 13:41:04 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C560C1C726;
        Tue,  1 May 2018 13:41:03 +0000 (UTC)
Subject: Re: [PATCH v6 3/8] sysctl: Warn when a clamped sysctl parameter is
 set out of range
To:     Kees Cook <keescook@chromium.org>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>
References: <1524862838-8247-1-git-send-email-longman@redhat.com>
 <1524862838-8247-4-git-send-email-longman@redhat.com>
 <CAGXu5jJrkeJTCrajYh3oCnYsfLCtL+LBvRbMn75p4=gxKzBpcQ@mail.gmail.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <9016b939-b92c-e230-df26-f4462f09c2b9@redhat.com>
Date:   Tue, 1 May 2018 09:41:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAGXu5jJrkeJTCrajYh3oCnYsfLCtL+LBvRbMn75p4=gxKzBpcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 01 May 2018 13:41:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 01 May 2018 13:41:04 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/30/2018 06:40 PM, Kees Cook wrote:
> I like this series overall, thanks! No objections from me. One thing I
> noted, though:
>
> On Fri, Apr 27, 2018 at 2:00 PM, Waiman Long <longman@redhat.com> wrote:
>>                 if (param->min && *param->min > val) {
>>                         if (clamp) {
>>                                 val = *param->min;
>> +                               clamped = true;
>>                         } else {
>>                                 return -EINVAL;
>>                         }
> This appears as a common bit of logic in many places in the series. It
> seems like it'd make sense to make this a helper of some kind?
>
> -Kees
>
We can't have an inline helper function because the types are different.
We may be able to use a helper macro, but helper macro like that may be
not well accepted by the kernel community.

Cheers,
Longman

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
