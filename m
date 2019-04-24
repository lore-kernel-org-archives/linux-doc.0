Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5363C7D8A4
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Apr 2019 16:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732172AbfDXQcr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 24 Apr 2019 12:32:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45580 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731977AbfDXQcr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 24 Apr 2019 12:32:47 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A4CC7309D04D;
        Wed, 24 Apr 2019 16:32:47 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-85.bos.redhat.com [10.18.17.85])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E92365C207;
        Wed, 24 Apr 2019 16:32:46 +0000 (UTC)
Subject: Re: [PATCH] futex: Consolidate duplicated timer setup code
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Davidlohr Bueso <dave@stgolabs.net>
References: <20190424153651.15002-1-longman@redhat.com>
 <20190424160954.GP11158@hirez.programming.kicks-ass.net>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <df0884df-5044-893b-65e2-7ed17c078448@redhat.com>
Date:   Wed, 24 Apr 2019 12:32:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424160954.GP11158@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 24 Apr 2019 16:32:47 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/24/19 12:09 PM, Peter Zijlstra wrote:
> On Wed, Apr 24, 2019 at 11:36:51AM -0400, Waiman Long wrote:
>> +static inline struct hrtimer_sleeper *
>> +futex_setup_timer(ktime_t *time, struct hrtimer_sleeper *timeout,
>> +		  int flags, u64 range_ns)
>> +{
>> +	if (!time)
>> +		return NULL;
>> +
>> +	hrtimer_init_on_stack(&timeout->timer, (flags & FLAGS_CLOCKRT) ?
>> +			      CLOCK_REALTIME : CLOCK_MONOTONIC,
>> +			      HRTIMER_MODE_ABS);
>> +	hrtimer_init_sleeper(timeout, current);
>> +	if (range_ns)
>> +		hrtimer_set_expires_range_ns(&timeout->timer, *time, range_ns);
>> +	else
>> +		hrtimer_set_expires(&timeout->timer, *time);
> That can be an unconditinoal:
>
> 	hrtimer_set_expires_range_ns(&timeout->timer, *time, range_ns);
>
> See how:
>
>   timer->node.expires = ktime_add_safe(time, ns_to_ktime(delta));
>
> is the same as:
>
>   timer->node.expires = time;
>
> when !delta.


That is true. I will update it accordingly.

Thanks,
Longman

