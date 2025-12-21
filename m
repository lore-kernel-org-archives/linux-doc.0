Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA9D182B8
	for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 21:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766353837; cv=none; b=gunN37f8qVRR9jpPmzzdKU3HOttZogUfFqs7d6c8iXTSmdKCqUxV/EE2ak1bGALp659I5YYnEYFKdner3DCBhcQeTvRmONkWrYsPCl3I9ZDotykFzF4MQw/+oBUf4FiTclD5YLC9NbS0CbkuKcwao6eUoyvhObk2vIWi0panfFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766353837; c=relaxed/simple;
	bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LvLItA9MkZ25lMRuyZKPtIxA4FyjkQEAgIyv0yw7WTULoKHwPV+D7heU+cY4YdHBM+sVb4K/Qwi8A7QrY6iXXeB4T8oY+xdJ+fQUCamwnaY7L6R3vyVPIjDYlRgaenHV8lIwSDHcLw2wmWjzuqiMog6q3pufPDMhOfZu2dMSHu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=ElduFbF1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ElduFbF1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0d0788adaso29265075ad.3
        for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 13:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766353836; x=1766958636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=ElduFbF1Wm9HzMRGVYz7mVZ2fchfCwkukqrYOiO1Q15hVZHph128EN9lDdQah93HRj
         biZfrTPDvrDDVuNznWjIux2Z3/D8Va09Alua61X01mSnUI9svw26+Xi3hepXtb1HdK+4
         9XeR5RuNGuNmgS90PGkGMt+vWKVFGvaZU07T5MwbgdBQGzdlEmaIZq9zWkmhoU+kEt++
         RRHaUbdMlizzn8XDUzlFS6o+WDbu5Bf74t2GRGj10eVn2gM8BWVc6ZkaOu5EfRctSy8j
         0gkuuANmbGktLoUF1M7PiiWPI5nb5reP/hx+39g+48wcwzZUf+8s6G//sCRbpU8l+KaX
         JiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353836; x=1766958636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=haazRU7JTlVRTnHRKZTMejIiAMyHgxeMTync8VDXb8zW7cja4+MFiu1muvRtyiJ0Qb
         pM0CGfIHhGJiiBM1MjlHjICPqSu8KRlszVCkE514nbcBrx6g5BBFtTjBDxjF1reZ330j
         uOb+GjBnJIzjfIx4JCxkyQgy2CurvV/2YRRDhsTdGw9yohajO3WhLTBr+JKE4F91I0gh
         2QRLRK7B+7tY//fBxYHbtFu0ldX2c7dzMFQcrddo4pSmFgmRlajwvIa+ss8RwmiYpZb9
         /pcDuAud26dRrgguUAepFcW0lKINGyxZclQZeLt6W9UYW2115klUSRfXujbMK/aMu5tU
         IoWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPnr9w3tKdKfoiS54QaZfhaiYZQvSmnk/mbZvKD8thGpgtikoFxUQ/bu8vdG0Mxjz85zLM6EtBvyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyutf9FnyFuUWahy8mvXWnzC1NJmE64WbmZ/Y4+Njz7uXYv2dN/
	f/wSfZ60zb0NJ92f+XwV5zH/wXCLIlhsGUIS4ukTH5PPCULAAHOSq+Xph5tpITH6o8j4NtlB3vf
	nFgellt6+SSqLA5n0zrxpbG3t3z20A68=
X-Gm-Gg: AY/fxX6eEqzllPNJuB8F+A6PMydCxAX4gYLc7pdBD+Sl+G3ZMlQ2NJHQewkaRkRdTLB
	MnqVjCGu3HgeoSG8EFvfLCqBGsrOIsz4klrNufHd6EJ60T2riV0QIkXTHaVEanvY4GDt7Wuz+pF
	m+jQT7S/V0vzWjwxcn1MvtqYP+N6AGFs9s3lBT7HKJA3nmNvb8FZfcth53D/lVXNXtB6E1VXCkc
	18Ys0Y5W9OUGio8xtetBsR3h3KEWHkMEph6X6nhjpPbTTOQe7FvkHuvGDDNn2LeU0f2O9JxvsW9
	HKjJzcMfymE6RYuuXc7RKL2Ql9So
X-Google-Smtp-Source: AGHT+IGw0n+Vw3mSNWIuK6jiR5TwNM1Orq2NMptHhH0WFtIprggK0653bvytXvjKFmmgd9+xofkm/n3sIE9SOEugciA=
X-Received: by 2002:a17:903:b83:b0:2a1:388d:8ef3 with SMTP id
 d9443c01a7336-2a2f222bc6amr92154845ad.18.1766353835637; Sun, 21 Dec 2025
 13:50:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:50:23 +0100
X-Gm-Features: AQt7F2repQdtBoV8d-ez3LVKkRTtOC5SATWZ81V_d9C-sFP5czyoEjd7MirbIfc
Message-ID: <CAFBinCDt=9H1ccXatr8JYA=atG+vDCBX9x0xor9kibUfo1NKpA@mail.gmail.com>
Subject: Re: [PATCH v3 10/22] drm/meson: encoder_cvbs: get/put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 7:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
