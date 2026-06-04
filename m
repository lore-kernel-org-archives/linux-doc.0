Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8A33ABDA4
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 02:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780541474; cv=pass; b=T4UlbpFHXMhglISqEWupP/dVC0R6iq06NUm2BKilzDmP0A7mhBc8o0l6l8DDFci30xAtoIQFNDS7Q7b03ptl2wHSt51IPyzkDQcJCprj80z7//WDydo01Cr6SuzPZAnlq5/0iMtIX4Vv1XA+WkLQJdg+859S5GSd+NB/PEV2ALE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780541474; c=relaxed/simple;
	bh=WSDjuI/chDemQ+ui5KsT5CLehW+/ybLcF69bWOtgr/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SEpskUHI7mKHWeck/uXttmylNIO7cms5ywp4S5L4n6Tf9nJFryea6jLW3PLrAstrLg8nbslfDD+2ZVyJ5hwqE3VmBQ/RNNOPN25DAjl3JDTk8xyXs619wHPby6eeSg0mR+8EobUBVZtAHLXB50oeOR69WwfdQvi8BQLeZgRCbPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3yQuAMb; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3yQuAMb"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cce8873b56so1777016d6.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 19:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780541473; cv=none;
        d=google.com; s=arc-20240605;
        b=BhQu/3VG91kFMEaLuZesK13L+UCKxTt1JDWQ/dP8KzcPkWVZf0iLgRk+hnP4KRfM8e
         2kbwvc8f7dH9WfSFV38DV2SHwZOvdtJcZaNCAVIxVGzxd+AScdXbHHzkNX99vaEMoV40
         w69TUYk1Lfp5Si3SwvruevxgCr2w3nMeSzsPhDQ/+mempOmCn9XtCtZdctJcMaGDG8F1
         3Xv97A7rbXwYFlZK/wprX5fC2LGU5KhOKRj50qDJvR1aWGr37XwokssUn10vs9e+m0dN
         tkWx+EcN7ddqSe3MG2hR1h4XJZIBxHPn6BIFfLX6/H6vYjTk0h/JgyiKCTItjCWw8QjN
         w7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kzOhgnxO+SkbNSwlg32hdJUJ/bQor23zjAjdxpgPuR0=;
        fh=ypXvQZ/ZpkXK8Ee/dpFp2aSLA4ag94SjQOPBS8tVjUc=;
        b=hAq0Ij5ok37mp0sO/i4RSZhJjmsOPI1REIxZ7I9Aj8vbm8KPqv9Xl4ufA2KaPF+73J
         qBd4cvw1+JAtoIexZWpWgZk/wJI5K+BV4IHvu5qM9wQKtLBHrKnEPZWsCFJK1yGmm/6z
         PIQu/quMGdKv228/eGkXlFtBvpIegKGVhxRVHDqt1UqzcIp9/W89SVpmjAU9N9OR+3aL
         BjyxVEn1NMCarOU7FwFvpNeLhVuRymXFG5GXzcH/Q6ydCIhX3z2hdnKliUu45YNvLA68
         MtKwwxPnZaMnUly+dbB81+AX51Xeae2XKE61huGREs7UsQwIzrAVyuqzQAkx7ZaH+eR3
         EUqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780541472; x=1781146272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzOhgnxO+SkbNSwlg32hdJUJ/bQor23zjAjdxpgPuR0=;
        b=R3yQuAMb0vPZZEuRWZ/LPOYSKUvkPkIVy1dKR4+n+iCYifyFmaHq6QBJcJR+Wn9qJm
         u2dQAj0rdHBaiikdRzqN5OQr2n3YMkkXWNibq2N4CmnrJcrHwNtWyolr6u3/fslkMjBC
         EsY4nPDYvG+otKBy1GD0HKAWSsgSZJCn1cgmik6xSF5gBtEfho4T3frWzNjVv74HswXZ
         5sCLBUZ8LQNe7+yV74PjZkwhDqCi5A61NHr0hpPln6JXpzGkP4SL99o73z5hlQWBtaG9
         p0e9HnaN3iGuN6PwfqvSDlk7xFTfDQ7I1QxkiBVRa9E716/6tcSH4ssUe56cH+LsSQjj
         SLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780541472; x=1781146272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kzOhgnxO+SkbNSwlg32hdJUJ/bQor23zjAjdxpgPuR0=;
        b=r1qCyDuzoXT3BECdx6w3cvdwvmcmbn4GiwZHDflXBQVOisvEkC4cppvZT1anCwPgHh
         8qz/zyfh6x4ZzFoklPzKNtqbMhOTpUw3ySlYGkYtCOrQenJDma+DnyTi8BkenKPG91di
         MwA5RXpzUhkhOsUFKzXX4C6woq3Xbqdtsdj+QtyLCZZi2UawlDkt8rXsn6vfaLEln/Lg
         zXPjEwi4fYupWfMvREB5OQxkXaxa7LTLpSRwuEW4relvKnEGKraS+MiMXrAOGnjMs1BW
         RLxkng6clHn3gdCFp08leeUzlqZrQ9MAl0OTAaW6cyEbhC9vn3rS2CBEdJQZwBKWvuzy
         mpIg==
X-Gm-Message-State: AOJu0Yy9Vj7Xp4lqVK/nqVxD5TkSB4qjC+v/8TDszGTV9OjBFogaZpmz
	kvQ3lP/c3H81/+QuoH7ONaIOaroghRiwO7bo0q+vjMqsf/yDOPo9/yrTLGAvq00dpTB5ghzXgW4
	1cfd/N9/bAhAs4zKGJstAX0s6TMymilw=
X-Gm-Gg: Acq92OHGUZtcfzsuQGly9EPf4sJmXunroe0uMFX/Yi5o3JbriisIKVAq6hMzVkyeC0l
	ODjZYmCymr4Nw1Smohlp2xpppqI7Tlcf6kAsr7hqybpAseDzlg1UaLhp4RkcLvNJZCfNnMkSplr
	JgvNKZuX9b4HtXA3TCBuEXeaa5TbnlDLQkCGUvnpjBPtIZmNoQAMVDwEKZG74XYAA2Ue4zQrxzl
	san0d5imGg15iCK0GzF4rCyjYbhEFMhJny0BCow1EgudUSRDjJ8GBsWEtp2Y+gz5zkDkt5rnw+o
	BG6OvswNKuNFCoaT2UTDBVCMMBtdZXLf86Unp6OVcROtTGE1PF8=
X-Received: by 2002:a05:6214:5c47:b0:8cc:6aa6:7035 with SMTP id
 6a1803df08f44-8ced81efef4mr30520996d6.19.1780541472503; Wed, 03 Jun 2026
 19:51:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604002212.42092-1-amandacorreasilvax@gmail.com>
In-Reply-To: <20260604002212.42092-1-amandacorreasilvax@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 3 Jun 2026 23:51:01 -0300
X-Gm-Features: AVHnY4J5JaAEUivqnHE5xMtIp0GVy91uKIJqVdZZfgCXRwVf9rvgh-MjHRP6UAI
Message-ID: <CAMAsx6dxBFjedmWYs-OXin9Cu4B11TmywvgE4_mKWSnD8ZSd1A@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: update "Purpose of Defconfigs" section in maintainer-soc.rst
To: =?UTF-8?Q?Amanda_Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 3 de jun. de 2026 =C3=A0s 21:22, Amanda Corr=C3=AAa
<amandacorreasilvax@gmail.com> escreveu:

> +Prop=C3=B3sito do Defconfigs
> +~~~~~~~~~~~~~~~~~~~~~~~

I notice that the phrase "Prop=C3=B3sito do Defconfigs" is grammatically
incorrect because "defconfigs" is plural.
In my view, the correct form should be "Prop=C3=B3sito dos Defconfigs" to
maintain proper plural agreement.

> +Defconfigs s=C3=A3o usados principalmente pelos desenvolvedores do kerne=
l, porque as
> +distribui=C3=A7=C3=B5es t=C3=AAm suas pr=C3=B3prias configura=C3=A7=C3=
=B5es. Uma mudan=C3=A7a que adiciona novas
> +op=C3=A7=C3=B5es CONFIG a um defconfig deve explicar por que os desenvol=
vedores do kernel
> +em geral gostariam de tal op=C3=A7=C3=A3o, por exemplo, fornecendo o nom=
e de uma m=C3=A1quina/placa
> +suportada usando essa nova op=C3=A7=C3=A3o. Isso implica que habilitar o=
p=C3=A7=C3=B5es em defconfig
> +para m=C3=A1quinas n=C3=A3o upstream n=C3=A3o deve ser aceito.

The original text explicitly states "upstream-supported
machine/board". It is fundamental to include the term
"no upstream" in the Portuguese translation to make it clear that the
machine or device must already be accepted in the main development
tree.

Additionally, I suggest using "dispositivo"  instead of "placa", as
translating "board" literally to "placa"
in Portuguese can sound ambiguous (often confused with an expansion
card like a GPU). In our technical jargon, "dispositivo"
is much more precise for embedded hardware.
