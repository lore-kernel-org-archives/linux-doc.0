Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF1A3D6CD4
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 18:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313861; cv=pass; b=V2fC5FLy+ZL4SyoOLuzFpHnljFm9yAVmhRBT3xNEBUafxrfDJC9ticCWMVvHAinLW6UaQ9pdzIkSgjHnwK4Ki47Es7VFJqyxwvpXBR1ZJbI6PUaYULHqgZq+gax3CILvsHzLieKILxo6NAAJH8Ph4LSy03T68tlE6cTxwUxogFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313861; c=relaxed/simple;
	bh=9/qaeE/0ilnaSX4v7PgMbmfkJgUdA4noaM/lruNOwSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDe/V4bszhxubI30hS2x9Rzo7JoTz0efZFGflrtLQxx7qHJAP72N14XrnFRpZWIOnYRQe0nLqMbx4o+HRyQTiHfbW9Vbmbarl5cBRf1K6hwwqPvUAAiS6WXNzUBRiENK5vwNh3HT+7FzvX5hdd2/e0dJ5Rm4VjIqhwPZnVAnNgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glFmjU6E; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glFmjU6E"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2daaab98000so624859eec.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 11:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777313859; cv=none;
        d=google.com; s=arc-20240605;
        b=AvkZsXNg3udyM6uQpq6XmZSygMAEKfA3IbLrZBCpdp+fzhUKXPHIY5Q8Je9GQ0Ivw2
         5ExIJsAxgE/o3Osj2siHtKkO/CPBWHGwmNHn7d6uCg81gDzvE3nQMFADYkMxFSCFkr47
         r4yoG3fg+ld2maDwKNJ7cH6I7Nce3OL92pFhY/FhQny3jJQvfDeE6ZQ/rstnVnHQEFue
         vd0Rw7vnNBn1SYT49ebxaQ0E/tSBQhpcp6cKMpUpLEkm95znwBa3GK1qywkzGNL+YR7I
         ScJfCAGcC2AncUmbguPwWmLBXgb/1dQ5vQ/zYy/nbDGODEk3KcMvjRvSoX1Nv5XFRN1m
         kh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9/qaeE/0ilnaSX4v7PgMbmfkJgUdA4noaM/lruNOwSc=;
        fh=I1mgUKtLrIBHcLdpBanKWxPVk8Zg+T1Xpqk5w99a0Rs=;
        b=jpu8S1eyG/hg0+0HPj8Es/mt1gWNc17+s1Qr+bZdQ0i+vu8MZqyRDjy0G0nGSPv7y8
         mpE0Qa6mrwwSkM8S+gpy9TsDJTseBIocEDdQmJMvy0P9nDVj5qNVTJQGetHntt0WLsoP
         HOuD+gK7WCkyt5JllDK5nnHwOKa+JfemeibzVdFa1sh9xTA2e4sviOop/eUKzNRHji+P
         O2+dUBYylOAEX+tPwm53Xf9idbnSfU/WzkpBB2ilNDdTMQWfNdreYO+Vp+8vtYAkk8+K
         ICuWA3o/x4Xz7AGHilCj71Z2C8z3Iu2RsK3S4QzQe8Z4c9ujxMRqi0AHHaLxcwr2HrVk
         BBtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777313859; x=1777918659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/qaeE/0ilnaSX4v7PgMbmfkJgUdA4noaM/lruNOwSc=;
        b=glFmjU6EpjjAmhiikI6XyaFsKJNvPO6HcmffI26zxMT2J75+KxOkQTNJUcFky7EHrz
         Was/gi/mwwiPC8xzzs1jaGtvKdg8OAbByjvFCCLV2mRxOVVYwdeZAEwZe533nxvLhr8d
         Y9B9kfL8JpPbwc8VQSPUDIFyN6t7ZgauNbtpDGIxoRZ/K1xQ7Wgur48eOUSGQGTOPZXb
         AobmO1h0ltu4Y1oLfTkv7DebUNcPLFRqVOd3p8XRIBu/FDpF5fcf4WJCimX6s5oHv/KB
         KHAbJ3Wm6ys2hFKoprpTZVjFKLNIAAqzqnPvOLLbDmdz4vziEuVeim8guKR/j4kTcjEs
         Q/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313859; x=1777918659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/qaeE/0ilnaSX4v7PgMbmfkJgUdA4noaM/lruNOwSc=;
        b=ViiKPROYTTYlH141ZLfBqEr7XJHSYZSePkzhjv7xsRngHxIyK6VJ+trUO2BOcG2orF
         s2pxaMiwo9xfTfxlbfaKlLbHgW9r2ASpJLL4WYaBGJy9Nz3LxF+4PMVsAheVK8VRE8xl
         +Kf47yRhzc3c6ugFOyEbfVWrmkm3EGbk+wcnew/FCfuH5CQdrnK3KiuiORCFy8uV5fvf
         kgRQh5jhszRwxUOoxBJuBXsBbekYtUR+C2Y6KxpJVPHKxMgFbwy8uYuOHFh7/rIV51WV
         o+JjFbDE98yKcO0sykQ2JczOMOGjYvA/85bbL1Snj4CS749/2i4XdSgECPjIog1/moTC
         qAWg==
X-Forwarded-Encrypted: i=1; AFNElJ/wwiZSeAjoWyZTepF6pPq9QrARHxKkeaHRg+CDASfSNHmAfEnvwxxrnQlHkqe2hksu2GlqZC+s22M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1pGjMWKExCE8ixZu2Qc9AoPoeRrz+ZVv1kRO7HEBMzQDPIg/
	Zq9Zg6IBKGXlzLrJQyiq1ObQVEEJAxM20LjlFVtED284ZosSwyNfOy/LIJ+GmVIxtmHDy9RRssM
	DTRD2xDOB1OK6Y4f8gl2ie7YzwwL4oKk=
X-Gm-Gg: AeBDievirpk/vFudAvRiOa0UUPizlzd7akO1KGhey2jg1eJ3jtIjxATOA1OfxrE6xkC
	gqK6HzPNT8Ow7P/YYtSLcv5AIrr+RsXq5y4sXsEyYlO6/X9GhMuhQb0cnnaDgGLrd2Q7Z+WH0a/
	N3kGyoN19z92DmhtTSO1oFWt8fgymvXr94Q9UYzuR5Zpivixijj5I5nZsRDtbF8GE3YbeCGwBuQ
	gpf7VwRE7GA/2BWzQZnuc+Ho/pqnVgYWbDRAH/FQntVVq+fzO7f3o+nHZb0vozxF1MXgIAq52SJ
	wX/rNK2dVs6yjYvW8XYwTXy9njqZfPAihA5SPXlZVbDWNiLxnl/Y9+iW83I+U/GyRLPf5zD51vI
	7+D8NagPDeX73IAuamzK1ZR+u7fS6FjfOLg==
X-Received: by 2002:a05:693c:2c17:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2ed09b8126cmr15513eec.3.1777313859385; Mon, 27 Apr 2026
 11:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427174429.779474-1-julianbraha@gmail.com> <20260427174429.779474-3-julianbraha@gmail.com>
In-Reply-To: <20260427174429.779474-3-julianbraha@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 27 Apr 2026 20:17:26 +0200
X-Gm-Features: AVHnY4KhSNd-WIZ0NrsCVBGrVQlV_jyP2VI5mbSl8TQVMeY9TM9-9Itbq43tbOU
Message-ID: <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Julian Braha <julianbraha@gmail.com>
Cc: akpm@linux-foundation.org, ljs@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, masahiroy@kernel.org, nathan@kernel.org, 
	nsc@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 7:44=E2=80=AFPM Julian Braha <julianbraha@gmail.com=
> wrote:
>
> +kconfirm also requires the Cargo package manager and an internet
> +connection for compilation of its dependencies.

This will be quite surprising -- I think any `make` call should avoid
touching the network and should allow working while offline as long as
one has set up things beforehand.

i.e. I think tools and dependencies in general should be fetched
and/or installed beforehand, and then yes, `make` may use them,
without touching the network (e.g. passing `--offline` or `--frozen`).

Cheers,
Miguel
