Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12C91DB14D
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736935126; cv=none; b=ZPIyX5Bm7aeWTPDQmrZtEOlcs7TNMFV1eNnOp1ZZEBNIaEce6PcOyzTqTWOMGYIuYZSQ6S7r0RpAH3cGC0Ytdh+Y/SQYQqE6Ow0F3WF2IpziWSmuh9rmLsoe1RpNrGcs6CrrcRL1iouZET8XlRuaNTyl5u+21w0g+TaYHdjriVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736935126; c=relaxed/simple;
	bh=aVHaEksdKvL0ueN7/Ok3RmujUopG1UWe0ecxKE/WeOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVAQB8mrEGA/hZSPVTXpVpL+BRRTKPYrWb/Yii275utZF65kFfo1D451RnHVwntJgw2y68D++IEqkEB5p11cLB1yfxGR4VVBtIIQWzLOxI6+PsR+4k0BgMOj2HBaO/gmvsFQuTGcTkMcThr688SK9xGKeiznK5Ku7czh+OGwHhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PIrCvHw2; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PIrCvHw2"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467896541e1so506891cf.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 01:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736935123; x=1737539923; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aVHaEksdKvL0ueN7/Ok3RmujUopG1UWe0ecxKE/WeOw=;
        b=PIrCvHw2SFheOcsHe6HzX4djxjbGNMe0Va6vFeFtiNLf2oN5W8UUC9Z5yiqUEqPcVT
         A5UzRkPkvPBNY+JVvSkfNaTDO49x7CZeq8jj909L8fdMrLbDS35KZDJNHl7RN05CzzrF
         rmABeLrwJV7JZ6+aCvnyBEdFzbZNwkq8Bf2UbMiOWDQfeo5wiywdFcCgPPsv6QV6Usrc
         31Gp/QG5lqHjKbi1slXOVAWnXZ30nVmaPHib2TDQBMOIWhofIQzu9mzhc1AZXRnO/Uiy
         VvzmOa7cT2aLfqUbnMKuo2f3WufFRgR3OzRWS9ZDbtc9xTmp2zbhpu94ojLu57V7TiMe
         IavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736935123; x=1737539923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVHaEksdKvL0ueN7/Ok3RmujUopG1UWe0ecxKE/WeOw=;
        b=aGbEPjFxUdlnRqydA3GZoz8e5Kn0E/lmjmo/j7ZdqJQQB0qLI/Ws/lHADJwjcGtz95
         M26lYZv2kRvSd1K3PGR6PicuugGyCSXmz+uGkdt1+s4u/qFZHOZrl//M2/UZE0ltRgaO
         pG7Uhvvuu9v0dpEkOzjzlQIWw5aVbxuRtdmdRIgi6RCJ8fZfNIYtE/VUG2iXC0czTKdb
         20wGIZ2t+MdidcnFoPi7INToS065C2H/jSsYGrVohrQLRnnFlswFU0a4gCmI1oDpbujw
         sCsX0KeJvVun1+hRk/Lgkw+cWyZR18VkxuLTrg0wdBrfd72/K2M6gllrGbEP7EjuyuC2
         VjMw==
X-Forwarded-Encrypted: i=1; AJvYcCXNnsj4kzkX5Y+EXj/unoLSJncbyvPK9vVRL79EezdfYMvhZmUTsulOYBWU36sPdycsRAPsgOSd+Qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YySs6NUecQjzxtK5/vXxk5JdW6yXIDdMQ309tNXxZxS+lbQFvmF
	RWFcTBSLGnLNUtCN0H+s9Nu8/sjIrHBmzi9GIqBZuD82YnV082PnURoJDHFa3AShsqO7UDQKMW4
	Mb8jDDgISaQXS8J6pBp/nqvedblJ3QwjzxVOb
X-Gm-Gg: ASbGnctPNPk3EShhH6t/NHBnHkpqlt5wAIN/vo4TMfBQADDpFfhC8jI0dJMFEHaBcIy
	J1CDLbAYY6fX9WVrb6ETDfPSa8i3HEYETkeB4aAREiw1ZFcy8S5aYcp8b/5jZM1kool2f
X-Google-Smtp-Source: AGHT+IFRoKy6acFIUBD4nTBimbzl9hWVwxcAFbsuvmfns+MvaeBTDArx+VzPR92E5EA/UXxgdsCCfJPdEvnnJIQ6YL4=
X-Received: by 2002:a05:622a:14c6:b0:460:4620:232b with SMTP id
 d75a77b69052e-46df57d576amr3000461cf.28.1736935123343; Wed, 15 Jan 2025
 01:58:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
 <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com> <5abiddu5zgxdmotauxnohnk25zyzd3cbjlfgskejk5ta7arzk2@pjpofoy7pcce>
 <CA+i-1C1WF1cSvcNABGRbg34_aaOnSoVoDNBR357q8rrGk52OPQ@mail.gmail.com>
 <20250114-tapir-of-splendid-leadership-ad115e@lemur> <CA+i-1C2OrLDvp_xiomc_B96vZu8G8KRrg7KBHATz2y7KMO8UsA@mail.gmail.com>
 <20250114-olivine-adder-of-weather-1eaabf@meerkat>
In-Reply-To: <20250114-olivine-adder-of-weather-1eaabf@meerkat>
From: Brendan Jackman <jackmanb@google.com>
Date: Wed, 15 Jan 2025 10:58:31 +0100
X-Gm-Features: AbW1kvbFwOW5TtRWkCgOr5ftlBK46ay4xW20ltqt9dy4PvdTrtKFHeQQ2U9zEK0
Message-ID: <CA+i-1C2-xB7BT-A786GSKhnZo0ucbk1m4=kPOBJ5fBempRZL4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] checkpatch: Add support for Checkpatch-ignore patch footer
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 20:26, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Tue, Jan 14, 2025 at 07:29:14PM +0100, Brendan Jackman wrote:
> > is that something people really complain about?
>
> Yes, I expect Linus will reject commits that carry that trailer on the exact
> grounds that I brought up.

Oh OK, Linus is definitely people.

In that case I'll go for the graveyard+git-notes approach. Thanks for the input!

BTW, I also thought of just forgetting the graveyard thing and just
having checkpatch look directly at the Git notes when run in --git
mode. I thought maybe everyone uses --git mode in practice, but I
checked and b4 doesn't seem to. So it's worth making this work for raw
patches too.
