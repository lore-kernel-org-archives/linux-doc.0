Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25707284684
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154142; cv=none; b=fYMEzpg2S1DS/Pvfy/7FqSgMdd5EtQh6u90Ha0LSo5p3jJ/ADz45wSeuRxaOJ1agdX+Vfdi+8AgAwjDmwFBzRe9CUxwT35wjPe8qX9OW7WjuQXMpdNs2Aj/boafja07V+FIuVNI9baqtEpEfAVBvTHywDXCjmHoIivNWIqBQopw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154142; c=relaxed/simple;
	bh=hxqWJa4wgFoZ9DNRObSb/80zHCfwS2XkbGwkr4osJBM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DAZLvju56n9/7Z1gm842oGydaWRq/QgULIwDPP2FA+O5k57KoKtdzVEfVObpJ+JzvwasiycACFqZQoYSsOVOHwUrFaN3aNkyAysmnkK7KXXzhQm8ez+bp2H3IDSBuU7X404QrOkttbtdsKdUAdJreKBJl4HPELbphU2vQM/Qpus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzyO9-0003Wm-NY; Tue, 10 Mar 2026 15:48:49 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzyO8-004iFW-0O;
	Tue, 10 Mar 2026 15:48:49 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzyO9-00000000BCN-1c0b;
	Tue, 10 Mar 2026 15:48:49 +0100
Message-ID: <581eeac616ad0fa3376303e7136287b956534e69.camel@pengutronix.de>
Subject: Re: [PATCH v3 13/14] reset: convert reset core to using firmware
 nodes
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Mark Brown <broonie@kernel.org>, Bartosz Golaszewski
	 <bartosz.golaszewski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
  Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 brgl@kernel.org, 	linux-doc@vger.kernel.org
Date: Tue, 10 Mar 2026 15:48:49 +0100
In-Reply-To: <0b72286b-33dd-4bc9-8c0e-161c2f4baed8@sirena.org.uk>
References: 
	<20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
	 <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com>
	 <0b72286b-33dd-4bc9-8c0e-161c2f4baed8@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Di, 2026-03-10 at 14:16 +0000, Mark Brown wrote:
> On Fri, Mar 06, 2026 at 06:22:57PM +0100, Bartosz Golaszewski wrote:
> > With everything else now in place, we can convert the remaining parts o=
f
> > the reset subsystem to becoming fwnode-agnostic - meaning it will work
> > with all kinds of firmware nodes, not only devicetree.
>=20
> This patch is causing issues for me in yesterday's -next on a Toradax
> Mallow platform with a TI K3 AM625.  Things start to go wrong with a
> WARN_ON():
>=20
> [   11.544610] WARNING: drivers/reset/core.c:1195 at __fwnode_reset_contr=
ol_get+0x488/0x580, CPU#0: (udev-worker)/129

Thank you, that's reset_controller_register() setting
fwnode_reset_n_cells to 2 since rcdev->of_node is set and rcdev-
>of_reset_n_cells =3D=3D 2:

          if (rcdev->of_node) {
                  rcdev->fwnode =3D of_fwnode_handle(rcdev->of_node);
                  rcdev->fwnode_reset_n_cells =3D rcdev->of_reset_n_cells;
          }

and then overwriting it with 1, because rcdev->fwnode is now set as
well, rcdev->fwnode_xlate is NULL, and rcdev->of_xlate is ignored:

          if (rcdev->fwnode && !rcdev->fwnode_xlate) {
                  rcdev->fwnode_reset_n_cells =3D 1;
                  rcdev->fwnode_xlate =3D fwnode_reset_simple_xlate;
          }

That then fails because #reset-cells is <2> for k3_reset.
We also have to check !rcdev->of_xlate here. Could you check if this
fixes the issue?

----------8<----------
diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index e625cf59cfb0..d52595db5f87 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -143,7 +143,7 @@ int reset_controller_register(struct reset_controller_d=
ev *rcdev)
 		rcdev->fwnode_reset_n_cells =3D rcdev->of_reset_n_cells;
 	}
=20
-	if (rcdev->fwnode && !rcdev->fwnode_xlate) {
+	if (rcdev->fwnode && !rcdev->fwnode_xlate && !rcdev->of_xlate) {
 		rcdev->fwnode_reset_n_cells =3D 1;
 		rcdev->fwnode_xlate =3D fwnode_reset_simple_xlate;
 	}
---------->8----------

regards
Philipp
