Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746E12877F7
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 19:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777837923; cv=pass; b=qCpktObhYnq4CUTXB6JcW+dlHEMc93VwAQvPzBas4SGcUZ7YHfveB2wtuXUw/X2fqw0j0MFOwkf6rrpfOH/qNiBsup/2F2wWGQcFacWiRLaa8Mgxe+Exl9JgY9b/GyzyzKcZZ0rZLxhb3f1fUkCe/SQxt3WWjYl14ZQRLETg+6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777837923; c=relaxed/simple;
	bh=DltqfY2DnqkS5mXlCZEDd0aLOzaByEF9OWsh8VyUvms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRV4p8Dm0OLVhTtULbAjyo9e0WS7/K4q4eRRGxcCBdaJmM2fT5M2twmctKor8qz9xRE4rxjwRXYcdjFUFw87iczYnxcFick6Ww3AGH/6/zc/aHgl5A5t41vMz+PNwGJHUEoLc7AwvrfpHXtfmweKNnbkcz6FyaaT42zTs5L48DY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnYzhCxg; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnYzhCxg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488d2079582so37127475e9.2
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 12:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777837921; cv=none;
        d=google.com; s=arc-20240605;
        b=IIvn0JnDlszcLQcSEAshDB+RvksfOOaWcZ4ENfK6V2Vfm59m07bnAvm4n0n35tOXw6
         h2xy8JoWiGojxe1vPRC0zYBbAgsiETmJDPVpzhzmdpigUu5R408GTKc+Y4d6DqZ7VhX1
         z99xBo9NNpVEVrQo7WHEF89Hvt/FoHB+Y3am8Tqv2dE0k28Dt65Uqp8JThCSPTUApPJc
         KFIIfoCGGo2PTi4IGPjuyQsTOBgwlVJNv2sY8aGGeAhmlnSp56T5hC69EzKyegAKQeps
         U1KJP0nsFKc0o/+9LeUdni/lMLqqIHmS4DGzf2t1zauxeWqEI5/cEyjCpE0g8RgfnguH
         FVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MO9uxptEOBu74fEJnlr1X6LfcN1QpYq+iJ0FUEQHje0=;
        fh=saVPJWIXOgNKrVdXTnFdWKr7WF1U0QVgZfk1qopPDkg=;
        b=NNTUB9F9Er2+HxldOcp0ecaS4Oy1A+DZAjF9Hy+exSNnSV/OJxO16K7hxkBZNIGA8F
         BgSKOyunfd+98FuWVureFpSZlPn1ZbEDqKMa0r/ys/q8ctoIzDXvnz+qzcrdo1HMfM3O
         GQ10uxk4/drZmcoRdradpAiyVtqcFLnspHyLjIOC2Qm2lPX5jS9Dau1M/1C0SuWhC7nJ
         cRPqok4btyII8FtAZFaHgQw8KeyHFbRT6DBbxz8smkwQF9goCbEDO2cCW7LhNWGSggKx
         WS8ng9oPkdKtaRoxuZwGJmiBwf1Cz5Y0Pm2Mjsx3Bkoi7D+A82XzXM9c+XzzpIdyKsyp
         2kpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777837921; x=1778442721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MO9uxptEOBu74fEJnlr1X6LfcN1QpYq+iJ0FUEQHje0=;
        b=mnYzhCxg9ZE5p69V7X/lqJEUe2kCAhwAxQJ1giuRnRKVz+DiN8OId20cXjYE5M/iCe
         3V5/gesbbRDyF2VY7+UPLRXGNOw44Z3zAW4r/ieaY/MrLxjrnryc6StEr8+yEtG1Pzp5
         zQaWntW0ecnxt//PTRNA0SIXUyjIQfvsiLQ8LLBuFG65V0v1wuHbB2ZVXv8LLDqxFx6A
         UqafEtQWKq7gykbs4uA9Z5l04KDIHhHtyaZZkZXpt5NUuwMIZ95fUuXunE33pEm2cOvy
         RrxB9abW/lm6zPjBIb99VdA32PcZZoFfvu2iob7bkJs0FLpVAgbXuyHmo2snCjs2vN5A
         ej/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777837921; x=1778442721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MO9uxptEOBu74fEJnlr1X6LfcN1QpYq+iJ0FUEQHje0=;
        b=oplYDalG+OXRVO2DtWHEL8eMd+BItQfLFsFkSu7JMetQFkszxPi36B8vgc/MN3FcK7
         WWSK/U7njrsBGrlqtPYoIyudJRSpp5y8cMqHA+iAfC7pwLgglajoAY1x9I6QPq7yDeMz
         YHzpn2BoqPRxAMZmvDthacO7dxc0V0P/VSAkBYGOHgiXz+ep13HwH5hnx/Vw7WY0hxVM
         54pT/BVfo2iRSdb9PkJEuyM5mTcivU8fZNtjKkFcSlwBoOyeqonmNI7hwZt0MQFf3C2p
         n5lZO/44OXHlENk5fbR+UonP0GAIVRcOaLmOZ5ajqe6h/glZ2w6IeSxB+4lmFOwjSUtG
         vJ1w==
X-Forwarded-Encrypted: i=1; AFNElJ/mFpX+BBqRQFXtn0oSb9x6vuYBYoNs2nqbboJJI+MWtEy6uqqqoP3fAQPTxkOXEpY/GEZzsYeQdVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGndgORxlNy7XmBv90P8wepAZno+cgPwbSZyuG+VQuQILQPECE
	qEEx0XNHABCISL20l0k0+rRkiccTtLKt45gxXGRnHu807+fB6bTHQNXcKBH8LFZ3SwYjPZN++7p
	YVOFVwXKtgeG62V00j8DEkXVxOtnqpsA=
X-Gm-Gg: AeBDiet6P1H2zOKKrjfA55RIXZQ9EQFAmAj+I0u/efqrv8cJqunV+uSLynMsS0wyjqV
	MdKmFLX65dUbtA1u2G3/cK1bT0hhcyLMc3MWcZnFc5uoKiMWvL9eNMT72NclZP3F1SzzwRBRl7S
	fv5H4doGi64b9biF+5o2RVl0FMmds7BqPHosQUG/54xb14dspexBVEJUFz9s/hCd0Q3XYg3r1Z5
	OCmMLgMMZyytjmStjKfeDWmCSMAZdpzb7F2izNVizGFyHP2NmDPRdNV6czpnTm/hEJDw2jifh8v
	Ta8HJVHP3hj/W9U7e3fxIHDXWban9Joqr1/Lw/iYTtPopNVxVsjhqzODG06vKxRT5jGnD6wI2fk
	jYwun0MAeB3esoQ==
X-Received: by 2002:a05:600c:a402:b0:486:fba7:b150 with SMTP id
 5b1f17b1804b1-48a9865f7c3mr85772745e9.15.1777837920657; Sun, 03 May 2026
 12:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503164700.548164-1-atomlin@atomlin.com>
In-Reply-To: <20260503164700.548164-1-atomlin@atomlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 3 May 2026 21:51:49 +0200
X-Gm-Features: AVHnY4KCwOHSaSmah7QMZOP4tTai9ZqkBy8y44nUZiuECcF2WDS_Y4gkXYfZBao
Message-ID: <CAADnVQJ5fatNF4auH+a8E39zWMfja3rm4BM_xGcTnLX8uuCQ9Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3] bpf: introduce TAINT_UNSAFE_BPF for mutating helpers
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

On Sun, May 3, 2026 at 6:47=E2=80=AFPM Aaron Tomlin <atomlin@atomlin.com> w=
rote:
>
>  struct taint_flag {
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index a3c0214ca934..34b25609e72b 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -3083,6 +3083,13 @@ static int bpf_prog_load(union bpf_attr *attr, bpf=
ptr_t uattr, u32 uattr_size)
>         if (err < 0)
>                 goto free_used_maps;
>
> +       /*
> +        * The program has passed the verifier. If it utilises unsafe
> +        * helpers, formally taint the kernel now.
> +        */
> +       if (prog->aux->taints_kernel)
> +               add_taint(TAINT_UNSAFE_BPF, LOCKDEP_STILL_OK);
> +
>         err =3D bpf_prog_mark_insn_arrays_ready(prog);
>         if (err < 0)
>                 goto free_used_maps;
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 69d75515ed3f..9d56082a2ac1 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -10287,6 +10287,14 @@ static int check_helper_call(struct bpf_verifier=
_env *env, struct bpf_insn *insn
>                 return err;
>         }
>
> +       /*
> +        * Flag the program if it attempts to use mutating helpers.
> +        * The actual taint is deferred until successful verification.
> +        */
> +       if (func_id =3D=3D BPF_FUNC_probe_write_user ||
> +           func_id =3D=3D BPF_FUNC_override_return)
> +               env->prog->aux->taints_kernel =3D true;

Nack.

Please stop this spam.
We're not doing it. These helpers have been around for a long time.
There was no need to taint then. There is no need to taint now.

pw-bot: cr
