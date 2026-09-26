Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AE8286425
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 20:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790454647; cv=none; b=G3gYC01M/QrbEG8HwR3SzjsBHxfWX8y3GHwUGrF2D9LRHRuvXk7AFolYOSVp1Pq0Ll3al+twNRMzMOgeck5CoDTXA6I2SUTXPFQY1SpQ/qNmPmeyHx8xCb62plSGwmNPugHncGmYwXlGWds8UOmRKMGCqSyzhj5X4hwnh9Ut2+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790454647; c=relaxed/simple;
	bh=z9jMUG55HtxWkLl+HhAWppHqiNUvDp2n8qmnfb3C/VE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ly5u2iqKsbjex6pXXljnwV4XMYYzeLgXhvAWpUfnkv9hK8yah2RAfMCe9GcebFfGQM3pAPjURnwJ6U6zPAp6TiMrjB/+f3wFXTyxX3oFJ7J8K7JTBeUixsdvaD1bgTGubN8hMNGe2mzr9G5YL6p73EoZm5Lwu3C+PemTnR4XSew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=T49ASOQH; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="T49ASOQH"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id B0C62BE0F5
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 23:22:31 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 3D146BE405
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 23:22:31 +0300 (EEST)
Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 953E51FF2E7
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 23:22:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790454150;
	bh=7UncYzXhWq4TBr27aqXftzhgIR88dvJWApzZd7nrD5s=;
	h=Received:From:Subject:To;
	b=T49ASOQH44WMRJ7WVmkZ5OLOyqaGzBhH0ZSAKfLCeON2C0yyQTy3xRh+i3npE06hy
	 TnITWaSwqKZKmiDbKsHznJFjPq9NcFxX4J7Oa1JyJSEG8UVUOVoyVUGbiLOB72T8Dg
	 5aeZguvsAqkYS57LOfIB7XxdjhmDcFf3wDiKcT4mjJlXZELupw8SmC9oSsaaBhTE93
	 MCpYSPpwaWS4uEa0MvtNoXvVChOTKYCoCwNKyjoUb1kCmDhNQAaDMqF6YKTLHUL7eQ
	 hSZhK0L3Vrc4bect96vYyEUixwEyfXJLeAvJ4spCzLMIpC+8sgb2enLwfx2gkotsvy
	 AlEdLcBlpR6Hw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.227.168) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj2-f40.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj2-f40.google.com with SMTP id
 98e67ed59e1d1-3a0df0bb2d6so405368a91.3
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 13:22:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzDIgh4dwtDfh2KyWLFPov4enci60NHmhrbBX5CMu2wo71i8xAk2o75qWgBuyjfE9cmOi2fA5LJKf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWW4GT1F6nOH7qirASSTtw2oHLDFrlEnNd6v+mAYnPp253yg9C
	y5DwayjX892uvRNr8eJrl3gbVg9MMwcnOkJ5k8lFpKvzEWG97SfGRX9RBC2638z6xp4UIc4mwvo
	z3ZtkKWcxZSJiaFeWL7diEJm8WtzuxHk=
X-Received: by 2002:a17:90b:5847:b0:3a0:b40d:827 with SMTP id
 98e67ed59e1d1-3a0b40d1ebamr5438590a91.0.1790454148933; Sat, 26 Sep 2026
 13:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>
In-Reply-To: <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 26 Sep 2026 22:22:17 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGiM=OGp9T=4B0VouHYU4ZZVAFTN0u8ThE82xzO-_V1aA@mail.gmail.com>
X-Gm-Features: AclHuK-2w66LiASkiFvCoMQDD08ofVnCMYU_6argHvoEzG0TF-dHbuwt5hJDS2w
Message-ID: 
 <CAGwozwGiM=OGp9T=4B0VouHYU4ZZVAFTN0u8ThE82xzO-_V1aA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hwmon: (gpd-fan) Reset both fans to automatic on
 duo boards
To: alexei.solcanu@pm.me
Cc: Guenter Roeck <linux@roeck-us.net>,
 Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179045415084.517408.796811352859907575@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 26 Sept 2026 at 22:12, Alexei Solcanu via B4 Relay
<devnull+alexei.solcanu.pm.me@kernel.org> wrote:
>
> From: Alexei Solcanu <alexei.solcanu@pm.me>
>
> On boards using gpd_duo_drvdata (GPD Duo, GPD Win 5), writing
> pwm1_enable=2 only returns the first fan to EC control. The second fan
> keeps its last manual duty cycle, e.g. full speed after pwm1=255, so a
> fan control tool that exits leaves it running at that speed.
>
> gpd_duo_write_pwm() writes both fan registers (pwm_write and
> pwm_write + 1), but switching to automatic only clears pwm_write.
> Also clear pwm_write + 1, so both fans return to EC control.
>
> Tested on a GPD Win 5 (G1618-05). Not tested on the GPD Duo.

We expect the Win Max 3 to release with the same register layout. Can
you verify it has two fans? If yes this is good to go.

I will try to pull this patch for testing. Second one will take a bit
longer because it needs (my) userspace changes.

Thanks,
Antheas

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Assisted-by: LLM
> Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>
> ---
>  drivers/hwmon/gpd-fan.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index ed212615b2f..b3b75f99f58 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -444,6 +444,7 @@ static void gpd_duo_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABL
>                 break;
>         case AUTOMATIC:
>                 gpd_ecram_write(data->drvdata, data->drvdata->pwm_write, 0);
> +               gpd_ecram_write(data->drvdata, data->drvdata->pwm_write + 1, 0);
>                 break;
>         }
>  }
>
> --
> 2.55.0
>
>
>

