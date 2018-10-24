Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A32D37D082
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Oct 2018 20:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbeJYElt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Oct 2018 00:41:49 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:40802 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbeJYElt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Oct 2018 00:41:49 -0400
Received: by mail-yw1-f66.google.com with SMTP id l79-v6so2625380ywc.7
        for <linux-doc@vger.kernel.org>; Wed, 24 Oct 2018 13:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=TsdzQEsCFRB5ZvlDDE9nNL5K9y4g+QaqTv54PLCe7kA=;
        b=FgNSvNZTM6k8BDFlft3do1gGJGEjgfhqRCLx2EMcFcYNiHAhNERWCbUgZUOndN9ToK
         LbZY1/jlAHvd/IqrDvOBV1d5rlyDewiY+i32BsjpjdR3/vz+V/FZPA4O70PhNzHf7ARL
         fmypCoDLv9yDoeNJPNPCJ7hGmTK7B9W0lhrSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=TsdzQEsCFRB5ZvlDDE9nNL5K9y4g+QaqTv54PLCe7kA=;
        b=kBWN11ZmD3caKvQqVXVwzMw0UJiC4LFd6fw44yb/hrATruLwb9djgPbrDLxk2oSX+X
         WzV5ut4s3dG6endCi/EwCAonYdPevn0jBdPDtFenUm1iaZxqrBSl+zSE9ExMrYoAdzYI
         alN18IPrR++/Dn9mWVy0VOWNYIx4UOUH3T4oyZzyBTn9d9lc6UEXN3IgXDIGScGn0MDc
         Yb1W3EjaabA8rBWMcUON7kEsEFx1lQnZ2HFJ7OVfL4m97+2B4hQNxTpnpedfes48e1KV
         eKRM+taL+mYsjAbup7GBJpyyKFvb+NjCJEatoIqgbZHzS7WTyS/rG/DmWHLPNOMMU/D5
         QSCQ==
X-Gm-Message-State: AGRZ1gL/P4Qy+3fljXb8OLNSgYo+lp3AtbaLC4VOV5XAqePgHdhKYBDB
        RkDCTpy4f624f2nIAKqHkRo27MjfSTM=
X-Google-Smtp-Source: AJdET5eF5jrJdn0FDiaxpoHK6W5tK4lkrXlYghcTgQTiNZo3zIRvTnhbUsWlVHuWRAjR2ClDFQSEuw==
X-Received: by 2002:a81:7307:: with SMTP id o7-v6mr3746477ywc.183.1540411939021;
        Wed, 24 Oct 2018 13:12:19 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id d136-v6sm1478757ywh.33.2018.10.24.13.12.16
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Oct 2018 13:12:17 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id n140-v6so2695770yba.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Oct 2018 13:12:16 -0700 (PDT)
X-Received: by 2002:a25:3588:: with SMTP id c130-v6mr3791627yba.410.1540411936234;
 Wed, 24 Oct 2018 13:12:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3990:0:0:0:0:0 with HTTP; Wed, 24 Oct 2018 13:12:15
 -0700 (PDT)
In-Reply-To: <33754ab5-5c7a-b174-0ad6-195323a169f1@schaufler-ca.com>
References: <20181011001846.30964-1-keescook@chromium.org> <CAGXu5jLBaHj5MhXaK-8zdu6Rgo2B6rEq+at17xZ1Puct+YUajQ@mail.gmail.com>
 <ZhaXhoElmWQlsxHmgFHpB2xSWzJYFZWBasrSKQNjGj4_T2A4AY2F9v1rP9LkUfilUbZ0ExWXX9koLNjUM8S6baX6xfSSMPXY_CpihbCetVc=@protonmail.ch>
 <CAGXu5j+kekUdcE2EhUu__8MXJ1O+D=-zTXLGNCRVa_VyDxePpw@mail.gmail.com>
 <f68e5f4b-6360-a9e7-597f-89d1d3ca73c1@canonical.com> <32stV62RmME8Dj5jKB8Z03zPe_Et72kMo71D8SpgSOHUo6SaROc8DomMWdk5jDGpyqVd8T63NIIK2NdDw95clpF8Uj47Wca2FBFItXDRh7E=@protonmail.ch>
 <38dde301-d77e-35fd-88d4-5cdc5b570ee8@canonical.com> <_CkJnKYmEZ4ZF0JtsSYuahAd9sgnX9OtcstjXaeqb8wn5uxfimc6S4jomly7If9VqnOXqXwaiCbJ9ttS6NiqE7n6cQUlwLvfO53paLmacvU=@protonmail.ch>
 <8251564f-ba7a-1777-a606-dec472b32f35@canonical.com> <CAGXu5j+2yVZ5DQHyqvJKnSYYqRCzeMtEabBwYFOWkTcwMUWhEw@mail.gmail.com>
 <96e92224-aedf-5026-d6dd-b29121b4dc0d@schaufler-ca.com> <CAGXu5jKFqtV_NFRaXPKVgNQt3F1pwFqopDLp1ZQJDGM_Bdid6Q@mail.gmail.com>
 <63410d08-d0d1-8cd9-5d9e-70d95a1a8ca0@schaufler-ca.com> <33754ab5-5c7a-b174-0ad6-195323a169f1@schaufler-ca.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Wed, 24 Oct 2018 13:12:15 -0700
X-Gmail-Original-Message-ID: <CAGXu5jLyn6mLKFK+RuBkYWenm8sXXR+yqJ3VzVCpUqOVmru_XA@mail.gmail.com>
Message-ID: <CAGXu5jLyn6mLKFK+RuBkYWenm8sXXR+yqJ3VzVCpUqOVmru_XA@mail.gmail.com>
Subject: Re: [PATCH security-next v5 00/30] LSM: Explict ordering
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     John Johansen <john.johansen@canonical.com>,
        Jordan Glover <Golden_Miller83@protonmail.ch>,
        James Morris <jmorris@namei.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Paul Moore <paul@paul-moore.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        LSM <linux-security-module@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 24, 2018 at 1:56 AM, Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 10/23/2018 12:05 PM, Casey Schaufler wrote:
>> On 10/23/2018 11:50 AM, Kees Cook wrote:
>>
>>> Did you poke around at my combined series?
>>> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=lsm/ordering-v6-blob-sharing
>> I hope to do that on the plane later today.
>
> I had a chance to poke at the combined series and it
> all seems to work as advertised.

/me stares at John, Paul, and Stephen. Hurry up and get off your planes! ;)

-Kees

-- 
Kees Cook
