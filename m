Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795258647;
	b=l4AMJ1D8UvY8E/Wk/wKy+BCCoxl2IvNtPvF7Wi3E1QBai0DVLrchvUnrdqyccg7H5n7x
	 A5X+AHWZ8Th7MbaC6TGSZNwd1V5h8wynQocT0SGJ9PjWYVc+vaWBcv4oxMm2ftkUg8zkO
	 mqpbaE2Jen6iefI+P+P38Gl1eHtjb+KzG+6aVAgWvnqlpp9ZGuSUKkVrhHQVy8sDTWchx
	 nI1Pkf2wKFh+na5TF+QPK3TeyYiSkDiJJbWNFvnKrI5splpBJS1GoaqvPfuqowZ6Ooh8+
	 xRI14WNrIynKt6AXTxh1LuxZyKwucPqTFTH4O2DNvs5Jx+Rt0yk3IAAV60EJkOl5syw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795258647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s6L/5zARcCLel44kQYhmt6hmNx9yE54W+X6j7p6+kLI=;
	b=uu5ZokGcGdmjbutet61TmV+8VOfThnA39mC+7arfwEZQ+Q2Wo+zoMn+3N4pWPM7rysEN
	 ZQV0IVANYhPEae9ttxR7GGdal1lM1s5N8n4m/xTaoIf41bk10gZbLhfacUlFUQ+vcWoNI
	 7mXjDkzUjE3FWMXIF1lyna11UjBt/sGKWIcKBfpk7wweLoVIlaXTAzTpU5rNke6fZj5jZ
	 HscgFG5RKxApQcObBhI41k9PcSLNklmYbPrCdBjuazsLOz8TLCIwHxqE1Gt3qcJC61udZ
	 X5wY03eGlaZA7NoOdAUMscmSy9vLRMYOAo+bM42mqYKIcDZYoxU8hqPekqX//tEPmcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dl1K5RFT;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCF2606A32C
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 10:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCF2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dl1K5RFT
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so16171755e9.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 02:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795258645; x=1795863445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s6L/5zARcCLel44kQYhmt6hmNx9yE54W+X6j7p6+kLI=;
        b=dl1K5RFTCSe2kAPnf5pSeGyQbRBAIKoZLylyiET1vIjPURjry+i4R8z6hmiWzV/b6+
         MXekc+U7RQ31imRzbp/I0Uk5+J+mVsB9KgpJi5OUXgtiC40DzTCDf08Da8uukxfD3jnX
         3SZad2lG6jKlvCeC/gDmPMjeE9GgjccOx70vlXLeZtRLgKI1S3mMKVJhUdvMuYCY1+Ki
         EcmsEtPYVEcpdcSW96BA5oUv717CfBr7kPCRtv7dzD1ocl63y9r5Wu+Z8B0FtWeboPR3
         bvGsXa8dIOO9UE0etq5yCqqaO9buv/PPgSrDIx/H5rCCmOmLTNSFVifDq7Nc4wfznRrF
         2zTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795258645; x=1795863445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6L/5zARcCLel44kQYhmt6hmNx9yE54W+X6j7p6+kLI=;
        b=PWIH2O6oA+N2J4KTCdIJZYQfSISAiglv+Gwa5/BcKJ5xbgmrakUk72d/QiU1C9Zn81
         WerbgU8UX1mCzLGWBr7Kx0iJYBiMaN/OhYNa2b1ufiMGEQUTq9CDNHMk2qkwAexhY997
         JvJsUXCCx6JfSIVBOzz7bYXNl2bAgJLeC77P+zyAV0BblWM730XP+YLnL2ItRdIipMB8
         f0kpUHtHVMhJiIhbqje0AiAEYygSpk8sPJGgCx5pAQ/dPVYc2SYPVspvwAOl9InedutQ
         97TU/mQzja9YMVu17r+QABjHI8r+wTb9gIb+8uRhGRBOYCDqq5518PG3e4bCpNwTQFOA
         Pddg==
X-Forwarded-Encrypted: i=1; AL+hErH1uYSkAhvhzl7mzS9rHlD/mun2KSpimktDNYijtG5VOiU43weBuQsFCSWWgqL09LA+gt6i8lA6MTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xYbWstRojrsyU34Ln1ZAbtmcZYW9mG/hk9i8fN/ystLpNTu6J
	oZ4sMh5AzOW319WGKa75sWUnIYZ88Wvyt54ic/EEJ3ElxH0rZeXXZ/zq
X-Gm-Gg: AZFdTZf0l+hw+NPmlSufo4T1XzfWBx/Z1ltDR/mLJdL/uUML8RVq7PmQsMf7eh4oa9d
	hgG6YeGYr6HDEiJgsLJP2SdCGwvhiC+mfWfFONJUeQmyeG/Pqq9IgLtjE9dGuJhQPTm2U49/zG+
	u7A0BoqgO21gDdTZncJGmdcvEjbZxKnufJKmPiLW4Shf2AjmAUNNsa/qWB7XPtEDeIsVpvJmnjG
	IgMgiiXEFoZtm2ffSFq3Xd5qVseLdF1Offe9byakw/aSwSRHBRh87i7ZbblA1++d46E/JQesndS
	l865UDfI2AHnnJ9TvPenpSqb1cPysUAoh1q3WHtJTxvTD1OHsFrvhoRzD5uv3GYa/PzFYUl7ChW
	wF9GSG90AdiaFG4kRBrhyfkyvQkWbz+JTMA3uHfWAHQJ7DIY8r6H56DRvhk48dWfk+ZpFH/pDdE
	9ZLfAZjngSjcGrea+LLJoMmMblvWssMGiPCSkem/Yzbl6kje2CxyJynkXwzmKOmpWbQvTMjSaCS
	r255+eR3KwfuYKHr4nWlsxmQRD5DvTMfVyTqIHM6nD2XDoFKcxST00ESFH+LyiH3LANSi4No4Ma
	ooZrj0J7yN+5d+W95sw6V/0XfWE61Be/UFCPFvi0CThLZhE7CfFyJCLfYGsM5fuBuihxMlH/MTK
	Ncfs=
X-Received: by 2002:a05:600c:46cc:b0:4bb:69b3:2b42 with SMTP id 5b1f17b1804b1-4bb888277b3mr133199515e9.16.1795258645328;
        Sat, 21 Nov 2026 02:57:25 -0800 (PST)
Received: from ?IPV6:240e:47e:5028:61b2:a372:4c2:dce1:98eb? ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm163775135e9.7.2026.11.21.02.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 02:57:24 -0800 (PST)
Message-ID: <9b43c3b6-02aa-498a-9287-b1c9d9027460@gmail.com>
Date: Sat, 21 Nov 2026 11:57:09 +0100
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
Subject: Re: [PATCH v6 01/43] drm/vkms: Explicitly display connector status
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, Harry Wentland <harry.wentland@amd.com>,
 Lucas De Marchi <demarchi@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com,
 victoria@system76.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>,
 llvm@lists.linux.dev, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito@redhat.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
 <20261120-vkms-all-config-v6-1-78ace90f4fc1@bootlin.com>
Content-Language: en-US
From: Oarora Etimis <oaroraetimis@gmail.com>
In-Reply-To: <20261120-vkms-all-config-v6-1-78ace90f4fc1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/20/26 6:58 PM, Louis Chauvet wrote:
> Debug information are mainly read by human, so use full name instead
> of raw values for connector status.
>
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_config.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 5a654d6dead8..48c60930302f 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -2,6 +2,7 @@
>   
>   #include <linux/slab.h>
>   
> +#include <drm/drm_connector.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_debugfs.h>
>   #include <kunit/visibility.h>
> @@ -367,8 +368,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
>   
>   	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
>   		seq_puts(m, "connector:\n");
> -		seq_printf(m, "\tstatus=%d\n",
> -			   vkms_config_connector_get_status(connector_cfg));
> +		seq_printf(m, "\tstatus=%s\n",
> +			   drm_get_connector_status_name(
> +				   vkms_config_connector_get_status(connector_cfg)));
>   	}
>   
>   	return 0;
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
