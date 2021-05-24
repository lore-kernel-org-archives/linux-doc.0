Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9C1C04FF3
	for <linux-doc@archiver.kernel.org>; Mon, 24 May 2021 13:42:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E11461090
	for <linux-doc@archiver.kernel.org>; Mon, 24 May 2021 13:42:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232830AbhEXNny (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 May 2021 09:43:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54510 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232409AbhEXNnx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 May 2021 09:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621863745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LdCvQOrGWjsKZxZwOOVoEv2iDDtEdHzVz0K+vqaSd8c=;
        b=ZDTGwMAQphM3m1wVYMSGaw2VtO8YxhD+IkizzXLQvNCz3y4yhhGSwXaMig3u34caa9VEVW
        UmtRC2X8k79EqxVjOXCaTDrHq5/NB6Cpahh58ul5Dun83LFciDgVb7L9rJy8fH0wfgCQRp
        oHsGnQObhU4Si1FTNyWbiyhY0OxfzRk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-E8x-qgxkN3mSKLaYwU6Ubw-1; Mon, 24 May 2021 09:42:23 -0400
X-MC-Unique: E8x-qgxkN3mSKLaYwU6Ubw-1
Received: by mail-qv1-f69.google.com with SMTP id e2-20020ad442a20000b02901f3586a14easo20125172qvr.12
        for <linux-doc@vger.kernel.org>; Mon, 24 May 2021 06:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LdCvQOrGWjsKZxZwOOVoEv2iDDtEdHzVz0K+vqaSd8c=;
        b=mD8/erlrb9anbu6PeOBSLTwneC6hIi70pq8ecJ/p2Vd0uYGmdz5zu5YiVwlilmKD88
         qe0dwJTF6Uh5SpvytayyjXmUvWhhRksNDCebuozySr9dHpDzb8mQUno7NaxJV3K4PShO
         qroUDm0LQWqEElGvs/OF9Srjcq+yBKmUC2ZiJWwcYi9E/owwzTDmu+AiDiOx0xDuTEBS
         pvR7Y2YITHGSanyjTo9UmPiLWOWworwV8Hwi/jfu5PydPi8/PAMSFCREQ0bVdOCdN9ry
         wMbmqeVdYx7OOhZmR0DGN6KqH0ywW37Z8vaHu5y/HDGeOyqf8JSXzuQ0B5d/0C2dnap7
         4VKw==
X-Gm-Message-State: AOAM53257FLA6AwN2Nr66SJP4o7278IVZZ77CzFHUevk9ffqMoq0cCUu
        4rUTtUt2FawNf93pzIgrk2rsw8v9LV2PeKFgFchefZCoqIAewLGUtWZ6CaK7vYiRVvx/A3XhFLP
        GMkXlZ/uy0bSqEvSG+8kuhbQBvJeWMKZ4rQIwHN7SlDCxU/hW0gWlIUxxM9voK7MpFlh+
X-Received: by 2002:ac8:41cc:: with SMTP id o12mr26663214qtm.225.1621863742643;
        Mon, 24 May 2021 06:42:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN2E6OyuJT27NGON0ll9bXuQZKU5qzeFUWBdBB/qU4w1rut3dBJP1eWoBaCwE7Gm43LKEigw==
X-Received: by 2002:ac8:41cc:: with SMTP id o12mr26663182qtm.225.1621863742394;
        Mon, 24 May 2021 06:42:22 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id c185sm10971448qkg.96.2021.05.24.06.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 06:42:21 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] docs: lockdep-design: correct the notation for writer
To:     Boqun Feng <boqun.feng@gmail.com>,
        Xiongwei Song <sxwjean@gmail.com>
Cc:     Waiman Long <llong@redhat.com>, Xiongwei Song <sxwjean@me.com>,
        peterz@infradead.org, mingo@redhat.com, will@kernel.org,
        corbet@lwn.net,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org
References: <1621578594-13237-1-git-send-email-sxwjean@me.com>
 <e0c0302f-e63f-7eba-872b-85e21b0b1622@redhat.com>
 <CAEVVKH9nwPmQo8L-eRsWST+gPaJ73MSHZfJ-mM8qWvPaiejdrA@mail.gmail.com>
 <YKuAvt3WXBVASuhY@boqun-archlinux>
Message-ID: <ab3c5c38-1447-99e1-ee22-9e5af906d8b4@redhat.com>
Date:   Mon, 24 May 2021 09:42:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YKuAvt3WXBVASuhY@boqun-archlinux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/24/21 6:32 AM, Boqun Feng wrote:
> On Mon, May 24, 2021 at 12:24:00PM +0800, Xiongwei Song wrote:
>> On Fri, May 21, 2021 at 11:17 PM Waiman Long <llong@redhat.com> wrote:
>>> On 5/21/21 2:29 AM, Xiongwei Song wrote:
>>>> From: Xiongwei Song <sxwjean@gmail.com>
>>>>
>>>> The block condition matrix is using 'E' as the writer noation here, so it
>>>> would be better to use 'E' as the reminder rather than 'W'.
>>>>
>>>> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
>>>> ---
>>>>    Documentation/locking/lockdep-design.rst | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/locking/lockdep-design.rst b/Documentation/locking/lockdep-design.rst
>>>> index 9f3cfca..c3b923a 100644
>>>> --- a/Documentation/locking/lockdep-design.rst
>>>> +++ b/Documentation/locking/lockdep-design.rst
>>>> @@ -462,7 +462,7 @@ Block condition matrix, Y means the row blocks the column, and N means otherwise
>>>>        | R | Y | Y | N |
>>>>        +---+---+---+---+
>>>>
>>>> -     (W: writers, r: non-recursive readers, R: recursive readers)
>>>> +     (E: writers, r: non-recursive readers, R: recursive readers)
>>>>
>>>>
>>>>    acquired recursively. Unlike non-recursive read locks, recursive read locks
>>> I would say it should be the other way around. Both W and E refer to the
>>> same type of lockers. W emphasizes writer aspect of it and E for
>>> exclusive. I think we should change the block condition matrix to use W
>>> instead of E.
>> The doc uses 'E'  to describe dependency egdes too. Should we change them
>> to 'W'? Personally,  both 'W' and 'E' are fine.
>>
> I also think Waiman's suggestion is solid, there are two ways to
> classify locks:
>
> 1.	W (Writers), R (Recursive Readers), r (Non-recursive Readers)
>
> 2.	E (Exclusive locks), S (Shared locks), R (Recursive Readers),
> 	N (Non-recursive locks)
>
> And the relations between them are as follow:
>
> 	E = W
> 	R = R
> 	N = W \/ r
> 	S = R \/ r
>
> , where "\/" is the set union.
>
> The story is that I used the way #1 at first, and later on realized way
> #2 is better for BFS implementation, also for reasoning, so here came
> this leftover..
>
My suggestion was based on the fact that it is harder to associate E 
with writer. So from a readability perspective, it is better to change 
the block condition matrix to use 'W' to make it more readable.

Cheers,
Longman

