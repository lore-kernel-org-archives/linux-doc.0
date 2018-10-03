Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E08787D082
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Oct 2018 05:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbeJCMXS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Oct 2018 08:23:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44304 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbeJCMXS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Oct 2018 08:23:18 -0400
Received: by mail-wr1-f66.google.com with SMTP id 63-v6so4576466wra.11
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 22:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b5IzN2R0b3fgX4LTca8jf3J3eYSg2AdZODTPbmmS80Q=;
        b=2MjOynBLTduMQnaavvY8b6/cEF8UMICLYw1uA/OK8j/EfXTlXm73GzcpPHBTIKbpJZ
         Tbqbn1wOM+10GZLBBHWy2oyLLTTx7C0sQp6NbT8LIJlGuPWpHXQqTtWWsz3+HcvRbQAK
         FNcF9tPznE5Av8KMYgd9t8Tjvr2auUUw6OFTu3fVFJo1JQPzxhT2x4bs34dcKP8l8c2N
         ZS6/Uxqic6nY+tCr+AngbAZMVxtrP5LxiSIx6JUCPT0khmkxiqSZQsgmrHYw4cepR09F
         VpVM5pu2Sn0mcN2jhYhkrU4DhS7yOyz1IEWB3C8bhQ4VWmwwZ898NjxPIfd+00Ffrx8u
         2/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b5IzN2R0b3fgX4LTca8jf3J3eYSg2AdZODTPbmmS80Q=;
        b=a5U+BkFD7imIU5/PLwF/EGKS0r+z5fT3yD9QJNg162cGBkqKtRW3qbyqW9/2xPWySx
         YcSysqJ46xwqkms8RyZbVRUWHDsyWuBc1s3amiJf18nb+VcZ1X2H42tSY3fc4f01bE5k
         NK3vI3SJSvEAtYyE7CgtjieEWvkg7cBXRAnjh1LZN94UfhXghdDsu5vW8DW5d2Hv+fGO
         fjkHqkCB+ALu67k9pCcp3DK7uxeWCYlqTv4+MmYtQpS4jJFOf5XlQ9qz65MQO2W7VV82
         HYwp8AoXMFkyH+EtdE3Cd5wfyanHxdV3mXWadNXgifmWA212r7VvBDtsxEqwP77F75Zm
         gA2Q==
X-Gm-Message-State: ABuFfojDp88E9CHEWkfTW/09VQ3qe+c57hWAvClU0kPBiGJm//ZucCeJ
        ZS9ZZWT3+IIGxB51K+0PwohsHgZYYfCQADrvwSr6Rw==
X-Google-Smtp-Source: ACcGV60sqBd5C+thKvoH8gI4nz87zASM28tDuVb+oVscSQukIZiXNUtSi+WwS0G3dxZqZESwGLDTrjxSGghBNLdeqks=
X-Received: by 2002:a5d:610a:: with SMTP id v10-v6mr12787049wrt.308.1538544987362;
 Tue, 02 Oct 2018 22:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20180921150351.20898-1-yu-cheng.yu@intel.com> <20180921150351.20898-25-yu-cheng.yu@intel.com>
 <20181003045611.GB22724@asgard.redhat.com>
In-Reply-To: <20181003045611.GB22724@asgard.redhat.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Tue, 2 Oct 2018 22:36:15 -0700
Message-ID: <CALCETrU-Ny-uC1NqRedQwNKe2MMhsFEqZ08TtHJwbLfCACMmLw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 24/27] mm/mmap: Create a guard area between VMAs
To:     Eugene Syromiatnikov <esyr@redhat.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 2, 2018 at 9:55 PM Eugene Syromiatnikov <esyr@redhat.com> wrote:
>
> On Fri, Sep 21, 2018 at 08:03:48AM -0700, Yu-cheng Yu wrote:
> > Create a guard area between VMAs, to detect memory corruption.
>
> Do I understand correctly that with this patch a user space program
> no longer be able to place two mappings back to back? If it is so,
> it will likely break a lot of things; for example, it's a common ring
> buffer implementations technique, to map buffer memory twice back
> to back in order to avoid special handling of items wrapping its end.

I haven't checked what the patch actually does, but it shouldn't have
any affect on MAP_FIXED or the new no-replace MAP_FIXED variant.

--Andy
