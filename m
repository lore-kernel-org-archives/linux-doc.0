Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF1A2874E3
	for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 17:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774804913; cv=pass; b=EqQ8yCeKhCJgz2qpC2on9wVLxPY76+Ez1NVEE7d/74nUV5UtDZBIxmNWToDYI+h9BgQh+sWMB0ByqRCR7hFEonjr18I0YcYvi1B4CxhnPSq7wCbteyvTasP/Isb4fWr9M4xqI6diJ10AqzLF1lUQq4LvNJxVMZGvaMvxNz3eY6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774804913; c=relaxed/simple;
	bh=4Pumdozvsyi9KvTfAByTcnF+TKEeR3p1fRX/av2CKYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9dGHFPE+NlctJco0xXCXlmJMNdV5kn+dhci/NX9RysneaUyTUW6E0CLrApbbL3tbxcFqbM14Jla9Sy6QNNDE8hXA1mJAcAl8RAvaKzFLQzRnnlSczlFpudLYdE9VZVl7H/oIZRa3I5pgmyYfxd9Xlc4lAdhzj9/EmM4bGVF3LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4yfflk8; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4yfflk8"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-67bb19ac35aso2692059eaf.1
        for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 10:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774804911; cv=none;
        d=google.com; s=arc-20240605;
        b=XwnhkheRRZ0PoCeCT5jUBv9N2d80Rz/OU/JFfmR9ReGV+aSyTa4Oe//pHSYxLRQTZb
         WiG4DCwdDBNTrgpkEtijwbt+FQKKGhcm7OJoYzQnzyi38Dog3UJRwqo420bgXnJZ6Ia9
         DqurXn5RN2ACbCNjVxGXQ0/IH4pp3mvAmjbQ0gGWviv4+y54XDwkn3Kp2hxlq0sfQW+/
         sWQ3zNDE+U02R7iIKycwTcCcZyIPIJUgJc4sb8JgRbKyW8gujeS9R/tS8HfjJZVzJpLQ
         Km7GjJD6VqFKkmO5L1TywNk0qjr6BHDKj4Dxe4rQB8F2lk0ZSLuh00kk9bQEM22XDWgZ
         K6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Pumdozvsyi9KvTfAByTcnF+TKEeR3p1fRX/av2CKYk=;
        fh=f+XCR+tSZBaSdQuaEfeto/v6pqDFUv7J8tOlS38xRzg=;
        b=gC4bgFMhQXNAJo3ZBw02Trivyi3ljPiZUr2/2YMZzPqOuDobB/Zh81dh1A4Jv0liyM
         SMX4wJBQprylK50Qcf4iHvh2elckEYpelJ90sCs66de4zVN99B25fivVNM0JzIud6nGp
         ZjVEBzY1eKZvGpfg5chww0J2LcWqWCFAsBcxB4jfiFqNQrTZvCyfPE6F3ZMR27TINW0K
         YMONjqWlC8slR9DmZMtGzjmVzFvvNqW2PYi5TeZbqCOIJIOvCcN4LAGr44Is3nau0KBc
         +Odsg5b8R8/g2P4f+vEHWK9bRh0q6EjDEW3uojakW2DOgl44vZPsPqIKxPY/OEEO7pG3
         uKKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774804911; x=1775409711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Pumdozvsyi9KvTfAByTcnF+TKEeR3p1fRX/av2CKYk=;
        b=d4yfflk8KlMmP0kW/a4FxAnDdwuDqJ5mowKy/BHhakfSdpuippEhX9p+4XbnxeT4wC
         x5pHweAsfoaDlT48WbUcIvgF11o9HrMZ1RmNDRwcZhK8rXGNpyg8Z8KqeZAuHYUrhVmW
         Axc2CluZsQL6h568yrOUFrmH6p1ona3k9ZgayFgBDBZcxrHEwaMzgDMSFkgLJCST4jE2
         zl3a2vo60iQgFMjRAgLmZJxoNSPfUs1sTzng6KmRx0Lv55FD5gkr2T9xb8hIPY4FPwdA
         asBw3hLrYzhrjNjalZvnN6ZLDQeBX5za6BhRSF9n0dimHMeQAprKeHcTa9YnzE1fq+9l
         8hxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774804911; x=1775409711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Pumdozvsyi9KvTfAByTcnF+TKEeR3p1fRX/av2CKYk=;
        b=MpmbigrSCONTYIzGHvfLNQ7C0JwRvaM4W2aqp6PYwYCg99/ZnjtDTBbJBmju4Rs+wX
         9vXrPuBw7AK7KXqWJV8UNWw3YOml+rHpfTpEgajmLJR9TpjjHnpEa/DukeBJDJu1TYlV
         ZfpduvJ+DyPsTxINbfbWQOilu3XplQ4vDqfL1//mJjcGV2+tddmyAU1disjfFVlmGoRM
         yPWaqFcUiyq0Ra36awQ3+2kTlcGKu3vkFmr8TCCTwqt5MMRai1K3FO/78FSmb/gAqQL6
         celWj1OswwNmgXYqkz2TtsfKD2ZF+YSd8IO/+ip7xlYpx6DpPtcipLLWhZ4CP2kCtJxG
         +d4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+TaVOk4fW0dpy/pBBTfYyqb7X2t74xlI/G+5N2ptrEEvUrjx+NX84yCd++sEQIlSjs4lHheXivyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4mZfZ8glUMtHOJ/zgGYAeeGqddhlzVFUQFuEFfhN2ewH1Vpt
	8HKWLmqGs4sENCugtJKMGCmWyDH0D5zPG9ssyDIGAAR4K+65Xikz7rShBJ/KTdE/5mlcHl2pCKQ
	Uda5ugoOkTRvMcf5slkHjsu44Cpet1cM=
X-Gm-Gg: ATEYQzyJqXF4n1G5VPYO1a2zxD1Yo2GA4qCFBLTWVTx7hBDn8rgvMWJAvBBGHDTZZGs
	/Fg8JGWM9OO3tjF9YYlVGLLAyefOYy9PxMPyCLVHwbTaLDusrGYnovumn8+VkfSOXIKtcS0g+OC
	4Zu3xGhrz9FHo7xmS+yJ6R2PB6CW5DXMokUbvaYrlLw9kRLLqmQw8kOaVGgMCk89L+OHflwB9Bz
	b3o2G+dkdIVKZ9gwkiCbFfucp4S+V8acQ+BZwxZd2UgL4ANQBFfz9M+anqVZOscacDXEozV5PuY
	os3tpllceLr0yK3tMjSWAcwcHuRNGCvB1CGY2YlcAcF+FzFj8GR816r3SqGU+FGyfl/lGPs=
X-Received: by 2002:a05:6820:4de4:b0:67e:2c9b:54f7 with SMTP id
 006d021491bc7-67e2c9b5ce9mr1564285eaf.33.1774804910698; Sun, 29 Mar 2026
 10:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327181755.58540-1-arantescastro@gmail.com>
In-Reply-To: <20260327181755.58540-1-arantescastro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 29 Mar 2026 14:21:38 -0300
X-Gm-Features: AQROBzDzOHzzQU_4tz3PLxl1vgtGqiXhctbxcCfWpP_OHUsCPtK_8myDovuS2lw
Message-ID: <CAMAsx6f7c49s1F3BoRK5rj8X49k8Y3Av4ybsoFOrVxmQ89GGwA@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: translate process/2.Process.rst
To: Daniel Castro <arantescastro@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Daniel.

> +Segue-se um procedimento relativamente simples quanto =C3=A0 integra=C3=
=A7=C3=A3o de
> +patches para cada lan=C3=A7amento. No in=C3=ADcio de cada ciclo de desen=
volvimento, a
> +janela de fus=C3=A3o ("merge window") =C3=A9 considerada aberta. Nesse m=
omento, o c=C3=B3digo
> +que =C3=A9 considerado suficientemente est=C3=A1vel (e que =C3=A9 aceito=
 pela comunidade de
> +desenvolvimento) =C3=A9 integrado ao kernel principal. A maior parte das
> +altera=C3=A7=C3=B5es para
> +um novo ciclo de desenvolvimento (e todas as principais altera=C3=A7=C3=
=B5es) ser=C3=A1
> +integrada durante esse per=C3=ADodo, a uma taxa pr=C3=B3xima de 1.000 al=
tera=C3=A7=C3=B5es
> +("patches" ou "conjuntos de altera=C3=A7=C3=B5es") por dia.


> +(Vale observar que as altera=C3=A7=C3=B5es integradas durante a
> +janela de merge n=C3=A3o surgem do nada; elas foram coletadas, testadas =
e
> +preparadas com
> +anteced=C3=AAncia. O funcionamento desse processo ser=C3=A1 descrito em =
detalhes mais

 I noticed there are some stray line breaks that don't follow the
pattern of the others. Is there a specific reason for this?
