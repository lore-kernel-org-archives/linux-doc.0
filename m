Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795353654;
	b=3dcI1paGGxmpBjCp5Pj4Wzc6rouYEeL6xVLxR5akdHOxDQVnR0sc8uakLvvgUS2UW0lA
	 GLOptpxnJgGByHiY2lSOr9dlCp4KKVhIuuhYKvaM14CluT01u3cg/QnoPxtEQjh3cUNHc
	 Likb2Ia/TaK/BL9HoVgddhhNtZNMA3CdYzMWgjj0sKxO9mhdDxrS8llHoXKUN94eraCJw
	 uf9KXo4809WWP9WLFHh7H+BHn96YLAFecFkTzo7eOU2/wkG7+FZ5jnTmOaHYw4x9RW7KQ
	 uWJ7M8ECTwEJb1OaKyfQWDrXn9t4e4TVGU5FV8u1LbYAzy02nntRHy6Myghr9fv8qSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353654;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=blb1isEvjQx0eMFLg7FY49Y1fVrV4dYYrDI3BICfTlA=;
	b=qb+ReP/ArLwojBNiVjaGJ/2bOcepGOeZrpvzsOyWsnr/aDSBxbAxN72SCnULWheJ/GPy
	 NOrtmCUUDjtx7uVCN9s5LShSiuhSEOXNYeO+hB7cSBJxKH8SouiY/FX/tVHx5Ok1JsQYL
	 KlTyOUgbeXzQtF4SY6BXZ6fFKIgaEupobVSsCbZmYCttkr5L908BYMpNc/tEDZBvvzR3C
	 5JCaNqy6cs3vnM4YtvQi1B7FXmHeWmBITLc9ftx5SQKmlJrY7axvXI8RQEgdkEuOl22Ky
	 d0dXRksgsa0FnfgITQJdNb0vOMt0x6RAs+EKqv7XJCrPHNbclrRKEKyLt45c3Y/isQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2whti1V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF16606A32C
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 13:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2whti1V
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795353653;
	b=lJ26tompyXEQoWSpsDtB1lRF45F4Nd4xLx8NnCj1DoScz/Pw2xN3zaJDvrd7jSvBbsFV
	 uue7VciajC3VTKVST5GGWSRUC92OSfMw6t5foANvnEapq0CoxHOXtC2w7KCqLxBS/P/CF
	 nktI9iAqUu/4fb1EoMD2e07tF6U5+VOQFlVrkHXoWVYXPSTVvpTWZOPthC9iix1HN/TWt
	 quI01RHSi+JfXidSxHP889Zx0H31sybwlXhexhZ1Bz/dN9s+bVUtN9Jkqs6vrJ/bbozoI
	 8Jtx6NV5RT4D33AabGW8PmBR87iJopRpxTCYWF6iOo5/K8IbRjrtRb3Xl/KEkgmFj/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795353653;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=blb1isEvjQx0eMFLg7FY49Y1fVrV4dYYrDI3BICfTlA=;
	b=vK1BGyGhRk1jJ8oTdp3xHYKf58fqITYj2hqd7V6BnZjLK4CRjIEDJvB9A93uECAnJpIR
	 JmPdt2/EyL5jHrmjx+VzCEJqJwC8ktLxsVWj58T8SuPWpyO8+9/cJG5AIWkmiZ7MECxy9
	 EaLloOttyLym4XcGvzbvPpXDwzInkaPLp1O15DFQZbQz6JBAPOpt1p4d1YpyniMv6Vd7R
	 EBNl+cWbh2uMjbsTNlfpnlXgOZRX0eM3wSyWz0JkmPZKAZoWrJlrxlY9RVEXyQu973OGr
	 DS7rWdCQijuGUiuwAkYrXim9SKfIgI17WcsA1uOw8oHIg1wi454wQX3pz8aqAOerjuw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B2C01F000C6;
	Sun, 22 Nov 2026 13:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795353653;
	bh=blb1isEvjQx0eMFLg7FY49Y1fVrV4dYYrDI3BICfTlA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=m2whti1VdYpqNBtyomVe34P8wWe0vBV1QQtgLf8N1cRQPcjMV9/bIfIHGyfwM50mE
	 B+Xhc+8wa0NqFG0n7MZ1r8/ZchBDzi/Du7rX6tQuMBvSd2zOLh0vYUcGNSw8faCLJn
	 XatQd4UygU7p5aTIBUsvZnpQaVXW6+ZcdGJHtgk/sYVxHm/pAdITn9PDOEnHTpH1RI
	 xhThy3eiGxEJb+LufqdZOTavt986LJHEL5yhYCRojUIBt2yaQSiZ4KZO6Df1Sjv1U1
	 VV4yXactu9HZsHoueLhIE26LZGNjJz+Oo5LX/adWckqKhgXJyRvF6O9eN+qj2uN9hn
	 y73/Jdia4tryw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C126C4C07C;
	Sun, 22 Nov 2026 13:20:43 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Subject: [PATCH 0/3] docs/translations/pt_BR: process: add
 handling-regressions.rst
Date: Sun, 22 Nov 2026 10:20:42 -0300
Message-Id: <20261122-handling-regressions-v1-0-603afc427da2@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QoCIRBFf0XmOUEFl61fiR5cnXUnwmKmYkH89
 9V6PJd7TgVBJhS4qAqMXxJ6lg72pCBuoWTUlDqDM26y1jndx/SgkjVjZpTxF332NvjFRDObBF1
 9Ma60/7LX25/ls9wxvkcLWjsAgQQLK3gAAAA=
X-Change-ID: 20261122-handling-regressions-951a5b0c080d
To: linux-doc@vger.kernel.org
Cc: Eduardo Pereira Cruz <dreduardocruz@gmail.com>, corbet@lwn.net, 
 rdunlap@infradead.org, skhan@linuxfoundation.org, danielmaraboo@gmail.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795353643; l=692;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=pph7QXY7eou6xgaDZv4tpRBJYPxaCCQPf4lggqQhkVc=;
 b=8Fqoo7cRTwWoOvieiSWEFf4kZZxEEbJbhtbWatyWLI2noRLXAjeW5LcN6sbdmfcVOQ4PCTTUJ
 N2oGNZIspvKCveeZmEW9HBjQLHb77QCsIMLfZYZx/SWS5Q9at13AYVN
X-Developer-Key: i=dreduardocruz@gmail.com; a=ed25519;
 pk=2dtL+BL/x70sROmAvlskv9dbjj274zlPkLBVu4gJJiA=
X-Endpoint-Received: by B4 Relay for dreduardocruz@gmail.com/20261119 with
 auth_id=1571
X-Original-From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Reply-To: dreduardocruz@gmail.com

Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
---
Eduardo Pereira Cruz (3):
      docs/translations/pt_BR: process: add handling-regressions.rst (1/3)
      docs/translations/pt_BR: process: add handling-regressions.rst (2/3)
      docs/translations/pt_BR: process: add handling-regressions.rst (3/3)

 .../pt_BR/process/handling-regressions.rst         | 1329 ++++++++++++++++++++
 Documentation/translations/pt_BR/process/index.rst |    1 +
 2 files changed, 1330 insertions(+)
---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261122-handling-regressions-951a5b0c080d

Best regards,
--  
Eduardo Pereira Cruz <dreduardocruz@gmail.com>


