Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A048EB64D9
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jun 2023 08:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbjFOI0o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Jun 2023 04:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243449AbjFOIYz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Jun 2023 04:24:55 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19BF1BF8
        for <linux-doc@vger.kernel.org>; Thu, 15 Jun 2023 01:24:53 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b448470602so2705781fa.2
        for <linux-doc@vger.kernel.org>; Thu, 15 Jun 2023 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1686817492; x=1689409492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TO/9bQchmvWU5XsZ6PVSrKCC9iEyDaJ7fBfesY7nUXo=;
        b=FHIIfDdJcAOiiR4LbSL4/uGAdi7niaXDloG0VoBSjXwwGpoL4MfrwpXKJhGzPQwucE
         dOdvEIxRl+k6G2Hh2lXO8KWmw7BZwrfanEepuJFlHhgMixev0/FEqtjq051lycVOa9ab
         XGqysDrQA2Sx0DQo8Y41Vi1CNyTAhFB+HJMdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686817492; x=1689409492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TO/9bQchmvWU5XsZ6PVSrKCC9iEyDaJ7fBfesY7nUXo=;
        b=FKzvrM75oFVHNKGPyv9Prn1RKsBdPW3yQZ4jInGYN+MRcKyqdA6zl+28mOw0dCIZzP
         cSCyBrGEgFYi7raOe+PUk23nW+h8kYBhoScB1+NFa+04Y9v5wJWoa5+77pf1IqrLeeHy
         1VXOyg+0b4hixm+76pqNUun9FWdJNZ8gqiHuX9mMFbsqzsjPsTKdphtR6LvuzKwGCVIW
         k5prA6IVFzQc9B9mpKgHbanhTNaWsACi7/s5oeIbxn5gJT8y2GcWepaAejK+2ntxyZdt
         by859IR8QPqhFpukk3TblMDj97n480FD8vkZAgSneQreKb5T15/1t8pYbWpcB+X8UblA
         3XJg==
X-Gm-Message-State: AC+VfDyM1g4UzgwowuatSBYOz/zCfPBWjbPhdMMqToxIvXquzUMLZIfs
        Flg3/DMyjN2O6cLWRs8fVgdM/ltEtn7xAc6hgWLq
X-Google-Smtp-Source: ACHHUZ58CLSQF6iLpuxgFB1R71m1T7/aC/04CVGgkmQPECwvn6JLMHS3x0PLLr7WuPja8wAD1MVhHvQNld8wIM4pSkM=
X-Received: by 2002:a2e:a165:0:b0:2b1:e369:f98 with SMTP id
 u5-20020a2ea165000000b002b1e3690f98mr8402105ljl.11.1686817491842; Thu, 15 Jun
 2023 01:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-2-alexghiti@rivosinc.com> <20230531-5678beb107af4b9805cbb611@orel>
 <84626c83-8806-d807-a7bf-b497f70e56fd@ghiti.fr>
In-Reply-To: <84626c83-8806-d807-a7bf-b497f70e56fd@ghiti.fr>
From:   Atish Patra <atishp@atishpatra.org>
Date:   Thu, 15 Jun 2023 01:24:40 -0700
Message-ID: <CAOnJCU+rhbFY6DaA508E6KFaa4VoEWiHOFpZnsjiqTwEdTVGEg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] perf: Fix wrong comment about default event_idx
To:     Alexandre Ghiti <alex@ghiti.fr>
Cc:     Andrew Jones <ajones@ventanamicro.com>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 15, 2023 at 12:10=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wr=
ote:
>
>
> On 31/05/2023 15:54, Andrew Jones wrote:
> > On Fri, May 12, 2023 at 10:53:12AM +0200, Alexandre Ghiti wrote:
> >> event_idx default implementation returns 0, not idx + 1.
> > The comment was correct until commit c719f56092ad ("perf: Fix and clean
> > up initialization of pmu::event_idx"). I'm not sure that warrants a fix=
es
> > tag, but maybe a reference in the commit message.
>
>
> You're right, I'll add a reference, I don't think it deserves a
> backport, that's just a comment.
>
>

With that done:

Reviewed-by: Atish Patra <atishp@rivosinc.com>

> >> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> >> ---
> >>   include/linux/perf_event.h | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> >> index d5628a7b5eaa..56fe43b20966 100644
> >> --- a/include/linux/perf_event.h
> >> +++ b/include/linux/perf_event.h
> >> @@ -442,7 +442,8 @@ struct pmu {
> >>
> >>      /*
> >>       * Will return the value for perf_event_mmap_page::index for this=
 event,
> >> -     * if no implementation is provided it will default to: event->hw=
.idx + 1.
> >> +     * if no implementation is provided it will default to 0 (see
> >> +     * perf_event_idx_default).
> >>       */
> >>      int (*event_idx)                (struct perf_event *event); /*opt=
ional */
> >>
> >> --
> >> 2.37.2
> >>
> > Otherwise,
> >
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
>
> Thanks!
>


--=20
Regards,
Atish
