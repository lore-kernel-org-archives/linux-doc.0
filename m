Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC53EB64DA
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jun 2023 15:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbjF3PR1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jun 2023 11:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232504AbjF3PRF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 11:17:05 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978C644BD
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 08:16:24 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f9b9863bfdso110595e9.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 08:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688138180; x=1690730180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2hR/KhNASLMJVxFauqxU4XhDOn7bSDTmrq/J7vDv7o=;
        b=TRZxNMjM5RO1JNNZKgZOR5RH0Yv5C4Vn/RneOeTsb/05jK/UeLFCidNiyWhwyUaf5Z
         aupF/jUOf2e3MicdLXmgIL0Ub+YmBEQYQcerycEdzdn2KKJhfmpJqDh7CqFLInXofjtP
         OZXzw+wFgvv6XOU1YSmGEQm+w388OMDhu2eXlR8bp70x8p6OC91xXw3YwfrQggnC9IC9
         WmFbW3TVfFf9vavDHIWsGS928BqHQoqNa/G6UV10Fg8X3Rvaqzy7AQ9kLz3P4VzdQO/k
         0vQSKmKKQJj0qm7Il8kPYMhj/Z7nil2hqR6c2Dhfm315YIX3rNVztxyRHs4/o8MfQDR/
         HHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688138180; x=1690730180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2hR/KhNASLMJVxFauqxU4XhDOn7bSDTmrq/J7vDv7o=;
        b=j677Tj7D4buB8qOSdrmk8gRUr+DhmeYuCdoUycnwrm3K3sXJ74XM6QUhnYzkO18EEU
         EnlvgsQ+Rwp1gDr2tHLS//iUoUVgJlmdOxX4Suq87lhdHcQnq8cTuUD+eFY69//r1ESY
         fjnc156xzm+OA7xrRxjV3H2OPH4dHskFd1wHJFyEtCxlowcWyZB1SQF5CksXONjRn/Zp
         DSd8B4N7h6Jium65sNJxWdG47HMHH90QLza2/9PhIXi12xQYeek/+BN7Z5e3foZ6IZto
         C7Qisn7PMYI0C6pVfUtO0IR3uyw8vRj3qQ91cEk17NzD6ZuBYLuD2dDfqUu3rLrunIhh
         Dh2w==
X-Gm-Message-State: AC+VfDwO1QzwXd0NHFGFHoIyHEr3rVETIXbESUGSC3UBsNwzowGTOwmW
        LRi+5RLzHZrHVwfZFCeB2pQjDpR5oAykYFmiQjT9Rg==
X-Google-Smtp-Source: ACHHUZ57TDCyI6HuFq6itIHyiuswS8qTRk/Uhbs5B8NDAkYH9kZN6vimTj2ZxN5nJTEEDgvzPrpgVVsGwA9BMFbOTJU=
X-Received: by 2002:a05:600c:860c:b0:3f4:fb7:48d4 with SMTP id
 ha12-20020a05600c860c00b003f40fb748d4mr378270wmb.3.1688138180627; Fri, 30 Jun
 2023 08:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230630151003.3622786-1-matteorizzo@google.com> <20230630151003.3622786-2-matteorizzo@google.com>
In-Reply-To: <20230630151003.3622786-2-matteorizzo@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 30 Jun 2023 17:15:44 +0200
Message-ID: <CAG48ez3k2K1_gwxo=ckHQmHxXgV-VfQ897-TXQcJjUcdiyr4Hg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] io_uring: add a sysctl to disable io_uring system-wide
To:     Matteo Rizzo <matteorizzo@google.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        io-uring@vger.kernel.org, axboe@kernel.dk, asml.silence@gmail.com,
        corbet@lwn.net, akpm@linux-foundation.org, keescook@chromium.org,
        ribalda@chromium.org, rostedt@goodmis.org, chenhuacai@kernel.org,
        gpiccoli@igalia.com, ldufour@linux.ibm.com, evn@google.com,
        poprdi@google.com, jordyzomer@google.com, jmoyer@redhat.com,
        krisman@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 30, 2023 at 5:10=E2=80=AFPM Matteo Rizzo <matteorizzo@google.co=
m> wrote:
> Introduce a new sysctl (io_uring_disabled) which can be either 0, 1,
> or 2. When 0 (the default), all processes are allowed to create io_uring
> instances, which is the current behavior. When 1, all calls to
> io_uring_setup fail with -EPERM unless the calling process has
> CAP_SYS_ADMIN. When 2, calls to io_uring_setup fail with -EPERM
> regardless of privilege.
>
> Signed-off-by: Matteo Rizzo <matteorizzo@google.com>
> Reviewed-by: Jeff Moyer <jmoyer@redhat.com>
> Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

Reviewed-by: Jann Horn <jannh@google.com>
