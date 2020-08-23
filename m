Return-Path: <SRS0=ulTn=CB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38E9C433E1
	for <linux-doc@archiver.kernel.org>; Sun, 23 Aug 2020 02:49:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F7BE2072D
	for <linux-doc@archiver.kernel.org>; Sun, 23 Aug 2020 02:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g1O5uaVB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgHWCta (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Aug 2020 22:49:30 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48191 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725906AbgHWCta (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Aug 2020 22:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598150968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TE0Zpj1FO1fCF2Nzd7hXL6TqjYYA4mP9yp1lb4isM3o=;
        b=g1O5uaVBmnlddfSulEj2NbM/2DPLVd1+bxCOWIc2uH8PpDO3dsar2vgb2T1fzdxlxZccFh
        ze7TE+OJxqFwDmYgJt/lJvFhfiwl1YQ5EZ7VSdLNygk4K8HWQj7H5ftMWRNwmRboyf3MaS
        01RERYcoldKxSdWO15xlRdPIzF1TLMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-bJphY9BWNqKZtumUMnw_PA-1; Sat, 22 Aug 2020 22:49:27 -0400
X-MC-Unique: bJphY9BWNqKZtumUMnw_PA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 126901074658;
        Sun, 23 Aug 2020 02:49:25 +0000 (UTC)
Received: from llong.remote.csb (ovpn-112-211.rdu2.redhat.com [10.10.112.211])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CFF076E715;
        Sun, 23 Aug 2020 02:49:19 +0000 (UTC)
Subject: Re: [RFC PATCH 0/8] memcg: Enable fine-grained per process memory
 control
To:     Chris Down <chris@chrisdown.name>, peterz@infradead.org
Cc:     Michal Hocko <mhocko@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
        linux-mm@kvack.org
References: <20200817140831.30260-1-longman@redhat.com>
 <20200818091453.GL2674@hirez.programming.kicks-ass.net>
 <20200818092617.GN28270@dhcp22.suse.cz>
 <20200818095910.GM2674@hirez.programming.kicks-ass.net>
 <20200818101756.GA155582@chrisdown.name>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <989570d6-639e-6385-d638-c4729665c2e4@redhat.com>
Date:   Sat, 22 Aug 2020 22:49:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200818101756.GA155582@chrisdown.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/18/20 6:17 AM, Chris Down wrote:
> peterz@infradead.org writes:
>> But then how can it run-away like Waiman suggested?
>
> Probably because he's not running with that commit at all. We and 
> others use this to prevent runaway allocation on a huge range of 
> production and desktop use cases and it works just fine.
>
>> /me goes look... and finds MEMCG_MAX_HIGH_DELAY_JIFFIES.
>>
>> That's a fail... :-(
>
> I'd ask that you understand a bit more about the tradeoffs and 
> intentions of the patch before rushing in to declare its failure, 
> considering it works just fine :-)
>
> Clamping the maximal time allows the application to take some action 
> to remediate the situation, while still being slowed down 
> significantly. 2 seconds per allocation batch is still absolutely 
> plenty for any use case I've come across. If you have evidence it 
> isn't, then present that instead of vague notions of "wrongness".
>
Sorry for the late reply.

I ran some test on the latest kernel and and it seems to work as 
expected. I was running the test on an older kernel that doesn't have 
this patch and I was not aware of it before hand.

Sorry for the confusion.

Cheers,
Longman

