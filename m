Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C09C76196
	for <linux-doc@archiver.kernel.org>; Tue, 28 Mar 2023 21:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjC1VI5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Mar 2023 17:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjC1VIz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Mar 2023 17:08:55 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF512107
        for <linux-doc@vger.kernel.org>; Tue, 28 Mar 2023 14:08:51 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5456249756bso255052327b3.5
        for <linux-doc@vger.kernel.org>; Tue, 28 Mar 2023 14:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680037730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjM/ZqYn/T7unhyITZnKsFzK8c16l02nzfEEL176xOU=;
        b=ocoA87DNTSkmHztT5vnke6BiFUYBXc6/lZxINhcigUkk0S1CcjEXgStw7e9Zp88jv+
         i89diJ/hJM1JqzrRRVhBca1mfW48YWKNSscl5VxNxl/D8BuvFLHWAN4JwAYSOtJsAnvU
         /hLRstVR0H2yntq3lWpDGRwmwcMZGwMsqstB4dAb+RrozEc4vmQ5viXaNAHQbq7tKKtp
         bsDDdWbOfanraXHIIKTb/3e2+ED5o30OM1egoRKfHSontwTNP2Ocq5mm+XuTmXg9cwR+
         7CfkIF9F9SFfzSbUPIN0ev0xFztzmGXuEfR7BLx+g6u52KVj0QwddYgJTyOOUy8WqtJ7
         MRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680037730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjM/ZqYn/T7unhyITZnKsFzK8c16l02nzfEEL176xOU=;
        b=JQ6EI/lGQjmzmbeBS17geykpUxvmN1vW1CG9od21N2zLMwzuDOFjpPXb5AvxUn4JXf
         bfzLFsiK2m5xcPK4CEcHZQPlWz7bdtxfpfSrCADRC6IBFczU661S7ntahd1TiHOUaAmI
         DQvGtsyPDU50Keun+Bpnh+HSKVedRMx6F/uyQl7MpvRMPqUZEn+igKH973cGu4XKo7Si
         viFQp3D8cyqEz7Uwuy3+XXpLjfCWQAlv9jvDg2dFlDnwCxW9LVCeFH+nfQwvKaRmwhpi
         3ATxrfoseoHxSiyaBeHx1Qmv5GeTRMp+80ikXrVT/JFGizPSAurqYDVXvDo/3//x3zsB
         9QoA==
X-Gm-Message-State: AAQBX9fiJD/5VJvsNUO3qP7Wejz3Pl7iSOHJjOIjNlFK4scA5YwTYNq4
        vYTk4ewsflVmefZuucKOjV/EvexksP0Lq8OeRUDHIw==
X-Google-Smtp-Source: AKy350ZLcUn0YW0dPW8RrTZpH1OlJLUgV7pk23eKHtHIEBdLUfe+SXlC99rlPRcKPdL9i7z5gyFajqvtscRGyxF3v54=
X-Received: by 2002:a81:a908:0:b0:545:7164:49ac with SMTP id
 g8-20020a81a908000000b00545716449acmr7922856ywh.5.1680037730422; Tue, 28 Mar
 2023 14:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230316225915.494688-1-rmoar@google.com> <CAGS_qxp2u3F4abmYgN+XwCG8CJN37NSqWSC===SWLCjZG8HYBw@mail.gmail.com>
In-Reply-To: <CAGS_qxp2u3F4abmYgN+XwCG8CJN37NSqWSC===SWLCjZG8HYBw@mail.gmail.com>
From:   Rae Moar <rmoar@google.com>
Date:   Tue, 28 Mar 2023 17:08:38 -0400
Message-ID: <CA+GJov4F+Vjw2gFj=YTYEoZ5wmy774xE5+aDQv55BKQE3VZo1g@mail.gmail.com>
Subject: Re: [KTAP V2 PATCH] ktap_v2: add recognized test name line
To:     Daniel Latypov <dlatypov@google.com>
Cc:     frowand.list@gmail.com, davidgow@google.com,
        skhan@linuxfoundation.org, keescook@chromium.org,
        Tim.Bird@sony.com, brendanhiggins@google.com, corbet@lwn.net,
        guillaume.tucker@collabora.com, kernelci@lists.linux.dev,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 20, 2023 at 3:21=E2=80=AFPM 'Daniel Latypov' via KUnit Developm=
ent
<kunit-dev@googlegroups.com> wrote:
>
> On Thu, Mar 16, 2023 at 3:59=E2=80=AFPM Rae Moar <rmoar@google.com> wrote=
:
> >
> > Add recognition of the test name line ("# Subtest: <name>") to the KTAP=
 v2
> > spec.
> >
> > The purpose of this line is to declare the name of a test before its
> > results. This functionality is especially useful when trying to parse t=
est
> > results incrementally and when interpretting results after a crash.
> >
> > This line is already compliant with KTAP v1 as it is interpretted as a
>
> minor nit for if there's a v2, s/interprett/interpret (here and above)
>

Oops. Thanks for catching this. I will change this for a v2. Unsure
why I repeated the typo twice.

> Also, I want to elaborate on the previous paragraph a bit more, in
> case the motivation isn't clear.
> The problem with TAP and KTAP as-is is that the name of a test case is
> only known *after* it completes.
>
> So the scenario being referred to is
>
> KTAP version 1
> 1..1
> <lots of output>
> <kernel crash, no more output>
>
> It would be nice if parsers could report "test FOO caused a crash" as
> opposed to "the first test case caused a crash, good luck figuring out
> which one that was"
>

Yes, this is exactly what I think is the largest benefit of a line to
define the test name pre-results. Thanks for expanding. I will likely
add in some of this explanation into the commit message for v2.

Thanks,

Rae

> Daniel
>
> --
> You received this message because you are subscribed to the Google Groups=
 "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kunit-dev/CAGS_qxp2u3F4abmYgN%2BXwCG8CJN37NSqWSC%3D%3D%3DSWLCjZG8HYBw%40m=
ail.gmail.com.
