Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8080CCCA479
	for <linux-doc@archiver.kernel.org>; Tue, 28 Jun 2022 14:58:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347097AbiF1O66 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jun 2022 10:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345186AbiF1O6z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 10:58:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CAC452B240
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656428333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wWZyK/uRQKIBLtLS3ewqK6inJf2UuHE+gNb5lfdcjSk=;
        b=BjKZsspFTMWuVxYopKD5kog7BnCpuu0rJVEH6rQuEbbHeCr/+cltOILUQG75smlCqL4I3z
        rQQSMSnIkY35YP7M9jbgIRqSwuBtxXUYQhagWp6RNQoWvdoeLBxyrStAqS1nO73+l0nqpi
        VjQtcvjPRWCvKr8SH8hOh1YQZKXtCaE=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-Z5opMLMnNwqBkExquzvG0g-1; Tue, 28 Jun 2022 10:58:52 -0400
X-MC-Unique: Z5opMLMnNwqBkExquzvG0g-1
Received: by mail-io1-f72.google.com with SMTP id c8-20020a056602334800b0067500ca88aaso6885668ioz.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 07:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=wWZyK/uRQKIBLtLS3ewqK6inJf2UuHE+gNb5lfdcjSk=;
        b=W12GDf3Yq/wCPpbkumpYhaqbYmyLnUlOaBOMaPRG66i5Ag6zfpw80EYXtsJ0q09xtG
         ohjmrp9NjDfJqJmJ8uJHZgjXKbk96TygPN+gJ0TozB9ZqUZSMlaJD1rqzuy/Iixcy00u
         SuJDcXv1abLg9Dh450WIQ1pOLoaIMODM4b2Hbg5Lk0SsXTJQ6BOAdvpqT2QHei+OrGQA
         P2B4iQSfyTINtjgAELnEIYIi6L71JTAdrdR+xjkdAh4hp9//u1n1h+0Zh+6Ko0xv68sR
         XpQOxwJi4gBXHJ2+L/gki9UJ2ChZSnaNfj35xJ6UqW7hEy19jQwUaLtUWgotOW8p/2CG
         lrmQ==
X-Gm-Message-State: AJIora87tb/dvW2m4vOQj5bQZN04lJuexVe8CS4js5os+jAntDK5MazM
        XLJdeTaJfOBk0DqRJVjAjywLktRvgNSwDsq4YVleP1QVpiZUdAkEB9ug4s0phRJLJZ2NG6UG4kC
        M9cW1qzRCrwThQjWBcHp8
X-Received: by 2002:a02:999a:0:b0:339:f344:9f74 with SMTP id a26-20020a02999a000000b00339f3449f74mr10609352jal.43.1656428332053;
        Tue, 28 Jun 2022 07:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uANWXOfsrMsFoE5tiVeWwTUwjkf/3dlb7vOyiE6sRhu1BS85sSjEO6OydCreN5FFFY5yFCYA==
X-Received: by 2002:a02:999a:0:b0:339:f344:9f74 with SMTP id a26-20020a02999a000000b00339f3449f74mr10609338jal.43.1656428331841;
        Tue, 28 Jun 2022 07:58:51 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id y13-20020a056638038d00b00332109dad56sm6082749jap.137.2022.06.28.07.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 07:58:51 -0700 (PDT)
Date:   Tue, 28 Jun 2022 08:58:49 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Matthew Rosato <mjrosato@linux.ibm.com>
Cc:     linux-s390@vger.kernel.org, cohuck@redhat.com,
        schnelle@linux.ibm.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
        borntraeger@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, agordeev@linux.ibm.com,
        svens@linux.ibm.com, frankja@linux.ibm.com, david@redhat.com,
        imbrenda@linux.ibm.com, vneethv@linux.ibm.com,
        oberpar@linux.ibm.com, freude@linux.ibm.com, thuth@redhat.com,
        pasic@linux.ibm.com, pbonzini@redhat.com, corbet@lwn.net,
        jgg@nvidia.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 10/21] vfio/pci: introduce CONFIG_VFIO_PCI_ZDEV_KVM
Message-ID: <20220628085849.1b1e67bd.alex.williamson@redhat.com>
In-Reply-To: <20220606203325.110625-11-mjrosato@linux.ibm.com>
References: <20220606203325.110625-1-mjrosato@linux.ibm.com>
        <20220606203325.110625-11-mjrosato@linux.ibm.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  6 Jun 2022 16:33:14 -0400
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> The current contents of vfio-pci-zdev are today only useful in a KVM
> environment; let's tie everything currently under vfio-pci-zdev to
> this Kconfig statement and require KVM in this case, reducing complexity
> (e.g. symbol lookups).
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  drivers/vfio/pci/Kconfig      | 11 +++++++++++
>  drivers/vfio/pci/Makefile     |  2 +-
>  include/linux/vfio_pci_core.h |  2 +-
>  3 files changed, 13 insertions(+), 2 deletions(-)


Acked-by: Alex Williamson <alex.williamson@redhat.com>


> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index 4da1914425e1..f9d0c908e738 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -44,6 +44,17 @@ config VFIO_PCI_IGD
>  	  To enable Intel IGD assignment through vfio-pci, say Y.
>  endif
>  
> +config VFIO_PCI_ZDEV_KVM
> +	bool "VFIO PCI extensions for s390x KVM passthrough"
> +	depends on S390 && KVM
> +	default y
> +	help
> +	  Support s390x-specific extensions to enable support for enhancements
> +	  to KVM passthrough capabilities, such as interpretive execution of
> +	  zPCI instructions.
> +
> +	  To enable s390x KVM vfio-pci extensions, say Y.
> +
>  source "drivers/vfio/pci/mlx5/Kconfig"
>  
>  source "drivers/vfio/pci/hisilicon/Kconfig"
> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
> index 7052ebd893e0..24c524224da5 100644
> --- a/drivers/vfio/pci/Makefile
> +++ b/drivers/vfio/pci/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
>  vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
> -vfio-pci-core-$(CONFIG_S390) += vfio_pci_zdev.o
> +vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
>  obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
>  
>  vfio-pci-y := vfio_pci.o
> diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> index 23c176d4b073..63af2897939c 100644
> --- a/include/linux/vfio_pci_core.h
> +++ b/include/linux/vfio_pci_core.h
> @@ -206,7 +206,7 @@ static inline int vfio_pci_igd_init(struct vfio_pci_core_device *vdev)
>  }
>  #endif
>  
> -#ifdef CONFIG_S390
> +#ifdef CONFIG_VFIO_PCI_ZDEV_KVM
>  extern int vfio_pci_info_zdev_add_caps(struct vfio_pci_core_device *vdev,
>  				       struct vfio_info_cap *caps);
>  #else

