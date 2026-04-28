Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FCC3101D4
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363014; cv=none; b=b469cygClCzROh9ZJh9ZXjrYuDnRYDK3xLMbE38CbYl5aPzjnInXVAOU/a7H7V1jcolwW78FuUyK0T0XBPghnen5A/035H53OthERuFHeZ0Rp9Z0BvpjqKwZtVH7xvHR6nMRgyDg7yz4m/wopvkA5KSiI+iPC6FOaHlmGk9NWe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363014; c=relaxed/simple;
	bh=zmPPipIm+6cvKey1X/BfUOrTJ48Xi+8NNi1kXYdMK9g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oW6zX9k+9SiVqKX4wOw7OUVlytf3Kj/cU6C3pJDeSTaDW2NO7PnMtcvO0kClBUbfREorzNDfh+aSIUsRDpM/tY6aOO41wR5rGhBd7k8fc4LQVxPYgxDJYrN3x3VoWJjr3vhSFLYNAZeAnPexCi3VNolQczBTjDs5M5YLcRwGpR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1kA44cfy; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1kA44cfy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6A29F4E42B5F;
	Tue, 28 Apr 2026 07:56:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33528601D0;
	Tue, 28 Apr 2026 07:56:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D090A10728487;
	Tue, 28 Apr 2026 09:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777362999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zmPPipIm+6cvKey1X/BfUOrTJ48Xi+8NNi1kXYdMK9g=;
	b=1kA44cfyy2gAqoFZaCFLU5/x4mwJmrpX9NnolxKVP6VTuS7lhG8uvn4xmMMpXjIV/WNn/L
	Rj2kVMG5LJl/l3WtmVMnjJCPe4UtzG1M5RnVYuCPczMNL/OPdxB91HcyWcqaFATKIfT1cs
	5LAqTuj2K9NNv7oOpvgHyHBBKyQWKsNSQ8fVQohGOsiIM90eQKTHeRvOjjy8yWCG73nvjx
	5Gj4hF1bvPI4oqfjCOmG0KMQ+pL57wxklAmmRy7VHBgOd3wDAKC8uvQUaEX0DyfJPvYogk
	zZhvzoq5w4x8ifzGJJKTnNmlTkWY9ljyELJewso789/KhyKKC8aOCdreYrc/UQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: <Takahiro.Kuwano@infineon.com>,  <mwalle@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <corbet@lwn.net>,  <sean.anderson@linux.dev>,
  <thomas.petazzoni@bootlin.com>,  <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 17/27] mtd: spi-nor: debugfs: Add locking support
In-Reply-To: <2vxz7bps5qoi.fsf@kernel.org> (Pratyush Yadav's message of "Mon,
	27 Apr 2026 18:11:25 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-17-833dab5e7288@bootlin.com>
	<c8521e12e49040ce8683f81692644574@infineon.com>
	<87h5owh69c.fsf@bootlin.com> <2vxz7bps5qoi.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 28 Apr 2026 09:56:36 +0200
Message-ID: <87v7dbecwb.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Pratyush,

>> I don't want to be too pushy but this series has been pending for a
>> while, there are real fixes inside, it (IMO) greatly improve the
>> documentation, adds a testing procedure, gives a friendly interface to
>> understand what is locked, etc. I am working on clarifying and improving
>> the Winbond vendor driver even more now and I need these changes to get
>> in for the cleanup to continue. Can someone bump spi-nor/next on top of
>> v7.1-rc1 and apply this? Unless there are more changes, of course.
>
> Yeah, my bad on this. I think a good part of this series should have
> landed in the previous merge window. I was waiting to collect some
> reviews on this before applying and didn't realize many patches already
> had some.

No problem ;)

> Anyway, the series overall looks pretty good, although I didn't spend
> time looking too closely. Will apply some time this week. Thanks for the
> cleanup, it is much appreciated.

Perfect! I'm looking into doing more cleanup. Thanks a lot!

Cheers,
Miqu=C3=A8l
