Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133977;
	b=GNl2HNMuw817F2rFK76LQlxlDEn55uVRE5pu8WTY7XxBROdRDeli9aIM2Kau5h2y2/Cp
	 jkqYZOBTNMJExkAVRufS9eRlW//udwwy69W/tMElJY0ULNLRW9pD6xTXodgruxHs1yCGE
	 BztDnsSqUOmTIsnP+VeReNT6Ft32lj99M/T3xvDHr5Sd0UsNWiV8L2hQvQ4Kx0rmeiQbZ
	 yCchDpvrj8+bWxC/FSq6idkMErlwvVCIbkuNXLDVMhHXgaG4UrRdFB+gpBc5Z8D51CAy3
	 zLArEfdi6Q0fF+ueyrqpj2Xkh5CqHqJnrNayAGZIPneFG3eYVbOXkRKqHN/w3Q7JH9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=n7l+AyO/cRMVQJwJa64VigJKwgCGiEZe5FhWi4AHvFM=;
	b=JrLuYNr8tXvb5qyvWX6afEM4LMUwh3ZZ+CuRG1FAxHdWAlwDoO3sVk5+MHHUQyl0iNJp
	 mSXgMsUMRPWS4mPLMNZ7F2Ou3f8mnC8ZnIsDWB/+qlC4gDi93/t5k8WR9mOdCz6hx4uCS
	 xOY+r/01akItoFp+KepydCQt5q0GICKOn+adRZ7iRlESl2W7XASb6uDFk5qJwtOSJLG+8
	 NwxRTpmnq/Da8kQ8mhR+K3VioGfGYNaOzy9jC/2VDQRkSdQlUHd/tAd3f6p/dGeBTdUUZ
	 lWVe/42LeI4LE44j8O9d343AF+xY+XlhqdEUUOHm8S6VGTKFhpDq4ZjBIZWL1OD0YWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c0YmB6qv;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4485A606A326
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 00:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4485A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c0YmB6qv
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f041f88577so1991545ad.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 16:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795133976; x=1795738776; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n7l+AyO/cRMVQJwJa64VigJKwgCGiEZe5FhWi4AHvFM=;
        b=c0YmB6qvMhpaj+ArB/jPNkVM3sliqTTn0WbeoapI8nPg3tM1GnKVZSozlBLVMwCpL/
         QjA+6UEKBn6/yQk9Jg4KzCo7S+tYrh/T/pxgGHcziS4LNgf6yMIdqwrKNUaw7uK3ZE8Q
         H7GEc0Bxw/viVw9rPmc9j2rw8rP95JHSgZeUDV42vagZHqRbRYnzY+g5j3AnTFOypQ5S
         4j6/9YuFziz5/TBGRLlRk/JUotLRDa5ymW+yqbCbctrmp9gfITbziCJ0XAX58COy8EiG
         eGBtIidXO19TWk5YXgMOQi9ZR9kXdpMQMHFd0cN9o6lTDysPOMKf2pab/QtIH5bCOFj8
         QzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795133976; x=1795738776;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7l+AyO/cRMVQJwJa64VigJKwgCGiEZe5FhWi4AHvFM=;
        b=zGeEfZp6pjN1BQw+KTdWbogBWcTA5poGBuq5AFrGgw8u4juBve1eHnN9cE25u7HmoJ
         5I2P6bz/17MKlvc56sWW425qpdcGBj+6nIkj16lRB1L1aAoZt8/BLv0wke2yTl+hwbgA
         M83lqWii0OZQ1kgT/urWHSeNlPCEP1lbjNKKmYMo1JsWhvt58f2KnAi5rNA/Uam9Pdtt
         Z95keeKjlx4X/MiWtM4AzvAV/pyXQevh0sMnbsFo/iwxUj+VS50GBNk3scfoEkoy0rnj
         WVt4ksYOKbaDHyqWK+X5Afwy9MUOKv92g1fXJd3tWzebpSsKvMBe6UuOiq5kayzhGsXX
         nPPQ==
X-Forwarded-Encrypted: i=1; AL+hErFYL+W2O0LSZ8Zw96v8S+4Oyj0epUwAodxIX5VuHYfFeFgy1ziyz4s0B37VSB9o0p2uoPL1B02xQZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oM2E7dFeGWrL3s1OaQ+t3SjD1W29r8DgsQApxWJP9h417eSsh
	N4vofCKYZS1TH5H95vXi/rNkay3iRtrNzHlZseuwORJl+7hWFd0xAMuTpY4Pmu1O2w==
X-Gm-Gg: AZFdTZdTrYx9Qo8IDevFKl8AIrUBHfuVoWFCqMPdiHUSNDcoiQuR+60lwzO/fpuFnfQ
	UZz+1a8X5e/55e4EjDWzsB982IXX0G8Ei/Tqs6vwOX3TROLAaLzTjfVdiXRJT5NAm3ljuzgOy0X
	ZAIzI6NHPf4f2Yg42BBWuNPpWqjThjXiwsB4/WwK5a0tHqfp1QxygBvEBXNgYkX8NJfkTrY8Eup
	u5kJlpa7oXVOO9R5vc6zVGvJKU6LmJ5aUvOEczjc4fqFrlyiW/It+tQQYs6dzfhfcje+p1osUkf
	UNxOYdcFcYJ0FYSJHKO9hR4efO3QEVyq3H13kOmOuryHiZpzJRXcG0lP3xSHhPzGVR+jN7a7EAu
	21tNsLp2XhH2CTIvqY70S4f57npUkvGKAcS/qWJWsQxyJWWgd+sWqAij/ivcFmUjUVooSm9oSHn
	RgY23rririVFuKXnxI7EqooIkc6O1hyt1zuIdf7jnEHyh4cLGCZASlustltodWHeGIGncNvGVyB
	G+ON/fNiLA6hNHjHmTINv1B74XmbVIURiM8+gLNOlDOuklJ5Y9yAKSpQxhgsLABIVP/3vXxcWpn
	zvqWx1/nfaJYLOmPPIDWIuZR0/B9ayegsEbCjm/uboKY/PQS9pm3Uu0xrRR0oWWi
X-Received: by 2002:a17:902:e542:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2f03f1a4967mr13941365ad.30.1795133975980;
        Thu, 19 Nov 2026 16:19:35 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0ddf40sm5969655ad.37.2026.11.19.16.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:19:35 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 16:19:34 -0800
Message-Id: <DMZLVV5YW6GW.1HMW8L8NIQ1XR@google.com>
Cc: <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <dmatlack@google.com>, <graf@amazon.com>, <jacob.pan@linux.microsoft.com>,
 <jgg@nvidia.com>, <jgg@ziepe.ca>, <jrhilke@google.com>,
 <julianr@linux.ibm.com>, <kees@kernel.org>, <kevin.tian@intel.com>,
 <leon@kernel.org>, <leonro@nvidia.com>, <lukas@wunner.de>,
 <mattev@meta.com>, <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 12/27] vfio: Enforce preserved devices are retrieved
 via LIVEUPDATE_SESSION_RETRIEVE_FD
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, <kexec@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-13-vipinsh@google.com>
In-Reply-To: <20261102153656.1431701-13-vipinsh@google.com>

On Mon Nov 2, 2026 at 7:36 AM PST, Vipin Sharma wrote:
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 12557d45dfee..e6ca4c3fda06 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -11,6 +11,7 @@
>  #include <linux/cdev.h>
>  #include <linux/module.h>
>  #include <linux/vfio.h>
> +#include <linux/pci.h>
> =20
>  struct iommufd_ctx;
>  struct iommu_group;
> @@ -446,4 +447,21 @@ static inline void vfio_device_debugfs_init(struct v=
fio_device *vdev) { }
>  static inline void vfio_device_debugfs_exit(struct vfio_device *vdev) { =
}
>  #endif /* CONFIG_VFIO_DEBUGFS */
> =20
> +#ifdef CONFIG_VFIO_PCI_LIVEUPDATE
> +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_dev=
ice *device)
> +{
> +	struct device *d =3D device->dev;
> +
> +	if (dev_is_pci(d))
> +		return pci_liveupdate_is_incoming(to_pci_dev(d));
> +
> +	return false;
> +}
> +#else
> +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_dev=
ice *device)
> +{
> +	return false;
> +}
> +#endif /* CONFIG_VFIO_PCI_LIVEUPDATE */

No need for the ifdef here and 2 definitions here. If
CONFIG_PCI_LIVEUPDATE is not enabled then the compiler should be able to
optimize vfio_liveupdate_incoming_is_preserved() to false.
