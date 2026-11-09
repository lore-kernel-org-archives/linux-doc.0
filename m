Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794268447;
	b=4Gr+5wbbGtfLd4qJmsEsWGDAwQ3WO7F3SUBqK/8BpWU7Fu3CzdqQFoJmmSBZ2poj5YEs
	 0R3uTkL4CBsfYz1jSr7JH23ysm+F0K9xm4YArJHxu01ewIE+OkB8gUfhLX42YNBWUCFVy
	 5uQ40sU/ODI9BZKitKjfG6o4Gbo7o0d+EMgSqpCQV4LY5weKMIPCT/z/fCwpu17PnsC2I
	 Hc5q85cZxgho165EYQGuvE2woluRcXs8N7FbPmyeMzkQXreBvmyOzV07wIGC+5Ao7b86F
	 ViJM2yZH1IDhxblNb6JFXeM1aB9+ZjaLA0YEilLoc1++NI8TcLPnOGx8qqR+n4eaidw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=cWVC88PKMv4iuuD7NHmHgbX9G6GHyYodYe06BrIUee0=;
	b=N6wrq8T3Wn5Tr78XqlHUs3KSK0cOeuP5QIXKcMJeIcElcPTmZbXFAz95McrNQz0ddgp6
	 wxPGNxzKKqco3KHK7dPjdfAveZClpLZQ06on7IMS1hMSeSBwoIJksRfCHNcDsLScFXrdo
	 EostudX+CT6x8sAWbAK4XIlo0Njk2b/1q0Lm8lSAXyirMWuF502zo9R5eveohSZ8TCjsF
	 224N0lhz6Vnq32P4vgQeqm+YQ0RC8xjch7b3L8rF4r3U9+3IAjYa+BhphTOilzvaRc6Hp
	 zRFAveSbybYjC5ff/6ve1Gb+ZI/ip7OKHOai1VYIU30G6HeFW1or2gJEESCEp/ucdqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D69/XcJY";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094EB606A325
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 23:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 094EB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D69/XcJY
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91eb53957cbso19909816d6.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 15:54:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794268446; cv=none;
        d=google.com; s=arc-20260327;
        b=NgkakCYLJtIIKJVXVJrairsBYVCaXXOYGOsCSxztSXTd/8jP2NJP2wrwUqTHy8pxKM
         9flKHWLM2dJ5Jfkttuaxd1UOZF2eUMteHcBbvNGpAr2n3hyMR7kydcvoLjgHZE5jyNZC
         9buUInr/ri91Y37JjEGTN24Y0u68lNxcin2B92wTreX0+W5fERUbz5X579aFg1fJN1Qg
         /xP9UAXVx91PHlxSrST9Q52hbEYlXtopA0xg6dij9o3XrOFAwzO9zgHW8yGtXsi1qF6W
         OXVwszid2lwz4DcGnPXs0cUPNOVamHezEBOGiQwJ+PUsQF2v9bFMYwP6T06Cm1utmjao
         IGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWVC88PKMv4iuuD7NHmHgbX9G6GHyYodYe06BrIUee0=;
        fh=WAnsO6AGX9bD+Q65C2mAZ1crlfaaOFHTGKHAU1qlbhQ=;
        b=ZMM4PXExTTYogyYeCtS6if6PXoDMUuMt998YpoRVjlTK0NE5CC/nbkkUL4Vu08pN+A
         0l3mUoujexwSfRtCgrl67Dew/hlj05hR/IgBxTRpUvYAtmrCqT9XQDQJ91VcgARo3k+S
         2R1378UduRggL8P8xYDOjYoJMPw6Zqiri5lIiXwK7Ze5vmOFvn+p8AP3APXBirRUrciw
         9Vc8sYLZQAV9NDoriXhMCXu3I6G6dXqUdq4ijwFx+0IKxFZYsDDE4lt/d/N4EG5CMyei
         0JRxOJD197erzcU7JckaRH7tuVjNRcuqle/uDwugnsLIYm6emoqNDXkrFCyExQHXjmLO
         1cUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268446; x=1794873246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cWVC88PKMv4iuuD7NHmHgbX9G6GHyYodYe06BrIUee0=;
        b=D69/XcJYRna2ggdafPB7ktqQ3YEVj8KMAA1PSxBhy7JMQasGyNJkTXjylGs/W5N7rZ
         GfCN8fZ9B1kUzO8p9RyKaziPW5x5qbUyhxAS1xvGTdJxgnSHTVzNzRRcYtE4SfU9zY8x
         oWucdhhtBQVNQ6cIgexBqjb1G7lfvztbyHJrzmRZvlZ9JeI8Qvz0B45/33f5ZNT4VyoO
         VFBCk8qwzlYBKb0trYnc+pU8g6jkAoiaSbKtbPNxoBGmVtRzu2SfKl/2Mq4YIgAYVOVz
         Svb3S8KywFgrO5hGvxmF9y46+vFMhEPDTcwhBukHDYBkU8kRwA1dW7aY18frr6rKYsWT
         zdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268446; x=1794873246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWVC88PKMv4iuuD7NHmHgbX9G6GHyYodYe06BrIUee0=;
        b=WZ43UEJz9+mM+cn2DIH9voZUQFhE9Qdp4J+8iX9thXW0BX8BPYvmQoGpnKC9NVHxS0
         DTx55UiAMwV3JJ0q8I8sjMa/kRuWr5SIRO2tvhKHAuXa/4eV7An8FV15J+NTkdtfaLtE
         WEcIswOZYQ4hOhlHyqVf2oX0JSs3xQhKeBY4P4JhNcT5nKcZZa+qZscmcmRVs1QBa4W2
         ew0iMKKOJwLTYrCCcav9n2SsJNKfUREzcK25SgGPtv7cUCR1sG73ObGb2uVNNSoO97SV
         iHfDalwSp1YaqPXyXgziDZbZVLSNELGj2icxUrnttarl5uM3IH9TbRdANWinnCzXH8Be
         vKZg==
X-Gm-Message-State: APuU4Z8wsP4gT8vp/48pjNPuOBKQYYOKyZQ8Ag9gpSnMOdoaNtW5Zctw
	hC4qV+5aHOzos3D7KWfiMoyPIgmvy+7Dv51elzmQ6OMeGeuiYszIfBkST8q4KXrIyYYiD1xRmQU
	VjrSgIqjZfj6iHNOtYTah5IizSkD91gc=
X-Gm-Gg: AYBFou2jUJjD//Jp0V6+sGJrkZb6ILgt3r4YQogxgZ9WvFF4qZTmHoawMis69Jn6BzA
	ZBNlpz//9/nATDeEjacrwS0oC+INAcBMpVuazA9CDi9Nor9hHUX0CGAQAuTdmFJ20UMnWT0fHpN
	1qf5jEyL2zftpsW0ktE1PaFFwX6QV+cN7LX2qZuf23ZuVlnZQskJUXFEOf8UUwDbb8RNDa4iwYR
	APL7gboc0h/SXQI8ODfv5j64y/LgQXGG7HhoHDPlIEKCzNWGovsBUlZaZs3RVm2zLQ8MjIb4Dmc
	9ab9CDwb2LPx5WpT3dsi+zaJXl8jeWZatn/usNwyWG5hN+sLE75lvjxg1ov9wQ7DKI90HxNAlwh
	QgO9rLhKt0r0Afa3TPJv6fkqQzSfgqcAoMchJXh1mHWWhaVoeWGbqvLOirz7D9EcXfzHMGgWVeI
	kkDu7BUNy6m/nUUGCStH+QkVVzvGm20UJ2wkmphytZaX06ETiUjz3a0IJ648QckqIDfHyOTBFVG
	iwlzoyXdFpyVncPH/vvVfw=
X-Received: by 2002:a05:6214:3d9d:b0:91c:a3ff:854a with SMTP id
 6a1803df08f44-91eef7f42b6mr20524036d6.35.1794268445715; Mon, 09 Nov 2026
 15:54:05 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103033349.908133-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261103033349.908133-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 9 Nov 2026 20:53:54 -0300
X-Gm-Features: AclHuK-871HspvpoV86QNx327bOKK9xzf1CmfDYGKjbEkYRMjpZ2hf2T_CqMudE
Message-ID: <CAMAsx6fHbbhP21xRxYhzHRTwpqihrpFQ3HDB5KWpSdSWqBVG8g@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: add init troubleshooting guide
To: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, sashal@kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 3 de nov. de 2026 =C3=A0s 00:34, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> escreveu:
>
> Translate the init troubleshooting guide into Brazilian Portuguese
> and link it from the pt_BR admin-guide index.
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
> ---
> Changes in v2:
> - Add a commit-message body.
> - Match the punctuation in item 2 to the source.
> - Translate "painless" as "o mais simples poss=C3=ADvel".

Hi Gabriel,

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
