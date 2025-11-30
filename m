Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2496B23185E
	for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764508200; cv=none; b=T7taavOkgF91QO1fT2LdBqAcw8bvyI3A65uv/D33hbtt6FLJQmCGxvzc/Yc0942NEyj978UeTJTs9v831Z2k05jw7YJxXMYJfEHjyq0ouywIVyGvDPHJBAFgsND6UHV27Epw22UD634KJg+N+PZLzDgFQ8TrmsyK8ko+N889w0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764508200; c=relaxed/simple;
	bh=GiWaax2Wc3zbu9RvrCaY6s8VLk1fuWJvLLtVwMu0eLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCvPCQfAXDCdh26wAXO7Xi3FQthZdvumMNK6h8b2LajAKLu7UgWOGwtLpm3z/wysHrQ27DXlttClK7WmRqbh1jofjjGbyAHsZc7z8t5RUGHv1JXUF7BAkZzs24/u856nlMwg8ugXt/hJGVOk6opeEKnZLjZXAa2Uv9xX7XfviUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=d5eWb3Zm; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="d5eWb3Zm"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29812589890so39031675ad.3
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 05:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1764508197; x=1765112997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNmbbxbBaoTz8DomyGsXnxRB8wBP1F/AJR530QwYnIc=;
        b=d5eWb3ZmvHbeV7glCICJSUcP18r/RWTm0m4aan2HRRUE+TlfUx+RTEbwVKxUEiwUVY
         33g362VthRlxbunzjT9dCWwpHpaIPoaeLWYqIE4uMULKzwjZGJoiVpRV+GfCXnayTZU5
         WDxfJO+GzVC/JOBACXn0LDFL2l/Ed2hqI4fwEcLf8Lgf5hFyHQ4QhtQ59oB19VoWRoiu
         aAJ3GI0jNdrErahVM1u+jQEjIu8o4DcUMtPq7eaFctH0K9a4XIeoM5Zi3gVJKbIeoyiO
         Pem+BnUpSJiGaOmnrgjqrMvdKRsHdUTH2jiweVXUC1jkHBLClx+x+sP/lF3nfEpO9461
         0jLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764508197; x=1765112997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNmbbxbBaoTz8DomyGsXnxRB8wBP1F/AJR530QwYnIc=;
        b=YoZzfgfwuz0qomAcE6KUDmZvpbmoQacEthDRSmxG9XTn0RtI4b3qXMa9ULiIBt8qLg
         iho7qZhJIhZ5GYt95OP7Jev5hw5/5nfXepq7ryPAzUhOHD30+Uxcay5uVR6jUY73nxp8
         630JWt8AnWG2fvRJuBzpHeZ1go+DqgGbKm9R3dOBDnEmT7fDytBycyya0ZzXhOn1zGSe
         pgagqficqAaLyUgylogK9ARc39orW7Xn/HjDZRWpNBUJKqRQQZMm8zy9a3L5b9arL7h6
         P44N+VEH1pU2TsK8aiq4hDTZ9YFW9t5Hbfwpe7rLo4PTZVycK5ulvibKlB1BC/FpyGdm
         NiSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0F9DGAcMtZ7ynMAH2RQfnefmrRhj/qf626URZUEnLscS+b7HrIoHBAtBqoiNOB2eSsUlqdNDC41o=@vger.kernel.org
X-Gm-Message-State: AOJu0YynU/EcY0jjC6pvTICojJ53u7mSkKsmYJ0dKymj18q4oXR4NO5S
	j3wgzy+2u2mfiwuyNfcyfm/Ipf81/7QHTsseIEvANresX/zM5r4AYIj9Lsgg+DNcXKDwze9lXfP
	+2ME5EmVlmDx0B7pideYZQKISnbBWpnI=
X-Gm-Gg: ASbGncuIqpuFNmuvzPBt40RUD3j0NcrdSgR0Urj9W+XfX0YhHduTLOeP111RfVk7s3e
	w7InSHqToHxqivsNMygS2xxahCTtV7AGrKtYTW9+wc2Q/DBzi+6ex/m487jq7mc6sDeVLWhw6Vn
	IYfgPX4Jsz+7r1fXxun1hEJY0v3l1nQyWxjh7+lBwqwcItfhT/zt3W+Bd5zyDJAISP2oRzuOQ8z
	r6BvoEvZFJJ53/N93GYE1Rne8Ib36Oem2SkzdDqg8oUTaQVvFqii6wXHsmCNIqrZZyN2ULUniAT
	O83Q8UaZ63B/Q9B5UkTadZ83xsiy
X-Google-Smtp-Source: AGHT+IG53GhYkY/+dF5qGVT19Jadft1SJnnMvw5Wcu0qyYtU4QLG8FtzqF0lB0krYhtMk3QufvRzdFqig5aHMJFxvm0=
X-Received: by 2002:a17:903:903:b0:295:a1a5:bae9 with SMTP id
 d9443c01a7336-29b6be86b48mr332545755ad.8.1764508197220; Sun, 30 Nov 2025
 05:09:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Nov 2025 14:09:46 +0100
X-Gm-Features: AWmQ_bkqQ0yeDiiVRXlgzLTrdqIA678_lHRrauQKV29M6KsFuJAoinD-iLMIAaM
Message-ID: <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com>
Subject: Re: [PATCH v2 17/26] drm/meson: encoder_*: use devm_of_drm_get_bridge()
 to put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Fri, Nov 28, 2025 at 5:54=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to devm_of_drm_get_bridge() which puts the bridge
> reference on remove or on probe failure.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c | 2 +-
>  drivers/gpu/drm/meson/meson_encoder_dsi.c  | 2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm=
/meson/meson_encoder_cvbs.c
> index dc374bfc5951..bf8588a5f6dd 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -241,7 +241,7 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
>                 return 0;
>         }
>
> -       meson_encoder_cvbs->next_bridge =3D of_drm_find_bridge(remote);
> +       meson_encoder_cvbs->next_bridge =3D devm_of_drm_get_bridge(priv->=
dev, remote);
>         of_node_put(remote);
>         if (!meson_encoder_cvbs->next_bridge)
>                 return dev_err_probe(priv->dev, -EPROBE_DEFER,
Would you be happy with me sending a patch that replaces the whole
logic in two meson_encoder_{cvbs,dsi,hdmi}.c with
devm_drm_of_get_bridge()?
I see two benefits:
- simpler code
- a patch less in your series (less maintenance burden for you)

What I'm not sure about is how this series interacts with
devm_drm_of_get_bridge() which is why I'm asking before cooking a
patch.


Best regards,
Martin
