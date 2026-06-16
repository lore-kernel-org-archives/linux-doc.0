Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62A63ECBED
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591957; cv=none; b=ii+7CN0v9t2s+ffhUhSIKoMUJLI7hr7zku2AeY3YIkkarWFKbtCwJACt9gMW3Bizbq63qSGOQz0mK1GgGSnAm2dDO8t6/quwZ/sET/1zXXV427RDewzgBg0+jbi3+VUM2BzNbRJRQHg0gZsNwTpRK9bSHOY/kYvNcUOu3me2UNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591957; c=relaxed/simple;
	bh=dB5P5B/L5SNNgC+K83xGRTBS2wZMWknW0X0ek85H/64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YezoOYHl8lofmZjjDne5LYqJxik0KJ4ZdBO8MNFlLFg1bpUYcAWkrrvEtWSDeXMvdSjJGaloM3mrjMAYSw9zlBa3Tcs+qsQrX/CQQcVAhc4WwTTfQMH06ZrSX6wv/mhA1Dkl9uhKgmgFBagvo/EemaL7TT6AH1jxK+UYG5oUF+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eldbJbhc; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eldbJbhc"
Date: Tue, 16 Jun 2026 09:38:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781591943; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=GVfOE2XFEICmBfaDMRSO2hHo1iKXdQtzTTUMFwkkHZU=;
	b=eldbJbhcCUbmohGydeuNrYt91TP1j1ZEKBHk7ckMGupznOuiMRg0g59G3TLIVD1+UsflIw
	V+Kj34AFfislA/kxuiDuxUmnQkuJq+z3Yu/LDJTlGdw6JNHdMorkbiGFU41vHaIgNaBQzO
	NMkdPZViEC5AELJG6WL53W1WBkU/YXU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	Charles Hsu <hsu.yungteng@gmail.com>,
	ChiShih Tsai <tomtsai764@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 5/7] doc: adm1275: Add ROHM BD12790
Message-ID: <7bfa22c245b81c8027736019aff717cc1f5039c8.1781591132.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1781591132.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bBkoSyq3MENugf+z"
Content-Disposition: inline
In-Reply-To: <cover.1781591132.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--bBkoSyq3MENugf+z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Add the ROHM BD12790 to the list of the ICs supported by the adm1275
driver.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
I didn't find public data-sheet yet. I will add a link when one is
available.

 Documentation/hwmon/adm1275.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.=
rst
index 8a793dd2b412..d8495be313b8 100644
--- a/Documentation/hwmon/adm1275.rst
+++ b/Documentation/hwmon/adm1275.rst
@@ -83,6 +83,14 @@ Supported chips:
=20
     Datasheet: https://fscdn.rohm.com/en/products/databook/datasheet/ic/po=
wer/power_switch/bd12780amuv-lb-e.pdf
=20
+  * ROHM Semiconductor BD12790
+
+    Prefix: 'bd12790'
+
+    Addresses scanned: -
+
+    Datasheet: -
+
   * Silergy SQ24905C
=20
     Prefix: 'mc09c'
--=20
2.54.0


--bBkoSyq3MENugf+z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmow734ACgkQeFA3/03a
ocX2tggAt3ui1jGCf6JWvUHB4Z6/euo6cOi8gC0sLF5cZRPS5dQsl6uWqPMvKtIM
0/6ykCRh6tvcjIa91SD1CM/7otNsyjnNeCcKsll5zj7ceqanYLqVvn8rJB9Isg3e
tZDv3/rIQbdOBvJrnMg9QLN10YxCA56jYHRT7B+iN0YegWIrmbOd2VH1uT+ZJWW4
ncLWDRYBFaRgXmay7Lr9khlQyk3YzXQ/bZvvn7/sSf0F+vABXNB/EyMGjqe/GHm4
yz4I23xSQdcsJp3oon4zZcMUVyDPSXw3qhieJctcXubPbtwSgaxqidZbDFL3o9vE
tsTfw0lCDalR6wZxcWNf1CaXbqdj1w==
=Zpoy
-----END PGP SIGNATURE-----

--bBkoSyq3MENugf+z--
