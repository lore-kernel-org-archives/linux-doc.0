Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A118A7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 May 2018 21:54:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934408AbeE1Vxo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 May 2018 17:53:44 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:53521 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934404AbeE1Vxn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 May 2018 17:53:43 -0400
Received: by mail-wm0-f66.google.com with SMTP id a67-v6so35066479wmf.3
        for <linux-doc@vger.kernel.org>; Mon, 28 May 2018 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=NIwhl9n8JOzFDRVAll2yqcKjNOYZ+lYfi7rPYDJE9N8=;
        b=IpVMJ2SOwLT4WQg79VmiZ7MsjM/79UneOPxDaiB1glDCM5mzQcYSG17nZ7K2QF2ZTK
         cAWMhGkSaPJ55f8nkTDtawLWYbCu3hr0rd3mkrqKp03Rb+H9qW2rhKORisZV8mOr/XBE
         81vuZ5cCX8UmbaYj3tWiOOyKT2W60yIHw9YgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=NIwhl9n8JOzFDRVAll2yqcKjNOYZ+lYfi7rPYDJE9N8=;
        b=cURpMPYK13HdUTuzBtwaqKcNCfb0gIskuieNZIqA/aPiMCGT2gv8hRXYWl5nXihDZu
         4NjLmBdb5F4ViQfHluXetl7Xkr3kcZLDUvLU4cQdC5nqJ0wx/qL3+N4SjrUQwZ1bEHrT
         dKm4qqKwTays3YEISXrNxPBXREXl0T6clhjRj3LbVMQQKMPwnNBex7fjtG7KmgjbvDZe
         BcNitVj8x1dGPnS8CmKsRacrF+Ni4i5HXSl3IY8TM3ZbpWz1r301edN9Y6fCct0EdWpN
         ooMYugY9kz7G83rnQBGAJechDWnkPodap5K+ASbJk70Iyu9UcYeboZeOHFo4niJj0ARN
         vDxw==
X-Gm-Message-State: ALKqPwf996YIbBEhngodhUduq8W/7pdSmOux52z+F0lwSNIqYFlBnpq4
        KGhjtH7QLHIQWV3xvZn2VLKHunnu08m6dfuRkzvLUg==
X-Google-Smtp-Source: AB8JxZrnHhPOOF87OG8OYP2SJtOLPEMH5fPA0of+S5O/xbSfvZpXPt5km4jQtRwsqXTFrTxgnsDsrG/9R/l/9Z/QxSk=
X-Received: by 2002:a50:a245:: with SMTP id 63-v6mr16596729edl.295.1527544422584;
 Mon, 28 May 2018 14:53:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:a4a1:0:0:0:0:0 with HTTP; Mon, 28 May 2018 14:53:42
 -0700 (PDT)
In-Reply-To: <20180528200326.GJ25467@kernel.org>
References: <1527497103-3593-1-git-send-email-leo.yan@linaro.org> <20180528200326.GJ25467@kernel.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 28 May 2018 15:53:42 -0600
Message-ID: <CANLsYkzn5qyzjxMiCPQ1GxyNjhHJp-2H6Lds11HP9rG5xug0FA@mail.gmail.com>
Subject: Re: [RFT v3 0/4] Perf script: Add python script for CoreSight trace disassembler
To:     Arnaldo Carvalho de Melo <acme@kernel.org>
Cc:     Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
        Robert Walker <Robert.Walker@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Kim Phillips <kim.phillips@arm.co>,
        Tor Jeremiassen <tor@ti.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        coresight@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28 May 2018 at 14:03, Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> Em Mon, May 28, 2018 at 04:44:59PM +0800, Leo Yan escreveu:
>> This patch series is to support for using 'perf script' for CoreSight
>> trace disassembler, for this purpose this patch series adds a new
>> python script to parse CoreSight tracing event and use command 'objdump'
>> for disassembled lines, finally this can generate readable program
>> execution flow for reviewing tracing data.
>>
>> Patch 0001 is one fixing patch to generate samples for the start packet
>> and exception packets.
>>
>> Patch 0002 is the prerequisite to add addr into sample dict, so this
>> value can be used by python script to analyze instruction range.
>>
>> Patch 0003 is to add python script for trace disassembler.
>>
>> Patch 0004 is to add doc to explain python script usage and give
>> example for it.
>>
>> This patch series has been rebased on acme git tree [1] with the commit
>> 19422a9f2a3b ("perf tools: Fix kernel_start for PTI on x86") and tested
>> on Hikey (ARM64 octa CA53 cores).
>
> Thanks, applied to perf/core.

Please hold off on that Arnaldo - I'm currently reviewing the set and
I think some things can be improved.

Thanks,
Mathieu

>
> - Arnaldo
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
