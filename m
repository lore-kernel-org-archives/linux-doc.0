Return-Path: <SRS0=pZ1j=DC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BFAC4741F
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 08:22:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA573208B6
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 08:22:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yTnQ4SV+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbgIYIWG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 04:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbgIYIWF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 04:22:05 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6263AC0613D3
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 01:22:05 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id v5so648601uau.10
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 01:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WvDyteRu76pYPa4UAHUwSYLYJxuuyxc2Dt1PKdTqcpM=;
        b=yTnQ4SV+hkPVxsQOZuljNgG+ll2vkUcmkTeES9wkAB2E6MwbdALDRKC5/qErzxHexZ
         70H9PmgMHqXNxxZIIjZGiKvr2WozB4tuEMjUho6Xp9AT5Y/zRF5qQCJ7qulTMbtogqoz
         isGEDVKW+sgSMRbs/PJV8waGVvK8XpmEIRI8gm1t6JTpicOBLWftuIWzMlMzjmw16tyt
         BVKhk9gLbpJPVej+XcRMQlOxXCM3ZqVob/MbQz+/+hQPeKos8VHuZTutglw2wY5TUFq5
         PxGaWlGgp7KiDuOq18dRuA6kjn9PGg9ur8FI/N4bggCtUJXjvo2hGb7IFjVa1fGufd3F
         IYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WvDyteRu76pYPa4UAHUwSYLYJxuuyxc2Dt1PKdTqcpM=;
        b=S3PbT9eRuddodHs1jkG2JzEhKJRps1Qiozfhv+VcCk3b2Cy97l3iRywS4DrRuJjfsC
         1kWIiyVz5RxzPApp8rysbHA7Ewv8cMMA3P7rnKfy+pjWY1Q8GZtf2pThKjRB/WBLSZrZ
         K12ncxcqlYLQes3qihbyjbK/2K96L/hBfqY6+eOQN6JMmKn/z04fvIQsTUMdHWXTeE3a
         51GbrhoYsUXs6vLnPamEqeKqS74PkazNQgbHgjgLCED9xbOjzIwl6j4VyQRP78Syj2TL
         3i+hvnuPNTs7DwgN8jaQFVM5EhATRg3ykazHq/bSAMCnKVGnrl3XR5nIVf/jdD6bfGgQ
         DOfQ==
X-Gm-Message-State: AOAM533FU5lGPVLHXnjwWrMqdj29nLcPwLptUmGmadF/lXUTJOvxRN0z
        XQFQ9IKRQB1tSpxPpk7ISYl0MqTf+2j8IhE1+VIqug==
X-Google-Smtp-Source: ABdhPJzLpE+AUK3XJTcofgSAmKvjhVK7+3tvguttC5HmiCpeMiYmNklBnlRfzt2LXLjnlt0nX+EaErShGSTZoNR/zHY=
X-Received: by 2002:ab0:1450:: with SMTP id c16mr1693683uae.27.1601022124294;
 Fri, 25 Sep 2020 01:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200914021758.420874-1-liuhangbin@gmail.com/> <20200914022227.437143-1-liuhangbin@gmail.com>
In-Reply-To: <20200914022227.437143-1-liuhangbin@gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 25 Sep 2020 13:51:53 +0530
Message-ID: <CA+G9fYvT6Mw2BamoiVyw=wLUqD-3LB2oaDqcuabOyWfFxEN1qg@mail.gmail.com>
Subject: Re: [PATCHv5 kselftest next] selftests/run_kselftest.sh: make each
 test individually selectable
To:     Hangbin Liu <liuhangbin@gmail.com>
Cc:     "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, Tim.Bird@sony.com,
        lkft-triage@lists.linaro.org, Kees Cook <keescook@chromium.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 Sep 2020 at 07:53, Hangbin Liu <liuhangbin@gmail.com> wrote:
>
> Currently, after generating run_kselftest.sh, there is no way to choose
> which test we could run. All the tests are listed together and we have
> to run all every time. This patch enhanced the run_kselftest.sh to make
> the tests individually selectable. e.g.
>
>   $ ./run_kselftest.sh -t "bpf size timers"

My test run break on linux next

./run_kselftest.sh: line 1331: syntax error near unexpected token `)'
./run_kselftest.sh: line 1331: `-e -s | --summary )
logfile=$BASE_DIR/output.log; cat /dev/null > $logfile; shift ;;'

steps do run:
# run_kselftest.sh file generated by kselftest Makefile and included in tarball
./run_kselftest.sh 2>&1 | tee "${LOGFILE}"

ref:
https://github.com/nareshkamboju/test-definitions/blob/master/automated/linux/kselftest/kselftest.sh#L222

full test run log:
https://lkft.validation.linaro.org/scheduler/job/1786826#L1391

>
> Before the patch:
> ================
>
> $ cat run_kselftest.sh
> \#!/bin/sh
> BASE_DIR=$(realpath $(dirname $0))
> cd $BASE_DIR
> . ./kselftest/runner.sh
> ROOT=$PWD
> if [ "$1" = "--summary" ]; then
>   logfile=$BASE_DIR/output.log
>   cat /dev/null > $logfile
> fi
> [ -w /dev/kmsg ] && echo "kselftest: Running tests in android" >> /dev/kmsg
> cd android
> run_many        \
>         "run.sh"
> cd $ROOT
> ...<snip>...
> [ -w /dev/kmsg ] && echo "kselftest: Running tests in zram" >> /dev/kmsg
> cd zram
> run_many        \
>         "zram.sh"
> cd $ROOT
>
> After the patch:
> ===============
>
> $ cat run_kselftest.sh
> \#!/bin/sh
> BASE_DIR=$(realpath $(dirname $0))
> . ./kselftest/runner.sh
> TESTS="android ...<snip>... filesystems/binderfs ...<snip>... zram"
>
> run_android()
> {
>         [ -w /dev/kmsg ] && echo "kselftest: Running tests in android" >> /dev/kmsg
>         cd android
>         run_many        \
>                 "run.sh"
>         cd $ROOT
> }
>
> ...<snip>...
>
> run_filesystems_binderfs()
> {
>         [ -w /dev/kmsg ] && echo "kselftest: Running tests in filesystems/binderfs" >> /dev/kmsg
>         cd filesystems/binderfs
>         run_many        \
>                 "binderfs_test"
>         cd $ROOT
> }
>
> ...<snip>...
>
> run_zram()
> {
>         [ -w /dev/kmsg ] && echo "kselftest: Running tests in zram" >> /dev/kmsg
>         cd zram
>         run_many        \
>                 "zram.sh"
>         cd $ROOT
> }
>
> usage()
> {
>         cat <<EOF
> usage: ${0##*/} OPTS
>         -s | --summary          Only print summary info and put detailed log in output.log
>         -t | --tests            Test name you want to run specifically
>         -h | --help             Show this usage info
> EOF
> }
>
> while true; do
>         case "$1" in
>         -s | --summary ) logfile=$BASE_DIR/output.log; cat /dev/null > $logfile; shift ;;
>         -t | --tests ) TESTS=$2; shift 2 ;;
>         -l | --list ) echo $TESTS; exit 0 ;;
>         -h | --help ) usage; exit 0 ;;
>         "" ) break;;
>         * ) usage; exit 1;;
>         esac
> done
>
> cd $BASE_DIR
> ROOT=$PWD
> for folder in $TESTS; do
>         folder=$(echo $folder | tr -s '/-' '_')
>         run_$folder
> done
>
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

-- 
Linaro LKFT
https://lkft.linaro.org
