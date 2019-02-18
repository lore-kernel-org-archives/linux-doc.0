Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6525D7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Feb 2019 03:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbfBRD7f (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 17 Feb 2019 22:59:35 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:42064 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728466AbfBRD7f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 17 Feb 2019 22:59:35 -0500
Received: by mail-ua1-f67.google.com with SMTP id d21so5374228uap.9
        for <linux-doc@vger.kernel.org>; Sun, 17 Feb 2019 19:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C5mPZbc1CaMt6frrgcbK8kk9usGEYeIzQLFIP+/1HEI=;
        b=bh3D4ALVp/1uxirXriqpy+0d0htmuuK2ut3iHHmO5ryWLjCfx+oUyZKz7bPT45KlQU
         STjjesa67Zy3fHPPYghBlEMAynx+DSzHp/CC+M7qtarJ/Gpz3u/zK3vv/Sw74y91M0Cn
         Ly4gKmxLh4XrnWR9Y7CvW5uYUvoVDlOfm20+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C5mPZbc1CaMt6frrgcbK8kk9usGEYeIzQLFIP+/1HEI=;
        b=hcMk6MHjSrS1TCyLaQTfoNhl/1yQWmHpAohpRoBANSQbr0HF4bJOohKBaiBW++km0F
         Popgl/vvtH2RrROn5sedI4v/vSIPe3eSsvLWA0XwehZu95a0pHPtu5BDMHLJTkpH1T3p
         gNBubvaJEf6FzqSn0g8C+f3FZ/j4RO/HUQBjDma1n7Jp8pc43KpEVXu6DdaHwPgoc/dU
         Ad33ddnGaauKSUatlWJqSmDufMX7nEvQnj6DFm+yphf5I6MzJZQ8rOQWDl12CEgetONX
         4735fNrqtTThz5ZB6MWLTFd7KN6Na7FeKj4fjADmuHO4qnCc7AeobBJ/e1DNGG30L/D6
         451A==
X-Gm-Message-State: AHQUAuYIFPZnxrgZviLTcJFK17z+npsS3gfufgb5exqOWAKV2bZIrDPu
        AnvF5K2IaLTbrsJ9DXVxPjzJFVfatc8=
X-Google-Smtp-Source: AHgI3Iaczh/iOmnq6uY0lOSPe5PKRukd+wocwOFMHi/Ixwj0YIpabRTOxhh6IMcxAMDpNtsq/sazog==
X-Received: by 2002:ab0:6451:: with SMTP id j17mr1661370uap.103.1550462373732;
        Sun, 17 Feb 2019 19:59:33 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id d134sm6129910vkf.18.2019.02.17.19.59.32
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Feb 2019 19:59:32 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id c5so3467574uaq.7
        for <linux-doc@vger.kernel.org>; Sun, 17 Feb 2019 19:59:32 -0800 (PST)
X-Received: by 2002:ab0:470d:: with SMTP id h13mr10634505uac.122.1550462372286;
 Sun, 17 Feb 2019 19:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20190217220836.GA41179@beast> <CAHC9VhSdW+eLx3RNwMZ-Wn7BUv9ayPubZLxSZzSj_ab-k84ZGQ@mail.gmail.com>
In-Reply-To: <CAHC9VhSdW+eLx3RNwMZ-Wn7BUv9ayPubZLxSZzSj_ab-k84ZGQ@mail.gmail.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Sun, 17 Feb 2019 19:59:20 -0800
X-Gmail-Original-Message-ID: <CAGXu5j+Cy_Ku=1zyLpXLnJXNKieu3L_SZq3Rn_D0jm=N5szt9Q@mail.gmail.com>
Message-ID: <CAGXu5j+Cy_Ku=1zyLpXLnJXNKieu3L_SZq3Rn_D0jm=N5szt9Q@mail.gmail.com>
Subject: Re: [PATCH] doc: sctp: Merge and clean up rst files
To:     Paul Moore <paul@paul-moore.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Richard Haines <richard_c_haines@btinternet.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        SELinux <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Feb 17, 2019 at 6:56 PM Paul Moore <paul@paul-moore.com> wrote:
> On Sun, Feb 17, 2019 at 5:08 PM Kees Cook <keescook@chromium.org> wrote:
> > The SCTP sections were ending up at the top-level table of contents
> > under the security section when they should have be sections with the
> > SCTP chapters. In addition to correcting the section and subsection
> > headings, this merges the SCTP documents into a single file to organize
> > the chapters more clearly, internally linkifies them, and adds the
> > missing SPDX header.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>
> [NOTE: adding the SELinux list to the CC line]
>
> Looks good to me, thanks for the fixes/cleanup.
>
> Are you planning this to go via the doc tree, or would you like me to
> grab it for the SELinux tree?  Either way is fine with me.
>
> Acked-by: Paul Moore <paul@paul-moore.com>

Thanks! I figured it'd go via the docs tree since it's mainly moving
files around in there. I figure it's up to Jon. :)

-- 
Kees Cook
