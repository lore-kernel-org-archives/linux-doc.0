Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB12C7618B
	for <linux-doc@archiver.kernel.org>; Mon, 13 Mar 2023 16:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjCMQ0I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Mar 2023 12:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjCMQ0H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Mar 2023 12:26:07 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05952DE41
        for <linux-doc@vger.kernel.org>; Mon, 13 Mar 2023 09:26:05 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id op8so8532897qvb.11
        for <linux-doc@vger.kernel.org>; Mon, 13 Mar 2023 09:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112; t=1678724765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySLTlGrwz6oW+f8sFlLSgS6OiFk6jTO/4mJGRVwuTkU=;
        b=xAMIUDJFE3jM819ZTUErzGnW1a312jSUlvICyJX2o9vTCwqnhtx2ygELjCRyVf+XiC
         Rw3JKEQL3nTidz1EvLc1vMwJ0V/l8gF/O0kURWSMpygu+eI2SKLGgaLaGL+nklo5oVB9
         QScThBxuFtijKa9Xbf8EJtIISiw7AdM7ZI1jUTpl/TjtShKgN8NEYiBXDOBQqViXCUgK
         FfCYKa0tLSYU3LshWYlaIQDUHB8OAc2dzQd4x9tB/W2P6i0xGB8KM8B/YAXe+EsE4qKT
         VI82vrv5r/HJvY2x37Qdfwz/4wflQgkUlY6RUcivF50fg6IfbiA3dCuxmKXm1Hdsz4zf
         kTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678724765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySLTlGrwz6oW+f8sFlLSgS6OiFk6jTO/4mJGRVwuTkU=;
        b=UldpIoc5k29s2BZRk8aPnPUDikh/OFfgo1muQ3bSbFucpP7V59teYVE7PcKnYjookQ
         6PTAC7qzDmiQ74UkS8pET2kD7Qqp6o8LxR6VG8QCMAESp9I0IH8uxOp572zuaRwSOhUb
         o32r2QMZMa33IAEj5jJsFHjv8RBCyQPvfxDXNLLTk2Wx9I4a0qjRdFP58Qww63eUOd8U
         UTrA0bgSg9AgRENZ2YOp+Nt8QNRea+o1Fl3yRhrLfGIZdTrZ54viVULpAC5Cnw8zjhKf
         mEc90nY10ypVkksC3k6U7yXwq287Jx1ISNEh6sNPe9GK7qzZXPRtTT7Su0v+S1cRUXag
         f+Nw==
X-Gm-Message-State: AO0yUKUPPTYiPuPYu/XObFneHGjo0Nv5pV7XKOafUKzrRr5t983CrLE0
        gnMy0lUtiG4Q+VM7Wif31ObKqw==
X-Google-Smtp-Source: AK7set+HTJLvv62hY5uBNZqcsnd89WiHsgwusCnYu6ISinhxqnJaDD8TylUxF7V9gCMfZ6kLymlK+g==
X-Received: by 2002:a05:6214:2464:b0:56e:a918:a4ed with SMTP id im4-20020a056214246400b0056ea918a4edmr14771754qvb.1.1678724764783;
        Mon, 13 Mar 2023 09:26:04 -0700 (PDT)
Received: from localhost ([2620:10d:c091:400::5:d32c])
        by smtp.gmail.com with ESMTPSA id n188-20020a37bdc5000000b007456b2759efsm21679qkf.28.2023.03.13.09.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:26:04 -0700 (PDT)
Date:   Mon, 13 Mar 2023 12:26:03 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Stefan Roesch <shr@devkernel.io>
Cc:     kernel-team@fb.com, linux-mm@kvack.org, riel@surriel.com,
        mhocko@suse.com, david@redhat.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, akpm@linux-foundation.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v4 1/3] mm: add new api to enable ksm per process
Message-ID: <20230313162603.GA965640@cmpxchg.org>
References: <20230310182851.2579138-1-shr@devkernel.io>
 <20230310182851.2579138-2-shr@devkernel.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310182851.2579138-2-shr@devkernel.io>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 10, 2023 at 10:28:49AM -0800, Stefan Roesch wrote:
> @@ -534,16 +534,58 @@ static int break_ksm(struct vm_area_struct *vma, unsigned long addr,
>  	return (ret & VM_FAULT_OOM) ? -ENOMEM : 0;
>  }
>  
> +static bool vma_ksm_compatible(struct vm_area_struct *vma)
> +{
> +	/*
> +	 * Be somewhat over-protective for now!
> +	 */
> +	if (vma->vm_flags & (VM_MERGEABLE | VM_SHARED  | VM_MAYSHARE   |
> +			     VM_PFNMAP    | VM_IO      | VM_DONTEXPAND |
> +			     VM_HUGETLB | VM_MIXEDMAP))
> +		return false;		/* just ignore the advice */
> +
> +	if (vma_is_dax(vma))
> +		return false;
> +
> +#ifdef VM_SAO
> +	if (*vm_flags & VM_SAO)
> +		return false;
> +#endif
> +#ifdef VM_SPARC_ADI
> +	if (*vm_flags & VM_SPARC_ADI)
> +		return false;
> +#endif

These two also need to check vma->vm_flags, or it won't build on those
configs.

Otherwise, the patch looks good to me.
