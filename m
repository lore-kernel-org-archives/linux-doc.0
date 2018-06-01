Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0CD9B7D08C
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 10:39:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750852AbeFAKjw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 06:39:52 -0400
Received: from mail-qt0-f195.google.com ([209.85.216.195]:45281 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750827AbeFAKjv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 06:39:51 -0400
Received: by mail-qt0-f195.google.com with SMTP id i18-v6so20885680qtp.12;
        Fri, 01 Jun 2018 03:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r/bwtFdAENncrwZFULr6jtDMzAB7g+cou8lBGT8XRys=;
        b=jND4c+a17JwxXXdI1jgWa1EOM01jfIraN26o/nHHhLjV8VWko6uXRIGDDm4sT01IOZ
         LMElyADSZKUIwI6a6H3LmcUHX3D+GNFoEPmj+3t03EJIaS+bT0rTwNn84+zhh9o46iwV
         wk3dw/nO/uoqh8cx6weo0rttxX9WQ253NnHZkYc1Q4g3Rk4GxHhP0zTlu51BiNCOa33d
         P4DLl3O326J/MZQDin5tMe+B79twZhAZkkuoXFqyBDqHARB/fk8zpPToGRsYgZjsE6Y5
         Vbday2VVzXXq5hLXqIElATCu9zln79oeXPSavCD5uAQypwQ7Q8axEgRVAQdqMu2c4Nml
         9Xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r/bwtFdAENncrwZFULr6jtDMzAB7g+cou8lBGT8XRys=;
        b=KvvAbmAr5p8ejzCj5JAKYwNiD4NOo2AI4LttNpZ4pf/tg+Nz0rSs2cH+wekw01qSN2
         Xon/qLh040qrfQ6e15py4Ry9dLM9d/L9EcNOOqKDiRxiowlFvmuOKeKvnET8dgXxdN9M
         FlfNx8DkBwp8mukDsXzm5YvgeV56fXqbgTyoNYFfnRkaCT0a65gG0iBS5ksLTaNd8uDa
         mOKOIKpWDeCHhWf/bPqWI+a2M9HGk8PrxTUK3aS0BubYFyk3tFL6tLNTef4PEPDtpT5j
         sGNLlH74CueGYWp6e5DgQhhta/ULpaAv72Dwn0JDMP6W1GAuI7lfYeRLOzjUqzczuqT0
         o2SQ==
X-Gm-Message-State: APt69E1OWUhca4TSQI8eIrKABI4fuKJU/nZb02D4Y2N1ZqQTJ9FXGh+N
        O8SN5PMR/w3WOnAyAlz7/bB29A3f6gbBdYCNxcs=
X-Google-Smtp-Source: ADUXVKKvnhaNvo//FT6VSrKIV/JvMu3J0dW/mghJ9byNeup9ljUDvv7O6Tg2HflU7eMTLevuV6zC9El83jQBu06xC6w=
X-Received: by 2002:ac8:32f3:: with SMTP id a48-v6mr9636043qtb.404.1527849590162;
 Fri, 01 Jun 2018 03:39:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:98f9:0:0:0:0:0 with HTTP; Fri, 1 Jun 2018 03:39:49 -0700 (PDT)
In-Reply-To: <20180531235010.5279-2-logang@deltatee.com>
References: <20180531235010.5279-1-logang@deltatee.com> <20180531235010.5279-2-logang@deltatee.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 1 Jun 2018 13:39:49 +0300
Message-ID: <CAHp75VcQwDGqND8v1RTo4+6Hyf9G5_2w9x9aiVONwKXsTKgJ1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] PCI: Make specifying PCI devices in kernel
 parameters reusable
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Stephen Bates <sbates@raithlin.com>,
        Christoph Hellwig <hch@lst.de>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 1, 2018 at 2:50 AM, Logan Gunthorpe <logang@deltatee.com> wrote=
:
> Separate out the code to match a PCI device with a string (typically
> originating from a kernel parameter) from the
> pci_specified_resource_alignment() function into its own helper
> function.
>
> While we are at it, this change fixes the kernel style of the function
> (fixing a number of long lines and extra parentheses).
>
> Additionally, make the analogous change to the kernel parameter
> documentation: Separating the description of how to specify a PCI device
> into it's own section at the head of the pci=3D parameter.
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Reviewed-by: Stephen Bates <sbates@raithlin.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Sorry for maybe being late here.

> -       pci=3Doption[,option...]  [PCI] various PCI subsystem options:
> +       pci=3Doption[,option...]  [PCI] various PCI subsystem options.
> +
> +                               Some options herein operate on a specific=
 device
> +                               or a set of devices (<pci_dev>). These ar=
e
> +                               specified in one of two formats:

I would rather to add

 <pci_dev>

here in the same way as done for options.
It would be easy for people to find a referenced paragraph.

> +
> +                               [<domain>:]<bus>:<slot>.<func>
> +                               pci:<vendor>:<device>[:<subvendor>:<subde=
vice>]
> +
> +                               Note: the first format specifies a PCI
> +                               bus/slot/function address which may chang=
e
> +                               if new hardware is inserted, if motherboa=
rd
> +                               firmware changes, or due to changes cause=
d
> +                               by other kernel parameters. The second fo=
rmat
> +                               selects devices using IDs from the
> +                               configuration space which may match multi=
ple
> +                               devices in the system.

> +static int pci_dev_str_match(struct pci_dev *dev, const char *p,
> +                            const char **endptr)

This change I hope has no functional alteration, so, can be split to a
separate patch.

--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
