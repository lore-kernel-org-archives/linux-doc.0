Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5DE22F0E
	for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710748168; cv=none; b=OL9Ar382ZAOCYjoQsbAY26bfG4AB4yXHoyaFVsogXsYoPqY2BY5jLBouxnhO4PjanSbXVnUQC4nK8N8PA8Qn3DRnDKcWnXju1NrQYY07Lv7h2TB9rCVSyowKBw7Ym0AyIf5fuYGAp6czJCx3H0gfFCRcZwqwMzBjXDgFn0/sLJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710748168; c=relaxed/simple;
	bh=15xcVyjtS23QwfOxh5npEThTgAr9K+GFqp6y/Hir+nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4rxickHf/lfowXKilfRSt3FtUtIMM7JftupW2Ku9vfK2UfR34ULYbGZSak8YtvGyFTKqMOSvQWRKxOM2vAuzzQa7m3aKc7SdyB+wqWroystKJonm5rvqVm/JM2krXbWQ19bRxsvqrJ8kE9c3Yljkrr6oWhU/V3tOVFVoAbcnhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FXsDdwz6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FXsDdwz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710748164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hw3N3rKbRfObqQCjnzMro1ULUvDI+xFvOVwAh3eTCiU=;
	b=FXsDdwz6O1pDt81QjKglOrQrVNLuYijTryN96fw9Hjgf+uNkhvngag3zbWr/Z9Guij96VG
	I6Labof9abDmSDtuQgLEogl1QglqPksiYi+mUMazyJ4I+O+CPOWtEhq1hNPg49yMsWHros
	IKRcbcSxbcR5oXDn17A1Kj27Zt2bpyQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-gtcOzOEXMTSgC6_cdSw4mw-1; Mon, 18 Mar 2024 03:49:22 -0400
X-MC-Unique: gtcOzOEXMTSgC6_cdSw4mw-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-430d32a0a64so7073981cf.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 00:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710748161; x=1711352961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hw3N3rKbRfObqQCjnzMro1ULUvDI+xFvOVwAh3eTCiU=;
        b=kmBeKF1kXbxh+/30jl4HNvPU97isl1iJMGiyyI2S8kDdIG67a5H5XLbN1M6AWSpxy9
         TujU4QUD0QrzheG3f2WrfOLwrMArjhpCgi2jgR305azmiCVbqcggjGt/BcejaFmbZGJz
         4eyBdy1gDzF8YTnuzZXJnEBvUvZn7/UYmnB6KGTsSI0W0g4XijtcBv6volzzaxHWUrp+
         bH5RZtL9mfyTIlz0KPpvjtXZmJWAjIlgPhndPP89VkIiFAZ8Zm8uBPa14G45yrndkrW5
         o/DcsvsGCG3kOgYzzdY8ky0zFM9NaR+yUvVx1gLgC1U1nzU4Fk0Rh89lyH9RCeeOwlRp
         /nCg==
X-Forwarded-Encrypted: i=1; AJvYcCU2w5bNBFi5d6s4kI3G/sOWJXxpcfkRqoEEy6YyQWTgYsxL5fC8BIK+dtgMZKLcnFQKlg8Mv5AeXCsVbrbzfPA97QPtzWmRn4QW
X-Gm-Message-State: AOJu0YyOzSGhw0PMp/nmsrNo17Hv8TDnZrn/2rSeRwLgwXFGoldid09i
	th+Pu0cQAG0mJPpjYFjqYBpcWlixDdzmj35aSxKPVME7TrVTsFMQP7LKT4GR7vCQS0FtMAD2aSr
	rdl5JIqCKn9uvKpMGaE6s4/6PXS1Ik7iH3GEG39k7yk1IC6uuWEmZs5W+WKDkdcQ7IA==
X-Received: by 2002:ac8:7d0e:0:b0:430:c769:c747 with SMTP id g14-20020ac87d0e000000b00430c769c747mr4158274qtb.22.1710748161574;
        Mon, 18 Mar 2024 00:49:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUm3RY8ZnlG2VNiVbIkjz1nSzJks63N+Pz5IdxrajiTHHgE59rRqHBxHQ/JyqB9k3qzRWU1A==
X-Received: by 2002:ac8:7d0e:0:b0:430:c769:c747 with SMTP id g14-20020ac87d0e000000b00430c769c747mr4158261qtb.22.1710748161261;
        Mon, 18 Mar 2024 00:49:21 -0700 (PDT)
Received: from localhost (ip70-163-216-141.ph.ph.cox.net. [70.163.216.141])
        by smtp.gmail.com with ESMTPSA id h20-20020ac87154000000b0042c61b99f42sm4715917qtp.46.2024.03.18.00.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 00:49:20 -0700 (PDT)
Date: Mon, 18 Mar 2024 00:49:19 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] crypto: iaa: Fix some errors in IAA documentation
Message-ID: <jhpuhcengkgdpgyb7qsez4lugpa5nhjjn3zqehbcbrtr2xh5md@cc3vz7v2xzdu>
References: <20240318064421.833348-1-jsnitsel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318064421.833348-1-jsnitsel@redhat.com>

On Sun, Mar 17, 2024 at 11:44:21PM -0700, Jerry Snitselaar wrote:
> This cleans up the following issues I ran into when trying to use the
> scripts and commands in the iaa-crypto.rst document.
> 
> - Fix incorrect arguments being passed to accel-config
>   config-wq.
>     - Replace --device_name with --driver-name.
>     - Replace --driver_name with --driver-name.
>     - Replace --size with --wq-size.
>     - Add missing --priority argument.
> - Add missing accel-config config-engine command after the
>   config-wq commands.
> - Fix wq name passed to accel-config config-wq.
> - Add rmmod/modprobe of iaa_crypto to script that disables,
>   then enables all devices and workqueues to avoid enable-wq
>   failing with -EEXIST when trying to register to compression
>   algorithm.
> - Fix device name in cases where iaa was used instead of iax.
> 
> Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
> ---
>  .../driver-api/crypto/iaa/iaa-crypto.rst      | 22 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/driver-api/crypto/iaa/iaa-crypto.rst b/Documentation/driver-api/crypto/iaa/iaa-crypto.rst
> index de587cf9cbed..330d35df5f16 100644
> --- a/Documentation/driver-api/crypto/iaa/iaa-crypto.rst
> +++ b/Documentation/driver-api/crypto/iaa/iaa-crypto.rst
> @@ -179,7 +179,9 @@ has the old 'iax' device naming in place) ::
>  
>    # configure wq1.0
>  
> -  accel-config config-wq --group-id=0 --mode=dedicated --type=kernel --name="iaa_crypto" --device_name="crypto" iax1/wq1.0
> +  accel-config config-wq --group-id=0 --mode=dedicated --type=kernel --priority=10 --name="iaa_crypto" --driver-name="crypto" iax1/wq1.0
> +
> +  accel-config config-engine iax1/engine1.0 --group-id=0
>  
>    # enable IAA device iax1
>  
> @@ -536,12 +538,20 @@ The below script automatically does that::
>  
>    echo "End Disable IAA"
>  
> +  echo "Reload iaa_crypto module"
> +
> +  rmmod iaa_crypto
> +  modprobe iaa_crypto
> +
> +  echo "End Reload iaa_crypto module"
> +
>    #
>    # configure iaa wqs and devices
>    #
>    echo "Configure IAA"
>    for ((i = 1; i < ${num_iaa} * 2; i += 2)); do
> -      accel-config config-wq --group-id=0 --mode=dedicated --size=128 --priority=10 --type=kernel --name="iaa_crypto" --driver_name="crypto" iax${i}/wq${i}
> +      accel-config config-wq --group-id=0 --mode=dedicated --wq-size=128 --priority=10 --type=kernel --name="iaa_crypto" --driver-name="crypto" iax${i}/wq${i}.0
> +      accel-config config-engine iax${i}/engine${i}.0 --group-id=0
>    done
>  
>    echo "End Configure IAA"
> @@ -552,10 +562,10 @@ The below script automatically does that::
>    echo "Enable IAA"
>  
>    for ((i = 1; i < ${num_iaa} * 2; i += 2)); do
> -      echo enable iaa iaa${i}
> -      accel-config enable-device iaa${i}
> -      echo enable wq iaa${i}/wq${i}.0
> -      accel-config enable-wq iaa${i}/wq${i}.0
> +      echo enable iaa iax${i}
> +      accel-config enable-device iax${i}
> +      echo enable wq iax${i}/wq${i}.0
> +      accel-config enable-wq iax${i}/wq${i}.0
>    done
>  
>    echo "End Enable IAA"
> -- 
> 2.41.0
> 

In addition to the above, the sections related to the modes seem
to be off to me.

Legacy mode in the Intel IOMMU context is when the IOMMU does not have
scalable mode enabled. If you pass intel_iommu=off the Intel IOMMU
will not be initialized, and I think that would correspond to the No IOMMU
mode instead of Legacy mode. The other suggestion for Legacy mode of
disabling VT-d in the BIOS would also be No IOMMU mode, but in
addition to the dma remapping units being disabled it would disable
interrupt remapping since the DMAR table would no longer be presented
to the OS by the BIOS.

I think the modes should be:

Scalable mode: intel_iommu=on,sm_on
Legacy mode: intel_iommu=on
No IOMMU mode: intel_iommu=off (or VT-d disabled in BIOS)


Since Intel IOMMU and scabale mode have config options that allow them
to be enabled by default, there are different parameter variations
that would match the above cases. I don't know if they need to
be detailed here, or if it would just make it more confusing.


Regards,
Jerry

