Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A639D7D08C
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 22:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753174AbeEVWuI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 18:50:08 -0400
Received: from mail-ot0-f193.google.com ([74.125.82.193]:36594 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753004AbeEVWuG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 18:50:06 -0400
Received: by mail-ot0-f193.google.com with SMTP id m11-v6so22966567otf.3;
        Tue, 22 May 2018 15:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2z83qReWz6A9/v4kzBiHMRJ4TUDuh2+nULA0qPZ4+kw=;
        b=vT6fft+M2OmE9pPrX+OZVUS37LIf2L5vCRgAzFABjKa9dh93iwdbCDeDmfHr2hUsay
         SV6lGPWRFF0EJQXxv72jIRNBtNWOfZRNQsiYPMTJhTFaqPUUHn3vJjxUP8HunF6JDzwz
         7b35nV18P5T0m+PI9qAXu32Hekmp0YNtTNJ1eferTUPZc8ArM1KpiMAjJ1FaNCKTn70A
         6nIUedJS2+H/I76/Y7kWWGnrDwieOgXWnh0sNibesqff5Iev3UpmMZp6TrsKbFRhYhvj
         X/ZJfVtSi8x2nzrBHL5f2JphcI3Fbuum4HY6sU9ox7Hts3liWZkJaIbjPsWTzuCdb0a6
         Nxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2z83qReWz6A9/v4kzBiHMRJ4TUDuh2+nULA0qPZ4+kw=;
        b=haaDTTatukmbNr72qi2aKOTiswWEl7ekCf/2iZV7gaggnRTpKpDajloIro1Ia0WZSA
         dat1BT1dZLnZNFpahHWutYiPHl5SL+e12dARoxi+7JXMcgZIdH7WzuAMiVHXXPO+odP+
         iLof5rK3IewtKjbWa1gU0hithQ+WDTAXdlPrIvSQy8ZAZZf50WBqMgcScD5JjTbQDnT2
         6ekxcDJtGytWE8Nm6YmDPKIYGWdEUkbJa6FsfPuAU7zLgvU7TN0jJPWVSBQV49e0D3YS
         2C3htmdQ/MEuY/94PoOC0/6h5bv3Oxk8KEna8Xo9LsGZuq4ibr0BpoZOEqIDsT0pFh/X
         U0xw==
X-Gm-Message-State: ALKqPweJprP+2UN8937f4F6+Soj4d0/ncjMYR0s1zvcMYFbjAlJTal7T
        UTHNYRuHZEpQHnewTe4M6Kw=
X-Google-Smtp-Source: AB8JxZr/2rWvlTnsyDlxdUILvpZDSTaDNFP8v10TfDJRH7wZAOYvYJ2R2hfL0UP9W2OdvM9OohNHzw==
X-Received: by 2002:a9d:ac4:: with SMTP id 62-v6mr253513otq.257.1527029405918;
        Tue, 22 May 2018 15:50:05 -0700 (PDT)
Received: from nuclearis2_1.gtech (c-98-201-114-184.hsd1.tx.comcast.net. [98.201.114.184])
        by smtp.gmail.com with ESMTPSA id b45-v6sm13822648otb.55.2018.05.22.15.50.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 15:50:05 -0700 (PDT)
Subject: Re: [PATCH 2/5] PCI/AER: Add sysfs stats for AER capable devices
To:     Rajat Jain <rajatja@google.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jes Sorensen <jsorensen@fb.com>,
        Kyle McMartin <jkkm@fb.com>
Cc:     rajatxjain@gmail.com
References: <20180522222805.80314-1-rajatja@google.com>
 <20180522222805.80314-3-rajatja@google.com>
From:   "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <dcbb2e92-722f-c178-efb7-8d99d4a9d99f@gmail.com>
Date:   Tue, 22 May 2018 17:50:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180522222805.80314-3-rajatja@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 05/22/2018 05:28 PM, Rajat Jain wrote:
> Add the following AER sysfs stats to represent the counters for each
> kind of error as seen by the device:
> 
> dev_total_cor_errs
> dev_total_fatal_errs
> dev_total_nonfatal_errs
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
>  drivers/pci/pci-sysfs.c                |  3 ++
>  drivers/pci/pci.h                      |  4 +-
>  drivers/pci/pcie/aer/aerdrv.h          |  1 +
>  drivers/pci/pcie/aer/aerdrv_errprint.c |  1 +
>  drivers/pci/pcie/aer/aerdrv_stats.c    | 72 ++++++++++++++++++++++++++
>  5 files changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 366d93af051d..730f985a3dc9 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -1743,6 +1743,9 @@ static const struct attribute_group *pci_dev_attr_groups[] = {
>  #endif
>  	&pci_bridge_attr_group,
>  	&pcie_dev_attr_group,
> +#ifdef CONFIG_PCIEAER
> +	&aer_stats_attr_group,
> +#endif
>  	NULL,
>  };

So if the device is removed as part of recovery, then these get reset,
right? So if the device fails intermittently, these counters would keep
getting reset. Is this the intent?

(snip)

>  /**
>   * pci_match_one_device - Tell if a PCI device structure has a matching
> diff --git a/drivers/pci/pcie/aer/aerdrv.h b/drivers/pci/pcie/aer/aerdrv.h
> index d8b9fba536ed..b5d5ad6f2c03 100644
> --- a/drivers/pci/pcie/aer/aerdrv.h
> +++ b/drivers/pci/pcie/aer/aerdrv.h
> @@ -87,6 +87,7 @@ void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info);
>  irqreturn_t aer_irq(int irq, void *context);
>  int pci_aer_stats_init(struct pci_dev *pdev);
>  void pci_aer_stats_exit(struct pci_dev *pdev);
> +void pci_dev_aer_stats_incr(struct pci_dev *pdev, struct aer_err_info *info);
>  
>  #ifdef CONFIG_ACPI_APEI
>  int pcie_aer_get_firmware_first(struct pci_dev *pci_dev);
> diff --git a/drivers/pci/pcie/aer/aerdrv_errprint.c b/drivers/pci/pcie/aer/aerdrv_errprint.c
> index 21ca5e1b0ded..5e8b98deda08 100644
> --- a/drivers/pci/pcie/aer/aerdrv_errprint.c
> +++ b/drivers/pci/pcie/aer/aerdrv_errprint.c
> @@ -155,6 +155,7 @@ static void __aer_print_error(struct pci_dev *dev,
>  			pci_err(dev, "   [%2d] Unknown Error Bit%s\n",
>  				i, info->first_error == i ? " (First)" : "");
>  	}
> +	pci_dev_aer_stats_incr(dev, info);

What about AER errors that are contained by DPC?

Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
