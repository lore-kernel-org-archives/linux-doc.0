Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CE45C7D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 16:10:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbeKHBlD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Nov 2018 20:41:03 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:38125 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727627AbeKHBlD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Nov 2018 20:41:03 -0500
Received: by mail-vk1-f194.google.com with SMTP id w72so2575765vkd.5
        for <linux-doc@vger.kernel.org>; Wed, 07 Nov 2018 08:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=WygdfWgc82JLORm6/ybR+mPW6gq6639PAYDpVjtVbrQ=;
        b=e0Xys081855tteOPeAQ63WgrsEJPcuAfBlonEt+hCPRp6wBEAx78wdpi2Yef9Z65Qq
         R+g2L7t0lIVcpiEUZM4bPsVT9vdD0nXKEaY2R/RWYe0CY3DPdMJScXU7eezjOD6CF5pr
         XLcNI39Gw6XSnVl+foX3oPS4yMcf62El1IX2EoOHsgSkzXe+Ki0iG6Xyl3COuGxg3rM6
         1RenVa4I2+953BxSZfHNR/MoIgLsRfX5ADNBUwjWhHOQbo6g9QXuQrEkOTkiVDhEAyvp
         1IE5hIIRDW0QwnqNhh9Y2N+DW7yVHBcM0bhLazuuNJAQrqBVJAEOP2b2GPoytZ3NiGL+
         hAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=WygdfWgc82JLORm6/ybR+mPW6gq6639PAYDpVjtVbrQ=;
        b=bbH15ywNDKEm9wC+lo9RTUUQiLXiBUw0uJaQLjriJzkgnUfdRgtqd1Oi7oQDBy2RQs
         ZYgmtr8JcxJ9vuelgLrZWECtnDrza5dKVHV3KCCMYUjIcrNzZ0zEnPa3ADlrIsLanTkw
         4ltXKzPAxHIYTZVFResHXhoLVynF8G5MI51FaLMW8wLkc8yq1cf7FFvqVTvFj3eLYC6A
         fR3U2tm54eZpShPPiBqcQH8XvFIqe4qIYQiJxA7Z0A7iB4PnLYCjvsn7j4h/CEP2dc13
         anVOnjEe4/yJX7mgVY3ht8+D96PSmNDpUMc+Q5dB5w42oZF9UWlBge6NKvip/9Tqw9He
         G5tg==
X-Gm-Message-State: AGRZ1gJf1di7D5ZNzAI+utBFPicWgwBWtVQHxNGr3jFRe2HsXAoeWDp1
        m+kjP7WG8VmPhyHyEsZ22aVvRL9qSsxsfFo7fUo8sQ==
X-Google-Smtp-Source: AJdET5eg7Y/m+5hFooFEA0LYZih92J8o1ZZqUAkuObhj6foTrtam/KnC2SSznNfJlScOnz/EQngLIYADAoL2cJToik4=
X-Received: by 2002:a1f:7cca:: with SMTP id x193mr335348vkc.89.1541607002114;
 Wed, 07 Nov 2018 08:10:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a67:f48d:0:0:0:0:0 with HTTP; Wed, 7 Nov 2018 08:10:01 -0800 (PST)
In-Reply-To: <20181107160015.GI27423@dhcp22.suse.cz>
References: <20181031150625.147369-1-dancol@google.com> <20181105132205.138695-1-dancol@google.com>
 <20181106130524.GC2453@dhcp22.suse.cz> <CAKOZueu5aDtHDBzp6qKECTHEejjb=dyegQkuHh8NfwgNktzFow@mail.gmail.com>
 <20181107160015.GI27423@dhcp22.suse.cz>
From:   Daniel Colascione <dancol@google.com>
Date:   Wed, 7 Nov 2018 16:10:01 +0000
Message-ID: <CAKOZuevb-MED0QiL5RWJ0py=yt48=N7bPSq5bFqiwWcqN9L=Xg@mail.gmail.com>
Subject: Re: [PATCH v2] Document /proc/pid PID reuse behavior
To:     Michal Hocko <mhocko@kernel.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>, rppt@linux.ibm.com,
        Tim Murray <timmurray@google.com>,
        Joel Fernandes <joelaf@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
        Prashant Dhamdhere <pdhamdhe@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 7, 2018 at 4:00 PM, Michal Hocko <mhocko@kernel.org> wrote:
> On Wed 07-11-18 15:48:20, Daniel Colascione wrote:
>> On Tue, Nov 6, 2018 at 1:05 PM, Michal Hocko <mhocko@kernel.org> wrote:
>> > otherwise anybody could simply DoS the system
>> > by consuming all available pids.
>>
>> People can do that today using the instrument of terror widely known
>> as fork(2). The only thing standing between fork(2) and a full process
>> table is RLIMIT_NPROC.
>
> not really.

What else, besides memory consumption and (as you mention below)
cgroups? In practice, nobody uses RLIMIT_NPROC, so outside of various
container-y namespaced setups, avoidance of
system-DoS-through-PID-exhaustion isn't a pressing problem.

If you really do care about pid space depletion then you
> should use pid cgroup controller.

Or that, sure. But since cgroups are optional, the problem with the
core model remains. In general, if there's a problem X with the core
system API, and you can mitigate X by using a cgroup, X is still a
problem.
