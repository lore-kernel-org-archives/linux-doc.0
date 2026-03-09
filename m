Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6678236A73
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 07:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042455; cv=none; b=h4O4WQkRI7wAvrpMYsZvDO/EyyNwHQeEChldTrI0onRkuplEBH/BTYkX8vI3wfDDRgifkyAB6DEdCCzfx7fCGPWPg1/LqyMhYt58rqR3tJ7t1QL9mRH2G34sE8Wf3jTeKbZ+k6cdmEG6/idH+o7+sM0JXvNqncx0Ym4LtwRTsnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042455; c=relaxed/simple;
	bh=XiRFtJveGwht3EZeO61RCHRcWcybYrhhYT1r14v9Vo4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kpki8K6heBsrn4skffS4o1yYKJ9m1b/Lq46pW3RlndYrBjHYWKQ13H1A0AEXMlEqGp5CtoR3rXD01txOTRKT9sVhFa+qlBbBTDTdkYeO3hGel19I42etc2YI1wy0yyInUb/lFArb4Unvruqcmi6E2Sp91unUEZh/yVQTQ2ZgP40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVKp-0007XW-D0; Mon, 09 Mar 2026 08:47:27 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVKn-004UjR-2m;
	Mon, 09 Mar 2026 08:47:27 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVKp-000000001YH-0dYu;
	Mon, 09 Mar 2026 08:47:27 +0100
Message-ID: <a53543187f487858afc1b1d58af3cfa1e8791845.camel@pengutronix.de>
Subject: Re: [PATCH v3 08/14] reset: handle removing supplier before
 consumers
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org
Date: Mon, 09 Mar 2026 08:47:27 +0100
In-Reply-To: <20260306-reset-core-refactor-v3-8-599349522876@oss.qualcomm.com>
References: 
	<20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
	 <20260306-reset-core-refactor-v3-8-599349522876@oss.qualcomm.com>
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
> Except for the reset-gpio, all reset drivers use device tree - and as
> such - benefit from the device links set up by driver core. This means,
> that no reset supplier will be unbound before all its consumers have
> been. For this reason, nobody bothered making the reset core resiliant
> to the object life-time issues that are plagueing the kernel. In this
> case: reset control handles referencing the reset provider device with
> no serialization or NULL-pointer checking.
>=20
> We now want to make the reset core fwnode-agnostic but before we do, we
> must make sure it can survive unbinding of suppliers with consumers
> still holding reset control handles.
>=20
> To that end: use SRCU to protect the rcdev pointer inside struct
> reset_control. We protect all sections using the pointer with SRCU
> read-only critical sections and synchronize SRCU after every
> modification of the pointer.
>=20
> This is in line with what the GPIO subsystem does and what the proposed
> revocable API tries to generalize. When and if the latter makes its way
> into the kernel, reset core could potentially also be generalized to use
> it.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
