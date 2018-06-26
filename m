Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 709A47D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 05:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751145AbeFZF1M (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 01:27:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:55008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750994AbeFZF1L (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 26 Jun 2018 01:27:11 -0400
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8619726522
        for <linux-doc@vger.kernel.org>; Tue, 26 Jun 2018 05:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1529990830;
        bh=210g3tAP8RcCY/wbGeXHIxlnJ60UQvz2S9guL7f7hns=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rVxUgn/f6Fh+2bmJYWab5jyyMrM13YX9KO6FgCaXvV7exnaqph9c4kiGi0mPeZ/li
         X6EU003kQqer20J6NjM5ceesYy0JO0KTK9iBuYqc1iBdWpQ80gtRICIh6p0oFCMA3c
         V3Wx6gdO43nfNzv7qYUI3td6GQIpMwyQefUu8Yxo=
Received: by mail-wm0-f54.google.com with SMTP id p11-v6so282160wmc.4
        for <linux-doc@vger.kernel.org>; Mon, 25 Jun 2018 22:27:10 -0700 (PDT)
X-Gm-Message-State: APt69E1eVVeGqyV2EZkqh1mg/+vZ9xL/l0pIZgMAAWFMpSzJFnNK6Mb2
        c/df08AMSZ3FybY67HDWJ2R5dWamiKWkrIPpdNQlyg==
X-Google-Smtp-Source: AAOMgpfXyYGO4Rk46UPsmPk4fhlGT0e+bbPtol2OzKQhOGbdvVSFMmhmINV0IazTWrSOSlb+IlHu+tcvRx6fBRzT58I=
X-Received: by 2002:a1c:f20d:: with SMTP id s13-v6mr310300wmc.36.1529990828986;
 Mon, 25 Jun 2018 22:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143807.3611-1-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143807.3611-1-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Mon, 25 Jun 2018 22:26:57 -0700
X-Gmail-Original-Message-ID: <CALCETrWYx5nCtwGAqTZBWOB+aw+eEcnQhe6Sn1o+O356g7Km9A@mail.gmail.com>
Message-ID: <CALCETrWYx5nCtwGAqTZBWOB+aw+eEcnQhe6Sn1o+O356g7Km9A@mail.gmail.com>
Subject: Re: [PATCH 00/10] Control Flow Enforcement - Part (3)
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>,
        Linux API <linux-api@vger.kernel.org>,
        Jann Horn <jannh@google.com>,
        Florian Weimer <fweimer@redhat.com>
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
> This series introduces CET - Shadow stack

I think you should add some mitigation against sigreturn-oriented
programming.  How about creating some special token on the shadow
stack that indicates the presence of a signal frame at a particular
address when delivering a signal and verifying and popping that token
in sigreturn?  The token could be literally the address of the signal
frame, and you could make this unambiguous by failing sigreturn if CET
is on and the signal frame is in executable memory.

IOW, it would be a shame if sigreturn() itself became a convenient
CET-bypassing gadget.

--Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
