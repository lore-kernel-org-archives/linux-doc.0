Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE9F26F280
	for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 21:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766353920; cv=none; b=SiHDo4yuqTwdcphGp1+fHOx/Y6JZcJiKx8MFkmirH4hjpEEKKHnper2CPJkWgieUMv8geHsz5og0jcNq8GZr0lr5jCuZcDnk8Jip6O58Lqed0kVIwhhMivAGoH83zXN4BKtO0Hw91ZaOz7MnFSfGCIY+s+WxP+omh+N/bSfJAFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766353920; c=relaxed/simple;
	bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0XGNgD3nUAwMGyi4ML2IfgMCIfdiMcCIxBuqhru5IzO0P3/IUVJdCQxgTSyOBGEh4g8wJ+z0ZkasDRb+jEtfDUXR/aKHkN+PpCWBNNPhe+DBRSYCVuOUXYp3mUVAWyosSQuqpWWzfLPJBzQs5wzM3YoI6t9ed3w3QyGr/GTka0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=EjDeGVC0; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EjDeGVC0"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a12ed4d205so28586015ad.0
        for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 13:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766353918; x=1766958718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=;
        b=EjDeGVC0Le5xJabBeZ/TQyXCfMe3zoqmdKzP5LriqTqVr63m0pcNA+Gy6nUvlL0WG2
         invbsMNvXtcODVH3C5jRgujoGKJAB9cGwnSP9YKpGCVDIRkrtNXTf4aOY6DdmVlx6Z0T
         rp7/ypbjQgILDNmqU7lcsG4z+IYqKSDyO9YuGmzNT+u3dc4bO57jRhCfKkLTlmSlvdaX
         3Io8Won4u1uyX7L/IhIfiaLAIMk+3MB2us5HBT2oghFGnHw4p8dNe7djKLU3QNIZgB5+
         +Cpo9umQWL/UcC2vWO4g9Y6RT7r2sMeyRX/Ll6CWYXB/7KxTzvXe0FLObxmT8hTlt0nx
         hAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353918; x=1766958718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=;
        b=HUN+97jWYuZUAVnd0vVtruXzTJrx52PZMjpHsrr1MVj7s9VHhvMG6agNlQvT8MoNj9
         6FtzxNd69vNaUp/logT7KoIptF8shERHhQjkZlEL3Cx++LMYIZ1NKwI55P2Y9D/33yeo
         8ZHqJkOp6HL9NX7/olDr7pv1N7F4NNbOP3jEaX2iTiypuqoou9ajREpctlGHhIB0/CgK
         0eT9dFNgw0A8Rv+ns8a0TAupzYAAH3lQPeDAjI5/biRJ0tLx7H/eDE0Va4Ly3uCEcZOj
         BZpQulFOLHpKqimHI/Cyx3G0Ji7XgjK/BG2yLdSltVFX82oSVAhWpAuZ9tOKt1KPQTMX
         dFmg==
X-Forwarded-Encrypted: i=1; AJvYcCX8bELuJcsweyxtyRvlFEHQipy60Mm8Ln6IF92MDw67P9Lemu8+vnsznidG0hX9FLBnq2bDuGGwTic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhg4SABEijlW74+A9uIe9Y2/WHE0TktfOPxXzv/V2AQUaC1Q7M
	02Ky3UIeg/vzIEsuGcyjXMzSzCRditeYBqkLRLixVenffNopIXdWAyg76DZIlNfXc1CPdrwzlnW
	VBnc2sUnFBHzZKb+BxxAZdChHyz7L0oE=
X-Gm-Gg: AY/fxX64rWoFPw1026nQam5MhsSZEZ+CRjpju7CmrqN0Nkp5qxZwy/cCikzJ9g/hVI1
	Y0zb13ZiJZuf5Ee1MXUKiR9i0lj3MeS+WrQClGdPHgVoY6YmKTnmjOc3OW4tSu5ZJ8+GTW5FMxK
	uHXDDzgzVab6uN9f4VJVNXWbK915GCWLhQHTLPc4nTHPOBXHreUWrx9WfzJXfOLXOKnd3s4Xfq0
	2DHOvK78uGfZHyfqnmWULo6IOgyUEq3YFKCW/iAYz+ykL9+XaQmD/jMEklTcc0t2AP2+d4Z72Ks
	9S0Ktbq8VazuuYle/bxJKTHdyrif
X-Google-Smtp-Source: AGHT+IFhVsKQ8B8hFSiqKoLGfXbsRY75c2m0MOxZCySUkGexjvaMcQL0jHgp8m1+S1WmJwyBE3X0eYB56oovc6ceHh8=
X-Received: by 2002:a17:902:ccc7:b0:2a0:9759:66fe with SMTP id
 d9443c01a7336-2a2f2735242mr95258195ad.32.1766353917909; Sun, 21 Dec 2025
 13:51:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:51:46 +0100
X-Gm-Features: AQt7F2rrzqrcB2CqEcsVtsm58CwTVijhfO5EKXQK9KI68D9dnI-HolBL_A2auf8
Message-ID: <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next bridge
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
And additionally I runtime tested this on meson-gxl-s905x-libretech-cc
where I still have HDMI output, so:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
