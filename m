Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4FF19ABDE
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043086; cv=none; b=lu6wsppPCiCpQbzr+ym2sTX84n5USUK6VFfDiOIGlp3Jr/shBFYK9WuZdPYrE81bih6fAL+2FPUGZMfN+kA+vx8/rpBzN+p7+Pv7Ro48BEwzxc9ZLIqUVQeCQgHcIWaFpqxsQmXHKXGYcuaHV7vZVcV0sY3NDwJt9GSgI7LA1Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043086; c=relaxed/simple;
	bh=vJHPD9X1nxn7PXVr9xga60YZTLV/0g6JFA2v3mB5iWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNomA3e5U3V2Mf0UxWtp5Nm6+EzTx4VqYngCMcsTzddcMOC+TJv8XFQZAf4RpBcC8dhPlrwtKVEgA7NzoZrnGLA8Dm4K89SmIndlZJjD6Wzo6P9BO6rI8tNzGL4QfQLkAadusMnCyHIsPz5vwXWa4gWXB0IIjB8dlykXKSdMTQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYqL1dxf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYqL1dxf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477442b1de0so6048595e9.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 06:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763043083; x=1763647883; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=91ag1uYbOHPtz4pKKSzD/eUHCpa9v/Cueyubly+zX38=;
        b=SYqL1dxfcKC4y6KTKXLiqneWcPDjIomJkNb/HJrK27tFh8iEeMcUtIDb8b2m4LNO8l
         Xtc3TrJj4s+KK8nPAaCVU4X5p4uGjGPq5JriBaz6UM5AlU4Fuw1Od02tlRYdspjD7Yh6
         SCSbq0eAXmpOkH4CeaXnbMmIUd/sQaiW91R4ofApD9O56VxD0v+NqLt34wBAk4sywAfl
         fS3QMO7YEeWAgWKezmPX8bCmDWdl98ZTeybEG5qYprxsCCJnCtBe0MpEdXlSoy2F4CwM
         /PWe4nP9BiCURmyoS/IAMZliodnCrdAuBjdvVIO9E62LyGxH0Dnf9kJpmzaRO0eeU/mU
         KtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043083; x=1763647883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91ag1uYbOHPtz4pKKSzD/eUHCpa9v/Cueyubly+zX38=;
        b=YklaDS1j7KnCf+obRx6sAUgWc1cIQdQ/BFf5Dw6qdUcHw7IbkbzAul09iUAhqaLn/v
         Pbdl1CjDxWD//OEIqAH1OlHb3MXGqObdl4I5lYMGF0FzsCIFsecDm1oz7Brb85yD6xiB
         ntMf3bG9OEL9scNUxW/pXq65lShDubRhxST8lzg4BxTh/uRK9fIfo/vmnlEuKnL47It1
         OpvEP6SDaUJXmIH4CzfYpzPlDVrh/9WyTGtXR9MsCGrqiBmWi035THWAhPQa28TtBLc9
         HlLt7fOB2JGv3q5teCRboD8eavKbrTPSpWp8JVN5q4MPCpSmMW3aMm0g/TeYLPojNFE4
         619w==
X-Forwarded-Encrypted: i=1; AJvYcCWulRw30sv3st6A79hwm8PfVmDA9gH+T1eBzvTw6wTjYr04zE0HtT0wY/Gt7EvYUxneFdi/1ASq5Lo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Ju9H1HY7AISqNNTfNDWdoBVdHfcKb4TtxoYundE4EmekzicX
	eWCBvrKZVcGe1Oqa6UacWSJk3oubC+0q7kb+ACk0hjRjyjbXkp7ZvxH0
X-Gm-Gg: ASbGnct/CAZqrArnDODZ7ZZ0bICP3jWpC1DKURN/crnkhawLlr3Z1Ug2eGjV7ibvjy8
	nSUVclJr+38khJ1vSMN8xXDd663Ih7OIi+4UQkJXk8D9eLZlOvo/dARJXNbBmcDRREOAGWQ2szL
	KdzaHXGbj96MYvM2ZjaG6bh9gO1MBSjYrTC7FPMKbUoxmX2YW1mr0M20zsMYtHsgry1WGj29eMS
	QGN7DUtvOOU2FKzICrmQzBDJLmPEc+1RlCM0I5lYOhZi/YtKxhZe6TyOapkv5GUOqTgvgxCd1xA
	483vts7GEQgFLUvNkNKJH+ueycdeeUrVyLUcErA/GLWF3Z27EA8MKYtiJgLG05+ibwkjryH0NtS
	zo1l/L+CmU7xvOKrbBn+0q8kMIgTUTE/VHQvEOQS1DOWAiwHtbT+xKZSO0Tz+lqli4pT1XCqwmh
	4e2tu1daRf
X-Google-Smtp-Source: AGHT+IELGbw5WDCBNn0abg6DnAsPsmi7nXIiMORLRzB1ZpydL6LJX/WfaKlpJx7oR41ie/aziJGasg==
X-Received: by 2002:a7b:cb95:0:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-477898540c2mr39839645e9.1.1763043082586;
        Thu, 13 Nov 2025 06:11:22 -0800 (PST)
Received: from fedora ([94.73.38.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f19aa0sm4004858f8f.37.2025.11.13.06.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:11:22 -0800 (PST)
Date: Thu, 13 Nov 2025 15:11:20 +0100
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
Subject: Re: [PATCH RESEND v2 04/32] drm/vkms: Explicitly display connector
 status
Message-ID: <aRXnCAjew4ZrJz9F@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-4-a49a2d4cba26@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029-vkms-all-config-v2-4-a49a2d4cba26@bootlin.com>

On Wed, Oct 29, 2025 at 03:36:41PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so use full name instead
> of raw values for connector status.

These simple patches improving vkms_config_show() could be merged
independently if it makes easier your work.

Thanks for these changes!

Reviewed-by: José Expósito <jose.exposito@redhat.com>

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 391794d391c5..858bec2d1312 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -3,6 +3,7 @@
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
>  
> +#include <drm/drm_connector.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_debugfs.h>
>  #include <kunit/visibility.h>
> @@ -364,8 +365,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
>  		seq_puts(m, "connector:\n");
> -		seq_printf(m, "\tstatus=%d\n",
> -			   vkms_config_connector_get_status(connector_cfg));
> +		seq_printf(m, "\tstatus=%s\n",
> +			   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
>  	}
>  
>  	return 0;
> 
> -- 
> 2.51.0
> 
