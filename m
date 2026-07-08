Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0692D228CB8
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515768; cv=pass; b=QJOKsHZ0OfJgPKH8iBdANl9pq2h5HWswpvV9NV6B/nZ5lHcSR1lH13PnDlyIixtI8PNLW+0MBW0LVVJ/6Eg4/54/wMs1z7FyoHAFBhEQ8j01F+gNXhGyEg5VcmGrguudCVkovEs88nv1oN0z7NZlDzA2wxt0PdqAKk4JkPNonKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515768; c=relaxed/simple;
	bh=01GSOieINClQbTWiNGIDEavqyXKAQTpjChNDJs64pCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtE+WEsP5oKfQcB4igjBx6jj8Z8O2rRw5AvoUo/XsoPWyIADz90g0EFR7q79Q9uRbr33xLOWtmr3m7kGEQZ3CLBR0aMWlL9dCrt2zNtIaktCUT5BWXSb51j1gZsu6yNZWioRYb79MkwXf1nch8LmX7yRwFAuYXedXNU3lTdeK6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZZI31/F; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZZI31/F"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so54399a91.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 06:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783515765; cv=none;
        d=google.com; s=arc-20260327;
        b=P6dHwMxgRXrEsYON9cOL5IUVExXEXw0F/I9BZZkOylAL76Yl3r4ibIO3K4pOIdY6T6
         8O99P1xhSpIPff+MUvwjzfceltHfKtscOOreyhkEXvY59yJHvp12jZqaeWJZ0NUjiB+a
         lX9598as3nWstAYIXdRmSss7KEA49T/aKJ8aMsx+0Lje6dtrs9hWOE5hHLw0wiYDSKGN
         z0TcUe1jCO1WMgPHk+kSqRmkdulJaLdYmTDHTkK9NaochdlbUPf7sC5MyD1BsaHsem21
         JYeN1Wic0DGZOyrZNWh4L9pBuF+jpaCqDxoMZhg1kfLrQIWEnVqQ8+cpOq+XIjSSpAF7
         6KDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ffbj3vyfKfSu1/ovXdhyqJv0LJd9O4yZhbGsSBgFMUg=;
        fh=oyq+Tl7h3xh5Hz+Rb2hruh2ty0TH2bZ286O69JBlRio=;
        b=B/PIaUTl3ksucHsW5Hz9FMI2u/j5ovJv7Vk34y/4C2EvboRFMTC9UUlUhEQbjYhr2a
         ezS7NIejzVNvKRwmVy9Imn395u5VhEYWj5DtoeRh2QaU2WgCtjInIdcT/QyXuPaV3MJ+
         N+fF4Y3BbqnIEQIherWHryR5Dijc2wRN60v/UsQJAIzS/TT9nvmaH0mR+ZPS+GLwT8a0
         WXF32ERUC0Lz+Y0Xkubh6hK1qCkBLoOetUXGgHkbO5YpMPdsc+NjzSB36nR7KiVBw+8Q
         FjAqwDchA1Agxf6wEj4lPUgnarciMZ96024w2i0rnbdDvKNZU1LuMXdwbsORbe+ewfDK
         tOCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515765; x=1784120565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ffbj3vyfKfSu1/ovXdhyqJv0LJd9O4yZhbGsSBgFMUg=;
        b=CZZI31/FxNNpWtOly2DU0cXbcA+45474Qkg5GVMdjIxCS2OSchNs/Q0OhjpcEtZhOD
         inwHap9QQ6Rk9y+fHtPxiBYHoQDU3vtm7CWqCwBNgYEyJRCVEOa3RUN2E6ujqYp22y9B
         Mw+ZwHg4yseD3P5mGWFCKbfdJSRzaLpFMqloutDgjsaVT31q7IkFKP7NXiHqtskjsf7N
         tTc6vNeC7XGoSW084r+90OCPnkadmwy2AkcGHo35/LCUIbjtzc3gktWRTpkCa+/JMfIO
         lkgYLPJj6AIXlrlCTDKnt3p4zdevPYKCuW9eNcogHUp138Uy+0p1QSt/1dETv9dO2iud
         zy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515765; x=1784120565;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffbj3vyfKfSu1/ovXdhyqJv0LJd9O4yZhbGsSBgFMUg=;
        b=f1Mc7ugdI2lPXR6slCyhxTWlD9BJD7PQq0Ex36J5kHtoqTO8XHkEsWscMKmZkyaX2L
         D3Q0ifQVws8zKIRzJdAohIi9W0s62HjrXN2vtpO5vkwuCkqo+LtV2NelJ4M1fqJPbQ40
         83Z8aPWjv/9F8WBxjR8y6ac6zTu4xbkMaNb9P8TwvPx4dL0n0KYEHRU4PLwdtT6QXq4H
         IIamKxj9CcMdeN4UAqMYtXyFVm8rqOOxKEfdCGtHwaGjxDaAXNX51ktrkrxs8VUn2btV
         kmhcyNTlKEmVcExaadtmdqedbaqvhGUfVh+p0Zvd77z9CF3eBgSiMnN+J7heUGoHXwnT
         kwqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDtYLl6kEaf6B7kiwihA2O7vLCyYCW806UiAEKaUfCmqO96nSRA1Vg8dX/LAVzrYuii8kjBRuXcOs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy71FbuvjP81V+CffHlKxtaLvWpxiNbDaK18Rn/s9BW2/ZRywIG
	gy/glJ0lA5q4Gja3VRaX1JO3eG0uyXQDbesGoy8YG3q2HKeeh7JLP0qg3QSoIPCx8Cz3JAWLr0Z
	94svFsfKVX4fe9wHmTSOpoAQrcby/hpo=
X-Gm-Gg: AfdE7ck2h3eWbfjVbRaydGnVvQpmEvJ00fb32kWQCGMxtRgHAOchCQ2+x3e5Q2ic5nx
	FMmspjh4xodb2/9Mm/b5DCzNlyhBQFy/U6QMkc1nR/yBAOjZuuVHLWb6IVB0uMw1KHNIxHbSTLg
	0v0kbCZI1/eWYEh4XFVA3u8X8urKpTv3XedQPLLEnIIY9jwIS08TrUP6QrwrZtqFyn5FQ4M5KNw
	mLjBmyJJzrsPKd0hZ8KUE6W3ZLTerFcXf5MyymtNDneAZRay+/d9IE8LLsdTVarVslIhkFXPPKM
	0GV1PxUF5RALZtT5GRuJ+U4CXdst0oRAIy0lA7Kv4Vb3zexSXr+8ub/kIqa4su+pXby1/2B76rc
	M6zdN0oUL9NYp
X-Received: by 2002:a17:90b:568c:b0:381:16b0:55c5 with SMTP id
 98e67ed59e1d1-3893f97c879mr2063340a91.2.1783515764982; Wed, 08 Jul 2026
 06:02:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707082104.90951-1-harish.cs.ss24@gmail.com>
 <db94b1a3-cc1e-47e8-92ee-976400209a43@de.bosch.com> <7bcbb466-0c2e-41c5-9c85-8b4e73348d1b@de.bosch.com>
 <CAGjpMsQgjBLTMt3PU8FHokCOBWc59YFagSjqcE2ZJSBGixLGOA@mail.gmail.com> <CAGjpMsTvHHbfaGXDTK+pK9j59wpAx1zitfgRDeC1NAnbt2K67A@mail.gmail.com>
In-Reply-To: <CAGjpMsTvHHbfaGXDTK+pK9j59wpAx1zitfgRDeC1NAnbt2K67A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 15:02:29 +0200
X-Gm-Features: AVVi8CfG8PaAXSQQxyc-sE5YJS5cPaEgoiwxvzqNgWwMzRipNLGngs0fOznfSAA
Message-ID: <CANiq72k1kdv4R+QYyROpJmO6sZBASCh+RwYkoLZ=wf8zTyUrHg@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: warn on Rust unwrap and expect calls
To: Harish CS <harish.cs.ss24@gmail.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 2:38=E2=80=AFPM Harish CS <harish.cs.ss24@gmail.com>=
 wrote:
>
> Do you think using Clippy's existing semantic lints would be a better
> direction to solve this in the build time itself ? Or do you have another=
 approach in mind?

The most recent context about this is that we talked with upstream
Clippy in RustWeek about this again, and, bandwidth-allowing, I think
they are open to such lints.

In fact, for `// PANIC`, there is an open PR:

  https://github.com/rust-lang/rust-clippy/pull/15969

Helping test and review that one for the kernel use case would be
welcome, I would imagine, since getting lints right is harder than it
looks!

I have more context in the live list at:

  https://github.com/Rust-for-Linux/linux/issues/349

I hope that helps & thanks!

Cheers,
Miguel
