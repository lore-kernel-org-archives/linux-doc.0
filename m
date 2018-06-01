Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E7F5E7DF92
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 15:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752233AbeFAPCh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 11:02:37 -0400
Received: from mail-qk0-f193.google.com ([209.85.220.193]:40894 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751378AbeFAPCd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 11:02:33 -0400
Received: by mail-qk0-f193.google.com with SMTP id r66-v6so20098586qkr.7;
        Fri, 01 Jun 2018 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=9wV/O7huWoA3B1tCLmxVuYeniucPKX479RK3dRyYUm0=;
        b=nsCBMHDquTD8IeFUWsd8EOLt5IeKRL/RuW0LLlw5OTwbMrGkuxc6U+pN9WkdTQTQ/4
         /mAhiUv5Bu4yUjus6dkmzUbDVFPATHjtGrIFOn8C+cm2ErOaQndmKxjiqCslreuYNbS6
         CRbHtZUArCKFQgLhid9tMdxE+5imSPGHSzKUa3BN4i33qNttC+J+vXkK1JHX56lBiQqD
         Ac2ziIqUq5eCuDbF3El1W40/pzgKB76CjWKjvZY91n/zhg5sQnGLvOPxkcTFHTNWytkb
         TI8tf9jqw+ga9NpeD/PaDJdqsNlV4NhO+1LaKcyUnuYXHnFTflzd1JhBTfdWFemMQlJC
         BjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=9wV/O7huWoA3B1tCLmxVuYeniucPKX479RK3dRyYUm0=;
        b=cNasvlQNbdj0RS5izTzS+gPbnS8hB1P3AZC/eTv1o73ikapk8zSB/Ai0pv9L6z5JeZ
         ZzjnbvH/YTM9hT8AzTHkBjPNf2hyMVf6H3Ksa7QMmIFu35bNBE095M45ElYb9kWtqc5V
         Rb67hlyujWOc3z4huUVQJx/YkK2ubsUrHTSKtIzVQwI3HOZUTVfLcXjDQ9wZDBr/nzTM
         lVGx/jSoT6IkGkj1FSBwOCbpbu/kd/xCnZUbk7gP9ItfibkorPXxt5KvIaGF/wwTS2g8
         AdGOzr00X5kyF8QegPuPgc7xfZCnZKJp2HgGEDBlSt08CXkQezReZn81JecprdygODXr
         t7BA==
X-Gm-Message-State: APt69E1h735aaLfnV1QqKyuovvmpiew9tjk0lQzfPbxCxACJW7iHCYfH
        4v0a+d7NgiC6+I6PAMqoj1HimGqgoNEuimtZ8F0=
X-Google-Smtp-Source: ADUXVKItIccv1yBaX17o6WySdYk7MvUi970Y+dIwemviUCOIAo5o0d35prXJCdG/vbicdiCXaF1BDFJ2Mb9ZhNnguFI=
X-Received: by 2002:a37:7742:: with SMTP id s63-v6mr10009045qkc.97.1527865352322;
 Fri, 01 Jun 2018 08:02:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:98f9:0:0:0:0:0 with HTTP; Fri, 1 Jun 2018 08:02:31 -0700 (PDT)
In-Reply-To: <1527654876-26716-1-git-send-email-okaya@codeaurora.org>
References: <1527654876-26716-1-git-send-email-okaya@codeaurora.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 1 Jun 2018 18:02:31 +0300
Message-ID: <CAHp75Vc3YKAR1P_F0fwD+ueGub4gVUjP0=wv4Egf_fTSVkSUjw@mail.gmail.com>
Subject: Re: [PATCH] PCI: move early dump functionality from x86 arch into the
 common code
To:     Sinan Kaya <okaya@codeaurora.org>
Cc:     linux-pci@vger.kernel.org, Timur Tabi <timur@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Christoffer Dall <cdall@linaro.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Thymo van Beers <thymovanbeers@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Rientjes <rientjes@google.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Juergen Gross <jgross@suse.com>, Borislav Petkov <bp@suse.de>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Petr Tesarik <ptesarik@suse.cz>,
        Andy Lutomirski <luto@kernel.org>,
        Dou Liyang <douly.fnst@cn.fujitsu.com>,
        Ram Pai <linuxram@us.ibm.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 30, 2018 at 7:34 AM, Sinan Kaya <okaya@codeaurora.org> wrote:
> Move early dump functionality into common code so that it is available for
> all archtiectures. No need to carry arch specific reads around as the read
> hooks are already initialized by the time pci_setup_device() is getting
> called during scan.

>  /* If set, the PCIe ATS capability will not be used. */
>  static bool pcie_ats_disabled;
>
> +bool pci_early_dump;
> +

I didn't check above these, but maybe a good idea to add one line
comment what is this about?


>  extern const unsigned char pcie_link_speed[];
> -
> +extern bool pci_early_dump;
>  bool pcie_cap_has_lnkctl(const struct pci_dev *dev);
>

Hmm... I would rather not attach this line to some function declarations.

> +static void early_dump_pci_device(struct pci_dev *pdev)
> +{
> +       u32 value[256 / 4];
> +       int i;
> +
> +       dev_info(&pdev->dev, "pci 0000:%02x:%02x.%d config space:\n",
> +                pdev->bus->number, PCI_SLOT(pdev->devfn),
> +                PCI_FUNC(pdev->devfn));

Shouldn't be this changed to pci_info() ?

> +
> +       for (i = 0; i < 256; i += 4)
> +               pci_read_config_dword(pdev, i, &value[i / 4]);
> +
> +       print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 1, value,
> +                      256, false);
> +}

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
