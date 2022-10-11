Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D283C4332F
	for <linux-doc@archiver.kernel.org>; Tue, 11 Oct 2022 17:22:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiJKRWi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Oct 2022 13:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiJKRWh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Oct 2022 13:22:37 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC165AA0A
        for <linux-doc@vger.kernel.org>; Tue, 11 Oct 2022 10:22:36 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id k2so32964526ejr.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Oct 2022 10:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tD9jR7qHoo8YjCPFAxtMgRghcsI0I3euLcmHX/AlDvk=;
        b=EG3pijXaCZAx0z7+DzNm/ASYYg3E5j3bCUvD9D1vXPg0vGbv7rSmWRFf+49wNrOjPC
         XgB9u2o/1y2tnzLsdca6ebyRx8nNHH+TcgbL4bosKJZBi3Q6JBHOnWZhuWd3TMiGpK0W
         qUqplH1WfiIV27fsfHUt9ko6yhHMZp32J6NLnAYkBDd4AQSkHidIiGKvs5DCXkvBO5hF
         subwyAFDVEt33ulB4j6S8wDFl/z7aH4H73nqR0aPqy/DSs/DCwi98lV5QH3cvDLQMMft
         zGXv1Z3V2aDk5tyMCO22+B1TZ7WjzVHijfIx/Ek4rbzQXt0uvboaMorpjZHSA/OP/KNt
         8VNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tD9jR7qHoo8YjCPFAxtMgRghcsI0I3euLcmHX/AlDvk=;
        b=jPbiLp50+2JsmA4L25hsWnyBx2PUDT/8107vfeo/64fi0oynJEPHi28h+OcoZgfYbH
         jB9zOjbprHVFdZw7b9oxFengJvLc73PRzW/HR4RYzKwhfcjOSQ6W2+BNeYqto782RTes
         FG6R4IdcAf6lK2fReiCUasuQ1y/ZOIlczvpJGYGOh9bEb7LXXRyVvJAmNcr2NM/O+KiH
         PDnF/5Y76MLq9syxwKmbFjkFWtDLX0KJeIGLijDh2wOxV8R58bdXJ/fvBzzCVIERAPyQ
         a1VTpmANhEKTeoLBUdBEviwdkTRkRjJXrZRngs1uMzvWw9/2LuRSmbq22kPQ9U/sWZcc
         VgXg==
X-Gm-Message-State: ACrzQf383V4oQJoYYva2KEKRu5eB6ffCaAWgd3juKY9DvR4ERTsevIu7
        gJQBekZlUj7q1oRycNDLEuYrhw5BHDlWbRbfVHTj1A==
X-Google-Smtp-Source: AMsMyM5ZC8bySD0ur+e6jyv+eDlRBwAazeHKoD2ZcGUoZbIE0AMED9AS38/kZXKX5FECDsvvfbQ8I6W0UQAoyEgijY4=
X-Received: by 2002:a17:906:4fca:b0:78d:b042:eeca with SMTP id
 i10-20020a1709064fca00b0078db042eecamr9869193ejw.685.1665508955072; Tue, 11
 Oct 2022 10:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221010094842.4123037-1-hezhongkun.hzk@bytedance.com>
 <CAPTztWYTGOb8ZQzfgThqJn+fyi4ZB8=JQQZi5_rUoDhdftKtvg@mail.gmail.com> <Y0WE/lEiNvl2ljo1@dhcp22.suse.cz>
In-Reply-To: <Y0WE/lEiNvl2ljo1@dhcp22.suse.cz>
From:   Frank van der Linden <fvdl@google.com>
Date:   Tue, 11 Oct 2022 10:22:23 -0700
Message-ID: <CAPTztWZZOxtzdEm=wbOiL_VDPJuCaW0XVCvsdRpCHE+ph+5eZQ@mail.gmail.com>
Subject: Re: [RFC] mm: add new syscall pidfd_set_mempolicy()
To:     Michal Hocko <mhocko@suse.com>
Cc:     Zhongkun He <hezhongkun.hzk@bytedance.com>, corbet@lwn.net,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, wuyun.abel@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 11, 2022 at 8:00 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 10-10-22 09:22:13, Frank van der Linden wrote:
> > For consistency with process_madvise(), I would suggest calling it
> > process_set_mempolicy.
>
> This operation has per-thread rather than per-process semantic so I do
> not think your proposed naming is better.

True. I suppose you could argue that it should have been
pidfd_madvise() then for consistency, but that ship has sailed.

>
> > Other than that, this makes sense. To complete
> > the set, perhaps a process_mbind() should be added as well. What do
> > you think?
>
> Is there any real usecase for this interface? How is the caller supposed
> to make per-range decisions without a very involved coordination with
> the target process?

The use case for a potential pidfd_mbind() is basically a combination
of what is described for in the process_madvise proposal (
https://lore.kernel.org/lkml/20200901000633.1920247-1-minchan@kernel.org/
), and what this proposal describes: system management software acting
as an orchestrator that has a better overview of the system as a whole
(NUMA nodes, memory tiering), and has knowledge of the layout of the
processes involved.

pidfd_mbind()  makes sense to me, since the notion of an external
agent with knowledge of the VM layout is already there with
process_madvise(). And since set_mempolicy and mbind are closely
related, it would seem logical to add an mbind variant as well as
pidfd_set_mempolicy().

Having said that, I'm fine with leaving that discussion for another time.

- Frank
