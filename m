Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4282E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 19:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfCRTLi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 15:11:38 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35964 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfCRTLh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 15:11:37 -0400
Received: by mail-oi1-f193.google.com with SMTP id t206so14006552oib.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 12:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JoDVYGN3p0uUP69FKJYNO6I1tI51AT9N5qPr8sxvnZE=;
        b=mIgE4GybGcQbN4cBEJLSUN2zTD9SvJz1Nw5WHwNPHkIm4rGvF5/NYm/hlC4zOmykdg
         jAbKZus00QVw6XUA4pC3pr6fPPhJxgJDOw885lw5InVIKANXDtXzcqOiX5TuX0BFJmdt
         MCCApZGl6pwCdxIsqDZZeVHfSM8ztihxFm67lpsZcwbxlUPo9lXg1lLFk515wusrS+UA
         qQZHH/+YEEfkp8VgQLLDTZWGMOSvZ/LyhANFdL4a93AvOAr465xDi/DaStgRUT+Pia6K
         e1CrJDI1jBTmE7/PcA/ty55DXW1pc3s7Hx2zd4CNySdk0Ro4dgw8u3RtLhXz3QC0NWV/
         /viA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JoDVYGN3p0uUP69FKJYNO6I1tI51AT9N5qPr8sxvnZE=;
        b=fUr5D6m4bnjqd5JtpA1/VXSI0uJwNp5rMT6GldrHPgdtNlz2MBGAqsbcItK7unK0S7
         wxPlsdNJepiMLFa+oJI7EftvzUpOaa9UrQlW8hkSiz91srCXVaJ1NXkVM8mq6xO0u4tu
         5EBsqjgBaDZPCLUDywH9oxvE76/mh59jFnNFhVuKGu3AEG45Y8uVFooOLZOmBw8FJjyq
         HSxiCAAsmmwRUlcyA4dqe1xAAn4a87tKXw9XoNY6rRRbiiov0GkfTDx9/WQA4N5IP1RS
         GyZo/gYJ6aRamoGtIJLUCNFVHU+youAQiu8N4opw0hER6OtvKu7Fd8MEuxVi5LpKEV1h
         o7Xg==
X-Gm-Message-State: APjAAAXzPkp7ZQXxbZwgCRc6fzIgnp3s5v36lYf3j5jxQDuGiDOzQ+XN
        qNRtoEMdYb0VTj1SmZzf/EEPLiOK4vzFJQzq8BVA4g==
X-Google-Smtp-Source: APXvYqzQrXRHbrQwpdgk21uyj6j1k03CtWNZaAR1n6hnsnFk48dNYyTcfBIh4gu2LRtvNea4jButnGBFv6R/TisWq0U=
X-Received: by 2002:aca:550c:: with SMTP id j12mr313915oib.52.1552936295646;
 Mon, 18 Mar 2019 12:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
 <20190307150343.GB258852@google.com> <20190307152303.GA9819@kroah.com> <20190318185742.109dee5c@alans-desktop>
In-Reply-To: <20190318185742.109dee5c@alans-desktop>
From:   Daniel Colascione <dancol@google.com>
Date:   Mon, 18 Mar 2019 12:11:23 -0700
Message-ID: <CAKOZueu1ArNH3W4MfgTmWM39gvaKcYUsYUVGpQm5pZLUi-eGNA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
To:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        atish patra <atishp04@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        =?UTF-8?Q?open_list=3AKERNEL_SELFTEST_FRAMEWORK_=3Clinux=2Dkselftest=40vger=2Eke?=
         =?UTF-8?Q?rnel=2Eorg=3E=2C_linux=2Dtrace=2Ddevel=40vger=2Ekernel=2Eorg=2C_Manoj_Rao_=3Clin?=
         =?UTF-8?Q?ux=40manojrajarao=2Ecom=3E=2C_Masahiro_Yamada_=3Cyamada=2Emasahiro=40socio?=
         =?UTF-8?Q?next=2Ecom=3E=2C_Masami_Hiramatsu_=3Cmhiramat=40kernel=2Eorg=3E=2C_qais=2Eyous?=
         =?UTF-8?Q?ef=40arm=2Ecom=2C_Randy_Dunlap_=3Crdunlap=40infradead=2Eorg=3E=2C_Steven_Ros?=
         =?UTF-8?Q?tedt_=3Crostedt=40goodmis=2Eorg=3E=2C_Shuah_Khan_=3Cshuah=40kernel=2Eorg=3E=2C?= 
        <yhs@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 18, 2019 at 11:58 AM Alan Cox <gnomes@lxorguk.ukuu.org.uk> wrote:
>
> > I think the compressed tarball is much simpler/easier overall.  If
> > someone really wants the filesystem, they just uncompress it into a
> > tmpfs mount.  It's much less moving kernel code to worry about.
>
> There is an even simpler approach. The people who want this for whatever
> strange reason are Android folks. Android lives on flash, so all they have
> to do is put the headers in a flash file system that is updated with the
> kernel and mount it wherever they like. Simple matter of a bit of
> devicetree no ?

Did you read the rest of the thread? We talked a lot about the
problems with filesystem-based approaches. It's not just "Android
folks" who want BPF-based tools to Just Work, and it's not "strange"
to want that --- what's strange is this reflexive opposition to a
pragmatic feature (one that nobody has to use) that will make a lot of
system analysis cases Just Work. There's nothing wrong with having the
kernel describe itself, and there's no reason to push tons of
error-prone metadata tracking to userspace when the kernel can just
talk about itself in a guaranteed-correct manner. Every argument
against this work is also an argument against /proc/config.gz.
Completely unsurprisingly, /proc/config.gz is in practice super
useful.
