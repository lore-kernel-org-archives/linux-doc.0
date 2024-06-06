Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380DF13A895
	for <linux-doc@vger.kernel.org>; Thu,  6 Jun 2024 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717662044; cv=none; b=Di9HpnS4HycBz4c5Y47t9LAb/siy4vmmy7slt70KUUMoln3yXd2NCPeIdtAFNqzmev6h+YnSOd0+WlhauBkYTs3rlTR3EvT0O4jaJNiKNfKv0a4lsMTdGIKHQ9fPMraiMATspHG7v85iFPqx18q5gDrmT3vE0ydKgFQeyBPaQAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717662044; c=relaxed/simple;
	bh=6kI2cdJDpABdMGmQl+txxxVa/ZELbED2IxOHszzsEmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mz6lvxv5o+U7BMk3pn2/xxwANcevKhgqo5loyMazrxzYDpZnRFjT1FMQg0W/93xgw0cLlsstR3V5nDPs6HJr+F8TjRbN41kJsgtCNBGgjxUX8ZM3fPWTqrPESet7bgwkkk7wNnCRYCzH7ir1Q1vNo1uRkybbGZ9nt9SOBjwmcmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jXV68gK7; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jXV68gK7"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57a1b122718so5659a12.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Jun 2024 01:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717662041; x=1718266841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kI2cdJDpABdMGmQl+txxxVa/ZELbED2IxOHszzsEmk=;
        b=jXV68gK7mMgwgKeDRkbFu4NrxkaoE7Z4gZftN61kf3C+fVCUIaoNT6xHzbLI3gtk3G
         TUAY6hU2wBrMJmIATLrwJNTxRIGr5yB8wdc5jZPu2WYfGlt64EaC26a3nD4/WWe4AQ9A
         unfU1xIx4qo0+CY8svDtwE8JBh5YT56kKBhkaTuldEWroTeWn2RSb1aH1RWZjGnnVkex
         qFQeEknBkbjX2Nv8ccA2ZvTGhpWKUCcBggefw4bjhBkgcpowEwhrgMfPKZC5cJQ49QiQ
         2o+gS0ANXatvAMOYO1/6Q2+/YJdEZ9U0GmlTin9M81P2XSgaqn9KK+PwbKi6EtKQB5dS
         2Fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717662041; x=1718266841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kI2cdJDpABdMGmQl+txxxVa/ZELbED2IxOHszzsEmk=;
        b=TFQ+7stMS/gVxnI7RvVC77UPqKNNj2puAD9McR8OkoTcyd2x5hM5hQdLJtSvD+H6k8
         uBuEjo5yr2LtwREineI33Nzw/RxQdcH3KLzyLvSK+rQZwFNR5ofzl4KNgTuawzX9kgrt
         2UaRHbgaMETlmN3JBTbrJc5tNFNvk3L8Nhu8367yz4KvSwl9pb4vjV42v3vjDuMW3qhE
         eIbYm3bw7E/r960DcfCf59vrnLfi0CHLTgkUEamJcMNi2Dj8eOT0yEZErPRhYvRGtAbH
         HVY8TIdvFYmZhjr5JixhVUn7SdewhMcaXwv6BKU4L1YOR3a8Y2GqSiOzfvoboMVCoIKY
         5PAA==
X-Forwarded-Encrypted: i=1; AJvYcCW7+AMda6zNSxNCL/GqOrApK+40FZDzKxxFKaIsYa0MYSL1XxZjR03PS8CyvwQhrWbcltXmuLX7HKdUjRI6PZasQH1bUhc537Vh
X-Gm-Message-State: AOJu0Yy22C+pY3XVHOzujgmEalDtM7WAhflmTK0Byw09pCM7gouz9BhX
	P8MrYTp4cve2cLIa3rrSWnOWE0sFJn0b7KgOsLsuV72tz4STwyCbFyS+cwukdmPd9Mm69j7G2KQ
	M2NGLQoC0FUaq/wEBgUDGcc0VvqcGZIlpqZD+
X-Google-Smtp-Source: AGHT+IFE9WmSo5OTxuoBZojQvoBTfkJrcVh029teBW5Jl+55BD7o3it5tXbtjBD7DlrKr7HlCiB/oFVBH9UKsTRUNSs=
X-Received: by 2002:a05:6402:180e:b0:57a:9ea1:f92a with SMTP id
 4fb4d7f45d1cf-57aad34e850mr99420a12.7.1717662039210; Thu, 06 Jun 2024
 01:20:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606-tcp_ao-tracepoints-v3-0-13621988c09f@gmail.com> <20240606-tcp_ao-tracepoints-v3-2-13621988c09f@gmail.com>
In-Reply-To: <20240606-tcp_ao-tracepoints-v3-2-13621988c09f@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 6 Jun 2024 10:20:24 +0200
Message-ID: <CANn89i+D1mXLvTvQe+2ggdm_HZiMQcRP4+Tm0Cgo++oyd=zm3w@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/6] net/tcp: Add a helper tcp_ao_hdr_maclen()
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

On Thu, Jun 6, 2024 at 2:58=E2=80=AFAM Dmitry Safonov via B4 Relay
<devnull+0x7f454c46.gmail.com@kernel.org> wrote:
>
> From: Dmitry Safonov <0x7f454c46@gmail.com>
>
> It's going to be used more in TCP-AO tracepoints.
>
> Signed-off-by: Dmitry Safonov <0x7f454c46@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
