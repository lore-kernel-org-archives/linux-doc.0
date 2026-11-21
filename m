Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795263905;
	b=fTgFTeRukgUS2wIhsGaqbCeP0qDezswWwQr4EgM3bXeSORhsvdIaX6SZrhtWr8lpAYa+
	 HbSVF1mZK0TglYlExxczoVS/CYKCGh06Ff7yp/Ea1M96ZacGuIkVZrbf9Dz1z7SDulO43
	 C8crR9u9pWyEQdm48zjO1PJtnMNFHKUqfBfK8mm3Q9zyhjgDVdH+YZSpoxybbeM6+WXI+
	 kjEcGT+Pz6NMfr1ZmLpeFUxH6zMMH9jlwIAlLrPL7sGP3Y3A76mQNMjWMJvy7Ojga9uXZ
	 V4WgYMQ+gD5DWYwW3UCk+DTegp/QimHeVJ0RCCCSXixoZnKjLd0KuVKhSVHqa38AmQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795263905;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-MBO-RS-META:X-MBO-RS-ID;
	bh=u7XRQt6yLVhShDzUrcNskUAt9AB9U5rbWWbW51FRgzw=;
	b=T8MusW+0+w6914hjOlNctWZu/69+I7cezpzJnPDi65x/s1SlUnRWoKf1ZEj41L/VolZH
	 Z3iK8D9ncFeLBh+5yCdEaGPTR4h2hi4kgDbVe4R3IaaxEBHkedRInQowrBQ593QheYmOd
	 xP+Xh0S2df+Om0tJhG5Tvw4BZO3fIXO2uRdL7oCzgKsjj8FtHNdgoGj/5D/Xp5M91/Q7O
	 P+e1poGwepzoSNDkIXTJjxQTuRPJMeFadmo6W8DrRWOAoJTQ8YHGaEPxvhiUO/GOSjlA2
	 tw8DvaE+OXAoymPMXhlZfGg0Lm+zdqplwOF03jrwI8uuB+4kYUb2xpZ9U/j9rDBuCGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=VOOUXk00;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90624606A320;
	Sat, 21 Nov 2026 12:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90624606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=VOOUXk00
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jWrxf1qZrzMlbQ;
	Sat, 21 Nov 2026 13:24:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795263894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7XRQt6yLVhShDzUrcNskUAt9AB9U5rbWWbW51FRgzw=;
	b=VOOUXk00tIru3UQzwrADrp8CFbAJG1BM3oUJ5TrhVtEl1ld8j9xH6Tv3OOxGxjfmtRICLU
	SfdUi/g/cFbSfmPxGs0XZg9n/kSnFUjgFZtTQYGupSA88v65waatrZ7JRVaJAcKsFfX0M9
	yQidHOOn8Fh3g005uZxt+oZ6/j8Jwz8qgvwnZ4z7rDU8nMpQaaT4QQrEWDat9/hSr7gikd
	/OrFRcRCsYT9YMzHx10aO+jQO1PpjCrqhCIUvBOZeSVrdL0AubweraF/2ZpDgLEBu4qmzS
	XqRZtJU0cBNhSv7BRR0+MZGZZSuw4j6W2VKTRT2U4oDKIY4CISbm5McvJLFXYg==
Message-ID: <0b5b642e7135c1e0d47c0b169ed8dcd3a03192b0.camel@mailbox.org>
Subject: Re: [PATCH RESEND] mm: doc: add bracket
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 13:24:52 +0100
In-Reply-To: <20260916134934.323858-2-manuelebnerli@mailbox.org>
References: <20260916134934.323858-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: wgd9erwebbfiitqe67z7kxp3o3ifaamy
X-MBO-RS-ID: 67e2fb770acfc1fa4fd

On Wed, 2026-09-16 at 15:49 +0200, Manuel Ebner wrote:
> Add missing ')' to sentence.
>=20
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Can I do anything to get this applied?

Thanks
 Manuel
> ---
> [first send]
> =C2=A0https://lore.kernel.org/all/20260902144210.703915-2-manuelebnerli@m=
ailbox.org/
> ---
> =C2=A0Documentation/filesystems/mmap_prepare.rst | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentation/f=
ilesystems/mmap_prepare.rst
> index 82c99c95a..0482c21b4 100644
> --- a/Documentation/filesystems/mmap_prepare.rst
> +++ b/Documentation/filesystems/mmap_prepare.rst
> @@ -114,7 +114,7 @@ VMA Flags
> =C2=A0Along with ``mmap_prepare``, VMA flags have undergone an overhaul. =
Where before
> =C2=A0you would invoke one of vm_flags_init(), vm_flags_reset(), vm_flags=
_set(),
> =C2=A0vm_flags_clear(), and vm_flags_mod() to modify flags (and to have t=
he
> -locking done correctly for you, this is no longer necessary.
> +locking done correctly for you), this is no longer necessary.
> =C2=A0
> =C2=A0Also, the legacy approach of specifying VMA flags via ``VM_READ``, =
``VM_WRITE``,
> =C2=A0etc. - i.e. using a ``-VM_xxx``- macro has changed too.
