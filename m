Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0BC353A73
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 18:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783967231; cv=pass; b=f50gYriakAqIhmWhLpD9E0hkp7m1pzgJqI3ADpAeemfHWMdgEyh/FyTlKo9ZOi1lkkgqVVNY9GNU2F6CCJJLhQsvMg+hgaSZMnuAl57LVIcQo7rSHkcBPJGF+0Ugz5csjrHgVCVEN2AjkAZD+QYzeBGuYQ8hildSTWpAylft5RA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783967231; c=relaxed/simple;
	bh=dRAb2FAqeoWbI7IB4XOu23RiHvvIFe4Zues+YRtXhLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCtiFSsPJLaK9HkRLihw+nDCwRI9HP0twPS32NfRsnh9sfBAu6WhUKazt/vCT8Rftj8VPyOHGOptf/w3p4Bo7AddlDf8+j3lHc72gm9+bjuumb/pd38l2oyoYscHO+r38TZ6Fo/2XutlWhgHQltwF5/ssDvxogqHdBKvBuZ75MQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abm6PERR; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abm6PERR"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90004d2f7b7so48902906d6.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 11:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783967228; cv=none;
        d=google.com; s=arc-20260327;
        b=jYw9YQHGG/4bNiaEb+HFc8fhArpszB+d/0qyyuLNrkBpVOoWsPbYWo6XEAGdUpbaNA
         lXCalbim6Bnbf5fjz/qgV4T5l9z68q+xWkiHI22Qu0saI7NLa3UMG0M1l89zHNUDjvea
         lBaiqkzjzVeqR8gOntiGDUOTSaTbmT+g6vn0Il/ooFZ1P1spM0B+v4b6SF3Q/IZ0dc0w
         61A4KVtSD95qQC347IqTlpV4jiVq9K/3Gt21Jt2T7yuXklOTGrjwzWcEQFqvgzt/cFrV
         WQgyXG+9/F4a3FIjpBjbsWvGRC1YKqeSDXKG+G254UVG8kWROgVTjnSwP+AGIw6UAZ7y
         3e4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lo838R//sk1LWj2w3TOHNjKAMQsl4kZLBZcrPrj0ikA=;
        fh=nSU9rmRBPnErh/cfMrt9smGRLPrN9S4kzz3toct2N+4=;
        b=DCMUJks2/C03TU0txNS9KMdCDy1V3jRlZgre/iP/oe7emuVtp8IjS0aRApLudop68r
         a5DoIVkJFgrtHA53M+G3A9ZAeGSHkU5FbINsFaQ0BZTQbssydCe5cHy75V8JHUZzSELB
         h/JuzJKUGIiM6BD8ZQhrJJT+7oX0o1ofOKCI5O53E4F3O1bE984bWStTcatwRLfJg1UW
         ce4tFxd0+scRYG0LkDVdWUM/VI4HaQ1LuE5BUJfQ3Jz9ezCwRrOv7J9Ba6vHK+ikqFs9
         2dODxRNUegAbtNJaVMCmeLrVG5b2CiTDn1u7ToriIIkIe5yoN6/WZMS4dU2JBzgAx9nZ
         h+Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783967228; x=1784572028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lo838R//sk1LWj2w3TOHNjKAMQsl4kZLBZcrPrj0ikA=;
        b=abm6PERRtrutiOxC9+s9Os7qz65wu2RQByx+QKkH9TsCb5yYpegj8gtbQHSZrGftq5
         vlZm2F5Zv6v0juEcwHVEMVnatuxgjHFCxlajoWh6zVFJTfqgGuca7btXhK5r29AgVIJf
         yXKZcMJZFzMWeJoeo9IPLDSxbQqFqLC7WrBx58cKz2EuGtaDX82RbjR06B9CGU69Vgwn
         jrbHYnowcK6sWFLkeTheofYOoLbH9/+L6qX11hgFqZ+erFfZSZUdeiw32OVtbgVLgt+B
         6dtzdAW2vnknxOuuqOu5t9JlFJLnxfOp//xjvWrnggjKkugpH7+KzqnOlpki0klK8AVy
         1zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783967228; x=1784572028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lo838R//sk1LWj2w3TOHNjKAMQsl4kZLBZcrPrj0ikA=;
        b=nA4KTBWUfkfft3yWMoVvLMQAeI1Kze+thwMB9ai2C21TkwtY/rLcgaIBydwcSkML2W
         QzDmr6kOKQo/Ivg9z7RfBC+BIytvTtPUY2FSWaAqCn6FW6NEuwkZn6N0x8/hk8rb31lM
         U9gKZYNd4BL3XKddEpRbOOOsUsn0e9W+bS425BL2qYdhlDEYJBiJwzx+brsOfNB9fHYb
         Ud3N9IfHFfl1eikSQpMyxdRrrrcmBkxtdmhE22EcgWjzpR7OF9qDg/KZwUns5iST4OD4
         9ZnqbKYDFzeCYoigK9OQbGDsL0t/kMwH2xzLoj+83C5JYIT5hVPrzbHPMOyPXbRYPvLS
         o7Cw==
X-Gm-Message-State: AOJu0Yz8WGyYjhfYRS+ZSYUMLJdjl2eq2HhENmzS9/+eL2bE1mDPIDPg
	o0s3g++t+hz2sLoWlDbWwWE9dIz2DOzF8bqSzacs1WM+jfO0VCT6YlQQ4SEvz2m9NqQ8IgtPbuA
	BfLarTEMMjz3+LUm/MtP9pSFVY0Oe+1k=
X-Gm-Gg: AfdE7clPCAmyKpkPYE9FzeMlPjv+G337BS/9sfuib8fZh/gVmTgmdz5I9buvlYvJXrK
	pQNXkqW4uysYAFCUWKCVX2grZkLBA06W5tC3+6TrCjjeG4ciOHp9qfFOMeLJvS2b1QlNrY9CbI1
	2HDr6YDuS+8ewV0sVXWXdhND9s7W7QR+TjPKlIwh9+otuhhjetJUblOuqPVkgOVGpIlYouDLAiQ
	YH9VGDZYhZQoMLj7Qr2mtEEAq4aQXlnLYkLCUJCvKpjRtWHq6Z4yi8kZ6w4EzkdPQFaACIJYw8X
	2Eft6yfAxJbssshHrKs49EphiOEkVsUjoDZ5O5C0oNCxOiuxMOS+/3KAK2KibCEkdxpeaQv+mGu
	n/rbW9ZX/mg==
X-Received: by 2002:a05:6214:2dc3:b0:8ee:efa3:3b25 with SMTP id
 6a1803df08f44-90401f6e71emr116435046d6.37.1783967227608; Mon, 13 Jul 2026
 11:27:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713125113.20976-1-matheuslinuxdeb@gmail.com>
In-Reply-To: <20260713125113.20976-1-matheuslinuxdeb@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 13 Jul 2026 15:26:56 -0300
X-Gm-Features: AUfX_mzopgyy-a3khvLNhlUi4ebrWUB_thMvNvkxcy9CeVpHA4NBz2DEYIWe3vw
Message-ID: <CAMAsx6c8tpdGF6=t_DUUsfHtXVDBbAKtnTprQNfHSONjf0UCeA@mail.gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: process: Translate stable kernel rules guide
To: Matheus Patriota <matheuslinuxdeb@gmail.com>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 13 de jul. de 2026 =C3=A0s 09:51, Matheus Patriota
<matheuslinuxdeb@gmail.com> escreveu:
>
> Translates the documentation regarding stable kernel rules into
> Brazilian Portuguese, maintaining consistency with original
> formatting rules.
>
> Changes in v3:
> - Removed the Sphinx label to avoid conflict with the original
>  documentation, as suggested by Daniel Pereira.
> - Removed duplicated/incorrectly named files from the commit.
>
> Changes in v2:
> - I changed the patch name to avoid conflicts with the original patch.
> - I adjusted the dashes by replacing them with commas.
> - Regarding the typo, I corrected "conclu=C3=ADdasamp" to "conclu=C3=ADda=
s".
>
> Signed-off-by: Matheus Patriota <matheuslinuxdeb@gmail.com>

Hi Matheus,

The grammar looks good, and I'm in agreement with these changes.

Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
