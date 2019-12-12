Return-Path: <SRS0=cTBG=2C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF67C43603
	for <linux-doc@archiver.kernel.org>; Thu, 12 Dec 2019 01:31:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4D3021655
	for <linux-doc@archiver.kernel.org>; Thu, 12 Dec 2019 01:31:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UQbDOg48"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbfLLBbk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Dec 2019 20:31:40 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42085 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfLLBbk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Dec 2019 20:31:40 -0500
Received: by mail-pf1-f194.google.com with SMTP id 4so213464pfz.9
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2019 17:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I7BY6Zcq9XcTFG0Efu7gJTSZE5NTVFX3CybfHRAtqtY=;
        b=UQbDOg483encmWh2POkOoxh3EtPNdlowu1onPBvjs+LEHmho0x1YQHxScWT8Lw2ZYa
         amX44rro/c8kF1RngDJ4y7YLNnOkInXJR3Xf42xL/HFiM0ThutqYXs0pkYpOpDo2vcp8
         pkKdibHstn567lChfANcg93TN51oSPI9dObLCNYs3FETzDV8qmA/lWDAS65BG9AdRErg
         9KIgjG81kXN11FlfsMNKnN3iw9bePVKFWXMb8lww+N4ihJFE3FUnsdnHeh6v9NVRDewc
         3wX7KipMI53+sCF3NtOh8RTHE7cvEDUnvdEUx7KfyYNzuodiEd3yr0yLkjI3Iq2Tgv6S
         8iMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I7BY6Zcq9XcTFG0Efu7gJTSZE5NTVFX3CybfHRAtqtY=;
        b=sR4S8aI1eTIv1G7goJdDaQeZn7fSIOzQzPjx1+61ekvcVUzhdV18z1I0jHuSM8ll5L
         7cZhoPMoCfkJ9zZ3BVdhmBXSniwnpjlPVHlx0NeZEBnM3EjLUaOJeqJ7U2hok4QTwpsk
         /fZpzuS/NriJ1P43JNjzQqIY1TiU7I5AR/JVs4Pv75dtkP7kpQLV+JBnyLXeU/4QlQVs
         g6IX6GVzFahZMMjl8f7WtVz6+OGPzmbPgsaFWBbrY5UVFL1yNz/58NvB91gAa3lfyagk
         3Qg7JYJD/A970NxoA7YX8RumKY7URskk6hdO8zkazBplyK+4YfBBnhuMh/Zm+f9T1MKl
         SEPQ==
X-Gm-Message-State: APjAAAWgv7gDUCg/wmpunpIaoHOJbGwjl3NHJi/cyPkdo/hMRQsBBvhr
        rXCpGPL1t1NIT8mjVvhP6kal0Jf8sHPbPBBzWVNhmA==
X-Google-Smtp-Source: APXvYqzyx0bJdLaOoxD/m3x6xqpPQF57TiXxv/pys7PBdDRAXjsm1+KcpFNaAqUbxMNbAJJ7ANa4I+kOvw45zq9nDgs=
X-Received: by 2002:aa7:961b:: with SMTP id q27mr7136357pfg.23.1576114299143;
 Wed, 11 Dec 2019 17:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20191205093440.21824-1-sjpark@amazon.com> <20191205093831.22925-1-sjpark@amazon.com>
In-Reply-To: <20191205093831.22925-1-sjpark@amazon.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 11 Dec 2019 17:31:28 -0800
Message-ID: <CAFd5g45fBjcVV-ZTvYVOM=1sbdCnjQdcEs5KQ8cXz5JJUdoSrw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] kunit/kunit_tool_test: Test '--build_dir' option run
To:     SeongJae Park <sjpark@amazon.com>
Cc:     SeongJae Park <sj38.park@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, shuah <shuah@kernel.org>,
        SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 5, 2019 at 1:38 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> This commit adds kunit tool test for the '--build_dir' option.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Tested-by: Brendan Higgins <brendanhiggins@google.com>
