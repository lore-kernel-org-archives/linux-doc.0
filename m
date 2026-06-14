Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC03C2F6565
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781444330; cv=none; b=UXUsF87ZuNBeqvE3sN1PCInIQAYBgsxzvdgd79RCZI6gLYilqxgrNGxA16S4d6PA5/dB4tweT2nLzdWg1953YzojDLe+6fSeyRPnSPpiTbMe7+wKAVvgy/j4NkT5cdyOt+4Pwh4xhd7EzZ3cRqyja9okceaT/3e5c2KJ0GHAL2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781444330; c=relaxed/simple;
	bh=imkMf1LWuc5WHnOYfzLBjY+C/lZku32PXLp//Z5mGeY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=DT9pfnBKCbKa+HNWLE0Q+tc7m2REzlbhjdvBUl3cZtia931/L+oxoJ1Z2Fv1z/IklO49W28G5BccyWbXDBllPswycjykXngyRuJLIID3h9fQAHnqcS/GSXUyGDVNBFofNOCB11iImt+lNTahB1RwvZSlSyJ5EmT895dZ34lHL/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=FzkhWlvA; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="FzkhWlvA"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-517dc520840so27705271cf.3
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1781444328; x=1782049128; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXg+GT95yYO4T14XPgWTJKtcxJfATzJGx0/pfKwDeqA=;
        b=FzkhWlvAinGRVWzFvkq0b8rhoeql2geAfWJe87dnHiKgbbwsvaO0UO1d+UjOUUK7zJ
         bdznGBvnaT4k2ll8qSO+OlEcX5/ManmerWMwrLbWyX+oT12ApQPM+c/VfOA6ZJLGkMCq
         cFcCMainMSBOPzY8IIqJ/bwYYBXNrjqPJdLUvhlnXYYvPyh/hhCBur6veftbCfKx8FbV
         m7B6sBi2gbTp65Ufw7yFiZQyWo0qd0rhr5AgR79MQphRQNfVv2Lt2QeNdJJMxphTk1oE
         WwBF7nAO3kelpIhqXaqZxeWQqQzQmuJbOeY2lKnwrudqgd9tvrFV9PSdmy+/JJAzImbh
         2nVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781444328; x=1782049128;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XXg+GT95yYO4T14XPgWTJKtcxJfATzJGx0/pfKwDeqA=;
        b=RnjHa0lQcB/eYVWzH4sr7Kwlf2BRqndTkWIs2zltsVJ52KDPg5R50iJxJcUEf3Efx9
         19yTag1Zh6pwy26Q1PVx825+cXPeF4oLskscD/7DgWtHL7RRsyt0QF4HmOQg5VLD1I8S
         NEpgHdW3BSenkwgFmPP2WS1GIB4u/NaxPJFINKwvgm6cR7gKBYdqfkX/ZfzlD7zG0uPt
         wCl3jjG7+zCEPeyVgu4IJfOo5Xos/7kyqzWfS/nfCUjpRX8zsFVJrkVzKT7//Rccdsvn
         fEnfQwN9qy9XDWrgvJ9ouJLdKz59b7EvQAE3U/QHZURhCEISkh0zgOEdpPb0mX6phkAM
         riMA==
X-Forwarded-Encrypted: i=1; AFNElJ/ptX7uwlnxZlB4ziRgWhko9CFJ13MLhGeNGi8X7sBUXsO/xqVZRABHidRRUm/d3FE54gr5owGzk28=@vger.kernel.org
X-Gm-Message-State: AOJu0YziWyFvqBD/mfgO/jYnr0VHSKtv+9LM5c8iREocfRZ3ZdXZ6wFl
	Kt1eXacAJYNn3Nv99h3CsMzf51zt2ZjauuJcLBB21ybZ9diVm9/nIlnaJXsSk3+dRbA=
X-Gm-Gg: Acq92OFrDyGqP12sVSXhWMEg5jNu+8LgxxRDnBv2+kk/bD1oZdH2DP4zSpv1Wlr88mG
	JlR0T679Ks9qhGsAv5zjzCy9WiUS36gtgj/pgMxJ232zKncJ232FGg7gHQamPcZHXvRQycXF1LR
	oVp6TjZfkz5HwGr2PaeUChfhM/8516eCaW7CIoZ1t83VKaz4rJyvBqqlZxNfFKkXDSYPx7Sfk7V
	XMm8fTbkbTGjbE9L7BC4h5SdhqW53Hi1grWubVQU96evgqGYX7mmgTiRtCSyKq9u1CJ6wi/wGZW
	GbKuBXXCe92WSpiNMWadGtN+bb3ADXDySuaLn3t00Z9DQxnSzXgYO7A1QBGByjeN57mFE29KbQ9
	NRmlAqYCFIa3bVrTBpCzgzpptoXc4bviqZ2nx+vo28hLnK1DaJoIn0hS51q0U00VHe8se1IoaQU
	htCMQkY2qZ6uwkiynk2a7T5m+s8o/mmHixEf01Id32WiisYJIAMq2T95yZgp0/
X-Received: by 2002:a05:622a:8387:b0:50d:66b6:1564 with SMTP id d75a77b69052e-51953503dcbmr85951991cf.14.1781444327877;
        Sun, 14 Jun 2026 06:38:47 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7dad16sm73669631cf.21.2026.06.14.06.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 03/12] PCI: liveupdate: Track incoming preserved PCI
 devices
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
 Adithya Jayachandran <ajayachandra@nvidia.com>, 
 Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
 David Rientjes <rientjes@google.com>, 
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
 Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pranjal Shrivastava <praan@google.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
 William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20260522202410.3104264-4-dmatlack@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-4-dmatlack@google.com>
Date: Sun, 14 Jun 2026 13:38:40 +0000
Message-Id: <178144432039.1257322.9644414453415904478.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3299;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=imkMf1LWuc5WHnOYfzLBjY+C/lZku32PXLp//Z5mGeY=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqLq7l1REohFN/W+c/zZvmZsiNBGib+GmmJ98Xn
 Q+7rb16wzOJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCai6u5QAKCRC7dyhM23N6
 3kxIEADBd+AmGBTMM3+Eeu1O0iFW2mY7VSiDXVMIuYE2Aff07zDsPuFqh4iaxqw5y6yQq1RDRS9
 C+LCuvNoHjr972Bm+MNjX7C07NBMYiDKF/eZq0xHbj1XYcvY3GjqVzl5O2NnP0UkUp3d5XxdB2U
 kRMKTDUBoWa3SJaUak+oxi08sxN+Je36bFKJwqBY9dcpbDzgF/LY2TXsLUIsLhTK7mJJZ1Zua4D
 UllLotthUK/tr3huxjhNXxTtHxzpkCFabCnjYT8xZjmKs/WZmMMSP5laKjVC95NnLsDcZQZJcaY
 fVhlX1FaX9DSWDdZ7SsxAYVJ7Ur3pbt9FjS0jeI2lOhMlBGh/ybDkx4+LAnHvXuwa1taPVB55fP
 eavqiJEVaCFIZWubPMrJDMotiK4Re7Jw1ldxwPS0Qef24xJe0PBaNgnXCwEFfIGun6uZ2ev1uiD
 hsnw6UqUOs1u/utfaWudvAaNnZjzHo0l/k5+sc6C6QYbwAOSME6sT5ASpuABBfnrKTvMiveYmU9
 iSshqRHWh3vmaVHLAuamw7P21HrLeUpe1rAs+hC2gyfZ3ZKwrw4ErSfhqVMgkOBVovFuHcx1P/7
 lQyQjY82doo6RAVRWKXjvFekoAN0iqkrC5llrFeQHZvb2oyr/0eG3Rdd4Ga+VUaHcMzU3/xLWHV
 PULRypTcExsyIYg==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 22 May 2026 20:24:01 +0000, David Matlack <dmatlack@google.com> wrote:
> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index 10c9b65aa242..e68ae5c172d4 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -330,7 +330,7 @@ config VGA_ARB_MAX_GPUS
>  
>  config PCI_LIVEUPDATE
>  	bool "PCI Live Update Support"
> -	depends on PCI && LIVEUPDATE
> +	depends on PCI && LIVEUPDATE && 64BIT

Please move this to the first patch, fewer changes between patches, and 
also KHO does not support anything but 64-bit mode.

>
> diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> index 065d5af822f7..96c43b84532c 100644
> --- a/drivers/pci/liveupdate.c
> +++ b/drivers/pci/liveupdate.c
> @@ -128,13 +157,49 @@ static void pci_flb_unpreserve(struct liveupdate_flb_op_args *args)
> [ ... skip 31 lines ... ]
> +
> +err_xa_destroy:
> +	xa_destroy(&incoming->xa);
> +	kfree(incoming);
> +err_restore_free:
> +	kho_restore_free(ser);

This is the pattern we have been enforcing in other places in LUO. If 
the first retrieval fails, return the same error thereafter.

> @@ -270,6 +335,91 @@ void pci_liveupdate_unpreserve(struct pci_dev *dev)
>  }
>  EXPORT_SYMBOL_GPL(pci_liveupdate_unpreserve);
>  
> +static struct pci_flb_incoming *pci_liveupdate_flb_get_incoming(void)
> +{
> +	struct pci_flb_incoming *incoming = NULL;
> +	int ret;

Maybe make the error return static, and avoid another search through compatible 
FLBs if it failed before?

1. Add "saved_err;"; if it is set, return it right away.
2. Change all errors to use goto save_err;, and at the end of the 
function, assign ret to saved_err;

> [ ... skip 15 lines ... ]
> +	 * This could mean that no PCI FLB data was passed by the previous
> +	 * kernel, but it could also mean the previous kernel used a different
> +	 * compatibility string (i.e. a different ABI).
> +	 */
> +	if (ret == -ENOENT) {
> +		pr_info_once("No incoming FLB matched %s\n", pci_liveupdate_flb.compatible);

I would assume this is very normal, e.g., no devices were preserved but 
memfd+hugetlb was preserved. Maybe use pr_debug_once().

> +		return NULL;
> +	}
> +
> +	/*
> +	 * There is incoming FLB data that matches pci_liveupdate_flb.compatible
> +	 * but it cannot be retrieved.
> +	 */
> +	if (ret) {
> +		WARN_ONCE(ret, "Failed to retrieve incoming FLB data\n");

No need to print backtrace, please just print a warning:
pr_warn_once("Failed to retrieve incoming FLB data: %pe\n", ERR_PTR(ret));

> [ ... skip 34 lines ... ]
> +	 * through pci_liveupdate_finish(). This can happen if PCI core probes
> +	 * the same device multiple times, e.g. due to hotplug.
> +	 */
> +	if (!dev_ser->refcount) {
> +		pci_liveupdate_flb_put_incoming();
> +		return;

Pleaes use 'goto put_incoming'

> +	}
> +
> +	pci_info(dev, "Device was preserved by previous kernel across Live Update\n");
> +	dev->liveupdate.incoming = dev_ser;
> +
> +	/*
> +	 * Hold the ref on the incoming FLB until pci_liveupdate_finish() so
> +	 * that dev->liveupdate.incoming does not get freed while it is in use.
> +	 */

How would that work? If finish is not called FLB stays around until the 
next reboot.

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
