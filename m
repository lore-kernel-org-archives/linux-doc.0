Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8C4CE7AA3
	for <linux-doc@archiver.kernel.org>; Mon, 25 Sep 2023 16:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232289AbjIYQhe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Sep 2023 12:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232303AbjIYQhb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Sep 2023 12:37:31 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6488BBE
        for <linux-doc@vger.kernel.org>; Mon, 25 Sep 2023 09:37:24 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-418157e979eso882331cf.1
        for <linux-doc@vger.kernel.org>; Mon, 25 Sep 2023 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695659843; x=1696264643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nw3qGH7/FH4+ugIgrXtTnsAMMytm41mtZb4PZdUTaRw=;
        b=deNy7dVMO/XkwcpI8t5Nl8gMWPlSH5qVSuO7TfyzQM4wuGFlUVj0NM4u9CILwvAUA7
         Z2bqcImSO60IEKCIQsMcbUPO1Q7Fe/F8OkN3sIjFjYTSHj26LjFS/IKaQx61GgQcQaJH
         Ya3r0JF6sUxgObPwWaKc36Sca4fQvxYo7tgupW203KxLGSB7l/2gxBiKMl9osEfyi4ZS
         jXysf8vyL71CrYhVeOhm/z9Fijbl6P5J+c7BuwEJz74bdhXy4m6KJvuGSWEv9CEDxEXe
         qU0pnI9vGKd3RzaBT3bDsDWjzagdjB7mcMgofKULHV5m8794rOnrz/rGrciBsnJSAlNB
         j/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695659843; x=1696264643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nw3qGH7/FH4+ugIgrXtTnsAMMytm41mtZb4PZdUTaRw=;
        b=HTFe6Mc94TV5i2wn9f+hv5fbEiRfSqRciD1wyxUcPROg/O+5NPKowV9uveqcicPi+M
         OoL6h2QU0VA1DVKB5VNxlLgJBBqjxB9pkIFD/5DPrMrzGaUq9hfjRs0umLYpH8n3G8tc
         IBjqA5CdXZLYV0IW2+8q3lzxcNaP2P6eDicYqudw13xidb+IEQdgOQXDE7iPfRCnGCmO
         8oa5dP1XSS4f6VYgJt9YAZ71MUAQAcE5Lwms8F+Z9gxBX1jPitpu16fUReoiS6isz15k
         KB3vwj+Gh7porX+ABCaVkMS1u/PrkDpspbVZVwqqMWCfaQDkzyz2qB9fu6oKV3vu3co2
         +Fmw==
X-Gm-Message-State: AOJu0YwZEsDrQsWYsjTJTxreE2m5pND/v7Xqc8jlcn4do0TlC8ofUx2o
        mEZjEgwgiQYnbytGyAnnBOtFXtvofhMwBnmX4MP2hA==
X-Google-Smtp-Source: AGHT+IEpFLyWgsAMelNpNzaMRYsI3j6SSl0z4t5xEdS9MXupyK7d8uiE37U+7R531wVcVXlZgpjczs5rfs2FdRJ9o6s=
X-Received: by 2002:a05:622a:1353:b0:403:aa88:cf7e with SMTP id
 w19-20020a05622a135300b00403aa88cf7emr307507qtk.29.1695659843315; Mon, 25 Sep
 2023 09:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <1695621444-56530-1-git-send-email-renyu.zj@linux.alibaba.com>
In-Reply-To: <1695621444-56530-1-git-send-email-renyu.zj@linux.alibaba.com>
From:   Ian Rogers <irogers@google.com>
Date:   Mon, 25 Sep 2023 09:37:08 -0700
Message-ID: <CAP-5=fWuaii1rOOvN7rJDo3UoQvkEtiJv3QiBhLRhYk1_Se7ew@mail.gmail.com>
Subject: Re: [PATCH v10 0/7] Add metrics for Arm CMN
To:     Jing Zhang <renyu.zj@linux.alibaba.com>
Cc:     John Garry <john.g.garry@oracle.com>,
        Will Deacon <will@kernel.org>,
        James Clark <james.clark@arm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
        Zhuo Song <zhuo.song@linux.alibaba.com>,
        Shuai Xue <xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 24, 2023 at 10:58=E2=80=AFPM Jing Zhang <renyu.zj@linux.alibaba=
.com> wrote:
>
> Changes since v8:
> - Add fully match identifier check as suggested by Ian.
> - Link: https://lore.kernel.org/lkml/1695037955-107983-1-git-send-email-r=
enyu.zj@linux.alibaba.com/
>
> Jing Zhang (7):
>   perf pmu: "Compat" supports regular expression matching identifiers
>   perf metric: "Compat" supports regular expression matching identifiers
>   perf jevents: Support EventidCode and NodeType
>   perf test: Make matching_pmu effective
>   perf test: Add pmu-event test for "Compat" and new event_field.
>   perf jevents: Add support for Arm CMN PMU aliasing
>   perf vendor events: Add JSON metrics for Arm CMN

Thanks for the patience with all the to and fro. I was able to test
the series with "git am -3" to get around a merge issue on
perf-tools-next.

Reviewed-by: Ian Rogers <irogers@google.com>
Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>  .../pmu-events/arch/arm64/arm/cmn/sys/cmn.json     | 266 +++++++++++++++=
++++++
>  .../pmu-events/arch/arm64/arm/cmn/sys/metric.json  |  74 ++++++
>  .../pmu-events/arch/test/test_soc/sys/uncore.json  |   8 +
>  tools/perf/pmu-events/empty-pmu-events.c           |   8 +
>  tools/perf/pmu-events/jevents.py                   |  11 +-
>  tools/perf/tests/pmu-events.c                      |  65 ++++-
>  tools/perf/util/metricgroup.c                      |   2 +-
>  tools/perf/util/pmu.c                              |  27 ++-
>  tools/perf/util/pmu.h                              |   1 +
>  9 files changed, 456 insertions(+), 6 deletions(-)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cmn/sys/metric.j=
son
>
> --
> 1.8.3.1
>
