Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9B1F77D8D4
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Nov 2018 20:49:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbeKCF5w (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 3 Nov 2018 01:57:52 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:37065 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbeKCF5v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Nov 2018 01:57:51 -0400
Received: by mail-yw1-f68.google.com with SMTP id v77-v6so1290484ywc.4
        for <linux-doc@vger.kernel.org>; Fri, 02 Nov 2018 13:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=AdbRP1e8hhSctEX2RFnFJdxI7Ntlt0NMbsw9ytVJYUQ=;
        b=MZYRd/eHgIPhy4q251SCFQz1FbPFZ2DATzZ72cqhh0z59yxwEZeaeJxElQo3rkIg8r
         66DpVpmMkRxdfasZ9XGXCa5VrZwEwR0DUm2vpUUoLaDrZvU3ydBRop6FG/ZZf4MlOQpB
         vknMJ6EbPx2O443vkScDvzm/jGerGHoLcUHRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=AdbRP1e8hhSctEX2RFnFJdxI7Ntlt0NMbsw9ytVJYUQ=;
        b=HIBCpgUDYD1TvBpXBIUEO0gAoplEVTTWz5QsmrDk49xQiEdN0AE97qTmFkFbdsvA2m
         9BlIpCWZHoEjdfA+x8ORjGTdpJ2waXeHy2nfsNOYAS84U2p3f595/44aN0+mG6Jdllqg
         ++NIDLFp4tZvpDhYNq/upzFl1Ylp6fzXcMeCsFhaxV6eSZe2mWyitWVmhFjgoGJsuqEK
         T3bete4NZJmTn76O4O7hBEwyf96C2qXRqm3p+0255HC7YqM57mqGMety4V6+bEDcblFF
         5WrcwkHWxPwLWd10uR171tUhSuy4BIFgNQ76AiCB+KkTMFPhdyQZo4r203LuRIUnIGCm
         Zn0w==
X-Gm-Message-State: AGRZ1gKfwi4Q8fuKpEp1BV5YeRGTwxJJY9tCf01OeckM+DurgqxCxQ6+
        ixrpoT4Fr2a1V0iG8qzLYWwX594dMBI=
X-Google-Smtp-Source: AJdET5c/sUlCz+uleU7MrVGSgf2E56jHUiRWqfjQy40jNQ7jJ4epWhYPYlFSY6AZWgCNeB75Jud6sQ==
X-Received: by 2002:a81:ad11:: with SMTP id l17-v6mr12779356ywh.417.1541191752341;
        Fri, 02 Nov 2018 13:49:12 -0700 (PDT)
Received: from mail-yw1-f47.google.com (mail-yw1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 123-v6sm8956082ywu.91.2018.11.02.13.49.10
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Nov 2018 13:49:10 -0700 (PDT)
Received: by mail-yw1-f47.google.com with SMTP id h21-v6so1291973ywa.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Nov 2018 13:49:10 -0700 (PDT)
X-Received: by 2002:a0d:fec6:: with SMTP id o189-v6mr13322078ywf.237.1541191749802;
 Fri, 02 Nov 2018 13:49:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3990:0:0:0:0:0 with HTTP; Fri, 2 Nov 2018 13:49:09 -0700 (PDT)
In-Reply-To: <1541182406.20901.31.camel@linux.ibm.com>
References: <20181011001846.30964-1-keescook@chromium.org> <20181011001846.30964-13-keescook@chromium.org>
 <1541182406.20901.31.camel@linux.ibm.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Fri, 2 Nov 2018 13:49:09 -0700
X-Gmail-Original-Message-ID: <CAGXu5jKM_goC2519EXZu7Bh0VoW8jQeR=AJ0XovUPe4_635XNw@mail.gmail.com>
Message-ID: <CAGXu5jKM_goC2519EXZu7Bh0VoW8jQeR=AJ0XovUPe4_635XNw@mail.gmail.com>
Subject: Re: [PATCH security-next v5 12/30] LSM: Provide separate ordered initialization
To:     Mimi Zohar <zohar@linux.ibm.com>
Cc:     James Morris <jmorris@namei.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Paul Moore <paul@paul-moore.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jordan Glover <Golden_Miller83@protonmail.ch>,
        LSM <linux-security-module@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 2, 2018 at 11:13 AM, Mimi Zohar <zohar@linux.ibm.com> wrote:
> I don't recall why "integrity" is on the security_initcall, while both
> IMA and EVM are on the late_initcall().

It's because integrity needs to have a VFS buffer allocated extremely
early, so it used the security init to do it. While it's not an LSM,
it does use this part of LSM infrastructure. I didn't see an obvious
alternative at the time, but now that I think about it, maybe just a
simple postcore_initcall() would work?

-Kees

-- 
Kees Cook
