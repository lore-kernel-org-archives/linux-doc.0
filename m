Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8F0AD7D08E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 16:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbeJBXQd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 19:16:33 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54075 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbeJBXQb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 19:16:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id b19-v6so2916983wme.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 09:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=SHf7GKYXB5qhNZJjsebIev/DMis+sNL18W3mSMKT5p0=;
        b=pTtdEKH7aBIc7YsVoPJt9NiDymLS6wdvRqAEuXXGKn4hY9Nl/o6kl2A/wN7/FNh7Zc
         fhwD2YVORjYRrMqN3FGhpPTq0meCPRrp5tXx8Gii9mGbCj5kv4hwo5vIRr6qE+usmLgo
         GM78Hd4H0VY9lolFt5Tlli8XbjF89n9xuDqST0JVPQE77/NQZwEzN9QOukcCReJ+urQh
         EZ7i1GuB13rwnPJlYOM/wNXOk0830NR3RU/Sxd+VWXABoXQt4b+WPQXuMcap+5RqI85g
         jLGzTEofbXiqlyeTxM9GvssnLq7cjSHTGdR0NwKihTW0/2JFgIGVCVraIEkwO9QrR8KT
         xICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=SHf7GKYXB5qhNZJjsebIev/DMis+sNL18W3mSMKT5p0=;
        b=St6M387hQEgE54GKAy0T/zw4yl62tG+QmVNaqCqBz+WErFnwHlSroDI08njCdverZX
         I3EDWV9TR1H8uSR7LF/IfJXQdXgtNwXEisnFWLVX8NC7HMwIMwvJGEXUXVIfWnbQKXFy
         ougPqtvDpjjgMvHEtt6wXcNM71Ix9sSuN9Me2MVBFcTihBXUjr9NJClhZhDx/qbqT+g8
         Zn4NR/xS+GqHFjPEolxmux4rC1wSK87OnffRcS65HyBvQtJs4SFdbpRjG2gAfMKsAnU6
         36zv79pf5/eDAwhsrRrMInGgwDEvvPRBYQPWIFzHcdELwy2EuxP9b+JHOogL54ZoulrG
         e0/Q==
X-Gm-Message-State: ABuFfohJCljg6bsyu1Cc7XrdgfPfKOZJaoTgkakJ1yq+KNRYzgBK+7ri
        uU9zIPpXbLGNZJEkpIFuJ523WQ==
X-Google-Smtp-Source: ACcGV60SgvAYNTFlPkSVEu9aHIkxY0WLuN5D3dohqCH/iZ/r9AN/1BEfP97yypIIBzCvD2Qjgs8RZA==
X-Received: by 2002:a1c:a696:: with SMTP id p144-v6mr2444528wme.14.1538497936509;
        Tue, 02 Oct 2018 09:32:16 -0700 (PDT)
Received: from localhost.localdomain (p200300D993C77B00B5EB8DB179490446.dip0.t-ipconnect.de. [2003:d9:93c7:7b00:b5eb:8db1:7949:446])
        by smtp.googlemail.com with ESMTPSA id k7-v6sm15661196wmf.41.2018.10.02.09.32.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 09:32:15 -0700 (PDT)
Subject: Re: [PATCH v8 3/5] ipc: Allow boot time extension of IPCMNI from 32k
 to 2M
To:     Waiman Long <longman@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Takashi Iwai <tiwai@suse.de>, Davidlohr Bueso <dbueso@suse.de>
References: <1529317698-16575-1-git-send-email-longman@redhat.com>
 <1529317698-16575-4-git-send-email-longman@redhat.com>
 <20180817164548.GA32382@linux-r8p5>
 <5ddb67bb-872b-c8c1-7838-2622195ae1fc@redhat.com>
From:   Manfred Spraul <manfred@colorfullife.com>
Message-ID: <02ebafee-a295-58cf-044e-e2df0e878e0d@colorfullife.com>
Date:   Tue, 2 Oct 2018 18:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <5ddb67bb-872b-c8c1-7838-2622195ae1fc@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello together,

On 8/18/18 3:15 AM, Waiman Long wrote:
> On 08/17/2018 12:45 PM, Davidlohr Bueso wrote:
>> Cc'ing Manfred.
>>
>> On Mon, 18 Jun 2018, Waiman Long wrote:
>>
>>> The maximum number of unique System V IPC identifiers was limited to
>>> 32k.  That limit should be big enough for most use cases.
>>>
>>> However, there are some users out there requesting for more. To satisfy
>>> the need of those users, a new boot time kernel option "ipcmni_extend"
>>> is added to extend the IPCMNI value to 2M. This is a 64X increase which
>>> hopefully is big enough for them.
>> Could you please provide more info on the need of these users and how
>> you came up with this new value (which just seems quite arbitrary)?
>>
>> Thanks,
>> Davidlohr
> Red Hat has a customer that is migrating from Solaris to Linux. Some of
> their applications just happen to use more than 32k of shared memory
> segments. I think Solaris allows up to 16M unique ID.
>
> Yes, the amount of increase is a bit arbitrary. I was trying to balance
> how many bits should be left for sequence number. Maybe I should just
> take 8 more bits for ID and leave 8 bits for sequence number to match
> Solaris.

- I think we should use the same numbers as Solaris.
Otherwise we later have to touch it again.

- What is the performance when using shmget() with already 10M segments 
present?

- I like the new logic for updating the sequence counter.

Is there a reason why you only enable it for extended mode?

You create a rarely used codepath, and I don't understand what speaks 
against switching to the 'deleted' approach for all systems.


--

     Manfred

