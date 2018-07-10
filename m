Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 512597D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Jul 2018 21:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732205AbeGJVRy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Jul 2018 17:17:54 -0400
Received: from ms.lwn.net ([45.79.88.28]:35478 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732187AbeGJVRy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Jul 2018 17:17:54 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 25B967DA;
        Tue, 10 Jul 2018 21:16:59 +0000 (UTC)
Date:   Tue, 10 Jul 2018 15:16:56 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Prashant Dhamdhere <pdhamdhe@redhat.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: proc.txt: Adding 'HardwareCorrupted'
 parameter and description.
Message-ID: <20180710151656.5ecaae11@lwn.net>
In-Reply-To: <CAF1GLkkzSzUnGKprz9CroVv=xBoUaym53PUTgi1RDNiEmr6PWw@mail.gmail.com>
References: <CAF1GLkkzSzUnGKprz9CroVv=xBoUaym53PUTgi1RDNiEmr6PWw@mail.gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 10 Jul 2018 20:05:22 +0530
Prashant Dhamdhere <pdhamdhe@redhat.com> wrote:

> ​Signed-off-by: Prashant Dhamdhere <pdhamdhe@redhat.com>
> ---
>  Documentation/filesystems/proc.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/filesystems/proc.txt
> b/Documentation/filesystems/proc.txt
> index 520f6a84cf50..b2fa7e7c4300 100644
> --- a/Documentation/filesystems/proc.txt
> +++ b/Documentation/filesystems/proc.txt
> @@ -870,6 +870,7 @@ Committed_AS:   100056 kB
>  VmallocTotal:   112216 kB
>  VmallocUsed:       428 kB
>  VmallocChunk:   111088 kB
> +HardwareCorrupted:   0 kB
>  AnonHugePages:   49152 kB
>  ShmemHugePages:      0 kB
>  ShmemPmdMapped:      0 kB
> @@ -915,6 +916,8 @@ MemAvailable: An estimate of how much memory is
> available for starting new

This patch, too, was corrupted by your mailer.  Please resubmit it after
fixing the issue (and with a changelog, please).

Thanks,

jon

>         Dirty: Memory which is waiting to get written back to the disk
>     Writeback: Memory which is actively being written back to the disk
>     AnonPages: Non-file backed pages mapped into userspace page tables
> +HardwareCorrupted: The amount of RAM/memory in KB, the kernel identified as
> +              corrupted.
>  AnonHugePages: Non-file backed huge pages mapped into userspace page tables
>        Mapped: files which have been mmaped, such as libraries
>         Shmem: Total memory used by shared memory (shmem) and tmpfs

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
