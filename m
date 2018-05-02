Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD69B7E27C
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 13:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751121AbeEBNYA convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 09:24:00 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39280 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751100AbeEBNYA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 May 2018 09:24:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7A811EC014;
        Wed,  2 May 2018 13:23:59 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AA38D63529;
        Wed,  2 May 2018 13:23:58 +0000 (UTC)
Subject: Re: [PATCH v6 0/8] ipc: Clamp *mni to the real IPCMNI limit &
 increase that limit
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>
References: <1524862838-8247-1-git-send-email-longman@redhat.com>
 <87po2ex0k6.fsf@xmission.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <5aac35f0-77e3-5693-ddf0-a03695ff1192@redhat.com>
Date:   Wed, 2 May 2018 09:23:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <87po2ex0k6.fsf@xmission.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Wed, 02 May 2018 13:23:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Wed, 02 May 2018 13:23:59 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/01/2018 10:18 PM, Eric W. Biederman wrote:
>
>> The sysctl parameters msgmni, shmmni and semmni have an inherent limit
>> of IPC_MNI (32k). However, users may not be aware of that because they
>> can write a value much higher than that without getting any error or
>> notification. Reading the parameters back will show the newly written
>> values which are not real.
>>
>> Enforcing the limit by failing sysctl parameter write, however, may
>> cause regressions if existing user setup scripts set those parameters
>> above 32k as those scripts will now fail in this case.
> I have a serious problem with this approach.  Have you made any effort
> to identify any code that sets these values above 32k?  Have you looked
> to see if these applications actually care if you return an error when
> a value is set too large?

It is not that an application cares about if an error is returned or
not. Most applications don't care. It is that if an error is returned,
it means that the sysctl parameter isn't change at all instead of being
set to a large value and then internally clamped to a smaller number
which is still bigger than the original value. That is what can break an
application because the sysctl parameters may be just too small for the
application.

> Right now this seems like a lot of work to avoid breaking applications
> and or users that may or may not exist.  If you can find something that
> will care sure.  We need to avoid breaking userspace and causing
> regressions.  However as this stands it looks you are making maintenance
> of the kernel more difficult to avoid having to look to see if there are
> monsters under the bed.

I shall admit that it can be hard to find applications that will
explicitly need that as we usually don't have access to the applications
that the customers have. It is more a correctness issue where the
existing code is kind of lying about what can actually be supported. I
just want to make the users more aware of what the right limits are.

Cheers,
Longman


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
