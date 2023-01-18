Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E184C38147
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 22:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjARWFB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 17:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbjARWEs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 17:04:48 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709B5646A9
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 14:04:47 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so273004wms.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 14:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YwIPzOL5zDtnm8fGUbKYZT0rLB8g0X1JeGG+nlkwy2g=;
        b=RbNnMw6tL2FY/7TumtFfRH/RzPMkiMlwqLjvQlOMqFpqcFg7xFzkZlKm7HshvD1uhc
         GYf4nvjvZ9Gaig4ljDuhSRZhNRf2TmFX1ShcfKldoTziIlHLhMWiWHnLb2O5akyusUy+
         uKI5CLnEXeGpmOZKzLfvHoPYqKSeKSoAZofTtN8t8sRNHNmgO77M7CNcVJ6dYGYMNt5C
         AI3sWSnG4ExajqbWdAapWiz+b6jIKMCv7gK7OhMmQF+BdfZOuoGjDKCCo1yhy2fVxuZS
         4VkTy0/WPobGmzU/LTAq7bSlN8q7d9wNfnNzIakOE8YFAo5RW5VBThYNBRo7MVdRtKR2
         viFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwIPzOL5zDtnm8fGUbKYZT0rLB8g0X1JeGG+nlkwy2g=;
        b=Yz2rdD96Cv47z89SrXSWxGwOxeHcDp8CU795uhImSYAAxm81ygGOehUvDAeexn+OY1
         Y/HsoJDbCyvBbUxvmV36I4sn3oqADMnyqJ7/OrQ2vLBdAkorX+f8Nhg3ifMDJbv6UdwC
         aYIB+7NQYnnUHD6/Pn2PKXflNt5ZwiYdFOmC/j4toIFWcTKHdQa8JuWK8toNaLVq9M4k
         Hz2mUfK6H60SMz9KbUTVNTMGPjBPWNxKZueq6D4xqO/KDzoGxZjpt8B4xyHys7aqh+GA
         ww+eh1Y2jvc4/UPySUyjkYtkMPClBHREJIVRDGR/O46unPq0Z/dJzzfXC2KkHEC3eR7F
         lM2g==
X-Gm-Message-State: AFqh2kqmfnJdlYeHuzbqCcaiZZMxfklIWR1k++wy7blhD62gMlcFat6f
        TWkpFbeCMrw7xGAmvLwG+JN+jjzvS3Sdv5ZHcAR9Yw==
X-Google-Smtp-Source: AMrXdXs3YifbiXqcN/UM9iuN5qbxprLoFpLthaoKnHv5Q0dpt/Ixi+xaFLmP1X8b0KoaiNfnrWS05HuuetM0wGCrfJk=
X-Received: by 2002:a05:600c:a686:b0:3db:104:7821 with SMTP id
 ip6-20020a05600ca68600b003db01047821mr459041wmb.77.1674079485953; Wed, 18 Jan
 2023 14:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20230113210703.62107-1-nhuck@google.com> <Y8HI+42TxxlJxT6D@slm.duckdns.org>
 <CAJkfWY7vmvrU8sW3OWpSa9zygY=6e8BTTkktPe-VScdOcLL-sw@mail.gmail.com>
 <Y8gxu7l8BUWewuMg@slm.duckdns.org> <CAB=BE-Q9jtJnqPwGzSTQ6-soZ9STvqAebeONy=Eyo08H+eg-rQ@mail.gmail.com>
In-Reply-To: <CAB=BE-Q9jtJnqPwGzSTQ6-soZ9STvqAebeONy=Eyo08H+eg-rQ@mail.gmail.com>
From:   Nathan Huckleberry <nhuck@google.com>
Date:   Wed, 18 Jan 2023 14:04:34 -0800
Message-ID: <CAJkfWY5c=kT1CpQ+R34MpX6_Dyq_32zgkYDgrWU7Kuoz7d9TYg@mail.gmail.com>
Subject: Re: [PATCH] workqueue: Add WQ_SCHED_FIFO
To:     Sandeep Dhavale <dhavale@google.com>
Cc:     Tejun Heo <tj@kernel.org>, Daeho Jeong <daehojeong@google.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 18, 2023 at 10:22 AM Sandeep Dhavale <dhavale@google.com> wrote:
>
> On Wed, Jan 18, 2023 at 9:52 AM Tejun Heo <tj@kernel.org> wrote:
> >
> > On Sat, Jan 14, 2023 at 01:00:00PM -0800, Nathan Huckleberry wrote:
> > > This sounds fine to me. How do you feel about a config flag to change
> > > the default WQ_HIGHPRI scheduler policy and a sysfs node to update the
> > > policy per workqueue?
> >
> > Yeah, sounds fine to me.
> >
> > Thanks.
> >
> Hi Tejun,
> If with the kernel config option, every WQ_HIGHPRI is elevated to
> sched_fifo_low, wouldn't that be kind of defeating the purpose? Having
> another class for even more urgent work is better in my opinion.

I agree, however most of the users of WQ_HIGHPRI that are relevant to
Android would probably have SCHED_FIFO enabled anyway.

I can write the patches such that WQ_HIGHPRI selects one of two
internal WQ flags. If using SCHED_FIFO for all workqueues is
problematic, Android can consider using the internal WQ flags directly
and carry those one-line patches in the Android tree.

Thanks,
Huck

>
> Thanks,
> Sandeep.
> > --
> > tejun
