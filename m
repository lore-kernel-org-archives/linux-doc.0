Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F78190493
	for <linux-doc@vger.kernel.org>; Wed,  5 Jun 2024 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575010; cv=none; b=XmnpQ0huENLBA5ZA5p/A+iCQ7BC0sD77P9KimQlaQ1a8MRWrYBUqkFEq882K36MIpLTdm31f2wQHLoySrhNMswMLZ622U0Zg0L+RKC5MfJPjnRGNp89Klx/zUk+83/EaIKO68Z8hAFSmz/VHejUiFlzGSTJUwFiF7OljmoPrAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575010; c=relaxed/simple;
	bh=3T174Dceoicm7kUCD/y7XPY3dib15KsmGy0OqrQEOVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRNZ0AIZIjhp7b/Z757vj9yieyCDCNHpRFl+V6IpviqtCgUqVgDRStxKWE1ToT3bj/uw4zPesTeBHAuKweC2DBgFh9ayiDT/vDYFLPRG/66OB8flJUB7pmllRcCGeHbmsBJAscRNGbK44eGwzTNa+A7sW2tgvKAvQImz7pwbxSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W9S9macV; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W9S9macV"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5750a8737e5so9658a12.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Jun 2024 01:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717575007; x=1718179807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3T174Dceoicm7kUCD/y7XPY3dib15KsmGy0OqrQEOVQ=;
        b=W9S9macVhIq3FZ5k7yka9nNM8QU5bW6GhWY47E1tPYGVMf2Ar6V6kxPlV6pIypg1jr
         MrAUhTsFVXy9hzd4aeuhhkch3EojkOPz3eq2UoIZfJF641sXNXGpOnfChmLnjGBiZe2g
         2nv/P47yCuk24TrMCIA84Boo0DuNAJ3ovqtj1E7JlsDOp9+QFxTazGYPokkyqXDMDwk1
         Ly5wcgu7kDOrItm1I9rxG+4cWkU/yQUANT7NdeXCdvpQWfnyfo/+Rrhly4vGkHEwrCvr
         26Y8Sy28WEH82eg3Cmzsaa9DpQdF/zz64Cyv0SgeoLtb93Ds8S1ir6XhonSi/Ex43mZO
         n3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575007; x=1718179807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3T174Dceoicm7kUCD/y7XPY3dib15KsmGy0OqrQEOVQ=;
        b=GF5Ue4XBfhPVqx988y+Rcc5ntPQLsiR2KZL+nhVKg0NnNZT4rJxdAAk2OsAvee/80k
         1mv4vwJY2bBNGkLLN+Pts2vNmPe8nc8G8NRN7X+1lnkFmj1SvQt1t2FY5CLWguZaQ5sO
         bWJUbYpaUyeD2WtwlmWCChFheIb9pzL/xBRdSjsKG+g19Iq597GVWalIrXIN72IYXx5F
         y5XkGdlVMw3aMi+Y4EXm9FZxTrl8itsKGfY02jDx6a5PnVjTs5jDYhuAlFbQI0ErMJjb
         QoB2pfXSg7maShyBAk+VIysFBpWjdMjOXzHqGSnJgFfsRDdHCqeC8idHuZjLUQ21RoXj
         BKrg==
X-Forwarded-Encrypted: i=1; AJvYcCU6UkVCVhQb0tVz8TFcMKSpm/bw6T5mNSVPihg5jsvZ3X5nkjhzgu7Qwp5Ow5703NggFKnMA06oVkibY3H0B3dANCv2/Q4iJwRP
X-Gm-Message-State: AOJu0Yx+LKfR5tzdumAI1+2nflsrW/RnxGY+nkQDaFXxq+vx92y6KfLX
	ePnDWpJ1R1Lpv13JsW1HZh1nin+aaY6C7TgKPt+P00orEi/veEeHmRNNu8aSRO5T7lZhuR7eet/
	u5wDylK15GjDBwVHqS8lQLFgIGULURm68WcM1
X-Google-Smtp-Source: AGHT+IFHJQQ7/NDVyqJbqUGkdoduFW8ZFDMW1u4Nz+gk70EjEJGUIexCHfm07OGdLX5eLDSaEBU5m9EO+DfzPVRzJpg=
X-Received: by 2002:a05:6402:31a3:b0:57a:1937:e28b with SMTP id
 4fb4d7f45d1cf-57a94fb3c0dmr89289a12.1.1717575006236; Wed, 05 Jun 2024
 01:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605-tcp_ao-tracepoints-v2-0-e91e161282ef@gmail.com> <20240605-tcp_ao-tracepoints-v2-5-e91e161282ef@gmail.com>
In-Reply-To: <20240605-tcp_ao-tracepoints-v2-5-e91e161282ef@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 5 Jun 2024 10:09:52 +0200
Message-ID: <CANn89iJtAPYb_N8J_uvKDV_C=rJ8MzzEuhaiRvFs32giW-30EQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 5/6] net/tcp: Remove tcp_hash_fail()
To: 0x7f454c46@gmail.com
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mohammad Nassiri <mnassiri@ciena.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 4:20=E2=80=AFAM Dmitry Safonov via B4 Relay
<devnull+0x7f454c46.gmail.com@kernel.org> wrote:
>
> From: Dmitry Safonov <0x7f454c46@gmail.com>
>
> Now there are tracepoints, that cover all functionality of
> tcp_hash_fail(), but also wire up missing places
> They are also faster, can be disabled and provide filtering.
>
> This potentially may create a regression if a userspace depends on dmesg
> logs. Fingers crossed, let's see if anyone complains in reality.
>
> Signed-off-by: Dmitry Safonov <0x7f454c46@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
