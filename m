Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EF4497DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 00:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388718AbeIUGXe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 02:23:34 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:34131 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbeIUGXe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 02:23:34 -0400
Received: by mail-yb1-f193.google.com with SMTP id 184-v6so4757157ybg.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 17:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Um6y7SxnsgwmD0u5AQ7dCU67I9NHlPBN99PY01BVHTQ=;
        b=WDQu/Yu1ryaa/ziSXjgGc/cHX/UCH+CMQj7etkY5qVoGZSlYj2kVdumXfXIl+Hy0Ek
         XfahZeaTeKCjO6FWE7d+L9wnK04Mbj/yNTbQW5APqYisZEy+UHNjteEAIMIUTxTd31m4
         m9rYtUl+fTRQ74DMEV1MjhSf3fcuX+rqvZx9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Um6y7SxnsgwmD0u5AQ7dCU67I9NHlPBN99PY01BVHTQ=;
        b=Vy7qDAuDIRCDA6BZnvFDDwDS374RMowrakfKTW9K6xWd7l3I2A0s9J6kcX+2ecnxr6
         5pw9n4PAbKwM7/PyH8y9VVfGH8iTt9XXfSfi6XHtw9KOS424F2MBw/iC8jN+NJgB/3u1
         p7Fww+YcNaYezDliK4qHwX9cCDJzdZsEhhtOOUGVOd9LzYGUuRByp1+zzmXSioa/FwPO
         0ydvW8ZeHsZ4AVnrzpeR7GybzQvKj07j5pODvA96XJX3j/Wl6DEqN89DCY4Ypbsf1jeU
         WLcZIHPbLpEdr5XE8cqYMYnc+3xYpKgVMX6WP7BWHK3gIivhExl4dYTBvSk25MPI1AGK
         zdyw==
X-Gm-Message-State: APzg51BX2jHbdaHjFa/aLHVSEvdRygv6096pzX20hMfxpTH5b9pNFQMn
        pyK8igT52VB8+8gvfGCVyyQeI+NzZtk=
X-Google-Smtp-Source: ANB0VdY6074fJSdwLWzw8eTsWnm/v/Gjq7AxxxtDS/my2LBm1riHX8IvImqsqdfhckt0SMNVQdNChg==
X-Received: by 2002:a25:4e0b:: with SMTP id c11-v6mr19770993ybb.367.1537490242768;
        Thu, 20 Sep 2018 17:37:22 -0700 (PDT)
Received: from mail-yw1-f52.google.com (mail-yw1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id n187-v6sm13164758ywn.76.2018.09.20.17.37.19
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Sep 2018 17:37:19 -0700 (PDT)
Received: by mail-yw1-f52.google.com with SMTP id q129-v6so4535892ywg.8
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 17:37:19 -0700 (PDT)
X-Received: by 2002:a0d:d347:: with SMTP id v68-v6mr2395001ywd.124.1537490238838;
 Thu, 20 Sep 2018 17:37:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:5f04:0:0:0:0:0 with HTTP; Thu, 20 Sep 2018 17:37:18
 -0700 (PDT)
In-Reply-To: <d12fc06e-ff16-63c9-34ba-7303205b0a1d@schaufler-ca.com>
References: <20180920162338.21060-1-keescook@chromium.org> <20180920162338.21060-19-keescook@chromium.org>
 <d12fc06e-ff16-63c9-34ba-7303205b0a1d@schaufler-ca.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 20 Sep 2018 17:37:18 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJRHN6hMwk49Ss8knSX4CJa0UkWe0pPMHbnFGwECjo_rw@mail.gmail.com>
Message-ID: <CAGXu5jJRHN6hMwk49Ss8knSX4CJa0UkWe0pPMHbnFGwECjo_rw@mail.gmail.com>
Subject: Re: [PATCH security-next v2 18/26] LSM: Build ordered list of ordered
 LSMs for init
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

On Thu, Sep 20, 2018 at 5:04 PM, Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 9/20/2018 9:23 AM, Kees Cook wrote:
>> This constructs a list of ordered LSMs to initialize, using a hard-coded
>> list of only "integrity": minor LSMs continue to have direct hook calls,
>> and major LSMs continue to initialize separately.
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Do you think that this mechanism will be sufficiently
> flexible to accommodate dynamically loaded security modules
> in the future? While I am not personally an advocate of
> dynamically loaded security modules I have been working to
> ensure that I haven't done anything that would actively
> interfere with someone who did.

I don't think it does, no. This is all just the boot time
initialization order, so a dynamic LSM would be unchanged: it would
initialize at module load time. :)

-Kees

-- 
Kees Cook
Pixel Security
