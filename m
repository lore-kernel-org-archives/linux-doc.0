Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 64E067D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 05:38:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751841AbeCUFiy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 01:38:54 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:49725 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751689AbeCUFix (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 01:38:53 -0400
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; 
   d="scan'208";a="38028796"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Mar 2018 13:38:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
        by cn.fujitsu.com (Postfix) with ESMTP id 423094D0EFD1;
        Wed, 21 Mar 2018 13:38:47 +0800 (CST)
Received: from localhost.localdomain (10.167.226.106) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.361.1; Wed, 21 Mar 2018 13:38:46 +0800
Subject: Re: [PATCH 3/5] x86/smpboot: Make the check code more clear in
 prefill_possible_map()
To:     Peter Zijlstra <peterz@infradead.org>
CC:     <linux-kernel@vger.kernel.org>, <x86@kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <tglx@linutronix.de>, <mingo@redhat.com>, <corbet@lwn.net>,
        <rjw@rjwysocki.net>, <lenb@kernel.org>, <hpa@zytor.com>
References: <20180320110432.28127-1-douly.fnst@cn.fujitsu.com>
 <20180320110432.28127-4-douly.fnst@cn.fujitsu.com>
 <20180320123918.GS4043@hirez.programming.kicks-ass.net>
From:   Dou Liyang <douly.fnst@cn.fujitsu.com>
Message-ID: <e9ef4100-0b87-b61a-5ad4-5f78b2d61783@cn.fujitsu.com>
Date:   Wed, 21 Mar 2018 13:38:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180320123918.GS4043@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.167.226.106]
X-yoursite-MailScanner-ID: 423094D0EFD1.A9689
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: douly.fnst@cn.fujitsu.com
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Peter,

At 03/20/2018 08:39 PM, Peter Zijlstra wrote:
> On Tue, Mar 20, 2018 at 07:04:30PM +0800, Dou Liyang wrote:
>> case 1: no  | no  | no | -->  min (setup_possible_cpus, nr_cpu_ids, setup_max_cpus)
>> case 2: no  | no  | yes| -->  min (setup_possible_cpus, nr_cpu_ids)
>> case 3: no  | yes | no | -->  1
>> case 4: no  | yes | yes| -->  1
>> case 5: yes | no  | no | -->  min (num_processors, nr_cpu_ids, setup_max_cpus)
>> case 6: yes | no  | yes| -->  min (num_processors + disabled_cpus, nr_cpu_ids)
>> case 7: yes | yes | no | -->  1
>> case 8: yes | yes | yes| -->  1
> 
> The case number is off by one ;-)
> 

I got it! ;-£©

Thanks
	dou
> 
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
