Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3D9987DD32
	for <lwn-linux-doc@archive.lwn.net>; Thu,  5 Apr 2018 16:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751363AbeDEQ3K (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 5 Apr 2018 12:29:10 -0400
Received: from mail-pl0-f65.google.com ([209.85.160.65]:34709 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750835AbeDEQ3J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Apr 2018 12:29:09 -0400
Received: by mail-pl0-f65.google.com with SMTP id z5-v6so1698127pln.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Apr 2018 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=fz1p2VUwjm71aAQKi9K5YJAe4hq8l0fICY4KrzEv2Nk=;
        b=V3nZ23mEjIh3Qt+2/mehYvbFyikbd2nblZG7WNN4BqNAjhe/8dbF43Hib1aTmpsuuv
         Z0xKRnbGusrehQDDHvtUKLWbmQ1QgWgfs8IwG08i8frMHPjWl4R59qvxkiYf6fVbmEdf
         mna7hbt5u1D1NQgxhn/u62y6sLAE9vCAU6pTe8/69dwY3TaMZd3uaiuXV9KtpG1BiOwj
         KquUJvVPGAnHCgm6SrOKRaCbWCyX2fMY4kPm4NwE+c2OcXneeZNUgYgc8yr5a3OW1iWs
         J+x9eAA+gfshBmQdumi4Nszhb3BIe9utM1eSCqUxVKTOG2gZpz2q2bKT/AffZy0NCjRX
         2h3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=fz1p2VUwjm71aAQKi9K5YJAe4hq8l0fICY4KrzEv2Nk=;
        b=LHOvT7mtD8zDi/7K740TeUiVsAUuBuq8svVqE6OlX/rG8VwR0MFkKQyGtDeujB3ulY
         JUwHlJPguvH0ljgW8MHE3/s8bNNVGVOh9pcItW3tzLiOf4PwDR9/Fk/tG5Wh6UBS+Zhg
         TZ9FgN+108p4kLo+n7eIJXy5KdgYlyP5xRvsy95vUsbCLIjoGuFMusQXSfbcy/TAQNkl
         lDo9Zqrko0MlfyW2iEoScSh64sYHljCbkPc+CJDmEKBbQhklWnPJqz7/BWU8aGTh+0JH
         Kc9IGqbOuEbSZWRw0E8t475YC6vx1yVKwhWzZLvkLU+JxACRMAWEKD/mlJYSX5aQLLTE
         XqwA==
X-Gm-Message-State: AElRT7FD/wsOFyMIbkLC08TKeinGrWL3Bh6SYggAkfMDYZoaP3T/Q+oX
        JMszIqwhvr9EQuFMl500XnIvkg==
X-Google-Smtp-Source: AIpwx49QkF0RLtlVKcRntpuTLAfQg160E3ONeF6lzvicyB7BhLMj8Y4zgYyrdah9pQHyP0ME23Im1A==
X-Received: by 2002:a17:902:8d82:: with SMTP id v2-v6mr23858638plo.101.1522945748770;
        Thu, 05 Apr 2018 09:29:08 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id y69sm16159378pfb.52.2018.04.05.09.29.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Apr 2018 09:29:08 -0700 (PDT)
Date:   Thu, 05 Apr 2018 09:29:08 -0700 (PDT)
X-Google-Original-Date: Thu, 05 Apr 2018 09:26:47 PDT (-0700)
Subject:     Re: [PATCH 0/2] perf: riscv: Preliminary Perf Event Support on RISC-V
In-Reply-To: <20180405050229.GA24451@andestech.com>
CC:     albert@sifive.com, peterz@infradead.org, mingo@redhat.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        jolsa@redhat.com, namhyung@kernel.org, sols@sifive.com,
        corbet@lwn.net, linux-riscv@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Palmer Dabbelt <palmer@sifive.com>
To:     alankao@andestech.com
Message-ID: <mhng-5b2192d4-d400-439a-839e-882f708b15b9@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 04 Apr 2018 22:02:29 PDT (-0700), alankao@andestech.com wrote:
> On Tue, Apr 03, 2018 at 03:45:17PM -0700, Palmer Dabbelt wrote:
>> On Tue, 03 Apr 2018 07:29:02 PDT (-0700), alankao@andestech.com wrote:
>> >On Mon, Apr 02, 2018 at 08:15:44PM -0700, Palmer Dabbelt wrote:
>> >>On Mon, 02 Apr 2018 05:31:22 PDT (-0700), alankao@andestech.com wrote:
>> >>>This implements the baseline PMU for RISC-V platforms.
>> >>>
>> >>>To ease future PMU portings, a guide is also written, containing
>> >>>perf concepts, arch porting practices and some hints.
>> >>>
>> >>>Changes in v2:
>> >>> - Fix the bug reported by Alex, which was caused by not sufficient
>> >>>   initialization.  Check https://lkml.org/lkml/2018/3/31/251 for the
>> >>>   discussion.
>> >>>
>> >>>Alan Kao (2):
>> >>>  perf: riscv: preliminary RISC-V support
>> >>>  perf: riscv: Add Document for Future Porting Guide
>> >>>
>> >>> Documentation/riscv/pmu.txt         | 249 +++++++++++++++++++
>> >>> arch/riscv/Kconfig                  |  12 +
>> >>> arch/riscv/include/asm/perf_event.h |  76 +++++-
>> >>> arch/riscv/kernel/Makefile          |   1 +
>> >>> arch/riscv/kernel/perf_event.c      | 468 ++++++++++++++++++++++++++++++++++++
>> >>> 5 files changed, 802 insertions(+), 4 deletions(-)
>> >>> create mode 100644 Documentation/riscv/pmu.txt
>> >>> create mode 100644 arch/riscv/kernel/perf_event.c
>> >>
>> >>I'm having some trouble pulling this into my tree.  I think you might have
>> >>another patch floating around somewhere, as I don't have any
>> >>arch/riscv/include/asm/perf_event.h right now.
>> >>
>> >>Do you mind rebasing this on top of linux-4.16 so I can look properly?
>> >>
>> >>Thanks!
>> >
>> >Sorry for the inconvenience, but this patch was based on Alex's patch at
>> >https://github.com/riscv/riscv-linux/pull/124/files.  I thought that one
>> >had already been picked into your tree.
>> >
>> >Any ideas?
>>
>> Thanks, it applies on top of that.  I'm going to play around with this a
>> bit, but it looks generally good.
>
> Note that to make it work better when wraparound occurs, you should change the
> value of *.counter_width* into the width of real hardware counters.  This is
> because this patch does not handle wraparound checking, so using a wider
> bit mask may sometimes report a extremely large number.
>
> Ideally this should be done by adding a Kconfig option called
> "Hifive Unleashed PMU" which automatically sets the width an reuses most of the
> baseline codes.  What do you think about this?

We're working through this now :)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
