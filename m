Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3609B7DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 May 2018 05:01:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752083AbeEKFBp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 May 2018 01:01:45 -0400
Received: from ozlabs.org ([203.11.71.1]:53291 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751992AbeEKFBo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 May 2018 01:01:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.org (Postfix) with ESMTPSA id 40hycQ0htDz9s19;
        Fri, 11 May 2018 15:01:42 +1000 (AEST)
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
Subject: Re: [PATCH v3 5/7] ocxl: Expose the thread_id needed for wait on POWER9
In-Reply-To: <20180509004212.4506-6-alastair@au1.ibm.com>
References: <20180417020950.21446-1-alastair@au1.ibm.com> <20180509004212.4506-1-alastair@au1.ibm.com> <20180509004212.4506-6-alastair@au1.ibm.com>
Date:   Fri, 11 May 2018 15:01:35 +1000
Message-ID: <877eoass40.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Alastair D'Silva" <alastair@au1.ibm.com> writes:
> diff --git a/include/uapi/misc/ocxl.h b/include/uapi/misc/ocxl.h
> index 0af83d80fb3e..8d2748e69c84 100644
> --- a/include/uapi/misc/ocxl.h
> +++ b/include/uapi/misc/ocxl.h
> @@ -48,6 +48,15 @@ struct ocxl_ioctl_metadata {
>  	__u64 reserved[13]; // Total of 16*u64
>  };
>  
> +struct ocxl_ioctl_p9_wait {
> +	__u16 thread_id; // The thread ID required to wake this thread
> +	__u16 reserved1;
> +	__u32 reserved2;
> +	__u64 reserved3[3];
> +};
> +
> +};
> +

O_o

???

cheers
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
