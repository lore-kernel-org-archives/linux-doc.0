Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D57CA0EC8
	for <linux-doc@archiver.kernel.org>; Mon, 11 Sep 2023 23:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343739AbjIKVMZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Sep 2023 17:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243702AbjIKRcn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Sep 2023 13:32:43 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47AE9125
        for <linux-doc@vger.kernel.org>; Mon, 11 Sep 2023 10:32:38 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-414ba610766so25551cf.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Sep 2023 10:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694453557; x=1695058357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS06nh80KVOxCFrHKBzqbQxcQAoLQCJ5U5egzLZgpvg=;
        b=hSh0fiY+s1CC1IB4r862zcw/5DKCCf85AF480c8QKu0+YQtUfbDhL9wtVNaGdsLrZ0
         Dowx21XZhq7KtUJhltvrCrkMqh8ks2bdvnrnNeXY+xKSMB90Eqxl8xsqYTxYgfd/W4A2
         JGKqLsTlaAqzAXIWlK9C2flf6D7sMqEwt4iYivr6eRoDV5DmykkPAuIE92svGUjd9l1b
         /4wg4V8J/zytPe3CXrowh5nmtVELwtnFQIrPKzkOFF/C2ruemP2xofL4EXDxLSuaHsNG
         1PJoGrF3t0M/3Q509sPpClbFwoIMVNJwnhCDNuX5Zu4f/1gJfq8xshpYMpcxUTn7UBKd
         xP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694453557; x=1695058357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vS06nh80KVOxCFrHKBzqbQxcQAoLQCJ5U5egzLZgpvg=;
        b=OWb3INc8H3CFURr0dF0P/ZenlSwQzRxYPwsRhAV5N+o2dmYhsFYfDM5FRAYt5kPqR4
         0nIvHwC/RUCC3sHk6uUFQvGI8NSSvH0oFsNRzJ9QAnRZJNj8/M7fQVVXiyF2Qo3pSi1h
         ZXxeZfDCpRI25/VvPOm2Fe5jrl1P4Jvlkjo/ukqlEZZHc7FeLw/6Y4Dr1b2O5Rzh0FQ5
         21CyVU/pyIyeADj59BaJUGefy5NmzClMi8+cxiFGcppnyghI8fxapswSim/9JlM4Gio1
         Uq6pdAnzH8BMldb6tzNLkdAveHGCCvWQOpUk5rMWuN/LrqAeJL9qoO0uL1dA79KCGLJe
         ebSg==
X-Gm-Message-State: AOJu0YzShhNGoqDhaFZzHpHYwEdyiQq7Sj6MngSHdNs8mGZA52Q2BoaN
        vn+tfoYC1k2iJ+C5LS5GEaMp2yiEHiU6JnNukpBzug==
X-Google-Smtp-Source: AGHT+IFB8vpoAIVESpU9czT1w5x6NETkoKez+IqbAgOCvDM9Mj42QoUPaJWihBoHkb7DhpDrqULeeeUau23CM5Xzwdo=
X-Received: by 2002:a05:622a:13ce:b0:412:16f:c44f with SMTP id
 p14-20020a05622a13ce00b00412016fc44fmr26090qtk.6.1694453557215; Mon, 11 Sep
 2023 10:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <1694087913-46144-1-git-send-email-renyu.zj@linux.alibaba.com>
 <1694087913-46144-2-git-send-email-renyu.zj@linux.alibaba.com>
 <CAP-5=fVWcQrqLeuc-k4HRNrNdb_=9CbqTSOAX=HDR7f=j8b0Hg@mail.gmail.com> <8bab7404-8e24-8606-558c-db3495429f2f@linux.alibaba.com>
In-Reply-To: <8bab7404-8e24-8606-558c-db3495429f2f@linux.alibaba.com>
From:   Ian Rogers <irogers@google.com>
Date:   Mon, 11 Sep 2023 10:32:25 -0700
Message-ID: <CAP-5=fU4jWHnbt8BirMZHa7cuLhkAAMAfD28AdRc23zx-e3EyQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] perf pmu: "Compat" supports matching multiple identifiers
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

On Sun, Sep 10, 2023 at 7:32=E2=80=AFPM Jing Zhang <renyu.zj@linux.alibaba.=
com> wrote:
>
>
>
> =E5=9C=A8 2023/9/9 =E4=B8=8A=E5=8D=885:33, Ian Rogers =E5=86=99=E9=81=93:
> > On Thu, Sep 7, 2023 at 4:58=E2=80=AFAM Jing Zhang <renyu.zj@linux.aliba=
ba.com> wrote:
> >>
> >> The jevent "Compat" is used for uncore PMU alias or metric definitions=
.
> >>
> >> The same PMU driver has different PMU identifiers due to different
> >> hardware versions and types, but they may have some common PMU event.
> >> Since a Compat value can only match one identifier, when adding the
> >> same event alias to PMUs with different identifiers, each identifier
> >> needs to be defined once, which is not streamlined enough.
> >>
> >> So let "Compat" supports matching multiple identifiers for uncore PMU
> >> alias. For example, the Compat value {43401;436*} can match the PMU
> >> identifier "43401", that is, CMN600_r0p0, and the PMU identifier with
> >> the prefix "436", that is, all CMN650, where "*" is a wildcard.
> >> Tokens in Unit field are delimited by ';' with no spaces.
> >>
> >> Signed-off-by: Jing Zhang <renyu.zj@linux.alibaba.com>
> >> Reviewed-by: John Garry <john.g.garry@oracle.com>
> >> ---
> >>  tools/perf/util/pmu.c | 28 ++++++++++++++++++++++++++--
> >>  tools/perf/util/pmu.h |  1 +
> >>  2 files changed, 27 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> >> index e215985..c3c3818 100644
> >> --- a/tools/perf/util/pmu.c
> >> +++ b/tools/perf/util/pmu.c
> >> @@ -875,6 +875,30 @@ static bool pmu_uncore_alias_match(const char *pm=
u_name, const char *name)
> >>         return res;
> >>  }
> >>
> >> +bool pmu_uncore_identifier_match(const char *id, const char *compat)
> >> +{
> >> +       char *tmp =3D NULL, *tok, *str;
> >> +       bool res =3D false;
> >> +
> >> +       /*
> >> +        * The strdup() call is necessary here because "compat" is a c=
onst str*
> >> +        * type and cannot be used as an argument to strtok_r().
> >> +        */
> >> +       str =3D strdup(compat);
> >> +       if (!str)
> >> +               return false;
> >> +
> >> +       tok =3D strtok_r(str, ";", &tmp);
> >
> > Did the comma vs semicolon difference get explained? It seems to add
> > inconsistency to use a semicolon.
> >
>
> Hi Ian,
>
> Yes, I explained the reason for using semicolons instead of commas in v7.
>
> I use a semicolon instead of a comma because I want to distinguish it fro=
m the function
> of the comma in "Unit" and avoid confusion between the use of commas in "=
Unit" and "Compat".
> Because in Unit, commas act as wildcards, and in =E2=80=9CCompat=E2=80=9D=
, the semicolon means =E2=80=9Cor=E2=80=9D. So
> I think semicolons are more appropriate.
>
> John also raised this issue earlier, and we finally agreed to use semicol=
ons.
> What do you think?

I'm okay with it, but thanks for capturing the why of this. I'd like
at some point to make the wildcarding of things less ad hoc. For
example, on x86 we use regular expressions to match cpuid:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/pmu-events/arch/x86/mapfile.csv?h=3Dperf-tools-next
but file name style matching for pmus:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/pmu.c?h=3Dperf-tools-next#n1974
Given that we're okay with regular expressions then I don't see why
everything shouldn't be a regular expression. This could, for example,
make matching PMUs more specific than just adding a star and doing a
file name match. For an example of why this is weird, on my laptop:
```
$ perf stat -e i/actual-frequency/ true

Performance counter stats for 'system wide':

                0      i/actual-frequency/

      0.001168195 seconds time elapsed
```
The PMU I used here as 'i' is /sys/devices/i915 as we allow arbitrary
numbers after a PMU name for cases of multiple uncore PMUs.

My feeling longer term is that the matching distinction of Unit and
Compat, comma and semi-colon, would be better captured with regular
expressions as I think they show the intent in the matching more
clearly.

Thanks,
Ian


> Thanks,
> Jing
>
> > Thanks,
> > Ian
> >
> >> +       for (; tok; tok =3D strtok_r(NULL, ";", &tmp)) {
> >> +               if (!fnmatch(tok, id, FNM_CASEFOLD)) {
> >> +                       res =3D true;
> >> +                       break;
> >> +               }
> >> +       }
> >> +       free(str);
> >> +       return res;
> >> +}
> >> +
> >>  static int pmu_add_cpu_aliases_map_callback(const struct pmu_event *p=
e,
> >>                                         const struct pmu_events_table =
*table __maybe_unused,
> >>                                         void *vdata)
> >> @@ -915,8 +939,8 @@ static int pmu_add_sys_aliases_iter_fn(const struc=
t pmu_event *pe,
> >>         if (!pe->compat || !pe->pmu)
> >>                 return 0;
> >>
> >> -       if (!strcmp(pmu->id, pe->compat) &&
> >> -           pmu_uncore_alias_match(pe->pmu, pmu->name)) {
> >> +       if (pmu_uncore_alias_match(pe->pmu, pmu->name) &&
> >> +                       pmu_uncore_identifier_match(pmu->id, pe->compa=
t)) {
> >>                 perf_pmu__new_alias(pmu,
> >>                                 pe->name,
> >>                                 pe->desc,
> >> diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
> >> index bd5d804..1bf5cf1 100644
> >> --- a/tools/perf/util/pmu.h
> >> +++ b/tools/perf/util/pmu.h
> >> @@ -240,6 +240,7 @@ void pmu_add_cpu_aliases_table(struct perf_pmu *pm=
u,
> >>  char *perf_pmu__getcpuid(struct perf_pmu *pmu);
> >>  const struct pmu_events_table *pmu_events_table__find(void);
> >>  const struct pmu_metrics_table *pmu_metrics_table__find(void);
> >> +bool pmu_uncore_identifier_match(const char *id, const char *compat);
> >>
> >>  int perf_pmu__convert_scale(const char *scale, char **end, double *sv=
al);
> >>
> >> --
> >> 1.8.3.1
> >>
