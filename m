Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7FE357D043
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 18:49:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932377AbeFGStO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 14:49:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932295AbeFGStN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 14:49:13 -0400
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com [209.85.128.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2ECEE208A1
        for <linux-doc@vger.kernel.org>; Thu,  7 Jun 2018 18:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528397353;
        bh=crbJkwTStLUzTuNVU01tdjm1kf88uyd/+FByIXqhZu0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gtrF+tr9mtgO+zr88VaZ6BT8kt3AaVa7gphT4iuEFeJp00TBxtk6D44BsMuImftsc
         d1soH5MA1tI1EaR5/mg8HyeTT9TS0d4lHoXhc9Y3QBw4sF4Zk5LFARZ1wJe3/FAf6S
         EcixHyvokfTTSW5PfaN7I14raG8S12jVMfs3418M=
Received: by mail-wr0-f176.google.com with SMTP id a12-v6so10893553wro.1
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 11:49:13 -0700 (PDT)
X-Gm-Message-State: APt69E0yq9NS4amQx/+Vt5fwxQ9lOH5QE60rlMjyKA4r018ctNViNNym
        YQmoJSSEHYKshTzmSGw0Xn9vvBha20DNTMAMsgY/Sg==
X-Google-Smtp-Source: ADUXVKKcssBNw43uWQR7fRpxR81LkXSciyBwdGCavGt63/lG6zvaBnoj20T0EOMxRFF51K3ukLayBjPH27QnF7fYMx4=
X-Received: by 2002:adf:e084:: with SMTP id c4-v6mr2563276wri.199.1528397351735;
 Thu, 07 Jun 2018 11:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143807.3611-1-yu-cheng.yu@intel.com> <20180607143807.3611-9-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143807.3611-9-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 7 Jun 2018 11:48:59 -0700
X-Gmail-Original-Message-ID: <CALCETrVX8nE6oFnJH7yZCydxtnC-VAhhnYs=ekJELc07a2UKiQ@mail.gmail.com>
Message-ID: <CALCETrVX8nE6oFnJH7yZCydxtnC-VAhhnYs=ekJELc07a2UKiQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] mm: Prevent mremap of shadow stack
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        mike.kravetz@oracle.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 7, 2018 at 7:41 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Please justify.  This seems actively harmful to me.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
