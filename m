Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679463932D1
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 08:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781685623; cv=none; b=cPCuYa5yGpx7O3U7lGZj+XDWO6E1vHUQiAZREVymiFUASDNU4JtCW9SPiIKv9vq+2Du+axZvp8EKdjTXZq8qwK+78yFPOsjzgE4LIhUMNMS69HsvqMmD6apyk3dL0lh4LdaKuE1MB5YS4jA3aBci8jwLyTQ6nmVRmU+bELkwulA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781685623; c=relaxed/simple;
	bh=De2vm6RyRU0iSQKNzaduSyNa+wrDdzJVxawvD4Hxjh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJAecaZ8xXYTEoTopFbOWwOk8hc4Pmb7aAIwXk1HOoRH9sDPTXMS1n7rmmlsSYcWFjWGxpoZF8ZldIcBuMog5c8nVY13o+cZsncprR24BPoZFQoU9OI0aECsTFqMgq8rF68gvEebZHt8a2JQykTdD5qMbxcvLfTJysXJz3a2SpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Xb8hVNsd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Xb8hVNsd"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eeea039ebso3130115f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781685619; x=1782290419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=idF8TdiXvEwuoIpI0e/Gphntv25+7UUd8M2Ri2FF3/I=;
        b=Xb8hVNsd0pwgKsfFiLK7+3VOli8GpzDnzdgpnPkDOoFzmWHBBPELf+T3YKx5d4fNQZ
         zl3LHwyfd3ouRxec19H9VrMAnKDVZO5fHH9dYnbS48saVkpIEt6QNWln5InyRpEAt4pS
         xfF/DspQFSDXAiQaZAcuGZg4igyWZfr888GX9rvTfWISZZ+nDrDFJBmZOe5+aCAk68MP
         HGgV/HaDISem5CgufliWUK8lJ2SGYg7/U6h6iUQjp3mGLAdPXUDlNuL1EKRzXSUuJ4em
         59jqBsAt9DUSJ8FUUuBHXLoxI+OHXHjKZnKAd4YrFVYtX6J0qg0pf/8ycJfBfr+pXhdZ
         0p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781685619; x=1782290419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idF8TdiXvEwuoIpI0e/Gphntv25+7UUd8M2Ri2FF3/I=;
        b=lJKeLdysk+qL2PSujUz+Os4zyBWTZjgVzxhkpBSsKP5sMF90G9sL8LJoegVOXKB0SY
         2IMU0YmzaY7kNVBN6ezCoKpjwGPn8NTfJFRItrIh6IOMADINel9trPPZhclZrTiQMNg6
         h1b56dv5kzGoTlT82AB4+0lwfGk+w9its31mA989gWG9yK0kQr03e0K8XZLxfuFfRVSH
         +TPm3Sk7q8E7I8/wFkfWNpvdte6z3xLk9d+hB4Ew5k/DIojE7wes3uF6oR3l6I1q5gEE
         OAj4wgbCvWSGn3O3MZYOaeAYmC6Uk1bMYqC1eYO052MVaU2QED6hwO41rx9cnObjJfS/
         zi0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8yu/FxBMmaNvp/4WGedix2sGo87RfWRiOrDeAOArw/LZJUI+Jl44IV2qof/PiGRZLH1OnSAaL/ntY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDROK+r3qPFwvJm391KVoswpchb0kuuncC8B0uMPvRXDbMVa3c
	++jAgj0GciUdkIe2HfF8paM4TCvufquxiaq1r35xlqlgNNrJlzRoDCmWP2/dVXuj054=
X-Gm-Gg: AfdE7clf6lIPWV0DJ/beMbEpf7F0NUsEUyNAmvTeW6Ko5ib87v2+ZD4MCcpZDq34lYG
	AUGeXHDY2RwG3mBR9ekHEHyF8eMUCNuFsm4bwbXOdoSezNE3LvNIYsP6xGyTY3/6DwQ4GHVZbs/
	sEVtmx/xMFypi/cup9rbROxd5x0HH6gDo9segzAuiUZ/jbWu2WF+WUlMKaSkEInVpxQHJBSsDlq
	Bn7ki7lyVRDYyCQ/SChtXoNmgDs0vpUpUmzU2V6sNworsLOUk2KYuAVjv6yX5es+qrkKec1VWvw
	kcYMKOZtNlE8yLlrddvtmCYXHnQDscb8Fq4D+57b6agzOlDf6iPGb9R9UqzMz0u3V7TM9Zm5ew4
	Nwsj9lDt3YRhPnAeKTTRJ2Bab3vbPgf6CVj5TkxiMFITB3dh6lK5qQGzxKoiXRo9szlDnYteqsp
	1cxymOqWK7Bb7krQHQlH3moo6AhvytjGoqGn3RKE8UoMRlXV8lHC5HzXeaBb3lamlxuqz/IvI4j
	R0u
X-Received: by 2002:a05:6000:1889:b0:45e:f31a:7ae6 with SMTP id ffacd0b85a97d-46238f97e32mr5037115f8f.30.1781685618753;
        Wed, 17 Jun 2026 01:40:18 -0700 (PDT)
Received: from localhost (p200300f65f47db04bc2080ea3c93ea6d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:bc20:80ea:3c93:ea6d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-462236047c8sm7325308f8f.10.2026.06.17.01.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:40:17 -0700 (PDT)
Date: Wed, 17 Jun 2026 10:40:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "illusion.wang" <illusion.wang@nebula-matrix.com>
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com, 
	sam.chen@nebula-matrix.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch, corbet@lwn.net, 
	kuba@kernel.org, horms@kernel.org, linux-doc@vger.kernel.org, pabeni@redhat.com, 
	vadim.fedorenko@linux.dev, lukas.bulwahn@redhat.com, edumazet@google.com, 
	enelsonmoore@gmail.com, skhan@linuxfoundation.org, hkallweit1@gmail.com, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v18 net-next 01/11] net/nebula-matrix: add minimum nbl
 build framework
Message-ID: <ajJbmSZpmvOtYnG7@monoceros>
References: <20260611044916.2383-1-illusion.wang@nebula-matrix.com>
 <20260611044916.2383-2-illusion.wang@nebula-matrix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a23ql32okbup4l6b"
Content-Disposition: inline
In-Reply-To: <20260611044916.2383-2-illusion.wang@nebula-matrix.com>


--a23ql32okbup4l6b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v18 net-next 01/11] net/nebula-matrix: add minimum nbl
 build framework
MIME-Version: 1.0

On Thu, Jun 11, 2026 at 12:49:00PM +0800, illusion.wang wrote:
> +static int nbl_probe(struct pci_dev *pdev,
> +		     const struct pci_device_id *id)
> +{
> +	return 0;
> +}
> +
> +static void nbl_remove(struct pci_dev *pdev)
> +{
> +}
> [...]
> +static const struct pci_device_id nbl_id_table[] = {
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18110),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18110_LX),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18110_BASE_T),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18110_LX_BASE_T),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18110_OCP),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18110_LX_OCP),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18110_BASE_T_OCP),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18110_LX_BASE_T_OCP),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18000),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18000_LX),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18000_BASE_T),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18000_LX_BASE_T),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18000_OCP),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18000_LX_OCP),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18000_BASE_T_OCP),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	{ PCI_DEVICE(NBL_VENDOR_ID, NBL_DEVICE_ID_M18000_LX_BASE_T_OCP),
> +	  .driver_data = BIT(NBL_CAP_HAS_NET_BIT) | BIT(NBL_CAP_IS_NIC_BIT) |
> +			 BIT(NBL_CAP_IS_LEONIS_BIT) },
> +	/* required as sentinel */
> +	{
> +		0,

Please drop this zero. The most usual style is `{ }`.

> +	}
> +};
> +MODULE_DEVICE_TABLE(pci, nbl_id_table);
> +
> +static struct pci_driver nbl_driver = {
> +	.name = NBL_DRIVER_NAME,
> +	.id_table = nbl_id_table,
> +	.probe = nbl_probe,
> +	.remove = nbl_remove,
> +};

The pci bus probe function has (pci_device_probe() ->
__pci_device_probe()):

        int error = 0;

        if (drv->probe) {
		...
	}
	return error;

So given that the probe function does nothing apart from returning zero,
you can just drop .probe(). (There is an additional check against
.id_table, but I'm pretty sure that isn't relevant because
pci_bus_match() already makes sure that there is a match.) The same is
true for .remove().

Best regards
Uwe

--a23ql32okbup4l6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoyXW4ACgkQj4D7WH0S
/k4b1Qf/VkdAm0QAaJj1mxlAEWnW5vEI6PU2OQ2r1Zpjz5AtXue+SZQKUYEocLkO
vfpxbrIRBEdWfRwzDD6nUSVHdrskz0thY+6sMBKApTmS87u0rZ2XfowILGKC/Eaj
W29cjxuTVBQCqJ2uaUA2mULbwsA4aSPN0OvBFdKlA6zsfr93M7LZjTCi05nPEnnb
sL7Kucgndltp43joiX3lRh3Mn9Rp9cQ/Gvpd47ndkS/af8MLqTCNVA6kiqX3n9fb
sbw3evzS4V+U13JMFtF2JlBdsD01ikSJqo9MxQSzBf0zBZ3i+Zo7BR1b9xZcoPju
ifnPegSEJcnE5swPqal9zV+L0MiuOg==
=2nso
-----END PGP SIGNATURE-----

--a23ql32okbup4l6b--
