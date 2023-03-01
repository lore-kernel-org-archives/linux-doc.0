Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBCAC6FA9D
	for <linux-doc@archiver.kernel.org>; Wed,  1 Mar 2023 15:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjCAP5u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Mar 2023 10:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjCAP5t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Mar 2023 10:57:49 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52DE38677
        for <linux-doc@vger.kernel.org>; Wed,  1 Mar 2023 07:57:47 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id y14so14484440ljq.4
        for <linux-doc@vger.kernel.org>; Wed, 01 Mar 2023 07:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1677686266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZY5EmaqD+P3EwReqCVyHwAW/VaGSUP/+XIGUbkZtms=;
        b=Gvv4zHlv94oBHWoM9u9axqXfB9byfnnU8jGTCTd2rOc519tknR7ersCYRyBHqQybud
         GTJR/3HkuRAqPaHjlQmJGN8lGBa00xveHOoh/RPtEUgIbPU6xGo3sMh9B0YHJuuRqv1+
         Wj2iCrUGBhvAPxR4cXNbxbMKeKZLakqSBVl74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677686266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZY5EmaqD+P3EwReqCVyHwAW/VaGSUP/+XIGUbkZtms=;
        b=lkjtavmqQyE8Zb7A2n0vFWqaSJVJ2xMcpguKxjHOlHcu3x2puBAoXX8wUKoALiCKkk
         akoTuE5i1+U9XilgT93ZvWSxlMcbX5viZ5Z1iVqcD/HwSGMl7pBKzGf44B5duzsp3uLQ
         ZTq0GGHXLHYlS+dMi3eFSWTa5jTK6A1HsB9b6lo3yfOGjUQ7s0QvB5euLnk1xv3gLqHV
         FdtVV4ZtYDIZqb/U9GSkm5iiwQxKU7pZJ8cphph22I5161z1RhgXfTFwP3wWYpHPwN3X
         Eu6kpXY8WlIAFEMzGrNuMWbozgW01Wiko7vE4v4AedMyxTzfJvKATNJC3r3AKGdG8dQr
         PmcA==
X-Gm-Message-State: AO0yUKVLefoZJhQ+qCAKtr5jG0jgBMt1b7fpWg26y7zMoEzmalYgPwnc
        nU/5LAxPCwIAoKikl1aOQtsy8L2Gfq9N1juRUIYgXg==
X-Google-Smtp-Source: AK7set+PUT6fMy5JjsAgQSnvd2HKm/XJgvhhtyqHAlJpOdjtzWHJFpgnv1sPo1bRYNmhtPOd794aGqK9c4pLl3INt/Y=
X-Received: by 2002:a2e:a378:0:b0:295:a82e:ec06 with SMTP id
 i24-20020a2ea378000000b00295a82eec06mr2233608ljn.3.1677686266038; Wed, 01 Mar
 2023 07:57:46 -0800 (PST)
MIME-Version: 1.0
References: <IA1PR11MB617175CA398D425B7489CE4889AF9@IA1PR11MB6171.namprd11.prod.outlook.com>
 <764CA486-6FB2-4667-B8CB-56E3AC31FD58@joelfernandes.org> <IA1PR11MB617118DAE8D72E2419558D6689AC9@IA1PR11MB6171.namprd11.prod.outlook.com>
 <CAEXW_YQwu4ccqWLTfFSwcJQOH6fbhe4SiHHa4XPUCvefiBZi9g@mail.gmail.com> <IA1PR11MB61714E80960104FB04E3167989AD9@IA1PR11MB6171.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB61714E80960104FB04E3167989AD9@IA1PR11MB6171.namprd11.prod.outlook.com>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Wed, 1 Mar 2023 10:57:34 -0500
Message-ID: <CAEXW_YRe58jpu_WS3XLsvcEuLTGTRJzc5ErveaO5X093=_13Dg@mail.gmail.com>
Subject: Re: [PATCH RFC v2] rcu: Add a minimum time for marking boot as completed
To:     "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        "rcu@vger.kernel.org" <rcu@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 28, 2023 at 8:34=E2=80=AFPM Zhuo, Qiuxu <qiuxu.zhuo@intel.com> =
wrote:
>
> > From: Joel Fernandes <joel@joelfernandes.org>
> > Sent: Tuesday, February 28, 2023 10:27 PM
> > To: Zhuo, Qiuxu <qiuxu.zhuo@intel.com>
> > Cc: linux-kernel@vger.kernel.org; Frederic Weisbecker <frederic@kernel.=
org>;
> > Lai Jiangshan <jiangshanlai@gmail.com>; linux-doc@vger.kernel.org; Paul=
 E.
> > McKenney <paulmck@kernel.org>; rcu@vger.kernel.org
> > Subject: Re: [PATCH RFC v2] rcu: Add a minimum time for marking boot as
> > completed
> >
> > On Tue, Feb 28, 2023 at 1:40=E2=80=AFAM Zhuo, Qiuxu <qiuxu.zhuo@intel.c=
om> wrote:
> > >
> > [...]
> > > My testing showed the positive result that the OS boot time was
> > > reduced by ~4.6% on my side after applying Joel=E2=80=99s patch.
> >
> > Wow, this is great! I am guessing you have CONFIG_RCU_LAZY disabled,
> > when you tested. If so, that is great news that expediting RCU for a bi=
t longer
> > improves boot time! Please confirm that your config had LAZY disabled.
> >
>
> I confirm that CONFIG_RCU_LAZY kernel configuration was disabled in my te=
sting.
> All the kernel configurations for RCU used in my testing are as below:

Thank you! Good to know there is improvement in *existing code*,
that's the power of upstream... new features fix/improve old ones
sometimes.

Any case, I will include all your data in v3. Thanks!

 - Joel

>
>      #
>      # RCU Subsystem
>      #
>      CONFIG_TREE_RCU=3Dy
>      CONFIG_PREEMPT_RCU=3Dy
>      CONFIG_RCU_EXPERT=3Dy
>      CONFIG_SRCU=3Dy
>      CONFIG_TREE_SRCU=3Dy
>      CONFIG_TASKS_RCU_GENERIC=3Dy
>      # CONFIG_FORCE_TASKS_RCU is not set
>      CONFIG_TASKS_RCU=3Dy
>      # CONFIG_FORCE_TASKS_RUDE_RCU is not set
>      # CONFIG_FORCE_TASKS_TRACE_RCU is not set
>      CONFIG_TASKS_TRACE_RCU=3Dy
>      CONFIG_RCU_STALL_COMMON=3Dy
>      CONFIG_RCU_NEED_SEGCBLIST=3Dy
>      CONFIG_RCU_FANOUT=3D32
>      CONFIG_RCU_FANOUT_LEAF=3D16
>      # CONFIG_RCU_BOOST is not set
>      CONFIG_RCU_BOOT_END_DELAY=3D20000
>      CONFIG_RCU_NOCB_CPU=3Dy
>      # CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
>      # CONFIG_TASKS_TRACE_RCU_READ_MB is not set
>      # CONFIG_RCU_LAZY is not set
>      # end of RCU Subsystem
>
> -Qiuxu
