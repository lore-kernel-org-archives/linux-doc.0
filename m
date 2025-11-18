Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0076320CA4
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463555; cv=none; b=dNUEOHqH14HDS7CmvekwEtFBtaGqXQVA0VjxLF2SwDXEGqEmR3BfnbYjm4qT4Xu/EmZQZaUWHMM5OsBvu7RSLKeDVzDNZXWGYTZ0iJLIYk6fBdxgy5M8lsjvzoHl2SYNsGN26Teug66MlhRUY+TxwwLJTmgBteit50XZZqCImhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463555; c=relaxed/simple;
	bh=cnNoKc6ahbOK4X13ZcMCrgkYF4u4+vnHSxe/lXXucv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIL0e6TqQNUcPXWJ6aOWN3ozIiG4as1GAS3m2ShynLdsLQzNr6+NwZWRELfjBmI78RaqAP752uO7FsI4A3mNv3rtc6/0geMHVH+VYS5vGT8IvoATbmAMZEU6Y4mBiQ3q3h1ZzfNH0KHaDPvNRA+sZSSruNKtk1Np9STa/Y2DwAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7Jdj1Rn; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7Jdj1Rn"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c765f41346so751720a34.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 02:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763463553; x=1764068353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnNoKc6ahbOK4X13ZcMCrgkYF4u4+vnHSxe/lXXucv8=;
        b=G7Jdj1RnpwHnVrLKjYi3lkz8k2vZtQe35Vh6unpTZLAMjA2fAUjnyJmKGsBGE248LM
         jQaD4S31LV7NRJH9k1+ZgKlgz1pBl44MOH1KbHlqy7sie8PtCZ3b94WEdWDEgr1h5LBx
         tt0HyqBIt5mqY9vfPrepQhJNwmMzI6BpFJIG527fQNk/sI7stmeLbnwFsJ6uQfQZKiJw
         x+5aUF6LbUlvhYRJbMOARodba/ktZqr/OV+mHhEf/pe3umB8jqyZu4/zvfUAhL4eJFzL
         ArjA5PfdmgfbUJRcJL4qKlvRDRZM++fEbue/oao0OJaUcEIZRlxHgnhisA5G3chkVo2T
         hgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463553; x=1764068353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cnNoKc6ahbOK4X13ZcMCrgkYF4u4+vnHSxe/lXXucv8=;
        b=pE2AbILqjvCbAga+F2lfqBNwnVp9JIBA60dUyfBze8Cx1ttzSFLwkoauzxhCWLse0S
         7ymFpBNsVe9lKptEtjW0JylOHbpTjrxh61NcLkccVjP7gBW6KQbntMIFPZ5WE1HQt1Bp
         rkVdT8VlTuFjGpQJS0pKZcokdt0DXOKLU5iMTGCIVvs4tPysf17p1uLOccEvhYd3T0YG
         k0aDzx+4HzFZu8cRV5RzLxWemlp3GgRL8jlctN07lRmmsqCovQYGXYsm/KhAsafJFas1
         FnXPcL7lvqU8YGNDGj885brhdIvggYok7NtdTeguL2DQ7MQ2Ff8N6FqLIF/lAhdNRCbl
         VLlw==
X-Gm-Message-State: AOJu0Yzf/DYfLA2sQs19iNLIO61EXzFUU3a+Z585zpj402E73FZvbReA
	APnx/mbKJmsZJzX7IOAGdxlvRWOb4E/VMLtEowp0Wcej/3fFCbr5VJCO1BrhhRka4BoRKaia3y/
	bP3hBmGLTt7RwRxodrB7yKCGoA8WxE98=
X-Gm-Gg: ASbGncvQ5Gxxvn5taFY+Ta+uiGphih5HGwEmdsqfcL5c3gJXKwItvOS5/EII18g0TTG
	4dfHYUOIVa1TWih8Q/plU6wBoxqOUPhFfRdAJh8San7kTBiX1abFEuZO9JLxWtc3KnnsxpjRxof
	XJeunfGIs5DGHol/fD0BVNkkbZh58cOfbGSvfCdLUu+cepTWG3b1ls1+wmJ+F9V+4VArfFwBSeG
	ilEdwIUftFxNcIRfqRY8p4Gbh1D/cyCb1FLyAvg6X6xFn14MCaKxEkjm/Q=
X-Google-Smtp-Source: AGHT+IF/Wt7E3d3+OsbTRb9PPONGXopXd/F0gguUGkatb6NgWUwG7AcgrynX2DLgaozzpM+8/+ERpccr2n0aKh6uKaU=
X-Received: by 2002:a05:6871:330f:b0:3ec:5e47:8553 with SMTP id
 586e51a60fabf-3ec5e47b3b6mr1643746fac.0.1763463552792; Tue, 18 Nov 2025
 02:59:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFb8wJv4pUusuW-NsSsa-v-WuHZmbHS8Ha9mydqQPrBAMMQt6w@mail.gmail.com>
 <6017104c-740d-43db-bc53-58751ec57282@infradead.org>
In-Reply-To: <6017104c-740d-43db-bc53-58751ec57282@infradead.org>
From: eanut 6 <jiakaipeanut@gmail.com>
Date: Tue, 18 Nov 2025 18:59:01 +0800
X-Gm-Features: AWmQ_bm-WGIecqC7Dc0nGnBQp53O6yEYFAs1saIuDv3wSmx0DHe7finyvs-QpyQ
Message-ID: <CAFb8wJvUYffnBY6Mu=R8+NQOE-5PM8wRZ-r957Ya1JJ92ZuNsg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/admin-guide: fix typo in cscope command example
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

Thank you very much for reviewing my patch
and for your helpful feedback =E2=80=94 it was very useful.

I have updated the patch accordingly and sent out PATCH v2,
which includes the additional fix for the documentation
comment line as you suggested.

Thanks again for your review and guidance.

Best regards,
Jiakai
