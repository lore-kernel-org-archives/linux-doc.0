Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 16B197D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Aug 2019 07:58:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbfHAH6p (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Aug 2019 03:58:45 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35687 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728974AbfHAH6p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Aug 2019 03:58:45 -0400
Received: by mail-lf1-f67.google.com with SMTP id p197so49479596lfa.2
        for <linux-doc@vger.kernel.org>; Thu, 01 Aug 2019 00:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7KXLQpVfkqV0NkCYw8UjiB+5rejcfZgxPXsUmGm7V/0=;
        b=sSXfHrLbSWYOGs8KaK1hqPPLlLXMXxIBBJstsrMzQsi+667jQGLbwjDjxh3KfCrW0z
         UaDglwbPR5kBydRmx7Ii16KtUJWRC0S8laKgopb2JG0n6aqt8i3JIG26mCejzCDl/D5Q
         B8HBpZcM7oyex3pImWnL147wdh9OVEOWakkHgZPqJoW7iAipZyJqptfoDXg5Dwz8rLYN
         ibL9nInRk4c2y7VpkUWY/YaLrpk7NtZKIkmwoi5GVJymVpIzl3VLb21mY01uTBkNoINk
         Q9Eme1ddkFKjtiAvIQfyEDFFLuyYbm2t9cMc5NY9ZBFoUjWOeT2pVmazB3NNhsDnkP6l
         ifXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7KXLQpVfkqV0NkCYw8UjiB+5rejcfZgxPXsUmGm7V/0=;
        b=pyxMGASV+d9uepcaJAhnD6dPk0P6kk1XgjGy6pNdCXvIw2zUKj3Sa+GHtdNDTnaKn0
         qiV0/SKh09dp0h25t4aK+xATpVUYLAJcbPpdIG0wQZmTO9YSegKOqYAbMOFbiqANN/5B
         szSGFyPI/wq8mF6zV0uorCJ+AHN925Nt1uPz0mEOAxhsk98QdugAk+Tpx38rMG6PgjW/
         Rok3zD1zSN+cG1bI6yXCKK52cHDMH1xYFQCM7G2sMHweEk5z9jFVmgLCO4pNmy69eyjk
         ExLEC7ZvNHllbruh3tbmITNfejB9wwXIObOhf5nYArUc9KoMzY9Fjdu50TrVdC/BP55S
         GObg==
X-Gm-Message-State: APjAAAUMLVZmjTKeJ8pR11BZ5kwcoNUlNIX7rk8IKMLxs5W/HtnVyhfW
        yL3x5oVKWtkDKGEEoTR/6528UN/FDIwryg8JRKIl4w==
X-Google-Smtp-Source: APXvYqzXm1XrjRokfpgWPkB/SOz1fbBVy/r2Ctmt6xsQbSbqX8deM0MJ9AqgiLXstbE+nc9ZfgBbvIGVnLwZBWUdEY0=
X-Received: by 2002:ac2:5337:: with SMTP id f23mr61398922lfh.15.1564646323439;
 Thu, 01 Aug 2019 00:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <1564489420-677-1-git-send-email-sumit.garg@linaro.org>
 <CAE=Ncrb63dQLe-nDQyO9OPv7XjwM_9mzL9SrcLiUi2Dr10cD4A@mail.gmail.com>
 <CAFA6WYPJAzbPdcpBqioxjY=T8RLw-73B_hpzX4cGnwVvm5zpJw@mail.gmail.com>
 <CAE=Ncrb23q++z8R8UMbjDE2epEq4YVcNGzrRD31eH3JAooYejg@mail.gmail.com>
 <CAFA6WYOKcOzSwakHhgshZcebD8ZBMSi7xQdjWYFS79=Xc+odOg@mail.gmail.com>
 <CAE=NcrYz8bT9zDhS_ZcvY84fpeTDxZ-KhJKeQGGyf=o4pG2J-Q@mail.gmail.com>
 <19d9be198619e951750dedeb4d0a7f372083b42c.camel@pengutronix.de> <CAE=NcraqD9FNM0Gk9UGhPGi3heVzZrAKGc1gNZxoe1OnDaQ=pA@mail.gmail.com>
In-Reply-To: <CAE=NcraqD9FNM0Gk9UGhPGi3heVzZrAKGc1gNZxoe1OnDaQ=pA@mail.gmail.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 1 Aug 2019 13:28:32 +0530
Message-ID: <CAFA6WYPt4q+jaJbaoauXKr2qKgBHvtQ663s4t=W3nuPJPe2xpw@mail.gmail.com>
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

On Thu, 1 Aug 2019 at 13:00, Janne Karhunen <janne.karhunen@gmail.com> wrote:
>
> On Thu, Aug 1, 2019 at 9:50 AM Rouven Czerwinski
> <r.czerwinski@pengutronix.de> wrote:
>
> > > I'm aware of it - I have implemented a large part of the GP TEE APIs
> > > earlier (primarily the crypto functions). Does the TEE you work with
> > > actually support GP properly? Can I take a look at the code?
> >
> > AFAIK Sumit is working with the OP-TEE implementation, which can be
> > found on github: https://github.com/op-tee/optee_os
>
> Thanks, I will take a look.

For documentation, refer to: https://optee.readthedocs.io/

> The fundamental problem with these things
> is that there are infinite amount of ways how TEEs and ROTs can be
> done in terms of the hardware and software. I really doubt there are 2
> implementations in existence that are even remotely compatible in real
> life.

I agree with you regarding implementation specific nature of TEE but
having a standardized client interface does solves the problem.

> As such, all things TEE/ROT would logically really belong in the
> userland and thanks to the bpfilter folks now the umh logic really
> makes that possible ... I think. The key implementation I did was just
> an RFC on the concept, what if we start to move the stuff that really
> belongs in the userspace to this pseudo-userland. It's not kernel, but
> it's not commonly accessible userland either. The shared memory would
> also work without any modifications between the umh based TEE/ROT
> driver and the userland if needed.
>
> Anyway, just my .02c. I guess having any new support in the kernel for
> new trust sources is good and improvement from the current state. I
> can certainly make my stuff work with your setup as well, what ever
> people think is the best.

Yes your implementation can very well fit under trusted keys
abstraction framework without creating a new keytype: "ext-trusted".

-Sumit

>
>
> --
> Janne
