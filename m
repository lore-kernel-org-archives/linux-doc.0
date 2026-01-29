Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFDB33557E
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 02:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653565; cv=none; b=nejZB/kP1O4F8b0cxfvoXsh2WhUstHXvWaJQU5su4TEtDp9w7FeLzC0UMtDranIJl8BwKhlGbJu0Ppr1h8wVfZpWsiwIFqrZyu+GuwxYBpUYCn6Ie6wtqmhe57R15zX2hvNzcFgdGihH4G7nuldC543vobDtVeBArtcn0ns9Z4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653565; c=relaxed/simple;
	bh=rQMG62klzk7My02okdNZGZ5OJ2y6Qu0CKZDTi7zTjZA=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=GHCJh+/GXMCnamliy4RkPLAbkrCuvzjCyqHTVnSNWF9UcOltmNKCEtUru5P63wgyUTT5TNYtUJv79gup1eq2dD+MK4qlvhU2qUvmRSu6bJxqrXB/2y3gKdeRntRw3pSwirMlMwxWjRLn8qdToPGtROXyQwwa0YXW1YYy6mhJa1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=n15ShtoL; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="n15ShtoL"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-45c7a71ba20so237099b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 18:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1769653562; x=1770258362; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQMG62klzk7My02okdNZGZ5OJ2y6Qu0CKZDTi7zTjZA=;
        b=n15ShtoLOVPomZIIvAoOSK9mhJ607lf0UQlFSX5mf9yGtXwuGtGHYNBguwxU6oGmew
         4fNpf2kOQQL4u3hAN1uI8xKceb7/emRRJh1fBIBkm70+u0SNJp75Cfv/hRY7wsEeq8QJ
         4kNUwKrW1YeLCtbKJuUygaPqcyZSD4hW2OnaxsMDbQCYuldgBbSW7JrCDOhJYmzj6AM8
         2Zp6CWqI3Dbbv5zYcGRN9YpcDyiU7nP78Bkxv+l0WbtK/zdJkWYnr8OlOm8MOibJNV3i
         fXVU0bFzrqiKb82Gy2SToHpBK8Lq/yjuoeIm3ylLu5dEIaQg6btL7ZBuzlpULVvrNFbL
         VGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769653562; x=1770258362;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rQMG62klzk7My02okdNZGZ5OJ2y6Qu0CKZDTi7zTjZA=;
        b=C/JoVokr4AucNpWXE2t1foDnLyXoI7WIU4jIKao6199Fv/knOq91/IMAOjeAgJ7J/N
         8Yy20G88v7h7qAo1I64WtJ3xRhnBQsOqCEzjvM3hpD9x3c7vPkIDFUS487rchgS2HpKu
         ig46wtzZM/KSt0pv9y7lFptkCwZxFO+KsVQ6+ntdWgyp24Sn3TfkW/4BoNcG0T/QFSED
         xYsCrOR2PHZSNHb9jSyzx7t0jX9uXY7+oWTGrB8M8W28YBy/BxMVJ0LLhRmeLIFCuY3R
         VPcv+jq2X1xUDC2tWwbWBepPjvm0vgJ1c8K2xW6QAJ9B1HCQsfQHrsNgd7m709DG1PvG
         DVTw==
X-Forwarded-Encrypted: i=1; AJvYcCU7/eyNwxAyce9a0fD0im9R+L9IhcYheB4lt4bwMX1ghk0HGkHrt7CDiub7NvenaVCncQq7OxW7XRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1cJRF/q1jxnbOFDE+Vir16U0g6e1MDjBy6HVnxqrzHkVhqLTW
	UIJ9+aXgS9Bo24opF+qWtl18AUJb7sNsPm0sshL9u/Pna5DKkRNI/IHIqlzazOa5O4Y=
X-Gm-Gg: AZuq6aJtdPrg5euyCHMEaF4R4kvdesAmiXaWSwQ5arzcPO4d078OB7HHFU9OuDMZ1cM
	FQ4xMPhps0WWeQ6duseSh2m5gfqPmgsB6l/v4x5yxwK1X2P42RAsoL0V81frceB7qjTmDvr7w32
	XvIbm36rMpgtQf8I6K1wOx/DlNV90yyKN9f8u0dNUlfRuvBtYEO/vMokjSTv3IOII5knavW4V8V
	KrONFGVoyz4NUpRYB1+h5AXmDEwnchcvA1ScXrjH2lBlhcsDJdVJUi4+6TfA7ksM9D0Vmu8JND8
	RAeuyr5Zxg+qMBP/8RVyIohHcBCVwVKHa2IFIb9DWN5z/uFMFUKjHjpgyL/ASubT0IdFAxWrKB9
	jsdPfAHIIcAPx+FaWqK9E9LZuJHHwq6cUtdmlAZD6rdwGrBE15nbL59o2XWiBCBjbeOmII59Aw3
	jMBbhpvIryQfY02QdSiL/MbCVF/fZF75VnlMjEoI0mTw==
X-Received: by 2002:a05:6808:221c:b0:45e:801c:a0ea with SMTP id 5614622812f47-45efc6d0628mr3467328b6e.32.1769653562137;
        Wed, 28 Jan 2026 18:26:02 -0800 (PST)
Received: from smtpclient.apple ([99.196.128.181])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45f22b4e676sm483963b6e.3.2026.01.28.18.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 18:26:01 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Jens Axboe <axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4 5/5] blktrace: Make init_blk_tracer() asynchronous when trace_async_init set
Date: Wed, 28 Jan 2026 19:25:46 -0700
Message-Id: <56C8934E-3D17-4467-93E6-D813770BF577@kernel.dk>
References: <20260128194104.30051be1@gandalf.local.home>
Cc: Yaxiong Tian <tianyaxiong@kylinos.cn>, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20260128194104.30051be1@gandalf.local.home>
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailer: iPhone Mail (23C71)

On Jan 28, 2026, at 5:40=E2=80=AFPM, Steven Rostedt <rostedt@goodmis.org> wr=
ote:
>=20
> =EF=BB=BF
> Jens,
>=20
> Can you give me an acked-by on this patch and I can take the series throug=
h
> my tree.

On phone, hope this works:

Acked-by: Jens Axboe <axboe@kernel.dk>

> Or perhaps this doesn't even need to test the trace_async_init flag and ca=
n
> always do the work queue? Does blk_trace ever do tracing at boot up? That
> is, before user space starts?

Not via the traditonal way of running blktrace.

