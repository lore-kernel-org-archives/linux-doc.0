Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBFC4734C5
	for <linux-doc@vger.kernel.org>; Tue,  6 Oct 2026 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299920; cv=pass; b=RYxdfuWucSsrbVry//j+3Fr678HocHXy5qM3NrmjcNswocirfpgxQ32wk5f2g/ybAev1dQ1ySM2TgI2y+mH/RW+RtQxDpLj3p8m2Fe1ixNovpmjaIVy9OBbw4MYuUrUG2JGOiEJvgETCxLuLmv1GdMCq3c38DmtEMbWhGxX+MKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299920; c=relaxed/simple;
	bh=Z6WbsAnp0/k5TRam8CoApQG5u2b0ang3JjfGRsR4/LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5/b2SsPOAZlK7jRkT8IZsd2Myco4I9tvWGwza6JCRNX1GKeLN7U01oCTdMScH+jvm0nfY8y6PCJ4eyGKi6ZgPCeUsG9qD0ELMgr46N74BVuQrj69g+A9xOPC/2lVGmdc2WhgiTqNNFfb7WhFW+HbgLedjdZfwGmkscmLtwJGxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vinJemxj; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vinJemxj"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so4221797a12.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Oct 2026 08:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299916; cv=none;
        d=google.com; s=arc-20260327;
        b=e8n8jsNYqhytQ0wF5SZIefVLSc4Ng2oR7fiX3qrPjKFTyKppTuDAdE4xWqmYhE0EdO
         21AMHQeBl162HkfvbNdgzjt2y/F8uBOuC73TY3fovBOVuZqlNexzEmFWwpOQasenL6s5
         MUsfNMloQiAz5J3Cwl9l5frkAFmblSv9h47/UBUur9MwNDaFwg5DNpdP2SVGeQ5oijE+
         CcXFj/v215BOJFQv34da+U71TFD13R9zX5fumf5kBdCEXK73RbHBRvlxLFecXYudQxnf
         pxeEBO4On6CdJWLjVVpvH0Iw3jAYQBY5YfidPmZZY4y6G4h2da1gr+HOwfahaA49SZ+4
         FZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        fh=yUim5gdLL4LLmV0m2JJckHoojjFjgfTicD96/45pNjE=;
        b=qn8GnyvzPImusHwSxoDo2VzEaJxFif125pXwc6ydtn85Dii9XBD9UHmT/aOEiGGscN
         54DNVQ7dXbQEXiS3aJCFe15bEFfehd33Ke3PmJwYr3BUURWMNideLLCMzBW/pDiPV7Xz
         RW9KpMJO/OIGwix5sG5iJPS4DOswaBBomo78SEPxIdwPPCnDYFvQhSX9KwHM6MZYasny
         JvFHUHvghF6Uu4YtSHWlPXD7nadULSjN4XCqbh30AE86YM7beGozT3BjwVbUyZrBdKY4
         wphhgMMlxT/PBt8VBESxZVxoNJQYzODLOa7kXfwBhmeWOnrLyJZ+Mo7e3/hFdBfmtcif
         ZzFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791299916; x=1791904716; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=vinJemxjfo0wtpRpFAgFolIEmK5h1JEjPQcX/AMCwCwhdtc+zvrWlULgduJ50Pr9VO
         xJX9/pmQZFWu0hcikEmrYOWlRLmLDMxRZuf60EZ+XAlxd8fuVz7tyIxfQcxqxTAOq021
         qh0RQqMV161mW7VccuYWu+k8wFFtFyKkK5sgM0yybLeW5h0iOBx/RmkZyTLDOY0segSM
         +24sbA92JaazYatCvTIfx3KBp2ZyoGvIwavOILBdB7oYuVHNCayu1x3d7J4dP02weV2z
         N99S/vtuJlv34K4IhkZSwh8a/JPfbU8CbQGg1p0CTAJLX0L4vsAGNozXrFWsb9OngU22
         h9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299916; x=1791904716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=cBRBb8SXr7g+9k1JumGZeq5QZ2MdSZcFjK43OUnhlwukzZ+tq+ciWNEozf5/tnQ8vP
         MTZnsQwvuL9HtSOCu0/WjSS0448y7Ta/tsnu0gajvC85LcGfSHi8KtM/VgwcVQHqHKMS
         PFDRL9FN4rX3hZT+miCYwLQu3pnMREkoSEgTBpAc6Jsm0H5glHvyPcIUnIjwpLqROjLX
         ERtE5RuM/3vh7CMpytMD1T6byjmpTy+wJJ2ICCo3VnENIR+wa0nthIvGsVw2g90U6+2Q
         /iGWJgQShNQlYXh3yN0h1UklEZoCmcF5J3gHd6f3q3t3yb82F87AiSap6fh+yfjHJH+b
         pqaQ==
X-Forwarded-Encrypted: i=1; AKwUvBySwowp7/1f+EDF9WV5NaoApXn4K/5LPEr9lz04CJ3m4I209CsgqgzyT2My976wdICOJbaH95X/vTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPakZ2zT9Iuki/3KC9AsNzqwKD6DuBrtGakiAaLvA/mp0IlzBJ
	QEfLkwDsftDHuXCzAmAuuHkghUh0Xg6P/5oJi2MZykiaPPeOCE0m5poEFgYW/KgSMA2+bzWvapt
	Stmk8AsvMKWjPunv3F81rSVnk+RErTpHQ/Y9EnNo5lA==
X-Gm-Gg: AYBFou0VFnNSiR/ThBqLItGsH/GGeGilW4i0Jdjh4cf1T58JPi89zWg1H2CsTl38nv9
	XLeuz/Fp4mST2XQLCx3VsTcM+PUPVin13n3UHcGxJxoqSMVWnquowO+ZpI5shh3IQBgVQNT2Z1V
	1uI0ZIDwset7BJRBVuCLsGPO9pwLuFPUvxPm8n/3FrDJTY1f7OwDm/WvIdMxBdUVjsMmmduqoLX
	BHVAxMNYbUQ3FM2TA4dWfLChaecmFjlIyQySmiF/bUUv17zcgag8psGtc1630qvfo6o0aNpdGap
	FLMo6vTGVOVLyYKLlvpWOdNkBbzzKHHiLO/Ojq+8845OAb1cLeKm1w==
X-Received: by 2002:a05:6402:52d2:b0:6a9:a5d6:622d with SMTP id
 4fb4d7f45d1cf-6afad731ef8mr8879468a12.3.1791299916262; Tue, 06 Oct 2026
 08:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com> <20261006030739.GA3457522-robh@kernel.org>
In-Reply-To: <20261006030739.GA3457522-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Oct 2026 09:18:23 -0600
X-Gm-Features: AclHuK9X3bTaGpN7i7UclAS_3sT01qVYKxTd90Hh58vpFwo0cpRNFUaLVMAbBaM
Message-ID: <CANLsYkzcqapDYvKAEa2ZjA=q07iO=RM4TVNUbSqDrB0EmjeKyQ@mail.gmail.com>
Subject: Re: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Rob Herring <robh@kernel.org>
Cc: Shenwei Wang <shenwei.wang@oss.nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2026 at 21:07, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 23, 2026 at 01:42:29PM -0500, Shenwei Wang wrote:
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Remote processors may announce multiple GPIO controllers over an RPMSG
> > channel. These GPIO controllers may require corresponding device tree
> > nodes, especially when acting as providers, to supply phandles for their
> > consumers.
> >
> > Define an RPMSG node to work as a container for a group of RPMSG channels
> > under the imx_rproc node. Each subnode within "rpmsg" represents an
> > individual RPMSG channel. The name of each subnode corresponds to the
> > channel name as defined by the remote processor.
>
> Sorry, but DT defines the names of nodes. If it's a gpio-controller,
> then 'gpio'.
>
> I still don't understand where the unit address gets defined. 0 and 1
> look a bit made up. I'm sure you explained it before, but *this patch*
> needs to explain it. When you define a second protocol, the 0 and 1
> addresses are taken already, so you can't have 'clock-controller@0' for
> example.
>

I had a conversation with Krzysztof about this here in Prague.  We
have decided to adopt the bindings proposed by Francesco in this
thread [1].

[1].  https://lore.kernel.org/all/20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it/

> Rob
