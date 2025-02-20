Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C581E5B7A
	for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 07:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740036764; cv=none; b=nPuQUMvxkc9VOCWgaRuKjtEXKNgTfm3ay569GolVc2p6uvmARObR7t2vzbeMR2bCj+c8D1D9hC3gOMM5DTgYqEeoxfgGUp3z9hShXbPG1PCMDerWQ3aKZegtYWF5tpOByhKYNiUzLl3RULxL4KlfVzcS+vd9/wjBabYnF1kkbXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740036764; c=relaxed/simple;
	bh=C8Tn4j9hwJhGXw+grotIFigiArmyVoPGWwRvPe9C9VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJN9Ki9cRrihAejJMn92NC5YJpmWQUgF3Si/7Xhr2H/MzWdgE2W5lt9RUs8dWYKKlMzP4pBWihOXPXvmMe7oDkhWBIYh6OWghtj93sy9RkwB9uk7m1FRGfoBMF6BOxfmHfklGqOAGOVnxYMexSKaa9x9N2XGpN1QsVLQuRPdDUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fWOCxFBC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fWOCxFBC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-220ecbdb4c2so14808675ad.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 23:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740036762; x=1740641562; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FXU4R0KmoTFdg8jXRXAwzbIAksqSlYZwJ35KKaCTndE=;
        b=fWOCxFBCK173rTy2NIzopZ4EYs5Mq2wzkf5dcE+tsErC1+Q1dU7xg+YAGFCmYDJFyI
         TCTxuW67agORHdvxZPsQ3RZNPeJYCCHYjjeQW6JeU7mBLf/+o84wNSyiz2VJK8TGtf4E
         aTHiXH102I/1y+lXV4jx4ODg/F0W76ArKg73h8erHfOQUoJSUBx8H5I2ZJ95HR52uXWW
         /kEyJwAg7IvBpGXQkxqUH6F4a/6g8ZlbhClrS1n9tqmAfzxLOl1gKEEoXPJXT+eT9Xjy
         /TV/q5kNSmrI5ww432qjK+ege295e5ItnlVHBoi+KhXj32rE28/5a8wVEFLPkyb1PXyo
         8FMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740036762; x=1740641562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXU4R0KmoTFdg8jXRXAwzbIAksqSlYZwJ35KKaCTndE=;
        b=wfPojgxVddfmN3WZwBX1EwJuGHDo9yRjC0cK1oZOixqE5T0tv8VkoJOH4JYgPWrbsv
         RQMT2TEFBlpFOsXbvsb2ycOvRtFMv30XLFKOZgYO7IJRDfQf+3tFvi1lsaD+5IhvgKJA
         sieDS8sp8AHlf2Mx5YQpyfQ+QkCgiFdaHt79btjpZI8csI8dmhiUuh4CqavkGQ5lT2eu
         360I+VMZdKgkgoK8yvVXFWoULor6X0vzHv75hyT0qK+TVdvoEvxO926bvSye3rhp4C2A
         TWbK8gHv7Q02Bk6j3uebotuBwTxHaszgAJ8RJcDW+QRcscf554FJx51zHClooaiIu7Tg
         mqIw==
X-Forwarded-Encrypted: i=1; AJvYcCUdafS9liD6tojlVExhGpZ4+Ku7iJmilafoQ31F7L9J/h+CKDY0ICy7dFDVHEZnzzUE5p9jZLUNCPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm7/DeEVmNRT8gcA543Wsw7f+JlN/1z3d7TOuJ8wNofcMC4++5
	D4dH6HkrdyzWAh1+kgx6OarkeWoFjiw3JcqWpzRgqw7evFrRuF045nph1JCQuQ==
X-Gm-Gg: ASbGncvLmbjWy6juUJ2gf3ivScuYQGp7X/ZROzixUe0tbnaz8KtoXATeStHfMeKDeT/
	+mn2Gi0WelWEtZK01aBpiOJnN5sKz6cTB9MniWGf/BjHRvOvZMzchSEKNC7LuBltHA8PYgu/5Eo
	Sc/OYkzdypvl1q0QaD0o1l5RC/Q9UvDNchyr0RwzZl/bslYcPuLG6kDTqH5TnNr+yFsgmbZ7eX8
	pmBGWUJiW8Qbh0EIF2Qs3r1AC1r8BYzax3pdx/Zm/HAvs3RT6yq5Mr9Qs1T6aDR6rjdCt/xaZY7
	R+cX7nTrPHwDjz7ouPBL+03Xmw==
X-Google-Smtp-Source: AGHT+IFMQZcHUaYDlmCBsNrPBZQlguATymJPy3WC6DYnPVexDEON9gJocUR6d1WJGcmWD6+RVJBkHA==
X-Received: by 2002:a17:903:27ce:b0:21f:89e5:2712 with SMTP id d9443c01a7336-221040ab970mr246797425ad.39.1740036762268;
        Wed, 19 Feb 2025 23:32:42 -0800 (PST)
Received: from thinkpad ([120.60.70.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ad2d00sm13127977a91.21.2025.02.19.23.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 23:32:41 -0800 (PST)
Date: Thu, 20 Feb 2025 13:02:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v2] PCI: endpoint: Remove API devm_pci_epc_destroy()
Message-ID: <20250220073237.6qtryn4itzdtdc2o@thinkpad>
References: <20250217-remove_api-v2-1-b169c9117045@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217-remove_api-v2-1-b169c9117045@quicinc.com>

On Mon, Feb 17, 2025 at 08:26:46PM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Static devm_pci_epc_match() is only invoked by API devm_pci_epc_destroy()
> and the API has not had callers since 2017-04-10 when it was introduced.
> 
> Remove both the API and the static function.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>

Applied to pci/endpoint!

- Mani

> ---
> Changes in v2:
> - Correct commit message error pointed out by Manivannan Sadhasivam.
> - Link to v1: https://lore.kernel.org/r/20250210-remove_api-v1-1-8ae6b36e3a5c@quicinc.com
> ---
>  Documentation/PCI/endpoint/pci-endpoint.rst |  7 +++----
>  drivers/pci/endpoint/pci-epc-core.c         | 25 -------------------------
>  include/linux/pci-epc.h                     |  1 -
>  3 files changed, 3 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
> index 35f82f2d45f5ef155b657e337e1eef51b85e68ac..599763aa01ca9d017b59c2c669be92a850e171c4 100644
> --- a/Documentation/PCI/endpoint/pci-endpoint.rst
> +++ b/Documentation/PCI/endpoint/pci-endpoint.rst
> @@ -57,11 +57,10 @@ by the PCI controller driver.
>     The PCI controller driver can then create a new EPC device by invoking
>     devm_pci_epc_create()/pci_epc_create().
>  
> -* devm_pci_epc_destroy()/pci_epc_destroy()
> +* pci_epc_destroy()
>  
> -   The PCI controller driver can destroy the EPC device created by either
> -   devm_pci_epc_create() or pci_epc_create() using devm_pci_epc_destroy() or
> -   pci_epc_destroy().
> +   The PCI controller driver can destroy the EPC device created by
> +   pci_epc_create() using pci_epc_destroy().
>  
>  * pci_epc_linkup()
>  
> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index 9e9ca5f8e8f860a57d49ce62597b0f71ef6009ba..cf2e19b80551a2e02136a4411fc61b13e1556d7a 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -25,13 +25,6 @@ static void devm_pci_epc_release(struct device *dev, void *res)
>  	pci_epc_destroy(epc);
>  }
>  
> -static int devm_pci_epc_match(struct device *dev, void *res, void *match_data)
> -{
> -	struct pci_epc **epc = res;
> -
> -	return *epc == match_data;
> -}
> -
>  /**
>   * pci_epc_put() - release the PCI endpoint controller
>   * @epc: epc returned by pci_epc_get()
> @@ -931,24 +924,6 @@ void pci_epc_destroy(struct pci_epc *epc)
>  }
>  EXPORT_SYMBOL_GPL(pci_epc_destroy);
>  
> -/**
> - * devm_pci_epc_destroy() - destroy the EPC device
> - * @dev: device that wants to destroy the EPC
> - * @epc: the EPC device that has to be destroyed
> - *
> - * Invoke to destroy the devres associated with this
> - * pci_epc and destroy the EPC device.
> - */
> -void devm_pci_epc_destroy(struct device *dev, struct pci_epc *epc)
> -{
> -	int r;
> -
> -	r = devres_release(dev, devm_pci_epc_release, devm_pci_epc_match,
> -			   epc);
> -	dev_WARN_ONCE(dev, r, "couldn't find PCI EPC resource\n");
> -}
> -EXPORT_SYMBOL_GPL(devm_pci_epc_destroy);
> -
>  static void pci_epc_release(struct device *dev)
>  {
>  	kfree(to_pci_epc(dev));
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index e818e3fdcded95ca053db074eb75484a2876ea6b..82a26945d038d3e45e2bbbfe3c60b7ef647f247a 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -257,7 +257,6 @@ __devm_pci_epc_create(struct device *dev, const struct pci_epc_ops *ops,
>  struct pci_epc *
>  __pci_epc_create(struct device *dev, const struct pci_epc_ops *ops,
>  		 struct module *owner);
> -void devm_pci_epc_destroy(struct device *dev, struct pci_epc *epc);
>  void pci_epc_destroy(struct pci_epc *epc);
>  int pci_epc_add_epf(struct pci_epc *epc, struct pci_epf *epf,
>  		    enum pci_epc_interface_type type);
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250210-remove_api-9cf1ea95901e
> 
> Best regards,
> -- 
> Zijun Hu <quic_zijuhu@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
