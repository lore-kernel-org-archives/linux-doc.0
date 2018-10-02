Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 891A67D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 21:38:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbeJCEXg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Oct 2018 00:23:36 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:34384 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727271AbeJCEXf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Oct 2018 00:23:35 -0400
Received: by mail-yb1-f196.google.com with SMTP id 184-v6so1486251ybg.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 14:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=9U346hGaAvFdwuDfRtVfUPZUdxyBrP9tyHzIfWdZO6U=;
        b=NMiT4lOj6R7864F2apfpBwr9YrJZaHu1v1M1lJlUKGQGxn8IVg/nvC8ctMgg6veLuF
         TfU1+CDk3xeswoLTq4PSmrhqYLUfgDrne/W3SjpfDwdx7RRopnP5AaDiMGEWdTu1gDp6
         CNVyunL879b84Grv/g2tsu+HPjc6gEQsw7FJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=9U346hGaAvFdwuDfRtVfUPZUdxyBrP9tyHzIfWdZO6U=;
        b=Rw8BQRmUIMdolXSBDeE7pK9lq/PUs0Y9+UdAdKAXbvw5YzFMRBBSaaWcH9Y/5gKeKH
         fG0rsg0tH/56iqBoBWV8McgUM/OdIwColRz6JyTTbgMMsnJGLNkS/jM8j0JdXdNAH3DN
         EKkR0zeA3a+y830i3DOQH4jlvgreeRnk+YlG85QeoaItajHhlVebBfZHN8E8htEbYIiH
         Z1Nj+397AuzpyoDDNAJjDboOxp0XmhkBhC8eJJ2Tel+dEfexjJoYOLPOr9XuseAcUR4P
         lfyr7eDH1NMyLgoTPtxYUWAAn5VtetWLasnHjj72d/tfi66aGVsOiJ/geSZP/3/hdXiV
         qAIQ==
X-Gm-Message-State: ABuFfoj6JbhjcMZ9Z7G8/nHN5A7YOUepcmx5Rx/iWhuPLcDknG8uHHM2
        qx/Vm76Nx707A719P6j0BYF8a+Jjj0o=
X-Google-Smtp-Source: ACcGV60XU2VHUF3hhe9dav9genrR+09dOXs6hSUV5mBzPMGP+LchEsSf+LCFIL+sfHqlED91XY3gLg==
X-Received: by 2002:a25:4ec5:: with SMTP id c188-v6mr9058510ybb.522.1538516291252;
        Tue, 02 Oct 2018 14:38:11 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id j186-v6sm6262075ywd.88.2018.10.02.14.38.06
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 14:38:07 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 5-v6so1483241ybf.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 14:38:06 -0700 (PDT)
X-Received: by 2002:a25:2395:: with SMTP id j143-v6mr1547958ybj.137.1538516286591;
 Tue, 02 Oct 2018 14:38:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 14:38:05 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.21.1810030719040.23596@namei.org>
References: <20181002005505.6112-1-keescook@chromium.org> <20181002005505.6112-11-keescook@chromium.org>
 <alpine.LRH.2.21.1810030719040.23596@namei.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 2 Oct 2018 14:38:05 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJRFv_e7_-hAnuuEoC90JPXG2aTaHJ98_UaoS_4R1mYtg@mail.gmail.com>
Message-ID: <CAGXu5jJRFv_e7_-hAnuuEoC90JPXG2aTaHJ98_UaoS_4R1mYtg@mail.gmail.com>
Subject: Re: [PATCH security-next v4 10/32] LSM: Don't ignore initialization failures
To:     James Morris <jmorris@namei.org>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
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

On Tue, Oct 2, 2018 at 2:20 PM, James Morris <jmorris@namei.org> wrote:
> On Mon, 1 Oct 2018, Kees Cook wrote:
>
>> LSM initialization failures have traditionally been ignored. We should
>> at least WARN when something goes wrong.
>
> I guess we could have a boot param which specifies what to do if any LSM
> fails to init, as I think some folks will want to stop execution at that
> point.
>
> Thoughts?

I'm not opposed, but I won't author it because Linus will yell at me
about introducing a "machine killing" option.

-Kees

-- 
Kees Cook
Pixel Security
