Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 38BAF7D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Oct 2018 18:20:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbeJDBKT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Oct 2018 21:10:19 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:35120 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbeJDBKT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Oct 2018 21:10:19 -0400
Received: by mail-yw1-f65.google.com with SMTP id y76-v6so2694080ywd.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Oct 2018 11:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=uZQOA0DuRSvaNKbfmyV5gC0MDYC2apwZOxhNpWzX+8A=;
        b=nwzhh2Yor1IalU+mxBYgqdzrAgrLteqh1e9tMXXGytcLhEeSxnrw+4/1VZm3GFBHWE
         NsgvLIG8ZY22exf4k5UahRIc1RoV6KgA4A9GPFAqEFm3EBy/mjLwltlC+/HLEnDPDg/c
         EP5IDRaZ2CYr0emGOSnPmzszzpVpTTzHaR3HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=uZQOA0DuRSvaNKbfmyV5gC0MDYC2apwZOxhNpWzX+8A=;
        b=ONq/WelUL5xo9W0O0fRXOVJi55TtoiV+l95Cgy7Du7D1RP58wSiqUw8NWxgHSra9cg
         oVVCYVdpNiL7MYstRcbC6SAxv4Hv9lPGYwdAb0v+dEbNnOaq8Omgu182avbR8Y1v2Lti
         4l9n2qe5Vc0yNz9zmunadlXYcF/79vqYlk7GEO0uuBhRMIDgNkZLzX9D+l+YLfouGqm2
         5VhiBGDXxd1mUdPxz4bzvXn58jqOvbdK3fQoxXCtu+LFHPZBYaT8rlWDq1vMh48KxxUb
         DDAcWp+GNStRCNBJcC9qc+zwXcFhYTpgLOK9mf0OMBNWccwf9VauCGzlVM+5JvN4PyPd
         C3BA==
X-Gm-Message-State: ABuFfohxo2j9EsFwg/XioLxsS0dT962Ym6QbUfPq68X4fytEiGNca2As
        NPvEIMUci5rP0EcDJwl6pyWSGbWaJSE=
X-Google-Smtp-Source: ACcGV61Rn+A/pG8WiJ546uR2zKjPdKTNb8pSNFbIB0uXRY+qmgKxHNDqjN9YPwa1SLmO79V4nHevcw==
X-Received: by 2002:a81:8745:: with SMTP id x66-v6mr1649216ywf.133.1538590848124;
        Wed, 03 Oct 2018 11:20:48 -0700 (PDT)
Received: from mail-yw1-f51.google.com (mail-yw1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id l6-v6sm1451267ywb.15.2018.10.03.11.20.45
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Oct 2018 11:20:46 -0700 (PDT)
Received: by mail-yw1-f51.google.com with SMTP id d126-v6so2689945ywa.5
        for <linux-doc@vger.kernel.org>; Wed, 03 Oct 2018 11:20:45 -0700 (PDT)
X-Received: by 2002:a0d:cd84:: with SMTP id p126-v6mr1714563ywd.288.1538590845603;
 Wed, 03 Oct 2018 11:20:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Wed, 3 Oct 2018 11:20:44 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.21.1810040416500.13517@namei.org>
References: <20181002005505.6112-1-keescook@chromium.org> <20181002005505.6112-24-keescook@chromium.org>
 <CAHC9VhQjMfH6Q+Tif8nBknZojgxrb6x+oDz4vHRiZN8rb8MZ5Q@mail.gmail.com>
 <785ef6a9-ae46-3533-0348-74bcf6f10928@tycho.nsa.gov> <CAGXu5jKNzG3rGUAV39D0w4txHRG3H2qU1Z1e_b+03OgycTaWqA@mail.gmail.com>
 <809f1cfd-077b-ee58-51ba-b22daf46d12b@tycho.nsa.gov> <QpdcE4QSCQKJqDmB2QBEGBlnlioHuRHlM0g5HF8KbHjU1zIUAOjnQ2r9EIMu3m0S2OWNR3_M_TSp_M6CVDqkp6kKuFPUvegsyDPNw1AGju4=@protonmail.ch>
 <CAGXu5jKqXNbEvPr1axQtGCCnWsGhDgjynW5u326mcx4vZ1oH8g@mail.gmail.com>
 <abe03d09-4dcb-2b02-4102-5e108d617a42@canonical.com> <CAGXu5jJtC1gkJ0ZKDFroL8UzvjiPfmC+6EsrzyB0j0oETdSQQg@mail.gmail.com>
 <alpine.LRH.2.21.1810030758460.23596@namei.org> <CAGXu5jLKgrdhah-5TtAXDL-odbLGeyAUH2=PkAU769AkEnZFfQ@mail.gmail.com>
 <5955f5ce-b803-4f58-8b07-54c291e33da5@canonical.com> <alpine.LRH.2.21.1810040416500.13517@namei.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Wed, 3 Oct 2018 11:20:44 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+oPR58oJ06-n7e96-Rmu+ywTW0hud5LhOZ_3UXG5s12w@mail.gmail.com>
Message-ID: <CAGXu5j+oPR58oJ06-n7e96-Rmu+ywTW0hud5LhOZ_3UXG5s12w@mail.gmail.com>
Subject: Re: [PATCH security-next v4 23/32] selinux: Remove boot parameter
To:     James Morris <jmorris@namei.org>
Cc:     John Johansen <john.johansen@canonical.com>,
        Jordan Glover <Golden_Miller83@protonmail.ch>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Paul Moore <paul@paul-moore.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 3, 2018 at 11:17 AM, James Morris <jmorris@namei.org> wrote:
> On Tue, 2 Oct 2018, John Johansen wrote:
>> To me a list like
>>   lsm.enable=X,Y,Z
>
> What about even simpler:
>
> lsm=selinux,!apparmor,yama

We're going to have lsm.order=, so I'd like to keep it with a dot
separator (this makes it more like module parameters, too). You want
to mix enable/disable in the same string? That implies you'd want
implicit enabling (i.e. it complements the builtin enabling), which is
opposite from what John wanted.

-Kees

-- 
Kees Cook
Pixel Security
