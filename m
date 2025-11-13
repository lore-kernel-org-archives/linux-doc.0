Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AE22264C7
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763042956; cv=none; b=BrLCKwG9i8p2OSZfLpc2DycP92SxmI95p5cIXlQgUFs0LFclfr7Z9zr3fQNVPQPsyIxSV8iRrGEYZNPKSghXVNmBsEazKXTOqGA3laWlS8+Q3ro2wLVXbk8/eTfwyR8gqTMDb8svwu5H3WHuCHDtbgclFITH42ZLp1qejL5OPlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763042956; c=relaxed/simple;
	bh=anqFmjUhwQ8vKV8G0qJTF8NCUXoKhfPHmhdWO0N20WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5KhffKF7i5Dc4cpJZ7DEt1HWRFUstROHexb8La4JMPzhCsPo0Ty9/Zpl8oBmV0kRdlakuzx/iUU+0NzNIWxgvU16FpU3gc+a/UAnNLE8sPL5P3TaJPsTKK/diaDDoiPTMjSMMM4Gj8EA1cRgPJyidFZa2FeWqRgObQh4XKo40g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ildeHDei; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ildeHDei"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso6466065e9.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 06:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763042953; x=1763647753; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TZyGvcYiCgEWiRpNWtQD8KconPlU7M6IpPd18MQ9pr0=;
        b=ildeHDeiBZoX0Nw/Yh9YiGyRz4Rf54WijsLytAhzO4FWMUB85xU/Oaxd1qbE6NSzpE
         uM9iGti9crChBEN0vFu6JYfFnLqZ09nnIlMkZ1pRT4QO1/kMsAmO4Ea9FTSyH4sSLuZx
         Zd+aXn2YeFag1Tjw1weTM4KYCbo5bTftnBT+OPQhqPuJXiDRjEQDimRdI9fExC/FDwh/
         OY3gm5OX/Q6RrbHezREd5T/eTHVz4Do4yATYqMSIipR6tndp3hMydmjo+fWRuab/Ol83
         11AyOzRdAa7BEpYNrTRZc1nGo85MXqrqx1G5NAU6VAzqmUhvnOPdpyQg/DCPTn37+fcE
         SFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763042953; x=1763647753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZyGvcYiCgEWiRpNWtQD8KconPlU7M6IpPd18MQ9pr0=;
        b=Sh+4dEevpTjdAdX+WCZs7669N4suQbMvO6YBkDifSV7l/zmSEh2d+XxTDxDJG+U8Vv
         vYRVWqdzsiNY2RYg5ViPZLjHrJoLPWL46kOh3xteY9ecR6eDSrSvLdzXwZivdx3m8k3+
         tPrqL18LEgzsIqd6o+OX1MWQOe77XNq5lvLq75G1IpTrQ/t6sLfO4CRAhCiQucrywHBa
         6ezOEp6u89N6MS/DA7eqCGga5gduStmnT2SMT3m2Ji5Ae5hhBEYL1guBDW7XfLSvPr2p
         ZMgavXpMZB7J7YZmc67SL2O+sqaWaXe3Wtn6bwHjnI20d0MtWG8KcesR8Qv42GV61YRn
         lC2A==
X-Forwarded-Encrypted: i=1; AJvYcCVpFW2qQGKdzJq3JHFNAKr97n+8GGeY063PFIO9XVio8/t0HcrkhjXZDOZTAp1OuhX1EftEu3guL88=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPeYk1PeiSrSi+IzmZyS2ME4Rt1QyJOuRE4XKPL32joNT0SoOU
	ROM9MJYAHX5rREJ967RWoMAOqIkDFRiP1hEkXAoFLI2SDlRfXA0lLzLY
X-Gm-Gg: ASbGnctjrMNpehpqNpljih+qCtLd9IqBey35IWn/6ykMh53esRbPrCTmHHN0tJbVw/N
	z8HQods/Z82RHZ/bTx5COu0UTlCt8ZpW+GvOt+tHy79L8Ffenuy9aGSFqL+EDvBbwes0GP0XvRT
	KtTBVCuwFnkn+sYnO/5mWMOidKWJ+EkrBs2vpsXMdxQ3vQypsOcEuUTwZGRsgDJf5XHB6kBJg3o
	1e15yScwRV59qfgT9jn7S1IONVrPNqpyvwkMaMa2tMHnqfKwkpnnT4/zQuJlTQzZs8u/NLIBp8W
	tbM4HB3MxgSoBczdIdC5HogOoyQnkQJPchQ+S208zzuJaIJWj2m+PfcWnM+GNi1dnkNZJiIIo5D
	nfXt/tfXweU6G1rWf9uWCMfxgEe39ZRu1ylyLgawq8FPc3SV55si8obNwmhza9i0jfyESgZSe7w
	==
X-Google-Smtp-Source: AGHT+IFeNfJ1eyONHrbz+WXHARO/AJILEljcspBbpTWg7b7/P997IAGWloWsSUmV91qlQ+SipQ99TA==
X-Received: by 2002:a05:6000:1788:b0:429:bc56:cd37 with SMTP id ffacd0b85a97d-42b4bb74cc7mr4917562f8f.6.1763042953261;
        Thu, 13 Nov 2025 06:09:13 -0800 (PST)
Received: from fedora ([94.73.38.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b14bsm3981192f8f.9.2025.11.13.06.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:09:08 -0800 (PST)
Date: Thu, 13 Nov 2025 15:09:06 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	victoria@system76.com, sebastian.wick@redhat.com,
	thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RESEND v2 03/32] drm/vkms: Use enabled/disabled instead
 of 1/0 for debug
Message-ID: <aRXmghF0m0ypbQMs@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-3-a49a2d4cba26@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029-vkms-all-config-v2-3-a49a2d4cba26@bootlin.com>

On Wed, Oct 29, 2025 at 03:36:40PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so display human
> readable values.

Today I learned. I wasn't aware of those helpers, nice!

Reviewed-by: José Expósito <jose.exposito@redhat.com>

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index cfdd5f32f234..391794d391c5 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  
>  #include <drm/drm_print.h>
>  #include <drm/drm_debugfs.h>
> @@ -354,8 +355,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
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
> 2.51.0
> 
