Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F80C43331
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 11:18:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 151F223383
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 11:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbhAMLRy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 06:17:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728274AbhAMLRx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 06:17:53 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E819BC061795
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 03:17:12 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id a12so2192118lfl.6
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 03:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TAxh0QRvG+U9nWMtk6yUVRJ8OL/Nsz5USXDEEU+kuLw=;
        b=hjKQy54pj428UdfskrcDqwX2PEoAuGx3i2g7PycDem6NXMGRHHmGGyHmVKwWLb2K3J
         GuCbG2pSWNT9EckrACedFivAg7m266Bek8bObR0AWPoaMYAIxLF4kyEoFgxdxCys/z2O
         1M2sH3NJT6oCtEB49yIGbpWyB9hsme9sBdr9hxRICtZApQMPPnUjWWzc2M1Zd4hFsvgG
         uji2fNoa/rsQcIj+hu18ZBNFHEL92k4D5/8f5dYZvaqKQELkydytmCDEthvAlm+xp2CH
         jawETw48NCp3uaDciJagmM/I2m4mDeIiV0WqM9x++VNbLXd50mJ2oGlO07uAiYEAkZlM
         TxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TAxh0QRvG+U9nWMtk6yUVRJ8OL/Nsz5USXDEEU+kuLw=;
        b=XHr3esvRbuqeYEXggbrv59zwlsj9W4Rw1TtOqAdL7eEWUT8rL/lhZS27gx/e2NSfWi
         PZ0aOVNCxIIvkeKPxTjKcJIycOKMOmg7MaUpx2v0s67my8D9w38CP7Mu4UjacXmEqqIY
         GIbDFXJfSxr4s5/V8FF7UVSfVYsGxxY3/iVa5CQh7EUfsqaJ1AydfY/va+T1FxmjEeMp
         Y8KvTFjNJ6LHf4Ls8Bfjn/WOHL/vq2zu5CixkwcZ9Ex+HBFyU6hwgtavH8eMUiWfzqaU
         zA+IXsDWuLoy9WW1iEEgtDbv4AhpMNMYg1jptLk0TE44Tw24dtq6vRQUpehYwArXpxFu
         fwEQ==
X-Gm-Message-State: AOAM5338VFQ5ZaqANSod8NJK+RkUt9V+Uz6xLGVXQMDTKY44dij/5nRW
        FG6iQn3/NohA7iOch0xNI0BgHxgNMJSu7yaQgQkPAQ==
X-Google-Smtp-Source: ABdhPJweF4+YKogH4cN92gRs6BUwNLlYpSWHBGR0Ptdw8KYpzPSd0hSF3S5iZRq39IC4We8OFJ8+kD0bPFuTv8QjcXc=
X-Received: by 2002:a19:c211:: with SMTP id l17mr671408lfc.194.1610536631374;
 Wed, 13 Jan 2021 03:17:11 -0800 (PST)
MIME-Version: 1.0
References: <1604419306-26105-1-git-send-email-sumit.garg@linaro.org>
 <1604419306-26105-3-git-send-email-sumit.garg@linaro.org> <X/x+N0fgrzIZTeNi@kernel.org>
In-Reply-To: <X/x+N0fgrzIZTeNi@kernel.org>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Wed, 13 Jan 2021 16:47:00 +0530
Message-ID: <CAFA6WYOUvWAZtYfR4q8beZFkX-CtdxqwJaRQM+GHNMDfQiEWOA@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] KEYS: trusted: Introduce TEE based Trusted Keys
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Janne Karhunen <janne.karhunen@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Markus Wamser <Markus.Wamser@mixed-mode.de>,
        Luke Hinds <lhinds@redhat.com>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        linux-integrity@vger.kernel.org,
        "open list:SECURITY SUBSYSTEM" 
        <linux-security-module@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jarkko,

On Mon, 11 Jan 2021 at 22:05, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Tue, Nov 03, 2020 at 09:31:44PM +0530, Sumit Garg wrote:
> > Add support for TEE based trusted keys where TEE provides the functionality
> > to seal and unseal trusted keys using hardware unique key.
> >
> > Refer to Documentation/tee.txt for detailed information about TEE.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> I haven't yet got QEMU environment working with aarch64, this produces
> just a blank screen:
>
> ./output/host/usr/bin/qemu-system-aarch64 -M virt -cpu cortex-a53 -smp 1 -kernel output/images/Image -initrd output/images/rootfs.cpio -serial stdio
>
> My BuildRoot fork for TPM and keyring testing is located over here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/buildroot-tpmdd.git/
>
> The "ARM version" is at this point in aarch64 branch. Over time I will
> define tpmdd-x86_64 and tpmdd-aarch64 boards and everything will be then
> in the master branch.
>
> To create identical images you just need to
>
> $ make tpmdd_defconfig && make
>
> Can you check if you see anything obviously wrong? I'm eager to test this
> patch set, and in bigger picture I really need to have ready to run
> aarch64 environment available.

I would rather suggest you to follow steps listed here [1] as to test
this feature on Qemu aarch64 we need to build firmwares such as TF-A,
OP-TEE, UEFI etc. which are all integrated into OP-TEE Qemu build
system [2]. And then it would be easier to migrate them to your
buildroot environment as well.

[1] https://lists.trustedfirmware.org/pipermail/op-tee/2020-May/000027.html
[2] https://optee.readthedocs.io/en/latest/building/devices/qemu.html#qemu-v8

-Sumit

>
> /Jarkko
