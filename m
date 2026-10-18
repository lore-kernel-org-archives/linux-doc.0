Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01FA44236C
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792311494; cv=pass; b=JvEU8n7FkjkhV2SN9GV5wXOEowmTIBM15L8btdou2Q+ny6Myp2l+ZB1iNPky6C05UqKaTFNKTIfDlFSt8vt7FaRqj3PdAlmmJu45NvFsHbhC8N6nfZCs9vt5qoGIZx4SOtTvhAe9Ae2d7TpdIkC1pJRAI5ZUNdUgQ5kKJqAdSqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792311494; c=relaxed/simple;
	bh=m9LovGZRm71Kz/26siQRqDNvtYfWBfw9Tv7L/BOcLq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrXeSRXP9TLvH2X9Xel4n/Xk/cwhttNCSJEye/gqCa9GFLPtBioXI5qbJGQeAEeJ/2ZrPvx8c8LwfAAEsNzPD4Ksb7Q4GIUNbtTPNTKa7oevFJu1mi5FIESN+0AtA3SNJEydZukRFt/+fF1g93J0DFvornSEayTeY4Y9ANJHHN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbB1coky; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbB1coky"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0e21048f8so7000007b3.0
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 01:18:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792311489; cv=none;
        d=google.com; s=arc-20260327;
        b=SOUqw97Vt71xMRmYvm6zFCJZe3U7/hNO1tl3k+MDKZcoW2PNODrIABKm8GqSz5HqMB
         KNxasLks8w5qPfsDZqPcScbFTPs/rsJcP+TNHn2J6fHNyL/5A42VwlAT/7sai60ghuSd
         xpPGU38LA41prbapM2xg+1qYhEVIckK+bUp4L+yhSbWds2YkTRxb1rUqI1++eZwRljKo
         ow/pYGmzyXs/W+9JSHzNJhngLfE3SysqjEiQB+vBdEBSFMlqiXEGaAhkkxT3M7a+39/t
         kd+/Ok/mcszrhYYW3i8Vh72nW9HKvQAoB+hrSOQAgV6rEqa+CMEjv73m3h+/YR1daKOi
         yMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZKQD7f8VncSnmQVt+FYovLRzFClXdtIOZ4L3tv3n0X0=;
        fh=sR/S6m+RpSPoXxCrQ8esHw0i+XQ0572E+3+fb+mHEww=;
        b=EV+7J3ns7uN59F0yhD8YRMieDQKNqqVRurABpk2ymAAYFHmgAwxXh9ytbcfjnafXDG
         hVVwmf9QnnsOgkY5oIgMv2U+r4XIUMbXdOcvWE6QQ43Q73XQyDJq360cclqrzIZAymn0
         rGrbrkJO8D7DNJqfDJuaUVCT3xBvxzE9pOO7EwTpjknwY02NmOgTV7I8tAc6UdeIcNTV
         q16T3J2wYXjAADnZsriQsRTxkjjxskXsC4Jy/iPx4QwLS0lU30VLN/VINObq1H3NPeJH
         qB5T2xMdzFj/PlPM9HFkWgT3kRnzoy/WbIpsYYPGyOFFmzWUmRYfaEmaxOSuLPSRRsZQ
         3YgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792311489; x=1792916289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZKQD7f8VncSnmQVt+FYovLRzFClXdtIOZ4L3tv3n0X0=;
        b=BbB1cokyERZfK0hTfxQTtmwmvtFW/q2hmlF+irPUC/MDzL2O0/Pxenl+uXX7ayPMsA
         oaqNS4//XDbeIKgq7EspM7Z+rZb2/O4hklyewBfMvczfAsMmNUDKiIWKgPPK1bPM8ej3
         cBccKYLiMgbI4sEQ1r8LJL9amuuzd9RLa7YiZpyi7sZ6q9hAf/1VyMCSuMzeVThNBtj6
         o9os4L3gEcv1FtYdqfqARbnb1Uc1d1C2MCkE/VdCDEfe9Fe/qDYRjMz71OScZt75ayF4
         Edsop6C0EVZ3cXRB/6B3repVPVdKU6zgXKiT+dqYVaQv+ddpeUSqoumW8mO2C3HoaTrB
         HTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792311489; x=1792916289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKQD7f8VncSnmQVt+FYovLRzFClXdtIOZ4L3tv3n0X0=;
        b=R9ZsQ5+6ORAtE4yDRQo1zkMuMJuzaUTGAsJt41JSLpgU+vficQKYWVKxbT2GLm7RUu
         ICEMpO2iYCMlajFQa/2rQmpGlDTkuhVY02rwxtKludm1Kzotr84UoM8VLeHsibqa3h6Z
         nwgZIPGgoit7aCnzD7MQQp3deFbczmpOI9Yphhe7Mp0hF4mCYjSnJDXNKbZIU39N+pfT
         mJ7T7d4cfrKDxOFbXtA4/VPZ/uoMf0855qpEFM0dZCpi/1q3dpc+vU9htlW8vIEClRo2
         5U6sSBji+wnVl1LfWc4wWtNXgk2KdHicgkZZfwTIhBR1S28eUTiceNCin2p7QouQklPC
         9wFw==
X-Forwarded-Encrypted: i=1; AKwUvBxy1WQrKNlYZuto2G1kbZyiB50otzNl5Fu5EBEXXuZb3s4DuVmTkfHsUe3gi2eEHdzb18c2SlAWc7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBOTe8bPNwZocPgiqsK3faLAYX0rlEU2+NE5N0FQlbwrvkBnm1
	qTeOWfCbPoLjSqQ+D6SOnheNrJKX0qjmyt3R5vAuaRCpOlHXvco5fibZ8UYNF9YlOukUVr7HqOg
	Hp5451ky2DHknXVUSHYzIkdYrRPW1ikk=
X-Gm-Gg: AYBFou3nFXLnPNSQo8McmpAPkwmGz5dp9eXnL+0b9yvIsHqxqTfno0UUA7lfuHIWOoT
	lnOY3oUDX03NtXD7fg692CcsXMNpIq3y7inNYt4uFxkrSzR+vu3QB+5Ysa7EWGWKm/ighz7cCr/
	LjHLP4ch6NCtDWOpb8yWpq2mBIjKrDOOC+/vKtrixJ+qc4ZSc8QQaNQNBOPWoiy4WX2yXLW+Bz9
	O9Ucse7pDwiq/I8Be2QJbEK5UnY9bejHm9S7RxnE1/l0rRoKF6gJV7UJZszo1Zh8hGm1ZAblsUr
	hd88CyC34N0rsrsEXamPHMrHQfe0suoY4VLuvbkHJQM+RCVPeL4jBtSVhd6vd5UUvtBbNih53Kg
	ey7MEiXRR9qdtEPS9Fc7fSGBiOZhJIkhI2xzmDY1493ahFeq+li/+
X-Received: by 2002:a05:690c:f13:b0:8b0:89bc:92b4 with SMTP id
 00721157ae682-8b0f21bbb4bmr16206517b3.51.1792311488622; Sun, 18 Oct 2026
 01:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com> <20261016-alpha-perf-regs-v3-v2-5-17654742226a@gmail.com>
In-Reply-To: <20261016-alpha-perf-regs-v3-v2-5-17654742226a@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 18 Oct 2026 10:17:54 +0200
X-Gm-Features: AclHuK_OPAh6roFXb_L2yR4ZCbLp7NUjn97i4r3orTmSL6OpqXmOnn6fpLIEIiY
Message-ID: <CA+=Fv5Rmwd6pjs_MBo01Zvqo3CwufefqZvPCJeEvK60Ona0tJg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] alpha: fill in pc for software event samples
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 17, 2026 at 3:56=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Context switch and tracepoint events have no trap frame, so perf builds
> one with perf_fetch_caller_regs(). Alpha does not define
> perf_arch_fetch_caller_regs(), which leaves that pt_regs zeroed, and
> these samples report pc as 0.
>
> Record the caller's address as pc. The zero ps already marks the frame
> as kernel mode, and pt_regs has nowhere to keep sp, so pc is all that
> can be filled in.
>
> Reported-by: Magnus Lindholm <linmag7@gmail.com>
> Closes: https://lore.kernel.org/all/CA%2B%3DFv5S8-Zk8-LUpZnWiBfTGSQXthepm=
Rc_-a9O%2BpEPmVW0mRA@mail.gmail.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/perf_event.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/alpha/include/asm/perf_event.h b/arch/alpha/include/asm=
/perf_event.h
> index 5996e7a6757e..72536566014a 100644
> --- a/arch/alpha/include/asm/perf_event.h
> +++ b/arch/alpha/include/asm/perf_event.h
> @@ -1,4 +1,11 @@
>  #ifndef __ASM_ALPHA_PERF_EVENT_H
>  #define __ASM_ALPHA_PERF_EVENT_H
>
> +/*
> + * Software events have no trap frame, so perf_fetch_caller_regs() fills
> + * in a zeroed pt_regs. A zero ps already means kernel mode; only pc is
> + * missing.
> + */
> +#define perf_arch_fetch_caller_regs(regs, __ip)        ((regs)->pc =3D (=
__ip))
> +
>  #endif /* __ASM_ALPHA_PERF_EVENT_H */
>
> --
> 2.55.0
>

Thanks, this looks good to me.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
