Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348A3C4338F
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 04:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BFF960E8E
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 04:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233637AbhGWD6K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 23:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbhGWD6J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jul 2021 23:58:09 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCF0C061757
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 21:38:42 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id l11so460601iln.4
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 21:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/qj6oCF0Bps6laCKnB2SnDxbkiRn81ATixkUpo80E10=;
        b=tTj7788fq7UyumVl+0XhQdDXTaMDEbeKbtVh/w/cutbEiKDoVaLSnLq3z7sBPoV4UB
         t5AAod9e9SIzKwa7A0xbZlPMXlZmD6OjfmZpV9EYj6zWMuw89zY4T1S/uNauPgIRkTkB
         JprwM84orX5EsY9ziXQ9fUCoQAXXMbAoas000=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/qj6oCF0Bps6laCKnB2SnDxbkiRn81ATixkUpo80E10=;
        b=Vde+qPTP9o0wl3ALbbqDcsf9pSzWWDXMVjYFM5jDw4QJ0ORRGDN00heejzn1SPekHb
         YHlpbrtIEdiJYAjiYXsty5zDdtcm8dr0v+rEWUohxD6cg9sbasAbSK+Q1DX8GIcn+dSo
         C6nMNx5vnsCZzeDTgWWyLtXUzW9Cgn09L7q+O8A7cuvELnpP5KzbmPqIjyYsAvV9XsYz
         8v4/5xzq9cKIb0Vrvvi1WnhtYEbrNvuLGJFsd65V3eadjtNEJtTUK9aFxYxDmhmbTgXt
         ZVYm2NbtYExOjfFEfxRqqa4Gpo0Z7VXQ2qC7GxjTbAiEfRr9TgjFFJHdmrWTmdPmUPmH
         SANA==
X-Gm-Message-State: AOAM533Bxgn1HcRgCZckFacUs1FLoXXt/SF27FFOKDZGdB8+t6o1H1nl
        VRNNyWSeYxt5ExI59VxfMiPktYFjL48wWWomK0ne9Q==
X-Google-Smtp-Source: ABdhPJyeZytLsYaaTOa1oaXp434ValU+WY5NmjR5hrtXliHxapTaTmIPjUFN+Ht8pS6Y+CO9UVjZINiVoikkXDX/fWI=
X-Received: by 2002:a92:b74d:: with SMTP id c13mr2278206ilm.176.1627015121239;
 Thu, 22 Jul 2021 21:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210721190250.26095-1-fmdefrancesco@gmail.com>
In-Reply-To: <20210721190250.26095-1-fmdefrancesco@gmail.com>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Fri, 23 Jul 2021 00:38:30 -0400
Message-ID: <CAEXW_YR4bgaLHMDd_e83bQANqfvk=4a_7H3NJUHzG4K7sRetiw@mail.gmail.com>
Subject: Re: [PATCH] admin-guide/hw-vuln: Rephrase a section of core-scheduling.rst
To:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Vineeth Pillai <Vineeth.Pillai@microsoft.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 21, 2021 at 3:02 PM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> Rephrase the "For MDS" section in core-scheduling.rst for the purpose of
> making it clearer what is meant by "kernel memory is still considered
> untrusted".
>
> Suggested-by: Vineeth Pillai <Vineeth.Pillai@microsoft.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Reviewed-by: Joel Fernandes (Google) <joelaf@google.com>

thanks,

 - Joel


> ---
>  Documentation/admin-guide/hw-vuln/core-scheduling.rst | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/hw-vuln/core-scheduling.rst b/Documentation/admin-guide/hw-vuln/core-scheduling.rst
> index 7b410aef9c5c..e6b5ceb219ec 100644
> --- a/Documentation/admin-guide/hw-vuln/core-scheduling.rst
> +++ b/Documentation/admin-guide/hw-vuln/core-scheduling.rst
> @@ -181,10 +181,11 @@ Open cross-HT issues that core scheduling does not solve
>  --------------------------------------------------------
>  1. For MDS
>  ~~~~~~~~~~
> -Core scheduling cannot protect against MDS attacks between an HT running in
> -user mode and another running in kernel mode. Even though both HTs run tasks
> -which trust each other, kernel memory is still considered untrusted. Such
> -attacks are possible for any combination of sibling CPU modes (host or guest mode).
> +Core scheduling cannot protect against MDS attacks between the siblings running in
> +user mode and the others running in kernel mode. Even though all siblings run tasks
> +which trust each other, when the kernel is executing code on behalf of a task, it
> +cannot trust the code running in the sibling. Such attacks are possible for any
> +combination of sibling CPU modes (host or guest mode).
>
>  2. For L1TF
>  ~~~~~~~~~~~
> --
> 2.32.0
>
