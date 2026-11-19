Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100187;
	b=0WcIxseVxazuetmmcULFpfjxL8SL4ndoYmrXWR+HeVpvPavjReWMzk1bYu+fg46W+weT
	 G78ZSLhhusMf4U3u6vmN9OGMvT8bXPgIfwinHZbrRfiBYsIw2KP2xIcAEncxEpNq2AKK2
	 QzfXUf0LyR1Y0krpOMaY7hTkuC161CgEp9/9+Q7uP9K2DSxfx0H+94k04BRmkkW4QpAco
	 gxjwes8y6CcucVDFqRctkL24CunpXAGYlpeQVvXWDrGFWuCOkWf98/5W+/3eEsIPlUD/I
	 RQBeB4zAESyMdcw96HG1khOnjKEIyVS6Gdr/SmgFYruawV7O+auD8yyZZN2jTo5xG1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=bMbyjACtLzAau3mHjynkxDTW6eWUIU5ieVZSzXwOIHE=;
	b=cKvBDsnccwCXLbxC2sprrrHki6oxSyPvZwERp2lN0CaDKWKR5YYZf9nbpk+HPvNkTb3B
	 kK9QmKGHkhRSiOUD81bncGAMndCLDpWUWu404zeNh9PJU5VFjZ4pD62mV2S7e2L3DSMKr
	 lNN5ARhC5ryjhsG7J1a/dz8eoRvBJBdZB27Oy9F2aBEz+roeSFJCL2beWH00M9j4cr/Kd
	 I/8AEnCn6NMLtJb51WZW7wnai35dMLEmW+SwGM3sneMAW2ggRSxXwy3z1I9ibj60YHVGQ
	 REGx2ZVlG7xVG78In6c77hKWoAOwLJfhQfQ7nsEI2ynb1BTdjSap4JHnfp5wqRmMUyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b5TUgwvF;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B2606A324
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 14:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA9B2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b5TUgwvF
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a018493d57so72785e9.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 06:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795100184; x=1795704984; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMbyjACtLzAau3mHjynkxDTW6eWUIU5ieVZSzXwOIHE=;
        b=b5TUgwvFYcVrC0LOg2IULJtqFlnDVpcYRRC0cTfg9QswAYhwPZPDrcQIrzjwvc0wn5
         EzRGpwmbzA4Xmk7HpuJ8jv+2WMpZDpPgeKn3UJNXnnlXY0qdnMCWJfehEc5j9Ljb2oMs
         3IzLQXakIPjzLFv/aL8+6AkfgnY0SvdM93E0JAw3YXjYdV3REyGnxAXXJgAiEQW7ijix
         R1LQpKuwdNosskHSJKsqlyFrXAbR8Ot53tL0esWuTGOnAU94+vKQfiDR+Uju/SvWhVQz
         BYoUvJHfHGz2Xt+gabEjfbYvc16kUz2ROiveyuaRLmHo2qjBMzm9u24OULe1pgf0W0Lm
         E0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100184; x=1795704984;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bMbyjACtLzAau3mHjynkxDTW6eWUIU5ieVZSzXwOIHE=;
        b=RXVo8BQG63QmLqhZOGjVKLPeupBhuA45JHhk5bJKwgxihY5yr7rPJj3AEFTdK5M1gA
         CIoI6szB7MAVy2YxogC+S81mc+/GUcgO6fW53ccja5cKokEJWBGc3oGzclC9wIoy9m5V
         w9gU/1eK3CoIfLTagcwV6O2pluwBH4Q02X09E5oLPMImSEMS0hqHUL4G6VYRvx4yjEdU
         DJ4QQeeODmCKYwcezGo5CcD5SeJ06Td+nZIAfrR4YxBnhJkmJzpz4BAJUFvml87PwIih
         nr59Wzjf9/HTF3yOx9077APcJgeneGVTBFh8k+5ECHUUel7WBqosFI/N8B1ugmA5ZtXh
         ZpYA==
X-Forwarded-Encrypted: i=1; AL+hErESgEccrEv/6ONWXf4STShapoabn+Q8OgTTMHgmQUZ15+miNlnPDvrulAkXLMHVMV0+m8VL5XtZFAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K3eARRvN8kwtfPpp0KNvP91ymduDWjl7sodkwQZ86QbdKv5Mk
	mBX2k1vhHlTrqCOgpt4dhkv04okBqcIbJ7k02GcR6XVlPtRJoYp2tnSO58vPYVxPSg==
X-Gm-Gg: AYBFou2oaGP0yAa556Zt2HafXlBRD7sAEFxPjAMI8HUkGBzyd7ks3dQf8uwoU5Zusuy
	DHWbHWx0v0hzEkMXUMh9V2X9q6N+8SuWSSA8CqdgKiYj59Q8x2bkug7JBQqgZ20uZRzwdGnpDFg
	GM8ZnLO8OmaPw1EsYnNzDgVx8bZFxg8ypyujZqzPErHXDuYAEFgVuxr2VdBScUBxqiPfinTUKXi
	O/XDqGC5dG8ttZyA0lCn62Vw3Du21h/0jE1X3P7frSYx0GVlmbFvk5V/+5+MEXepjFCgNZziw+x
	RyRE1RO+Bkg0icv5y7glgbzoqWhTgQZqNRUuml1JjKfFn3elBB/gs39F8u3ystcNJS64ob3x5gL
	HopJkUwzXMfV7/DbPwDAb3mz+MP75ar7e8tKT0GgXF781KZXLsk1Cngksl1+Y/TjuvhYqW7NQUA
	meZDVit/oPde5jRDugMrIE/9Owl8gv4rg9xFrizjbUONJARJ5Jmpghy44xcQJLSSR/UsZn0KQaj
	/CTUOZKY/vr3NmI4SDE0j4Seywz8nP9TkV2idkQFsy3LK+iHEb9FOB1uc+5rHjmoycy6iZ5aEwe
	UuaLqKi4Tk7MuksYElVxKamJWkg3R87k4Vhz0mZlygpWGNaW4zGEzzdO6IrxujS0Tzv5sjM=
X-Received: by 2002:a05:600c:1d01:b0:4a1:e384:5e12 with SMTP id 5b1f17b1804b1-4bb85193dc1mr748295e9.7.1795100183663;
        Thu, 19 Nov 2026 06:56:23 -0800 (PST)
Received: from google.com (160.193.189.35.bc.googleusercontent.com. [35.189.193.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm43338685e9.12.2026.11.19.06.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:56:22 -0800 (PST)
Date: Thu, 19 Nov 2026 14:56:18 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	David Lechner <dlechner@baylibre.com>, Armin Wolf <W_Armin@gmx.de>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Pnina Feder <pnina.feder@mobileye.com>,
	Mete Durlu <meted@linux.ibm.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Rio <rioo.tsukatsukii@gmail.com>,
	Feng Tang <feng.tang@linux.alibaba.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	Julian Ruess <julianr@linux.ibm.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Eric Auger <eric.auger@redhat.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>, qat-linux@intel.com,
	virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
Message-ID: <av8OEgaW0jEJC1OF@google.com>
References: <DMYH4ED3GWDO.29DGXPK4M82VR@kernel.org>
 <20261118235645.2907908-2-alex@shazbot.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118235645.2907908-2-alex@shazbot.org>

On Wed, Nov 18, 2026 at 04:56:44PM -0700, Alex Williamson wrote:
> Driver overrides are the standard mechanism for binding vfio drivers
> to devices.  With the introduction of the support_driver_override flag
> in the core driver struct, it's now required for drivers to declare
> themselves as driver_override compatible, otherwise driver_override
> bindings will be denied or generate a kernel taint.
> 
> Set the support_driver_override flag on the driver struct across all
> vfio drivers.
> 
> Cc: Yishai Hadas <yishaih@nvidia.com>
> Cc: Longfang Liu <liulongfang@huawei.com>
> Cc: Ankit Agrawal <ankita@nvidia.com>
> Cc: Brett Creeley <brett.creeley@amd.com>
> Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Julian Ruess <julianr@linux.ibm.com>
> Cc: Nipun Gupta <nipun.gupta@amd.com>
> Cc: Nikhil Agarwal <nikhil.agarwal@amd.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Mostafa Saleh <smostafa@google.com>
> Cc: Pranjal Shrivastava <praan@google.com>
> Cc: Ioana Ciornei <ioana.ciornei@nxp.com>
> Cc: qat-linux@intel.com
> Cc: virtualization@lists.linux.dev
> Cc: intel-xe@lists.freedesktop.org
> Cc: kvm@vger.kernel.org
> Signed-off-by: Alex Williamson <alex@shazbot.org>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
> 
> Uwe, this should cover all the vfio drivers that expect to use
> driver_override.  Thanks,
> 
> Alex
> 
>  drivers/vfio/cdx/main.c                        | 1 +
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c              | 1 +
>  drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c | 3 ++-
>  drivers/vfio/pci/ism/main.c                    | 3 ++-
>  drivers/vfio/pci/mlx5/main.c                   | 3 ++-
>  drivers/vfio/pci/nvgrace-gpu/main.c            | 3 ++-
>  drivers/vfio/pci/pds/pci_drv.c                 | 3 ++-
>  drivers/vfio/pci/qat/main.c                    | 3 ++-
>  drivers/vfio/pci/vfio_pci.c                    | 3 ++-
>  drivers/vfio/pci/virtio/main.c                 | 3 ++-
>  drivers/vfio/pci/xe/main.c                     | 3 ++-
>  drivers/vfio/platform/vfio_amba.c              | 1 +
>  drivers/vfio/platform/vfio_platform.c          | 1 +
>  13 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/vfio/cdx/main.c b/drivers/vfio/cdx/main.c
> index 28dc8c825600..fb7679bf92fd 100644
> --- a/drivers/vfio/cdx/main.c
> +++ b/drivers/vfio/cdx/main.c
> @@ -358,6 +358,7 @@ static struct cdx_driver vfio_cdx_driver = {
>  	.match_id_table	= vfio_cdx_table,
>  	.driver	= {
>  		.name	= "vfio-cdx",
> +		.support_driver_override = true,
>  	},
>  	.driver_managed_dma = true,
>  };
> diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> index 15b05b8c0c90..1603f81e0257 100644
> --- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> +++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> @@ -597,6 +597,7 @@ static struct fsl_mc_driver vfio_fsl_mc_driver = {
>  	.remove		= vfio_fsl_mc_remove,
>  	.driver	= {
>  		.name	= "vfio-fsl-mc",
> +		.support_driver_override = true,
>  	},
>  	.driver_managed_dma = true,
>  };
> diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> index c82c59246a3f..5c56aff8db01 100644
> --- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> +++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> @@ -1737,7 +1737,8 @@ static struct pci_driver hisi_acc_vfio_pci_driver = {
>  	.id_table = hisi_acc_vfio_pci_table,
>  	.probe = hisi_acc_vfio_pci_probe,
>  	.remove = hisi_acc_vfio_pci_remove,
> -	.driver = { .pm = pm_ptr(&hisi_acc_vf_pm_ops) },
> +	.driver = { .pm = pm_ptr(&hisi_acc_vf_pm_ops),
> +		    .support_driver_override = true },
>  	.err_handler = &hisi_acc_vf_err_handlers,
>  	.driver_managed_dma = true,
>  };
> diff --git a/drivers/vfio/pci/ism/main.c b/drivers/vfio/pci/ism/main.c
> index cce3bdf1f070..263b377e87c4 100644
> --- a/drivers/vfio/pci/ism/main.c
> +++ b/drivers/vfio/pci/ism/main.c
> @@ -399,7 +399,8 @@ static struct pci_driver ism_vfio_pci_driver = {
>  	.id_table = ism_device_table,
>  	.probe = ism_vfio_pci_probe,
>  	.remove = ism_vfio_pci_remove,
> -	.driver	= { .pm = pm_ptr(&ism_vfio_pm_ops) },
> +	.driver	= { .pm = pm_ptr(&ism_vfio_pm_ops),
> +		    .support_driver_override = true },
>  	.err_handler = &ism_vfio_err_handlers,
>  	.driver_managed_dma = true,
>  };
> diff --git a/drivers/vfio/pci/mlx5/main.c b/drivers/vfio/pci/mlx5/main.c
> index 18a6d224b1fd..63c89e461be8 100644
> --- a/drivers/vfio/pci/mlx5/main.c
> +++ b/drivers/vfio/pci/mlx5/main.c
> @@ -1451,7 +1451,8 @@ static struct pci_driver mlx5vf_pci_driver = {
>  	.id_table = mlx5vf_pci_table,
>  	.probe = mlx5vf_pci_probe,
>  	.remove = mlx5vf_pci_remove,
> -	.driver	= { .pm = pm_ptr(&mlx5vf_pm_ops) },
> +	.driver	= { .pm = pm_ptr(&mlx5vf_pm_ops),
> +		    .support_driver_override = true },
>  	.err_handler = &mlx5vf_err_handlers,
>  	.driver_managed_dma = true,
>  };
> diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
> index 5ddec340b73b..946da32c61ff 100644
> --- a/drivers/vfio/pci/nvgrace-gpu/main.c
> +++ b/drivers/vfio/pci/nvgrace-gpu/main.c
> @@ -1438,7 +1438,8 @@ static struct pci_driver nvgrace_gpu_vfio_pci_driver = {
>  	.id_table = nvgrace_gpu_vfio_pci_table,
>  	.probe = nvgrace_gpu_probe,
>  	.remove = nvgrace_gpu_remove,
> -	.driver = { .pm = pm_ptr(&nvgrace_gpu_pm_ops) },
> +	.driver = { .pm = pm_ptr(&nvgrace_gpu_pm_ops),
> +		    .support_driver_override = true },
>  	.err_handler = &nvgrace_gpu_vfio_pci_err_handlers,
>  	.driver_managed_dma = true,
>  };
> diff --git a/drivers/vfio/pci/pds/pci_drv.c b/drivers/vfio/pci/pds/pci_drv.c
> index cf7e33d4d17b..1fcef987f1b0 100644
> --- a/drivers/vfio/pci/pds/pci_drv.c
> +++ b/drivers/vfio/pci/pds/pci_drv.c
> @@ -184,7 +184,8 @@ static struct pci_driver pds_vfio_pci_driver = {
>  	.id_table = pds_vfio_pci_table,
>  	.probe = pds_vfio_pci_probe,
>  	.remove = pds_vfio_pci_remove,
> -	.driver = { .pm = pm_ptr(&pds_vfio_pm_ops) },
> +	.driver = { .pm = pm_ptr(&pds_vfio_pm_ops),
> +		    .support_driver_override = true },
>  	.err_handler = &pds_vfio_pci_err_handlers,
>  	.driver_managed_dma = true,
>  };
> diff --git a/drivers/vfio/pci/qat/main.c b/drivers/vfio/pci/qat/main.c
> index 69448fa57df4..8a616f9b6494 100644
> --- a/drivers/vfio/pci/qat/main.c
> +++ b/drivers/vfio/pci/qat/main.c
> @@ -695,7 +695,8 @@ static struct pci_driver qat_vf_vfio_pci_driver = {
>  	.id_table = qat_vf_vfio_pci_table,
>  	.probe = qat_vf_vfio_pci_probe,
>  	.remove = qat_vf_vfio_pci_remove,
> -	.driver	= { .pm = pm_ptr(&qat_vf_pm_ops) },
> +	.driver	= { .pm = pm_ptr(&qat_vf_pm_ops),
> +		    .support_driver_override = true },
>  	.err_handler = &qat_vf_err_handlers,
>  	.driver_managed_dma = true,
>  };
> diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> index e7c012febe91..fde2c3fc88eb 100644
> --- a/drivers/vfio/pci/vfio_pci.c
> +++ b/drivers/vfio/pci/vfio_pci.c
> @@ -260,7 +260,8 @@ static struct pci_driver vfio_pci_driver = {
>  	.remove			= vfio_pci_remove,
>  	.sriov_configure	= vfio_pci_sriov_configure,
>  	.err_handler		= &vfio_pci_err_handlers,
> -	.driver		= { .pm = pm_ptr(&vfio_pci_pm_ops) },
> +	.driver		= { .pm = pm_ptr(&vfio_pci_pm_ops),
> +			    .support_driver_override = true },
>  	.driver_managed_dma	= true,
>  };
>  
> diff --git a/drivers/vfio/pci/virtio/main.c b/drivers/vfio/pci/virtio/main.c
> index 123ff5193812..1e02a8fd4a61 100644
> --- a/drivers/vfio/pci/virtio/main.c
> +++ b/drivers/vfio/pci/virtio/main.c
> @@ -222,7 +222,8 @@ static struct pci_driver virtiovf_pci_driver = {
>  	.id_table = virtiovf_pci_table,
>  	.probe = virtiovf_pci_probe,
>  	.remove = virtiovf_pci_remove,
> -	.driver = { .pm = pm_ptr(&virtiovf_pm_ops) },
> +	.driver = { .pm = pm_ptr(&virtiovf_pm_ops),
> +		    .support_driver_override = true },
>  	.err_handler = &virtiovf_err_handlers,
>  	.driver_managed_dma = true,
>  };
> diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
> index 7dab3e024aa8..e0ab61f604de 100644
> --- a/drivers/vfio/pci/xe/main.c
> +++ b/drivers/vfio/pci/xe/main.c
> @@ -592,7 +592,8 @@ static struct pci_driver xe_vfio_pci_driver = {
>  	.id_table = xe_vfio_pci_table,
>  	.probe = xe_vfio_pci_probe,
>  	.remove = xe_vfio_pci_remove,
> -	.driver = { .pm = pm_ptr(&xe_vfio_pm_ops) },
> +	.driver = { .pm = pm_ptr(&xe_vfio_pm_ops),
> +		    .support_driver_override = true },
>  	.err_handler = &xe_vfio_pci_err_handlers,
>  	.driver_managed_dma = true,
>  };
> diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
> index fa754f203b2d..2c87caf1b7f7 100644
> --- a/drivers/vfio/platform/vfio_amba.c
> +++ b/drivers/vfio/platform/vfio_amba.c
> @@ -137,6 +137,7 @@ static struct amba_driver vfio_amba_driver = {
>  	.id_table = vfio_amba_ids,
>  	.drv = {
>  		.name = "vfio-amba",
> +		.support_driver_override = true,
>  	},
>  	.driver_managed_dma = true,
>  };
> diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
> index a4d3ace3e02d..93d06032cdde 100644
> --- a/drivers/vfio/platform/vfio_platform.c
> +++ b/drivers/vfio/platform/vfio_platform.c
> @@ -116,6 +116,7 @@ static struct platform_driver vfio_platform_driver = {
>  	.remove		= vfio_platform_remove,
>  	.driver	= {
>  		.name	= "vfio-platform",
> +		.support_driver_override = true,
>  	},
>  	.driver_managed_dma = true,
>  };
> -- 
> 2.54.0
> 
