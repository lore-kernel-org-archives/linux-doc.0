Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528415;
	b=CWRB/3/3LT7FoxB9XLC+vaSvJp1sCv1dt1mGPvkMKKm8rCYkDniopGevKX+SgG4tSqql
	 bH6q8NUzHkV6WHEGnZ/yZTLcehS/ktfH6WoHl6YOgXS8vvIqbDhdSHLBamQOkZhmyzmkR
	 sxPxtUdoVMPkEiLW0Pcxxvyk+go6OXoc9jtlLPcN23lGH+yfQQPJnZPETkPWN4sSyZYSG
	 drAFMUlFFFgmCSsllUcGsrRTes7e1rLTMkp0hYNNqLtiiJAMxZcTJ7rEDEjweVLbsiwov
	 eYcMd93RzpvefyPc3u/xbmkZQnJJEJ6+lgR1QELSO4wLaaBHWOhRnytm/ufkIXFpmhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=q6JmaR/skCNhplZj+MXI58e71T+5r4bXzYFahMOHLqU=;
	b=L0RwRKOjZwmom8tGxScoIDamnfeBJ3iiSkmpX/xPTYEgbondtUMngfurU33GXJDJcTGX
	 UuqwSQtXb2kn+pVPvxsdsT7jQilKkBw/0yMo0LdWLT9tVhLMDx3XhzgIum4iPNQxGjTLm
	 sLe9wsTBPWwzqrjssI1WoUE369kYFu5L1PMeDV8/uKHF316gG4r5mLT3WPUP1awHid7GM
	 /VVerax2Ob8fP097uIpVIRpajqPdkZtvVEvwHNWZYfSUo8xcJAsGZSDjf3Xged7YWOe+0
	 ZuR6rpqdUi/vaFFlYk1mHO0jvTcpZ4UWq8FV3gRZeSwZExSaVS+ZFWVw3Rm+kTDn1gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLN+A24F;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA26606A321
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 13:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAA26606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLN+A24F
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so5203379a12.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 05:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795528413; x=1796133213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q6JmaR/skCNhplZj+MXI58e71T+5r4bXzYFahMOHLqU=;
        b=aLN+A24FpcTksAvfHE8G0f+UplORhvw8/bXY3U82W2pf+lsZWIWXWX/nafyLTh047G
         r1onB5x/eH4tSPvpNCASvyFlUYRQp//42ZEhqX4kLhCP/7b6mTxU52rDhsrNv92QNHsK
         22lGdW0m7GzfIs964YdQNmo4/i5nLQSPWfdE5QkIYGgFoDwusrMDPTIsgk9l/rL8DR03
         xcyEatZ4m+TH8CaDZWoj5inFyPcaO44w++BTiN0Jhwazt0/1CpVw0OVF5oatqyNsuAfY
         c/s7CbWVdGlNsO+fq9FdI6skKk76U8kam3euoI+v+LN3tLy7fm66o8SxfO50RuVrGtDD
         9I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528413; x=1796133213;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q6JmaR/skCNhplZj+MXI58e71T+5r4bXzYFahMOHLqU=;
        b=CPmxqRGC0Vxr0acwJMQgJCzaYWbgrsLyNVsqo9m6gQ8fyMAlzMTdFqHHLN9ll/+/h5
         uytjTBOg5xviXEk/XhMrJZfLtNUB88oYOMKuJTb/dHTRgkjhhUmtPx6++WJ2SGW99pev
         LGzUPFMncnmXIC+2RqB76F21gNYMwMeGlVoaasvIwgeU9QvC2TSBe8chSdJxVETRZjC7
         2QzHE/eiS4IMRdA+sgUW/Aaym6PRZgde3tjIF+GBfubW0KAW/gYgwdEKi8syF6RYCzNj
         fPLlG0kipNGFc8bQOqeilOK2qBwAoMwOKy7kjDyUHZH1TelbirG4H8LEV2dOqUqodOwd
         ArMQ==
X-Forwarded-Encrypted: i=1; AL+hErHXJ+92DkNr5fLAZVSJjPGP2S0ewQPr4tcqkVlArl9ZCbiz37nD/O0eud2Pgx/B6kh8hhvk+1sv1eY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ab6tMppXPVyMJRM700sLc+GJ1oKRFSx5ygMpfWWXBxMmJAdzf
	kjRViix5tKEsRwhKykDyMz4M9lF8Xo6QiOaF3Mmr69FgtpjB3qhlznDb
X-Gm-Gg: AZFdTZcIMFAY/NwQb+ML5d8Mi2rC4YquniDLAl5pwbNK0mvlZJuFHQ8G3gAR99CLh6E
	vTQQoqDN5p+GRuOayoGkMt8lHWC76eoFZkpLjgEWDq8FD+3i2ZsfNZytTAtB+PqPXgj3rtxtU+f
	yMyLkdhInGfnsNByCH5KAFeSSjYT3AUCfJeqTvI2yUmxqHhypPR7jNkrp27HrMLAkt+N5MuOSNS
	azNBCIEAVQGnm0mKol/CdOGaW78RMLQPai2m5sQGjVAJnQQ23/vDIEVHSLDHyiIP9P9wGAXFIxt
	xSfU44fRq5+7wyAeUdM1IUcBQ6TKSbkbFIgh4ZI/AOpUoFugPTPdpihnd9/AB+U+HIOfimyinAh
	5eE9dxL7kXOCaAJ+vI1jziFPPqtAORRGjJLeaRz9HT34S3raElqe2JelUeW56exfN0Jtx/JQnPM
	hTaB2W3xNyX8O1u2qOjIQcwHex0/5AVFOJJfMCONJjZSnZLpSoiAqMKkSzcYiKW19qNRBFiJVcP
	HnT4Mgbeumbll4orM7R0i97ZLa/CsTMWfKc/95L98CjF93YhzOfNoB4oCuuDLi0gPG7gpJTkBqy
	a2V88GmDmDO2q4k7Y0Q13QXyAhzrRtU=
X-Received: by 2002:a05:6402:c70c:20b0:6ba:1347:5cd with SMTP id 4fb4d7f45d1cf-6ba37c7ad6bmr7580207a12.2.1795528412985;
        Tue, 24 Nov 2026 05:53:32 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36d730d1sm6833598a12.0.2026.11.24.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:53:32 -0800 (PST)
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
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 08/43] drm/drm_color_mgmt: Expose drm_get_color_range_name
Date: Tue, 24 Nov 2026 14:53:15 +0100
Message-ID: <awWWuPbKPoIkMxNC@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-8-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-8-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:50PM +0100, Louis Chauvet wrote:
> drm_get_color_range_name can be useful to print debugging information.
> Export it so it could be used from VKMS.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_color_mgmt.c    | 2 +-
>  drivers/gpu/drm/drm_crtc_internal.h | 4 ----
>  include/drm/drm_color_mgmt.h        | 1 +
>  3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index de219c23322f..a65fef5702ab 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -512,7 +512,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
>  
>  	return color_range_name[range];
>  }
> -EXPORT_SYMBOL_IF_KUNIT(drm_get_color_range_name);
> +EXPORT_SYMBOL(drm_get_color_range_name);
>  
>  /**
>   * drm_plane_create_color_properties - color encoding related plane properties
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index f3a3ffd358dc..168799fac7c8 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -38,7 +38,6 @@
>  #include <linux/err.h>
>  #include <linux/types.h>
>  
> -enum drm_color_range;
>  enum drm_connector_force;
>  enum drm_mode_status;
>  
> @@ -119,9 +118,6 @@ int drm_mode_mmap_dumb_ioctl(struct drm_device *dev,
>  int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
>  				void *data, struct drm_file *file_priv);
>  
> -/* drm_color_mgmt.c */
> -const char *drm_get_color_range_name(enum drm_color_range range);
> -
>  /* IOCTLs */
>  int drm_mode_gamma_get_ioctl(struct drm_device *dev,
>  			     void *data, struct drm_file *file_priv);
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 133ca77d91c7..e91f494e5a63 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -114,6 +114,7 @@ enum drm_color_range {
>  };
>  
>  const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
> +const char *drm_get_color_range_name(enum drm_color_range range);
>  
>  int drm_plane_create_color_properties(struct drm_plane *plane,
>  				      u32 supported_encodings,
> 
> -- 
> 2.56.0
 
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
