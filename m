Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EBFF97E6B0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 16:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755302AbeDYQQ7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 12:16:59 -0400
Received: from mail-pg0-f66.google.com ([74.125.83.66]:41032 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755455AbeDYQQz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 12:16:55 -0400
Received: by mail-pg0-f66.google.com with SMTP id m21so10674327pgv.8
        for <linux-doc@vger.kernel.org>; Wed, 25 Apr 2018 09:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=1w5Teq/vjzT7fHcpVLDI+L0Mu97HocoXlu/tuxJOw1Q=;
        b=gVDIf5EScrEt3WsG7RhfVnRRrn9rE4l+3xwFzYjeOdKhRrx8lV93lLXdizdYfzFe/F
         tKBbnu/P1cmLuGz5nbMCxt2jbKRuADWxKye19cQoachBn0S+6jv4uTWpAxOVag3atorN
         SKSnzhu3Iy0mbeOUw2jEw4WPBCt9sM+n85/8dVmGe1YqZYr1jxEl3mVrlBnN3GjKZX+i
         apxntBVZ61hRLLhBXoBfIGkg8aHkiFUPBP+0njEwoOSLlhCbQzea2Yw+k0AFjO/U0ylF
         3mBMdlZm4l5Dgo7is6XHqBrzNbBU9dGM5aNCYQIWVHrlPSGsw++FvfyVPZp67n7+/y7V
         SbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=1w5Teq/vjzT7fHcpVLDI+L0Mu97HocoXlu/tuxJOw1Q=;
        b=td7+LtKurQkYkIxRKiB5ZT5Zgq4m9sqYm7nw1MFwmx0QcT2eGwytE7f+/12lOODk7N
         mMPIO8KmIdajMALnJsWRuQuYmULWrB8Ucs5acCOq7sol6ywrftxTCHa3iZE5vbwl7leC
         uigzv3qWgcW4N1nqyF10FeYfip+LklmJ13tfn9hCROpddOKedP+XYrAriBYqF9Pi9Z60
         HAYjp3I9ax1cMjDC/kEPbILFGHtex5F2+gY4ohmHlBiba7YLtOy2kwvitYhKbLuGwQAz
         O5csFlOUAKbTIa+5BhL9o5kwfN/NujbMyvDk58WlP+pDlVZdDXkz7UObu0aH0VeqNIUF
         F64w==
X-Gm-Message-State: ALQs6tAZZ19wOr9eNcGPqSPsX4zqaROMrEOkT+dZ8sqsBo1NUiLmhOe5
        Ql3ALQZrCy0XSCQyu59V6YNmOOwumwU=
X-Google-Smtp-Source: AIpwx485FlASoA7/nufOM1NiKKjTbaa1j2rflfMAYLuHuqZF6kClXjKWH0/qQ1xse1X47n2k0ynNJA==
X-Received: by 10.98.35.11 with SMTP id j11mr19066994pfj.177.1524673014917;
        Wed, 25 Apr 2018 09:16:54 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id 142sm21234156pgg.86.2018.04.25.09.16.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Apr 2018 09:16:53 -0700 (PDT)
Date:   Wed, 25 Apr 2018 09:16:53 -0700 (PDT)
X-Google-Original-Date: Wed, 25 Apr 2018 09:16:24 PDT (-0700)
Subject:     Re: [PATCH v5 0/2] perf: riscv: Preliminary Perf Event Support on RISC-V
In-Reply-To: <6b211b64-5c17-2884-5b6a-6ff1d3287b16@wdc.com>
CC:     alankao@andestech.com, albert@sifive.com, peterz@infradead.org,
        mingo@redhat.com, acme@kernel.org,
        alexander.shishkin@linux.intel.com, jolsa@redhat.com,
        namhyung@kernel.org, sols@sifive.com, corbet@lwn.net,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, greentime@andestech.com,
        nickhu@andestech.com
From:   Palmer Dabbelt <palmer@sifive.com>
To:     atish.patra@wdc.com
Message-ID: <mhng-5838a43e-57e4-4f4d-b51b-aa05c4d8cce5@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 24 Apr 2018 18:15:49 PDT (-0700), atish.patra@wdc.com wrote:
> On 4/24/18 5:29 PM, Palmer Dabbelt wrote:
>> On Tue, 24 Apr 2018 15:16:16 PDT (-0700), atish.patra@wdc.com wrote:
>>> On 4/24/18 12:44 PM, Palmer Dabbelt wrote:
>>>> On Tue, 24 Apr 2018 12:27:26 PDT (-0700), atish.patra@wdc.com wrote:
>>>>> On 4/24/18 11:07 AM, Atish Patra wrote:
>>>>>> On 4/19/18 4:28 PM, Alan Kao wrote:
>>>>>> However, I got an rcu-stall for the test "47: Event times".
>>>>>> # ./perf test -v 47
>>>>> Got it working. The test tries to attach the event to CPU0 which doesn't
>>>>> exist in HighFive Unleashed. Changing it to cpu1 works.
>>>>>
>>>>> diff --git a/tools/perf/tests/event-times.c b/tools/perf/tests/event-times.c
>>>>> index 1a2686f..eb11632f 100644
>>>>> --- a/tools/perf/tests/event-times.c
>>>>> +++ b/tools/perf/tests/event-times.c
>>>>> @@ -113,9 +113,9 @@ static int attach__cpu_disabled(struct perf_evlist
>>>>> *evlist)
>>>>>            struct cpu_map *cpus;
>>>>>            int err;
>>>>>
>>>>> -       pr_debug("attaching to CPU 0 as enabled\n");
>>>>> +       pr_debug("attaching to CPU 1 as disabled\n");
>>>>>
>>>>> -       cpus = cpu_map__new("0");
>>>>> +       cpus = cpu_map__new("1");
>>>>>            if (cpus == NULL) {
>>>>>                    pr_debug("failed to call cpu_map__new\n");
>>>>>                    return -1;
>>>>> @@ -142,9 +142,9 @@ static int attach__cpu_enabled(struct perf_evlist
>>>>> *evlist)
>>>>>            struct cpu_map *cpus;
>>>>>            int err;
>>>>>
>>>>> -       pr_debug("attaching to CPU 0 as enabled\n");
>>>>> +       pr_debug("attaching to CPU 1 as enabled\n");
>>>>>
>>>>> -       cpus = cpu_map__new("0");
>>>>> +       cpus = cpu_map__new("1");
>>>>>            if (cpus == NULL) {
>>>>>                    pr_debug("failed to call cpu_map__new\n");
>>>>>                    return -1;
>>>>>
>>>>>
>>>>> Palmer,
>>>>> Would it be better to officially document it somewhere that CPU0 doesn't
>>>>> exist in the HighFive Unleashed board ?
>>>>> I fear that there will be other standard tests/code path that may fail
>>>>> because of inherent assumption of cpu0 presence.
>>>>
>>>> I think the best way to fix this is to just have BBL (or whatever the
>>>> bootloader is) renumber the CPUs so they're contiguous and begin with 0.
>>>
>>> Do you mean BBL will update the device tree that kernel eventually parse
>>> and set the hart id?
>>> Sounds good to me unless it acts as a big hack in future boot loaders.
>>
>> Right now the machine-mode and supervisor-mode hart IDs are logically separate:
>> the bootloader just provides the hart ID as a register argument when starting
>> the kernel.
>
> Yes.
>
>    BBL already needs to enumerate the harts by looking through the
>> device tree for various other reasons (at least to mask off the harts that
>> Linux doesn't support), so it's not that much effort to just maintain a mapping
>> from supervisor-mode hart IDs to machine-mode hart IDs.
>>
>
> But Linux also parses the device tree to get hart ID in
> riscv_of_processor_hart(). This is used to setup the possible/present
> cpu map in setup_smp().
>
> Thus, Linux also need to see a device tree with cpu0-3 instead of
> cpu1-4. Otherwise, present cpu map will be incorrect. Isn't it ?
>
>> I have some patches floating around that do this, but appear to do it
>> incorrectly enough that nothing boots so maybe I'm missing something that makes
>> this complicated :).
>>
>
> Just a wild guess: May be the because of the above reason ;)

I was already changing all the IDs in the device tree, so that wasn't it.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
