Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 943657DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 14:09:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751007AbeECOJ6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 10:09:58 -0400
Received: from mail-it0-f50.google.com ([209.85.214.50]:53897 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750922AbeECOJ5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 10:09:57 -0400
Received: by mail-it0-f50.google.com with SMTP id f65-v6so17980763itd.3
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 07:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=yqJ71wV2HjeeJu2Y3Q1e4lnjLxv8/IV3XsUOimBvs3I=;
        b=aC48c8mjNjL8DiPALClyIjlHJ7HGqkn8Itefzf+FPn+DefNDfaG88Xm6PmM7QehJS6
         Uqz1TFpxqL0my7pv3K+a9xwCMMvqsp2ho8mEI21uG5K5aXj1WZXUoPzCsB85QVu+TQ3u
         WKxx/NHI/GdnuTsVphI/rxy3hS+eTQ9/NxKfqtdS081Wb/ALTbKFarbxHViQXoavMu4Q
         TcIvnKCh1Kx4UeZWuxUHWAYATd5XZbnkcyRl4+ZZw5tdFIZ9MFHrkUxorXEM8Qp6IBZy
         q1eds6Rsk/u9q8VKVOe/lSP2OGx2PIpEEwczp69/OPzIEWquL7Ihc0zgoNYZYbqOIiXg
         78oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=yqJ71wV2HjeeJu2Y3Q1e4lnjLxv8/IV3XsUOimBvs3I=;
        b=YFbo/qvt4UXjhsgmC+xAqxO09MGqAwnGe50Xrp+pjHZeEQalju52IY/m1vme0eFJyK
         Cc9YBb9RN0U2uIs5DtdEPXFSa20LNr37GLcZ0RE7eXzMFBYfbDFlYc7nduDnwYmZH6A5
         tq/Ah9/Pm5qVzRGm8Scd8wYUj70c/InBAuocXZmzjErMcWYgJ2vBlCN+vvPyYZOuOQ8o
         3lQLdjlW1YskgLFx6VYqNMzB3Qo8QqJue9FYTGuPmTl0ZbZACNEYlwxZGqKLGlEuKmkX
         oCHCic5z7Z1fDltqBJUKFTeuladOBc2sZZD/bXh0BQV82FwH/Nl9GprYt0d65SoiRXVR
         v5Bg==
X-Gm-Message-State: ALQs6tCM+aGi57vYJ1uiutYQ9MsCTTPsTSmOyHCvR5OqAjQb/GZPT92Z
        61+3ntGSsLwGyzKXkvOBYyWhevcG7Rsfj1MiSp3cTQ==
X-Google-Smtp-Source: AB8JxZrpXFcmnDxs5FR8h9tg3MlqFgfh2qRVgql1o/VHeZh8BNhiPXnnp6J8IflQaBSMIlh3jjeIEtI7ICUR4PFjbTY=
X-Received: by 2002:a24:1acc:: with SMTP id 195-v6mr25163035iti.48.1525356596887;
 Thu, 03 May 2018 07:09:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:6658:0:0:0:0:0 with HTTP; Thu, 3 May 2018 07:09:56 -0700 (PDT)
In-Reply-To: <CAAeHK+yTbmZfkeNbqbo+J90zsjsM99rwnYBGfQBxphHMMfgD7A@mail.gmail.com>
References: <cover.1524077494.git.andreyknvl@google.com> <0db34d04fa16be162336106e3b4a94f3dacc0af4.1524077494.git.andreyknvl@google.com>
 <20180426174714.4jtb72q56w3xonsa@armageddon.cambridge.arm.com>
 <CAAeHK+zY8p9E4FZa7mbdgR=wR0u-RDS552dn=h9fKRC-ArYLdw@mail.gmail.com>
 <20180502153645.fui4ju3scsze3zkq@black.fi.intel.com> <CAAeHK+yTbmZfkeNbqbo+J90zsjsM99rwnYBGfQBxphHMMfgD7A@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 3 May 2018 16:09:56 +0200
Message-ID: <CAAeHK+zh0LSpq2VFJeHrV7AETnL1b9R+yex3iPMg5SetbEyxwg@mail.gmail.com>
Subject: Re: [PATCH 4/6] mm, arm64: untag user addresses in mm/gup.c
To:     "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 2, 2018 at 7:25 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
> On Wed, May 2, 2018 at 5:36 PM, Kirill A. Shutemov
> <kirill.shutemov@linux.intel.com> wrote:
>> On Wed, May 02, 2018 at 02:38:42PM +0000, Andrey Konovalov wrote:
>>> > Does having a tagged address here makes any difference? I couldn't hit a
>>> > failure with my simple tests (LD_PRELOAD a library that randomly adds
>>> > tags to pointers returned by malloc).
>>>
>>> I think you're right, follow_page_mask is only called from
>>> __get_user_pages, which already untagged the address. I'll remove
>>> untagging here.
>>
>> It also called from follow_page(). Have you covered all its callers?
>
> Oh, missed that, will take a look.

I wasn't able to find anything that calls follow_page with pointers
passed from userspace except for the memory subsystem syscalls, and we
deliberately don't add untagging in those.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
