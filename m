Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC237232395
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 21:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752529643; cv=none; b=dmE8iMgu7xND3kqXa/bPocz8qsKMxVL46BpGG8/D/gzSJRGVF9zEXYU6ZBSrlqOvKe7WB31n8/guIwp5eMJbY/z0yRvzYYtltms+5LCn5ViOzS48MvFIjmv9VZm22B84Z0+AVgeBCAKH+8anW5K331knNUtU/74QcJSLByc8ZJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752529643; c=relaxed/simple;
	bh=mX8/sV1fn5Q7F0h2Lt5vjP3RB9JOKY5pvZwp8mxYjcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5nsrCnYAHYsLOmzU3G5VDFOmcfZ2La7gqXG3DQ9eAivLXbChujIkyMovbW/ztumKfHeg7IG7sXl+yTVMwedJJaMOpmgUBJtsyNCJvUHBfZRHJ+t6N6cpi49PWmjOcv6DB9eM4ahSAgBUXDdcFTG8PjFTZdkM6OdM4YpTXPnBgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i529M+Vu; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i529M+Vu"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so4396284a91.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 14:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752529636; x=1753134436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KAFEjbZF04jSsLnT35V9ZUTLej5gO86eh46Ao3TCLs=;
        b=i529M+VuEo9Hun+4Re29ujz8MwfcVOSGo66unhdYqcMZITIsaX7wZH3DfzQb11ke2t
         sDvpU5/An4atAd737x9FFGEbNQtCbly4OsupJ9kDC6HpO6Gk8G3eXdyOqGSdpYAO6QW6
         iIm+M2pTOc6ivt4YRrDWw3eOYW4oqvLNhFpAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752529636; x=1753134436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KAFEjbZF04jSsLnT35V9ZUTLej5gO86eh46Ao3TCLs=;
        b=SDQxBMyyAPhpXuiE52rcilFyUeACcTWUtDrR0SWtA2l22vDrsuprODqRxIxVWlr+qY
         jfC+1qvMIKd+K+93HLU7/0kvVd/1AyOFDfEyPSFNLMdCafoqW/8wFqAEHNGB/hr+QM3Y
         mKJ6VAzO2DGwKpK0NmBb8+aC4tqa0/Dz5OTqE4ZePuGHXfSi4SkAOAKcBAgOQpV9cpv8
         TWpz9zV+K1HKXBy5Ayc1DT10Gzd1FaUCKx3rbWnD+GZyJfW87Qlr/2OE9SEA5mxLgj57
         6J3YeSmmZIF2coEiiaq5/tZWSdacdkWJXH+2XzMY9GDqGUprUpm0KszNAvb3AHgLixTm
         z9BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUxb8uRy68YZOXexYVxcXxDl7KBoTrVx3S666qdOS84y4EnCVPuTx9Im2MB1yqRCVmBhUmskI2Zs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjItjOVA6EabrCu5gbFylQhjXX/4niAWU9EiO28wJmQHXtbJPO
	u4fCzRrYL/fy1lpgM+m50T9tqtqx1eyTrA2BDexoXdAH8xQAy/NUkZgwfjRNuMcHKSSMQWGN/mQ
	zyJw=
X-Gm-Gg: ASbGncvQj9IBcaA7+o1mC6rkcxK3eyPjvegViq3r4DA6Ze53QGC72qiCJN0NctInhOk
	vC1GIuwoPBxS7mh7SnYaviyeTJqxWBvF13Y5NLS2rt55P2ktioc85wIITBgVuXyiDD9NXa0GJR4
	UmYIzC73GEg/feuIuVaOUrm+u2KBzMa/fY5utl9nFW3k6XDAK1Gb0zsl6OW2d7vIVOgqSCspmdH
	ESUawFL/9MZYTAtzm1VHR0sXdPrDFUvqRhcjJu+ddYdsry0eB0PHhzj6YLkpr00ShSVV8lj9Ggt
	W47AegxHJN8qj5lYohKXRN9Lf8uWuJgZsFfQZTTiB3tbWK0yTy4xSl9EnCTHJbQAAgJoR59L7ly
	izjbBom4a5kSVHsWCxJyHsieH3KtDJ0ceqkZsAgSpM8oXxCsB1qPT0GnYQUhpUj0eNw==
X-Google-Smtp-Source: AGHT+IFQHY4Txsp5J13gzvAfvQbgbtpjLlwoLCiWKqwaOcQjfvADSRgFsuu/OGhS/lwXDftLnRgUkw==
X-Received: by 2002:a17:90b:3844:b0:311:af8c:51cd with SMTP id 98e67ed59e1d1-31c4f53f6ffmr25256371a91.18.1752529635892;
        Mon, 14 Jul 2025 14:47:15 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c30068d50sm13816465a91.15.2025.07.14.14.47.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 14:47:13 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b3226307787so3851695a12.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 14:47:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+oiwDf9yuEl4miqBSGlrGmgKyEkm+2G751QQG+vltHFT8CCpGAM+GX1iosLSY+KI7Ndmi+bsLfqE=@vger.kernel.org
X-Received: by 2002:a17:90b:2f0b:b0:312:959:dc42 with SMTP id
 98e67ed59e1d1-31c4f4b7cadmr23322054a91.11.1752529629493; Mon, 14 Jul 2025
 14:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708073901.90027-1-me@brighamcampbell.com> <20250708073901.90027-3-me@brighamcampbell.com>
In-Reply-To: <20250708073901.90027-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 14:46:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgOi-ySD=cog_qcV0UUU4Ni1VAAnkFS+kQjdjOe9MMsg@mail.gmail.com>
X-Gm-Features: Ac12FXxH2F0TYcijyhrCQmsQ50QRyPnFNI-fpx9VJR_jePJEeAOSnJSau6lHn7k
Message-ID: <CAD=FV=XgOi-ySD=cog_qcV0UUU4Ni1VAAnkFS+kQjdjOe9MMsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm: Remove unused MIPI write seq and chatty functions
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 8, 2025 at 12:39=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Remove the deprecated mipi_dsi_generic_write_seq() and
> mipi_dsi_generic_write_chatty() functions now that they are no longer
> used.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 34 +++-------------------------------
>  include/drm/drm_mipi_dsi.h     | 23 -----------------------
>  2 files changed, 3 insertions(+), 54 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
