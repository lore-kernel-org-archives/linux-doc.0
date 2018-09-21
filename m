Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B3EFC7D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 00:45:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbeIUGcE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 02:32:04 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:38230 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbeIUGcE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 02:32:04 -0400
Received: by mail-yb1-f196.google.com with SMTP id e190-v6so4748804ybb.5
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 17:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=oFFn2fddJUC7h/bsRsumKvXPCeb/oLa4VBcDP7kxCfo=;
        b=bmP+GiPVcF7sEsVo5kAw4mHKtI8HEKKeGwg3eM1j0BISBWBVxmlZgDx7E3Q1GG44In
         uAFN3k42YgvNTJNZrD8O1JqLOZL9OGjXZ0Wnu7tRqhNJbXQ3zgGqQ7tZ1SP+7Dr6TR1J
         TsFu1XFFIf/z+nKdQyNZfkA8EbLKr0Hc0hLTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=oFFn2fddJUC7h/bsRsumKvXPCeb/oLa4VBcDP7kxCfo=;
        b=VMVGnG/OG7M7eO+aorMhzMKBOLGARH9vxZlTEQ9kdTR1OozaPsl//8dD+ycylvfbdN
         RoIAR5DPUCYTuTpzvTpm9xdMsWWtQr1H2fOTDx2yFvGNaAJQnIOkv9Bz1mb2zyBH1G7v
         bJA5bvevPXhJ/46pJFQyxweOHPKDICuMnLCDVvy1awI2CmF7a9EwtCLexgkc841kt0ZM
         pTC6UPPLM4sOuGsgEVSqFxRxgos4LJsugP+ZaH4ZOlMWfhD8YNdZ1GD97naXFT9qh4ZT
         zm5oVYB4YHMDZ8sLlQhe6E72aqY1IDbQcnENrvCTwtWrN1Lu4sa/yNO9GoedFaZcp1gh
         +8mg==
X-Gm-Message-State: APzg51DpK9MJw7Xeg9UiMbQqFb9onHJbxtV40PtnHZ3xEzE2t39y4Uc8
        RLOHCCkLi8wj+NQHDxCR0LaW3ZHMJPg=
X-Google-Smtp-Source: ANB0VdZb2DsvkK+nxedGNh5NfAQxh3l6/79LKR4egwMUmwBvzid9SP8FIMwoK/pydkDDIUutr6ZEkw==
X-Received: by 2002:a25:4bc7:: with SMTP id y190-v6mr19385167yba.228.1537490750389;
        Thu, 20 Sep 2018 17:45:50 -0700 (PDT)
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id t10-v6sm3795962ywg.74.2018.09.20.17.45.48
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Sep 2018 17:45:48 -0700 (PDT)
Received: by mail-yw1-f54.google.com with SMTP id b2-v6so389478ywe.11
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 17:45:48 -0700 (PDT)
X-Received: by 2002:a81:1194:: with SMTP id 142-v6mr19482513ywr.168.1537490747984;
 Thu, 20 Sep 2018 17:45:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:5f04:0:0:0:0:0 with HTTP; Thu, 20 Sep 2018 17:45:47
 -0700 (PDT)
In-Reply-To: <a0165ce9-d15b-eaef-a5e8-2aeb6bdc69f6@schaufler-ca.com>
References: <20180920162338.21060-1-keescook@chromium.org> <20180920162338.21060-27-keescook@chromium.org>
 <a0165ce9-d15b-eaef-a5e8-2aeb6bdc69f6@schaufler-ca.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 20 Sep 2018 17:45:47 -0700
X-Gmail-Original-Message-ID: <CAGXu5j++wXMUXuqT7m5MZdeXqO=i7RgyKZoLwELfSTx6UPOVSA@mail.gmail.com>
Message-ID: <CAGXu5j++wXMUXuqT7m5MZdeXqO=i7RgyKZoLwELfSTx6UPOVSA@mail.gmail.com>
Subject: Re: [PATCH security-next v2 26/26] LSM: Add all exclusive LSMs to
 ordered initialization
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     James Morris <jmorris@namei.org>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        LSM <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 20, 2018 at 5:25 PM, Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 9/20/2018 9:23 AM, Kees Cook wrote:
>>  config LSM_ORDER
>>       string "Default initialization order of builtin LSMs"
>> -     default "yama,loadpin,integrity"
>> +     default "yama,loadpin,integrity,selinux,smack,tomoyo,apparmor"
>
> If I want to compile all the major modules into my kernel and use
> AppArmor by default would I use
>
>         default "yama,loadpin,integrity,apparmor,selinux,smack,tomoyo"
>
> or
>
>         default "yama,loadpin,integrity,apparmor"

I was expecting the former, but the latter will have the same result.

> When we have "blob-sharing" how could I compile in tomoyo,
> but exclude it without a boot line option?

Ooh, yes, this series has no way to do that. Perhaps
CONFIG_LSM_DISABLE in the same form as CONFIG_LSM_ORDER? I would
totally remove LoadPin's CONFIG for this in favor it.

> When we have full stacking, how could I compile in selinux
> but exclude it?

Yup, same problem. Same suggested solution?

Should lsm.enable/disable= also become a comma-separated list, or
should I leave it as a multi-instance thing like I have it?

-Kees

-- 
Kees Cook
Pixel Security
