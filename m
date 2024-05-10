Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73094C637
	for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 20:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715371436; cv=none; b=LGTYpihkRWjhymMZMLzx9FnuAVE+q23rEljl57+EGr9Sgu1Yf5G6X3ymL3XVDqfc8eWVXT5Rts/XEnCqbe117SDbqGkcNV26YkDr98tk2e2nkKWxWTOAdQYSNb59NtRHTYFe0QxOPgGzgCZUqyd6w+7Dlp/pRtkJFsVdYg4+1ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715371436; c=relaxed/simple;
	bh=SxPIHdr8S+eRfdtMNOCxfApLuqEkP+GJwy3FGwuKuXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPoalLgquwa3XJ31cUd4/tKKtl+442EkiGFN0WEpFeSiUUn77bSYV1lXgygiZz1TiemNP1Y/l7dtaKFoAwojD/KG7vvUoFE6pK8tP44RwJuSkcV5D3eus54pNdvBJjp1JcCHqZMBB50yPR2Y/FSJr8vqDEmO6SXlzehhOmVAwQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=uiZsIrz8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="uiZsIrz8"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e4bf0b3e06so22351155ad.1
        for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 13:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1715371434; x=1715976234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RskZ8n5PeN0X02QsGxL+0rF1EfA4GzHbygmSEftJMSg=;
        b=uiZsIrz8SMQXKrZmOR0alh6olSRedJ14V3AMT7QFTckfotZeJadzVEHQ3iBI1+Li82
         NCwTDl9/x496x8BpbWH35nnePcAK7t0OcQYhRsgxz3aZsu7Q8sayVBfM6cEuLyNJ9ETW
         4AbEDevqkT0o8Tz3MxxYVNZvKx46Mapuh6PI7hTWJ4/dx0C/qzony26aIMpM/04+09QT
         3ogiNoyl7zfd/kQqpRwX55AyEjCvNVBK9gT0W6BCAulXLJJZCKvBApxWM9Zw/kTSB6Z5
         46wGFS9wbvNskpjX9TzhDhiCyvkuxNBuE41KTJueKsvzlMOt9lu4M8nkAA2KM49vLIh/
         0mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715371434; x=1715976234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RskZ8n5PeN0X02QsGxL+0rF1EfA4GzHbygmSEftJMSg=;
        b=RISNVPXNVSWKkDgWUAY9xnxZXm6Wb5iUGr817XGfNWFlx82e/ak/9oVipV/4ZAxaNZ
         y3j13rMGU77b8ynY05WnfBL571qLV3pbu3eHd7AIb4jbWGqL0o0S0vW4uJaccVGz/Gz6
         r5dMHX8nbOFr9fanDTmIPrla3GNteS3Jf7EbfNRgcdNMWFqa0sPJFH/cmQ4FxJ1KrufO
         hj+jOqfnhC8p8alaPlhHBviX3RZMrwkDTKsg+F5TsjuAUZfc6ij8QqIqLpSu7aMezriV
         igtyzBLYg7k4TOkXNXZLgKNEYVNkIa0a+bxxBmwYCLYXo29j89vwYpqdgBpMm5JzBbQB
         Fc7g==
X-Forwarded-Encrypted: i=1; AJvYcCWlbT14VifQSuS84Xkh63wKFAXf6WlMRDLRprrBbmr46zDutMZShlq6jb0jfHE8ngdE2U/wHd0cgYY8SQ8SxCZDbsH0ldliNupr
X-Gm-Message-State: AOJu0YyVx9autLV3IKRXS4UTMh4cCZcY/CxfJC4SicriQpdGuLgoKMc8
	7xmxEywDkh5VSGdv+vm8gyBl8m4qp0Eh9aIA/RARamtb0ePs3Qrl3dn1a4lTPOA=
X-Google-Smtp-Source: AGHT+IFNOsXVgAh69FDONwW3rAmu1T5fW2J+sp2MDhwChy9Q7hvd+YfmOPzDj6gXW9jqqqmT2D6cGQ==
X-Received: by 2002:a17:902:a9ca:b0:1eb:1473:c878 with SMTP id d9443c01a7336-1ef43e266bbmr35101295ad.36.1715371433758;
        Fri, 10 May 2024 13:03:53 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:1cbd:da2b:a9f2:881? ([2620:10d:c090:500::7:10f0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf2f722sm36034885ad.120.2024.05.10.13.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 13:03:53 -0700 (PDT)
Message-ID: <0ef50183-42d4-4abd-adeb-bd92b030fe6a@davidwei.uk>
Date: Fri, 10 May 2024 13:03:50 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 8/9] bnxt_en: Add TPH support in BNXT driver
Content-Language: en-GB
To: Andy Gospodarek <andrew.gospodarek@broadcom.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>, Wei Huang
 <wei.huang2@amd.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, bhelgaas@google.com, corbet@lwn.net,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, alex.williamson@redhat.com, michael.chan@broadcom.com,
 manoj.panicker2@amd.com, Eric.VanTassell@amd.com
References: <20240509162741.1937586-1-wei.huang2@amd.com>
 <20240509162741.1937586-9-wei.huang2@amd.com>
 <868a4758-2873-4ede-83e5-65f42cb12b81@linux.dev>
 <CACZ4nhuBMOX8s1ODcJOvvCKp-VsOPHShEUHAsPvB75Yv2823qA@mail.gmail.com>
 <4c6a8b86-6544-4c99-a0f2-030e2ec4e98f@linux.dev>
 <Zj48BPYoFU1ISaiL@C02YVCJELVCG.dhcp.broadcom.net>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <Zj48BPYoFU1ISaiL@C02YVCJELVCG.dhcp.broadcom.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2024-05-10 08:23, Andy Gospodarek wrote:
> On Fri, May 10, 2024 at 11:35:35AM +0100, Vadim Fedorenko wrote:
>> On 10.05.2024 04:55, Ajit Khaparde wrote:
>>> On Thu, May 9, 2024 at 2:50 PM Vadim Fedorenko
>>> <vadim.fedorenko@linux.dev> wrote:
>>>>
>>>> On 09/05/2024 17:27, Wei Huang wrote:
>>>>> From: Manoj Panicker <manoj.panicker2@amd.com>
>>>>>
>>>>> As a usage example, this patch implements TPH support in Broadcom BNXT
>>>>> device driver by invoking pcie_tph_set_st() function when interrupt
>>>>> affinity is changed.
>>>>>
>>>>> Reviewed-by: Ajit Khaparde <ajit.khaparde@broadcom.com>
>>>>> Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>
>>>>> Reviewed-by: Wei Huang <wei.huang2@amd.com>
>>>>> Signed-off-by: Manoj Panicker <manoj.panicker2@amd.com>
>>>>> ---
>>>>>    drivers/net/ethernet/broadcom/bnxt/bnxt.c | 51 +++++++++++++++++++++++
>>>>>    drivers/net/ethernet/broadcom/bnxt/bnxt.h |  4 ++
>>>>>    2 files changed, 55 insertions(+)
>>>>>
>>>>> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>>>>> index 2c2ee79c4d77..be9c17566fb4 100644
>>>>> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>>>>> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>>>>> @@ -55,6 +55,7 @@
>>>>>    #include <net/page_pool/helpers.h>
>>>>>    #include <linux/align.h>
>>>>>    #include <net/netdev_queues.h>
>>>>> +#include <linux/pci-tph.h>
>>>>>
>>>>>    #include "bnxt_hsi.h"
>>>>>    #include "bnxt.h"
>>>>> @@ -10491,6 +10492,7 @@ static void bnxt_free_irq(struct bnxt *bp)
>>>>>                                free_cpumask_var(irq->cpu_mask);
>>>>>                                irq->have_cpumask = 0;
>>>>>                        }
>>>>> +                     irq_set_affinity_notifier(irq->vector, NULL);
>>>>>                        free_irq(irq->vector, bp->bnapi[i]);
>>>>>                }
>>>>>
>>>>> @@ -10498,6 +10500,45 @@ static void bnxt_free_irq(struct bnxt *bp)
>>>>>        }
>>>>>    }
>>>>>
>>>>> +static void bnxt_rtnl_lock_sp(struct bnxt *bp);
>>>>> +static void bnxt_rtnl_unlock_sp(struct bnxt *bp);
>>>>> +static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
>>>>> +                                  const cpumask_t *mask)
>>>>> +{
>>>>> +     struct bnxt_irq *irq;
>>>>> +
>>>>> +     irq = container_of(notify, struct bnxt_irq, affinity_notify);
>>>>> +     cpumask_copy(irq->cpu_mask, mask);
>>>>> +
>>>>> +     if (!pcie_tph_set_st(irq->bp->pdev, irq->msix_nr,
>>>>> +                          cpumask_first(irq->cpu_mask),
>>>>> +                          TPH_MEM_TYPE_VM, PCI_TPH_REQ_TPH_ONLY))
>>>>> +             pr_err("error in configuring steering tag\n");
>>>>> +
>>>>> +     if (netif_running(irq->bp->dev)) {
>>>>> +             rtnl_lock();
>>>>> +             bnxt_close_nic(irq->bp, false, false);
>>>>> +             bnxt_open_nic(irq->bp, false, false);
>>>>> +             rtnl_unlock();
>>>>> +     }
>>>>
>>>> Is it really needed? It will cause link flap and pause in the traffic
>>>> service for the device. Why the device needs full restart in this case?
>>>
>>> In that sequence only the rings are recreated for the hardware to sync
>>> up the tags.
>>>
>>> Actually its not a full restart. There is no link reinit or other
>>> heavy lifting in this sequence.
>>> The pause in traffic may be momentary. Do IRQ/CPU affinities change frequently?
>>> Probably not?
>>
>> From what I can see in bnxt_en, proper validation of link_re_init parameter is
>> not (yet?) implemented, __bnxt_open_nic will unconditionally call
>> netif_carrier_off() which will be treated as loss of carrier with counters
>> increment and proper events posted. Changes to CPU affinities were
>> non-disruptive before the patch, but now it may break user-space
>> assumptions.
> 
> From my testing the link should not flap.  I just fired up a recent net-next
> and confirmed the same by calling $ ethtool -G ens7f0np0 rx 1024 which does a
> similar bnxt_close_nic(bp, false, false)/bnxt_open_nic(bp, false, false) as
> this patch.  Link remained up -- even with a non-Broadocm link-partner.
> 
>> Does FW need full rings re-init to update target value, which is one u32 write?
>> It looks like overkill TBH.
> 
> Full rings do not, but the initialization of that particular ring associated
> with this irq does need to be done.  On my list of things we need to do in
> bnxt_en is implement the new ndo_queue_stop/start and ndo_queue_mem_alloc/free
> operations and once those are done we could make a switch as that may be less
> disruptive.

Hi Andy, I have an implementation of the new ndo_queue_stop/start() API
[1] and would appreciate comments. I've been trying to test it but
without avail due to FW issues.

[1]: https://lore.kernel.org/netdev/20240502045410.3524155-1-dw@davidwei.uk/

> 
>> And yes, affinities can be change on fly according to the changes of the
>> workload on the host.
>>
>>>>
>>>>
>>>>> +}
>>>>> +
>>>>> +static void bnxt_irq_affinity_release(struct kref __always_unused *ref)
>>>>> +{
>>>>> +}
>>>>> +
>>>>> +static inline void __bnxt_register_notify_irqchanges(struct bnxt_irq *irq)
>>>>
>>>> No inlines in .c files, please. Let compiler decide what to inline.
>>>>
>>>>> +{
>>>>> +     struct irq_affinity_notify *notify;
>>>>> +
>>>>> +     notify = &irq->affinity_notify;
>>>>> +     notify->irq = irq->vector;
>>>>> +     notify->notify = bnxt_irq_affinity_notify;
>>>>> +     notify->release = bnxt_irq_affinity_release;
>>>>> +
>>>>> +     irq_set_affinity_notifier(irq->vector, notify);
>>>>> +}
>>>>> +
>>>>>    static int bnxt_request_irq(struct bnxt *bp)
>>>>>    {
>>>>>        int i, j, rc = 0;
>>>>> @@ -10543,6 +10584,7 @@ static int bnxt_request_irq(struct bnxt *bp)
>>>>>                        int numa_node = dev_to_node(&bp->pdev->dev);
>>>>>
>>>>>                        irq->have_cpumask = 1;
>>>>> +                     irq->msix_nr = map_idx;
>>>>>                        cpumask_set_cpu(cpumask_local_spread(i, numa_node),
>>>>>                                        irq->cpu_mask);
>>>>>                        rc = irq_set_affinity_hint(irq->vector, irq->cpu_mask);
>>>>> @@ -10552,6 +10594,15 @@ static int bnxt_request_irq(struct bnxt *bp)
>>>>>                                            irq->vector);
>>>>>                                break;
>>>>>                        }
>>>>> +
>>>>> +                     if (!pcie_tph_set_st(bp->pdev, i,
>>>>> +                                          cpumask_first(irq->cpu_mask),
>>>>> +                                          TPH_MEM_TYPE_VM, PCI_TPH_REQ_TPH_ONLY)) {
>>>>> +                             netdev_err(bp->dev, "error in setting steering tag\n");
>>>>> +                     } else {
>>>>> +                             irq->bp = bp;
>>>>> +                             __bnxt_register_notify_irqchanges(irq);
>>>>> +                     }
>>>>>                }
>>>>>        }
>>>>>        return rc;
>>>>> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
>>>>> index dd849e715c9b..0d3442590bb4 100644
>>>>> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
>>>>> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
>>>>> @@ -1195,6 +1195,10 @@ struct bnxt_irq {
>>>>>        u8              have_cpumask:1;
>>>>>        char            name[IFNAMSIZ + 2];
>>>>>        cpumask_var_t   cpu_mask;
>>>>> +
>>>>> +     int             msix_nr;
>>>>> +     struct bnxt     *bp;
>>>>> +     struct irq_affinity_notify affinity_notify;
>>>>>    };
>>>>>
>>>>>    #define HWRM_RING_ALLOC_TX  0x1
>>>>
>>
