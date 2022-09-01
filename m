Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC2FECAAD3
	for <linux-doc@archiver.kernel.org>; Thu,  1 Sep 2022 16:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234829AbiIAQHO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Sep 2022 12:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234746AbiIAQHM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Sep 2022 12:07:12 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9DD79A40
        for <linux-doc@vger.kernel.org>; Thu,  1 Sep 2022 09:07:11 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-33dba2693d0so340975637b3.12
        for <linux-doc@vger.kernel.org>; Thu, 01 Sep 2022 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=aOX3b5WRndoOqWfMYuBPMSz6xrM2daGYXLX/7kwuwZ0=;
        b=GwWs2TE101XCnPEP8wKR+dSw6GxCCnubsLKNO61paDv/b4aqGIMAG18YmmPLgM7tL/
         9rxLGJP7ak9XNNnjdQbCzL5iB225ng61KZfyh3olNNwiXcwXq+h7ffsMnPZ6pAlJCtYZ
         bLH1QVrBdzA4VVUk2XpxtrkSITAV/Ux4pJMcF2oCM9VlSnufDfkhwlUbtk195Gwro7U5
         g7RY3vz6GYmUmLlUKiLSvS3ZL5u8vzZe1L4nTOO/3oih+NGg56PcP0RM+dkrg4Oj4lO2
         Ba4ny5o4vVi/kMzPE7kpTqTkZZ2uDTniFuM40424qKlkBW1erqkUlj7BbmP4i5zxlw0+
         FvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=aOX3b5WRndoOqWfMYuBPMSz6xrM2daGYXLX/7kwuwZ0=;
        b=AoGivwwLfISmZKt486vb6fc1it0Lq10QgU1seXEQdmKENARmfyzJZz7zaQ58OdJZGH
         SgqSlshk19ZvrvK2iYRQUoWdje1Y6oy4RiKARQ2yC2xnXCBTBXZG8XBB4Iqoy6a09a73
         8OrHnjbwy/YWiC/JwhoTERYkMEJNHgsxzaB593Zb35TPHRrXQ8fvxfDBXL65X6iQ37l7
         940n0XFvNBDf22Bkk/69M+uXLdPdyNC7AJns9RFCLhWrL1lKIQYs9o7ojQ31PAPhiQyz
         p/5nrw+dBZ62NBMnIBaBtuN23gOg2v67aP0gdHfAD+dJnFiMaz4rPwwDJuuHwpDCve98
         H0pg==
X-Gm-Message-State: ACgBeo32AILJCnLdfGyogocxufpb4b7XRz2cXRFUIolA7xfcVIubHP7y
        gqUtHi5hWC5wBg685DF3Jdbl9PFLXc91reu4bWzyYA==
X-Google-Smtp-Source: AA6agR4WWi3CPBRYCWEFVbnu2G8pTDzczJE8ASPxBsFd2QD0z+KnsqkUEdVwHr9uF0KxpAAczMEG+KuB9OxJUCT+Ths=
X-Received: by 2002:a81:1c4b:0:b0:340:972f:abb0 with SMTP id
 c72-20020a811c4b000000b00340972fabb0mr23600297ywc.489.1662048430253; Thu, 01
 Sep 2022 09:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220829114648.GA2409@debian> <CANn89iLkfMUK8n5w00naST9J+KrLaAqqg2r0X9Sd-L0XzpLzSQ@mail.gmail.com>
 <20220901150115.GB31767@debian>
In-Reply-To: <20220901150115.GB31767@debian>
From:   Eric Dumazet <edumazet@google.com>
Date:   Thu, 1 Sep 2022 09:06:59 -0700
Message-ID: <CANn89iKMe7WZS-Q4rzqEUUD+ANL6Fmb6BnFo8TvX7y_EVi=HOw@mail.gmail.com>
Subject: Re: [PATCH 3/4] net-next: frags: add inetpeer frag_mem tracking
To:     Richard Gobert <richardbgobert@gmail.com>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        Florian Westphal <fw@strlen.de>,
        Martin KaFai Lau <kafai@fb.com>,
        netdev <netdev@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-wpan@vger.kernel.org,
        netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 1, 2022 at 8:03 AM Richard Gobert <richardbgobert@gmail.com> wrote:
>
> On Mon, Aug 29, 2022 at 03:15:47PM -0700, Eric Dumazet wrote:
> > We tried to get rid of any dependence over inetpeer, which is not
> > resistant against DDOS attacks.
> >
> > So I would not add a new dependency.
>
> I see your point. What do you suggest doing differently?
>
> The inetpeer mechanism is used for IPv4 frags. If it isn't resistant
> against DDoS attacks, can it perhaps be improved?

It can be disabled if needed, by changing ipfrag_max_dist sysctl.

Quite frankly IPv4 reassembly unit is a toy, I am always surprised
some applications are still relying on IP fragments.
