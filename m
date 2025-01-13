Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B784522BAB7
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736788320; cv=none; b=lb2R5jDLb3HaFZhtF9HkwbPqoyBwPFc42gzznpibN/vL8yLfkxZ9UjIkcp0eAAJYNTaNJwdjiXzdM9caMgXN2zyBKFB9/mpZJAxeAMrf84gMKtDuOG8cY0yMcTfwbwYyU7kImyZ2+7h7w2G7Lqb1+0nda51Ps54Z6fEKgyC6V34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736788320; c=relaxed/simple;
	bh=fFGMZRcBbMYAXRx+GAT4f+tlfsYIUmoTxc2SmeHoMBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPwzTEFvCiQuMuEat8YYF4GBazqSzr6zhIcovxlroPyp9LyOuO2fKawVzk/nVkeFNkATyHP66zKvX8/+B0Xs8lGex8ihASBhw9CTygPXjdXYFuaLrLIs6RwvrhuT63DsAKaiq5lB8hHmKLV3GEhu/LOZgBYG7/OdGy7bb1S8YzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TUUn6ovP; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TUUn6ovP"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467896541e1so502461cf.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 09:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736788317; x=1737393117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ImmRHf9zuyLTRiwQMWhBeDJONBL5wnCdnMuLTY0ohsE=;
        b=TUUn6ovP+JKkbl4Tx+Ey51lnDFdJI6Hp40FwX3QRNLO3/7bvsvzOwpeHT3SPq9XMS8
         uajPTS0qsAIAGEtkK+HttzVei48krT0kk8XuaZXz+li4lekgpPgXPdo9M2AGfalMHuYy
         t9V4iLVryz5fwqLSxLtK7NrMSnWGvEfaK65GCAERzAjgMY1wfFhaah1zDMjtP+AFV8XW
         Z44ZPkr7aNQtRVvNAI6qydQGi/GNc1ObihQ7RzCxBrJKsHWuTDgypF9kizd5u5WMHJ9b
         rjTWAykRaw+VLfaMaWeabDbI1IL9gT7sCUYiif/6jmrQoo39CiSTcCvTamitYJ+A+xsX
         k8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736788317; x=1737393117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImmRHf9zuyLTRiwQMWhBeDJONBL5wnCdnMuLTY0ohsE=;
        b=JUUois3bX5+u68hHBbqIxWnqyFJ6tyUofdKixiyj8tceVU8/CfSRhal9co81mL4xfj
         gyfo9wPBkg5hj5GCea04VJRi2ea80Yv5k+m76iu5RjxXwf8kGxuFaA06ToKzsZ0B3Q6N
         M7Be4FzR3DjjkoKphh50ONpsFyD4fHo+9J5biyLcgH2uBRai4dBFFpoTvWRy6RAA0sNy
         5Iekq4L4t5eP+TVlKM1b9GH4LFu/JjVbf9SeX2CormYvgpq/NS9f3T9InaBR1Q9uDPLV
         Rw8OM4mSzF6Qbr2auuoiXYlnybhW5AZdfvN2CYS7070yU2cpyrTbMknEltibFVK+DFnb
         W81Q==
X-Forwarded-Encrypted: i=1; AJvYcCVG7AMHohrEg5fwK+EO86oluOSzgBK/yrYLK6sbF15MFwl83gtkkCs/+iYyZGfyuRx/G/hH1vQgrTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUeCZu/DjSY52PM1O0jLCIfii679Hje/hRRVmmlNwUTalGUqta
	W9TKnFINcduHY4kWbU+XfxATa8GYFF5Ix0Gmvooor8pXUxqdcUguZdX9mD4Eg+ZkNbpasoJAHpj
	EhIl1Sfwugvx9sD8Tl3nhUm+A7xePTwee1xw9HEtb8ZZ6ab3H966jGOI=
X-Gm-Gg: ASbGncu2tsejHqSAmP0zE72M5YqPzxFbmd8wMYrdnq9acnKDNB/cZIdx3gAU+fE6G1y
	j1ZPleS1PyQVJ9+7gjZVnOS9SfhjQW5/vt/F1p9l60FZjeb1si7p9+uxvMyUUlZ7Zms6N
X-Google-Smtp-Source: AGHT+IGo3Srs/QzsIp455q7U2BPko5eERA3EW4uDnZfKfluZZyswKr9TsIw1CWFwcHz5vJAcqIfkvNr76jLm2pwYbtE=
X-Received: by 2002:ac8:5a13:0:b0:467:7ef7:88a3 with SMTP id
 d75a77b69052e-46c87e439d1mr11030131cf.16.1736788317341; Mon, 13 Jan 2025
 09:11:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com> <Z4U9R2m0xVTRMlkk@casper.infradead.org>
In-Reply-To: <Z4U9R2m0xVTRMlkk@casper.infradead.org>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 13 Jan 2025 18:11:46 +0100
X-Gm-Features: AbW1kvboVADLMkd1llq6zW-djwXEXL2YOxOPJFz5UT3x-Cm7pzvT7WHzKM2MKiE
Message-ID: <CA+i-1C2HfdPuXCNXEwkF20kFWnSnr-7r4-FJXf5czuAuufZkhg@mail.gmail.com>
Subject: Re: [PATCH 0/2] checkpatch: Add support for Checkpatch-ignore patch footer
To: Matthew Wilcox <willy@infradead.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jan 2025 at 17:20, Matthew Wilcox <willy@infradead.org> wrote:
> I think humans should always ignore checkpatch.  It's basically
> worthless.

Do you know of anything better? I guess it's feasible to build
something that's actually good at this job using tree-sitter or
something, maybe it exists. But outside of projects that just enforce
clang-format or whatever, checkpatch.pl is still the best (or perhaps
least bad) thing I've personally experienced.

I won't deny that most error types have only ever presented themselves
to me as noise. But the basic "don't do braces like that" and "you
have a stray space here" stuff has been useful.
