Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2647AC433E0
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 21:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8EA264DFD
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 21:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhBVVuG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Feb 2021 16:50:06 -0500
Received: from ms.lwn.net ([45.79.88.28]:35356 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231638AbhBVVuD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 22 Feb 2021 16:50:03 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C2E6E2B7;
        Mon, 22 Feb 2021 21:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C2E6E2B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1614030562; bh=LI0igz6UiDc/29dq3FBY3h2eeJZSsHGdbEzGXRqvy48=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Fc2xp0ZMrKMRKm4vboOuKamjVFkoQZbwKDiwa7XAwRqXjXg6PEERQhujpKg8t6/ZK
         iwLGcwSqd6cSuDAYavpFZwCQiUV1IEcjHu/3B9lqsCmkR7SDNxAChr/C9hKb7xRGU0
         h8uJuyUyKuD6YurZiXmp3Uk0MyepiOjTzP//r9ksEGc2/nVV2YfSUNpgSLiHdcisBS
         cwtlarf8zPk0fHcWoaYpBDLDkvNGmtXwsD/qH8WavqRH1aqH/DosO+rKU4Abdc9sbg
         vnUumT8Dyjr+P3J3CPB3dafuGarbcrU9v1L4e8U395d59pjgIEXA0grqR1eN8VjCE6
         rTvrl1fzFGEwQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Aditya <yashsri421@gmail.com>
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: Investigating parsing error for struct/union
In-Reply-To: <CAKXUXMzBACaZzGkoF772y0pySc+UKyK_iW967nJkJTtVc93+LA@mail.gmail.com>
References: <5933570a-7768-26b2-40d0-1acac999d9f6@gmail.com>
 <CAKXUXMzBACaZzGkoF772y0pySc+UKyK_iW967nJkJTtVc93+LA@mail.gmail.com>
Date:   Mon, 22 Feb 2021 14:49:22 -0700
Message-ID: <8735xnlqn1.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> Aditya, I independently made a similar observation and noted this
> issue in my personal notes, which will serve for a cleanup patch
> series, as follows:
>
> "SKIP DEFINITIONS" Feature:
>
> The kernel-doc should proceed the code, and the required definition of
> data structures should stay close to the function in between the
> kernel-doc comment and the function definition.
>
> Let kernel-doc know to skip certain definitions; the actual definition
> documented will follow directly after the skipped definitions.
>
> E.g.,
>
> include/linux/cgroup.h:450: task_css_set_check: SKIP DEFINITIONS
> (struct mutex cgroup_mutex; spinlock_t css_set_lock)
> include/linux/hid-sensor-hub.h:174:
> sensor_hub_input_attr_get_raw_value: SKIP DEFINITIONS (enum
> sensor_hub_read_flags)
>
> I have not thought about a good syntax for that:
>
> maybe something like:
> /**
> * foo - description
> *
> * @arg: description
> *
> * ::skip: struct bar, enum blub, define MACRO
> */
>
> where "::" serves as some annotation to instruct kernel-doc

Honestly, we will never get that sort of annotation into the source
without encountering substantial pushback, and it will also be hard to
keep them up to date.  I don't see that as being the right path forward.

The better solution, for now, would be to just insist that the kerneldoc
comments be next to the thing they are describing, and to submit patches
fixing these issues to the appropriate maintainers.  Mauro and others
have been doing a fair amount of that already.

It might also be nice to make scripts/kernel-doc smarter so that it can
handle any degree of separation between the comment and the
declaration.  But that would complicate an already gnarly script for
(IMO) relatively little gain.

Thanks,

jon
