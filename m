Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1681B27280F
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763378770; cv=none; b=Slzp8bmiRBU88pW5G+0JWSWyVngNTCfof3FwUw+M1JR9sYDFndQtTOmZYzAH6d9CFWW3OuFU7/gijbtUa6EQnMQP1sCU6NdVcpYdX8lmT6WgmZWtF2ozVPA1W1LR4oBAu/OHZoLN+wbHA0XN6YE9Z31QcjgxwtQRr95eHsE5xFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763378770; c=relaxed/simple;
	bh=ILMupbwJ3cF/B+4makOVp6fy7U8dcJPI3YscEpeHpBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+hiQXejiNS7UEKpk6ZuDvDW+k9WGlUFWI79TA4k3AHtSd64rl5XCm0FLHQLvOcfqYhpz8KErofZITjv9uVb7M872YZy5Yjt+GGp+irLic6WkMrArhMc50NQ4EEvv8QCARDb8QaB69VqX0EfO/G1P+Ij7Yv/fImpdaI3I+MeWwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF3XHW4x; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF3XHW4x"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-295395ceda3so5494825ad.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 03:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763378768; x=1763983568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILMupbwJ3cF/B+4makOVp6fy7U8dcJPI3YscEpeHpBQ=;
        b=gF3XHW4xbCh/6sMvtrO+VXZzDdqLmJSrmUtiAPoX4FKrcT1t3o55Ax4USfXSZodH2p
         fIl59VOht45kpU6mMptQD+E5Y0wMatcziu3jKSrlV/7md6DzmTh8b5gxOQsSW045JJkW
         xU5sFySZ/AUXlYlKWvNTk5uUlWrRgrZctntgb2AaiSUHWNPv59S2sN9YIYQ6nOhjQd0V
         nigWLocbCOsm/lH+VdwrxIzmWq4G1lffYRbjwl4mZ6omd4wKKPlDmvff0tbW6ucVoYrt
         uF5dXDNiqX/vlXGT0rmNzkRQ1os71pzeJnPW5NeBU1kk8LEMpVaMLNJLNtCjmuZpFh6o
         x2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763378768; x=1763983568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ILMupbwJ3cF/B+4makOVp6fy7U8dcJPI3YscEpeHpBQ=;
        b=GRggsyUjy3FsabqEu/7nykbH4eOTZYpIdUa/HpxCL0Abb1JxtGPIUkjFRyuSFs5q+m
         Bx5ygUOeS0X/kB2H+vKO7rVnck3BE5bH2G/NbE/EREueYrCWBGgPS+IbfjPUzRCjyPsN
         J7j3YoLINZYtFgzydhKzFy+QcS2s/joXyUN8nhz05+jNnA6xH+5uKVYGB64a6MLdAfDI
         qfWqbNZJ2+5pto7dx80XVtgM6Htqi8QLXIS5/hkyXrkB0YoeEtBjPNXyJ+LMkEPPohjD
         eYyvHySLZvPfPV9R9RK5CqrZ6TLp6YZOUpeFOy3SpR0GiyH6aBZH1GJ6BJCWZJn0hSuG
         7Nbw==
X-Gm-Message-State: AOJu0Yyto6XwxjvSdyASPzAsXLCJeyIkE7ZvoA7qSI8UCxE1cMTq8xh4
	2L4rC0VWZ9EfNAzi/oUJ901HNFx7zuLRqjvQQL2qI8SO3RkZpZ+JxYR+ccDpXHypUNSoMYITKvm
	kePtAZolmnOQmWk/UticqcdVcW60e56k=
X-Gm-Gg: ASbGncvMSL9pQFuk7NEa2Jf53ZV20kIdRNtYxSPjsJ09Wex7XWR/DLCR/qzc+/8o52n
	Ysm+l0ZJjHzNb3LOmeufjaPFB2nRmBtE8xKp22zlJZF9VBV2cP4m1jcTXoRoJeBqZyRLucqE6EG
	azRoQVNRXG3gp4be40Z+KvH+TZLEL66BRB39k250XrRaVNjz3WHjhQAndI6JYCu4yrLGfJw20rx
	TfDCkdjMqMzemjUWejU1W/x6Tfkvj5c7X3jgcOqDiIHPZ3bTwQXduA/BO0X6AMgYLml3fAVHT9k
	QDoLQGBqHdXvCs2UVL8Qznk0meSxITTOmFGKJ+JOdFKFcfMPncYGWvM9TgBjwlK76iDaeYniQ3n
	P
X-Google-Smtp-Source: AGHT+IHx77Isf8w/lo3h1w/6yGPgeynS+qRE4VefWHAMIU3nCVDl5Lqfhf1+ftqhOa+SiT5vrL/JA50QIPu45YuaOsI=
X-Received: by 2002:a05:693c:2d92:b0:2a4:4862:c97a with SMTP id
 5a478bee46e88-2a4ada72478mr4946708eec.0.1763378768115; Mon, 17 Nov 2025
 03:26:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
 <CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com>
 <6sczezthaixabzw5lddhemrx2yivfdf65zfvpew7tpzl3gqire@vjx4rpju5wxc> <CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com>
In-Reply-To: <CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 12:25:56 +0100
X-Gm-Features: AWmQ_bmFnzj3aqTWwzMFJCDB59uTKDZPZ0TONyhm6Ryg5P_6iDD4C7oEUpgulig
Message-ID: <CANiq72=zROOp+o1vAEjF06eyS3uhnpHvLn1X5YgANyGOa81pTA@mail.gmail.com>
Subject: Re: [PATCH 0/1] fix rustdoc build detection
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Carlos Bilbao <carlos.bilbao@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 12:22=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I don't mind if that is changed etc., but I think it is important to
> keep the `rustdoc` target simple and focused: it is a "basic"
> operation (which is also used to lint docs too), and way faster than
> building the HTML docs, and it doesn't depend on them.

It is also the target I use to build rust.docs.kernel.org, for instance.

Cheers,
Miguel
