Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A51FC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 28 Jun 2022 11:54:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345063AbiF1LyA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jun 2022 07:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236568AbiF1Lx6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 07:53:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C9D1E3120D
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 04:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656417236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9DZIBhwK0nu+d+e5Dn67t8pp9MEtfy3sJMXiRir3HYs=;
        b=LNu9OM9cAYgxrfyZeRwLmHBS7TAL0IaUoHUvTrzQ2mE1PK/LeF3yJx2YR+vIcXkeIwejV/
        ENAnqxoT2xF+d9rBpu46AxwrezwYDpLgAgh6duPHXQUMf36T2LZw2+XmOcnLANfqi/j07p
        cXDROtm2cLFqP4OB3XaRwbC+/pvfrjo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-ynPXkxaCN7SUAH8WkKdh9A-1; Tue, 28 Jun 2022 07:53:55 -0400
X-MC-Unique: ynPXkxaCN7SUAH8WkKdh9A-1
Received: by mail-qv1-f72.google.com with SMTP id 10-20020a0562140cca00b004702e8ce21bso12110785qvx.22
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 04:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9DZIBhwK0nu+d+e5Dn67t8pp9MEtfy3sJMXiRir3HYs=;
        b=nAJL72Kp30saHavZVnsPU3ACoso9o1GzVHWlCYyw8z1jppDRFLLhUW5qhvaxycG2Gd
         orQjIXIRyDxvgfNYV82v0l+1Cs/9Azjjz/iXACBctfKCffAfntMD6ybybcthS/tNo8ia
         URBoohkxSg4RHDb115Hze2xJ5MntE+0OODca4BrPBUKVsxCfCzu2hKY0PHe+Vi723Dx/
         7nbd5RSRSwr5c5V8cztOBAW6wJBH8pvcNT7clzGCtlvh4dK2XVTlJNU6u8UvOhoppB7T
         LVeVQ5QBtEoWjt4CxEN4elkpuIkTmzCGRz4n5TxvEDfkoENy6LhEfvqb209vqas727nl
         XxBQ==
X-Gm-Message-State: AJIora8mhXbl0LGXd+S5+gYAn98ijmfhOOqzriu1tgpRsoGjfGsOKN7E
        lLxjSWGgdJ6Yjh0dR1K/6J+NvyDBvgYuMRmiJT2T3kJ1GnpG1EukoqSK8fLF9bsjl9fNJQDNIgJ
        x5Sh7sDQbrh0cjReRN0ha
X-Received: by 2002:a37:a9d0:0:b0:6af:1ba4:c3e5 with SMTP id s199-20020a37a9d0000000b006af1ba4c3e5mr8500852qke.167.1656417234892;
        Tue, 28 Jun 2022 04:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tsML0jjLfuArn0V98uqgHi7yCfymN14awwvePjx5qt4Ac2aBE1EXWTFaiUYpN07axMfRvatg==
X-Received: by 2002:a37:a9d0:0:b0:6af:1ba4:c3e5 with SMTP id s199-20020a37a9d0000000b006af1ba4c3e5mr8500833qke.167.1656417234666;
        Tue, 28 Jun 2022 04:53:54 -0700 (PDT)
Received: from bfoster (c-24-61-119-116.hsd1.ma.comcast.net. [24.61.119.116])
        by smtp.gmail.com with ESMTPSA id bw20-20020a05622a099400b00304bc2acc25sm8851128qtb.6.2022.06.28.04.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:53:54 -0700 (PDT)
Date:   Tue, 28 Jun 2022 07:53:51 -0400
From:   Brian Foster <bfoster@redhat.com>
To:     Kalesh Singh <kaleshsingh@google.com>
Cc:     ckoenig.leichtzumerken@gmail.com, christian.koenig@amd.com,
        viro@zeniv.linux.org.uk, hch@infradead.org,
        stephen.s.brennan@oracle.com, David.Laight@aculab.com,
        ilkos@google.com, tjmercier@google.com, surenb@google.com,
        kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Mike Rapoport <rppt@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 1/2] procfs: Add 'size' to /proc/<pid>/fdinfo/
Message-ID: <Yrrrz7MxMu8OoEPU@bfoster>
References: <20220623220613.3014268-1-kaleshsingh@google.com>
 <20220623220613.3014268-2-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220623220613.3014268-2-kaleshsingh@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 23, 2022 at 03:06:06PM -0700, Kalesh Singh wrote:
> To be able to account the amount of memory a process is keeping pinned
> by open file descriptors add a 'size' field to fdinfo output.
> 
> dmabufs fds already expose a 'size' field for this reason, remove this
> and make it a common field for all fds. This allows tracking of
> other types of memory (e.g. memfd and ashmem in Android).
> 
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
> 
> Changes in v2:
>   - Add Christian's Reviewed-by
> 
> Changes from rfc:
>   - Split adding 'size' and 'path' into a separate patches, per Christian
>   - Split fdinfo seq_printf into separate lines, per Christian
>   - Fix indentation (use tabs) in documentaion, per Randy
> 
>  Documentation/filesystems/proc.rst | 12 ++++++++++--
>  drivers/dma-buf/dma-buf.c          |  1 -
>  fs/proc/fd.c                       |  9 +++++----
>  3 files changed, 15 insertions(+), 7 deletions(-)
> 
...
> diff --git a/fs/proc/fd.c b/fs/proc/fd.c
> index 913bef0d2a36..464bc3f55759 100644
> --- a/fs/proc/fd.c
> +++ b/fs/proc/fd.c
> @@ -54,10 +54,11 @@ static int seq_show(struct seq_file *m, void *v)
>  	if (ret)
>  		return ret;
>  
> -	seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\nino:\t%lu\n",
> -		   (long long)file->f_pos, f_flags,
> -		   real_mount(file->f_path.mnt)->mnt_id,
> -		   file_inode(file)->i_ino);
> +	seq_printf(m, "pos:\t%lli\n", (long long)file->f_pos);
> +	seq_printf(m, "flags:\t0%o\n", f_flags);
> +	seq_printf(m, "mnt_id:\t%i\n", real_mount(file->f_path.mnt)->mnt_id);
> +	seq_printf(m, "ino:\t%lu\n", file_inode(file)->i_ino);
> +	seq_printf(m, "size:\t%lli\n", (long long)file_inode(file)->i_size);

Hi Kalesh,

Any reason not to use i_size_read() here?

Also not sure if it matters that much for your use case, but something
worth noting at least with shmem is that one can do something like:

# cat /proc/meminfo | grep Shmem:
Shmem:               764 kB
# xfs_io -fc "falloc -k 0 10m" ./file
# ls -alh file 
-rw-------. 1 root root 0 Jun 28 07:22 file
# stat file 
  File: file
  Size: 0               Blocks: 20480      IO Block: 4096   regular empty file
# cat /proc/meminfo | grep Shmem:
Shmem:             11004 kB

... where the resulting memory usage isn't reflected in i_size (but is
is in i_blocks/bytes).

Brian

>  
>  	/* show_fd_locks() never deferences files so a stale value is safe */
>  	show_fd_locks(m, file, files);
> -- 
> 2.37.0.rc0.161.g10f37bed90-goog
> 

