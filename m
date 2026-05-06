Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5873630EF68
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 21:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778102153; cv=none; b=OtyCz6+Ici8bdF1ITq7Ojine4m/WMLl1W5NGV8U/l40GbWmgwhiiF1hK+GDQ2XA3XoFiPPex+gUqMWvn3IJW8LfNaKyHHVFBwjiZFiF3YTntBLchBYrh8CTfaFjep2JZAPDGzy7DfkyctXpGuUD/AFnRQ6b5mS/EsaVfIfzVHd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778102153; c=relaxed/simple;
	bh=XJ+ClloHWiI0i5J2IlI8HTRqFze+Mzaf6cGh67jqqyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tfGvwgg91FqqD6aF8k50rl1uBch1uea3CT1iJP93z4wiS4eGI7A8X//+pTLCBtztPDE67R5ohkVVJcmczgQuLvpsE1XW/HhyZUVB7kbxjWqaSjP7Cg1SRes37LdYGzEXWuU7W5MQUqDSY96LIntq+km+xsQa4TKwDMiYkGZ2B5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVduZtte; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVduZtte"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so826495e9.1
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 14:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778102150; x=1778706950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dYoXiHUjmlP1m7cdWazf6GqkiJYUjvpbDWQPXdu5Sc=;
        b=pVduZttedmhabjDK5FLrNmbk8z7fdAVObc7mTB3g2BrzmIRXZx5OXv2y2+q0CK0ItT
         OMXopLE/sUZOOezw+ZJ/cEWU7jbY/fxxB+oETvd/LioVYLy9kyWW2Egd4Im453batCGF
         Nag7HTFL2CAx1KuHbsyYKQAJTSLB8eueqJvV0fU6wTiB3Tzbtc8tDMzpmWbidmtQhpuU
         gYKWzxgnlWZrDOAxJ4s9KTJTfPqtgu8onui8kbaSetIzJVyYyv0uplapm6GqXxZ84gS3
         nWDLTJc3LwzcbKIdtFUREZQSUDbaMebkCc/2v1C/RozMLzJ8scrVHIp8Z5/LUlQoNNsI
         To+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778102150; x=1778706950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7dYoXiHUjmlP1m7cdWazf6GqkiJYUjvpbDWQPXdu5Sc=;
        b=q7pxC95W7iMp39HWg0/0PnQiFx+ayAc8g2zzwoQM9cEgZgv8IiPolgGnYuS84SFVp7
         /XKP7cf2JlO11W5WXQ/AbIyGAB8B6K52NzIXR/ULxk9uMDhRhnq7Ve0N7rxpKE/dG4w6
         Iy/UjzAhBsNHzn2rp26Uyeb8eH3YZ33amhNPJgxsLoXn8tWc9oIYgLVHcg+vmOygv92c
         hRwm0RyrBROypVvJDCAMjNtx85GSEkbPhJC79DKeaL0MPhWyx779wNkK4QlHP/Eh06J6
         MnyLlhpKnJ4fXvqqqqt3kipwY2SZF3hHKeb0/8GtxmzflW2JxWn1tbh+QM+YQYAOUa15
         hM/w==
X-Forwarded-Encrypted: i=1; AFNElJ/3XMxnUwSFOtCxfjxmpAApskxEq69nsEuGtGcm3j5YjwVmOChmeFdrJJHYCt2kyzOX4L2ojwYp5n8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzheLQGNSWu0zx+p9ZWX+qAMNwBorF5qnsIwq4Lub4kKBGCUy0
	5ecuPiwMMdkktOINm4jqCb56x5jXKc1D6eykvyoXbnbwjLkVIz2o2vNcDx08vw==
X-Gm-Gg: AeBDietIgP7sju+ylQNKn5gfmK3llJNEglS7DBfw1ecLMbu2bNrM2abxLJx1jflLY6B
	CMc9YUk9FP7nD3hCuSLK1jN3A6dJvJjrB9R2HVi9ZL0nBD3M1/fU09QDY+M4yxlEreVErxQm0oo
	K5OEAWTKZcVpEak27ImY9w0elnAdRlmBIkMpOcNQ+mGWlvP0+RgasEsKduHIk6tfqhJHzAU+aXg
	Gv8nW7BXM9vAET4B4Ajze9pg3EY61PgaVyOgellriBFKrYMlgrRieysiRxWUfbY8Uqfm9e5dYbA
	wXJWfHBYeSyktOhZEDaeokWGTMU8sMyLDcT6nBDrH6SfEZMIUBQt7nNTgh3A7e9VTDF+DqJ13Et
	SDT9zkfAIFeZ1sM8Msl1FCkbGNFJiag3Ww1DqSnF189CB14FquNdoJUy75Z/jC8rvDCwly0sgVv
	1I6ZqpQ0SeSsPHBIfef1dgkoZXM+D9KkK+Rf/16KaMFzpIkg==
X-Received: by 2002:a05:600c:4e56:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-48e5dfd6508mr2974885e9.5.1778102149531;
        Wed, 06 May 2026 14:15:49 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530c5dfcsm23661205e9.14.2026.05.06.14.15.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 06 May 2026 14:15:49 -0700 (PDT)
Date: Wed, 6 May 2026 23:15:41 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jihong Min <hurryman2212@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mario
 Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: xhci-pci: add generic auxiliary device
 interface
Message-ID: <20260506231541.32f88ce1.michal.pecio@gmail.com>
In-Reply-To: <3f26994ebb5f0e4e653a8108a9626bc793148679.1778099627.git.hurryman2212@gmail.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
	<cover.1778099627.git.hurryman2212@gmail.com>
	<3f26994ebb5f0e4e653a8108a9626bc793148679.1778099627.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  7 May 2026 05:40:33 +0900, Jihong Min wrote:
> Some xHCI PCI controllers expose controller-specific functionality that is
> not part of generic xHCI operation and is better handled by optional child
> drivers in other subsystems. Add a small auxiliary device registration path
> for selected xHCI PCI controllers.
> 
> The initial table creates an xhci_pci.hwmon auxiliary device for AMD
> 1022:43fd controllers. Store the created auxiliary device in devres so the
> xhci-pci remove path destroys it before HCD teardown. Use a
> PCI-domain-qualified id so auxiliary device names remain unique across PCI
> domains.
> 
> This keeps xhci-pci responsible only for publishing selected controller
> functions while allowing subsystem-specific drivers to bind through the
> auxiliary bus.
> 
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
> ---
>  drivers/usb/host/Kconfig    |  10 ++++
>  drivers/usb/host/xhci-pci.c | 114 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 0a277a07cf70..e0c2c7ac5c97 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -42,6 +42,16 @@ config USB_XHCI_PCI
>  	depends on USB_PCI
>  	default y
>  
> +config USB_XHCI_PCI_AUXDEV
> +	bool "xHCI PCI auxiliary device support"
> +	depends on USB_XHCI_PCI
> +	select AUXILIARY_BUS
> +	help
> +	  This enables xHCI PCI support for registering auxiliary devices
> +	  for selected controllers. It is used by optional child drivers
> +	  that bind to xHCI PCI controller-specific functionality through
> +	  the auxiliary bus.
> +
>  config USB_XHCI_PCI_RENESAS
>  	tristate "Support for additional Renesas xHCI controller with firmware"
>  	depends on USB_XHCI_PCI
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 585b2f3117b0..1ab27d2182eb 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -8,6 +8,8 @@
>   * Some code borrowed from the Linux EHCI driver.
>   */
>  
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device/devres.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
> @@ -103,6 +105,114 @@ static int xhci_pci_run(struct usb_hcd *hcd);
>  static int xhci_pci_update_hub_device(struct usb_hcd *hcd, struct usb_device *hdev,
>  				      struct usb_tt *tt, gfp_t mem_flags);
>  
> +#if IS_ENABLED(CONFIG_USB_XHCI_PCI_AUXDEV)
> +static const struct {
> +	struct pci_device_id id;
> +	const char *aux_dev_name;
> +} pci_ids_have_aux[] = {
> +	{
> +		.id = { PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x43fd) }, /* PROM21 xHCI */
> +		.aux_dev_name = "hwmon",
> +	},
> +	{ /* end: all zeroes */ }
> +};
> +
> +struct xhci_pci_aux_devres {
> +	struct auxiliary_device *auxdev;
> +};
> +
> +static bool xhci_pci_aux_match_id(const struct pci_device_id *id,
> +				  const struct pci_dev *pdev)
> +{
> +	if (id->vendor != PCI_ANY_ID && id->vendor != pdev->vendor)
> +		return false;
> +	if (id->device != PCI_ANY_ID && id->device != pdev->device)
> +		return false;
> +	if (id->subvendor != PCI_ANY_ID &&
> +	    id->subvendor != pdev->subsystem_vendor)
> +		return false;
> +	if (id->subdevice != PCI_ANY_ID &&
> +	    id->subdevice != pdev->subsystem_device)
> +		return false;
> +
> +	return !((id->class ^ pdev->class) & id->class_mask);
> +}
> +
> +static const char *xhci_pci_aux_dev_name(struct pci_dev *pdev)
> +{
> +	int i;
> +
> +	for (i = 0; pci_ids_have_aux[i].aux_dev_name; i++) {
> +		if (xhci_pci_aux_match_id(&pci_ids_have_aux[i].id, pdev))
> +			return pci_ids_have_aux[i].aux_dev_name;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void xhci_pci_aux_devres_release(struct device *dev, void *res)
> +{
> +	struct xhci_pci_aux_devres *devres = res;
> +
> +	if (devres->auxdev)
> +		auxiliary_device_destroy(devres->auxdev);
> +}
> +
> +static void xhci_pci_try_add_aux_device(struct pci_dev *pdev)
> +{
> +	struct xhci_pci_aux_devres *devres;
> +	struct auxiliary_device *auxdev;
> +	const char *aux_dev_name;
> +
> +	aux_dev_name = xhci_pci_aux_dev_name(pdev);
> +	if (!aux_dev_name)
> +		return;
> +
> +	devres = devres_alloc(xhci_pci_aux_devres_release, sizeof(*devres),
> +			      GFP_KERNEL);
> +	if (!devres) {
> +		dev_warn(&pdev->dev,
> +			 "failed to allocate auxiliary device state\n");
> +		return;
> +	}
> +
> +	auxdev = auxiliary_device_create(&pdev->dev, KBUILD_MODNAME,
> +					 aux_dev_name, NULL,
> +					 (pci_domain_nr(pdev->bus) << 16) |
> +						 pci_dev_id(pdev));
> +	if (!auxdev) {
> +		devres_free(devres);
> +		dev_warn(&pdev->dev, "failed to add %s auxiliary device\n",
> +			 aux_dev_name);
> +		return;
> +	}
> +
> +	devres->auxdev = auxdev;
> +	devres_add(&pdev->dev, devres);
> +}
> +
> +static void xhci_pci_try_remove_aux_device(struct pci_dev *pdev)
> +{
> +	struct xhci_pci_aux_devres *devres;
> +
> +	devres = devres_find(&pdev->dev, xhci_pci_aux_devres_release, NULL,
> +			     NULL);
> +	if (!devres || !devres->auxdev)
> +		return;
> +
> +	auxiliary_device_destroy(devres->auxdev);
> +	devres->auxdev = NULL;
> +}
> +#else
> +static inline void xhci_pci_try_add_aux_device(struct pci_dev *pdev)
> +{
> +}
> +
> +static inline void xhci_pci_try_remove_aux_device(struct pci_dev *pdev)
> +{
> +}
> +#endif
> +
>  static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
>  	.reset = xhci_pci_setup,
>  	.start = xhci_pci_run,
> @@ -677,6 +787,8 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
>  		pci_clear_and_set_config_dword(dev, 0xE0, 0, 1 << 22);
>  
> +	xhci_pci_try_add_aux_device(dev);

Is it considered acceptable to add

	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_AUXDEV))

before this call, remove #ifdef around the definitions of the auxdev
functions and rely on dead code elimination to clean them up?

We already have a similar trick with CONFIG_USB_XHCI_PCI_RENESAS here
and it seemed to be working, though the amount of conditional code is
much lower and so is the potential risk.

The reason for doing it this way was because Greg doesn't like #ifdefs
in .c files, and neither do static analyzers like them.

> +
>  	return 0;
>  
>  put_usb3_hcd:
> @@ -713,6 +825,8 @@ void xhci_pci_remove(struct pci_dev *dev)
>  	xhci = hcd_to_xhci(pci_get_drvdata(dev));
>  	set_power_d3 = xhci->quirks & XHCI_SPURIOUS_WAKEUP;
>  
> +	xhci_pci_try_remove_aux_device(dev);
> +
>  	xhci->xhc_state |= XHCI_STATE_REMOVING;
>  
>  	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
> -- 
> 2.53.0
> 
