Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C15D47D099
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Feb 2019 23:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730189AbfB0XsO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Feb 2019 18:48:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35042 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728397AbfB0XsO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 27 Feb 2019 18:48:14 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D73364AD50;
        Wed, 27 Feb 2019 23:48:13 +0000 (UTC)
Received: from prarit.bos.redhat.com (prarit-guest.khw1.lab.eng.bos.redhat.com [10.16.200.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7D2245ED32;
        Wed, 27 Feb 2019 23:48:12 +0000 (UTC)
Subject: Re: [PATCH] x86/fpu: Parse comma separated list passed in clearcpuid
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Andi Kleen <ak@linux.intel.com>,
        x86@kernel.org, linux-doc@vger.kernel.org
References: <20190221131225.22063-1-prarit@redhat.com>
 <20190221134847.GQ32494@hirez.programming.kicks-ass.net>
From:   Prarit Bhargava <prarit@redhat.com>
Message-ID: <388fecd4-9b99-f405-fed4-1f6c3b53bc8b@redhat.com>
Date:   Wed, 27 Feb 2019 18:48:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190221134847.GQ32494@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 27 Feb 2019 23:48:14 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2/21/19 8:48 AM, Peter Zijlstra wrote:
> On Thu, Feb 21, 2019 at 08:12:25AM -0500, Prarit Bhargava wrote:
>> Users cannot disable multiple CPU features with the kernel parameter
>> clearcpuid=.  For example, "clearcpuid=154 clearcpuid=227" only disables
>> CPUID bit 154.
>>
>> Previous to commit 0c2a3913d6f5 ("x86/fpu: Parse clearcpuid= as early XSAVE
>> argument") it was possible to pass multiple clearcpuid options as kernel
>> parameters using individual entries.  With the new code it isn't easy to
>> replicate exactly that behaviour but a comma separated list can be easily
>> implemented, eg) "clearcpuid=154,227"
>>
>> Make the clearcpuid parse a comma-separated list of values instead of only
>> a single value.
> 
> Can we also please kill the value thing entirely and only accept
> strings. Having to reverse engineer the numbers is madness.
> 
> Also, wth would you want to disable XSAVE and EPB ?
> 

It looks like Fenghua has implemented this here:

https://marc.info/?l=linux-kernel&m=154908490105208&w=2

so please drop this patch.

Thanks,

P.
