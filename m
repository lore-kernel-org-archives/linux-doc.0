Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14532F39B8
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 22:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767909748; cv=none; b=NIhaq7Lw0A6WKk2V2UeHrC/DR4VmR0Ke+onzppNyaYvorTdFL5jGCvK7h5vZyYWL6PRnRHJJZxy2V+gMIdFWXof4GwXdGK0Jvlh86hWrwxXa2ejkFZJK2YnrDQ1V1DA85d6h2NgQUZkDs2xqfxz+lzveFQhPw0JVeFPhKytE+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767909748; c=relaxed/simple;
	bh=mF8WwCRogxSZIV5dUFQadxadbt+CrDfxkf6VVbgZ494=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A89rwin1q6QKXmXqFrV42y86RIVpbTXFX3fSpPVi9Qx01TrGPjC+ggjuLS2wawkzbnops/fOoa6Aw1qP28s6+I9IXEn4XrHSsEmkCma34Yk1aIHMgQQIfM2kyBWV0LrPRzujbWiT9O/wLeqUcBLZ73fG/TKTrMSR0aGlo9YLOS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtrsgBLj; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtrsgBLj"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ef2561e395so27877137.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 14:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767909746; x=1768514546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF8WwCRogxSZIV5dUFQadxadbt+CrDfxkf6VVbgZ494=;
        b=dtrsgBLjlEeb+TYnbBeSnK9cqQrvzVKn47Owg4N+POOn7wQnSueiaOoj14L8dMxfYz
         XVfDq+hpc9n0cELqpOnIrg92caa+ZIiOjqSRF8idEKDjqaPzJ8XWvoYFkPmaOmXX+x29
         ks4xoUknS5C1Xl/FsIvORMh6ZQQSY2TgXyGipF+V3U/6eJnuAfJiBtBmq/jU1IeYgqTE
         tDQGzKJ6rJajFRq92iKvtEndge49gA9gxdM4qalE5VCaLlPkPz49lUZNVh8mWSc9vzEr
         R7mREe6jVZdXDSwNZ5BvPXSPcW1z/s69RQnsD6abdVhIFv1FPbL7dyz/OyNQlxeCxeoo
         XKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767909746; x=1768514546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mF8WwCRogxSZIV5dUFQadxadbt+CrDfxkf6VVbgZ494=;
        b=o1kVPD3Bi1U9vWfAIybg139YUacn87L5RvJVScX6qKAvBROrqiYx+gzICOlkat6Ahk
         ndbte9vfLrXIocscUsqMJ1y83dP87NDg9WcRe8dipzM8OfnmkqRpBB9rqydYvCh+AUH+
         1tcwhhMpM8ZGI49TpZR3HSGJlrDHUX3r6kFPHJff9vmxYtZh777GOmr2H1ilCYhR9Nu2
         V7jU2+lRRPay9HrsXdGsGa50uJWGkqcFGpNAU6wz90mncSmpag8Jf7yeLlxS4s4TBWqr
         Dsf2DDhMT5VvQz18aWHQRiJ6TdkeAJlPF55LFpJFWcfP9YkjbrAe9Cp1IUkWIcnawlM+
         PbTA==
X-Forwarded-Encrypted: i=1; AJvYcCXRk0/xpkzV3owB40XqBs6a0Y3JLrA9DF7MhG8guU41iI8mQxs1ZPF5zvGkF+fLeU4lCQMA+jh2d6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJIF1xmIUWHoy4RJaOVWv4Y5vSXu72xR7RBVDhRe8KaNdyF3wn
	j0WXBdcxsrQC3U4wuHx6MDk9mp8s7/AQ7B4pzDJQRWItPpIlTH7rCM1wWN14wL+6mMsedp3ZnR+
	SFJUI88tzWxbxTJ+h2hR+GfrHMGz9ij4=
X-Gm-Gg: AY/fxX6J3qLijWyDHkylkaViPJx+ruf0zXXlAUjQUSrKzlOjewA3GIb4xKUnlblbNqs
	WxIWrTmyWFjf46p6iX9luc0jrlDNoTJA3OrybY4X4BauYXqNS5HMusgz4+RW0U6qXa0lmLP3WHF
	ilVypE919qIEFmtSNi3/NsFP1cuJzQuQkHZTUCrL+E+cacvzahkPtdx3w6CP29PDlzoc+SZEqWa
	P2BpuhL9dLqV/9alhOnSm5L2NERN5DgCJB1vT5zE97mCatwvi/mtq1rAQ+t7J0c6m0VO4nYR2ef
	RCdZoebS+JbYuyfBW/XmMopdNv/iEPdWivKAqDf7ctei5OdKMGmNKpP7Y3BVYg==
X-Google-Smtp-Source: AGHT+IEn2FHyTFb2IeCGzSec85aBK4zj6SllIQdLj5Bz3y1x+THQzlw68plRMVSiovgHTVElGUehZ1gCE5kT6JNjKVs=
X-Received: by 2002:a67:e716:0:b0:5d7:de28:5618 with SMTP id
 ada2fe7eead31-5ecb1e6f437mr3454553137.5.1767909744268; Thu, 08 Jan 2026
 14:02:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108064615.144113-1-iwadjp@gmail.com> <84aa1a20-e507-4db0-a1f1-3a0b7342f2c3@infradead.org>
In-Reply-To: <84aa1a20-e507-4db0-a1f1-3a0b7342f2c3@infradead.org>
From: iwadjp <iwadjp@gmail.com>
Date: Fri, 9 Jan 2026 07:02:13 +0900
X-Gm-Features: AZwV_Qj5zJTJk_WNlPI7C7adQFZECaJBXwW6nLJahy_h5MYHixWlLhWXSXijtvo
Message-ID: <CAJia8+z73XwdDi2D8tYmboo49c65=MHX7oV+2pfANhsL0kPZsA@mail.gmail.com>
Subject: Re: [PATCH] docs: x86: fix malformed table in boot protocol doc
To: Randy Dunlap <rdunlap@infradead.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, corbet@lwn.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the heads-up.

I missed that commit. I=E2=80=99ll update my tree and look for another docs=
 issue
to work on. Sorry for the noise.

On Thu, Jan 8, 2026 at 15:54, Randy Dunlap <rdunlap@infradead.org> wrote:
> That looks good, but this has already been fixed:
> commit 5288176a5412
>

> Be sure to use an up-to-date kernel source tree when making & posting pat=
ches.
