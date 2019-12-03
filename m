Return-Path: <SRS0=JqMg=ZZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A642AC43215
	for <linux-doc@archiver.kernel.org>; Tue,  3 Dec 2019 22:47:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78E1D2080F
	for <linux-doc@archiver.kernel.org>; Tue,  3 Dec 2019 22:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XLtR10TY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbfLCWrx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Dec 2019 17:47:53 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44791 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729355AbfLCWrw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Dec 2019 17:47:52 -0500
Received: by mail-pg1-f195.google.com with SMTP id x7so2300233pgl.11
        for <linux-doc@vger.kernel.org>; Tue, 03 Dec 2019 14:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7TqgN2iJjOXxie883Mhqea6U14ESjoMu4kL/R78rVdw=;
        b=XLtR10TY5HvNYaSa6cai3/R9FYzleQQZz2svZyL8tOK87YQA912V1ym4Hv9zSZTa4W
         XsYLsdsxIIeqUmKaaTyXJdXq5ZIMsdtz+qAW2aJArY3lZQzq/8XMkxXKMLduQdGguwWQ
         tEyyhc1m8FNszdEx+TWMqK02tQGLsYRH7qEoztNCUWj2XYpGsKHNu+2K9gLUBTSzkpQg
         cL0sHoa58B89n343/NyL3Q5aK/piEHaXyVdmqwAxoUlwff0wlzeadqsQ5m97SN9ss//N
         WQpKd+LYhfVNyvGjsitB44ASs9L0mP1g554ne1GdBkVgiDiXqQvNshl3HDgwl4vsoLUr
         Y7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7TqgN2iJjOXxie883Mhqea6U14ESjoMu4kL/R78rVdw=;
        b=NX3VpcLOjyUSe/zSNF5xDxzUCbtRLdyTRpIt11/wPkMlJmHf+nyzou7bs5HS/W7IoQ
         Gc5Gi5jvHfDMXcYtNozuFaJkjheFNxxkXtbjtBnDR5t4xDpxB/u7kZZEbxGKjvVr6wNd
         HbnEbeP838oHUf/0LYuWIFSpzCXJUuH0YLjeiYI6nnWsvi7CBmkh8ISt8HmJeasDDm10
         A3XMVot3okac24wjBHOvVw3SbwMoTyN9joqTo1rMRoAxQqLhyRHtjtpUWigarAL7NdXu
         TzqUPFr15Lh7LR3dFsWwZk02ObEl5+yufndytDFwbamu+q49+ka85hasMk32ipBb5oD5
         kKSw==
X-Gm-Message-State: APjAAAVIZi/GocLmcTiKbscmO8FV1unaSzcWgmpfFOsF9jEhy4bep5cE
        eY7K/DDprlmp7Gp0QjyZhedTEcpeiw5aO9Ge7P+q7w==
X-Google-Smtp-Source: APXvYqxzyBp784JSAxM/nOyG953YC2qIJk8I3LZCsWw1NC/8F92n1+h9oQjRuIVvcrvMxxIyY3GenyseDH3/qhHb7BI=
X-Received: by 2002:a63:480f:: with SMTP id v15mr32786pga.201.1575413270868;
 Tue, 03 Dec 2019 14:47:50 -0800 (PST)
MIME-Version: 1.0
References: <1575374868-32601-1-git-send-email-alan.maguire@oracle.com> <1575374868-32601-6-git-send-email-alan.maguire@oracle.com>
In-Reply-To: <1575374868-32601-6-git-send-email-alan.maguire@oracle.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 3 Dec 2019 14:47:39 -0800
Message-ID: <CAFd5g47BXKat2Hty01WHz6eJj3WOjbeJ3pYqimaf2wQPm7Eibw@mail.gmail.com>
Subject: Re: [PATCH v5 linux-kselftest-test 5/6] kunit: allow kunit to be
 loaded as a module
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
> Making kunit itself buildable as a module allows for "always-on"
> kunit configuration; specifying CONFIG_KUNIT=m means the module
> is built but only used when loaded.  Kunit test modules will load
> kunit.ko as an implicit dependency, so simply running
> "modprobe my-kunit-tests" will load the tests along with the kunit
> module and run them.
>
> Co-developed-by: Knut Omang <knut.omang@oracle.com>
> Signed-off-by: Knut Omang <knut.omang@oracle.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
