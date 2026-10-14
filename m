Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61AD48A2BC
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 21:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014009; cv=pass; b=RIIKy9+gqlkSKGeXSprwZyNfYrB/UAapp9WqTjXYCE2/VehGWio/cKtZvKd5+K0RNpaR9EemV0cHNrcojsYA6onrybNahTaak7f0HJMMynVVbhXIy/kJvmxMs5nzzQixLD1HU6JugvXzv891GORY2i5KEXSE/695EzyqMpR6IKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014009; c=relaxed/simple;
	bh=6ByUElvTvbGXIl2svxkrXNY8+hn0etgON6GqQ6cyQTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYlKE4is45lZd9g4f06RHnsXqm7nrgRoXOOAKH8qJXhEUNH0qMaRBAUbO+U2LLYgb4lhjt87R6gXk4jS2O+HcFDnz5kz/DoCHzp8r8sP7+LTKb2vyfRJqDINRHrpATRRcfC25rPXrvU2tRCEozjFhKGE6tGyPt11AWu6S2xn2XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiR+2g3Y; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiR+2g3Y"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35179d0747fso369519eec.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 14:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792014007; cv=none;
        d=google.com; s=arc-20260327;
        b=DVlXu+7ab0r5VtYSgLobZLSNFMLkeppRcXKqTF+G0LvLFFhuTmQJF3k3bX4vjd9YtX
         8NdC5iWYwGHddCsz0OTWVeP/tWPE1HT7urN4v0B6bF+TpR5+z0JaFTWEXWCXL6Z/f7nh
         4n1ciQ1MxMJGf+hlXi0Ac3JbZuW3uZmBMIpIrkQ5KnbQhQnRzmmT3NVhJoUAmxshUReF
         t2LDyQGuTWvABpMy2aHgpbnf1ItWga1bxKZw0FlLA/KmmZ7aDtasz+mU3Qjzn6hlkBBY
         LtaBygV9yq1cGcRU6EyIFIV5081bP+BK4T9RXS249BGEzR1L8VeF3F90EPzFUmnjIYRF
         dnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHnikzVtWxtSM4n4XlSloqPUAIby1TRVs6neMZoe1Qc=;
        fh=OynuK6YFE0qArxJOmppOO6gtXmtQ2F9/BhziKfNl+io=;
        b=GDwR3zb2JywawTUGhmwpW9f8GBwCWx593T/Engde6E4q+HiIeyUzJaE3xhy4O7RAyQ
         LYwEcXLUbT/8JWXhjkazUi6KZeDxo6n51tzP1F0ebQjMxzQymVvkTJCGRvw6/R1brxfe
         PedfiCh7FU2xke2nTJ02AwXw3Gu+7OcQmr/Fn/el4PcRrDCCbkSrBPt82gPj09VdUn+k
         Uh5JLPb8rRVxaSpQ1qcZuuA57c0+7WjarD+gK5hsETLotsq5dANwkxs1qaN38pQ68muO
         K2XQFBAiOwmSMOHQBlIpRkFSQFrmjF8qz/Y9UNMwwDg3feSAT1XlKfy8xO6OSNGHZFyU
         hZ3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014007; x=1792618807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHnikzVtWxtSM4n4XlSloqPUAIby1TRVs6neMZoe1Qc=;
        b=QiR+2g3YVMWIX/sccYpOtiP//hCbHX0pWh0i2YDhfspvo8ESjM18rSssYbqCrmB4+u
         VY8H3VSiMrGN/LEpNY9cGAEVXyTC8yhwM9TX+ZCqb7M67G4nQHm5y0Dso1m/e/Iwv+Xw
         IegSm6MjwopcOKuICFNT9SGLvOH9HpyDqUbL6a0u92xN7e+7zr4uKi4JO7gUeUUZd104
         rteU1AuRaMe5vJvDxYesaWwDwILX2d3EYY/tbKsIs8WAB2kk7C42MRxQ1lZdo25KKPoX
         Pk9zcRwXYSjZasSFnoqpKzHYfjDKXSMD29+zm46yd8TTIecDtqwsFnR7Y9OaQi+AgIgf
         OLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014007; x=1792618807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHnikzVtWxtSM4n4XlSloqPUAIby1TRVs6neMZoe1Qc=;
        b=MIsklY4zwTX88peoXRKEDiNTQ6YvNzwnetV2UegLdlzfdFJ0ZbpkQcIxFYk1AXW+hm
         W9R+E3RaoR8wDSvLCkT9FcssgK6hNq507sJYXK013VRBztCljOgiFN18xQOBPSRI/ptB
         ruWlunhkFGnXxozshsqjgpG/qZFnBqAcjOuKNe4mBlpJzQBUkWhW1ArsPz/yVg0zrYDU
         y+G0hYwHQ2Q75ianRaqjd+5o8gFMp15iw+/5caCgBvJaMBcI9JyrtTltGyQcvlo6X5ie
         ejyh46gQsU40k9hZpewt6lvCumQe4wTBjrDKfSMxIbHpyLarLihFMwTu0rIazCz1CPz9
         IsJQ==
X-Forwarded-Encrypted: i=1; AKwUvByXG3Ie+az74YsMgHvsok+uZIqz9GX2Ws2MyrUuYmffL8iFB/q3Uf5xRQel2ObUvoiBH6dhracwcME=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgxWOwgfjILG2Hz/CUIho8oL8ikaGtVYl9SkZmzDFk0aGvHcVy
	dO0EpqKJYLYQcB+BmqEyPvP8YzAMdFgo7RQkHna0TJX856giQS86xGo9aFIO7rqqIAjmb1KXbpO
	tDwXNPTLijKsE1pLbbUr87I664I7eSFI=
X-Gm-Gg: AYBFou1+elfPgsoBYdHA7isAyZUlti3oONHXZiySh0EU6YvfmO13Et26/+cGx4Y4jPF
	QR0BM9BAwfKUzs1PXnXggfMiqMmKjyR2WsdI0kSpyIHrODcZ9gc/nLef6H8/oRT/m0F4h8sLDf7
	3E9n6kiY4WNVNeNmA6vepJuPY1pkFyGFQzCBuL3kRhgKxZtNFGEjubds6lDjiMWZCuBY0EN8088
	Vc4P752gZIMaqOUapbK0xlRh9oG/i8hQiUiglc/U8PphosYAjeOCcD19yH6PpjNTktDTiVv7Sc0
	rdKI1vWjMmvN/61gHG2nSCwqtPtx43j1mjj06NV/RVnriLF8XWrixXD7JqeQbIMegGolQLMESag
	T3lzY0rl089XnbZj4Xkf1w12dq9FiaMpd5CKxFMq3jRSpCCjLHhmqMgkpfKenhnfqk8NJ4fNlYY
	1UBB0lXf6a2qKR4XbatdP23oldwSaDgevJqEx4LHGP7WXbWXueD3g=
X-Received: by 2002:a05:693c:66d0:10b0:35c:492b:e310 with SMTP id
 5a478bee46e88-35c492be9f8mr12948382eec.0.1792014007399; Wed, 14 Oct 2026
 14:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps> <as_j3DawEZQWA4ls@mit.edu>
In-Reply-To: <as_j3DawEZQWA4ls@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 23:39:54 +0200
X-Gm-Features: AclHuK_5--FJcHdnSAu17V1pN7IFpqktYq-YEZQOni6awj4McI56yNQSA9BFuz8
Message-ID: <CANiq72k1jOGG4JUWE_8AYwqnJbFRGieG2SBMJ_LLVb8GdjtxdA@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Theodore Tso <tytso@mit.edu>
Cc: Sasha Levin <sashal@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, 
	corbet@lwn.net, ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:29=E2=80=AFPM Theodore Tso <tytso@mit.edu> wrote=
:
>
> My preference is agents/ because these skills really aren't docs at
> all.  This is especially true if some of future skills invoke python
> scripts.

That is fair -- I was thinking that some skills will probably refer to
other files in `Documentation/` (like guidelines), and thus it could
have had some value to have those "properly" linked and have tooling
check it and so on (since the documentation already natively supports
that).

On the other hand, one can just ask an LLM to review if there are
broken links nowadays... :)

Cheers,
Miguel
