Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB3336B04E
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 08:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043283; cv=none; b=p4KiJHWr8uBkw3As0MxZjUCtI5fG75ScE45/KdDjpjKBH7vRLhMeb/JYQJtdLv8QTrrVRqGF2tNPHq3zOu3L2kwDYN7vwSfBRKCmZoyXP4sWdyZneZ2fMAe4qqLLW8+s/zDNRtUi683+K6VV9ZOxgneX2ZO+lOhwM2xt4cvTQrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043283; c=relaxed/simple;
	bh=W9ktfQzFeu7ULmhhohoP00jiNZDMc0P+kBmgShQsWEY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PdS4QibKC4rPLRdnsn93Z5uyqmmzqozVYUfULDI7hljEL1r4F4TXFiT+QKpLQ21HoMt4tD2bmEk34ZL/x4RLkhQFZfSfl8jkv3x5IzxMVfy+DRCfA2RfwJylj6s0DPTmR/y731/ayGRvF/jtAelgIifNXcdfwLe+EsFB2Qg1+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVYB-0000ky-TN; Mon, 09 Mar 2026 09:01:15 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVYA-004UlO-1A;
	Mon, 09 Mar 2026 09:01:15 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVYB-000000001yM-2k8Y;
	Mon, 09 Mar 2026 09:01:15 +0100
Message-ID: <5edb414a3869d6f9dae81713b3afc8e13891423b.camel@pengutronix.de>
Subject: Re: [PATCH v3 10/14] reset: protect struct reset_control with its
 own mutex
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org
Date: Mon, 09 Mar 2026 09:01:15 +0100
In-Reply-To: <20260306-reset-core-refactor-v3-10-599349522876@oss.qualcomm.com>
References: 
	<20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
	 <20260306-reset-core-refactor-v3-10-599349522876@oss.qualcomm.com>
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

On Fr, 2026-03-06 at 18:22 +0100, Bartosz Golaszewski wrote:
> Currently we use a single, global mutex - misleadingly names
> reset_list_mutex - to protect the global list of reset devices,
> per-controller list of reset control handles and also internal fields of
> struct reset_control. Locking can be made a lot more fine-grained if we
> use a separate mutex for serializing operations on the list AND
> accessing the reset control handle.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
