Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 98EC47E3B1
	for <lwn-linux-doc@archive.lwn.net>; Fri,  3 Aug 2018 14:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732353AbeHCQ4B (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 3 Aug 2018 12:56:01 -0400
Received: from mail-io0-f174.google.com ([209.85.223.174]:37791 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732312AbeHCQ4B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Aug 2018 12:56:01 -0400
Received: by mail-io0-f174.google.com with SMTP id z19-v6so5219723ioh.4
        for <linux-doc@vger.kernel.org>; Fri, 03 Aug 2018 07:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ppJIs+P8Ko2KhT9RCQqlsS1cBGmRmm5t4Oo2RZ2oXZA=;
        b=YstjJ5zuT+fTs0rq2SGWibooAj9k1vyGw9eNT9WPPxctZ/qMmcF/DTebW07XnDlmxg
         prdpYo8kUdmJ1TPFew+Y/cSC4U5LRfLfV9RCXJhujXq8cyA2dixv/iwoc5tQN9S0CPr6
         oWkFtWmYJIBZQgMtVaQRZ4pzDGRpOHkRqOaHWcwGoPaV3zF0FWlZsrDEop/4eIq2l92a
         WT91MGJ3cemoAI6tLix9xGi2mUDQackyiRCwjBo1iB7dFJq0a7oF0aLfBPYquBpN+exb
         l19BIJvADvsfXYQk6MJkLIX0C8rHtknPv65MjRtwRzwIsF9c13e6HdfRSPQAnpVjM6il
         /vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ppJIs+P8Ko2KhT9RCQqlsS1cBGmRmm5t4Oo2RZ2oXZA=;
        b=o4pwiuGinJAWg3o5Y5pB1bZjFbUc9x1/PQ4enunvLp1gujYgC5HdzeOnS6s4sxwYar
         z9uaTGOCvmqAOGZZX4nPvrYg6dlM0OylBQPQechjHq3tSo7vhxSiPlGASXZOkUZ5CN+T
         HavPB39gLOsBMwJxy9Y4osmBThXl72lsXzKPt7Pmh5yMMisQQKC7jjlL08AYR0j1ifgx
         MS+FvigTWs7vGQ/kqybJDVf1o9haghjmdUEkI7NzTPznGPF8cogOOc25DE8w4b6fGs8j
         TXFxl6DOalUL/KVQVxNhfFNlvfiqFplPxdoc8mva0NoDt9Lz9fzxnTGslLT7+UyCOItb
         Fe6g==
X-Gm-Message-State: AOUpUlEvpGnmKcMXcXdFZ3MkWjM2gTs/BJ45KB/6Q7wnk3fpEzhwInhZ
        /lyIe23aaNeNfdmrq96TGCAvzsA1/3tp0lRy9CfTww==
X-Google-Smtp-Source: AA+uWPzAZs8WvnEPfJ3ouuJqo1lGA/A+0Jl+Sgpo+il4Dy4tVZaJpkzgrspT1bsQHGibdWDWbw0e4K4cYSSseiADLvo=
X-Received: by 2002:a6b:ca85:: with SMTP id a127-v6mr6714619iog.31.1533308359181;
 Fri, 03 Aug 2018 07:59:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:918c:0:0:0:0:0 with HTTP; Fri, 3 Aug 2018 07:59:18 -0700 (PDT)
In-Reply-To: <CAAeHK+zb7vcehuX9=oxLUJVJr1ZcgmRTODQz7wsPy+rJb=3kbQ@mail.gmail.com>
References: <cover.1529507994.git.andreyknvl@google.com> <CAAeHK+zqtyGzd_CZ7qKZKU-uZjZ1Pkmod5h8zzbN0xCV26nSfg@mail.gmail.com>
 <20180626172900.ufclp2pfrhwkxjco@armageddon.cambridge.arm.com>
 <CAAeHK+yqWKTdTG+ymZ2-5XKiDANV+fmUjnQkRy-5tpgphuLJRA@mail.gmail.com>
 <CAAeHK+wJbbCZd+-X=9oeJgsqQJiq8h+Aagz3SQMPaAzCD+pvFw@mail.gmail.com>
 <CAAeHK+yWF05XoU+0iuJoXAL3cWgdtxbeLoBz169yP12W4LkcQw@mail.gmail.com>
 <20180801174256.5mbyf33eszml4nmu@armageddon.cambridge.arm.com> <CAAeHK+zb7vcehuX9=oxLUJVJr1ZcgmRTODQz7wsPy+rJb=3kbQ@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 3 Aug 2018 16:59:18 +0200
Message-ID: <CAAeHK+xTxPhfbVTNxcbsx7VdwQ21Bt-vo2ZU1tEM1_JX7uKnng@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] arm64: untag user pointers passed to the kernel
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-doc@vger.kernel.org, Will Deacon <will.deacon@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        linux-kselftest@vger.kernel.org,
        Chintan Pandya <cpandya@codeaurora.org>,
        Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        linux-arch@vger.kernel.org, Jacob Bramley <Jacob.Bramley@arm.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Kees Cook <keescook@chromium.org>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lee Smith <Lee.Smith@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 2, 2018 at 5:00 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
> On Wed, Aug 1, 2018 at 7:42 PM, Catalin Marinas <catalin.marinas@arm.com> wrote:
>> On Mon, Jul 16, 2018 at 01:25:59PM +0200, Andrey Konovalov wrote:
>>> On Thu, Jun 28, 2018 at 9:30 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
>>> So the checker reports ~100 different places where a __user pointer
>>> being casted. I've looked through them and found 3 places where we
>>> need to add untagging. Source code lines below come from 4.18-rc2+
>>> (6f0d349d).
>> [...]
>>> I'll add the 3 patches with fixes to v5 of this patchset.
>>
>> Thanks for investigating. You can fix those three places in your code
>
> OK, will do.
>
>> but I was rather looking for a way to check such casting in the future
>> for newly added code. While for the khwasan we can assume it's a debug
>> option, the tagged user pointers are ABI and we need to keep it stable.
>>
>> We could we actually add some macros for explicit conversion between
>> __user ptr and long and silence the warning there (I guess this would
>> work better for sparse). We can then detect new ptr to long casts as
>> they appear. I just hope that's not too intrusive.
>>
>> (I haven't tried the sparse patch yet, hopefully sometime this week)
>
> Haven't look at that sparse patch yet myself, but sounds doable.
> Should these macros go into this patchset or should they go
> separately?

Started looking at this. When I run sparse with default checks enabled
(make C=1) I get countless warnings. Does anybody actually use it?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
