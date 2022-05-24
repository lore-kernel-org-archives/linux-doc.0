Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA26C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 24 May 2022 22:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242482AbiEXWvA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 May 2022 18:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241404AbiEXWuw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 May 2022 18:50:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 956AC663CC
        for <linux-doc@vger.kernel.org>; Tue, 24 May 2022 15:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653432650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BCd+QNLniNzlF6W7H/ca6kckSQBoa9VguXTAzz3osLE=;
        b=Z7vLg+zV1JtJ9V3YcMKs/fnuwR4PZNKdNO35HkE7SkNZFG46Rf8uc2rEzNFRa3eO5k19Jb
        6bvWpZGRklaNrgfy4Wq4XZftH1qcPduQnXbNP2Z6ISPlD6SoS6wt0jNHQj+h7YxYmiSF8T
        TmkomxbAgetFQpUSqy3Adyjv3jjH4jA=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-pNP2-A4SNYa__UvuxTxVEw-1; Tue, 24 May 2022 18:50:49 -0400
X-MC-Unique: pNP2-A4SNYa__UvuxTxVEw-1
Received: by mail-io1-f70.google.com with SMTP id l3-20020a05660227c300b0065a8c141580so10631964ios.19
        for <linux-doc@vger.kernel.org>; Tue, 24 May 2022 15:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=BCd+QNLniNzlF6W7H/ca6kckSQBoa9VguXTAzz3osLE=;
        b=ApQ4FwHr/ezG3UkN9/UL9raDB6nsVg4M3lm6YsRLAo1slKpStK27jk7F0zdmXOUaAo
         pSnaHmOQDfrUoApmf8ccNvIkXQcjN4HQqZkRpnYWm7AvPjjqSh/PPctq5XGw6RwZe5hA
         sw2Xe7+3pNpk1XKp16eEDzQsVfGvoh+cvpZo+qfI6K1GrU2Ypbgw5P5BS/ph9jGNB1MJ
         G/gQZrD8IsODyGtxaYXXea79U1uZFCw93jObjSplvWGZsGeHP0sfSI0SNm+nST3yBh2n
         1YJ/AUW1rGNtX1VdLSuG3gxp81yrlHi97+mS7CrXCIs6GWldi7nMIy2Yu1pfBDaxhSTw
         Rd3w==
X-Gm-Message-State: AOAM532jkpZucGEHl3OEyB1plDYQDN8f19NO9CVH060ayyTJlLcBkbTQ
        1RHdWXPpYS8Y2sUprJLkuoo4APtg7VIj/yjxWa6JT93hd8Ub2XMj0owY10/7TL1jixrmhA97GWg
        4ITBYDcFhhRmnWb4yptax
X-Received: by 2002:a02:bb19:0:b0:32e:8618:9f92 with SMTP id y25-20020a02bb19000000b0032e86189f92mr14374583jan.320.1653432648748;
        Tue, 24 May 2022 15:50:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznIk1GBgvr8+3XKsMI2OkYQ8lU6GD289skiZVi1Gf2Iw+kqvEFVkFnHIn2gX38ZBn0oWVREQ==
X-Received: by 2002:a02:bb19:0:b0:32e:8618:9f92 with SMTP id y25-20020a02bb19000000b0032e86189f92mr14374574jan.320.1653432648498;
        Tue, 24 May 2022 15:50:48 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id q46-20020a027b2e000000b0032e43cb7344sm3731662jac.146.2022.05.24.15.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 15:50:48 -0700 (PDT)
Date:   Tue, 24 May 2022 16:50:46 -0600
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
Subject: Re: [PATCH v8 11/22] KVM: s390: pci: add basic kvm_zdev structure
Message-ID: <20220524165046.69f0d84a.alex.williamson@redhat.com>
In-Reply-To: <20220524185907.140285-12-mjrosato@linux.ibm.com>
References: <20220524185907.140285-1-mjrosato@linux.ibm.com>
        <20220524185907.140285-12-mjrosato@linux.ibm.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 24 May 2022 14:58:56 -0400
Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> diff --git a/arch/s390/kvm/pci.c b/arch/s390/kvm/pci.c
> new file mode 100644
> index 000000000000..21c2be5c2713
> --- /dev/null
> +++ b/arch/s390/kvm/pci.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * s390 kvm PCI passthrough support
> + *
> + * Copyright IBM Corp. 2022
> + *
> + *    Author(s): Matthew Rosato <mjrosato@linux.ibm.com>
> + */
> +
> +#include <linux/kvm_host.h>
> +#include <linux/pci.h>
> +#include "pci.h"
> +
> +static int kvm_s390_pci_dev_open(struct zpci_dev *zdev)
> +{
> +	struct kvm_zdev *kzdev;
> +
> +	kzdev = kzalloc(sizeof(struct kvm_zdev), GFP_KERNEL);
> +	if (!kzdev)
> +		return -ENOMEM;
> +
> +	kzdev->zdev = zdev;
> +	zdev->kzdev = kzdev;
> +
> +	return 0;
> +}
> +
> +static void kvm_s390_pci_dev_release(struct zpci_dev *zdev)
> +{
> +	struct kvm_zdev *kzdev;
> +
> +	kzdev = zdev->kzdev;
> +	WARN_ON(kzdev->zdev != zdev);
> +	zdev->kzdev = 0;

I imagine this should be s/0/NULL/, right?  I feel like there was a
recent similar discussion, but I can't think of any unique search terms
to sort it out of my inbox.  Thanks,

Alex

