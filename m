Return-Path: <SRS0=PADw=3Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0BEC2D0DB
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jan 2020 11:33:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C489B22464
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jan 2020 11:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A9hPJ8Rt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbgA0LdE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jan 2020 06:33:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27052 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730086AbgA0LdD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jan 2020 06:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580124782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PlXx4GCmusHDyEhr1tc9UGO1kB0k8P75h0J2Af90Eb0=;
        b=A9hPJ8RtIVEC8gjkpIoWwyV7FkbDcO9J57D5P1KR1dL8vCv79pwW8bSNsT1zp5CK4VbY/Q
        H4eR15Ow2t54M1vOkJKRPL8cUGMbE0mA2NDljAhxZ4kBDLR6bCsD8bm1YMbJDNpbgMVsRg
        c4Os02fKk4XsMcgke5iJPFnLy1Whzao=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-etXsyQjHM262d3E4IHZdOA-1; Mon, 27 Jan 2020 06:33:01 -0500
X-MC-Unique: etXsyQjHM262d3E4IHZdOA-1
Received: by mail-ot1-f70.google.com with SMTP id 75so6002173otc.6
        for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2020 03:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PlXx4GCmusHDyEhr1tc9UGO1kB0k8P75h0J2Af90Eb0=;
        b=PlfzBHoNXydsC3uC3VttTR4xJnmHmEfKa0JWrAK+7/kcZMHaslqkzfaUNM28ee/GJk
         LP7W2byxcnsm5sqg5Y3CSx5RPhS55uHvWXLRDmN3uN13k1YMLhnuBaTLL3GWB/f7xia/
         bn8tDMzYXML4GEdfOq/hzyZCFSBGDDeeC+TCHf+D/iiFzSOnWDDm2dGUY/DsDSNffErF
         6ko/N37ditSSEjWrGrqbA5ck/ayts7oswjMHwO37iuQRXUFvONUJVKJOqc4QT3cyuVc9
         AEN4fEAXTDJ4H+7ipndYjpsZHplv7buTcepNoQ1o8PnagpDfK6I6zgABSMYYjEoWxD7y
         gd4g==
X-Gm-Message-State: APjAAAXurQP4I1vp9JnvPAl//WCV3yteQ2qkGx4dF3tS4rV6WHjRbQG+
        YZxIxZtpScmwWkaPg0ZLBL5HxzlZrMzD+83xFXDcHZZrcdfL2ypamwIAbKAcc/G0Z77vHHIZF87
        DTO5gm9H+6O/13WFFp3stZB+At5uuJwlBdpRh
X-Received: by 2002:a9d:53c4:: with SMTP id i4mr12833301oth.48.1580124780169;
        Mon, 27 Jan 2020 03:33:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqy2WCKL3TcEQWLEGBx1bgWgRFFUvo6KJVLgtkrNqpfuMHkeNAswCT3gA+Mrw2sEoru3XQgdgZuxdIpa/3I3A0I=
X-Received: by 2002:a9d:53c4:: with SMTP id i4mr12833293oth.48.1580124779964;
 Mon, 27 Jan 2020 03:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20200127101100.92588-1-ghalat@redhat.com> <063e702f-dc5f-b0ca-fe26-508a9f1e8e9a@I-love.SAKURA.ne.jp>
In-Reply-To: <063e702f-dc5f-b0ca-fe26-508a9f1e8e9a@I-love.SAKURA.ne.jp>
From:   Grzegorz Halat <ghalat@redhat.com>
Date:   Mon, 27 Jan 2020 12:32:48 +0100
Message-ID: <CAKbGCsfyiLfvwi1iYuTu2Gg5=TXQwUQ3iv73PdNvY8o_NZJ7aQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm: sysctl: add panic_on_mm_error sysctl
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Aaron Tomlin <atomlin@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Stan Saner <ssaner@redhat.com>,
        Oleksandr Natalenko <oleksandr@redhat.com>,
        Vratislav Bendel <vbendel@redhat.com>, kirill@shutemov.name,
        khlebnikov@yandex-team.ru, borntraeger@de.ibm.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Kees Cook <keescook@chromium.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 27 Jan 2020 at 11:43, Tetsuo Handa wrote:
>
> Maybe panic_on_inconsistent_mm is better, for an MM error sounds too generic
> (e.g. is page allocation failure an error, is OOM killer an error,
> is NULL pointer dereference an error, is use-after-free access an error) ?
>
yes, panic_on_inconsistent_mm is better

> Also, should this be in /proc/sys/vm/ than /proc/sys/kernel/ ?
Agreed

I will wait a day or two for more feedback and send V2 with sysctl
named as 'vm.panic_on_inconsistent_mm'.

Thanks,
--
Grzegorz Halat

