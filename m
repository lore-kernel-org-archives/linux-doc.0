Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A3BBF7D081
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Oct 2018 01:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbeJAHgs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 1 Oct 2018 03:36:48 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:34109 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbeJAHgr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Oct 2018 03:36:47 -0400
Received: by mail-yb1-f194.google.com with SMTP id 184-v6so4968123ybg.1
        for <linux-doc@vger.kernel.org>; Sun, 30 Sep 2018 18:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=hrDNhPObw6e1fWHKYJ1uWfvaXZbb4Utsc/+r7Rmskdw=;
        b=h1R3G9vqqazOU05O83Sa8ly0oQTdyB9kCm7HW1a+/205zbM4n1UkY76CTYRQ8E8cWH
         63Ag3zvrjvff4t3a5S11whIW/PtjpJENrlToTEDrOJN5kFdgXRH2UIkaITmmuCZLvXzv
         FIfJYnIWbJ9KSBIUbJ4sYYoMnb0dldLiPC1Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=hrDNhPObw6e1fWHKYJ1uWfvaXZbb4Utsc/+r7Rmskdw=;
        b=jhPqnYYU7wc/KvEOdXCtJzxXOA9FRoZnQffOh0DEq/SrdXojgUzmmEq8lp+XY105Jk
         WR/+qFllyxTO9wbDoCX6qgJ6B6SJj3vzQJaW6td9XZXYPaEOdynIoURtkpb2bhk/BDDP
         f1GfH/xtrzlmwFRpJ293VgP1KbsCqR6YBWAURb9ZhRisnWkAiQrrEQxDxrRjm1MqGmNd
         ryfrqLw8an6ZWtX60+tvFR2M0DK2Feinz33LVp4mNFQ1gCrM7IJUqFaHe6G2IaVA4BuQ
         905MO1MsgQymPhspDQUUfn+TGJne18MX5FO34QzSbNdfgGbLds7BRz1X4KpvYgo7nK/q
         WVcg==
X-Gm-Message-State: ABuFfoh/6qPSWwZAIjj2H/530nmYIs26dyJjgn0BR+kkcVLqej8MrbMQ
        tSl/XfH/GJlwF+bxv+qP4DI/d2QHCoY=
X-Google-Smtp-Source: ACcGV62GfM8SCVIBqaTgJeMwbt9ad5T0OVfiFhVTNaoKcJjFbt5bHoVKS3KMtcXQKpvS/o/j1q2hEA==
X-Received: by 2002:a25:b08c:: with SMTP id f12-v6mr2082646ybj.396.1538355693232;
        Sun, 30 Sep 2018 18:01:33 -0700 (PDT)
Received: from mail-yw1-f52.google.com (mail-yw1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id r5-v6sm11462611ywr.80.2018.09.30.18.01.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Sep 2018 18:01:31 -0700 (PDT)
Received: by mail-yw1-f52.google.com with SMTP id y14-v6so4852979ywa.4
        for <linux-doc@vger.kernel.org>; Sun, 30 Sep 2018 18:01:31 -0700 (PDT)
X-Received: by 2002:a0d:d302:: with SMTP id v2-v6mr4726475ywd.124.1538355690627;
 Sun, 30 Sep 2018 18:01:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Sun, 30 Sep 2018 18:01:29
 -0700 (PDT)
In-Reply-To: <20180930192526.4480231c@vmware.local.home>
References: <20180925001832.18322-1-keescook@chromium.org> <20180925001832.18322-5-keescook@chromium.org>
 <20180926123522.4080d9eb@vmware.local.home> <CAGXu5jJyL7FuLRj1XxujpGs9=wUQgS4dRfeGB+HUBqy4mkEBhQ@mail.gmail.com>
 <20180930192526.4480231c@vmware.local.home>
From:   Kees Cook <keescook@chromium.org>
Date:   Sun, 30 Sep 2018 18:01:29 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJsVv9bMh831yx1y8KjhgA204hkpOEVpWzvifATw-w0cw@mail.gmail.com>
Message-ID: <CAGXu5jJsVv9bMh831yx1y8KjhgA204hkpOEVpWzvifATw-w0cw@mail.gmail.com>
Subject: Re: [PATCH security-next v3 04/29] LSM: Remove initcall tracing
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Abderrahmane Benbachir <abderrahmane.benbachir@polymtl.ca>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 30, 2018 at 4:25 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Wed, 26 Sep 2018 11:35:21 -0700
> Kees Cook <keescook@chromium.org> wrote:
>
>> On Wed, Sep 26, 2018 at 9:35 AM, Steven Rostedt <rostedt@goodmis.org> wrote:
>> > On Mon, 24 Sep 2018 17:18:07 -0700
>> > Kees Cook <keescook@chromium.org> wrote:
>> >
>> >> This partially reverts commit 58eacfffc417 ("init, tracing: instrument
>> >> security and console initcall trace events") since security init calls
>> >> are about to no longer resemble regular init calls.
>> >
>> > I'm not against the change, but how much are they going to "no longer
>> > resemble regular init calls"?
>>
>> My take on "regular" init calls is that they're always run, link-time
>> ordered, etc. The changes proposed here will make it so not all
>> initialization are run depending on runtime configurations, ordering
>> will be flexible, etc.
>>
>
> Will it still be a good idea to have a tracepoint for those calls?
> Perhaps not an  initcall tracepoint but some other kind?

I'm not opposed. It could be a follow-up patch, I assume?

-Kees

-- 
Kees Cook
Pixel Security
