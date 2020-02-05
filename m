Return-Path: <SRS0=Pvk/=3Z=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684AAC352A2
	for <linux-doc@archiver.kernel.org>; Wed,  5 Feb 2020 21:36:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3827A2072B
	for <linux-doc@archiver.kernel.org>; Wed,  5 Feb 2020 21:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="jTR2YIUM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgBEVgL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Feb 2020 16:36:11 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:42935 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbgBEVgL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Feb 2020 16:36:11 -0500
Received: by mail-qv1-f67.google.com with SMTP id dc14so1854011qvb.9
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2020 13:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P4SUvxXEKaxhwl4QO0wMSpVsP3xQz+B522JyEK1/MKI=;
        b=jTR2YIUMIeXEgWRJ4CRvkDflcfAWXOtxEamyatnZe8/yHFon5IWrud/GdlyeWSj7Uq
         s1CXVzLiDRbtPU/bDTt6cBK3nygDa1nRkCHCbey5tX2M9lnIAiA0MQI+iAF/QOaHzLWA
         Mx3GLVDVtANYuXWMca6rnh9034n8vvcm09z48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P4SUvxXEKaxhwl4QO0wMSpVsP3xQz+B522JyEK1/MKI=;
        b=BgeL9H66BgK1t+HegIZ4BkDQ+nBM9wUpDaUtX6O7EGbaebJc/dRT03j3zv1e9UbJQu
         58wU+v3jlsOkO3TZN2JGQsqxwBvfDvYy5jr9J+n0Y8PqprH760z5+w2jxI28PFjJjXO3
         lTaE8OKuvMc9qScAdVviO3Ksq5cjenwkT8fiqfqI2UVoSrLA6l5kiJTcr4qFWfyjLQnv
         UCqhuqW35QMv/gSjnRW8nwGTMiSaddiSBFQV9dXHEiRDU73EkKArXSBpnK8rClA5m4aZ
         5dNvdMwhuH8rPUIZh+tVJ6BUtNztIDfle2a1QGY7gJoNPmvWDpsRoyDxk3e9ewipLlze
         8soQ==
X-Gm-Message-State: APjAAAXNwrc2oHMwLv8R7npf/BoQcObYmtCZCyKuNmZapqbrYaDIGnYz
        JB6wzn7seGQ1nOk/rldjdVh4aBNM+f+0GQBJhenUuA==
X-Google-Smtp-Source: APXvYqxY3ghyBPfrBLTi+UZPdOFUIUXeJu5yON0D2aeO6jFGT//bfAumbtjOm2sqTzV9oGgWyoE/4SSd1Kot5ciixEc=
X-Received: by 2002:a0c:f685:: with SMTP id p5mr34308684qvn.44.1580938568781;
 Wed, 05 Feb 2020 13:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20200205154629.GA1257054@kroah.com> <20200205160250.GG142103@google.com>
 <CAOesGMj7Z9JoEYrnQaiHrHsjG7cv9ebEbyZM-QFWN2HJDa=UGA@mail.gmail.com>
 <20200205171353.GI142103@google.com> <20200205213354.GB1465126@kroah.com>
In-Reply-To: <20200205213354.GB1465126@kroah.com>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Wed, 5 Feb 2020 13:35:56 -0800
Message-ID: <CAEXW_YSU_Zm24R2TYFQd42CfXyotowv42BbvbvKfSFbZGUqOHQ@mail.gmail.com>
Subject: Re: [PATCH] Revert kheaders feature
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Olof Johansson <olof@lixom.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tejun Heo <tj@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 5, 2020 at 1:33 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
[snip]
> > > like the BTF approach is significantly better and said users are
> > > hopefully moving forward to it quickly, and if they can't move
> > > forward, then they're likely also not going to move forward to newer
> > > kernels either?
> >
> > I think BCC runs on a lot of upstream machines. I think the migration
> > strategy is a matter of opinion, one way is to take it out and cause some
> > pain in the hope that users/tools will migrate soon (while probably carrying
> > the reverted patches out of tree). Another is to migrate the tools first and
> > then take it out (which has its own disadvantages such as introducing even
> > more users of it while it is still upstream).
>
> Do we "know" what tools today require this, and what needs to be done to
> "fix" them?  If we don't know that, then there's no way to drop this,
> pretty much ever :(

Is there a real reason to drop it or a problem dropping this solves though?

thanks,

  - Joel
