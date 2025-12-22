Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1452313542
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399912; cv=none; b=AQ/dQEoZ9vVRvrVlYb7SV7eGU+jR0UrD+fYk+8bWoDZ91DvIuGLpAiHWbRkAMs9y4zEtcAbza0+3hSk5oKoHXBYm97XFYeSzLLW4anAe0A1QkL837tAkRJSOg/9bbw3msVhbVWl1L4vzpfqgsSt8IUbCidbs0Az3vrgK3UbuMss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399912; c=relaxed/simple;
	bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPrephIGt0rtLtD0rd7MJ12lblnebVsYaSwG4+8sp2/YsPbfGsYCp9gvTNbPwgmFl2tSTFlrqEpQElyJ+agqnmZ8vsLGQlyFlH0AeGzx6HiNWoWCnYxAf3bZyf6+Y9w8sQcNC1gG4SBXI9VGnrtIucSDDT/x0suxdd6KYiJTCrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=dW6tLiAK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dW6tLiAK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f0f875bc5so55017345ad.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 02:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766399910; x=1767004710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=;
        b=dW6tLiAK041TJr1Wsp1pD07tPLUnrgJX0/WB0b1lUiqu8jrSWclW46Z3c2vjNdO5/j
         WO0pzQE3lnetjZ/muO4XaPrPOP+1Z2+BXMUCuem7vmQ765IkTity7rHbbqrztOXVyrl/
         JS+KwPB8uwZ3twODRm3aC3h0OaIfJG3w6lPAOf1THXZlReD4Eb3JvW4uJv4mYQHC+64K
         S9TECaZUDq4ItSrrGZffXrQUkM35VdfvF/6340mIK6Yvt/abRu2j/ZTRvipm1W/NEqQN
         ucHEcpk/BShi+Vt4uKSo56Ta1ax/PyEO3ZcpV9ir5bODTLdZoXcyreoWiEDmcHc/27pc
         Adog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399910; x=1767004710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=;
        b=r7wDNCK2IMm03Oo6mevgri4WSTI4baVI4iVrFKGr+lkYATcn9WuNVErRbIJxfzwbhm
         yMVykMlnN+xGisPnJwfI1oSVF9yETL4fhFT3GNXDZMGeHXVsJpg9ZbqE33rtz5NuQIt+
         1EHWkBPEOeQaUW8u9+2tLVgdDIR0IbmXKlmzcbp7/YhaB2Cw6X8miTCTDE/PB8F9Z12X
         XgjNjpmLpolwc6y8ncThofa/EJYseG5IMCrpn0+zDndGxPrAUmhoQDI8s1x62EfGQevp
         zc38rP8tcwlj02n44xTbJEjAI7qWOSRqrJXg6FQqEJ1sqlxPWT5x6JhkLWQ0LNBHwFij
         pJwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEWaPGilorxxDtDZEIacU8ZG4Q6gqI6t/55AhDFOwspie5Bqiq07Fynz/90hNSccAVGdxbadRFZPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBcS58CNrH77Pr7F8MUgEUooYu1UDPLzHUAabGYkkgr3v3ScVa
	CIrc+nXG0Aop6WSOZFZR2ccDsjuoV/o0gQ0DrfcEF0+f94hyJYqvoBKSjZ2XxWTcMhEgyIJnjSd
	dEinWTEbAQdjpHZsTfT0AwequXyxV92s=
X-Gm-Gg: AY/fxX7o4P0/boIYMoSYzFuKbvd03ZZ9nwEbOKccRyO4c+JS2lMvkAhC8FtKAxaG07t
	NfU+IoXKKRKRb5AyMUgmStFGSmeqdKzI1HJ66cl0sTILXNLDviVTG/+4H68lNXUNaK2WdlavX7F
	pHxpo1sx3z2SlDLqVlLJm3tCmLv+MmhxhBeF+zeLxLyzVRFt2eoBkBGita/uel3ZBEke+gCe/UK
	X6EtgwviYZzTdob/Z9e2MH1DDNHXQD+iZUcvCNSCpXNQJCokgjlUzTCk2p3yAsEh02f6sONKbUc
	yiBlu/p+7T6cGw/8ODuH9Ikgr1LK
X-Google-Smtp-Source: AGHT+IEO/ZgFQp5AyfAAtwrHxXoiHa/X/03D0WDYxc4kBLqyULymzY/eR1r0RM8KzOikMvm9YYXtJ3AkgKqBI277jTk=
X-Received: by 2002:a17:902:f552:b0:297:c71d:851c with SMTP id
 d9443c01a7336-2a2f2736bc0mr91265875ad.36.1766399910127; Mon, 22 Dec 2025
 02:38:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
 <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com> <DF4KIOREQYK3.2JEGF51OECQCE@bootlin.com>
In-Reply-To: <DF4KIOREQYK3.2JEGF51OECQCE@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 22 Dec 2025 11:38:19 +0100
X-Gm-Features: AQt7F2oefOvD1VauOsJ6RYNy_cI4jR0Cqg9gQFauSbHiZ7j1ecdJHG9Us9r2rRA
Message-ID: <CAFBinCBX+DA71OA79SqrE20Nd=QUrU86SmYGXu0dAYG-R5nZ4Q@mail.gmail.com>
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

Hi Luca,

On Mon, Dec 22, 2025 at 8:31=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Martin,
>
> On Sun Dec 21, 2025 at 10:51 PM CET, Martin Blumenstingl wrote:
> > On Tue, Dec 16, 2025 at 7:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bo=
otlin.com> wrote:
> >>
> >> This driver obtains a bridge pointer from of_drm_find_bridge() in the =
probe
> >> function and stores it until driver removal. of_drm_find_bridge() is
> >> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> >> refcounted and use bridge->next_bridge to put the reference on
> >> deallocation.
> >>
> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > And additionally I runtime tested this on meson-gxl-s905x-libretech-cc
> > where I still have HDMI output, so:
> > Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Thank you for the quick testing!
Thank you for doing the hard work ;-)

> I think I can append '# meson-gxl-s905x-libretech-cc' to your 'Tested-by:=
'
> line when I'll apply the patch, to make it more informative.
Sure, please go ahead with that!


Best regards,
Martin
