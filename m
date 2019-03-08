Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D1E8D7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Mar 2019 13:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfCHNmq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Mar 2019 08:42:46 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38556 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbfCHNmq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Mar 2019 08:42:46 -0500
Received: by mail-lf1-f67.google.com with SMTP id k136so4011229lfg.5
        for <linux-doc@vger.kernel.org>; Fri, 08 Mar 2019 05:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Na2ICTCaMZ0QcHDv8RWM3swi5O8VFI4ZuZ2NbpUHrhU=;
        b=ssezaFnNfCTxDFxOwKtDQzdR9rpAu8PUWYVEF1UNq8770sFlQv53heVquoasbermH/
         HU4KvcFGnY3tiN4cZfB6C5umE35JPTFc0N20EebyAIxzeHzy4qmgAn0vUTKvAM4P75hD
         wvql1OikAYjzWupCLpGs8N4HH2rn+aPLpu70c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Na2ICTCaMZ0QcHDv8RWM3swi5O8VFI4ZuZ2NbpUHrhU=;
        b=qj4yky4cjqIo3OTBTJxYJlhSjWa1hVxfCqTA+//8ODLoqEJoMtBe7kaKoj14i4ei+J
         N+9JtuRNmwzpVNHk2/goRwgw+aNADPZvylfX+0vgG++F6aQigKEt3wGxv5DlU/NhHu9g
         7I2CxTQmHs9NhTmAOgD2XN66V67bvjviGPqXkbVfNj5XlV63m1ZdmaKMRLQMoN3Bwxc7
         8JbiYRaQ/xp2YUkmwytCa3Z3QPU3UmkfvIdtQd3pnrsryB+8eF+ll/2KXI8t+VjRILgP
         nWc4N4t2IjHYxElwF6kVrnOwSxMqeVGguVkPMa9BLx+oU3I117ScyMef/YKvVFtbSXKQ
         2WDQ==
X-Gm-Message-State: APjAAAUHabpzm7xW5X9Uvy0+esIHUU16GZVsP8dDL+oCCLt6+YNjaP2T
        GvCteSTZlUx6H1cPYnBEfvVGFBaCtHZG6B1KxP8tsg==
X-Google-Smtp-Source: APXvYqyzWoypEqoT1oITYeUwNCwjb9vm61eT6BS7cBFz9jHtc8tf3vM63v6xdDxXMuteDgdGCzCS0SSwIXDskAdTkuc=
X-Received: by 2002:ac2:51b2:: with SMTP id f18mr10219675lfk.21.1552052563784;
 Fri, 08 Mar 2019 05:42:43 -0800 (PST)
MIME-Version: 1.0
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
 <20190307150343.GB258852@google.com> <CAMuHMdW_7BTZREsnz7uMTToCZ4HDOZboMJH8k8UZica2pB=Jew@mail.gmail.com>
In-Reply-To: <CAMuHMdW_7BTZREsnz7uMTToCZ4HDOZboMJH8k8UZica2pB=Jew@mail.gmail.com>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Fri, 8 Mar 2019 05:42:32 -0800
Message-ID: <CAEXW_YQUcA+bnav20tAFQPXYE=epMie4X85diudKs_s-TJ7dsw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        atish patra <atishp04@gmail.com>,
        Daniel Colascione <dancol@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <shuah@kernel.org>, Yonghong Song <yhs@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

HI Geert,

On Fri, Mar 8, 2019, 3:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > It is just so much easier to use tar + xz at build time, and leave the
> > decompression task to the user. After decompression, the files will live on
> > the disk and the page-cache mechanism will free memory when/if the files fall
> > off the LRUs.
>
> I'm also considering how generic and extensible the solution is.
> What if people need other build artifacts in the future (e.g. signing key to
> load signed modules)?

That sounds like it could be useful. I don't see any reason off the
top why that would not be possible to add to the list of archived
files in the future. The patch allows populating the list of files
from Kbuild using ikh_file_list variable.

thanks,

 - Joel
