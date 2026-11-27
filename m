Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776018;
	b=3NeXMHQZwCu6A7jwYPZE+ERC1IZTKxhKEQHs2axjZJ/yhJn+2d/0pV9a1rKw1hn3gTnw
	 HS9hkjO3H7ZduL9UkhLjMVRAgfDaTayXFC42SKEuV1keNf4k3YO7IVd9APZqxqCFJX1fB
	 /mbahknoRGOJDqVKCa4QsKQi5x2c74MMZXepxRWNdBxzYd9jyqLghBhShP+e+FfdQgs3V
	 +OUPOPUS/ZMMH0uPmXY8aBOJOcEzZFM0M95QaIw8gp2kpHMtULjdQOMUMNL4WcY2zbpH0
	 J7D+zi2EEiAsxwulHG+MrXWB/YXzmyDHf60gWAfOAZE3laRreV+585tHkn/NMXYBkPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=1AjK2nvlqvf8IJCDZeqJhDHtg4Ek4fFwEyf2Q1hpYQA=;
	b=Q+2bYM67ZepzYVqp9YvTiGuMuW31ZZSbQdVAZ0S3LCJ6iDLZXVVftJyEX09qxEf/vVEQ
	 bZDx2gGIZwGtIAr57AK7bTbtvo1AXJlNQOROX4Xcovbb+ZTK4zFEKHGq1CPRhpUH3Lurr
	 OXAszW8EUctkDqNsqEdRNMjJBn1ja44hIn6PluAfHf8nj8oR4MSTtPy0XL4hsz/0lclCy
	 CoV01hGErHcz+7WCOBwRkMNQIm3RN0JPYlu1/Xrplotzt4Bf9smGylTL0f2mB/LI/zGPb
	 xcoK+PsrOg1uhndQGmhDXMwvUDXC2RSGl5D7GSRhTd9akyqXLJGrV1X5dyfFPdcuV6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uVJJcr7e;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6AF606A329
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 10:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B6AF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uVJJcr7e
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so81055365e9.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 02:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795776016; x=1796380816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AjK2nvlqvf8IJCDZeqJhDHtg4Ek4fFwEyf2Q1hpYQA=;
        b=uVJJcr7enYHb7QW0rIHvPMSQildPszsaUSPXO3RI/alO6ZX+tsFbU1Mj46g3n4n7Ga
         mYYeS03YNTJrtg7VNmFl0QFjxZnyYmjb4JHPE7qMMYfjMXRMfnQplW4qEo1E5Hu2xNhR
         oAFO6Bfr72CZ6PeE7INPejVMeqqwpje9TWokX/AGhw/ldNSi7lPOQLtpav12D+kq2AT9
         IAzNpYhjj7QPJQy5tnI8aGL/Yb2VoGX86lSHCKSjJX5LdLqFxc3Qgtcy93AAwrOCKqoP
         7kkGpaQ9PpI64wmDHptaWxe2mEUD2YX96YHDDiaAahT/++rZmGMeI1F9wgppqI1HeSOZ
         DbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776016; x=1796380816;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1AjK2nvlqvf8IJCDZeqJhDHtg4Ek4fFwEyf2Q1hpYQA=;
        b=cFupuYuGoObH21GySooE/OVws39837cLoIOOGoextSHgFE8O2jhtslKeEfefL9dXGW
         oO9n2JB+NSiVR98msE5POXCovqANpGDDSqe37MvaStxnXuuA7g80nadoe0F4n3gHe+fD
         syK3PLcU57iyxKp0OrW0Ib8iDHGsCe4XtDV1E840Cyml10F98jq7YSQeDQ9lhyhov6Nx
         JEdw0nsuW/kMViLpEabRO3i0W2lPXfv6LDSan3favHE+g3l7W/5ti/4U5HKPM7WncJxG
         LTE/3tpl1K6o+WJQryszGEkgEF0D5HUO4lwftt7BkBZCRKfljJtHdD93lpkpVsbNbS0A
         AztA==
X-Forwarded-Encrypted: i=1; AL+hErEqaiFoG94iOsTHmlz+DddMhwsnD0KYIWIfNSypFjTJIbB6Zowf2/Dm8eyVGLFNfWs/2Wd/cRt63/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r0HkYy4FfxgpUFcW+eNNmOpYYTciL6aFpk76fo5+WB5fwJw/Q
	mlfjLUSBxFrwQ1uXrcSZrMTGKQRZx8bXsUENlFR8PlaDaK01yK6HqI/n
X-Gm-Gg: AZFdTZdephYaLqFYiSpgZlGjY9sA6rlLUoO/ixfi/98D1H4WV8lK062kuObTyNuzHNO
	ZRLesdrRgsAPKFz5E53lzNubPn5qpxSJWK1Rg2HYOUNMy06c5b3hMivQg/v/WRlJ7jc8bAY3/dW
	U5Ozn1CpDlB6hWs/+DEtOVTinzPskCzQB9z2AsZpjjXURo1Be5VUQA7soSJDKtPny1x/QhqU1SB
	cOQHRU5aDTxSPDB58Cxr+dN7NVPSgvOa7eGp81ZwsuweVTtIYpGO8RC5Xg2B9aitB6RbbtlPcTG
	bG2tS0SKowaTReSub3ZH3+Adq4BYDA96Ih1yhg3TWN71PTwodPpEu+9npwrcPZM6HK2mreIf0mF
	m+XsNoXhKgFHTWZBRfqBUV1vr8X9l/HPnypDnHxVwfHl4irJyBYAgZT2BzfLZC5cXgWHqK/eCm4
	dhtNdcEiubDKVpjH4b8toiJ7LxKqWIRDV1XUJ7jYQ53MRmnQumhp1bmKTosQRjbor6nO9m3ue9E
	CEYOenTJOyrs1U2QZIbVdWNhmAYMpNy7CO7LHPeBhuz5m1lJ8H3ARc9l0Y9kP/V9F1cLu36QjQz
	h2bQeWD6Y07dQZmUWeMFZ3VRK17j5E4=
X-Received: by 2002:a05:600c:4584:b0:4bb:6c71:b269 with SMTP id 5b1f17b1804b1-4bb8881fbd2mr479775985e9.28.1795776016441;
        Fri, 27 Nov 2026 02:40:16 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm46259273f8f.4.2026.11.27.02.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:15 -0800 (PST)
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
Subject: Re: [PATCH v7 15/43] drm/vkms: Explicitly display plane type
Date: Fri, 27 Nov 2026 11:40:01 +0100
Message-ID: <awld6GvGP5acwJxu@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-15-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-15-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:28:58PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so use full name instead
> of values.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index c5d90f7e934a..e933d61cb526 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -388,8 +388,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  		vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
>  			seq_puts(m, "plane:\n");
> -			seq_printf(m, "\ttype=%d\n",
> -				   vkms_config_plane_get_type(plane_cfg));
> +			seq_printf(m, "\ttype=%s\n",
> +				   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
>  		}
>  
>  		vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
