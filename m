Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9D9266B7C
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 21:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739480802; cv=none; b=EhNUfAfEBc5xweEB/QtWj/av1UBq3dosukwdwtIsetAlAmT8koPQAdZ9Ag+WchEQADSez/DT7qo3ZwP6jJr6VzaSDSJxlXMThQe6xQDNmJPuQ+r59JSkbPwiuDkzRt8fKbClrPqLv87yqPhBJnErEQ+0xPYoE1yDVcqqjVPSGZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739480802; c=relaxed/simple;
	bh=k9mUIBYNVf/m3XiK/9d9o923sm1DZskoR9Bay1kygxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIHUS4C04QiEyrhAiJywh7QMvM+05bob+d7GGi3rP+xDKgbDtH6pAQ7AuibI9Iw//2ZkifLb2FeDwYgLu0HlVsmNlJTSCnJ70i+ZuAl/XNvdRbzijeM4Na5mP9QvNwYNqAd13mtSYl4CPcBAHjIrZ8uVP+kiR1lE2fNng0WSy8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TW30Dy6Q; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TW30Dy6Q"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30613802a04so14133951fa.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 13:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739480798; x=1740085598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LmXeuchpKSKK7itV+jnu4GAZDK3KHsa9YGIjB4lMa4Y=;
        b=TW30Dy6QT95yxjWWGUnpGo/in5g4tK0AuYc+aeQ+KTlScGAhHzTxqrJPsXJCLyVG/d
         MrQGZ5P/rf2nAMOl2FVK35q7MZHZhflSE0S7x1pTKSJ281Pmjp4IDvZ/xpgkEpCcF5st
         KpkPpy0PdtBZmlkT1PhYEbNhv9Q9CdxML9JrnzSLUOtpmIDRUB22rAYnO5zHQdiJZw5J
         VntZsM+4WErwyMDfUkj8/GbOvr14jrgJL1AzhesEdCr5hQLTxnblfHwsserSsB7MxJ98
         d3JTldMRuAxop3ngGOgeZ1RKzR0RDu4Tl4qkEQPj6SAKXdx06y0/WKQniAgkE7iOTu6d
         +eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739480798; x=1740085598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmXeuchpKSKK7itV+jnu4GAZDK3KHsa9YGIjB4lMa4Y=;
        b=air2lX7ZJ6G5lvKC2p6sCY/QoNyRhZTNsrZwTGH5uT7ri9X87SjWpiZxEY9/+IV+lD
         j6aJF6VG4bIL/98Maje1K7n8NPDHO4geTAMBhS2KNCbd83Xt6iyIqtyHM8NVOgNwEI3E
         SNXPvcUqg/CYQc9nbdjPk/1O/rlNHQ3D05Sr8xue2Zbgjh1Zbc4ywFf4JoEUeJ4+pp73
         VFnEFNPtKlVdKx1J5U8XE25I61m3/zu3Z30TstY8XDR9JGKZvArdvsB0pCQeOXaLRp1p
         5kuxcDbZnVg2FaNgsHHUw3yIal+uA90ZHgYox3zVIIXvu0dt63EjJHvhqCg2t6riQuTo
         qAow==
X-Forwarded-Encrypted: i=1; AJvYcCUhFegUiCsPXsMKZS7fBa2FU3v5H1dZcRsBBJhLrSihCtY4g/n5T1/Nuekv2C1pla8nvmV2ut0WcoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvpvlctA7n+pyUBuswJgtpBHm6/prAo7p06XnEnLkXKRPQbN9Y
	J3g0UsC7Fw9t5cMOZa5x+xIculu5eYm5sMnczcJXI4NzEwUHGlXWwuJLzI2Rw1s=
X-Gm-Gg: ASbGncsPOQ4lmG8/u4RS9SezeA9UT4XrAYnjq7M82/bs7P03TO/llGjhwNFee8yaA2+
	yubOF5yUR27uXDixEA3WtXHH7f/9DfO4F8qdwvhN1W27wlaQX8GU6IRZa8lw9BSIpZ5kvstZ7Kr
	k6kQZGQWaHqVkrpImzR2QOodRFGjTNPddE5vzlCjC9W4nyqCkUVj/F6S2mDYWBnij94x+ndVf2r
	p9gjOiA1GYH4LGVF4GImKFw0mtcCQ3G/9qoMQYqA7Hc5j86Jp3rhu7TXEHE7hMZZMvdVp/9hhP0
	Wayr5AkxvtLhkRRs13KBlzFdGChoFaY+Qqf+lp4alh5OXiBjbcs8JfZfh60hd95V9wxClYQ=
X-Google-Smtp-Source: AGHT+IE+Pbr51O7WuqBXkQBPlJzNzEXWSwgmC055Mxz7GAD+fo2hMYKs8st3+0i1dxoABKmhCmeD7A==
X-Received: by 2002:a05:651c:221d:b0:304:4e03:f9d9 with SMTP id 38308e7fff4ca-30903911d8cmr25004601fa.28.1739480798491;
        Thu, 13 Feb 2025 13:06:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3091e04742esm109391fa.86.2025.02.13.13.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:06:37 -0800 (PST)
Date: Thu, 13 Feb 2025 23:06:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Selvaraj <jo@jsfamily.in>, 
	Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
	Artur Weber <aweber.kernel@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 01/20] drm/panel/xpp055c272: Move to using
 mipi_dsi_*_multi() variants
Message-ID: <6zfcqybwxycywlm45ou2wges5qjb63emndmlstieck6qgzsjt4@rdb5hevlufms>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <20250213-mipi_cocci_multi-v1-1-67d94ff319cc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-mipi_cocci_multi-v1-1-67d94ff319cc@redhat.com>

On Thu, Feb 13, 2025 at 03:44:18PM -0500, Anusha Srivatsa wrote:
> Stop using deprecated API.
> Used Coccinelle to make the change.
> 

[...]

> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c | 138 +++++++++++------------
>  1 file changed, 67 insertions(+), 71 deletions(-)

This one has been converted a month ago

commit 8025f23728e9bc817495d48a04954cdee27462bd
Author:     Tejas Vipin <tejasvipin76@gmail.com>
AuthorDate: Tue Jan 7 14:55:10 2025 +0530
Commit:     Douglas Anderson <dianders@chromium.org>
CommitDate: Mon Jan 13 08:22:30 2025 -0800

    drm/panel: xinpeng-xpp055c272: transition to mipi_dsi wrapped functions


-- 
With best wishes
Dmitry
