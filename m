Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0E89E7E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 08:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751353AbeDYIKB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 04:10:01 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:4096 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750941AbeDYIJ6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 04:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1524643798; x=1556179798;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=X9MhwpPjcORZDmEE8q5t6pxfjVyCpxgHoLNAgkNiFvI=;
  b=h/cC9kCGFPsSVLiTCbvDoALtcbi5qGhRvtbRy89Nt+pTG91NzzlhDqpo
   MDkUvfDaerp19L9Bj9uoTd8PXOXb1RvW0PefEJLRBX8G914ljj4xnnuPk
   i6wEtaov07dVs5oas+70jMNUDgj9GVatr8plVz4G0pMv0LxHrythPsYdG
   F6lwo3f/VAgeFh68ONGmJifbUJQUQQBEOH6/aAX9MQqgLJq660PigGBEz
   oj1AWrmzHhc8bk8PEGrq+kc2FZGx9aOSXK7Rea3Nu8hVNPqy/5xhI6uRD
   OIvzMlqaZBfL707cWWLokczSHjvLqjsUd4WXqJ8aVX5vL9DWFZmt2rTBt
   g==;
X-IronPort-AV: E=Sophos;i="5.49,325,1520870400"; 
   d="scan'208";a="179764231"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2018 16:09:58 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP; 25 Apr 2018 01:02:10 -0700
Received: from 6kx8cg2.ad.shared (HELO [10.86.56.234]) ([10.86.56.234])
  by uls-op-cesaip01.wdc.com with ESMTP; 25 Apr 2018 01:09:57 -0700
Subject: Re: [PATCH v5 0/2] perf: riscv: Preliminary Perf Event Support on
 RISC-V
To:     Alan Kao <alankao@andestech.com>
Cc:     Palmer Dabbelt <palmer@sifive.com>,
        "albert@sifive.com" <albert@sifive.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "acme@kernel.org" <acme@kernel.org>,
        "alexander.shishkin@linux.intel.com" 
        <alexander.shishkin@linux.intel.com>,
        "jolsa@redhat.com" <jolsa@redhat.com>,
        "namhyung@kernel.org" <namhyung@kernel.org>,
        "sols@sifive.com" <sols@sifive.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "greentime@andestech.com" <greentime@andestech.com>,
        "nickhu@andestech.com" <nickhu@andestech.com>
References: <mhng-0abe4f84-0dd3-437c-8cf2-b87def246796@palmer-si-x1c4>
 <6b211b64-5c17-2884-5b6a-6ff1d3287b16@wdc.com>
 <20180425031936.GA7303@andestech.com>
From:   Atish Patra <atish.patra@wdc.com>
Message-ID: <51b78a28-bd21-678e-f6b4-5418a53ad920@wdc.com>
Date:   Wed, 25 Apr 2018 01:09:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180425031936.GA7303@andestech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/24/18 8:19 PM, Alan Kao wrote:
> Hi Atish, Palmer,
> 
> On Tue, Apr 24, 2018 at 06:15:49PM -0700, Atish Patra wrote:
>> On 4/24/18 5:29 PM, Palmer Dabbelt wrote:
>>> On Tue, 24 Apr 2018 15:16:16 PDT (-0700), atish.patra@wdc.com wrote:
>>>> On 4/24/18 12:44 PM, Palmer Dabbelt wrote:
>>>>> On Tue, 24 Apr 2018 12:27:26 PDT (-0700), atish.patra@wdc.com wrote:
>>>>>> On 4/24/18 11:07 AM, Atish Patra wrote:
>>>>>>> On 4/19/18 4:28 PM, Alan Kao wrote:
>>>>>>> However, I got an rcu-stall for the test "47: Event times".
>>>>>>> # ./perf test -v 47
>>>>>> Got it working. The test tries to attach the event to CPU0 which doesn't
>>>>>> exist in HighFive Unleashed. Changing it to cpu1 works.
>>>>>>
>>>>>> diff --git a/tools/perf/tests/event-times.c b/tools/perf/tests/event-times.c
>>>>>> index 1a2686f..eb11632f 100644
>>>>>> --- a/tools/perf/tests/event-times.c
>>>>>> +++ b/tools/perf/tests/event-times.c
>>>>>> @@ -113,9 +113,9 @@ static int attach__cpu_disabled(struct perf_evlist
>>>>>> *evlist)
>>>>>>            struct cpu_map *cpus;
>>>>>>            int err;
>>>>>>
>>>>>> -       pr_debug("attaching to CPU 0 as enabled\n");
>>>>>> +       pr_debug("attaching to CPU 1 as disabled\n");
>>>>>>
>>>>>> -       cpus = cpu_map__new("0");
>>>>>> +       cpus = cpu_map__new("1");
>>>>>>            if (cpus == NULL) {
>>>>>>                    pr_debug("failed to call cpu_map__new\n");
>>>>>>                    return -1;
>>>>>> @@ -142,9 +142,9 @@ static int attach__cpu_enabled(struct perf_evlist
>>>>>> *evlist)
>>>>>>            struct cpu_map *cpus;
>>>>>>            int err;
>>>>>>
>>>>>> -       pr_debug("attaching to CPU 0 as enabled\n");
>>>>>> +       pr_debug("attaching to CPU 1 as enabled\n");
>>>>>>
>>>>>> -       cpus = cpu_map__new("0");
>>>>>> +       cpus = cpu_map__new("1");
>>>>>>            if (cpus == NULL) {
>>>>>>                    pr_debug("failed to call cpu_map__new\n");
>>>>>>                    return -1;
>>>>>>
>>>>>>
>>>>>> Palmer,
>>>>>> Would it be better to officially document it somewhere that CPU0 doesn't
>>>>>> exist in the HighFive Unleashed board ?
>>>>>> I fear that there will be other standard tests/code path that may fail
>>>>>> because of inherent assumption of cpu0 presence.
>>>>>
>>>>> I think the best way to fix this is to just have BBL (or whatever the
>>>>> bootloader is) renumber the CPUs so they're contiguous and begin with 0.
>>>>
>>>> Do you mean BBL will update the device tree that kernel eventually parse
>>>> and set the hart id?
>>>> Sounds good to me unless it acts as a big hack in future boot loaders.
>>>
>>> Right now the machine-mode and supervisor-mode hart IDs are logically separate:
>>> the bootloader just provides the hart ID as a register argument when starting
>>> the kernel.
>>
>> Yes.
>>
>>    BBL already needs to enumerate the harts by looking through the
>>> device tree for various other reasons (at least to mask off the harts that
>>> Linux doesn't support), so it's not that much effort to just maintain a mapping
>> >from supervisor-mode hart IDs to machine-mode hart IDs.
>>>
>>
>> But Linux also parses the device tree to get hart ID in
>> riscv_of_processor_hart(). This is used to setup the possible/present cpu
>> map in setup_smp().
>>
>> Thus, Linux also need to see a device tree with cpu0-3 instead of cpu1-4.
>> Otherwise, present cpu map will be incorrect. Isn't it ?
>>
>>> I have some patches floating around that do this, but appear to do it
>>> incorrectly enough that nothing boots so maybe I'm missing something that makes
>>> this complicated :).
>>>
>>
>> Just a wild guess: May be the because of the above reason ;)
>>
> 
> Thanks for the test and discussion.  It looks like am implementation issue from
> Unleash, so ... is there anything I should fix and provide a further patch?
> 
Nope. Nothing for this issue.
The fix for this issue should be either in bbl or kernel as a separate 
patch.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
