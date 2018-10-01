Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 43ECE7D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Oct 2018 22:03:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726459AbeJBEnj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 00:43:39 -0400
Received: from mail-yb1-f173.google.com ([209.85.219.173]:32836 "EHLO
        mail-yb1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbeJBEni (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 00:43:38 -0400
Received: by mail-yb1-f173.google.com with SMTP id u88-v6so2007372ybi.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 15:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=G4WcYotR03OEiNZiei9M0bOlxNlJjM/PINeXng+gx/M=;
        b=lgiy8jMhzBgIGEBGrPZhMcj8TTB261UftqDh5TzpBimaxjJ1FIwdJ/GRff2r1AC6Bc
         B5R4sUiLA/1U83AoKpyhFreRdDY0RNHuj0RFSKVOEkB10C6Ds1DjNO2Xam/Tt18aLhDT
         cltTpHVsiCm5bW317fIcdRaho9chmr7VjzWhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=G4WcYotR03OEiNZiei9M0bOlxNlJjM/PINeXng+gx/M=;
        b=Qf5O3PScpfju1PYcoSOxeoLCP/WgddUE6NawycspN3kIvz51hHchaRVNh2JcdVacC4
         +HPRhDOFxY6MYIQ24v29UhFdB3tmsmYWpsPhVEvN37ePZY/ztUNU4vZKuWF5/RMZgiQF
         a509dIsojnaPRdqbdWbZQeZaP19R2O50p4fz8adnQscDVFN+cm4EXgh7DlA1eFLr/eDn
         JWv3KJU9g2ZhBUaIzsraMMqn/+HA9evSFHZayDCYadJTsdlQanpO8vXsWB3p2m+RIGKW
         dGU82RaJhi9CTpJK8BBNibGQI5WVhg2THwSiTpm+Z9MqguZpkignLSz3yk2syis0zkzm
         RZkQ==
X-Gm-Message-State: ABuFfogTgpC/pFN8CcwTpTpRCKxl9Fx84v9TiCEaLtESo9xXlWaGAQpR
        0uVPkdCd2eWDbmUCmMtOLcTimP9WPBo=
X-Google-Smtp-Source: ACcGV62lzIRqf25saqU0Ac5nKYIH6zXbOOJHBl5GPwm7LzjlGNqPH8hh8VQsmC1pOivQcahy1ywHsQ==
X-Received: by 2002:a25:acd5:: with SMTP id x21-v6mr5901503ybd.43.1538431421982;
        Mon, 01 Oct 2018 15:03:41 -0700 (PDT)
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id z130-v6sm3767443ywd.91.2018.10.01.15.03.40
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Oct 2018 15:03:40 -0700 (PDT)
Received: by mail-yw1-f41.google.com with SMTP id v1-v6so6194456ywv.6
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 15:03:40 -0700 (PDT)
X-Received: by 2002:a0d:fec6:: with SMTP id o189-v6mr7157668ywf.237.1538431419933;
 Mon, 01 Oct 2018 15:03:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Mon, 1 Oct 2018 15:03:39 -0700 (PDT)
In-Reply-To: <110c9903-0fbb-8d6f-1fd0-7731402d600f@canonical.com>
References: <20180925001832.18322-1-keescook@chromium.org> <20180925001832.18322-13-keescook@chromium.org>
 <110c9903-0fbb-8d6f-1fd0-7731402d600f@canonical.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 1 Oct 2018 15:03:39 -0700
X-Gmail-Original-Message-ID: <CAGXu5jK+WT-1QkapORpzBJDCeZSAXUf_tN0mwRU+cWy=phRdgA@mail.gmail.com>
Message-ID: <CAGXu5jK+WT-1QkapORpzBJDCeZSAXUf_tN0mwRU+cWy=phRdgA@mail.gmail.com>
Subject: Re: [PATCH security-next v3 12/29] LSM: Provide separate ordered initialization
To:     John Johansen <john.johansen@canonical.com>
Cc:     James Morris <jmorris@namei.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
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

On Mon, Oct 1, 2018 at 2:17 PM, John Johansen
<john.johansen@canonical.com> wrote:
> On 09/24/2018 05:18 PM, Kees Cook wrote:
>> This provides a place for ordered LSMs to be initialized, separate from
>> the "major" LSMs. This is mainly a copy/paste from major_lsm_init() to
>> ordered_lsm_init(), but it will change drastically in later patches.
>>
>> What is not obvious in the patch is that this change moves the integrity
>> LSM from major_lsm_init() into ordered_lsm_init(), since it is not marked
>> with the LSM_FLAG_LEGACY_MAJOR. As it is the only LSM in the "ordered"
>> list, there is no reordering yet created.
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>
> I know its already being done, but I don't like splitting the init
> order

Can you describe what you mean here? Do you mean having two init
functions? This is only done temporarily while the other pieces are
reorganized. The later patches reintegrate this. (Before this series,
we effectively had three implicit init paths: minor, major, and
integrity, so even this patch "alone" is an improvement IMO.)

Thanks for the reviews!

-Kees

-- 
Kees Cook
Pixel Security
