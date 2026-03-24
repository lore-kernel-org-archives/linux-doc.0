Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9944035C3
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365147; cv=pass; b=UHQ2F2sD2vkf1Kvx/g9UniGhFq9SJryafrNhS3t+b5krvZZ5vVJ3IWOctoLTiaWGq1ZqdN1MrXcA5NVMMe7AuLqIFMXSGWA8dFfOPqfe1umomJzEl8x0zJUEfCh73IpXiGNiyxthHBMIQZoVkDG48xJ46q0QnWoyOGnWzJsZT6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365147; c=relaxed/simple;
	bh=DkvA0f0R1I6yYwVuzVRz3vdcNRxquFRNpQPJVodbTWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxaBAhoAQ6/O1/Ba29fnitCduC/igOjqzIn0QIyBwla1WzN1JOSOP1QwCsMJeR1DkYf7vZYLvbeA1f0QeJp+v/LirgUzrgfFRO73j2rS+0hFW/TuC5bEfUQZx7lzGCWnjX6d49opMUR5sOW0njcBO7ZLhu2eWkNKCB0sLqAh3AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7rIUCpN; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7rIUCpN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486b9675d36so45279495e9.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 08:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774365144; cv=none;
        d=google.com; s=arc-20240605;
        b=ifvP0lL3BEIDn8SINGRjG4rXZ4SIhpwRhehx7Kab2lcmDvlVpZjsJs/Jtwry6Qj+VS
         wrM8bLnlFxcQvP7FSb77OH2QZtEVpjBfKCpvWDfjlT3ov3WBLV/HyWYGYHc1394tlo6y
         jlTyCIi7D/7aSd95NIbCTkgJ3D5tynau5WB4WwvRNjW2M1gnquxpQe4qg4OdvwI0n3jc
         lItWCyNTQgVLt4tZgRbeNXOcQZ6qnC1FE4jHoJdW1kS54YS3pv3DpDyLGtJ59T2u76SA
         SNdj93tvc2/SB6VmK0hiQrlePA18zsKOHijXZWt6/TajjcSU44hVnFpgUWB7a3NM92o3
         xPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DkvA0f0R1I6yYwVuzVRz3vdcNRxquFRNpQPJVodbTWs=;
        fh=UF8scd1CcLTDWC07kLkphLtskkThQRn/AzuG2BCD+x8=;
        b=k+oAhCjnXMd2hd2YWcB/YZqYhzuzgVvNbNcMk31KLKUFhaG8N34G4ZkboWy47P99bd
         z+U7baXCTCG6mkZO0zPvoNc1pLg3C3Zlkr7rLDjFfAwfVJ7AJ2ojnGcmMaAxG/tnXSGC
         zpqvYYgsq2BxqTDMsKJ6gHOoNA7ETEmk3CYruC97K0clLiZWRsjMdAJ2rZgj7ha9Qmhg
         PBY3zgZUY+4H/V3AJz+k7M70Ok++6phgtGeSLu1h5ZrAQ0x6GYekLE9ivqu9mvVUAnHa
         RTaZxF6M5F2TgHnOquTp03VInSaVOwgOVl+0jUtHc5q38jenyh0he7eHr5BnVJa1YfM2
         Wt8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774365144; x=1774969944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkvA0f0R1I6yYwVuzVRz3vdcNRxquFRNpQPJVodbTWs=;
        b=g7rIUCpN58WhowYUjDPPlmNqt+6u6uR+cqQJIMUf56KJgn5f8cuIIPmFBTBWKMTk9o
         H8KFVnOV8gxYeX8cDgg2YgY2k0QGTPFci0+HeL0H7e82neTkmdFSRoAbNixhx4+5+eXa
         QAQguesxRw8k7uueqqu0EE4JtAdpfCv4iW0Suu6JKZrZUSVxzkVyZaEhE+gfpF533mpo
         Xjc9dOz//GKSYX8Az2wVsz5fcy+erS6XfYpukMtwPtka6Ot/iZYFlTMK3363cjFH1XFf
         1+RrJXZyDr18iLZDBMAfjbZDeIUR5ulRj3OCsWLJAZ3RXQf/MHxrHS/ob3ZRlXT0d32t
         E+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774365144; x=1774969944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DkvA0f0R1I6yYwVuzVRz3vdcNRxquFRNpQPJVodbTWs=;
        b=g/V1Seicqao8DktJl0Q6/g7LEaDF8cX+zUCxQNvEB325bo4xW9hfn9CHMigJxYQWV4
         opDQ3R4xZLsaHdf5PXGK0i9Oi1J7+/k/X5iPnhAFv0no43K517WPDjjaV6HR0bolu1j8
         /1TNuyqwSB86Fsp+lpkQUy6pLyX/JUmzA2ad8Jji6Rmju3pMn+VlKTilv0HixXeGQBf7
         c2ajLiiQsIG98VJahRjsMqAu0mfM+HlpdE6fAEagcgb+hrI8vrU7DiWxjXC3vnakK9tL
         oxz3LSGthlSX4dT+elPB0B+gtIc24zWXgl2F2/y3coHFisJqQNerUNwu3hBJaQUJppz2
         GciA==
X-Forwarded-Encrypted: i=1; AJvYcCWhPPnR2b9Znr2zQ0Bb5XeOl+DaHX/CChyj4NHxfQQN9+HNjsgJ2eSlA5sZTdK/Et/dFaTCnp5vIQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhytJ1I+mJu5U+pxujVJcKh4YKMcwkczqDfNfiWudP9kqZ9Tfy
	QkuuOzaYLAm2Kn6y/GRU8hdM47i37mFFAx6n5KaLc5ve+1+xwZ1rPBDgkUf2tAy7Tab3KLzR/mm
	KUllZQQyMOFmACkkOJ+aoyrikiy2venA=
X-Gm-Gg: ATEYQzxB6goBtQ51n5ZLzA4MLxc+JAxMGOuxs5MEQI7o6Nm0Pc0H8wJ3PuzwciZRffk
	0v/MzNfyXHVWHgXIIAtJ4fHYKRmOhGgYPEIVjxGMjILpENHr7euN1rdnaOFKoTKQyXdv/1XvDud
	9CeyVbqzsF1POQg9oyBv2oQI6G574ko2X95qko7XlFSJFb2t+N3vwpohyNerQDxnZwyBr4LBLLB
	0BPREsxyRMkDZAvsC6Dz8ubamreXUWVGfW6IMSWoa5aVl+ZB4WswQqYcNpFdlbBnTAF1J6Vqic2
	iu+CkH+mes28fjWGTCkMau6vtD1xkO7N34nFt4xfj8jeQWY3htxW0FTnJPkV+yEbG+sL9+W3Dzw
	lzcqZOjc/Uy5BgwBVptqY3BOFOg==
X-Received: by 2002:a05:600c:1d02:b0:487:716:2fa2 with SMTP id
 5b1f17b1804b1-48716039accmr1663945e9.16.1774365144110; Tue, 24 Mar 2026
 08:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324062028.2479059-1-suzhidao@xiaomi.com>
In-Reply-To: <20260324062028.2479059-1-suzhidao@xiaomi.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Mar 2026 08:12:12 -0700
X-Gm-Features: AQROBzAeVSzmHwocMIzC_T43SeE5ZYGvZMyy7DiwYCSIR-IJMsc074leAglTCeM
Message-ID: <CAADnVQLbtuD=7mtGZFR25ULhjZ-3ifBpkyRcqu9jPSd2Mt3fBw@mail.gmail.com>
Subject: Re: [PATCH] docs: Document pahole v1.26 requirement for
 KF_IMPLICIT_ARGS kfuncs
To: zhidao su <soolaugust@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, zhidao su <suzhidao@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:22=E2=80=AFPM zhidao su <soolaugust@gmail.com> w=
rote:
>
> Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole
> v1.26 or later. Without it, such kfuncs have incorrect BTF prototypes in
> vmlinux, causing BPF programs to fail with 'func_proto incompatible with
> vmlinux' error.
>
> This affects all sched_ext kfuncs (e.g. scx_bpf_create_dsq,
> scx_bpf_dispatch) and other KF_IMPLICIT_ARGS kfuncs across the kernel.
> Ubuntu 24.04 LTS ships pahole v1.25 by default, causing 23/30 sched_ext
> selftests to fail on affected systems.

I don't think that's true.
At least when implicit args were designed the goal was to avoid
pahole dependencies.

Please share exact steps to reproduce.

Updating doc is definitely not an answer.

pw-bot: cr
