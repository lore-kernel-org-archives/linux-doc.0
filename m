Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 661867D087
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Oct 2018 22:39:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbeJBFTC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 01:19:02 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:33116 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbeJBFTC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 01:19:02 -0400
Received: by mail-yb1-f193.google.com with SMTP id u88-v6so4432ybi.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 15:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=UMzJokdN836gOh5JAgIVLjCkTlz0ooJGNhxCcGJyP+w=;
        b=oPwhyJMemd0B4pNTa9TnSGo0z51tzG9fA7HhMGTMc7mr3rAZvdxdFtBpA9nbLou/rH
         bUC6MGt26lYWo1p+/IcqVeyOT7lTa4b0Fiuu7i0xElg4vblKUwuW24B1dlnSqBEWTBTC
         ShTLjvl2Ki9YeDtkNox/KUgQ1L7M1WBgPNSfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=UMzJokdN836gOh5JAgIVLjCkTlz0ooJGNhxCcGJyP+w=;
        b=G6p9k6gbA6BEoMolrNnVXdNZcrPDEOwHN7STv8oUHBSMbwazNf+F5aV/2nVIoQ244E
         RP0ESNNyuITIvCICBie3/6K1nXfNBjaXf2qdVMpZF2yEijfDVF/YAMeJs3C0sjkQjxud
         cRE9pSvjQFc07PkHNKfj6yHy6Bnjg1Q8eAUYT05euy+D9qEwpgZ/FIaxBRD2TmLr7nOZ
         bv3ckyaUEb8A3uLbiEcN7O/Zj3rSRcV+B5Lnk1Y9F1Vv79SeL1D0/3QDCZ75Jty+k3PD
         ihzskxyIiZRzV597EPY/D41/sQ9nwtOi0rCR7Kkdz8M8AvI0I9wSM5cwCrkDsA+DOWEL
         2BOg==
X-Gm-Message-State: ABuFfoiQvq8SfPASW1VYObP6X2/loNnlCAhUWWkKZusTPV5C52+hhNJc
        ykvcwa/S9XuisJVOZmwcmxorK3vjprw=
X-Google-Smtp-Source: ACcGV62c+srOHijgevT6nfTs9eJRhdmjWpLAQl8BzzjkBFBiLPURyaVkACNN7ixxkUYwEK9dv2b5fQ==
X-Received: by 2002:a5b:983:: with SMTP id c3-v6mr2300592ybq.409.1538433539486;
        Mon, 01 Oct 2018 15:38:59 -0700 (PDT)
Received: from mail-yw1-f43.google.com (mail-yw1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id g126-v6sm5732199ywd.41.2018.10.01.15.38.56
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Oct 2018 15:38:57 -0700 (PDT)
Received: by mail-yw1-f43.google.com with SMTP id e201-v6so6242617ywa.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 15:38:56 -0700 (PDT)
X-Received: by 2002:a81:2908:: with SMTP id p8-v6mr7166457ywp.407.1538433536573;
 Mon, 01 Oct 2018 15:38:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Mon, 1 Oct 2018 15:38:55 -0700 (PDT)
In-Reply-To: <20181001172315.225d18dc@gandalf.local.home>
References: <20180925001832.18322-1-keescook@chromium.org> <20180925001832.18322-5-keescook@chromium.org>
 <b169724f-c6c2-f4c0-806b-c8e23819ea6a@canonical.com> <20181001172315.225d18dc@gandalf.local.home>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 1 Oct 2018 15:38:55 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJbO7c0Hiw8_9hhkbo74c-56g5ppW8g1ynyPt-WsLaxRw@mail.gmail.com>
Message-ID: <CAGXu5jJbO7c0Hiw8_9hhkbo74c-56g5ppW8g1ynyPt-WsLaxRw@mail.gmail.com>
Subject: Re: [PATCH security-next v3 04/29] LSM: Remove initcall tracing
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     John Johansen <john.johansen@canonical.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Abderrahmane Benbachir <abderrahmane.benbachir@polymtl.ca>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
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

On Mon, Oct 1, 2018 at 2:23 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Mon, 1 Oct 2018 14:07:55 -0700
> John Johansen <john.johansen@canonical.com> wrote:
>
>> On 09/24/2018 05:18 PM, Kees Cook wrote:
>> > This partially reverts commit 58eacfffc417 ("init, tracing: instrument
>> > security and console initcall trace events") since security init calls
>> > are about to no longer resemble regular init calls.
>> >
>> > Cc: James Morris <jmorris@namei.org>
>> > Cc: "Serge E. Hallyn" <serge@hallyn.com>
>> > Cc: Abderrahmane Benbachir <abderrahmane.benbachir@polymtl.ca>
>> > Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
>> > Cc: linux-security-module@vger.kernel.org
>> > Signed-off-by: Kees Cook <keescook@chromium.org>
>>
>>
>> Reviewed-by: John Johansen <john.johansen@canonical.com>
>>
>> though I do think it would be a good idea to add a new set
>> of trace points, but that can come as a separate patch
>>
>>
>
> Agreed.

BTW, how would this look? I'm not familiar with adding new tracepoints...

-Kees

-- 
Kees Cook
Pixel Security
