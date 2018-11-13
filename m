Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE8167D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 18:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730748AbeKNERh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 23:17:37 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39932 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730729AbeKNERh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 23:17:37 -0500
Received: by mail-oi1-f195.google.com with SMTP id 192-v6so11194299oii.6
        for <linux-doc@vger.kernel.org>; Tue, 13 Nov 2018 10:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synesis-ru.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5IfNSoiM7rcywtksB3ASPv0sLv4kO68L9YLZ+gQ6DJM=;
        b=ttpyN6FJE5rxVf4tFN+vHfXmBMBmLTIVrZVsBm9HfvTscdyoLoiME6yAh1G/C42c7W
         XfS+Ofg8hQyGAHxVWjVUAs5XhbXbdwnj4o73ei1UBsISr9dLs9uEhzLHf4vTG9A/xd+w
         AHuR9TUzwqyJw/GNePO7kyF1owMsLIdheWKP1AtaElgLrHyqbAyqwIy1X7Thk3X/gSxa
         1ilFBBD0r/DHaYb3nfYIZ4OVv9J1qWeeZqIG9oRCtOgI6sVsndZ0NcVqR5fquIyxZazC
         k3aqaYj4RmsdKkTILJCGXlkxDO7YVVaiZ8O9QZyX/D2GUBgKihrUjK0+NMb3iGPIB7dc
         hPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5IfNSoiM7rcywtksB3ASPv0sLv4kO68L9YLZ+gQ6DJM=;
        b=q6K3WKl2rb6eVAdGdf6L9Va3v5JZ6GWZKWl6S5gssQV8wFYgcodbTN8GghjMSM0PZN
         biymupCWPnfX9UqyY3UD88HiVJh3Fzb4Ak2jPbNRFxPChTxOhZqIch47zaW3xlRSMznW
         QmSeHhv6da6zy1CgbrBAg8vEOOVeAI+egZ1ctJ3zjgYXnu+KlQMAUxLSvMIlW3eHri9S
         b3kXnjY4yQJmGOEjf9m3/Z67BBwaOVlKDujN9xYlGkU/8FdOXaFyROpmGBIs7CzP5vxC
         CKdyoWF/6WfS3WXqXfFZN504BkQDTbXeHUg6iYxNKbegh8Ba51JkM4JORO0aBZq2yNsK
         7qmw==
X-Gm-Message-State: AGRZ1gKyRf8CKBqeSe40pw32W4q52ziV1NHKZGlHccoOCNSXh00Cx2gz
        h+K2Luf0w1OfPT9y3qcj+JNq0uqfrrN0WQSs
X-Google-Smtp-Source: AJdET5dj3JthqS22OBmrNmZ8kSO/uE8Qvi9AxZGrfV+66EmzJYjQZfR5gITy80ikG8LTt2jIu0XSxA==
X-Received: by 2002:aca:5a41:: with SMTP id o62-v6mr3460238oib.323.1542133101730;
        Tue, 13 Nov 2018 10:18:21 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id p189-v6sm1297901oif.19.2018.11.13.10.18.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 10:18:20 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id 192-v6so11194148oii.6;
        Tue, 13 Nov 2018 10:18:19 -0800 (PST)
X-Received: by 2002:aca:4dd4:: with SMTP id a203-v6mr3769165oib.168.1542133099027;
 Tue, 13 Nov 2018 10:18:19 -0800 (PST)
MIME-Version: 1.0
References: <CAG48ez0ZprqUYGZFxcrY6U3Dnwt77q1NJXzzpsn1XNkRuXVppw@mail.gmail.com>
 <d43da6ad1a3c164aa03e0f22f065591a@natalenko.name> <20181113175930.3g65rlhbaimstq7g@soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net>
In-Reply-To: <20181113175930.3g65rlhbaimstq7g@soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net>
From:   Timofey Titovets <timofey.titovets@synesis.ru>
Date:   Tue, 13 Nov 2018 21:17:42 +0300
X-Gmail-Original-Message-ID: <CAGqmi74gpvJv8=B-3pVSMrDssu-aYMxW9xM7mt1WNQjGLjMZqA@mail.gmail.com>
Message-ID: <CAGqmi74gpvJv8=B-3pVSMrDssu-aYMxW9xM7mt1WNQjGLjMZqA@mail.gmail.com>
Subject: Re: [PATCH V3] KSM: allow dedup all tasks memory
To:     pasha.tatashin@soleen.com
Cc:     oleksandr@natalenko.name, Jann Horn <jannh@google.com>,
        linux-doc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

=D0=B2=D1=82, 13 =D0=BD=D0=BE=D1=8F=D0=B1. 2018 =D0=B3. =D0=B2 20:59, Pavel=
 Tatashin <pasha.tatashin@soleen.com>:
>
> On 18-11-13 15:23:50, Oleksandr Natalenko wrote:
> > Hi.
> >
> > > Yep. However, so far, it requires an application to explicitly opt in
> > > to this behavior, so it's not all that bad. Your patch would remove
> > > the requirement for application opt-in, which, in my opinion, makes
> > > this way worse and reduces the number of applications for which this
> > > is acceptable.
> >
> > The default is to maintain the old behaviour, so unless the explicit
> > decision is made by the administrator, no extra risk is imposed.
>
> The new interface would be more tolerable if it honored MADV_UNMERGEABLE:
>
> KSM default on: merge everything except when MADV_UNMERGEABLE is
> excplicitly set.
>
> KSM default off: merge only when MADV_MERGEABLE is set.
>
> The proposed change won't honor MADV_UNMERGEABLE, meaning that
> application programmers won't have a way to prevent sensitive data to be
> every merged. So, I think, we should keep allow an explicit opt-out
> option for applications.
>

We just did not have VM/Madvise flag for that currently.
Same as THP.
Because all logic written with assumption, what we have exactly 2 states.
Allow/Disallow (More like not allow).

And if we try to add, that must be something like:
MADV_FORBID_* to disallow something completely.

And same for THP
(because currently apps just refuse to start if THP enabled, because of no =
way
to forbid thp).

Thanks.

> >
> > > As far as I know, basically nobody is using KSM at this point. There
> > > are blog posts from several cloud providers about these security risk=
s
> > > that explicitly state that they're not using memory deduplication.
> >
> > I tend to disagree here. Based on both what my company does and what UK=
SM
> > users do, memory dedup is a desired option (note "option" word here, no=
t the
> > default choice).
>
> Lightweight containers is a use case for KSM: when many VMs share the
> same small kernel. KSM is used in production by large cloud vendors.
>
> Thank you,
> Pasha
>
