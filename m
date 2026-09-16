Received: from mail-qv2-f14.google.com (mail-qv2-f14.google.com [74.125.230.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9311849B1F5
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559502; cv=pass; b=K5El76S+xoahVRr4jYoRa7HTrk0rguCmufSpkmERl+oagwwlNrbrBrTmwF8sPdeZLfNJ+kpqOlbhpch3Svx6wZChvYum4Psyw8plnr71FQ3GWgIUuHVjwh2aiIqr8QGP78RAKJaSuo3kVeqlqgPZnviN5CDoNX8fRO2dePmjTIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559502; c=relaxed/simple;
	bh=YOmEF3RdtEQd27A+HJI/2dxHOZ82HAMaz39HcSlJm1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtpZd1/4kG/3nMAiHxIOeSdO4Dz4lFOsjzufF1V+nS15glD0l2LBU6F+kDtfiaHnDhIqTFrqsOfmuQs1/kYFwcZ2pfXXijq4Kd5ER1FX8tJ4gC1/yPHJo4hgPE43Mo1XJNOjIv8yuSDpiwsk8skpsH+qOCQWCc9FvBXe9QD0ZXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxOXBXXx; arc=pass smtp.client-ip=74.125.230.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxOXBXXx"
Received: by mail-qv2-f14.google.com with SMTP id 6a1803df08f44-90cdfcbe20aso8351976d6.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 04:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789559492; cv=none;
        d=google.com; s=arc-20260327;
        b=BSHHZ04GDWHY85K8V/rWBsJvoZTvzNhU4ai+GlztiAK2i0mR6E6lsSMa3VpGmRUPby
         qgAC6BrGZTi45lFwLADvObbBrBDLhz26k0aLJ9aA5+xOa/JwZ86OeSCoV9cLKxa9K8/U
         X54Ny31yT7+j7nVAA+gncRRRbFyuIDICGvN2KleOZLNnAYpJaPtecC7qCNCKQreLP7rk
         X3KjISrEafFqRNF7AX7fEOkXX5zig/S51MBfPfdkggzlRrdG6ektZh33o47QCk8pos6h
         ionWQTv5jbAPgUBsSCYdE/lZqFaE7Hpd3KbJh7ua/IDigsRyPpz3CCg7V8gDZGto0LR8
         jx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOmEF3RdtEQd27A+HJI/2dxHOZ82HAMaz39HcSlJm1U=;
        fh=7lrjEmH1WtrzAcgPCQYbz3/+sXs9afa7Npc0ExR9ii4=;
        b=i5+FmOWH0tQJgELJq065RgeHlAA5ZIRCs3VBCcotqkkgk97azCi3XjiQI//Bl86NKT
         IdUMDgUDiVfie6yhAsDWAJVfOOLaLHvO+8wtcTeUtRMOCr0d1bALYCVAvVr2HQ76yMJn
         3DrVLUHMwxCql3Y9OWNu14U89i1J8/nf0U6/U64ThR4rlMetHjSWaDzZMuXvPaBlbOlJ
         sY132ARwQ3iZwpCWiFAd6Qj83B4UwbXzMcX85K8wMLC0ctw7tG4KImWSz3EUa5MTwFMv
         fHgtalaDfPNgyvr/wacyjvrLqtk4EQRbZBcmEBixK8Zv8PwT6sxJHFVj+Ru3lzTer7e4
         EB+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789559492; x=1790164292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOmEF3RdtEQd27A+HJI/2dxHOZ82HAMaz39HcSlJm1U=;
        b=FxOXBXXxN7hILk7vGeVOV8qNLJlRE7ZZnosVXdd+JHKUpSf2FMZYQmiD+MGrtL0pjn
         vZm666Gi4gw7S6wkeklut08njum/REyCqicGHKCYaBlPkQ4yL308n4BgJEcq/CEPGgXb
         2CwwV8KFUBh5STeE+c2L1f/jctQplthEO3HciUSBoF2askOGkL/M3HDUqgoeJcmJbj8q
         IwS4v6oyVErBHTkkmySZhFy9krF7TW74ohavWCBRnGwGBQdXqaKbySOP/66kViziLT96
         YhvEagKeVuYOrtqJZpObE4dvvQNhQ4ese+PzNWLdNa0RP5ogfNYMwPP++pIJ+DtviXFn
         Fi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789559492; x=1790164292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOmEF3RdtEQd27A+HJI/2dxHOZ82HAMaz39HcSlJm1U=;
        b=UQzdM0XcKW8wHtnxsbtWTY4dOblUKVhdw+HedUgCwktbcr0sVxnj2Hl935VkJAF5nf
         xt++/4cUx2qsyrVPBsHc96Pt25TtKXU5neSO+UxMFy+zZtLhKm8V9NOCKdDt7/g9OSQn
         Ts8DTZu2Grcnnq/os7YJYmoH4hUug0pC7qDDvM+RD2oBoaFeqRaYP43Gwx4QrMczGsse
         aN9VEgmwl7wgh3YxqQp+NMQRFChwucoZmSdZN/FXFDaBmGc+HjpRleSIANr+yiyEESLh
         LWbmr7vBMo06BaA1dDr/8bAXkfLws53E2oyTJv5/n8Uk/JHqpBH1aHhaxja8g6kAefSr
         8mhA==
X-Forwarded-Encrypted: i=1; AKwUvBwgnnnA9UWfOhrZrS2itdenPxGzRvBJ5may9+/aTTSkSLK/TMF/SRKkFZPDWt4/sGXV0yjQ1VFQK6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++ni52n3u4uct1RuDo93CMj4IIdWDhHeztEpOtJxF2gC7OV+CcPU
	VFBczs/0JjO2xDPAL3lFpdIKy7ZRpKQb7cmzuGSC7dd2jSJSOn5/lwRFzkP1tzpeOYXG+T96DOI
	jKKTQmMmsLGiLIQ63hFcW+iA0v5kK5SKPZHNx2yg=
X-Gm-Gg: AYBFou1thKcy8CbA4p/R974JeyKysxdayU3CqyNTW3VMhSwM5dCoHi7kGZKuxPjpfId
	KCjWMPlFCKY8jXsMWR1puZRFUXrYbX/MC3lYSRi1MoJZxTJ9koRicLK2XKDarCZcHyg5YrLyhGr
	Tx4lp9tUfCQKbBKhmOpQ8a4fCG+lGtpMvkNAGNOO1QDsC1Y1IgCpC0R0qbW2osCjB0/p/QKx7aI
	2Vu98kq1N/b4pd6PFgPfHXkBllvw+n2FVTa3UUevCOTRMnHGV6lxo31HwjK7RjIlkw91RfinX3J
	S6nSfTBZHSLkVe8RFvI4WU92x/D+A+/PyAgT7Nb26GnYKEtu+0TyOvDLxGy0aSy7DOGiPYELyA8
	KWGctKfuofNJe5avPVety7Wuf5oSZzf9gFuPZV9DRm5V8cCMUnLSJoDq10k8vA5ZOAECOom867G
	qva1Y=
X-Received: by 2002:a05:6214:4412:b0:910:4861:43ac with SMTP id
 6a1803df08f44-9123d714b57mr44221246d6.5.1789559491823; Wed, 16 Sep 2026
 04:51:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916020335.17034-1-ygorotavio.sjc@gmail.com>
In-Reply-To: <20260916020335.17034-1-ygorotavio.sjc@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 16 Sep 2026 08:51:20 -0300
X-Gm-Features: AcwNN1ULJzkm21Hp7DKN8NoIMr4R2FtApuYbsaPt-WrNqV1bNMsk3Fm1LeLx77k
Message-ID: <CAMAsx6cZ+w9CN44+NMAeSUewfUsAtj39u2ct2mxVzExCvcU_qw@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate generated-content.rst
To: Ygor Otavio <ygorotavio.sjc@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 15 de set. de 2026 =C3=A0s 23:04, Ygor Otavio
<ygorotavio.sjc@gmail.com> escreveu:
>
>Translate genetated-content.rst into Brazilian Portuguese,

Small typo in the commit message: "genetated-content.rst" should be
"generated-content.rst". Worth fixing when you resend.

> Assisted-by: Claude:Sonnet-5

Documentation/process/coding-assistants.rst (line 48) asks for the
literal word "LLM" here rather than the model name, in the form
"Assisted-by: LLM [TOOL1] [TOOL2]", where the optional fields are
analysis tools like coccinelle or sparse, so in your case it would
simply be "Assisted-by: LLM".
