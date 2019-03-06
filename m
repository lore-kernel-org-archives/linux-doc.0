Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 308757D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Mar 2019 18:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730731AbfCFSQ4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Mar 2019 13:16:56 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46626 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730712AbfCFSQ4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Mar 2019 13:16:56 -0500
Received: by mail-qk1-f193.google.com with SMTP id i5so7352815qkd.13
        for <linux-doc@vger.kernel.org>; Wed, 06 Mar 2019 10:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5I1cnz3QaZ6rw5yJX9izpTDc/C1IFx2uWmv13xl7pe8=;
        b=P2v8NP07bmvXNsYtRajbosxBYGRBm8bR3dxbyxUC5Uqw6rItRA9lcdtuitPXxQ6A1X
         hnYWp8f18zZsK8Pxv64+pa+/KTN7QXaobTLO5Mm3udmSJDKnK//qiHb/uuE4Zv4BhfUN
         AWvHsoy8QZ7VKbolZLp0SXG76SAWeJVm0lUlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5I1cnz3QaZ6rw5yJX9izpTDc/C1IFx2uWmv13xl7pe8=;
        b=lVe3CXGF1sNVg04xrTzc7DFxpZyOLBDUnNfhA5Vcq32Kb4xgMaw7vJwROMQR1L4CI7
         GgFr75LNP9mL3uqozfjxGScnFcLqbPpYbMcfxnwaPnXSRGSWJc0HsgtJfRvHPr/kCv2t
         Q3+92Ke3y5SUke/eJ8bLSdSxlAr2x69+N0ZQpHeRH4bbKRRsfGGPLphCGyNBQ895woxT
         hBVL46SRsZxR0eqB05RZi+Q2/ecCupfGqXhM0nlFQ7CqAaKsdu3fSXWz5YyXoGtMCCfv
         6T0EW5cOrm3GYpa6O/AP1Cv6tm2DOszegVdIfq9dZgtieCvl6vtdibD+kVq2bpnRHG6a
         l5iA==
X-Gm-Message-State: APjAAAV0IvYHEaIfpU/+KO48Ak8567j2vy7w3grSpjUefTL6fte0P2Gj
        bDProC+TPcW2GXECkMKj7jlzCw==
X-Google-Smtp-Source: APXvYqyD3GPpO9TrOZnl4S9WKYXwXytf77sgE28goIwSvHlSjVOiW6JgNGUv4Xw08IiyWPLyGBZ7Hg==
X-Received: by 2002:a37:478b:: with SMTP id u133mr6591402qka.280.1551896215228;
        Wed, 06 Mar 2019 10:16:55 -0800 (PST)
Received: from localhost ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id o4sm1329000qke.30.2019.03.06.10.16.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2019 10:16:54 -0800 (PST)
Date:   Wed, 6 Mar 2019 13:16:53 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        atish patra <atishp04@gmail.com>,
        Daniel Colascione <dancol@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kselftest@vger.kernel.org, linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <shuah@kernel.org>, Yonghong Song <yhs@fb.com>
Subject: Re: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
Message-ID: <20190306181653.GB34256@google.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <201903030526.3AuYFiuN%fengguang.wu@intel.com>
 <CAJWu+op541tQ_TBJs-kOyRRBYDWiN0Znpb=cUQFxuLg-SmjO_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJWu+op541tQ_TBJs-kOyRRBYDWiN0Znpb=cUQFxuLg-SmjO_g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

 
> On Sat, Mar 2, 2019 at 2:00 PM kbuild test robot <lkp@intel.com> wrote:
> >
> > Hi Joel,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v5.0-rc8]
> > [cannot apply to next-20190301]
> > [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> >
> > url:    https://github.com/0day-ci/linux/commits/Joel-Fernandes-Google/Provide-in-kernel-headers-for-making-it-easy-to-extend-the-kernel/20190303-014850
> > config: sh-allmodconfig (attached as .config)
> > compiler: sh4-linux-gnu-gcc (Debian 8.2.0-11) 8.2.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=8.2.0 make.cross ARCH=sh
> >
> > All errors (new ones prefixed by >>):
> >
> > >> find: 'arch/sh/kernel/module.lds': No such file or directory
> > >> find: 'arch/sh/kernel/module.lds': No such file or directory
On Sun, Mar 03, 2019 at 08:11:59AM -0800, Joel Fernandes wrote:
> This report is for an older version of the patch so ignore it. The
> issue is already resolved.
>

Apologies, this issue is real. However it does not cause any failure. It is
only causing find command to be a bit noisy.

The below diff fixes it and I'll update the patch for v5:

diff --git a/scripts/gen_ikh_data.sh b/scripts/gen_ikh_data.sh
index 1fa5628fcc30..9a7ea856acbc 100755
--- a/scripts/gen_ikh_data.sh
+++ b/scripts/gen_ikh_data.sh
@@ -1,5 +1,6 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+set -e
 
 spath="$(dirname "$(readlink -f "$0")")"
 kroot="$spath/.."
@@ -11,12 +12,14 @@ file_list=${@:2}
 
 src_file_list=""
 for f in $file_list; do
+	if [ ! -f "$kroot/$f" ] && [ ! -d "$kroot/$f" ]; then continue; fi
 	src_file_list="$src_file_list $(echo $f | grep -v OBJDIR)"
 done
 
 obj_file_list=""
 for f in $file_list; do
 	f=$(echo $f | grep OBJDIR | sed -e 's/OBJDIR\///g')
+	if [ ! -f $f ] && [ ! -d $f ]; then continue; fi
 	obj_file_list="$obj_file_list $f";
 done
 
-- 
2.21.0.352.gf09ad66450-goog

