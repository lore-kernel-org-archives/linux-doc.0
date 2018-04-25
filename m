Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EAA3E7DD31
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 00:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751155AbeDYA3x (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 20:29:53 -0400
Received: from mail-pf0-f195.google.com ([209.85.192.195]:37872 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750791AbeDYA3w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Apr 2018 20:29:52 -0400
Received: by mail-pf0-f195.google.com with SMTP id p6so13639085pfn.4
        for <linux-doc@vger.kernel.org>; Tue, 24 Apr 2018 17:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=j2R1S7NSZbrdkd4DcpITH3YRaZ2bcH2ceL7yKmRJchc=;
        b=QwqdYY7Pk2zAqJL91RWbx9lVwrfSaccMSxwthGCU/jLpINsulAFh2XCIYk0HfyrfkQ
         1ZmShnJ3Sdk/liP5oEeuzM5yosxMktWagAAivV//93Jp0PRiXEjNYq0pPk68vpwtJl5q
         wTsQg3cGWy6eFe5g+/zSpM9dVVg+qlIvSvJlPCjMuiArBJTGMuwCnbKrqy6yD2xydMWf
         XzHYn42w80QM1qnV3QC7mDIA8CvFCB8rKCpR2HSRO22CAU7jWCadCuIkrqhZesgflbZO
         VjZ6lmR8dkX1H8vvksnAUjd0zNpzxZPm8+IC7FwMSbbEGP2DIK1GxaQS1vnntm3Rk0j1
         dKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=j2R1S7NSZbrdkd4DcpITH3YRaZ2bcH2ceL7yKmRJchc=;
        b=n/w4mELtdpRZ2J89fR5R1sFP2W33ruxfH7HkyhcupLBloQnCr+XtPB/OBpCZJBBVSn
         9YMOjDzF/n0Nla6Go9r/Fj016uX7TKSO1wJ2RkJbViEUUYKcZ9HizDMADpj5q47P15rF
         f3ZSXWCPPKHYRjfGJvlv0eH2ftksHTmPLFXMls4KlOiaHvuNg49T5+mWCyTKlnRQ/ms1
         h+JJI/PuKl5k1XRpWwcit1mL8MMX6gSGJdmxrFpJZYF+yLnfW2iuZ6HPsitVNopbEtXp
         fIod5VqU8zS3wY+JGwpKp3f0MqO59jFIl6C5V2LjMh+cMXlHqNjKcPCNs5SK0cMLyRs1
         +L7A==
X-Gm-Message-State: ALQs6tDw2sdwT0Dg7NbcYdI2F6BdXlvmXXd2aJp3ObmIkVjo8CsXSAef
        Rx4/eoTx58mKo/p+p+rDs+f1LQ==
X-Google-Smtp-Source: AIpwx4/B0cOrrmIzhPup8vByDTfWHiFiXbHdvhHHfomGqKCvnYhqXPywcftnY3k7fYcfdHzhbDR0ow==
X-Received: by 2002:a17:902:591e:: with SMTP id o30-v6mr26535336pli.309.1524616191785;
        Tue, 24 Apr 2018 17:29:51 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id r84sm2554268pfa.125.2018.04.24.17.29.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Apr 2018 17:29:51 -0700 (PDT)
Date:   Tue, 24 Apr 2018 17:29:51 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Apr 2018 17:22:50 PDT (-0700)
Subject:     Re: [PATCH v5 0/2] perf: riscv: Preliminary Perf Event Support on RISC-V
In-Reply-To: <054df682-c002-23ba-075b-a38c9085260c@wdc.com>
CC:     alankao@andestech.com, albert@sifive.com, peterz@infradead.org,
        mingo@redhat.com, acme@kernel.org,
        alexander.shishkin@linux.intel.com, jolsa@redhat.com,
        namhyung@kernel.org, sols@sifive.com, corbet@lwn.net,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, greentime@andestech.com,
        nickhu@andestech.com
From:   Palmer Dabbelt <palmer@sifive.com>
To:     atish.patra@wdc.com
Message-ID: <mhng-0abe4f84-0dd3-437c-8cf2-b87def246796@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 24 Apr 2018 15:16:16 PDT (-0700), atish.patra@wdc.com wrote:
> On 4/24/18 12:44 PM, Palmer Dabbelt wrote:
>> On Tue, 24 Apr 2018 12:27:26 PDT (-0700), atish.patra@wdc.com wrote:
>>> On 4/24/18 11:07 AM, Atish Patra wrote:
>>>> On 4/19/18 4:28 PM, Alan Kao wrote:
>>>> However, I got an rcu-stall for the test "47: Event times".
>>>> # ./perf test -v 47
>>> Got it working. The test tries to attach the event to CPU0 which doesn't
>>> exist in HighFive Unleashed. Changing it to cpu1 works.
>>>
>>> diff --git a/tools/perf/tests/event-times.c b/tools/perf/tests/event-times.c
>>> index 1a2686f..eb11632f 100644
>>> --- a/tools/perf/tests/event-times.c
>>> +++ b/tools/perf/tests/event-times.c
>>> @@ -113,9 +113,9 @@ static int attach__cpu_disabled(struct perf_evlist
>>> *evlist)
>>>           struct cpu_map *cpus;
>>>           int err;
>>>
>>> -       pr_debug("attaching to CPU 0 as enabled\n");
>>> +       pr_debug("attaching to CPU 1 as disabled\n");
>>>
>>> -       cpus = cpu_map__new("0");
>>> +       cpus = cpu_map__new("1");
>>>           if (cpus == NULL) {
>>>                   pr_debug("failed to call cpu_map__new\n");
>>>                   return -1;
>>> @@ -142,9 +142,9 @@ static int attach__cpu_enabled(struct perf_evlist
>>> *evlist)
>>>           struct cpu_map *cpus;
>>>           int err;
>>>
>>> -       pr_debug("attaching to CPU 0 as enabled\n");
>>> +       pr_debug("attaching to CPU 1 as enabled\n");
>>>
>>> -       cpus = cpu_map__new("0");
>>> +       cpus = cpu_map__new("1");
>>>           if (cpus == NULL) {
>>>                   pr_debug("failed to call cpu_map__new\n");
>>>                   return -1;
>>>
>>>
>>> Palmer,
>>> Would it be better to officially document it somewhere that CPU0 doesn't
>>> exist in the HighFive Unleashed board ?
>>> I fear that there will be other standard tests/code path that may fail
>>> because of inherent assumption of cpu0 presence.
>>
>> I think the best way to fix this is to just have BBL (or whatever the
>> bootloader is) renumber the CPUs so they're contiguous and begin with 0.
>
> Do you mean BBL will update the device tree that kernel eventually parse
> and set the hart id?
> Sounds good to me unless it acts as a big hack in future boot loaders.

Right now the machine-mode and supervisor-mode hart IDs are logically separate: 
the bootloader just provides the hart ID as a register argument when starting 
the kernel.  BBL already needs to enumerate the harts by looking through the 
device tree for various other reasons (at least to mask off the harts that 
Linux doesn't support), so it's not that much effort to just maintain a mapping 
from supervisor-mode hart IDs to machine-mode hart IDs.

I have some patches floating around that do this, but appear to do it 
incorrectly enough that nothing boots so maybe I'm missing something that makes 
this complicated :).
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
