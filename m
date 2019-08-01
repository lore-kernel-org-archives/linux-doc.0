Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8ED5F7D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Aug 2019 10:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbfHAK1j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Aug 2019 06:27:39 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36848 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728112AbfHAK1i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Aug 2019 06:27:38 -0400
Received: by mail-lf1-f66.google.com with SMTP id q26so49875982lfc.3
        for <linux-doc@vger.kernel.org>; Thu, 01 Aug 2019 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WavWyKi8xsYiSOtxhL/Mupk8NjZ0g0ho0jTiP91yMfo=;
        b=ILM98uDeH4Kq4OeEe/3O0IuQ1XoT0Qrd38bGRpHpc3YusALaKFR5/NOUMP1lmLymeL
         uerpCmuZR0a1Ra+J73y/ObaEd3+lTlP+dZRGaqKwbJ5arq4Dpi9co1/B/neD92Q2EM9o
         GaJZgvDUjykVsBwgoxzGc0Yi4uiXhFR1WxNFbCKjIyWlRjAqYjRv7UpAuWRa+KOyiTSI
         4ekpU/2spRg64dnda+XLs9xM5a6iUu3cw0WBJ+BV6IV+srs+pRbtYrqupbnr4gqMoCIs
         3kdTbq6UX1CSHZkp7klNL5IqDWMCnxgiRV98mt9LYpxn2mukho+gu6Gs/5Qm/eJnVEHP
         FmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WavWyKi8xsYiSOtxhL/Mupk8NjZ0g0ho0jTiP91yMfo=;
        b=PmGxZ2Z3ZrhGywJswZwO6oxng61UTXnO3vwIq6foENdgeR7pYAOpc4RTLm1fCiT3Yc
         UvcSA0uszyZsMp3uIZNGetqMZJRXm0TzugA6/zpsSco5bex+NAzdNuyGKW7ka7jk69sK
         R6oUOlw4swPsTfr1W5Gi8p9qde6NbWm7MpEkrNHDUfcjOKYXsBsCbVa4CJ46w5aLxQAF
         6U7wG3Fs2IBbdg5XwdKb7wzp/hQV6JTuUf2bTUrAtcHTZnuPynp0Iqbx+4JPCB87mVQW
         HzGLn3uOeZD/0rS5VOqCELcNi7lylNRMFkkqItkbTNssSzWbOTuGQ0fjKnmyW+vraqIz
         yT7A==
X-Gm-Message-State: APjAAAXTivUz/6z9lBSE8HXOW2QYOolBChpUQhqYRPVa/K/4OaC9Xp3r
        fdeCAshpSuky4Ailln7kR3EuXpEKabHWnFSOaFjdIQ==
X-Google-Smtp-Source: APXvYqwcjanstBYp6ci2fM+2NuJ04h4Vkq12OnvRSlbvhbEkiqzESM49hkfaP96wyF8xEMXGU6rNE8v77LiXVZl4mq0=
X-Received: by 2002:ac2:5094:: with SMTP id f20mr63091641lfm.186.1564655256560;
 Thu, 01 Aug 2019 03:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <1564489420-677-1-git-send-email-sumit.garg@linaro.org>
 <CAE=Ncrb63dQLe-nDQyO9OPv7XjwM_9mzL9SrcLiUi2Dr10cD4A@mail.gmail.com>
 <CAFA6WYPJAzbPdcpBqioxjY=T8RLw-73B_hpzX4cGnwVvm5zpJw@mail.gmail.com>
 <CAE=Ncrb23q++z8R8UMbjDE2epEq4YVcNGzrRD31eH3JAooYejg@mail.gmail.com>
 <CAFA6WYOKcOzSwakHhgshZcebD8ZBMSi7xQdjWYFS79=Xc+odOg@mail.gmail.com>
 <CAE=NcrYz8bT9zDhS_ZcvY84fpeTDxZ-KhJKeQGGyf=o4pG2J-Q@mail.gmail.com>
 <19d9be198619e951750dedeb4d0a7f372083b42c.camel@pengutronix.de>
 <CAE=NcraqD9FNM0Gk9UGhPGi3heVzZrAKGc1gNZxoe1OnDaQ=pA@mail.gmail.com>
 <CAFA6WYPt4q+jaJbaoauXKr2qKgBHvtQ663s4t=W3nuPJPe2xpw@mail.gmail.com> <CAE=NcrbujsM8wYJXq+s=o5Vy1xY1b0uKYBGvp6UP5ex70HrB2Q@mail.gmail.com>
In-Reply-To: <CAE=NcrbujsM8wYJXq+s=o5Vy1xY1b0uKYBGvp6UP5ex70HrB2Q@mail.gmail.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 1 Aug 2019 15:57:25 +0530
Message-ID: <CAFA6WYNzW-+N3rcKMCJ0wK9peuq97CETnxMSwxixN7844XinTw@mail.gmail.com>
Subject: Re: [Tee-dev] [RFC v2 0/6] Introduce TEE based Trusted Keys support
To:     Janne Karhunen <janne.karhunen@gmail.com>
Cc:     Rouven Czerwinski <r.czerwinski@pengutronix.de>,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, jejb@linux.ibm.com,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dhowells@redhat.com, linux-security-module@vger.kernel.org,
        keyrings@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        linux-integrity@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 1 Aug 2019 at 14:00, Janne Karhunen <janne.karhunen@gmail.com> wrote:
>
> On Thu, Aug 1, 2019 at 10:58 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> > > Anyway, just my .02c. I guess having any new support in the kernel for
> > > new trust sources is good and improvement from the current state. I
> > > can certainly make my stuff work with your setup as well, what ever
> > > people think is the best.
> >
> > Yes your implementation can very well fit under trusted keys
> > abstraction framework without creating a new keytype: "ext-trusted".
>
> The fundamental problem with the 'standardized kernel tee' still
> exists - it will never be generic in real life. Getting all this in
> the kernel will solve your problem and sell this particular product,
> but it is quite unlikely to help that many users. If the security is
> truly important to you, would you really trust any of this code to
> someone else? In this day and age, I really doubt many do.

There are already multiple platforms supported by OP-TEE [1] which
could benefit from this trusted keys interface.

> Everyone
> does their own thing, so this is why I really see all that as a
> userspace problem.
>

IMO, we should try to use standardized interfaces which are well
thought off rather than implementing your own.

[1] https://optee.readthedocs.io/general/platforms.html


-Sumit

>
> --
> Janne
