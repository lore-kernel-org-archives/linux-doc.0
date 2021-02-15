Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0707CC4332D
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 17:28:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D382064DDA
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 17:28:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhBOR2d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 12:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbhBOR0v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 12:26:51 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8523EC0613D6
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 09:26:10 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id ba1so4101940plb.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 09:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=u+yHhIeIahuXa0KrdCcyELg7Tr1BsbhdoZD531X3K7w=;
        b=Z9svKyxLrRcQmrIEdctjeKBcO4Q9FGN+3auDRK+SQdqSYRyZ99VO+fhmJo8fjkB0nm
         NhQiB/+aaJHvV1cA/BywhCGy+wIewDGYeOQ276tlPlq4TMNvZx8lkh3tgvYM+vGgvpUJ
         l3K+LnuA/Fxpbft3s4+erqvhcO6ir8gzicJRPdN3KeEYWxqqRuAlUzZlaEnFUqjX3FRW
         HUYxOspyOOfxNe6fAet7PX5nBhJCRMR2YSjBUoVcDx4/BTBFb8WfjZEvTFHk20r9Ri3g
         Ba2a42Ljbt2W1/m4e3Qs0xT43ClkQax5wVTusNdtCS4smZZFQpzfWltqko6o/oZXaDRB
         6F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=u+yHhIeIahuXa0KrdCcyELg7Tr1BsbhdoZD531X3K7w=;
        b=bQDAiMGkttRqvzyoOu3uLxCQfKUAJIwd95CNWf68N4gy/UPlTmwIwkPUGaJeHhNklB
         xRUwzgzFqD5m8tieKmuqyrlANPZAJebLOdTUJT6L6F84Memn2vXZlPlfnZjaix/KzIiH
         X6ZqtZXmrzfqZHbvlJLfYCQQ9s+rqLMfj33n50dosXkuzx6P6EHdt7muwl067fVPO/aA
         o0e0lOxoNXqNWOl9vMUC8+e/2xBKJCioEDgXK8Em6YCeX9/GqhuX3PwIrZKK+OtjPKOp
         v1zCsfIjw6ABUMd6+uSiJiuvPCsiBhZheGxEn9JbQ8ecqyjO5uHpGofspUjT5Szn7HH3
         Qt9Q==
X-Gm-Message-State: AOAM533QbFkgKJr5EFOmTCjC6cVVpJFBu5ZeIn00QEFfqqEYJG+Q/qGv
        tQTelc7xqDXVQ4au0zUDx4k=
X-Google-Smtp-Source: ABdhPJxMu//xCfx+BWXi5wjqi4hd0ZKOBVteyMp74mQkRpLIUAaDhyOetqKHJbIX1NG6yuzMpxTa8A==
X-Received: by 2002:a17:90a:5d16:: with SMTP id s22mr16979443pji.219.1613409969896;
        Mon, 15 Feb 2021 09:26:09 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:ec90:74f5:7e8e:5589? ([2405:201:600d:a089:ec90:74f5:7e8e:5589])
        by smtp.gmail.com with ESMTPSA id w145sm5744498pfc.187.2021.02.15.09.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 09:26:09 -0800 (PST)
To:     corbet@lwn.net
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        yashsri421@gmail.com
From:   Aditya <yashsri421@gmail.com>
Subject: Issues with kernel-doc
Message-ID: <5d519211-987e-3367-2ce9-9d1300445bc4@gmail.com>
Date:   Mon, 15 Feb 2021 22:56:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan

I and Lukas have been using scripts/kernel-doc lately, and we have
noticed a few issues with the script.

Also, I have generated a detailed report of warnings and errors caused
by running kernel-doc -none on entire kernel tree. It can be found at:

Complete report:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/report.txt

Since this report is very large, I shortened it in less-common warning
and no warning versions of the report as well.

No warning:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/error_report.txt

Less common warnings:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/reduced_report.txt

These are the few issues that we noticed with the script:

Running kernel-doc on gcov/gcc_4_7.c,
"scripts/kernel-doc -none kernel/gcov/gcc_4_7.c", caused this error:

Use of uninitialized value $param in regexp compilation at
./scripts/kernel-doc line 1559, <IN_FILE> line 95.
Use of uninitialized value $actual in substitution (s///) at
./scripts/kernel-doc line 1523, <IN_FILE> line 95.
Use of uninitialized value $actual in substitution (s///) at
./scripts/kernel-doc line 1523, <IN_FILE> line 95.
Use of uninitialized value $param in substitution (s///) at
./scripts/kernel-doc line 1617, <IN_FILE> line 95.
Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1651, <IN_FILE> line 95.
Use of uninitialized value $param in pattern match (m//) at
./scripts/kernel-doc line 1651, <IN_FILE> line 95.
Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1652, <IN_FILE> line 95.
Use of uninitialized value $param in pattern match (m//) at
./scripts/kernel-doc line 1654, <IN_FILE> line 95.
Use of uninitialized value $param in concatenation (.) or string at
./scripts/kernel-doc line 1655, <IN_FILE> line 95.
Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1672, <IN_FILE> line 95.

In my investigation, I found that this occurs because of this
parameter in struct gcov_info:
"void (*merge[GCOV_COUNTERS])(gcov_type *, unsigned int)"

Here, regex match at Line 1556 in kernel-doc ($arg =~
m/[^\(]+\(\*?\s*([\w\.]*)\s*\)/;) was supposed to capture
"*merge[GCOV_COUNTERS]" as $param, but the regex does not take into
account the presence of square brackets, thus causing the error.

Similarly, running kernel-doc on include/linux/zstd.h, caused this error:
include/linux/zstd.h:153: error: Cannot parse struct or union!
include/linux/zstd.h:170: error: Cannot parse struct or union!
include/linux/zstd.h:180: error: Cannot parse struct or union!
include/linux/zstd.h:230: error: Cannot parse struct or union!
include/linux/zstd.h:273: error: Cannot parse struct or union!
include/linux/zstd.h:365: error: Cannot parse struct or union!
include/linux/zstd.h:421: error: Cannot parse struct or union!
include/linux/zstd.h:537: error: Cannot parse struct or union!
include/linux/zstd.h:682: error: Cannot parse struct or union!
include/linux/zstd.h:935: error: Cannot parse struct or union!

Certain struct definitions present in the file do not follow
the expected format for parsing. (struct struct_name)
For eg. for "struct ZSTD_compressionParameters", it is defined with
the help of typedef syntax, ie
typedef struct {
        unsigned int windowLog;
        unsigned int chainLog;
        unsigned int hashLog;
        unsigned int searchLog;
        unsigned int searchLength;
        unsigned int targetLength;
        ZSTD_strategy strategy;
} ZSTD_compressionParameters;

Here, although the compiler may not cause any error, kernel-doc emits
the error as it probably expects "struct struct_name" to occur together.

What do you think about these issues?
I want to fix these issues, if you agree that they need to be fixed.

There are a few more issues as well, apart from these two. But for the
start, I want to begin with Uninitialized $param errors.

Thanks
Aditya
