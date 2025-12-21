Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF1D26ED39
	for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766353852; cv=none; b=N2OfS6xDSHHw0sH/+D2obgmXEdXvjgUIGeZqYn+vPuc2fYmYwPb1Z03KI6iTdkhQ9BY2FckQTauQ4byx1Kiu72IdiHg6dAE3L3DIW6GQEJ4oec2M8YW8QYXE6PEFE6Mb7o6EtxS9kPe/pKgAuFw8d7Z3QmEo6wyjaR/0OmZ0y2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766353852; c=relaxed/simple;
	bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LglQ/dYXTflSPIKuXkRDy1gIfo3946+fEyYjJDp/Z977wQ5VBrZp28UE1+vopHYPAB5me0su4TSX+QIxXK8CrnPCB8ll9eLTlKqJwmA48V5NP76U0434ICXcaVOUjDx5eT6hObRd/B31/gJ3qMuDhCJLpB64zPIEe2M0oICNTyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=DCWTzsbm; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DCWTzsbm"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a09757004cso42452625ad.3
        for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 13:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766353850; x=1766958650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=DCWTzsbmRqMEbr5t/3OQX3/hC+dfjHE7AsmuXasKc3NKB51Mqp7jGjtBbpflY+5YyW
         1lEgr4N7FzEAWR6LNyyvpvL/k//ZrPw5IAC4X/kX+0HkPu2NVBMgYmSbdThMPPrvOyhA
         NUNLqFnbDWNjq+21rw4gtRmK+/A4zgkHubY28H0YuRhgw/0qmWj4J8yQuTTb65rNF7SX
         iZw6uEq/qA6PrCE4c9tPQQoLB+bwYtpO43LnKvNvImFEd6yaHbIGyiYLGz1Hr3jF0jWu
         KFcJeVrT+toEoI9L0wJRnRmTeHfPq9uXwTmZUhj4Rdoa6qVstNxClWje7Uk2M5jIPYLf
         YHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353850; x=1766958650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=p2Do+rZR0AIR7ZH2ANDvbSZJnUmTSyWzvSbUzwLBXOmH1sZh246m6WC08eqWifQ9Y3
         MSFlgOyMZHLsFFG8kYEV4Wy/iQ9wx/pSjpaQq5xETj8S6+97Wc9moOtSl5oDpoClOg2l
         KoQGLmuy6ZPpc92p4dj7k1CE7/pY1XvIrer69kCgYBZIgzoU75IbRJS2afvnzLf9XpME
         uYWKbm2bZGM8fADLKmKyb3f77l7Wp4N56z869dp1jiKt9Pune8iBVZH9eKVpjqD5HUtW
         93Y5xo2MV4VyNnSOHRpybh6indHpm8KDzmZT7XB5xrPOssHHFr8x1n6yRzblOKIPMURi
         T7ow==
X-Forwarded-Encrypted: i=1; AJvYcCVFCGEu9xFk5Ma21TuhoX3Ijeq5oHr527TVkq9CYLN80AxDrIeq1Jybys0LXXduKr070h+aIyPXn74=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+17Tu0MKG0Zvgvq0GBgtzt2ga8yrdcxI+yu1clP/hjGdeCWGD
	wkIXyaTJjTG+W5mgLmBCyLW/qAcM9M+yX2De8G9RzqsDHTWDeQsFMMJIXSW6jcwdBWnMw67DyFT
	IBIlsJqbxZcVnfCIWxOo1+vi7VH22jVU=
X-Gm-Gg: AY/fxX5Vk5DgjXpI066Wl/MA0A+Ovle27+UiOJm669IyLFVZzS2nm48MlPz/iyqxH8v
	Vn5UM6em7WDVZa36Tk3GjuWCykazauCJg/Yc+L1vlkGxPQj4jW8+dbqkA8mBa78owYuWajOtKBs
	nlPPmtBq41PyeypGfIpSpihgVXjV25yXaqjB7X8kSZNJeT8lwpVTowuC47GeriZz8R6cHOe7Rwn
	Ih20s/M0U9qkbEiqZ8R7FSSY7cFBT71FKldQ1ufRDN4/Ncx+hhp6IKwFm9YNxFl9+K4yo8sCzYJ
	qhuuMPOrtraxjZ63R78gPRw1Are2
X-Google-Smtp-Source: AGHT+IFmGLO1ppe7sd+ZWkCXr5M/lVGVTY4CkYOHQyHuMOoqYtObXJlv15dAaXOXobOy5zBtPFDXPUKZsDC8LF455xI=
X-Received: by 2002:a17:902:d2d2:b0:294:f310:5218 with SMTP id
 d9443c01a7336-2a2f1f904a0mr102182675ad.0.1766353850211; Sun, 21 Dec 2025
 13:50:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:50:39 +0100
X-Gm-Features: AQt7F2oD-fq9YbJ8bBaEtNQvS-l_6JEvIhNv2LhoefMzto1ImTx3Z1Dec3fhOSc
Message-ID: <CAFBinCArG=-pNRHZTdZX1CDDPrs02zpRJ29GSEUA6TcUckQvww@mail.gmail.com>
Subject: Re: [PATCH v3 11/22] drm/meson: encoder_dsi: get/put the next bridge
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
