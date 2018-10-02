Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B55C97D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 04:49:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbeJBLa5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 07:30:57 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:39037 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbeJBLa5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 07:30:57 -0400
Received: by mail-yw1-f68.google.com with SMTP id v1-v6so268347ywv.6
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 21:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=L/iz8UGDhqnhQj14wynEEGVGj6CSwWszHDf61Vdh6eA=;
        b=VbNZXoJmnWC1w45hkLStsc8iddHSdBp2k4Mt/MM+ztPG8n/P3SWUZUltyFVtGDCw6P
         W8XX+xcaxke590MdOoIZix3BaFn6cwJpqP1Ss828Tig1csdWOSdA+TQHK2ntxvzfTM23
         tJYCzp5T/G3FXZylyqTiq/5E3xXK4sJV7whi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=L/iz8UGDhqnhQj14wynEEGVGj6CSwWszHDf61Vdh6eA=;
        b=o85kqhbfO2DQd4Dca9BPkCNxUUdWrwHVilpFxwSxpuoBokY4Qluw1qzQ0eB0JQY42u
         LBE8fQNMUGi9Xu/oY6D4018CznYgxIeHrd5abGUNy+7tVJYS8JOIdOAoBMC07YryD5Sm
         sw3fudCom9UY/yJBt0BaoajZIvZGimjRTI1Z7fq+efHyEUNuhnsV3puKMtHdHCfSE+qf
         jBwzGPrMLT+0nF1oCOpHKXvu/4z0qEBkgrlro35aB0MfCq1Afc5UhYOZBwJZGiuvTWo6
         goXv4x06ql4CaaMTNyUkvY/n0G+0ucvQuq6xxq5n3AmkTNRQAWd6vgu6rM4efhYtpTg5
         Am+A==
X-Gm-Message-State: ABuFfoj4A1Y8mi98y4XX4Wxvqv5lpBl19Z1w4s6uBydms3Gs8sAo46pY
        iqPnsTTMUHQlYrcnu4CHg2/TenGfmBc=
X-Google-Smtp-Source: ACcGV61EEzu4k1A+/Q3NsOheIh1m6qMNtQi2fQUF8cccZ+4DPb/X9J7DAqfosbdg8/ZohXSs8Mx5xg==
X-Received: by 2002:a81:72d5:: with SMTP id n204-v6mr7764093ywc.57.1538455780150;
        Mon, 01 Oct 2018 21:49:40 -0700 (PDT)
Received: from mail-yw1-f52.google.com (mail-yw1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id l30-v6sm15350663ywa.104.2018.10.01.21.49.38
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Oct 2018 21:49:38 -0700 (PDT)
Received: by mail-yw1-f52.google.com with SMTP id y76-v6so275972ywd.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 21:49:38 -0700 (PDT)
X-Received: by 2002:a81:2908:: with SMTP id p8-v6mr7682701ywp.407.1538455778198;
 Mon, 01 Oct 2018 21:49:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Mon, 1 Oct 2018 21:49:37 -0700 (PDT)
In-Reply-To: <ccfbe049-392d-4df5-5eb5-ea18576d4afd@infradead.org>
References: <20181002005505.6112-1-keescook@chromium.org> <20181002005505.6112-22-keescook@chromium.org>
 <ccfbe049-392d-4df5-5eb5-ea18576d4afd@infradead.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 1 Oct 2018 21:49:37 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+ND4K5GvxJ1ieLr5E=Zsfb6mGQL8yTegOXv4V4qmuZUA@mail.gmail.com>
Message-ID: <CAGXu5j+ND4K5GvxJ1ieLr5E=Zsfb6mGQL8yTegOXv4V4qmuZUA@mail.gmail.com>
Subject: Re: [PATCH security-next v4 21/32] LSM: Finalize centralized LSM
 enabling logic
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     James Morris <jmorris@namei.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
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

On Mon, Oct 1, 2018 at 6:18 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 10/1/18 5:54 PM, Kees Cook wrote:
>> Prior to this patch, default "enable" behavior was unchanged: SELinux
>> and AppArmor were controlled separately from the centralized control
>> defined by CONFIG_LSM_ENABLE and "lsm.enable=...". This changes the
>> logic to give all control over to the central logic.
>>
>> Instead of allowing SELinux and AppArmor to override the central LSM
>> enabling logic, by having separate CONFIG and boot parameters, this
>> forces all "enable" variables to disabled, then enables any listed in
>> the CONFIG_LSM_ENABLE and "lsm.enable=..." settings, and finally disables
>> any listed in "lsm.disable=...".
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>>  .../admin-guide/kernel-parameters.txt         |  6 ++--
>>  include/linux/lsm_hooks.h                     |  2 +-
>>  security/security.c                           | 32 +++++++------------
>>  3 files changed, 15 insertions(+), 25 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 67c90985d2b8..f646cfab5613 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -2279,14 +2279,12 @@
>>       lsm.disable=lsm1,...,lsmN
>>                       [SECURITY] Comma-separated list of LSMs to disable
>>                       at boot time. This overrides "lsm.enable=",
>
> better:                               This overrides "lsm.enable=" and

Eek, yes! Thank you. :)

-Kees

>
>> -                     CONFIG_LSM_ENABLE, and any per-LSM CONFIGs and boot
>> -                     parameters.
>> +                     CONFIG_LSM_ENABLE.
>>
>>       lsm.enable=lsm1,...,lsmN
>>                       [SECURITY] Comma-separated list of LSMs to enable
>>                       at boot time. This overrides any omissions from
>> -                     CONFIG_LSM_ENABLE, and any per-LSM CONFIGs and
>> -                     boot parameters.
>> +                     CONFIG_LSM_ENABLE.
>>
>>       machvec=        [IA-64] Force the use of a particular machine-vector
>>                       (machvec) in a generic kernel.
>
>
> --
> ~Randy



-- 
Kees Cook
Pixel Security
