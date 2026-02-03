Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF90326ADC
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 21:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770152588; cv=pass; b=qgUZ+rKvnop4VQq3LnzcRAC+E1CJ/DT03/t4qcoFOv4Yi1iFy4znMruVCKWIMzuZ2Z5PK1CZ8UuBr4GeU1EJYhRozQNI7qYnL6Kq+xGJSABXEzzjL2x0iGN/5Gvo47XRs1zqXWZK7oQPEkrnKzChZo46gWR8obYLYL7yW4BdVWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770152588; c=relaxed/simple;
	bh=l6AnxVXv2M4Fy3ThERCWCsAqQKWhvbYhmyt7TVLLsQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhj7BIcc2/ZzwELanSbz3l+1ybNJnvdfMkJFfR6Mq0zX6MBXEFlhEkslk9IwoR0VsVhv30yz1kU4pBjKNfN9PmzgrQLyNWQyUDxtYtADcQIKK1MyemjXxKPv2L6LS5GdJV8AEsTy/MZsmzCeA7fut6NBzLTMBX/gD7r/vjAdsOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWEVGEGC; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWEVGEGC"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-662f485e58aso2690387eaf.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 13:03:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770152586; cv=none;
        d=google.com; s=arc-20240605;
        b=iUBJmtH9Luz7k8ikIDZj8maC4c1G0NLIf2FnVWi+8j3AaZKRVz25sA9SnYcQaiZ+El
         FK4xWFe8VFcCnzusZxzl6S2Xg6uNesxJxs6tVae21YWFXvLmxHmux7s8Jg3VgCeIqEuW
         boUgB81J2QBPlQq4XIpbBaseXJq2kRmOhXj2+yx0wWuKufBMMhbRgHyri4Sg0LtaWTwr
         MMtDj7pJSizxvsBPNE6BCLAiMuEt/KlkHzEpA5pZiaORSoRFJ2gBlhMH1mQ6ymM+croG
         +g8U9yvKhyGQ4TxQuxh9j02Jp6Xg4T47i3HxhjS9Y0oo9JgITfUQM/Zf5K0fl937V3FQ
         +j3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l6AnxVXv2M4Fy3ThERCWCsAqQKWhvbYhmyt7TVLLsQs=;
        fh=eXTzn6dLisHak+Ud8Vcq8Z/8072vS99wN6PCEJ/rIPw=;
        b=Tk+Rs9eJaywpcGQNDLiUpsv0Hk1Ij9Zv9Kq+LmTRu12lBpy7ibkG7+Z07DOdk+/lS+
         TBn02GLfQ5hpqbacSq9+wWknbtQbznNpMv5fpw1i6se6mf0VGov9LEVUYpMSHIWBt09q
         1uW8Ku27CwyYLM4e3Rn/xDU4VJt5GU2a7PKzIwQgZ1ligRxPH4136Z+VzbJjyAvyxBHg
         vXOYtw0sjhTB+gy3pyYBZSfsrFWY3rzfeNTYctNqHP1w+UkQCR7HgaNrZKWGUx5o5FFA
         2qTSYt36YSGa1t1xbSDTUKGGB6f35cs/1HBoYx42LcF9S9j9Pdzcf8ehE3FnucJcfuNe
         5aVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770152586; x=1770757386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6AnxVXv2M4Fy3ThERCWCsAqQKWhvbYhmyt7TVLLsQs=;
        b=bWEVGEGC92At5tF5HnQNkNbRlxJY1xnvQ35rNtWrOs5CXZJnwQBuLe4joTPlD/yhH8
         AbdGShNzkG335cVcEu8nsmOAkBc4eD7mZI7/t1i9vNoY/A6kFtcjFX331bjETW38Ziwj
         ngo6xAvb4mYrWDc591LqoOpJZ/V2W7n5Vjxn1UnL9A54W9MzQlYzNyNiZzhzugayjwsr
         NjvYB3bhIHxF9lUuGRuIIHmt2ytU6ep47Q7UlDR/1MlZ8w9tX9jwhV4m+PeaHsN46H9f
         Cxl9CSdzAOEPTH4whLMdR5LfmsS6A2TyD6i60H0WMGSzDa7UrFmUryCed1WqyVG2DXdB
         hCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770152586; x=1770757386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l6AnxVXv2M4Fy3ThERCWCsAqQKWhvbYhmyt7TVLLsQs=;
        b=iCKvepx6WOjG9Dj5PSYcQCE/Aop7GWjqSUojH3+hfhXViXNvVkU1ff6v8hpp8vf6qE
         VRcffhV8UDS0pjThhxqQSLsCoMKDKw4xkQvICzUa54yBK2ZO3gDXfWVd4F056f9ECqfl
         e2P00Nwm75VSTU1inw+scuuQu8I6dqSEwn9AGJObb1YEGK57nHzL5ZccfJbke6DqsuBv
         2Ju+UzI2q2nqitULPUIzJdz1NovT45MxD/6Jy6dk4vIkWqoWrPUuHtaLjO+lED1hcG7l
         +TSsppo2NkSIzvIB8QQeCcDQTlck8RrFtLH2GXrMLYu8mmFXjP89LUFKCqzGiu7ifv04
         i6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrhe+m1Vc7zpBUGcXccTHdR/xCEIMvWFt42WyPrbgxMHrz4+cG12DWcTQXDCD3UkyuE/kdgPUpLpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHcqYJcJUgZkMzg1xEcjAAL60XtmRw3KLNHXJ2W7bhYh5nnYnE
	v0wACcfAu7RtR5sqjfDyEMI7gVgh3Czz2+T/sv0Gs5FBbrQcUyFN4JCMfv1JIXf8hB9JOwiqwUa
	Lefx1EkWHbze4/7Rc/ov23NVlPRYGJHc=
X-Gm-Gg: AZuq6aJEjzDT5fTw1h9iksCS3aviMXdeTiSrSH22a7eV+5q7S4f3cb25qE4n55GvVEn
	DK0cNfc0mStTpZhIYC/Y6hmi3r/9JsfD6vQk15ILT5vwk5gDlfZfL1pb6NU0DDrNbdy/IRhw2KA
	kt1tHxAssx4K50DdKVw3YRD701zCutUmILID6k3bzsqP7sR2MYoPG8+a8vVdUrN0kMq4ra4bJPw
	kEw/euRsLzRt9bziHbfWlSIOp0hTud50fBGMS26qHx7102/s0zRGjqoWwxw+H7e1gInvN27rwih
	568tdHRm6b2UJmWSIuQzDASOfh5+oDWseRHevHktVghKGYVEkPLFhBus04r4
X-Received: by 2002:a05:6820:6ae4:b0:65f:6ae0:2944 with SMTP id
 006d021491bc7-66a23433272mr497098eaf.64.1770152585646; Tue, 03 Feb 2026
 13:03:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203184826.81594-1-danielmaraboo@gmail.com> <0852503c-1d94-4cea-9364-d390ef076ea6@infradead.org>
In-Reply-To: <0852503c-1d94-4cea-9364-d390ef076ea6@infradead.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Feb 2026 18:02:54 -0300
X-Gm-Features: AZwV_QhP-RyA__Qc0fCR5HWDQgZNyZ2bXzU1gZredY2tR-md4Nh58Yw8CC3OBO4
Message-ID: <CAMAsx6dtKd=kmvJZ-SYr=W+52VPOTTDCigP+3JsXZKOpDrbBkA@mail.gmail.com>
Subject: Re: [PATCH v4] docs: pt_BR: add initial Portuguese translation
To: Randy Dunlap <rdunlap@infradead.org>, willy@infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

Thanks for catching that. I'll rephrase the opening line in v5 to use
the imperative mood as suggested by submitting-patches.rst.

Best regards,

Daniel

On Tue, Feb 3, 2026 at 5:55=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Hi,
> One more nit, sorry.
>
> On 2/3/26 10:48 AM, Daniel wrote:
> > From: Daniel Pereira <danielmaraboo@gmail.com>
> >
> > This patch introduces the initial Portuguese (Brazilian) translation
> > for the Linux kernel documentation. It includes the mandatory
> > disclaimer, the translation of the HOWTO document, and establishes
> > the directory structure for the pt_BR locale.
> >
> > Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> >
> > ---
>
> Documentation/process/submitting-patches.rst says:
>
> Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
> instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
> to do frotz", as if you are giving orders to the codebase to change
> its behaviour.
>
> so something like
>
> Introduce the initial ...
>
> would be good.
>
> --
> ~Randy
>
