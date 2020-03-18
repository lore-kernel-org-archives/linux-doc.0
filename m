Return-Path: <SRS0=afVm=5D=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B094C10DCE
	for <linux-doc@archiver.kernel.org>; Wed, 18 Mar 2020 19:11:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3487D20768
	for <linux-doc@archiver.kernel.org>; Wed, 18 Mar 2020 19:11:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lkxzxSmP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgCRTLU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Mar 2020 15:11:20 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46130 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgCRTLU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Mar 2020 15:11:20 -0400
Received: by mail-ot1-f68.google.com with SMTP id 111so26682189oth.13
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2020 12:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YEcNvKoxRLNncmofEeVv4yeDWdrbk4dUuTY3/HM5SJg=;
        b=lkxzxSmPoiFVrjW+D44Nlzoy7Y9BTyZ6PQpCllGw154b100MP5WuWaOD8/idtKRdN1
         eW54dVH6b4J85Yh7iKi6bJJfbSelvRDFyXBx3wyvx0oFFus1AOlmctj2Z5JvbyIEHHUZ
         /Jr09tDhinfXqXBq2oebzgol6mVeYcC+UyXyTHDzlp5RJD7V8dU38+VbiMAZuPGG6YF9
         hvBVYwDFqmUd6ydHL8N8g88fq/GSAzaTFW8j6JuF/V3UyExsBxHJS4eMrACrNI4o5nLl
         sC+7J1xx3mn9ikCZuhxsvKAh6qOSY243TaGZYevQ1VsO2EVhb25BOP3Gwdm7RCayZFKz
         QIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YEcNvKoxRLNncmofEeVv4yeDWdrbk4dUuTY3/HM5SJg=;
        b=YQrDk+9wohVK/5uyd1BMoJgim4twCTJ18hVbFwD7nqQtuAFAvXqmdJoe2l42r63dO7
         fiD+t+rifRCIBJe3u/AAUIaVT7OerlF/I+tUp355rjrhhrUy/mHvudz8JtAL6b9QISBP
         w2+jk2LBA8XhBh1rXNNZrE5+MPZI2NMkAGTlHxYI7LeO3pU5OPpa32L3YEP5oVeVUyQ0
         tvGLNB4DTb8Ffybl46Z0UM9kgp0ZL8uYt6OaeVkIsM2fKrtwX/grDrccFMiv0H3HJyI3
         ckBS/M2gLKVv0QRQZnLDWc+YjmRl4QA1DtdLA+q9qJxMD+Kj8EE+gY8da8RivI0ggIuw
         ACAQ==
X-Gm-Message-State: ANhLgQ2Ba0KTmQUOxRwV0ffd8v835eN8/i0oo44tbp3gXOssvPjeAtmq
        6+HeQPYPgAtM13sTC5R+DFmijBmUS3GYqbldx2KsgA==
X-Google-Smtp-Source: ADFU+vuQqQyKYY3GzReouxvk6jJyqQUm+Irep1pzseE+uxctbZi52pzI8VMFuxyNWh599gkbGFQoVDq1JwgQY4XyDz8=
X-Received: by 2002:a9d:6186:: with SMTP id g6mr5088006otk.236.1584558679434;
 Wed, 18 Mar 2020 12:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200317065452.236670-1-saravanak@google.com>
In-Reply-To: <20200317065452.236670-1-saravanak@google.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 18 Mar 2020 12:10:43 -0700
Message-ID: <CAGETcx-uZ3YJHCYqFm3so8-woTvL3SSDY2deNonthTetcE+mXQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] Fix device links functional breakage in 4.19.99
To:     stable <stable@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 16, 2020 at 11:54 PM Saravana Kannan <saravanak@google.com> wrote:
>
> As mentioned in an earlier email thread [1], 4.19.99 broke the ability
> to create stateful and stateless device links between the same set of
> devices when it pulled in a valid bug fix [2]. While the fix was valid,
> it removes a functionality that was present before the bug fix.
>
> This patch series attempts to fix that by pulling in more patches from
> upstream. I've just done compilation testing so far. But wanted to send
> out a v1 to see if this patch list was acceptable before I fixed up the
> commit text format to match what's needed for stable mailing list.
>
> Some of the patches are new functionality, but for a first pass, it was
> easier to pull these in than try and fix the conflicts. If these patches
> are okay to pull into stable, then all I need to do is fix the commit
> text.

I took a closer look at all the patches. Everyone of them is a bug fix
except Patch 4/6. But Patch 4/6 is a fairly minimal change and I think
it's easier/cleaner to just pick it up too instead of trying to
resolve merge conflicts in the stable branch.

1/6 - Fixes what appears to be a memory leak bug in upstream.
2/6 - Fixes error in initial state of the device link if it's created
under some circumstances.
3/6 - Fixes a ref count bug in upstream. Looks like it can lead to memory leaks?
4/6 - Adds a minor feature to kick off a probe attempt of a consumer
5/6 - Fixes the break in functionality that happened in 4.19.99
6/6 - Fixes bug in 5/6 (upstream bug)

Greg

Do these patches look okay for you to pull into 4.19 stable? If so,
please let me know if you need me to send v2 with commit fix up.

The only fix up needed is to these patches at this point is changing
"(cherry picked from commit ...)" with "[ Upstream commit ... ]". The
SHAs themselves are the correct SHAs from upstream.

Thanks,
Saravana
