Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED97C4320A
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 16:34:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A4BA61B24
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 16:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhG0QeZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jul 2021 12:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25741 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229569AbhG0QeZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 12:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627403664;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eSN3zUa+aSMFbTfiTDoY4ts+MsujN4ZIL3irtZSd5cc=;
        b=D1XjgNSvzxja2cmLdIWKgjEofGAQfrKLNKIy/L3f9rrWrXHN6gah7WYIEt19O0MV/YRxnf
        Euuf81S6uwP7b6A7YObKSmaffMsBbdsR31INQ9PM3IA7pQQpOHHkmNDz2nZEsuM5f56T/T
        3eVJ5Xwjxi2NpWxX2EX11veVItHBLtQ=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-zNy7GUw2O4CWR3ykWjFWCg-1; Tue, 27 Jul 2021 12:34:23 -0400
X-MC-Unique: zNy7GUw2O4CWR3ykWjFWCg-1
Received: by mail-io1-f70.google.com with SMTP id q137-20020a6b8e8f0000b02904bd1794d00eso11506579iod.7
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 09:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=eSN3zUa+aSMFbTfiTDoY4ts+MsujN4ZIL3irtZSd5cc=;
        b=Oy0hy/MjQkJRh2jwbyNOOfJAUTFN5g3N/qRVwo5/1azDA7aNjebozp0FExXcMfT4RK
         pcTqaackX+uVTb1afLL8olP8EWt758xcv1uidx2s7IOX0Mem+ddOFviqqTGUMGS7TJoe
         NviaRMpbZ+tHfmvgnjq9P9oCx/GaTbUjrXKj49e0SSvnRiXg/qM1X5VZ9r51cNZ6RTHr
         u15IQw8YI9dOBJULSuTvkb5nQsOdxRECNvOWWi/Sh2I7/f3TwxqsRyCKt4fkyhe+xKL+
         CPT0LGjbkLXH/7Fe95DPYOdo9uqRegwnCUqmsml3vchhKHl67l/pj3wxdcuryPZmvJ7r
         GmHg==
X-Gm-Message-State: AOAM533qB2y7SbAAOfCLftd7kkzHmrkzzFtTKjyEBL0C2pkRp7plbaLW
        3qnSEH4dvt0FUnrH9Ac/a8c53ngCFUb8j7q43hsJRS8kpnL9IkBChP3rQsdh5D8BA8DoX1CwciL
        Ns4kqKopYvhYpvmDjNOnp
X-Received: by 2002:a5d:878d:: with SMTP id f13mr5846927ion.83.1627403662593;
        Tue, 27 Jul 2021 09:34:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNDLuiJUlkwcG5wDeSXc83uop3QQ8klnj9cewIBJA3vjAmH06hqKaz8ZuEyt2S7VEnZ31d5w==
X-Received: by 2002:a5d:878d:: with SMTP id f13mr5846896ion.83.1627403662311;
        Tue, 27 Jul 2021 09:34:22 -0700 (PDT)
Received: from redhat.com ([198.49.6.230])
        by smtp.gmail.com with ESMTPSA id f7sm2156386ils.42.2021.07.27.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 09:34:21 -0700 (PDT)
Date:   Tue, 27 Jul 2021 10:34:18 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Yishai Hadas <yishaih@nvidia.com>
Cc:     <bhelgaas@google.com>, <corbet@lwn.net>,
        <diana.craciun@oss.nxp.com>, <kwankhede@nvidia.com>,
        <eric.auger@redhat.com>, <masahiroy@kernel.org>,
        <michal.lkml@markovi.net>, <linux-pci@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <linux-s390@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
        <mgurtovoy@nvidia.com>, <jgg@nvidia.com>, <maorg@nvidia.com>,
        <leonro@nvidia.com>
Subject: Re: [PATCH 09/12] PCI: Add a PCI_ID_F_VFIO_DRIVER_OVERRIDE flag to
 struct pci_device_id
Message-ID: <20210727103418.2d059863.alex.williamson@redhat.com>
In-Reply-To: <20210721161609.68223-10-yishaih@nvidia.com>
References: <20210721161609.68223-1-yishaih@nvidia.com>
        <20210721161609.68223-10-yishaih@nvidia.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 21 Jul 2021 19:16:06 +0300
Yishai Hadas <yishaih@nvidia.com> wrote:

> From: Max Gurtovoy <mgurtovoy@nvidia.com>
> 
> The new flag field is be used to allow PCI drivers to signal the core code
> during driver matching and when generating the modules.alias information.
> 
> The first use will be to define a VFIO flag that indicates the PCI driver
> is a VFIO driver.
> 
> VFIO drivers have a few special properties compared to normal PCI drivers:
>  - They do not automatically bind. VFIO drivers are used to swap out the
>    normal driver for a device and convert the PCI device to the VFIO
>    subsystem.
> 
>    The admin must make this choice and following the current uAPI this is
>    usually done by using the driver_override sysfs.
> 
>  - The modules.alias includes the IDs of the VFIO PCI drivers, prefixing
>    them with 'vfio_pci:' instead of the normal 'pci:'.
> 
>    This allows the userspace machinery that switches devices to VFIO to
>    know what kernel drivers support what devices and allows it to trigger
>    the proper device_override.
> 
> As existing tools do not recognize the "vfio_pci:" mod-alias prefix this
> keeps todays behavior the same. VFIO remains on the side, is never
> autoloaded and can only be activated by direct admin action.
> 
> This patch is the infrastructure to provide the information in the
> modules.alias to userspace and enable the only PCI VFIO driver. Later
> series introduce additional HW specific VFIO PCI drivers.

I don't really understand why we're combining the above "special
properties" into a single flag.  For instance, why wouldn't we create a
flag that just indicates a match entry is only for driver override?  Or
if we're only using this for full wildcard matches, we could detect
that even without a flag.

Then, how does the "vfio_pci:" alias extend to other drivers?  Is this
expected to be the only driver that would use an alias ever or would
other drivers use new bits of the flag?  Seems some documentation is
necessary; the comment on PCI_DRIVER_OVERRIDE_DEVICE_VFIO doesn't
really help, "This macro is used to create a struct pci_device_id that
matches a specific device", then we proceed to use it with PCI_ANY_ID.

vfio-pci has always tried (as much as possible) to be "just another
PCI" driver to avoid all the nasty issues that used to exist with
legacy KVM device assignment, so I cringe at seeing these vfio specific
hooks in PCI-core.  Thanks,

Alex

