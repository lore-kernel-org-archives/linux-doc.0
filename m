Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D2FC3E8C5
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 18:19:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 655C324248
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 18:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErPSVbRW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgKRSTe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Nov 2020 13:19:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgKRSTd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Nov 2020 13:19:33 -0500
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DCAC0613D4
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2020 10:19:33 -0800 (PST)
Received: by mail-vk1-xa43.google.com with SMTP id o73so701148vka.5
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2020 10:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D55mGSGXRfvyjgWecq0UWIiQZUYLLo9SfJxfFnsVwX0=;
        b=ErPSVbRWN4hCYHPta43SG0tQfc8GbD9XwNGCZ84wZ89hCbRcr+4cpS35TTs7wnqt29
         iRWrq3VHnGGoCXDNE77n1xMtQ9sDoH9WZ9xlaqm39OSnAzrhBvfY00M+hXzIKCoiRheV
         sp1yNsh4KKATGxXHsI/0tSOc/CHDQ3BFFBIHyL9690S9qIoeKqcWnRlVCR+A69w+uZtI
         H0LLcTqqB/iC6e8RbBuFeO2VwmmO39IVBSem+Jqz4+hmjIJExzbtN5BWweQYO7lXtLFH
         fMhVEsAimzDkOJIaxEASyEMELVArMmkVh1H6wPvN9C7cG9FedZ5yOWFwN03mX0m/quim
         v7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D55mGSGXRfvyjgWecq0UWIiQZUYLLo9SfJxfFnsVwX0=;
        b=O4SLgnh86uni8W89jyv9/udwV1krNLW9PCFWmvmM0h/8fOrghMThqUC3ULHh/GrUPY
         WDMeNEMf52tbXgnR4J7B8EjzWQHhgLpfeDzyAkcrh0WzciXGTj8O4zoBJggW96oqXCXP
         t/AOQmf2uEhKAA9yGh08HGK4x/5bZCSe0OUyJboiu0FfLGG9t6cGOMz8k6TgEOAnR0ZU
         p9TjVzH2AhZtTAkAEo8SOb06li6+vkEnu/NmNz26AFosarY7RXW2O7bz0CW6F5XqlaiT
         Ny3NfCh6qQiTnlsqmzwtjPtD2NC/fnc9vVaL+TZOHAHpWIfvHmZ/lban7FlbANikV/qF
         br9g==
X-Gm-Message-State: AOAM531/yB+7xcAmwOE+Z+twsbyXc96DhBFuR5qhF8HSQS+XYoPm7k3t
        cvmz96m9/Co9DgaFE7vEOm6JgIyvkX213n8YrKFR54m/w00=
X-Google-Smtp-Source: ABdhPJwXnw351dXb8DF5uqF6PLTQhcxKdHbxqKBCJKl6npj2UFQjIlIx3X8Xi5T9hMImrCGUwMQaSJmw49ngSmPf06w=
X-Received: by 2002:a1f:cd07:: with SMTP id d7mr4787029vkg.10.1605723571675;
 Wed, 18 Nov 2020 10:19:31 -0800 (PST)
MIME-Version: 1.0
References: <CAHoi7Su9sWetsH4BCYnzx6+9kskFAd9gwvMgUG_e0Mmy9UQOZA@mail.gmail.com>
In-Reply-To: <CAHoi7Su9sWetsH4BCYnzx6+9kskFAd9gwvMgUG_e0Mmy9UQOZA@mail.gmail.com>
From:   =?UTF-8?B?0JXQvdGM0YjQuNC9INCQ0L3QtNGA0LXQuQ==?= 
        <and.enshin@gmail.com>
Date:   Thu, 19 Nov 2020 03:19:20 +0900
Message-ID: <CAHoi7StxrQ3E07_Y7M5yj+XdzfmBbsg_h0kzpmO23odj+naJXg@mail.gmail.com>
Subject: Re: [PATCH] Fix cgroup-v1 doc: /proc/<pid>/cgroup instead of /proc/<pid>/cgroups
To:     linux-doc@vger.kernel.org
Cc:     trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Enshin Andrei <b1os@bk.ru>

---
 Documentation/admin-guide/cgroup-v1/cgroups.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v1/cgroups.rst
b/Documentation/admin-guide/cgroup-v1/cgroups.rst
index b068801..9544370 100644
--- a/Documentation/admin-guide/cgroup-v1/cgroups.rst
+++ b/Documentation/admin-guide/cgroup-v1/cgroups.rst
@@ -485,7 +485,7 @@ subsystems when none are explicitly specified is
not supported when
 you give a subsystem a name.

 The name of the subsystem appears as part of the hierarchy description
-in /proc/mounts and /proc/<pid>/cgroups.
+in /proc/mounts and /proc/<pid>/cgroup.


 3. Kernel API
--=20
2.7.4

=D0=B2=D1=82, 17 =D0=BD=D0=BE=D1=8F=D0=B1. 2020 =D0=B3. =D0=B2 01:30, =D0=
=95=D0=BD=D1=8C=D1=88=D0=B8=D0=BD =D0=90=D0=BD=D0=B4=D1=80=D0=B5=D0=B9 <and=
.enshin@gmail.com>:
>
> ---
>  Documentation/admin-guide/cgroup-v1/cgroups.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/cgroup-v1/cgroups.rst
> b/Documentation/admin-guide/cgroup-v1/cgroups.rst
> index b068801..9544370 100644
> --- a/Documentation/admin-guide/cgroup-v1/cgroups.rst
> +++ b/Documentation/admin-guide/cgroup-v1/cgroups.rst
> @@ -485,7 +485,7 @@ subsystems when none are explicitly specified is
> not supported when
>  you give a subsystem a name.
>
>  The name of the subsystem appears as part of the hierarchy description
> -in /proc/mounts and /proc/<pid>/cgroups.
> +in /proc/mounts and /proc/<pid>/cgroup.
>
>
>  3. Kernel API
> --
> 2.7.4
>
>
> --
> Best Regards,
> Andrei Enshin



--=20

Best Regards,
Andrei Enshin
