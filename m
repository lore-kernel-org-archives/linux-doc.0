Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776084;
	b=QI6szQMmaJjva845poC0elNPzmJ9HGc0SRnVr9+e6Bflj+yiNzR2+9tVJatrqIG/kLIP
	 +hfGT0JiMqD9UKVsbRBvpiu92e7zbowlxIvK/L9veF7Rwwyuva+cUcs69UxsyM4w9MqHZ
	 0efHa7Sr7n1aqVpdyA/YQruMUktGAeI2my4B+4CCCvYXUyQ5Px7cbZYQNktG7AQg1bdI5
	 fqQhUoSTZS4P4yJ9vKsMPVk41CZIPBzf6hRvIro610exP+gSjeMjRlamoG6+sctJmrzK2
	 o3JuugXs+bXoCstONInlk8qsim9iopl4EAJII3JlA4GfY66VWCXCeVGgjBAAhgGBazQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=OE3iaTdUoerIU9O/A0rtQ8dKzE06q6SN9k4omG/eVuE=;
	b=BKnO/oCAnHXgfF4Diptf3ToUotx2YkwKE7Y/QBSzs1CorX5Cgv9oeDyWPdhfxbqQ78IS
	 Y/sJtw+0bQ6ycICJqrSrdEshV5FjXV2BhgofnzFs71tg1Q5jRRwNJTMlQs+1VhOIq9hYk
	 GLcv9f8c9oKR/xeFBRVHEcQXSdt6o5TwiJEVB22XalBM2lPN1SekpbARo1tsU+G+GzGgM
	 qSIsVD8yABezc4laG7Wa2weomsdISphkSnvN/hnlgX1ajgXQ29Qldip3fOWVqMZNem24D
	 Ke9F7CtNAjWzPsF6a/hhiD7jTh31/0KeQbx7i5v0HQEpbtj7cUutwvGlprisOCgcnxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AcJ6OlZO;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B1E606A323
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 10:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B1E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AcJ6OlZO
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so64329045e9.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 02:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795776083; x=1796380883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OE3iaTdUoerIU9O/A0rtQ8dKzE06q6SN9k4omG/eVuE=;
        b=AcJ6OlZOCKEvuF5GrN5ji1kmp4WCXfIfuq5PaOd5dkq13PgW+ncjRueFD0QvMYsXRo
         QL5B83IWk0aChQzJDm0Xds+hKA8ewlH9mC8k0axkYwKTAHpklXcgrI9zhT1XUd5vhGTc
         3JQjhO/jZCv414m/e+RhHTr04S/eyTTnycYCt4Tb1lBk+azME+3WpRklO/KeXYutv8GL
         M2Hdsw/0+gPS3aAMuh9oZ/1rtCJZIizIUJGDkv6IOuQEG3Rx2Gj7Jmxn0oFMRGyrY0ZI
         daYL5fetQ2NwNXxYlThlt5395/waKfz05usXL9x3YB9N4vI5m76MrqTYLgdkPpIDSEbj
         N1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776083; x=1796380883;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OE3iaTdUoerIU9O/A0rtQ8dKzE06q6SN9k4omG/eVuE=;
        b=X0VPqIJlNKK2R0tyJVMyRkLsHFj4eoJQwbYJHWKSLrqEMsOiOxHLTXE9U7JpgemBF+
         KZoKb+93UFWeufgsUOp0r/8aDrcIKNQPl6YYCK3AgWVIuM1EdFwUUEFn2fcA2muweZmm
         W4ed2xaK472rfLXNKMWpmM5s+hVNPF4Ks1zoDiKJhzH5JvzZvs2NrHUMTewJdLF2JFc+
         BtGwXlzSc4RfkhQDrFbTDktJD5qq0sV+4x3sTKINAy37i7SyExJLwVO1Ile7r7M8Yh3V
         ffQR9fJgpcjiSlMEN6j9UGl5krBGr75fMjmZNzKnHngp4Wv0UnkoABskyl/0urAIxdP+
         tHQw==
X-Forwarded-Encrypted: i=1; AL+hErHAOSi4MIAspvitS1cJfyhbZGqPBKxdUV2So+YUNvV9nCeidg0TXQkte47zKbf5gy8VSj4qFc5+/s0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m9+Ltw919I2HH1VlQRdZxTr9/8i19IOQHlVPrPrpbUvelNURm
	vGNLESaBe3k6qEmAZ1JZ18x7HYfFE2y2dD+sZWFKinm1ixJFBPqmB2V3
X-Gm-Gg: AZFdTZcmoLSMiECM1/KDL2OTe7KyyJhLrLspMmUB4qqbDo7lS4XWud/c5uSoYAOlp9V
	wWJu24ZxON/4FyCpMKPhjpibrYt11zKbPg2w51sgDjVdnJUdhNnXk5tsbufJXXiyzD7bzLi9ZTM
	uftRg+NCnrat53kWcJKbaU83kwwnLvlPoQO1Fg2zNRYf8kDHdJLNVfAnG+wscSlscKN5VUejLVq
	U/iQmDwcNX2iYzO38OnigbaylGpdJxQIgJrlFUvzaI/eMhDuHq+cXguUfM1FzLvEMvnZa+u0ZcW
	1uLEDobAjKRVxJcve317mcoWK1+rjKBxS1T+aaZzlLbKcEMszMeqdjMlEXmWaFKHNvZVpWUZ/iD
	o6xjKaJ0fDpHHLBXwdWCRlVRzQYXYbd10vs1kywmgkNjKBXB1H9LL7UT/uSa3Z/z3XnrSqU1l06
	3S2c7i0i+g+N7QstpXJrJTbRYywcOnq/f84y4Zf7D2VsxESBHDIpFWVZSTExnNUOePcMzsdIyzK
	EiTG7cL/GqeD8tAqeppFkTGT7sc0yQDcAzgZoOnpri5MQIgurECYMT2l7huTg5ytSaTmbN997mW
	JLcf/TLoGZ7J6IFYYKgeu9D6f/GGhew=
X-Received: by 2002:a05:600c:848d:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb88811da9mr501158075e9.13.1795776082653;
        Fri, 27 Nov 2026 02:41:22 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm797348905e9.11.2026.11.27.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:41:22 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito@redhat.com>
Subject: Re: [PATCH v7 16/43] drm/vkms: Use enabled/disabled instead of 1/0 for debug
Date: Fri, 27 Nov 2026 11:41:08 +0100
Message-ID: <awleOdfY9e_UnwVF@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-16-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-16-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:28:59PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so display human
> readable values.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index e933d61cb526..e2b656723898 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  
>  #include <drm/drm_connector.h>
>  #include <drm/drm_print.h>
> @@ -394,8 +395,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  		vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
>  			seq_puts(m, "crtc:\n");
> -			seq_printf(m, "\twriteback=%d\n",
> -				   vkms_config_crtc_get_writeback(crtc_cfg));
> +			seq_printf(m, "\twriteback=%s\n",
> +				   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
>  		}
>  
>  		vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
