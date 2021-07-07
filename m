Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F4EC07E9C
	for <linux-doc@archiver.kernel.org>; Wed,  7 Jul 2021 18:54:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C23E361CBB
	for <linux-doc@archiver.kernel.org>; Wed,  7 Jul 2021 18:54:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhGGS5X (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Jul 2021 14:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhGGS5W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Jul 2021 14:57:22 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553C6C061760
        for <linux-doc@vger.kernel.org>; Wed,  7 Jul 2021 11:54:41 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id v1so4779812edt.6
        for <linux-doc@vger.kernel.org>; Wed, 07 Jul 2021 11:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ugbA+4JXRP1mJwLMiXh8sHPiNT5dm+iRolBoqcwvGKM=;
        b=UWmdMoSC6n6QgehfuVD18jZrfRnAzOQu/YMvpyvP1FIKUp3BE0/9X7ze+Nr5kV6fzs
         fNG/XxtM+aTtgosF3KIaFgB2xxVqlo9KjZhsZj0LNmOs535WsATvLMEWrkA9+uzQO5WZ
         hLiWBNIXX8dW1gOk3PDCbjhD0UJtDraRimRZCedJTnw3SJSubzpyzBsQQ5Wv9JFk5w9O
         GBs4V4067U1+f0SXZxlAq6cHUbn52Syibvd60smJNE8lDop7PUDEiluj0fntQJZjlrMo
         xKy7+LSHA87ej/o1Qc6q7QbrTtWd4fsCMB8GTFTwATdAR+b/yqrELwX8SDK/L3lq2V/B
         UuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ugbA+4JXRP1mJwLMiXh8sHPiNT5dm+iRolBoqcwvGKM=;
        b=mG3UbKaaUYLCoqK2acjb/gMWUiNg9yVBTVyELY+Nz8Z1tA0BreNjS7u4kkPNtk7fis
         ybmUxXNU7TlfXyif6drkOBaQr0v4izPjVn1rXiZyMU//iBJ75qIWfwGckRajsk1OhAO+
         HTUqu036wRfjoiMwakKys4ZBn8xu+TtJ440JbyLjytc9oATHnFsC9KsvXrO/QU3lnf3k
         aoimT9Cgof0yrvaAlcbyW3TvSxFKzzMyoXHsxNt1HnAXLx7EYlVZzJ95Q8cIoVge/Kg1
         261g7cu/X2+RZ+dDavsVM224oLncdUxe2c5jHzaW4biTRiKDGR5e31w0rcSVJTKMtUBm
         uxmA==
X-Gm-Message-State: AOAM533Q6tHgVRuaIJV9M4ISsrAgfBiLazWPuHNbCQLLu/ck8VeYQ+ao
        l987d2v6sPE4FAhHoh/+U9pmqKY+JeMQ51nEKlkr
X-Google-Smtp-Source: ABdhPJzwqV7FHm5eRzTwBwwPAUceWy+Y8yEhnDSBxTccP6bRO19RRdsI4wJHLd3uGtrVGw7qkCnAGwX2QsTdxop5hlo=
X-Received: by 2002:a05:6402:2681:: with SMTP id w1mr31964013edd.275.1625684079863;
 Wed, 07 Jul 2021 11:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <linux-audit/audit-kernel/issues/131@github.com>
 <linux-audit/audit-kernel/issues/131/872191450@github.com>
 <YN9V/qM0mxIYXt3h@yury-ThinkPad> <mvm7di59gtx.fsf@suse.de> <YOX2HBSoltXDGuu+@yury-ThinkPad>
In-Reply-To: <YOX2HBSoltXDGuu+@yury-ThinkPad>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 7 Jul 2021 14:54:28 -0400
Message-ID: <CAHC9VhTbYk14D1ZaUOfafcEtQgnPPF=ySpNYrsO+VD+W7PcYXQ@mail.gmail.com>
Subject: Re: [linux-audit/audit-kernel] BUG: audit_classify_syscall() fails to
 properly handle 64-bit syscalls when executing as 32-bit application on ARM (#131)
To:     Yury Norov <yury.norov@gmail.com>
Cc:     Andreas Schwab <schwab@suse.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-audit/audit-kernel" 
        <reply+ADSN7RXLQ62LNLD2MK5HFHF65GIU3EVBNHHDPMBXHU@reply.github.com>,
        "linux-audit/audit-kernel" <audit-kernel@noreply.github.com>,
        Mention <mention@noreply.github.com>,
        Xiongfeng Wang <wangxiongfeng2@huawei.com>,
        bobo.shaobowang@huawei.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        Adam Borowski <kilobyte@angband.pl>,
        Alexander Graf <agraf@suse.de>,
        Alexey Klimov <klimov.linux@gmail.com>,
        Andrew Pinski <pinskia@gmail.com>,
        Bamvor Zhangjian <bamv2005@gmail.com>,
        Chris Metcalf <cmetcalf@mellanox.com>,
        Christoph Muellner <christoph.muellner@theobroma-systems.com>,
        Dave Martin <Dave.Martin@arm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Florian Weimer <fweimer@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        James Hogan <james.hogan@imgtec.com>,
        James Morse <james.morse@arm.com>,
        Joseph Myers <joseph@codesourcery.com>,
        Lin Yongting <linyongting@huawei.com>,
        Manuel Montezelo <manuel.montezelo@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
        Nathan_Lynch <Nathan_Lynch@mentor.com>,
        Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
        Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
        Ramana Radhakrishnan <ramana.gcc@googlemail.com>,
        Steve Ellcey <sellcey@caviumnetworks.com>,
        Szabolcs Nagy <szabolcs.nagy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 7, 2021 at 2:44 PM Yury Norov <yury.norov@gmail.com> wrote:
> On Mon, Jul 05, 2021 at 12:48:42PM +0200, Andreas Schwab wrote:
> > On Jul 02 2021, Yury Norov wrote:
> >
> > > At least Marvell, Samsung, Huawei, Cisco and Weiyuchen's employer
> > > actively use and develop arm64/ilp32.
> >
> > This is good to know.  Where can I get the uptodate kernel patches for
> > ILP32?
> >
> > Andreas.
>
> The latest kernel supported by me is 5.2:
> https://github.com/norov/linux/commits/ilp32-5.2
>
> I know about working ports of ILP32 on 5.7 and 5.10, but didn't see
> the code and testing results. Hopefully Paul Moore and Weiyuchen will
> share more details.

To be clear, I have not done any work with ILP32 nor do I have any
immediate plans to do so (other tasks are higher priority).  I am not
sure what details you are looking for, but there are several
arches/ABIs in the kernel, including regular aarch64, that can serve
as examples on how to enable syscall auditing (presumably that is what
you are interested in with this thread).  There may be some
interesting challenges with ILP32 due to overlap with aarch64
syscalls, but I haven't looked closely enough at ILP32 to say that
with any certainty.

-- 
paul moore
www.paul-moore.com
