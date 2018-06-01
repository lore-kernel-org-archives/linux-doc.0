Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D828C7D072
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 10:41:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751503AbeFAKlX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 06:41:23 -0400
Received: from mail-qt0-f196.google.com ([209.85.216.196]:43755 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750827AbeFAKlW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 06:41:22 -0400
Received: by mail-qt0-f196.google.com with SMTP id y89-v6so6093487qtd.10;
        Fri, 01 Jun 2018 03:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3xn/vESHDtFD04h6Nn+sQp96C9kmTyg2N9lKi6PFAYY=;
        b=Q0CPI24ZwBgdrw3lsqanR0rhsAHqlCk8N0KeBFaAtFwd+PPycChqF2+FhPK+KLXRHa
         Po94WaSmqFkWqcXONtI/00Bif9AZEqFT/HWYU2xL9gJcoJPph+5gK1VE4ch2b79umtjW
         5/p7gFVfII+1drrp++fBniNBvGWpoCmZQDAkyiolg33SPObKJbAPUrYvTYwGVSjRBoir
         G30Q8/KEGo7ypjBazaVzMhxdJMF4YEZ9DFkLcb5stTdtWIdklQjbhlGi95i6OhRg5sNw
         k971ZiNdW/sQDo+3J2hsH79+qZVa13ay+f2sdDF4vQGyX2gGud5gOw1FOYSw9GZuN8sg
         LYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3xn/vESHDtFD04h6Nn+sQp96C9kmTyg2N9lKi6PFAYY=;
        b=hfmqC7j6sivsaiuPHNqrRjjJJGfsFU204gKb/i1y2opp5fMP38qjDCK5pgyn2U5YUd
         PIq+70rlKhjaCRanq+EMEQZBQnmHCWjursvwIBdtDeXzHuvZ51WgTcg88edzEkPmI4mk
         Eg+2RoWKppT4PfPCsQGryiGyJL8Zu62va1O5RwOQPEjThMT6FOoDSPeRHqUPr5HVmmg0
         blUCnLsIr0urk7q68fBWCJFpUCmwjLUQvmuX9HO0lBv9vYD2H39dSdT2YS5L+gaCY9FS
         LPwGs1NGY/Ybn1ptV5ChVgSBw9zyt0hqeWSt5nSCQctIGQuJY346lznKUkKlVJis2nEx
         uxXg==
X-Gm-Message-State: APt69E3uadVY2bUeb7M23/AIjyouIk9SNkcdPSJG/EG0hc5ae1l955zE
        gh013S2dJjQK19WRoR8Lq1Z5w2dYIkvIFk2kqg0=
X-Google-Smtp-Source: ADUXVKIsq1Xbm2XRRCcSX/TC2GDjmkU9TQvAeA0qJPJTr1WYNIPtNVXtOC3SmZM6OUYEqIx6cu8b+F5NAMeyQgOOuio=
X-Received: by 2002:ac8:190c:: with SMTP id t12-v6mr10651627qtj.278.1527849681394;
 Fri, 01 Jun 2018 03:41:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:98f9:0:0:0:0:0 with HTTP; Fri, 1 Jun 2018 03:41:20 -0700 (PDT)
In-Reply-To: <20180531235010.5279-3-logang@deltatee.com>
References: <20180531235010.5279-1-logang@deltatee.com> <20180531235010.5279-3-logang@deltatee.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 1 Jun 2018 13:41:20 +0300
Message-ID: <CAHp75Vc4yxeM+jz2biMBoWB-h_dG1_Qx91VCP+f1mhvvgPVPxQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] PCI: Allow specifying devices using a base bus and
 path of devfns
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
> When specifying PCI devices on the kernel command line using a
> BDF, the bus numbers can change when adding or replacing a device,
> changing motherboard firmware, or applying kernel parameters like
> pci=3Dassign-buses. When this happens, it is usually undesirable to
> apply whatever command line tweak to the wrong device.
>
> Therefore, it is useful to be able to specify devices with a base
> bus number and the path of devfns needed to get to it. (Similar to
> the "device scope" structure in the Intel VT-d spec, Section 8.3.1.)
>
> Thus, we add an option to specify devices in the following format:
>
> path:[<domain>:]<bus>:<slot>.<func>/<slot>.<func>[/ ...]
>
> The path can be any segment within the PCI hierarchy of any length and
> determined through the use of 'lspci -t'. When specified this way, it is
> less likely that a renumbered bus will result in a valid device specifica=
tion
> and the tweak won't be applied to the wrong device.
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Reviewed-by: Stephen Bates <sbates@raithlin.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

> -                               specified in one of two formats:
> +                               specified in one of three formats:

...in one of the following formats:

in the first place and don't fix it each time you add/remove one?


--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
