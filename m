Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9B8537D08E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 18:35:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbeKNEef (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 23:34:35 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:46260 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbeKNEec (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 23:34:32 -0500
Received: by mail-qk1-f196.google.com with SMTP id q1so21221937qkf.13
        for <linux-doc@vger.kernel.org>; Tue, 13 Nov 2018 10:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=eazBKST81Ay2gNO89uE6O7K62RWYfPOh3Pfs5q7yXnA=;
        b=Y2s9Tvm06f72HsRaC5V0w9zIaEaaQnU7P/aG+JNojzz58xUt3T1o0PXROouB5rowSJ
         EAwJFYV8rHzW9GOcZW3vKOznH4TtgzjtWuU/LQdWRWupGVqTHd7GgYFi02UwOGRDBlh+
         nHYy/Q28N60gl+7t2WS/6S1wgui/e1T+i9tlok4S08BBq1OJ78JNH7kypwaZLiu7F9NR
         Z0nklKSpdTbQXJkffbEutK5IBxHnFFRToyS8sIvriKFhAo2Kp0HboYUuNUCymy3zFvQ4
         xSlO6ERpCUQOf3un2WBK6OV1qmVPuJcx5J2X0Vlg3n1gvZgyNg8P+D75m05hGrLtL2C+
         iuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=eazBKST81Ay2gNO89uE6O7K62RWYfPOh3Pfs5q7yXnA=;
        b=oxxEhUJ/Vjj1M9webZwm7if89p8oBqQsAfgRjuvq5J7oQfShTAdemcABjmf4mfSxEl
         NswsRik4D7GuuhltopeL+Y9C0FtFP+cqVBCS9GvkEgnovNKICFyS8gcZrztx0vhl2SEu
         hmSIsTwncYGJftZLHJ1XLB/QOmDBhiT7jhEFk4senQYsmpRqoePmq9CbR+HPwLTOmGX8
         RRJCQV45LMV25N7ynemRs4Qa/eGYCyBKOunehfeb8xpj10AJdU0301Z3VIxtm987BXIt
         aHu54nTd7ugFu92k+nU5O5s/u6aZ8dF6P1OGgU5ovmfWXEpFJ6Y297NppvHg01lDStvM
         XBPw==
X-Gm-Message-State: AGRZ1gIB8Q7AwYmkFoErGDeHZAQCHbfw4VQcRhU8iuW1MgvJZO35153S
        KPjW55b8aTFbSq/nxKWqqvt43g==
X-Google-Smtp-Source: AJdET5e9qsjG6HFfRiBQd5mX8tep68g3EuK19Kz/eOWEtNLZ2og77wjLyZOtetRUizQsv6pDvXa+7w==
X-Received: by 2002:a37:9281:: with SMTP id u123mr6286155qkd.0.1542134113269;
        Tue, 13 Nov 2018 10:35:13 -0800 (PST)
Received: from soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net ([40.117.208.181])
        by smtp.gmail.com with ESMTPSA id o49sm12657879qtf.60.2018.11.13.10.35.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Nov 2018 10:35:11 -0800 (PST)
Date:   Tue, 13 Nov 2018 18:35:10 +0000
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     Timofey Titovets <timofey.titovets@synesis.ru>
Cc:     oleksandr@natalenko.name, Jann Horn <jannh@google.com>,
        linux-doc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH V3] KSM: allow dedup all tasks memory
Message-ID: <20181113183510.5y2hzruoi23e7o2t@soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net>
References: <CAG48ez0ZprqUYGZFxcrY6U3Dnwt77q1NJXzzpsn1XNkRuXVppw@mail.gmail.com>
 <d43da6ad1a3c164aa03e0f22f065591a@natalenko.name>
 <20181113175930.3g65rlhbaimstq7g@soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net>
 <CAGqmi74gpvJv8=B-3pVSMrDssu-aYMxW9xM7mt1WNQjGLjMZqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGqmi74gpvJv8=B-3pVSMrDssu-aYMxW9xM7mt1WNQjGLjMZqA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18-11-13 21:17:42, Timofey Titovets wrote:
> вт, 13 нояб. 2018 г. в 20:59, Pavel Tatashin <pasha.tatashin@soleen.com>:
> >
> > On 18-11-13 15:23:50, Oleksandr Natalenko wrote:
> > > Hi.
> > >
> > > > Yep. However, so far, it requires an application to explicitly opt in
> > > > to this behavior, so it's not all that bad. Your patch would remove
> > > > the requirement for application opt-in, which, in my opinion, makes
> > > > this way worse and reduces the number of applications for which this
> > > > is acceptable.
> > >
> > > The default is to maintain the old behaviour, so unless the explicit
> > > decision is made by the administrator, no extra risk is imposed.
> >
> > The new interface would be more tolerable if it honored MADV_UNMERGEABLE:
> >
> > KSM default on: merge everything except when MADV_UNMERGEABLE is
> > excplicitly set.
> >
> > KSM default off: merge only when MADV_MERGEABLE is set.
> >
> > The proposed change won't honor MADV_UNMERGEABLE, meaning that
> > application programmers won't have a way to prevent sensitive data to be
> > every merged. So, I think, we should keep allow an explicit opt-out
> > option for applications.
> >
> 
> We just did not have VM/Madvise flag for that currently.
> Same as THP.
> Because all logic written with assumption, what we have exactly 2 states.
> Allow/Disallow (More like not allow).
> 
> And if we try to add, that must be something like:
> MADV_FORBID_* to disallow something completely.

No need to add new user flag MADV_FORBID, we should keep MADV_MERGEABLE
and MADV_UNMERGEABLE, but make them work so when MADV_UNMERGEABLE is
set, memory is indeed becomes always unmergeable regardless of ksm mode
of operation.

To do the above in ksm_madvise(), a new state should be added, for example
instead of: 

case MADV_UNMERGEABLE:
	*vm_flags &= ~VM_MERGEABLE;

A new flag should be used:
	*vm_flags |= VM_UNMERGEABLE;

I think, without honoring MADV_UNMERGEABLE correctly, this patch won't
be accepted.

Pasha
