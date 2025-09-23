Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D9F194A6C
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 19:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655987; cv=none; b=hFVmCqaHPXwJhu1fJ1gD4/SyQNFe83otcwMYCFDmE5TpJlVxLkV2NLhr+IJndeLkrYlZBzGYUoQ/ipVhgEx4fQQ3RrKXWDpq+jb+fqR2StBRe88RhDs1RwCNJqpolqZMegjVzGMlCgLrXpTA/O4l+QW/j7XUNun1aWOnFAAE0Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655987; c=relaxed/simple;
	bh=0MuzrNmVFvlrMIdu4Hu0o3+JM08RVibkcmhuvrt61xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7IrgMvBMnx/p/Vx0vSVp6JoJ4ipIfwzykrKYW/2h++e2jwQigUb8rXKp1HL/PFP676eQMq7cbJMZC7Xn5fKdAW8tMgmfv10gZqW3KUPm6GPFGEtSeh2Xb0isSCt0w6XbplR+qwN6J7RavEhTD70ObzSlMy3FzxM9P+WNZK2dPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLHnp32o; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLHnp32o"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e29d65728so320795e9.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 12:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758655984; x=1759260784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MuzrNmVFvlrMIdu4Hu0o3+JM08RVibkcmhuvrt61xk=;
        b=KLHnp32orXrM2GtsPRiP5QbRQMX7MqAkpHpNRJT21Iy2itg5e2MN7Bbgg21lowJXyL
         /Y6/hU3ZvJ9Nos1tw2pGfKOftzf7mdTeho7nWjlu/Bw08prtirC+2m9RASoLV1unSzpX
         y8TdY4oNFpn9t37n6D+a41brTR8cPYIDZo6ZbTPLfWYe+a4SUyjg2eAlROQ8u2RR74GY
         1WDssYXOMgY5iwkzKxHek0BfqtA1ndZou5ymSo5qYknhMDEpZ0mEaxtGXZwnkZBSECEG
         SotNnYjOp55iZS681rPitlvzXTAufk8eqluPaq0cNcJ6ZblbvkFixTGx23E1RrW/3pcq
         9g9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758655984; x=1759260784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MuzrNmVFvlrMIdu4Hu0o3+JM08RVibkcmhuvrt61xk=;
        b=L33n0kqxuMgrSSdDUUEiiQMrfBiBpTBkAk8ghJq6vJ9ljnvw6HHML0IkiSc99L/9Of
         K9Z4oTexNN6nsOUzpn03lYdHD6/ij0ef+aB1hv69bo/uesjYN24n730IRypRZJsnPoJP
         uZZlLXRsr6OzA9Y2CNPAWah+0qwQGeFZxyPHvmloJ8U34r0nYq0dqTSIC0Bwv+Om/4hq
         ES5g2kZnujpwKFdM+m6qyOTDIMhogHPY6SeYxPMmA5pfG5x09F7tBfeHdP107ne6Qsea
         QsUNyXtGL9FR/KgwoqVC2AIBAb7432psa+QKUhvviKWpB0G4XpEBJ+HsnsGypU/PKHdl
         cGpg==
X-Forwarded-Encrypted: i=1; AJvYcCXMY/qTpzHjHUbI9WtoYmRCUIEEjSQEeIUlpxkTXqlYOKQNsy3sedGb+33lqxkrN9sOEezBgHSLKnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3LTOe62htwleS+0l4oPR9NS9GmvYltn2aZfN2jZWYfHXXrfX2
	XWVjIMZQ/fUf8zg3/lPm8KdCM6TyHlHqtnpbIK/nsrMP7h3XC01Fteq7EhV22PBT/c9+nA79rb1
	o2lVX91qyHETSntf2L/vM+pwVQYT2bp0=
X-Gm-Gg: ASbGncsvJDU/FUc+Uyb+Ie0ipwDB2pr2riZ5sYb09GfAkZzK5oDe+E/P52Q61pMbMOe
	QYMcR0JZBfvPULQkkQCLwTofLfotch5dBqytut1YoKHJEObeFKhrCoVGyCByzoLkmQkD7+/6Ov5
	/txWgELsar2p68gdMpyuCcIjP97DWHVPhOX5aUujG6HvIlNwO9N5+CxH8QUs0qjok4zuVwPfMg6
	2MsSLY8BOc+Mpx8jg==
X-Google-Smtp-Source: AGHT+IE8XrcOsL1rWzwkMbgHflL8vbyW2fCrqZ3kwKccRiEzS6MH+EPt7ULGAqOqBI/jjSYJ4B8a4jczeivubLyQDNQ=
X-Received: by 2002:a05:600c:3b11:b0:46d:1046:d356 with SMTP id
 5b1f17b1804b1-46e1dac2e1cmr31049435e9.27.1758655983762; Tue, 23 Sep 2025
 12:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACKMdfmZo0520HqP_4tBDd5UVf8UY7r5CycjbGQu+8tcGge99g@mail.gmail.com>
 <CACYkzJ7X2uU=c7Qd+LUKnQbzSMyypnUu_WCMZ=8eX6ThXn_L6g@mail.gmail.com> <CACKMdfkPsemrUMPXNO5OR9Y2y70xNVVY9ss-3hX9NtGXFJxyQg@mail.gmail.com>
In-Reply-To: <CACKMdfkPsemrUMPXNO5OR9Y2y70xNVVY9ss-3hX9NtGXFJxyQg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 23 Sep 2025 12:32:51 -0700
X-Gm-Features: AS18NWAN9XrK1XwDoJdvOpkTTC6Whfk3KPMyB7ODQPD4-VPHBDtcbbqqaxPHF-A
Message-ID: <CAADnVQ+XW_YC6Edauhf+AoWLx4uSNchbQUic33oTeNskp9yt3A@mail.gmail.com>
Subject: Re: [PATCH v2] docs/bpf: clarify ret handling in LSM BPF programs
To: Ariel Silver <arielsilver77@gmail.com>
Cc: KP Singh <kpsingh@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Matt Bobrowski <mattbobrowski@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 3:03=E2=80=AFAM Ariel Silver <arielsilver77@gmail.c=
om> wrote:
>
> Just so I understand.
> 1) The docs are indeed wrong, correct?

It's arguable, but removing if (ret...) check
from the example is worth doing.

> 2) Any idea why I get an automatic response of "CONFLICTS" when I send
> my patch? Even though im 1000% sure there are no conlicts

The patch doesn't apply to bpf-next tree.
Pls use the right tree as a base for your patch.
