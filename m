Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AF3CF7DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 07:53:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751660AbeEGHxK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 03:53:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55384 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751042AbeEGHxK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 03:53:10 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A8CFDF7FA2;
        Mon,  7 May 2018 07:53:09 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A992C111F3B6;
        Mon,  7 May 2018 07:53:06 +0000 (UTC)
Date:   Mon, 7 May 2018 09:53:03 +0200
From:   Cornelia Huck <cohuck@redhat.com>
To:     "dongbo (E)" <dongbo4@huawei.com>
Cc:     <alex.williamson@redhat.com>, <corbet@lwn.net>,
        <kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] vfio: fix documentation
Message-ID: <20180507095303.450aef9b.cohuck@redhat.com>
In-Reply-To: <eacddc78-279c-abe8-e663-9849973dd6a3@huawei.com>
References: <eacddc78-279c-abe8-e663-9849973dd6a3@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Mon, 07 May 2018 07:53:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Mon, 07 May 2018 07:53:09 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 7 May 2018 11:02:10 +0800
"dongbo (E)" <dongbo4@huawei.com> wrote:

> From: Dong Bo <dongbo4@huawei.com>
> 
> Update vfio_add_group_dev description to match the current API.
> 
> Signed-off-by: Dong Bo <dongbo4@huawei.com>
> ---
>  Documentation/vfio.txt | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/vfio.txt b/Documentation/vfio.txt
> index ef6a511..f1a4d3c 100644
> --- a/Documentation/vfio.txt
> +++ b/Documentation/vfio.txt
> @@ -252,15 +252,14 @@ into VFIO core.  When devices are bound and unbound to the driver,
>  the driver should call vfio_add_group_dev() and vfio_del_group_dev()
>  respectively::
> 
> -	extern int vfio_add_group_dev(struct iommu_group *iommu_group,
> -	                              struct device *dev,
> +	extern int vfio_add_group_dev(struct device *dev,
>  				      const struct vfio_device_ops *ops,
>  				      void *device_data);
> 
>  	extern void *vfio_del_group_dev(struct device *dev);
> 
>  vfio_add_group_dev() indicates to the core to begin tracking the
> -specified iommu_group and register the specified dev as owned by
> +iommu_group of the specified dev and register the dev as owned by
>  a VFIO bus driver.  The driver provides an ops structure for callbacks
>  similar to a file operations structure::
> 

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
