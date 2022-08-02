Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8823BC19F29
	for <linux-doc@archiver.kernel.org>; Tue,  2 Aug 2022 09:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbiHBJY1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Aug 2022 05:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbiHBJY0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Aug 2022 05:24:26 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B2A32EEA
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 02:24:24 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t1so21071412lft.8
        for <linux-doc@vger.kernel.org>; Tue, 02 Aug 2022 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=1n1ZKC51PL7oA8qvseMiLtJyJ6uxOwh3lLvNachyl1g=;
        b=SkPaGq8iz1oHc+v7esobJprt9PJgk67NAJHJdsKvxA4Kb40e4boROTAcUc2xJkDOtP
         feiZ4DFggiNTTdytEx5RqfqnF9zoj0Ovv/NDSwuP+Qt0gSOM4kTxBz9LaBBmjh3gYcI8
         om5PBZP8AbVCWg0xSi5ruxNf2iyyRdZ6CY6rsQhR1zD0h/wCidH1BKH47KOcQMNSiZ1N
         PDGarGTsjYrWojQ6gq85qllU6HPIBbbsDHui241G6b21VvTZmfSgB3jGRCj7C0tgt98M
         VyA5lbHDlWTfKlqOFAmu36bhGTfFSSzXVtOIqwgMAJG6jd9t9YyBW54hF1K3wE0OYD3g
         ZvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1n1ZKC51PL7oA8qvseMiLtJyJ6uxOwh3lLvNachyl1g=;
        b=Myys9/6PGpT9Vy5XU9Vakxx+Cy2l4RJhyMhpIwlTZ/EurcKQuK0YA/1FnCHcdeBtaN
         VYlgcUgVUVxP3VI8IuMmx7nrusMlVjUJffDQxNN/QCUgRKlQxgZPho1hs+obsPiGBwaT
         MU4+dIikAL/Rwrc1JNJGiRHGbPZ/sA+E5RZykRTg8uD2rzY6TJICJyzsjpdDKFfKul58
         d6cJFRuwC3PDd3BOeX9ls2LUHTgCc8vZoe032KRk+DbJ4e2xA55GCXuOPtBDUf3EaCR9
         djqy/1eW+qdobh1yYWM0GZ0p0IB1/7QViiWBF5fTgvBecEBsq8g+9AP7hiMfsPWXvb0v
         Ki2g==
X-Gm-Message-State: AJIora/+YzdiiUdJJ5dp6r6/nQoHMYWsek6M4czJCNgGZOrafSiz6woW
        n4+ZC8sslpWW/k5UWuEKBnNMFw==
X-Google-Smtp-Source: AGRyM1uBK8mjLp2Dc3a0wZ5cXTLENaz5MzrxfwZV1SGtxG45Quj5zu+tMF8YQMQoSC9KIbWP1jib7Q==
X-Received: by 2002:a19:f004:0:b0:48a:bf41:1e70 with SMTP id p4-20020a19f004000000b0048abf411e70mr6530388lfc.342.1659432263152;
        Tue, 02 Aug 2022 02:24:23 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z13-20020a2eb52d000000b0025dc0adf38csm119052ljm.61.2022.08.02.02.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 02:24:22 -0700 (PDT)
Message-ID: <50230652-c1ae-4ce2-907c-9bdc6b827f8e@linaro.org>
Date:   Tue, 2 Aug 2022 12:24:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 00/11] Drivers for gunyah hypervisor
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220801211240.597859-1-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/08/2022 00:12, Elliot Berman wrote:
> Gunyah is a Type-1 hypervisor independent of any
> high-level OS kernel, and runs in a higher CPU privilege level. It does
> not depend on any lower-privileged OS kernel/code for its core
> functionality. This increases its security and can support a much smaller
> trusted computing base than a Type-2 hypervisor.
> 
> Gunyah is an open source hypervisor. The source repo is available at
> https://github.com/quic/gunyah-hypervisor.
> 
> The diagram below shows the architecture.
> 
> ::
> 
>          Primary VM           Secondary VMs

Is there any significant difference between Primary VM and other VMs?

>       +-----+ +-----+  | +-----+ +-----+ +-----+
>       |     | |     |  | |     | |     | |     |
>   EL0 | APP | | APP |  | | APP | | APP | | APP |
>       |     | |     |  | |     | |     | |     |
>       +-----+ +-----+  | +-----+ +-----+ +-----+
>   ---------------------|-------------------------
>       +--------------+ | +----------------------+
>       |              | | |                      |
>   EL1 | Linux Kernel | | |Linux kernel/Other OS |   ...
>       |              | | |                      |
>       +--------------+ | +----------------------+
>   --------hvc/smc------|------hvc/smc------------
>       +----------------------------------------+
>       |                                        |
>   EL2 |            Gunyah Hypervisor           |
>       |                                        |
>       +----------------------------------------+
> 
> Gunyah provides these following features.
> 
> - Threads and Scheduling: The scheduler schedules virtual CPUs (VCPUs) on
> physical CPUs and enables time-sharing of the CPUs.

Is the scheduling provided behind the back of the OS or does it require 
cooperation?

> - Memory Management: Gunyah tracks memory ownership and use of all memory
> under its control. Memory partitioning between VMs is a fundamental
> security feature.
> - Interrupt Virtualization: All interrupts are handled in the hypervisor
> and routed to the assigned VM.
> - Inter-VM Communication: There are several different mechanisms provided
> for communicating between VMs.
> - Device Virtualization: Para-virtualization of devices is supported using
> inter-VM communication. Low level system features and devices such as
> interrupt controllers are supported with emulation where required.

After reviewing some of the patches from the series, I'd like to 
understand, what does it provide (and can be provided) to the VMs.

I'd like to understand it first, before going deep into the API issues.

1) The hypervisor provides message queues, doorbells and vCPUs

Each of resources has it's own capability ID.
Why is it called capability? Is it just a misname for the resource ID, 
or has it any other meaning behind? If it is a capability, who is 
capable of what?

At this moment you create allocate two message queues with fixed IDs for 
communication with resource manager. Then you use these message queues 
to organize a console and a pack of tty devices.

What other kinds of services does RM provide to the guest OS?
Do you expect any other drivers to be calling into the RM?

What is the usecase for the doorbells? Who provides doorbells?

You mentioned that the RM generates DT overlays. What kind of 
information goes to the overlay?

My current impression of this series is that you have misused the 
concept of devices. Rather than exporting MSGQs and BELLs as 
gunyah_devices and then using them from other drivers, I'd suggest 
turning them into resources provided by the gunyah driver core. I 
mentioned using the mailbox API for this. Another subsystem that might 
ring the bell for you is the remoteproc, especially the rproc_subdev.

I might be completely wrong about this, but if my in-mind picture of 
Gunyah is correct, I'd have implemented the gunyah core subsytem as 
mailbox provider, RM as a separate platform driver consuming these 
mailboxes and in turn being a remoteproc driver, and consoles as 
remoteproc subdevices.

I can assume that at some point you would like to use Gunyah to boot 
secondary VMs from the primary VM by calling into RM, etc.
Most probably at this moment a VM would be allocated other bells, 
message queues, etc. If this assumption is correct, them the VM can 
become a separate device (remoteproc?) in the Linux device tree.

I might be wrong in any of the assumptions above. Please feel free to 
correct me. We can then think about a better API for your usecase.

-- 
With best wishes
Dmitry
