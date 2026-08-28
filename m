Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CA33ACF18
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 03:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889059; cv=none; b=kxzNdTicTDz/ovf7dmkepwo8CYbHGldq5DQGGlsm0aAZPv+X5jbET/a2AcnebkhERdQGsj7WXcWNHzG7IMGarTVlUkzizPIg5vZpeUVf6BHBltzwB02uWsU82/JUYHKKYyi3uz2DEIO0EEeQxedO9SB90+IqEQ3MoBgHOyTbvtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889059; c=relaxed/simple;
	bh=qxXuDSETb1QGvICRb6JF6QpQpSR+Hex0aJPS9wGqpCo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=NM/tDX1OyMD8bVCWuWW0EvPP6sKw91A7H4lprH03wYFxhuvWyr7rjPqsH+uaiT9TYzwWssyz8I1It4UMtucybaD2nzyfto/r27VqafWPW85reu3NLSdk3e1vl+yt9QIMASQxa8AzCKxMjSvGaDM46j7yv6wStf4tEHWS8OdzLbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iu0MssnI; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iu0MssnI"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39652a6e963so1621537a91.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 20:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787889053; x=1788493853; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x4Wo3AFVWJoN6NjZ+CjXyOXScjwk81QQP/wB9zVSLpE=;
        b=Iu0MssnIdYs5oBK61RGMgLHv6pbQmm0G6nj+OX53oQc2QIqBIWgKGMStsPhVAIZXCZ
         6KIXJtU1ggJmTlrObkqAuCwZn5yEFW5irkp2NNYE2E3fib97Y+lIbq35w47CbNm9LQNH
         1Pplh4AsO8hmM6kJsbIPymf1lYDt+de/jqC+BFGVjCAnzWzped3LlncDTU27kLDQSRqT
         6189Df9kTOUSqqMjLd3TU9N7vd8l5YdhqVTr/qJQ5EPDza1KH1h/GBp++7QTeUrcSBhS
         TVgjBixy9VNwEKh5VZ/5DOayOPA26D8vPLHLIBqZoH4yolHFkjNhhuuJqAk2P7qJumAo
         zfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889053; x=1788493853;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4Wo3AFVWJoN6NjZ+CjXyOXScjwk81QQP/wB9zVSLpE=;
        b=nTNHnk/9RkPtyTa2LCBy557P+iynRFefAWzoWMKv8wUVVVlI7iiA/6NxfqH2qyFXBx
         2OzMjeK1RPF/WQBV8uals6wsU18k+shk0OZycl1Lr/ZGEx/TZKoST4ZrlhhHJ/yIkAfJ
         lYunXRPy/A2mGtPw63toG5Xb6PO7gWRD8W41HJyH80vRnr5hyD2QMNpRyYq9bi+rYKlN
         6O450QaoMn1hmVokZnuy5xEdIU57EqDDP98OT5HiMEPnXUyao0oACDiNNlGbUpnKp4Qs
         irwdBKOtGxPkzUaXkHT+G432EZZEYy6ci80iMO6i5nTpCxGqj+DfAOsmfzpn9Q2fci2m
         KiVw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5HIZ1pBlRWz88WWJ1lUADBAe2FWHx1loVvrFUVll6h41K9MiQ+6c/zyAhk6gv8Oe1kSSgrjIW8fc=@vger.kernel.org
X-Gm-Message-State: AFuF++kngboot/gxaK1Skwthpr9GtD693hnjIVa00R0a9le3a1TIRf3D
	TstqjVyBC9tV5zrlx2pa7oV8/BtaEVXbF87DZ8cllJs3d9pfmty+orOL
X-Gm-Gg: AR+sD10hfjWYa+gf/f9z3WTQq62jsbcJ8yxyP2epfOiC0dWqqRVZHtHk47PqVLwOU10
	X8olLKb13BzHZF5G7BIxzB1WgLUJdgSPq88fcSPmRB0uZ0c+wK51EFZQvBAcRMwUwa0aT1zCY3F
	UXEESN+R8fOczgXixQ96POZFkssTw0XGILaDqXINNphBG/k3uJ3h/UiwtXnve1pm+yd3KZ1f8Y7
	STdHhmofj70RfMiBhRsyER00gy4WxfiGvCsj1PqbX3AoUu6EnBYrGmyMFHNUuiQaX/KBO1TYv1N
	ZmwLIKR+CRqR8xKy9r403VYWn07kImuU8WrNOqnKmUaZA4XsnFzlPA0/EddNcze8jGpPR1OAkLj
	YfASG05S/xm/f6XCAu1qTE/yihBt+lOyB2DnpH3qhp60lm8mxDAHb3aoWnqZlR63zK/+IdJJGYw
	HtH0OTt3SdBYyGc6UbCth8hS8NxU8urxwGnHkHHdzdCeQa3qg1NcbSwGK43PH7T+LJYQ==
X-Received: by 2002:a17:90b:5484:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-3969bc0223emr15330087a91.10.1787889053319;
        Thu, 27 Aug 2026 20:50:53 -0700 (PDT)
Received: from [127.0.0.2] ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0e0e67dsm1659184c88.15.2026.08.27.20.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/3] binfmt_misc: only let punctuation delimit a
 register string
From: Farid Zakaria <farid.m.zakaria@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Jan Kara <jack@suse.cz>, Kees Cook <kees@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-doc@vger.kernel.org, Farid Zakaria <farid.m.zakaria@gmail.com>
In-Reply-To: <20260826-work-binfmt_misc-delim-v1-0-43618adf8599@kernel.org>
References: <20260826-work-binfmt_misc-delim-v1-0-43618adf8599@kernel.org>
Date: Thu, 27 Aug 2026 20:50:28 -0700
Message-Id: <178788902858.3236768.15019506644956689303.b4-review@b4>
X-Mailer: b4 0.15.2

On Wed, 26 Aug 2026 17:55:45 +0200, Christian Brauner <brauner@kernel.org> wrote:
> [...]
>  tools/testing/selftests/exec/Makefile            |   4 +
>  tools/testing/selftests/exec/binfmt_misc_delim.c | 127 +++++++++++++++++++++++
>  4 files changed, 143 insertions(+), 3 deletions(-)
> ---
> base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
> change-id: 20260810-work-binfmt_misc-delim-83f62cbcfe23

Makes sense.
I think it's still pretty accepting when you consider all the
punctuation characeters even allowed :)

-- 
Farid Zakaria <farid.m.zakaria@gmail.com>
