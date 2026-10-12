Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD308472554
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807023; cv=none; b=PrW240y+CNqXfn3AFGWHeg30+h1mbYn74LC5UhRz7qLxu3vsyXmlJ6jIQy19QhSLNPmpp/BTLN9a4JapmNqT3iUpY35ig5yM8ZomL8mz8Ap+Dro1LiS1g4MuNZRsYvPglsrixR2/E6sIQamdsPiagdtLSKzgM1zruRF3PJ64JmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807023; c=relaxed/simple;
	bh=1A0r6hH0z3yd2uOWQDNbWPiUxRxLgH30dRWdl1qNJhY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RruU2N60LT3Kq8nJLSArozWrx22Mx5ZPolNgrjE8Q5wcV9q2k9CPKKlHUMSeg1Q7Gcpid77UENlxNMEb4LYW6LiQ9i09Ba5FB0rj25lW8ZwIJZJ1F5drZNl23flkgG66oGw9vcrhkISm6yaSGFr+xCZYJBl4PxNA2o4tDfkWuL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L9d+o4F6; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L9d+o4F6"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso2015397a12.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 05:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791807021; x=1792411821; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1A0r6hH0z3yd2uOWQDNbWPiUxRxLgH30dRWdl1qNJhY=;
        b=L9d+o4F6o2y05GoHnlE3gTFrcR+4te/PS9/JBBqo4QJc+Wioe047PyO62FM8T6+aIu
         qu08Ke3WWmv32H437jfSUt58FOSMHTfuClqGPqUrriPY7GMh2CVpKpFVyeUYZxnLz2HB
         Lm9mW8zvYwxaX0ECg+gIS3wvwEfwrl/h1ErMbcEYqVnIgv/+0dKDwy4WNN7XIdaWVFIJ
         PNNIhx2Bzc/nY1RPfPBEYplh1dNCf+9vAO40sNmfIFFaili554pfSwqo5BxgYyFvKWo8
         YmZPbfYYeJbWLb/7T6hb1Ol/Xa7p1G17CZs5+UZqcY/cAf5s0vu5A5G47FAKinG+KTrE
         Rssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807021; x=1792411821;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1A0r6hH0z3yd2uOWQDNbWPiUxRxLgH30dRWdl1qNJhY=;
        b=mhIPc+9xZ45b7Dvcv/WrO8QSkhW6B9dRgdZEgGBnSQdPQP4b6w169WXs20lgieWBgv
         B1X2hkbBV7OlMBTrbwk7cZaheE0r82/Cv8K88F0VsPWA/kbSaUzQXDjwECuxWpaeGHxu
         7eWqZDqig89fm+IJybaWHOKga0xhDjMlLWuKAtCPsRykZw0+rc1DoMtCuHelvaYWxQVd
         AQY+Q0cvXZKlRgkFiusCvurmjSwa32XdIPK87uNr+NOtNX/OJG6Fzkn5qexYXwQEXpyg
         8d0OrW+KbhwcDdppZ71QBRzD+Yk5lsR5Z4RKKfzt0WPMOQSbngLVaeBORMVXGhcTcr34
         7BvA==
X-Forwarded-Encrypted: i=1; AKwUvBxFaYq2S51kzi7DH2X4i7P2psV0Dvt2hUZT+vZSexaGu6AUxGShD/wbNDodrIqQF0Ue5fgWnU7meTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdnRXgvXDq6FmCL7f3/Q4lOX4vAWNWsi08rR3qShDDm2Gi314D
	8VHU9VRVJmJb4MDzleQVMenLGnGyRnb0nIPikqbUuiwRnOCk2nRKjGtbZFq/l2ttwXARougU4pr
	OBSEb9qG4e2ucZv8V6Fkq9w==
X-Received: from pgc2.prod.google.com ([2002:a05:6a02:2f82:b0:cc7:6abb:ee5f])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:4598:b0:3dd:85aa:452e with SMTP id adf61e73a8af0-3e16be2fc4amr7671355637.32.1791807020935;
 Mon, 12 Oct 2026 05:10:20 -0700 (PDT)
Date: Mon, 12 Oct 2026 20:08:00 +0800
In-Reply-To: <20261012120059.1371653-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012120059.1371653-1-stanleyjhu@google.com>
Message-ID: <20261012120800.1382491-1-stanleyjhu@google.com>
Subject: Re: [PATCH v2] scsi: ufs: docs: Describe how to test with QEMU
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeuk Kim <jeuk20.kim@samsung.com>, Bean Huo <beanhuo@iokpp.de>, linux-scsi@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

I missed Alim's tag on v1 [1] when sending v2. The v2 changes are
wording fixes only, so carrying it over:

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

[1] https://lore.kernel.org/all/000001dd5a07$2fb3b400$8f1b1c00$@samsung.com/
