Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F6113B7A6
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716464890; cv=none; b=Uw4KYboTY2q+CorhruXsufgIl8RIV0eVUztZSD3C1Er7oRnTs5/ilSFNxANS4eNNYKozxDoFb73mu4rZHsoiqBRk8tHriAPT+ZJ56xRmnfApmO2rgJkG18FzEZcVHvHnMt21KcODisk7kTyyq4MzyGnKd6O8v0Kti5g8fXO3TCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716464890; c=relaxed/simple;
	bh=6V+8CtsowbR+5woKWil3/uTefTydyG91roAsOsQIUwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcRotJ7Brsv4RpTevL63f7WqpOGJEPCPk+ZWs5T1rez8ASzsfizS4JWOC5U+a2T/WSzCBEFOQ13OILcmKow5xFLvjIn57YE65Fuwi/my+C3RNMOA6D1ddG9UuoIf7+zleqqCxTys8hmqj/cHFLY5tcEN2e4PLLGIuNu2HSPSzXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eu2MPfML; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eu2MPfML"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-528878c258dso340811e87.0
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716464886; x=1717069686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6E61Jxzxjq7f22HqS8A7YYLGqKHl4SecZqgeLR9j6N4=;
        b=eu2MPfML45bIbUkFG9ND0l32+AcC1mGrmcpzDDPaGNeIJBK1SaBEBWaP4r93sVEEMU
         q6Qb9n3kziLw5Sol37PE/WmpDh61TfDG71RL3jHfK/fmaAPYVyw18mn9OtVYFVM9WIww
         oHBWW7mZNOCNDzT1zFdi7uxz+1RbObBB4NG2CSZzRMuvMLfGYvGiR7ep3QGpZABOH/vy
         MvGI3hW+AWwXlBix6M9RUF5apPzISk7LdGNaeMBtmFEvUD6EL3LCOTiDAQhaG7J5XOQM
         GGHwQwFv1ZctJBjHqvkTlcJYOXyFZyU+MzeRhAHmQ1LmNQDCTrFuqPpDq48+jxe98ADc
         wjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716464886; x=1717069686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6E61Jxzxjq7f22HqS8A7YYLGqKHl4SecZqgeLR9j6N4=;
        b=nDYrT+HC/HSMOEgWLKoI4lY9IiLsqX+yjcXPAO5MslTMg4K3O7SUvQo3E4kV+HraKS
         jgxvAOyI2+7XeZnZVfjHS0/q5B1Ib1KDj+fcdfUcWoCAA1SToV4j9hXdFH3cM7NknSOI
         kkhRh8Z7IdqEHlL+4399LIqIPYe3WSlJ/s3qjjMiqOAMOMyX3U8ieH+rW+fo1qDLJD1/
         jqX4+HQYTLPoOqRtvfOhmdBA33CIG0p2AiJ3DW+hFbOc4+m1mnbSL5IAy0HQwdtZCldX
         gIMvtx48rd1VXVg0ysfI5Z5rgtKaNf+4CgAuRx4on6lGXyJ8h95j2v23ZoLvUveugRJf
         rbew==
X-Forwarded-Encrypted: i=1; AJvYcCUPlqEPEzD3SgTY2PMb94i7IThUhBlyI8HMLObisnBzr9WQuVDpBakRqx+02zBfDPC2PulXpjPHTgDwrkeH+JUnBCKtTgg4mmUt
X-Gm-Message-State: AOJu0YwnLvzarvTnalkpXifQowHWnZwacihS53dinaA4A2UIsRykqOM4
	t6qnbVlnBpEluuhTNMgshCzB0bHpulW5EBhd9IOkGY9J22jExB0iFBn71OVTv/s=
X-Google-Smtp-Source: AGHT+IEyzI18nfzrDPezUD9GxCNOdOCNYajNRn6pfAF677xU9i/D+vNI4ocAHpHkdn63Af8sVdouJw==
X-Received: by 2002:a19:2d45:0:b0:51f:30dd:f35f with SMTP id 2adb3069b0e04-527ef9d932bmr566891e87.14.1716464886556;
        Thu, 23 May 2024 04:48:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-528ce560b22sm42924e87.238.2024.05.23.04.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 04:48:06 -0700 (PDT)
Date: Thu, 23 May 2024 14:48:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v14 23/28] drm/connector: hdmi: Create Infoframe DebugFS
 entries
Message-ID: <dflaec5kcwlo2y23txb5susqimiohuvf5uox5kecmbrcs4wnox@dq7xak3vcazm>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-23-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-23-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:56PM +0200, Maxime Ripard wrote:
> There has been some discussions recently about the infoframes sent by
> drivers and if they were properly generated.
> 
> In parallel, there's been some interest in creating an infoframe-decode
> tool similar to edid-decode.
> 
> Both would be much easier if we were to expose the infoframes programmed
> in the hardware. It won't be perfect since we have no guarantee that
> it's actually what goes through the wire, but it's the best we can do.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 152 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
