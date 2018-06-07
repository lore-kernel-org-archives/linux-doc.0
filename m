Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6C1517DF8D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 15:39:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934084AbeFGPjE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 11:39:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:45162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935005AbeFGPjA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 11:39:00 -0400
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com [209.85.223.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1EB0B208A3
        for <linux-doc@vger.kernel.org>; Thu,  7 Jun 2018 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528385940;
        bh=/Z+yN54nwBtnO1YsmpoDAvuKNDr6RvNMby9iLJrueyc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=l0sa3y39UIhDuhJ4KYUwVh/2cC8qc0EcuTQlgt19RM1EVb/xzMxPvdFnRnnxNkAGw
         eLiai/jgZ1xQYls0P8RzvbWJQ+SKPy2WiM42fh4PqZNVa5/7c+XnC04Kp8LzzXRcpM
         ceeDOVRYppdv4batiKDqD9/juuzQQWIZ6iD/EdBM=
Received: by mail-io0-f172.google.com with SMTP id d73-v6so12331303iog.3
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 08:39:00 -0700 (PDT)
X-Gm-Message-State: APt69E2AdcFdWvrl3CFTHybxuJxE9Ls+pZnJLF2O09r1CBZRkywxAf72
        spwFYz8NOV643CdwDRtkxUemrBiUKTPSaGtOBGoX6Q==
X-Google-Smtp-Source: ADUXVKI5YR8BZLeEZcTjR14Vei0NXRwH3vL4H/MYpZNEsIZx8o0BunmVBc9/yI0n4U7DSV5kr8R6IL+bsfS4w57N+3w=
X-Received: by 2002:a6b:ef02:: with SMTP id k2-v6mr1968977ioh.136.1528385939471;
 Thu, 07 Jun 2018 08:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143544.3477-1-yu-cheng.yu@intel.com> <20180607143544.3477-3-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143544.3477-3-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 7 Jun 2018 08:38:47 -0700
X-Gmail-Original-Message-ID: <CALCETrXAx4vBUxf3VaePNm3HHLZkdTFAR9TV0T+A-jb2QL7Uag@mail.gmail.com>
Message-ID: <CALCETrXAx4vBUxf3VaePNm3HHLZkdTFAR9TV0T+A-jb2QL7Uag@mail.gmail.com>
Subject: Re: [PATCH 2/5] x86/fpu/xstate: Change some names to separate XSAVES
 system and user states
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

On Thu, Jun 7, 2018 at 7:40 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> To support XSAVES system states, change some names to distinguish
> user and system states.
>
> Change:
>   supervisor to system
>   copy_init_fpstate_to_fpregs() to copy_init_fpstate_user_settings_to_fpregs()
>   xfeatures_mask to xfeatures_mask_user
>   XCNTXT_MASK to SUPPORTED_XFEATURES_MASK (states supported)

How about copy_init_user_fpstate_to_fpregs()?  It's shorter and more
to the point.

--Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
