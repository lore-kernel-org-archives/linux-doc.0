Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3282E7E279
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 01:15:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750943AbeDYBPy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 21:15:54 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:50214 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750841AbeDYBPx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Apr 2018 21:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1524618954; x=1556154954;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Npck2Xbh+MBHftiiOzhVrS7NL+Nb7pkS0RUTx12HP3c=;
  b=LcSST3tlktmCP0M8Z54/h2PLH0A6SCKsNaZkT3JaklOO7al25BDAEZHO
   k+whYlWxbZkw4eQo374w7jFWS/V7+vQ/+7kfz/rB4MtRWnmO3X+TJkeGX
   7hetkEuTT8/L2zErRgGFeERczIjoa5wJlr2nmPgcwZKE5yJW4rhrjceNM
   g/Jy56wno6MxXHHpjeSkPnOqTPgK0ug0Su8RnNbAqIlcmlOm0iSqt7Q2Z
   u8gsanOmtRWRjZU4KCUf1Hdbp8R51mE7hikxUjZKPri0rI9QkUMYJQ30P
   zQqmqYaALR7QRLn7BPvGmQq4l56N2WPOVw27Mx52m0Br037jp0aKrRPHn
   g==;
X-IronPort-AV: E=Sophos;i="5.49,325,1520870400"; 
   d="scan'208";a="77343105"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2018 09:15:51 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP; 24 Apr 2018 18:08:02 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.65.51]) ([10.111.65.51])
  by uls-op-cesaip02.wdc.com with ESMTP; 24 Apr 2018 18:15:51 -0700
Subject: Re: [PATCH v5 0/2] perf: riscv: Preliminary Perf Event Support on
 RISC-V
To:     Palmer Dabbelt <palmer@sifive.com>
Cc:     "alankao@andestech.com" <alankao@andestech.com>,
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
From:   Atish Patra <atish.patra@wdc.com>
Message-ID: <6b211b64-5c17-2884-5b6a-6ff1d3287b16@wdc.com>
Date:   Tue, 24 Apr 2018 18:15:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <mhng-0abe4f84-0dd3-437c-8cf2-b87def246796@palmer-si-x1c4>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/24/18 5:29 PM, Palmer Dabbelt wrote:
> On Tue, 24 Apr 2018 15:16:16 PDT (-0700), atish.patra@wdc.com wrote:
>> On 4/24/18 12:44 PM, Palmer Dabbelt wrote:
>>> On Tue, 24 Apr 2018 12:27:26 PDT (-0700), atish.patra@wdc.com wrote:
>>>> On 4/24/18 11:07 AM, Atish Patra wrote:
>>>>> On 4/19/18 4:28 PM, Alan Kao wrote:
>>>>> However, I got an rcu-stall for the test "47: Event times".
>>>>> # ./perf test -v 47
>>>> Got it working. The test tries to attach the event to CPU0 which doesn't
>>>> exist in HighFive Unleashed. Changing it to cpu1 works.
>>>>
>>>> diff --git a/tools/perf/tests/event-times.c b/tools/perf/tests/event-times.c
>>>> index 1a2686f..eb11632f 100644
>>>> --- a/tools/perf/tests/event-times.c
>>>> +++ b/tools/perf/tests/event-times.c
>>>> @@ -113,9 +113,9 @@ static int attach__cpu_disabled(struct perf_evlist
>>>> *evlist)
>>>>            struct cpu_map *cpus;
>>>>            int err;
>>>>
>>>> -       pr_debug("attaching to CPU 0 as enabled\n");
>>>> +       pr_debug("attaching to CPU 1 as disabled\n");
>>>>
>>>> -       cpus = cpu_map__new("0");
>>>> +       cpus = cpu_map__new("1");
>>>>            if (cpus == NULL) {
>>>>                    pr_debug("failed to call cpu_map__new\n");
>>>>                    return -1;
>>>> @@ -142,9 +142,9 @@ static int attach__cpu_enabled(struct perf_evlist
>>>> *evlist)
>>>>            struct cpu_map *cpus;
>>>>            int err;
>>>>
>>>> -       pr_debug("attaching to CPU 0 as enabled\n");
>>>> +       pr_debug("attaching to CPU 1 as enabled\n");
>>>>
>>>> -       cpus = cpu_map__new("0");
>>>> +       cpus = cpu_map__new("1");
>>>>            if (cpus == NULL) {
>>>>                    pr_debug("failed to call cpu_map__new\n");
>>>>                    return -1;
>>>>
>>>>
>>>> Palmer,
>>>> Would it be better to officially document it somewhere that CPU0 doesn't
>>>> exist in the HighFive Unleashed board ?
>>>> I fear that there will be other standard tests/code path that may fail
>>>> because of inherent assumption of cpu0 presence.
>>>
>>> I think the best way to fix this is to just have BBL (or whatever the
>>> bootloader is) renumber the CPUs so they're contiguous and begin with 0.
>>
>> Do you mean BBL will update the device tree that kernel eventually parse
>> and set the hart id?
>> Sounds good to me unless it acts as a big hack in future boot loaders.
> 
> Right now the machine-mode and supervisor-mode hart IDs are logically separate:
> the bootloader just provides the hart ID as a register argument when starting
> the kernel.

Yes.

   BBL already needs to enumerate the harts by looking through the
> device tree for various other reasons (at least to mask off the harts that
> Linux doesn't support), so it's not that much effort to just maintain a mapping
> from supervisor-mode hart IDs to machine-mode hart IDs.
> 

But Linux also parses the device tree to get hart ID in 
riscv_of_processor_hart(). This is used to setup the possible/present 
cpu map in setup_smp().

Thus, Linux also need to see a device tree with cpu0-3 instead of 
cpu1-4. Otherwise, present cpu map will be incorrect. Isn't it ?

> I have some patches floating around that do this, but appear to do it
> incorrectly enough that nothing boots so maybe I'm missing something that makes
> this complicated :).
> 

Just a wild guess: May be the because of the above reason ;)

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
