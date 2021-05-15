Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8846DC433ED
	for <linux-doc@archiver.kernel.org>; Sat, 15 May 2021 06:53:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4707661406
	for <linux-doc@archiver.kernel.org>; Sat, 15 May 2021 06:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbhEOGys (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 May 2021 02:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbhEOGyr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 May 2021 02:54:47 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54DE5C06174A
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 23:53:35 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so1202718otp.11
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 23:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gpgB8KVdmXarDBnFRWFNLMS8KVS+2KWVBISEIITRXKo=;
        b=m33DtuOc8NjjYtDJPIZlDdQQZDqzM8nPr7oQdKbX4OXrb0iXn5VR/dPv1qqFJO4fQD
         WvaqcIk9k8J301xK8R0b0Kn4MFfklqM7T0W2DHouqeKQNxFxWkjP3XydOu/5V4abhJPP
         OHTFld59uY3REkr9ieok2HuJr+M0sybR3wmEDKnA979aKO1U8oZf0BrIhuDCS5L9zvP+
         zBELQF5iFusdY9wFynu1GHIUaFthrVO08h8WoyYl44mBp3st/R8fWMWOFAuLl7Ir2VcH
         qmNgBU7SmNQSXlk3MlECLTpf2I0HijYx9CY13niKrnu1al4PjQCas6qE9OTA/ySPQR79
         +lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gpgB8KVdmXarDBnFRWFNLMS8KVS+2KWVBISEIITRXKo=;
        b=NXUtDWXr/O6HZerfKb2W+xGWVnNXLXPLKo4dR6kmYgjZo080Ly06zwhCG5MS015GKL
         hqMfaWq/+/3mmtuu14PW0lbCHBu8nwEzVrsONS4Xh6UvDN+XeyYWjukn6ZLtWMG80DsW
         J6GK0MU1u2GMhRX3MbKvq2iCta68t1KIl6k1KwJLK2OuWcQ/992bbGbdY8G59tMF4u/c
         zRfhqQtoiNTMq12o+xjbWVdMe+kVKgxw7/Pgx9ZIskzno/07bNyiJVV+Po/7oI6YFPRf
         ztpVHTfgdLvqakMGJLMGfIPEKiO/b9MAP+DXTIY3zxbQYkGJy//v25AQwjhTOBU4sAvV
         Iv6A==
X-Gm-Message-State: AOAM532C+WWHdxMcej1JDswbpTxUClvUmo1nPihECy1ap/+CwrtKqxs1
        jkQTHUhn2g4xDPtAZ6K9zg6rBwytBI4Ox21JTHs=
X-Google-Smtp-Source: ABdhPJzY7UkDUMWPYY6xhPBwi9MRQeMsJ5/3zONGGg54ly3fwXFDE9wYnqhJZrSIpPHP9Q4feHv8z9XKJP+qEA8vwZw=
X-Received: by 2002:a9d:58c5:: with SMTP id s5mr43832250oth.243.1621061614823;
 Fri, 14 May 2021 23:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620286208.git.siyanteng@loongson.cn> <87k0o261w8.fsf@meer.lwn.net>
 <CAEensMwv8X68oiov8DBSAmzu7i6N-1GWCOHZSQc+Tjfp4Myu4w@mail.gmail.com>
In-Reply-To: <CAEensMwv8X68oiov8DBSAmzu7i6N-1GWCOHZSQc+Tjfp4Myu4w@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Sat, 15 May 2021 14:53:24 +0800
Message-ID: <CAEensMwf+w8aOuMqBy_wrWGBVBnVZdjKNJgS4jRQTAO4zwN1vw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] docs/zh_CN add three core api docs
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

yanteng si <siyanteng01@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=8814=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=885:24=E5=86=99=E9=81=93=EF=BC=9A

>
> Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B45=E6=9C=8814=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=8812:20=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Yanteng Si <siyanteng@loongson.cn> writes:
> >
> > > * As Matthew and Xiangcheng suggested:
> > >
> > >   call kernel-doc to generate related docs (0001 and 0002).Thanks!
> > >
> > >   I tested it on other computers (at least three) with no problem,
> > >   But on my computers it prints 1000+ warnings, I tried to find the
> > >   cause in the past few days but no clue.
> > >   So, the two patches may print as follows:(maybe your computer won't=
 print anything)
> > >
> > >   linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst=
:235: WARNING: Duplicate C declaration, also defined at core-api/kernel-api=
:235.
> > >   Declaration is '.. c:None:: struct list_head *prev'.
> >
> > This is the same problem I just talked about in my other message.  I
> > really think we need to just leave the kernel-doc directives out of
> > translations; we certainly don't want to add all those warnings.
> OK! I will remove them and then direct the reader to the original documen=
t.
> But the patch 1/3 has too many kernel-doc directives,  In order to
> give the reader a good reading experience, I decided to remove
> it.~>_<~
I decided not to remove this patch(1/3) because it was needed to guide
the reader, and the new translation looks good.


Thanks,

Yanteng
