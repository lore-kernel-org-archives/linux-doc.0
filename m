Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020147;
	b=A9GWQtE/P9HqlYtgv3UWIrc7hDcu0aAK9PSylLTZFKhQOeAtvDqs7tAJF2NQNnUVc8xY
	 JzuK/sZOFeyCh8GgH84WWQrxB83WFfWrkYAKy2Fj9l2YaOdknfR3L4pyIWX6jr9F9lSqa
	 fqn5ocXnTm3W7cdxZHo9AFBbvuwxIhEk7uOSxJccXJIebnSYccvsz2OfRTH9BJfDFKfoL
	 8EDYOyMFq1lp8EXFL5Fqo6iJ9ibkcp0EMVe5MNrRhnaXt4oMu2pV+x1++9+AYEuXCADIT
	 Ld8lUAoCE20nia0dB39UF34RbSzdo2aS9DhtoGhokKOI97gC+akoI6D/Ytz3Dq4gNLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Qo/P/wbaNkEjPm8HGz4npHC5JZBaCO0dOmWlqnF5GUA=;
	b=LgF+Mhd2bYqFjsnTcuyu2Rl59AnUAxn6rs/ZnlsHG6/DwrCUgE4qEkae0CKHTkmobfa+
	 mr+TOa29ikajVQXcTplhMftDedvspM/JxkfpvaImn12FpOgUKR1i4dqLMTGwly9e/0oGz
	 ncyhvXO5bizi3pX+c0X0jP9hVdRrAALhEhhJi6rgOqfMF/i1LkNMHDbqu6h6W+PapZJmU
	 FNEMx62RdxMCkwc8IJyMyGmt+E6RU9z9tXJLHhnwp55qrFnToDM+p9sk0gTjd60S5GxED
	 gA7En+NpseSgN/Tq0+C5bw+wnt/sLPkpKgx+r1JxKsi92JCRmuT4blKV/xc6NylYqeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ursulin.net;
	spf=pass smtp.mailfrom=ursulin.net;
	dkim=pass header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b="Tk/ZRkDe";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1997606A330
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 16:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1997606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=Tk/ZRkDe
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490d59c3edaso838712f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 08:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1795020145; x=1795624945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qo/P/wbaNkEjPm8HGz4npHC5JZBaCO0dOmWlqnF5GUA=;
        b=Tk/ZRkDev4KXK3QoBw2RLqAbomT0us52EkaZBDylAc0yxZJOKLz/HT+wNKJPx3Qwv4
         VweXqPuooVRSFNClGeEp+aXvPzmwI7GfDzVGM5F5yO7Z/ZCjWHD2CdO0v7Q1a+mt1k0n
         Faw/elrgenKw2nP83PbWfrIsAOfL2Wm784UcGwBDaJK4jhIwb7kWRxPz8IQg8rEXftOm
         sVvm1LelEi3V5/hpraZHWOSXnWVrg4KiX9/ggTyMyCTsF8h0JIIXdGUs2lgdftxpHOk1
         ywtHjdjlCSjQxkNzj/hBy8VA4VIVhAEf3ECmGbQ5DokP9r62663REixmep0lRgpCrbf+
         dV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020145; x=1795624945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qo/P/wbaNkEjPm8HGz4npHC5JZBaCO0dOmWlqnF5GUA=;
        b=Hw9OBUgsUSJuJvoiaBq+RM7PCoxMt6siSDMJupXqeAMgYDhWMdnvhozvd7Bi8Jb3Sr
         5GKVymjixQkg4ODt4pJACWMobU5niqlhoOhR4GrTuukqKYSQwJSrOZa6lKMwuosCuGaQ
         XRnTIXmi2KH34T98RswbqKS4yYiCslwKL+ocD4vEtKyjPBQ89cusNrTUSH6bzoFoIz5R
         EeuorybBnQuOFjD2UG7JvxtC6vpb4fTKiySqEMbOcPDsKCA+VOuFf6F2ROLjGwoJL0Jf
         ab9xJIA+Gw2t97w+B2ZKzXez928Kp3qFPIlFhtrXL4Y/+b0Ux8xyljQbgWxFfQKLb9VJ
         3UBQ==
X-Forwarded-Encrypted: i=1; AL+hErEF8wNDVwGY+n/xJ+Ud2EzIbCi0fHFh/DWlV16pQhNST9FV7k38l/oN01lvOvNCmdQd228AUjo0mvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ligKEi1iJljjy+6O5wPF+JO7SYE47qwR6pnq/nP03kzQEkSrI
	Iqv29rHCbi4H3Q8qSGIwDdgXsNYeo/uqUOwQQRdKGEooxGsHrvTB5qEuwoB2z9WLT5A=
X-Gm-Gg: AZFdTZf2ydFWa7CbNulrxhssyTXXM0lxybl+eLwHywIqLtSpqAhwIDolml+TwgaCSjl
	wjyqIobwPgUhbb2cv1cB/yCcd3IxHmb78710QOwUJhhjNsZmiQKsi5dy+cptj9fTimVRlCMqqno
	8hfCejMhRcM/OHIruiFCJOZwjBghgL/sAcKQyUAGxQRp4GH6Aphxm2s3yV7PSfCY51FU1atCEZz
	2C45UA/R9eHS7Zvr8ie2wkOvZjXGiwtarMr9vYR0BKHfX5P1d7BdYJF8ylixRj79ztWwYd2qKYK
	d3aP/MSbX1wDoR79ykHZdQknbggrsomCpJQB/+WWJi7+FXi8NrrWR05m6sTJQ2EQRjWg5UONlgY
	7tjSCIJmW0fxPEOavqYm+7AeDG4IuYBqgw1JX2DDX94Bfle92YJl81sJcWYXMu7N9deSjHQCiXs
	+4bZy2NlJ+oZ+Ltvl3fQbwmfk6XAju/jgWd23n44grmR3Fi5yC2h5rIl2aSuGNTDbHw6PWPfe+W
	cPm+o5v36p9fs6pFSnD5U1TgweM9vLQ9KBXuLgLFXXQCsLBKgqRlL6XVRv+icrDUyzRoOCQiO3T
	ZLxidmT1monuVVb7nf1gVoWA3Jj/rN2DOMcDWM3BhI6hLA==
X-Received: by 2002:a05:6000:220d:b0:498:6171:c074 with SMTP id ffacd0b85a97d-4a8e39ae958mr149841f8f.3.1795020145028;
        Wed, 18 Nov 2026 08:42:25 -0800 (PST)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm5630286f8f.0.2026.11.18.08.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:42:24 -0800 (PST)
Message-ID: <cfb252a5-da73-4f0f-87d0-565797982e3a@ursulin.net>
Date: Wed, 18 Nov 2026 16:42:23 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] accel/rocket: Report NPU usage through fdinfo
To: Sidong Yang <sidong.yang@furiosa.ai>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, ckoenig.leichtzumerken@gmail.com
Cc: mcanal@igalia.com, Heiko Stuebner <heiko@sntech.de>,
 Gyeyoung Baek <gye976@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
 <20261112171144.3151554-3-sidong.yang@furiosa.ai>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20261112171144.3151554-3-sidong.yang@furiosa.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/11/2026 17:11, Sidong Yang wrote:
> There is no way to tell how much of the NPU a client uses. Implement the
> DRM usage stats: report the runtime of the client's scheduler entity as
> drm-engine-npu, along with drm_show_memory_stats() for the BOs.
> 
> The cores are identical, so they are reported as a single engine with
> drm-engine-capacity-npu set to rdev->max_cores, the number of core
> slots.
> 
> Document the keys in the rocket driver documentation.
> 
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> ---
>   Documentation/accel/rocket/index.rst  | 28 +++++++++++++++++++++++++++
>   Documentation/gpu/drm-usage-stats.rst |  1 +
>   drivers/accel/rocket/rocket_drv.c     | 21 +++++++++++++++++++-
>   3 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/accel/rocket/index.rst b/Documentation/accel/rocket/index.rst
> index 70f97bccf100..8ae785b65a53 100644
> --- a/Documentation/accel/rocket/index.rst
> +++ b/Documentation/accel/rocket/index.rst
> @@ -17,3 +17,31 @@ project.
>   Hardware currently supported:
>   
>   * RK3588
> +
> +.. _rocket-usage-stats:
> +
> +Rocket DRM client usage stats implementation
> +============================================
> +
> +The accel/rocket driver implements the DRM client usage stats specification as
> +documented in :ref:`drm-client-usage-stats`.
> +
> +The NPU cores are reported as a single engine, npu, with a capacity equal to the
> +number of cores. The time is summed over all cores and is accounted by the DRM
> +GPU scheduler, from when a job is handed to a core until its fence signals.
> +
> +Example of the output showing the implemented key value pairs:
> +
> +::
> +
> +        pos:	0
> +        flags:	02400002
> +        mnt_id:	33
> +        ino:	755
> +        drm-driver:	rocket
> +        drm-client-id:	263
> +        drm-engine-npu:	2384122043 ns
> +        drm-engine-capacity-npu:	3
> +        drm-total-memory:	24216 KiB
> +        drm-shared-memory:	0
> +        drm-active-memory:	3000 KiB
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 70b7cfcc194f..288764730d23 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -218,3 +218,4 @@ Driver specific implementations
>   * :ref:`panthor-usage-stats`
>   * :ref:`xe-usage-stats`
>   * :ref:`amdxdna-usage-stats`
> +* :ref:`rocket-usage-stats`
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
> index 5d7805c41dc3..351be60b1228 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -3,8 +3,10 @@
>   
>   #include <drm/drm_accel.h>
>   #include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
>   #include <drm/drm_gem.h>
>   #include <drm/drm_ioctl.h>
> +#include <drm/drm_print.h>
>   #include <drm/rocket_accel.h>
>   #include <linux/clk.h>
>   #include <linux/err.h>
> @@ -139,7 +141,23 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
>   	ROCKET_IOCTL(FINI_BO, fini_bo),
>   };
>   
> -DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> +static void rocket_show_fdinfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct rocket_device *rdev = to_rocket_device(file->minor->dev);
> +	struct rocket_file_priv *rocket_priv = file->driver_priv;
> +
> +	drm_printf(p, "drm-engine-npu:\t%llu ns\n",
> +		   drm_sched_entity_get_runtime(&rocket_priv->sched_entity));
> +	drm_printf(p, "drm-engine-capacity-npu:\t%u\n", rdev->max_cores);
> +
> +	drm_show_memory_stats(p, file);
> +}
> +
> +static const struct file_operations rocket_accel_driver_fops = {
> +	.owner = THIS_MODULE,
> +	DRM_ACCEL_FOPS,
> +	.show_fdinfo = drm_show_fdinfo,
> +};
>   
>   /*
>    * Rocket driver version:
> @@ -150,6 +168,7 @@ static const struct drm_driver rocket_drm_driver = {
>   	.open			= rocket_open,
>   	.postclose		= rocket_postclose,
>   	.gem_create_object	= rocket_gem_create_object,
> +	.show_fdinfo		= rocket_show_fdinfo,
>   	.ioctls			= rocket_drm_driver_ioctls,
>   	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
>   	.fops			= &rocket_accel_driver_fops,

Not knowing rocket, so on a glance, it looks good to me.

For the adherence to DRM fdinfo spec at least, which looks completely fine:

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

