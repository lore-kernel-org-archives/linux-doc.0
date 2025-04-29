Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A947254873
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953273; cv=none; b=aEfprM6L8ZqUIhLCUFvwn+JWErfcCFQr1hMCvhHQ6AeeUU0NGZ7CJ0f7UxkdUzalnzXL46RYBJVBcqCUs5dFo4MSyK22uQeiSon4s8TncPZZkj5r/jUFgxeMHnnC3gr0sIlDrGGnQc73Z4tfsHCAMQkuaS3zZWGY67wfzWqN9Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953273; c=relaxed/simple;
	bh=zlj30lyM4eVyR7FFYAFTYUbQXW6lBnZVNqgK8nT1pbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUbw+4IRkX3nYphaKJlL/1U8ce7JvXosMAXzFtiRVdJOuQe8wdh4R1nsLZYs3GIFv7W5IAT7yP1WKUrWGZjzMmUH1pWQV0VWudk6W2XgC6onyizQ+qgvUMVsuCZfkvNUkZ6BBfLhtJcNbxcwzuCQKixw7AV+hnSf5Q3Apg/9b/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPlSiVmX; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPlSiVmX"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b1a1930a922so3576423a12.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 12:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745953270; x=1746558070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpGa+bckbuvJP7m5D/Txn2xIA7nwgAhG2SPr14XaYzs=;
        b=FPlSiVmXV2D2PiJFtjFaNxbF66bpD0hl/jRmRN5eFvPuwRlM/nAl1P3CXRqQuJilt/
         uW8BE3z+hvXBIbp245h+wBX/mghclEoQubdb+lpOWKgzGesrEteH4gyJUIhSvNpuQF8z
         hxUOU5sjGYdSUmR+BEHpOPUWwXwGG1sheifd8rqJO7dcyUh4ck7erGCN20g4tHtaXHo8
         wnSrX1ofzZgO9uNcqbe4/ngfi45UHGimdi599pSNVmhvezpHilmthV8DUyYp2MREb1AH
         61spxQv4bFNhU4dHgvth1wYTDZ5hvlJg+hO6nc6HLcUayDO8EpIU+9iinTmnmC8OQZjJ
         rERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953270; x=1746558070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpGa+bckbuvJP7m5D/Txn2xIA7nwgAhG2SPr14XaYzs=;
        b=M5NSS9gPExZu0y2tEl0vbtYa8ibqAIYZ3wNQ9Xo0JMs8yn8UY3mxQbYR1v1oXvDacS
         KJzn+8z5wRN9nRRE3QD3MEow8fzqimxeB7X9p76DA2JuEKNeNbF8GuvHtHeT26zOtt1H
         CfsR/JbdypYZuvvOYR/0M1LeeGHKydQtsLLKEm35D6J0krit4qVuRz68+Rq4d5M2RNL8
         qNVYCNASGUEGjhgUrZIEG1epc152J9kBxquvbwfj/bZ6OAQppW4RDHRo+PjJFOIW3cyS
         9bOy1qDQLH1GFgc/0/W79S0LC63gARWCpOsL5IBeDtHsPfC5S5NMccKyWOBC8GcxXJBQ
         SZzA==
X-Forwarded-Encrypted: i=1; AJvYcCU+3r8XKWqLtJlT0aeEa7mQNAjM9zjM6/9g1tHn+3kILUuZRhFXu/prO+GI0fsrZrf+Ha1KvV1Siqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRq2g5TL3MyDeUeg4CWD8+SKbkF+La9O4XtV0vMxQkqF4RUQnK
	aSyjgHHSJrexbT5RfQADs9onvAGlsBvwkwI28dB+Cap58eUa8sM1496EK5jj/CU=
X-Gm-Gg: ASbGncuY/1Xbld8DfmKRl83mCqXO1vrP3MiIyvCELAGjAb3djpKdHeCshpWtxPKXTQn
	zOld1KBbc/74OeypDI4Km1laDNQPCZNbt8+NI1W0Uy0Acqmo/+/q67ciYMQbgADqYjSojD44hx4
	3f10/zI8KVZVYYCZQlUZbpneq6ANEKu1qAdpkCWEgcQ9gvGtNEBgHhB5f8wRmsZMGIaluRV/aQC
	z1H18AhDC3lZx2CkVeSuLlbBZkKGAJaycmn4FtPULqZ6qLyMbCjFh8qSd/XxpRXzJnuSKLIMFea
	GWirva8k89SXqVaiFxh460pyFE8cGqHduybIOST+hyNC
X-Google-Smtp-Source: AGHT+IEVtr/yC0OCZi67VUcBjFX/DwSpKJBMPsUaSpQ0/mI7DQHTRu+gj3DdEoU3UGNpoATnJz1CiQ==
X-Received: by 2002:a17:90b:3809:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-30a332f6e67mr387455a91.11.1745953270256;
        Tue, 29 Apr 2025 12:01:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b7e6:7a64:93dc:60a1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76edcsm106398905ad.12.2025.04.29.12.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 12:01:09 -0700 (PDT)
Date: Tue, 29 Apr 2025 13:01:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: linux@treblig.org
Cc: arnaud.pouliquen@foss.st.com, andersson@kernel.org, corbet@lwn.net,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rpmsg: Remove unused method pointers
 *send_offchannel
Message-ID: <aBEh85gDlaEywWtX@p14s>
References: <20250424142746.79062-1-linux@treblig.org>
 <20250424142746.79062-4-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424142746.79062-4-linux@treblig.org>

Hi,

On Thu, Apr 24, 2025 at 03:27:46PM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> After the previous patch, there are no implementers of the
> send_offchannel() and trysend_offchannel() methods.
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/rpmsg/rpmsg_internal.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index 42c7007be1b5..397e4926bd02 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -50,10 +50,8 @@ struct rpmsg_device_ops {
>   * @destroy_ept:	see @rpmsg_destroy_ept(), required
>   * @send:		see @rpmsg_send(), required
>   * @sendto:		see @rpmsg_sendto(), optional
> - * @send_offchannel:	see @rpmsg_send_offchannel(), optional
>   * @trysend:		see @rpmsg_trysend(), required
>   * @trysendto:		see @rpmsg_trysendto(), optional
> - * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>   * @poll:		see @rpmsg_poll(), optional
>   * @set_flow_control:	see @rpmsg_set_flow_control(), optional
>   * @get_mtu:		see @rpmsg_get_mtu(), optional
> @@ -67,13 +65,9 @@ struct rpmsg_endpoint_ops {
>  
>  	int (*send)(struct rpmsg_endpoint *ept, void *data, int len);
>  	int (*sendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> -	int (*send_offchannel)(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> -				  void *data, int len);
>  
>  	int (*trysend)(struct rpmsg_endpoint *ept, void *data, int len);
>  	int (*trysendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> -	int (*trysend_offchannel)(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> -			     void *data, int len);
>  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>  			     poll_table *wait);
>  	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool pause, u32 dst);

I'm good with this patchset.  Can you fix the last paragraph in the comment for
function rpmsg_send_offchannel_raw() and remove the reference to "_offchannel"?

Thanks,
Mathieu

> -- 
> 2.49.0
> 
