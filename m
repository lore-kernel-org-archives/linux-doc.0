Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B43317DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 May 2018 05:20:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750927AbeEKFUZ convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 May 2018 01:20:25 -0400
Received: from ozlabs.org ([203.11.71.1]:44275 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750758AbeEKFUY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 May 2018 01:20:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.org (Postfix) with ESMTPSA id 40hz1y2F0fz9s0y;
        Fri, 11 May 2018 15:20:22 +1000 (AEST)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Alastair D'Silva <alastair@au1.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Cc:     mikey@neuling.org, arnd@arndb.de, linux-doc@vger.kernel.org,
        malat@debian.org, gregkh@linuxfoundation.org, corbet@lwn.net,
        vaibhav@linux.vnet.ibm.com, npiggin@gmail.com,
        linux-kernel@vger.kernel.org, fbarrat@linux.vnet.ibm.com,
        aneesh.kumar@linux.vnet.ibm.com, andrew.donnellan@au1.ibm.com,
        pombredanne@nexb.com, felix@linux.vnet.ibm.com,
        sukadev@linux.vnet.ibm.com, Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH v4 6/7] ocxl: Add an IOCTL so userspace knows what OCXL features are available
In-Reply-To: <20180509053506.9754-7-alastair@au1.ibm.com>
References: <20180509004212.4506-1-alastair@au1.ibm.com> <20180509053506.9754-1-alastair@au1.ibm.com> <20180509053506.9754-7-alastair@au1.ibm.com>
Date:   Fri, 11 May 2018 15:20:21 +1000
Message-ID: <871seisr8q.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Alastair D'Silva" <alastair@au1.ibm.com> writes:

> diff --git a/include/uapi/misc/ocxl.h b/include/uapi/misc/ocxl.h
> index 8d2748e69c84..bb80f294b429 100644
> --- a/include/uapi/misc/ocxl.h
> +++ b/include/uapi/misc/ocxl.h
> @@ -72,5 +75,6 @@ struct ocxl_ioctl_irq_fd {
>  #define OCXL_IOCTL_IRQ_SET_FD	_IOW(OCXL_MAGIC, 0x13, struct ocxl_ioctl_irq_fd)
>  #define OCXL_IOCTL_GET_METADATA _IOR(OCXL_MAGIC, 0x14, struct ocxl_ioctl_metadata)
>  #define OCXL_IOCTL_ENABLE_P9_WAIT	_IOR(OCXL_MAGIC, 0x15, struct ocxl_ioctl_p9_wait)
> +#define OCXL_IOCTL_GET_FEATURES _IOR(OCXL_MAGIC, 0x16, struct ocxl_ioctl_platform)

I don't have ocxl_ioctl_platform ?

../include/uapi/misc/ocxl.h:78:56: error: invalid application of ‘sizeof’ to incomplete type ‘struct ocxl_ioctl_platform’
 #define OCXL_IOCTL_GET_FEATURES _IOR(OCXL_MAGIC, 0x16, struct ocxl_ioctl_platform)
                                                        ^
../include/uapi/asm-generic/ioctl.h:73:5: note: in definition of macro ‘_IOC’
   ((size) << _IOC_SIZESHIFT))
     ^~~~
../include/uapi/asm-generic/ioctl.h:86:56: note: in expansion of macro ‘_IOC_TYPECHECK’
 #define _IOR(type,nr,size) _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(size)))
                                                        ^~~~~~~~~~~~~~
../include/uapi/misc/ocxl.h:78:33: note: in expansion of macro ‘_IOR’
 #define OCXL_IOCTL_GET_FEATURES _IOR(OCXL_MAGIC, 0x16, struct ocxl_ioctl_platform)
                                 ^~~~
../drivers/misc/ocxl/file.c:262:7: note: in expansion of macro ‘OCXL_IOCTL_GET_FEATURES’
  case OCXL_IOCTL_GET_FEATURES:
       ^~~~~~~~~~~~~~~~~~~~~~~

cheers
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
