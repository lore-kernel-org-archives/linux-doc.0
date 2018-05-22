Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 071CD7D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 23:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753100AbeEVX2R (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 19:28:17 -0400
Received: from mail-ot0-f194.google.com ([74.125.82.194]:35489 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753139AbeEVX2Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 19:28:16 -0400
Received: by mail-ot0-f194.google.com with SMTP id h8-v6so23062708otb.2
        for <linux-doc@vger.kernel.org>; Tue, 22 May 2018 16:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=i58Ppfqdh+5bHRvHkrmBOHDeMbXtCVBJU1fm7/fb24M=;
        b=D7GBWTIKkxc3WCMbM7qtjvHszJuRq3KGJD3eVmIdNcxFUxvB7CN4yYm3HJgssQpdMn
         4mLwI8U++QSLAJV+mdBbg2eWIc/ZYRFydwod8HXc7BRpRHK7uAjJMyErmq80NlCybwSN
         Tu3Bwc3lHvDoH4YMDDDaRVPHwA1FLi7LX8eQX65uqk8vQ9fSXZj8qzttbMXPw5ZHd6NT
         l5a/mkuq4SuighknQ1mjPSQfeahBV9kbQ59OiNrEED98bEtfGDRcgNatC1OB+kZn2+Nd
         ShcEbgkzrU6Ond77LfoW7GMg3jzXC5WeOD704xzIWFnuT6bj1KgUOgHmTJNicIbTjf+t
         M5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=i58Ppfqdh+5bHRvHkrmBOHDeMbXtCVBJU1fm7/fb24M=;
        b=N37689FVIZZZLtU7VjiILZHCwRn3q8nthd+B8KQkcWdvR6UObxBuPu1jmRQti572zo
         jqHWNNWuWt6pS5ZIqc0wLzZXDLWCnfFvNAuZMl4teo9RDbyRoXoxYqgYUI8opOV2KDxn
         205PATWDoYLECPdaCQ1mzwB7UqXps7vO1XVJ16JVjjRbLmrN86LJPmhSZPJaGTJPBucw
         Mxqiwko/mAWMWSTbYJK4uC94cfpVr5RTm+5bDq3MUODvD5U+Oqi14yQ40Sp3uiRcdJgl
         yq2hnln6P1Nv6vwL1Ya7gr0utGFLXRh92eGYSB57UafUnSFg+LBd9/jEU9Tz9rlVn9PH
         aMxg==
X-Gm-Message-State: ALKqPwfRl4aUScvGzuxNpeg+WDvn8r5Rf5yuyDJGnDZurAgodk6BPuUz
        EJbSPOd2SqFCN+NX4E4Sy9E5xep9LdmostiSS4W9OA==
X-Google-Smtp-Source: AB8JxZrBb6btPhYTCnpeNfi6Vwi+xPrahXPfoffzXOWB8mqnSccO6mvaXMouZ5kLf97c1aN9iyBUQK5TMLyrt8MUKEw=
X-Received: by 2002:a9d:2dc9:: with SMTP id g67-v6mr302942otb.135.1527031694465;
 Tue, 22 May 2018 16:28:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b57:0:0:0:0:0 with HTTP; Tue, 22 May 2018 16:27:33 -0700 (PDT)
In-Reply-To: <dcbb2e92-722f-c178-efb7-8d99d4a9d99f@gmail.com>
References: <20180522222805.80314-1-rajatja@google.com> <20180522222805.80314-3-rajatja@google.com>
 <dcbb2e92-722f-c178-efb7-8d99d4a9d99f@gmail.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 22 May 2018 16:27:33 -0700
Message-ID: <CACK8Z6GNPa+15WLxJBUAZ2=+jfhtdz+85=41B56KWSWCHSnyGw@mail.gmail.com>
Subject: Re: [PATCH 2/5] PCI/AER: Add sysfs stats for AER capable devices
To:     "Alex G." <mr.nuke.me@gmail.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
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
        linux-pci <linux-pci@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jes Sorensen <jsorensen@fb.com>, Kyle McMartin <jkkm@fb.com>,
        Rajat Jain <rajatxjain@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 22, 2018 at 3:50 PM, Alex G. <mr.nuke.me@gmail.com> wrote:
>
>
> On 05/22/2018 05:28 PM, Rajat Jain wrote:
>> Add the following AER sysfs stats to represent the counters for each
>> kind of error as seen by the device:
>>
>> dev_total_cor_errs
>> dev_total_fatal_errs
>> dev_total_nonfatal_errs
>>
>> Signed-off-by: Rajat Jain <rajatja@google.com>
>> ---
>>  drivers/pci/pci-sysfs.c                |  3 ++
>>  drivers/pci/pci.h                      |  4 +-
>>  drivers/pci/pcie/aer/aerdrv.h          |  1 +
>>  drivers/pci/pcie/aer/aerdrv_errprint.c |  1 +
>>  drivers/pci/pcie/aer/aerdrv_stats.c    | 72 ++++++++++++++++++++++++++
>>  5 files changed, 80 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
>> index 366d93af051d..730f985a3dc9 100644
>> --- a/drivers/pci/pci-sysfs.c
>> +++ b/drivers/pci/pci-sysfs.c
>> @@ -1743,6 +1743,9 @@ static const struct attribute_group *pci_dev_attr_groups[] = {
>>  #endif
>>       &pci_bridge_attr_group,
>>       &pcie_dev_attr_group,
>> +#ifdef CONFIG_PCIEAER
>> +     &aer_stats_attr_group,
>> +#endif
>>       NULL,
>>  };
>
> So if the device is removed as part of recovery, then these get reset,
> right? So if the device fails intermittently, these counters would keep
> getting reset. Is this the intent?

Umm, kind of.
* One argument is that if a PCI device is removed and then
re-enumerated, how do we know it is the same device and has not been
replaced by another device for e.g.?  Note that the root port counters
that have the cumulative counters for all the errors seen will still
have them logged in the situation you describe.

>
> (snip)
>
>>  /**
>>   * pci_match_one_device - Tell if a PCI device structure has a matching
>> diff --git a/drivers/pci/pcie/aer/aerdrv.h b/drivers/pci/pcie/aer/aerdrv.h
>> index d8b9fba536ed..b5d5ad6f2c03 100644
>> --- a/drivers/pci/pcie/aer/aerdrv.h
>> +++ b/drivers/pci/pcie/aer/aerdrv.h
>> @@ -87,6 +87,7 @@ void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info);
>>  irqreturn_t aer_irq(int irq, void *context);
>>  int pci_aer_stats_init(struct pci_dev *pdev);
>>  void pci_aer_stats_exit(struct pci_dev *pdev);
>> +void pci_dev_aer_stats_incr(struct pci_dev *pdev, struct aer_err_info *info);
>>
>>  #ifdef CONFIG_ACPI_APEI
>>  int pcie_aer_get_firmware_first(struct pci_dev *pci_dev);
>> diff --git a/drivers/pci/pcie/aer/aerdrv_errprint.c b/drivers/pci/pcie/aer/aerdrv_errprint.c
>> index 21ca5e1b0ded..5e8b98deda08 100644
>> --- a/drivers/pci/pcie/aer/aerdrv_errprint.c
>> +++ b/drivers/pci/pcie/aer/aerdrv_errprint.c
>> @@ -155,6 +155,7 @@ static void __aer_print_error(struct pci_dev *dev,
>>                       pci_err(dev, "   [%2d] Unknown Error Bit%s\n",
>>                               i, info->first_error == i ? " (First)" : "");
>>       }
>> +     pci_dev_aer_stats_incr(dev, info);
>
> What about AER errors that are contained by DPC?

Thanks, You are right, this patch does not take care of the DPC. I'll
try to read up on DPC and can integrate it if it turns out to be easy
enough.

Thanks,

Rajat

>
> Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
