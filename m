Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA251F37CD
	for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737469169; cv=none; b=AsTyAbtU315e6hvFYazZ3KtxR3ALKQ5oT82Kfp9EW3teVOmaYARjUKm5nSGecOCCxUJY7r2gotUvnA0imb5ZXL+Rl5rZDsubpZTSdzhvURRlwCdgwg/z8q9ASOY30y0/6TxaUw3trGY0PN5IKy6Z0/eaLbA4kK3tEdpXITxEAeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737469169; c=relaxed/simple;
	bh=RXaX/4JBPfJSpFcIrzvXn+zoEHs0Bl1F58nd9lsQb6E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F9t5NPTCkzKZ4swNn8eqvEWztxV3+NCD9BoU1Ag9Jivint9eXCZ3ZGNmkQcdw9OMUMaBbh2aoOQUKEL/X7H0xSr3/n0KH7YrYYLZkJtElKS3MFk/vbbVhMNg5VTqXOQs1+UqHvs+LTNdeMjGhZa77p46Bo/9YZLtSYNilHjPF4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=ACp7ShVY; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="ACp7ShVY"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1199624866b.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 06:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1737469165; x=1738073965; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXaX/4JBPfJSpFcIrzvXn+zoEHs0Bl1F58nd9lsQb6E=;
        b=ACp7ShVY8p6wbYZV1w/a9PNrHT4GNgkND/j6PYlNu/rMLaHPfd4IfBosLFdAn861NA
         f6R9shDB2p9bWdKh6jfIAOgPjukJsCoKn0dfAwlk1X8gic4hHPKfs+tXE81XwO8Z6kf+
         zJH29XSGdGveHAITM29sZ5G1xW+wAIeGFeAa+iXm6E6rItVWvP+kjYjveXhc1WYXohPL
         tQC8RfUNyODeJ2wWUuyc4rK1F0Gu3ZYonyLxCrgZKkeS6MZUqHnP9p8MOTNDJ8GVloOS
         m1uSXTPnyAVAYxPGZLx2g2RcQZs/mMjq8ifd62b1MNUQV21ngv0jg98uctqsgslwgZ9F
         aT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737469165; x=1738073965;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RXaX/4JBPfJSpFcIrzvXn+zoEHs0Bl1F58nd9lsQb6E=;
        b=WZV9DdUkq1sgbRl/jRXaI11nQVWU5m/WyzO5qrQbmtFF4ZDOH/YpIp4d12ysTFBlQp
         LyX9LvH5DuWFcZiSG784+lXPIck7RZhLr71bt4ho1SwTLQkyHdB99MZNQp+CKsh/tOZO
         NbaBsBMxH1X9SwhFSQLy3qTQbDL9BeS8Ttzl991Uznr3f89kFa1EDEHppovQ72eEWWvj
         XEWTjXAm3ZdTPBo23TLYOLkshLaTqkQsk5mP73nP3t2yj0brcBoMh9pHRkI4Y+XmCr1l
         Br+kH3OoWL/85Htct3L67jkgd3zFmKrX8H/gIdVi4ogAATZM5OAWo6tE3PRJ2+AY5JZm
         hQRg==
X-Forwarded-Encrypted: i=1; AJvYcCUGahMkh/3fcvqwPesbumtEEI6lZ7t6FFS7W6upUBEDA2HUQAS15kWukdzxS+Q/4FSeiJNIJcHEUDw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg1nKYv0MFWO62UAq2JJzHPt2ICGa8QilMXGxGQ0TooX0eDeZn
	TZFu5uLBuJzBJYgI5i6pwWmK5NP+9J0kKoFXQ1aThZrDYyL7HiDbmwyjg8NBLmg=
X-Gm-Gg: ASbGncslbzvoDn5NjYwZyWHQMuWHchTBPqZt6ae8VU0w2LwyCpEaLgSqMbyvBDjdY67
	Ru/1MAbWNzYBCaLQfNlD5BaE+WnfxOM8Pch1asn0YwkLFF0GTbhcSYQLJsgbQPG829rNqZ/0Xa0
	KdWcpS/ipxgD29ZAj68TgBshJK2f/QD8+6+fA6pwcej6lEO4OtNZOVnQ/LZBvOwxr3HrdMDjhhc
	EneTCUDdWl1x8D1M9coQ0dP7bNyCSHDwmxvOOo1HRiXdle4qrYxa+Rt4U9yEQs=
X-Google-Smtp-Source: AGHT+IHqoZlch0NckMiqj2j54cDxGsvFFhBkVOqSDvHro+EPMUw9uzJs74fAnODhJFiV9d7n5h2OUA==
X-Received: by 2002:a17:907:930b:b0:aab:c78c:a705 with SMTP id a640c23a62f3a-ab38b3d4253mr1645512766b.52.1737469165234;
        Tue, 21 Jan 2025 06:19:25 -0800 (PST)
Received: from cloudflare.com ([2a09:bac5:506c:2387::38a:3e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c61388sm753778666b.20.2025.01.21.06.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 06:19:24 -0800 (PST)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jiayuan Chen <mrpre@163.com>
Cc: bpf@vger.kernel.org,  john.fastabend@gmail.com,  netdev@vger.kernel.org,
  martin.lau@linux.dev,  ast@kernel.org,  edumazet@google.com,
  davem@davemloft.net,  dsahern@kernel.org,  kuba@kernel.org,
  pabeni@redhat.com,  linux-kernel@vger.kernel.org,  song@kernel.org,
  andrii@kernel.org,  mhal@rbox.co,  yonghong.song@linux.dev,
  daniel@iogearbox.net,  xiyou.wangcong@gmail.com,  horms@kernel.org,
  corbet@lwn.net,  eddyz87@gmail.com,  cong.wang@bytedance.com,
  shuah@kernel.org,  mykolal@fb.com,  jolsa@kernel.org,  haoluo@google.com,
  sdf@fomichev.me,  kpsingh@kernel.org,  linux-doc@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v8 1/5] strparser: add read_sock callback
In-Reply-To: <20250121050707.55523-2-mrpre@163.com> (Jiayuan Chen's message of
	"Tue, 21 Jan 2025 13:07:03 +0800")
References: <20250121050707.55523-1-mrpre@163.com>
	<20250121050707.55523-2-mrpre@163.com>
Date: Tue, 21 Jan 2025 15:19:23 +0100
Message-ID: <871pwwi710.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jan 21, 2025 at 01:07 PM +08, Jiayuan Chen wrote:
> Added a new read_sock handler, allowing users to customize read operations
> instead of relying on the native socket's read_sock.
>
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
