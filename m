Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DD83431E6
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773513548; cv=pass; b=frcz19UrHNlkJPpgU0JcslhWcTVIiyaCn4I/CCZ39q48FAqcGboyBJ/ZCaN3s2zXcTJ6ZIbAWU2NVws1iixcy//UVM2TEqL1LQvsgju3LujBZWYvW1oO1lI8yIMkkz4yTvnPLyXo6FFk7+HIvSv65kkEl46v4xWIdilRv0lBj9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773513548; c=relaxed/simple;
	bh=AZrOqUX77UA3vcyaoFXxYGiBi+f46D4ZwPXW+m53vIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BospHsrclYV9F5Khi9UXcubPK+a0W8X2rgYRHTSrAsHj8QZRZPXfQNVtJjzCN0cEMTe9hspg4dQ70kIhBDDyvD3lBjnZx5QYzXagWuWxZhVaKCkEbiHKk01lsQ8NYrkHaXnj/btQMQJDtHPJ+GoPeciNu/u4nnneXj6taGqL+TM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSRuFiB2; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSRuFiB2"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-466f935a82fso2187866b6e.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 11:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773513546; cv=none;
        d=google.com; s=arc-20240605;
        b=K3Sew9UyFsrMat3MzD0BexO0/6/76ayUGCKDPeXzpbJz+Tl14+RP09QH26bM2U9mT2
         onTgspUDicCoqO76yNzZFx/4UZzd8KQqKMi9bnOCaJW9A9CJJxhJkajRpKH6tmK77IpL
         K7d++7aZwtwqSU4bS2jem9fqsWoRnm7NZIeXJK8kDmypNPF7d1itHdt3rjRU+XWBQtS8
         YUb4RmHVrqQj8nArZzuJQHLH4jtvXdk0286vXd1RrSTHqD1jk/5wAbxQ7Az2NSMGZhZk
         wZEW4UVOkc9agANW9OXWG2CS0ktCNZU9xaLyOZ4/+rSwsNZVFAhPpg4NvO9qzQdDMQD9
         kQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AZrOqUX77UA3vcyaoFXxYGiBi+f46D4ZwPXW+m53vIg=;
        fh=L13Krgq5+OtNyExEsdP3FcA/UXwNGvylS+2OrWTblIs=;
        b=G+BvsIxwU1e3H+HOQ2+/rFlgcRQGx/qA5jC6E2C1Qf2xKybMStwkg9vAsPVKIIIunF
         nLgsAUsArVrAGKmst9eeDrxfnc6Z7hs/o3hPyKs3ubWMkRk2fhGPJoOZdd1VM+YcTQnn
         3W/MHpCxmhjLB/9xDcUcqAOoWexnzP6Cwr9Fmq2ds6bicQhgzJap9FXcqw0R9exzjyWU
         d0zF8QBTwkMy82MKuc4mvzKEJswMX/gYiejuw/3+qqWGMZ4BlcQ8SWIcWRI3zvV0/sw8
         pvxHQC18RuqtOCyawNAdA1TEBvlyVB3PMLKzKhx9v8/YratHK+hyULfmsliNxu5r18sn
         OaVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773513546; x=1774118346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZrOqUX77UA3vcyaoFXxYGiBi+f46D4ZwPXW+m53vIg=;
        b=dSRuFiB2xB5Ere9984fBhlFkJjX0Iz0i399rHrPpKIl63yJ17ZpXzbbk2aj8c8i9HB
         UVbI/LmsMD/+sK7JAGMxOSu1C+hDqaEaUxmYd1ckynhQe5eWvW9fh+MmD43ZaqdFMUg3
         lKQs5ighmiw2ndqqxZ00s5Hj1EisWtf71/9cALIRn/Xb74JHaIFThS66+TmAP9z+NNSm
         /LDQKy+wEfili32adEasttro3ZCmH5fMw8hP8NyKFiS6PDvov/7dKxPAnd7kn7zniY4m
         r7YBFJWlwdqyZyp2GEvSIAGSidYmWPgdpJHPgmEBJNHnpUtDP4Mz1bySYsBphDB2X+3l
         RqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773513546; x=1774118346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AZrOqUX77UA3vcyaoFXxYGiBi+f46D4ZwPXW+m53vIg=;
        b=RNiQaI1y2LKaqt38IOftXCfJ8IVAFu//hpnskZtsRJ+W9AQqNzC4W8yMJfA3vX05Ns
         wE63+4m79eE9fS+UuiMj76F2R2dTnt11KHy33eenWY+Vs4juLCpqF9odQmYHqNhlFbD5
         yNXc6f1eBJ65dUxBVKsroa2bzO00gZGcAaIRO3WaWnYwiL5MQdU5lDgEFSSZ5VXmc6xI
         hSVZ6so8TyE/syk+5rCGluQo6R8AhnN8ixWxOGCJtGWJXbUAUV5HpMc8XTpDb4+YYEP/
         WQWUOMs1OIZ/h5WxWceTZFnIqoAda9s8QFhTrcizGoRE6kIZaVAh9IO4qtl9dZeeKq7e
         kbPA==
X-Forwarded-Encrypted: i=1; AJvYcCVvjU24dFbsjHIADcK/QF8NndUneRdrEDp72qHYzqFaPIBWgL+yc+yYNgkKAWoc8gFrTTT9l2Vk7XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB//9RR1ODj5xXG/+q+P10k8Tgjpk4dCl0vEvkPHFsVdcffKIs
	10QkH0cqm7JCN31dfqghdEHVanK4s2xQM4MfCwOooq9Wh0GtaO4c+53EId71b5kTlGTcdMLysRk
	1QI9yKzbGloYUm/vgt5QJazM4mpGai6s=
X-Gm-Gg: ATEYQzwwAAo3DrGpgupjGzwOqdfxE0NaURxEDPip0ll1B3OuzRqbEeYnZYJLi4MDfRV
	eedDFr+iJv3FhNe/LtCLev/Lgm2eaycVIVQqA4Lj/imXjuhbEzGZxQwj8FP7+NwTp67Hr7M0r3H
	FwYnKYIr3k3nYQavFLaL4LQalzxhm67Vm8oOjfvyzo6+ZRnLLIcv3kCIa7xWIbs9hhsOFAULMdG
	0DBIqBcjceBg3n7mtdelbhdY4mEeUGEySgXPKlwqB2h9d3huJUTgUfyg+YzM8JOPmcqpcaLQKAP
	YwbfjFSHZ0AAyi3dxPW4O6pMWzpYiJefRqiW+ftIkRisaSgHx/rV8JgVE6cSKraVeasL7w==
X-Received: by 2002:a05:6808:1b2b:b0:467:318:a74b with SMTP id
 5614622812f47-4675716c5f1mr4054747b6e.28.1773513546160; Sat, 14 Mar 2026
 11:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314152538.100593-1-xaum.io@gmail.com> <87ms0ajtvy.fsf@trenco.lwn.net>
 <CAAZVx98Sz1MknCcMpQXxeGpUjXBDyz+0KyRuUiCXsM+3qzqpeA@mail.gmail.com> <20260314111757.2a17c3acce8c3a1eb68ed209@linux-foundation.org>
In-Reply-To: <20260314111757.2a17c3acce8c3a1eb68ed209@linux-foundation.org>
From: Kit Dallege <xaum.io@gmail.com>
Date: Sat, 14 Mar 2026 19:38:54 +0100
X-Gm-Features: AaiRm537Q06X8UVE9YoUBvoT0K074F941B6dRgRuPTK0qHXNEw40OFUaMlZ389U
Message-ID: <CAAZVx9_6ecePCB1MMRa0q8V4afa=zRSmcaiozaFPDrrK-+bv5w@mail.gmail.com>
Subject: Re: [PATCH] Docs/mm: document Shared Memory Filesystem
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, david@kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, Mel Gorman <mgorman@techsingularity.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thanks for the positive feedback. I'll add the Assisted-by tag in v2.

To clarify =E2=80=94 I used Gorman's book as a reference for understanding =
the
subsystem structure, not as a source to copy from. The documentation was
written by reading the current source code and verified against it. I
didn't contact Mel beforehand but the book outline was only used to
identify which topics each stub file should cover.

Happy to have the relevant MM developers review each patch. Should I
resend the series with the Assisted-by tags, or wait for further
feedback first?

Thanks,
Kit
