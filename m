Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0E3C4361B
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 12:57:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1CCA23403
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 12:57:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725918AbgLGM5M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Dec 2020 07:57:12 -0500
Received: from mga11.intel.com ([192.55.52.93]:13931 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbgLGM5M (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 Dec 2020 07:57:12 -0500
IronPort-SDR: 6uIFZvBr8T7kMRWXQ0WNfDZBkXFq4XguGpKlTHCW9Ikozt1XV+D7oDaZvyC2xmDQ31vNKOzlme
 o5q2fmXKZZ6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="170183969"
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; 
   d="scan'208";a="170183969"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 04:55:26 -0800
IronPort-SDR: s70YmdCNIipXNxGDGwpZ8QETuIuy78AlYTbT3UUmyK/Scnw+b594bY7I/f8Ox7XS6WPVvgE8hp
 qolkEVVMK63w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; 
   d="scan'208";a="407133557"
Received: from cvg-ubt08.iil.intel.com (HELO [10.185.176.12]) ([10.185.176.12])
  by orsmga001.jf.intel.com with ESMTP; 07 Dec 2020 04:55:19 -0800
Subject: Re: [RFC PATCH] do_exit(): panic() recursion detected
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Joe Perches <joe@perches.com>,
        Rafael Aquini <aquini@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Michel Lespinasse <walken@google.com>,
        Jann Horn <jannh@google.com>, chenqiwu <chenqiwu@xiaomi.com>,
        Minchan Kim <minchan@kernel.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
References: <20201207124050.4016994-1-vladimir.kondratiev@linux.intel.com>
 <20201207125145.GM3040@hirez.programming.kicks-ass.net>
From:   Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>
Message-ID: <8056f890-0297-6fa9-c9a6-c9909e0f24af@linux.intel.com>
Date:   Mon, 7 Dec 2020 14:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201207125145.GM3040@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We do panic on oops as well. We panic on anything that may point to 
system stability issues. I can't proof this code can't be reached 
without oops, so I want to panic here as well.

On 12/7/20 2:51 PM, Peter Zijlstra wrote:
> On Mon, Dec 07, 2020 at 02:40:49PM +0200, Vladimir Kondratiev wrote:
>> From: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
>>
>> Recursive do_exit() is symptom of compromised kernel integrity.
>> For safety critical systems, it may be better to
>> panic() in this case to minimize risk.
> 
> You've not answered the previously posed question on why panic_on_oops
> isn't more suitable for your type of systems.
> 
>> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
>> Change-Id: I42f45900a08c4282c511b05e9e6061360d07db60
> 
> This Change-ID crap doesn't belong in kernel patches.
> 
