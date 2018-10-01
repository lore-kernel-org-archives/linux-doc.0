Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E70D27D08D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Oct 2018 23:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbeJBGSi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 02:18:38 -0400
Received: from mail-yw1-f48.google.com ([209.85.161.48]:45582 "EHLO
        mail-yw1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbeJBGSi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 02:18:38 -0400
Received: by mail-yw1-f48.google.com with SMTP id v198-v6so34596ywg.12
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 16:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=XlzRVP5lKWv4LNLVaxHuF+5oEpeGtFvtjkJPXnHwLmc=;
        b=ZHCJwBH0NsNTCoJCYVEVIFVviLZE55GWjH3HNV/YNHhYqDhH43gR8E3SJSlHceYiJT
         XqKpRcRXN/TJ5mgd5suFztHggkMW6BVtJugZ21BC0tMgFgN+eUTS66ldYbdWO5RV9Ow3
         oQ82qOIY9CTedRLm9V2PAjd2h5n/bC7Cf0d54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=XlzRVP5lKWv4LNLVaxHuF+5oEpeGtFvtjkJPXnHwLmc=;
        b=JPgGwLTjQJWOC6xWw9RLR3pX7+NdxpqQh0sJEmzgsRd4dnVqoN5rz8xgK4hqHFtt1q
         oCOYA0ounj6qWA0Vp9Dm5dDFNkDA5KQKXUgGy9BgYP2QCT0iVxW2nfAN+kwHOFl304to
         MFtY7iutMT5+wFnIXqksoYQUQieMgTApE+gnuKTxcpASk0zJ6lH6iBax+FLSQq5GDPlZ
         IWJ6s0HyUsz8M9l8DygC/ypQ798lflq0kQH5Rw9tTrRljiaBNAR7HaLS96wP8V0yZQM0
         Ath01eNf4fV0q6E4Fzc9H64/0Dp+g9OzADwDynTmhXuXV35+vg24TfinKypWQLyZTEKM
         WHrg==
X-Gm-Message-State: ABuFfogX6TCRe3lajhNdJDg4opkNz1GaqkUSYR/pJdxhJXIixA4wLUsA
        fsN3tKviBhUvY8cnOsLxX5hXEr9Sz/s=
X-Google-Smtp-Source: ACcGV62bqrn6NLLfMs9ey0C51sN+uUr5DZSJNxa9ZLIcHP+HNsEBBCJitJtgYV7tcifS/hoY6SKLBQ==
X-Received: by 2002:a0d:f284:: with SMTP id b126-v6mr7122664ywf.469.1538437102737;
        Mon, 01 Oct 2018 16:38:22 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 138-v6sm5627906ywj.11.2018.10.01.16.38.21
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Oct 2018 16:38:21 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id w80-v6so35212ybe.10
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 16:38:21 -0700 (PDT)
X-Received: by 2002:a25:238d:: with SMTP id j135-v6mr7127848ybj.137.1538437100765;
 Mon, 01 Oct 2018 16:38:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Mon, 1 Oct 2018 16:38:20 -0700 (PDT)
In-Reply-To: <CAGXu5jJheexJgnJ+OWaDoRFraqm9yxj1Vr290tfZ7kELBPUpAw@mail.gmail.com>
References: <20180925001832.18322-1-keescook@chromium.org> <20180925001832.18322-19-keescook@chromium.org>
 <68e4e323-3216-7e77-2807-c3207126ae68@canonical.com> <CAGXu5j+jzmFh-iuXDVHQTq7e=mftpfaqS-45TP_UR3B+qtGcLQ@mail.gmail.com>
 <9b3e1733-7cfa-5047-1422-0f9d92d88d39@canonical.com> <CAGXu5jJheexJgnJ+OWaDoRFraqm9yxj1Vr290tfZ7kELBPUpAw@mail.gmail.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 1 Oct 2018 16:38:20 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJ6ZDs1hZTX9jS9w2MmecbcbMcn6iAmGuyCBbThyjv_iA@mail.gmail.com>
Message-ID: <CAGXu5jJ6ZDs1hZTX9jS9w2MmecbcbMcn6iAmGuyCBbThyjv_iA@mail.gmail.com>
Subject: Re: [PATCH security-next v3 18/29] LSM: Introduce lsm.enable= and lsm.disable=
To:     John Johansen <john.johansen@canonical.com>
Cc:     Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
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

On Mon, Oct 1, 2018 at 4:30 PM, Kees Cook <keescook@chromium.org> wrote:
> If we keep it, "apparmor=0 lsm_enable=apparmor" would mean it's
> enabled. Is that okay?

Actually, what the v3 series does right now is leaves AppArmor and
SELinux alone -- whatever they configured for enable/disable is left
alone.

The problem I have is when processing CONFIG_LSM_ENABLE ... what do I
do with the existing "enable" flag? It's set by both
CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE and apparmor=0/1.

Right now I can't tell the difference between someone booting with
apparmor=0 or CONFIG_LSM_ENABLE not including apparmor.

i.e. how do I mix CONFIG_LSM_ENABLE with apparmor=0/1? (assuming
CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE has been removed)

-Kees

-- 
Kees Cook
Pixel Security
