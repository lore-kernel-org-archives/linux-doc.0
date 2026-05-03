Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D332F1FDE
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 19:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777837974; cv=pass; b=ibYseyE4LCyqhnSDkVtH6jYBl2L6CU1LZ/0jPjidmvGgFSRkeJ+UN3UR/mjhaEYWWaTBU/0Ktw5sB+DmdTiVHGyj64+FvOYtPgsbZNt1vRRj0U68cO0Ihju+yARpzSkb10JpXBdc0734Fl0U5L/X/TwuArqkwXvJRWUXj+kbpYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777837974; c=relaxed/simple;
	bh=uZLiEb2AKafZjis01rYd0ydpsrn/wl2hltrcdbVAOV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+QUYC1LolO8IirPJYAx3GYvAHnIKH1iriyfXGgoZwFEp/GevA8K8ja7gbmFZfym8zS0vecs6WHBqTFo0E1jyO8s/nwrNiWPZpSlEAY8YoyGaFWaEwNh8e0FPO5OD8e7IfH+e+U1JHjelYYBhNErgRDmOzrkNeuoVTwtZwWhCuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQ4FVv4r; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQ4FVv4r"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso39712295e9.1
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 12:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777837972; cv=none;
        d=google.com; s=arc-20240605;
        b=CKsgIKTbbxt2JBPn1F6iz/9/uxqXQKgO8Tlz8CphQHS02uhM1351bccbwR0Rd1RUuF
         bFCqmqTh6p/8EIwjpmgM5S4Co4a/uNFzs6F8BdFyskpjt2d416x+kOh1ZHiYXTK0/eHJ
         b/5OZC5U5us7u3CIa3jnU9eryOd/AJWGn4hh4TKFgXnTqEthoQnqyieIVmLH5lrKqTQt
         YxJJrfpCK+ee4u/HpSXn0P4CeqllYwrwMJlZVNOzGto3jtC5gtkV4Uvx3U/0z4JxMwXh
         6pOuMgZmOwZ+zWCk9skArdY0O/CRHypKIHcRL8QAYJ3S0WNsT6vkwFb0JISXROwzOrt2
         32nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uZLiEb2AKafZjis01rYd0ydpsrn/wl2hltrcdbVAOV0=;
        fh=DD/WDZ2gCTuycDU6wpRh+x+V62Uy30ba+KqZNIC4f4o=;
        b=a2dcwMaweS56tWQJTXIVAW0QGhLe2ZomDiF+bUm2ARyl0rEchwhRwKA+bCFCTlXGpS
         lLqOiySdrPAwrDtrK3jKxLz8yN/k531gMMqK9IEAQc7UgPhGCeNoaxOoWHxX6PBDQj/q
         fJF5E4Rzp6jenRQtPPopl1bZTHbk3HrS8+z/S2UVi3KVtJmaRwsLLqk4bMrOV7xkuGtS
         yZMFy1MqYS2BfUCw6i0TlU+5TqfPUgCyHhTMLb7qcLiD8EpGgs3Rcw54WUoruPeJ0Ays
         zeX4/laSq3SvSHdH4i8Bd01G9zhFr+K9V9HdOebqBgPEN4IVMs1SZ58Iv0kYk89MYGQ0
         jcWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777837972; x=1778442772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZLiEb2AKafZjis01rYd0ydpsrn/wl2hltrcdbVAOV0=;
        b=ZQ4FVv4r5Mg1K5HQGd7RxnNVRxvDPKvL1SH/j4p2CUeF0l0t63UNAoFSoZjYwmYQIc
         SsAecYuHrtclEG51/DJ3HVgLTis3XiOtblGc1onltM/ebSTNGBjhDJuKBi/+GoLhzOBU
         jm3nI+O9qAL4zXkyfGCKwyck4Slbe0RzHXDzEv0W7UVkTusS9CTetjLjsZ8ayOyitx4e
         ujRxG1jftQhOohBTvGKFTCfxO6BBgfQDCvBLnA0XuZgeJOxm1Z4f8KRQwUSiZrjDoRI9
         XdO4hqGZWgpOL7vb7GApb3XyrQ8C+Yom42isrdOZF52RKEgCvOPBssvPeAMpmq0y8/0U
         RAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777837972; x=1778442772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uZLiEb2AKafZjis01rYd0ydpsrn/wl2hltrcdbVAOV0=;
        b=qT0gMS+f6QUD3d0IXXH9jSKwsLtcnUHZ37tVRS8Y/TWvFYn1mwb58EmbxCJz+oRxUM
         rEgdkDwwG00cUbm9UemIeI3lnOXHG/5ZEQWog6yoEgp6aWQTpJK10s/JhXT8x7UrXNkH
         BtyUo2aZi2Sb4kSY3g0RYxgAw2Ejl2DuFTaXKBwBqJHAyWmdq2o+WPQ5Knw4z3uMMMxP
         bk09RFtr6+JJoUfZ13+1tNs2B+/4NFhrl298SyeqqHFHiRKpRiUXi58BFToyQjrwZxuK
         53SbE4OrGInTw8iBUU6dcdmeJ9B7g3JphpV0+ZsSyJc1llhbPwmCCSmvh0M//07q36Mz
         KE6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/lLi4AHdWaHMJ3fCrdHpf0WKAc/Ik/MWGVRajcAdgGRkZWK8IuBqSENhKG2QYMEHocIdK2HLL2XpU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1h5eQwybeHaNPx5WyZtQ3XtMBHBFNpIpQBFSnBkpsKzHBfQDJ
	q1LJuNAenjcds3AtOV35jT5MB2rDvOx5ivnIJ41LUsZ7BPcRQcBtlheX5ms7sYkXvDDdelkOGqj
	FIKYuciFB9Vt37So4PK1r/Wr0fNNCHVk=
X-Gm-Gg: AeBDiesAviatsue74Y0yuxXVQzBwOg4Q6JLyqyiySREjZBznsw3Eto8L79zOn0H3uIY
	GIhD9hvvnHz9xMhWJsUBqwpZimGoD/UA4UHR5/RxYIiO/LM5GKZ/St+yifM7spMQgFY/yMjM2Kn
	iNOZ3Jf8QV6skfS2+BpU2GKOzpTyk/mYGaCKRleggzkrvwSHn4WWnBMtNG7rgk8MRgc/XUAvpZ6
	5LH/NsxtZe2FwXH9zZ3NUW89Dn08kf8WYAG8Uew+fRsNn9D1uO+hcJqCXx42moDj+YkvS8MF0nX
	4RVM1gj2g6dSxZFOUOPlH2+ZhacZGe8GuNtjzgMC1cLRJOZYFbecX+aXqoRTjE3mMCwJbgJ/2gG
	Q/co=
X-Received: by 2002:a05:600c:c170:b0:489:1abb:5559 with SMTP id
 5b1f17b1804b1-48a970ab55bmr105961725e9.5.1777837970601; Sun, 03 May 2026
 12:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503190119.559696-1-atomlin@atomlin.com>
In-Reply-To: <20260503190119.559696-1-atomlin@atomlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 3 May 2026 21:52:39 +0200
X-Gm-Features: AVHnY4Je_hdJXpt18lPdcni3VJdqTxwGXnWD7E7YxoG0u0WmQy4IipQtUwj54IE
Message-ID: <CAADnVQKf8=Z31fqYSVRqpGa5a0Q_-8nS5uHLfBNCYUeJrvigwQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4] bpf: introduce TAINT_UNSAFE_BPF for mutating helpers
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Song Liu <song@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Matt Bobrowski <mattbobrowski@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jiri Olsa <jolsa@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Yonghong Song <yonghong.song@linux.dev>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Randy Dunlap <rdunlap@infradead.org>, neelx@suse.com, 
	sean@ashe.io, chjohnst@gmail.com, steve@abita.co, mproche@gmail.com, 
	nick.lange@gmail.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 9:01=E2=80=AFPM Aaron Tomlin <atomlin@atomlin.com> w=
rote:
>

Nack.
See reply in v3.
