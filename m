Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441189;
	b=qL4gyTnX06YI8/P9X+rOx3qdpY36StvuD48P6emGAyx3mYkm41koEufAtqgQdxmV1ikS
	 a04tb9GI36gH6fcTwAt1P9AkKDiCbh6hcjw2FZW9bxp/taWdqd5mOTr4MTeoCAe1S39gQ
	 UiVCE+Dpc84VLcnr05iyEA0dqvc5zeQnkFe+4S3aWiWBE6zPLNEclDyNH7Uqy7WqcKjDj
	 xWDJX8RBsNUBpG/uSPAeVg9O5htq65l624F+Ia9TMgM0oM1vxLfWUZapCJDFo4nmifyW8
	 D+JHfWCJzY7cqtPyO0aTA+sXa0BnvyHbMasbqimi6+F2XuUs4ZrvDU2fChMzUmtj9lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=bAL0t2TGrbFIeMgy/8ZLqGke+0HtmGCWss+5lXHsJKU=;
	b=wJuoFwnTfyVvcpuzAf9Pfe9axI7ztRVa2iAOyWTktOM/EWCyfWfGeifyz3hF7pB9jASI
	 tilw+UX+CHoihqaZWZqLobKrvgP7RFwRBfSiLZA2m/5VZmohvm4ikHwXxxze7IFAEL0Np
	 jtKBQ0u6eOYKKEW4ERUJqDBvPkbHwRwHCrWsZ8hcTMleAO4B56ABdSh7SeBf2gw6E0Xm5
	 EeUPYyr1rujjol73gT92GxCOCor0BQ1S1ZB34XVGsOmwJorwRP+2yZ5rZI8iZnEVUe7nq
	 3VJuUT+317YQWtL3k7rRYqldkHWdPl44/gHltn5mn5rmDwu9UGaZnKjSTSd6KZRV80g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D/rZn9iL";
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D4606A33C
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 13:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3D4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D/rZn9iL
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so3588903a12.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 05:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441186; x=1796045986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAL0t2TGrbFIeMgy/8ZLqGke+0HtmGCWss+5lXHsJKU=;
        b=D/rZn9iL7SvQLhKaIC13oOloWU3T6jk/laV5o+SF2tzXaGFCYDNQlE7/NaEDs8iqf1
         7dYSobf+5CdcDfZ3xvm9tSKC4KgUWrVziU+kTiDtrWQjrmYF/GKeT+2ZDfW+rB3o8WKI
         gujciW2akjcBxGAziH9CZjbxLR4QVaZbqDsgeNRBkyMeM3dGJIBcAiTYq/18t0oGOWs4
         5Hl86Te9ihOqZ2ZYukXC+8PnVdMvPPlSZAmxhYPl17D96Hp1hxESJ8Xc8YhVeqd6yRiC
         cxRINzCUB/qzQj5e4OyivB608aFwCvhWSzEKLeAmafS9S9gTYZZr5QoFOO12KO3RgA5P
         DN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441187; x=1796045987;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bAL0t2TGrbFIeMgy/8ZLqGke+0HtmGCWss+5lXHsJKU=;
        b=JQArtqSn0kqLwuVN1kMHaisB2ts2QTo4WwBGD+tSDd9+3IpnxKruU2wil9oo0LgnTl
         /Gm6cPTL4KScsV2JWDdy+H/C7S680cRj5Pb7R7QegHC8FFlBtiU+zO56hxiwvZZFxD9c
         w4Ec5jKhV+DEyxYWuPJN2eSA2PGpP+MrBehvAeMiYFnDccQDcBGDdQ5p8d8WOTQtkbbz
         BP7hdm1zkarTg+9W26zhQiZe1WOGx5c9pxLszBWNQOFlna8+wzVoxqBpo8vVtHwEE475
         zvTQ+gnh4VqMKMB7pyBIAekmRviPK09v7kcHD/CSMVvtdXhzmqAzrbGTpWu5UMpfppaI
         qVaw==
X-Forwarded-Encrypted: i=1; AL+hErEbDt/zMRW3GFMJbwvEm0+xuTePgBtpOBiZ1Nc94coYO6veEXtTWuL9mdpNuiutO7d9e9ELCBPyQfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pe5WHvumHbSZBs+d0mdKSfbRTv9WIvQ/iZ5rP+z8iucPQjHKg
	ao0f5afyvCZb6txuXwzMppqUclBe+U26N8Ppwm4KSTNayVXz5ifUE9Dg
X-Gm-Gg: AZFdTZfHZuYLrAjtXnUdHhjjiYf/5YGqkzbxiU/DXAoiSwIQX+QJju4Hg3Rl+lh4Lf+
	8u9FNXhMmwm2aCtQEnlMszWBwIb1wIv3dmJQ5S9OLkMMZY+cV+yl7W68QhIQNuBPq0yQtINCARs
	QlpSJX02zvxUw9SgsXkUyWvwqat3zO6GmjVY3vId51DmHY7aOHAOiXw+2Zvl6Cri6lThXaZRlta
	g9Y/POPLoSTNzq3KY5KS7ax7ELhMz92KLIWusRyCWFcdvakD2iUf+hlML9cPsyBSjIXl2X0Nq2n
	nax2QOLowiB+TC5PE45e3b1Bx5C2DLRJfsCM0g4UDtBptWs/sWoUieib9zixA4z6QoOqmNib1tI
	5UUCY4gtRqJhD50LjhGrLzux91/bSKy6phZayCZnkeWE1PzN1JZz5WdYxMDz3dMitKY2meYIY2b
	0FZnNVH+dDpwuiBN2QW0RPNMyzR15aubKUScXA9asJm7FriUTsr27PnIGTGX3K9i2JrYKLGQMN9
	Oi/YuiZ6JXB4hqU9IYAg8fMY6zOSvkdVXfCZajsTjJk/caz0Bhi0CZJg5gDx3ACVAD5NfZCWZ4H
	3ABbqSWCSN9FtLNSsnvmi7SOF9WMlUdMXLC0kM/KgfczcmsyprH2+j0=
X-Received: by 2002:aa7:d351:0:b0:6b4:86e1:cc67 with SMTP id 4fb4d7f45d1cf-6ba37ea0b91mr5687764a12.27.1795441186526;
        Mon, 23 Nov 2026 05:39:46 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm5212663a12.3.2026.11.23.05.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:39:45 -0800 (PST)
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
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito@redhat.com>
Subject: Re: [PATCH v6 17/43] drm/vkms: Use enabled/disabled instead of 1/0 for debug
Date: Mon, 23 Nov 2026 14:39:25 +0100
Message-ID: <awRBxApeQdS0tPZn@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-17-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-17-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:59PM +0100, Louis Chauvet wrote:
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
> index 44ded8a86a6e..4127fb176a87 100644
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
> @@ -397,8 +398,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
>  		seq_puts(m, "crtc:\n");
> -		seq_printf(m, "\twriteback=%d\n",
> -			   vkms_config_crtc_get_writeback(crtc_cfg));
> +		seq_printf(m, "\twriteback=%s\n",
> +			   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
>  	}
>  
>  	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
> 
> -- 
> 2.56.0
>

Reviewed-by Oarora Etimis <oaroraetimis@gmail.com>
