Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D24236BCF2
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043285; cv=none; b=b+8UMCwr5hpnt68Zjw/oQWxD+SrNjA3/4CVSQ6X1cSu5NEIIz7y4orK3X1K/qVo/sa5jy9vgj3WqxzYwGuR6NYnO9fk4+FjSKE9VaM43zmZaHk/dp4UD9aeqrc9ePpkGs5NjC10c0Z5ZUrt9uvBgulOf01qj2CsY3nu3AHbW5QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043285; c=relaxed/simple;
	bh=uJVvXQNSTBHPFyvgBskmuIRUfK+lrgbUgKDrhuCf0v4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dtW3dZzrHdOWGkCCV074jcoKEOoHLrIGc5igZ9voQfBW2LqS1FTQqX+3xAKemd5Q34AMIPMjM7r+QNzIDC912UEvk+HrRAIWhHLS/qQGJMdMJ+KSfhgqT0+EaxCg+sQGbf16zVfdm9FE/XMx0Nmdwz8Zo8RNXYhxec3Cjjj1bAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVYE-0000lc-DC; Mon, 09 Mar 2026 09:01:18 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVYC-004UlS-2m;
	Mon, 09 Mar 2026 09:01:18 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVYE-000000001yd-0eV8;
	Mon, 09 Mar 2026 09:01:18 +0100
Message-ID: <d8f4de32aa1a0320d11a20b10ba737ce77a1dd00.camel@pengutronix.de>
Subject: Re: [PATCH v3 13/14] reset: convert reset core to using firmware
 nodes
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org
Date: Mon, 09 Mar 2026 09:01:18 +0100
In-Reply-To: <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com>
References: 
	<20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
	 <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com>
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
> With everything else now in place, we can convert the remaining parts of
> the reset subsystem to becoming fwnode-agnostic - meaning it will work
> with all kinds of firmware nodes, not only devicetree.
>=20
> To that end: extend struct reset_controller_dev with fields taking
> information relevant for using firmware nodes (which mirrors what we
> already do for OF-nodes) and limit using of_ APIs only to where it's
> absolutely necessary (mostly around the of_xlate callback).
>=20
> For backward compatibility of existing drivers we still support OF-nodes
> but firmware nodes become the preferred method.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
