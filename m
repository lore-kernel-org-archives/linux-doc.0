Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5568E7D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 20:27:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbeKNG1G (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Nov 2018 01:27:06 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34470 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbeKNG1G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Nov 2018 01:27:06 -0500
Received: by mail-ot1-f67.google.com with SMTP id t5so12658654otk.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Nov 2018 12:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o76oz03Md1bcJeOgRVzYE6RWZcKj4CcMg4wxPculGAk=;
        b=pJTk7Q+mY0QnOtfW0xY/F4nQciQ977RUvVPc2FLlrLF+ILPMhEAM6QBohW/Af+kD/L
         kOCbKLTQssQzif0dWZMQj9rIsOgIrk6CYdJZI5r2cJ92AJgCfNxvU65owYaKzJMWrRd2
         oi8vPm6+y75dYvvbUKPns8Aqg3tOMB/VBQ8BuL70ZvyUWjYV7PqLJf7xtgQjLSzavfwO
         oSUKt2MIz0jIyCaBvhis6Qx1CFLGGms1+FxIg0f+L2XLzdUNiyBPaSRHKPJKGEU1hunm
         BRo2KocFGsSZ5dSO15yF02GAZtSiXmOrJiHNNgv/AVJkfqjrO2Jds0hhgcsWl36aS1dJ
         OESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o76oz03Md1bcJeOgRVzYE6RWZcKj4CcMg4wxPculGAk=;
        b=BwL4NlN3v43XEZRyH+gl7Uo2TSw/YyhuIb+0IZGwZEWhCCiN2ODEk+12wY0aTYRVRS
         OdLzVkgr0eji3FpBuo2FJVdtJPH8gtZ59qNMpr7rgThgYlQS7pheFDuNu4uRRqhGGnBd
         Ua5E1WN63OWh6jwc0xM9cd6FEnreiLolQbmaxXKG0ks2RY/A7dZzljyhtf907RMClK5g
         9GN5j+pJLL6mk2sYZyX1hzHFAskuSOq7fMtmKwUhAJOteUoT7t4VjJYohkcdr7nAZYk6
         685jqy+xjdP4+WEr4ckcMHDe1WXKkOCPKbpZeaBCyEuYpmCRsIBk/jbs0XcvFiAqgexx
         XQpA==
X-Gm-Message-State: AGRZ1gIPjGVY119HcSXZG1KyMQ4tgDHZoEJcJLZMZ+xAy77285YrWuZs
        3pe02ZBUa2y/Nwn7FGfPspPG55I7CEDnbaz3Xq1NfQ==
X-Google-Smtp-Source: AJdET5cs9b0zkSg+dvQx2h14t0+2Fpx/xYuseDkbMS55gScJV9z7HjGA5LRzZLqMl7Z9UzKpLndAaYAWMSWXtbj+sl0=
X-Received: by 2002:a9d:7059:: with SMTP id x25mr4278532otj.35.1542140838418;
 Tue, 13 Nov 2018 12:27:18 -0800 (PST)
MIME-Version: 1.0
References: <CAG48ez0ZprqUYGZFxcrY6U3Dnwt77q1NJXzzpsn1XNkRuXVppw@mail.gmail.com>
 <d43da6ad1a3c164aa03e0f22f065591a@natalenko.name> <20181113175930.3g65rlhbaimstq7g@soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net>
In-Reply-To: <20181113175930.3g65rlhbaimstq7g@soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net>
From:   Jann Horn <jannh@google.com>
Date:   Tue, 13 Nov 2018 21:26:51 +0100
Message-ID: <CAG48ez29kArZTU=MgsVxWbuTZZ+sCrxeQ3FkDKpmQnj_MZ5hTg@mail.gmail.com>
Subject: Re: [PATCH V3] KSM: allow dedup all tasks memory
To:     pasha.tatashin@soleen.com
Cc:     oleksandr@natalenko.name, linux-doc@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, timofey.titovets@synesis.ru,
        Matthew Wilcox <willy@infradead.org>,
        Daniel Gruss <daniel@gruss.cc>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

+cc Daniel Gruss

On Tue, Nov 13, 2018 at 6:59 PM Pavel Tatashin
<pasha.tatashin@soleen.com> wrote:
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
> >
> > > As far as I know, basically nobody is using KSM at this point. There
> > > are blog posts from several cloud providers about these security risks
> > > that explicitly state that they're not using memory deduplication.
> >
> > I tend to disagree here. Based on both what my company does and what UKSM
> > users do, memory dedup is a desired option (note "option" word here, not the
> > default choice).
>
> Lightweight containers is a use case for KSM: when many VMs share the
> same small kernel. KSM is used in production by large cloud vendors.

Wait, what? Can you name specific ones? Nowadays, enabling KSM for
untrusted VMs seems like a terrible idea to me, security-wise.

Google says at <https://cloud.google.com/blog/products/gcp/7-ways-we-harden-our-kvm-hypervisor-at-google-cloud-security-in-plaintext>:
"Compute Engine and Container Engine are not vulnerable to this kind
of attack, since they do not use KSM."

An AWS employee says at
<https://forums.aws.amazon.com/thread.jspa?threadID=238519&tstart=0&messageID=739485#739485>:
"memory de-duplication is not enabled by Amazon EC2's hypervisor"

In my opinion, KSM is fundamentally insecure for systems hosting
multiple VMs that don't trust each other. I don't think anyone writes
cryptographic software under the assumption that an attacker will be
given the ability to query whether a given page of data exists
anywhere else on the system.
