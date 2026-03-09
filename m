Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F306C36212B
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043282; cv=none; b=enPBhkkfM7RL/ing06IrpGrfNkxO9uXl6HIXPdbCkyFhz8LNjO+0jqXXU5Tm2AZ00d7IRYMtD0tqpV2C8gMXO8JnpLGlBzZp2kStp21CO03//otaV+oTNvtYqAsnqpP9oTe5uTu1Csw8e0xmozJ1bHtwLnoq4UoHeUp4t4XSho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043282; c=relaxed/simple;
	bh=Uu0VeuwCu8JuebDmsK7AHOA+nkMo23uICjXZqeapeHo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AQY1/gEqelgQVW6AqASvUDBthfBPCsSHuEJtZ/v/RYL3HCuZu7v7c14y9k1rbbR5aT1Gbxz/3aPwcVS+xUu7Vt72WQR8kExrU2L62cjIQNsquoWxiQ1yTIsF0Fv00SIJl3VQ/tL4woS1pdCcMl/FiX7SSSZLCnxDN+UFjJrXNi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVY9-0000jv-6j; Mon, 09 Mar 2026 09:01:13 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVY7-004UlK-0W;
	Mon, 09 Mar 2026 09:01:12 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVY8-000000001xz-1vW9;
	Mon, 09 Mar 2026 09:01:12 +0100
Message-ID: <81503d1311f8161d88d12e465c01de6ed03aa774.camel@pengutronix.de>
Subject: Re: [PATCH v3 09/14] reset: protect struct reset_controller_dev
 with its own mutex
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org
Date: Mon, 09 Mar 2026 09:01:12 +0100
In-Reply-To: <20260306-reset-core-refactor-v3-9-599349522876@oss.qualcomm.com>
References: 
	<20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
	 <20260306-reset-core-refactor-v3-9-599349522876@oss.qualcomm.com>
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
> accessing the reset controller device.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
