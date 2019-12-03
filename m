Return-Path: <SRS0=JqMg=ZZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44F9C432C3
	for <linux-doc@archiver.kernel.org>; Tue,  3 Dec 2019 23:08:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADE86207DD
	for <linux-doc@archiver.kernel.org>; Tue,  3 Dec 2019 23:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iXMrnw93"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbfLCXIs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Dec 2019 18:08:48 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36491 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728763AbfLCWpP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Dec 2019 17:45:15 -0500
Received: by mail-pf1-f194.google.com with SMTP id b19so2570463pfd.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Dec 2019 14:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qd7P+RAsKeedZrqHSNazeNqcDpe7+eVvkyWsa2Q207Q=;
        b=iXMrnw93nP/soNBqfRzeL/LguWO2PkOg2jKyU1LfmhQ8cwNGaFd8qWTj1ngdPLbuZs
         2V4t+5GyeScz7/QEokG4fQ+4fgTCRXC5hc6v+uUyIW/eepTWFvSu+HQA017iTYKOaN1t
         fNOxy5KxTaiI/RBqvWjCH8e03nPVxe/jBysKTJWN9v9olf6QeUWbxPqaMdVSFELa+ZnT
         Yh8wD4+Cagsxb4NudI+PNBY6O5OnrZ7ihaB8UKAHI4Xq1X7o2bVir7T3/0hy0/wiWvJR
         2qSKD1ImpOVpVwTR7efn5Oxc4qTw24IFdfabSYnAt8ljytwn9zlOfL5FjtOq2T+VwFa5
         DMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qd7P+RAsKeedZrqHSNazeNqcDpe7+eVvkyWsa2Q207Q=;
        b=MnCdnAM+y5HUmNnU7EixW8q3zZ7Aj+WXWt44DKtjd//Hwacawy1Vn1pdQaiX5/2HG2
         o0E/vCOCKVNKqQxM/ZE8XTfE4PVFGDSekKbIwvff+zm8oEt3YtOFmC/MlvQBQghjmRet
         PuOEYhiBxAH2JX5+YSY50d4uLKnG8kcZZ9Zv+pNDk52N6XV/QBvFETQOqcwTXYttFScj
         0XPyoY3MLQT/9o5gYtFBrAbwleQgm52F1wfUNE9auxHF6BK8+Brrs9w3EtZ5we2sgP2X
         1RS9S5m8dZd9XKoRh1jjwnzmoHGsmsTTHtc9uEvHVFwdVH6EhcSfCtMmdJ5F8MjdZzk0
         /45Q==
X-Gm-Message-State: APjAAAVMuCvSqBQzGmScEJ2p37htRJjD5Ku7MDeaaN45f7P46WctkNCd
        8WJdeDxnMk+cRCDdtM0v+/ooTIvRhTRT/3yk/G2LuQ==
X-Google-Smtp-Source: APXvYqwcKBHbJdc+KCshtot/o7I0++tDm8qDfLRf4tv06Kw+/aPlM9T1C8nXAryH6sAPWx+2axjFe1oWQ0uD10x8T1Q=
X-Received: by 2002:a63:480f:: with SMTP id v15mr22272pga.201.1575413114597;
 Tue, 03 Dec 2019 14:45:14 -0800 (PST)
MIME-Version: 1.0
References: <1575374868-32601-1-git-send-email-alan.maguire@oracle.com> <1575374868-32601-5-git-send-email-alan.maguire@oracle.com>
In-Reply-To: <1575374868-32601-5-git-send-email-alan.maguire@oracle.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 3 Dec 2019 14:45:03 -0800
Message-ID: <CAFd5g45vriC61WvPL_FMbTUjJTRqHW6_Le=7PcMiR-rFmf_9wQ@mail.gmail.com>
Subject: Re: [PATCH v5 linux-kselftest-test 4/6] kunit: remove timeout
 dependence on sysctl_hung_task_timeout_seconds
To:     Alan Maguire <alan.maguire@oracle.com>
Cc:     "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        catalin.marinas@arm.com, joe.lawrence@redhat.com,
        penguin-kernel@i-love.sakura.ne.jp, urezki@gmail.com,
        andriy.shevchenko@linux.intel.com,
        Jonathan Corbet <corbet@lwn.net>,
        David Gow <davidgow@google.com>, adilger.kernel@dilger.ca,
        "Theodore Ts'o" <tytso@mit.edu>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Knut Omang <knut.omang@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 3, 2019 at 4:08 AM Alan Maguire <alan.maguire@oracle.com> wrote:
>
> In discussion of how to handle timeouts, it was noted that if
> sysctl_hung_task_timeout_seconds is exceeded for a kunit test,
> the test task will be killed and an oops generated.  This should
> suffice as a means of debugging such timeout issues for now.
>
> Hence remove use of sysctl_hung_task_timeout_secs, which has the
> added benefit of avoiding the need to export that symbol from
> the core kernel.
>
> Co-developed-by: Knut Omang <knut.omang@oracle.com>
> Signed-off-by: Knut Omang <knut.omang@oracle.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Acked-by: Brendan Higgins <brendanhiggins@google.com>
