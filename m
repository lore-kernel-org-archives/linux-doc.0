Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7DE1FBE86
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879368; cv=none; b=NcWyPqCXVkszDqAl37BgHFzaaf2dQnhPVBzSzaXa8GIUooZRthsBejh0LFnV9b/yR/F48Qs9o9YmCJHTN1nNsm0O1cy46DhuwCBA8CxXcfXao+Y4XuHnJru5r/H2YdggfXAuf4tpULsMFAPp3yjk8W3MjUdPLNsryePjEgwloC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879368; c=relaxed/simple;
	bh=tuMFrZ0XheriuHvBb6rI4HWUALQXLkUjBZxp1PsrpfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNcEe3QfNZYq4bq5uQ9cnMvsqfFgiI7y9EKy+juyWp5PwVxJM1jKyDzM9KX6xJyIf/OwU1pqPl3q9jJLU9JkSHFXkcn3bzvYsr2gviZmqx39LfCs2PMb976NhgzKM6eMpF/eUvdXnCy/sUmQyphCbiJ7fhEjfRMqTy7f7bWHoA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qPMBfzS9; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qPMBfzS9"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4679b5c66d0so280041cf.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 10:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736879366; x=1737484166; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fP2FYxg01zbB7JAkLy3PIFCTCmrP5vskUsFkaYq9Vcw=;
        b=qPMBfzS9qPe7IrZqlg1wkIDt+gw4YdE+9i0eLexKHkWlgO+O/x9qRWzRgewPUkUFPC
         E8Cz7wrn0ejW4GgrKqSnl9BQWaQbN6W1S5Zpxuc7U6/4P3ohTwvePBtuFnEQWI6Q7cFj
         yMGn6m+6+afiYGHQbivVguxhwwc4JcenK2vbz81ZWeHZzy0SD32NBpNtJYyUTkdrQNOz
         a0oQM3XZd+HbCER0U3hB5Rm5SIM6GSs+8TY/bJBRhqkTJ4YiV+85GMDuWnJpZovCIxSn
         vLXH8j1v1Fyg6y8f+rJIFGXRru3z7DHNOdPOI8xgtA2GkulH1FU63KkrBX5e+jjm8PMf
         35Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736879366; x=1737484166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fP2FYxg01zbB7JAkLy3PIFCTCmrP5vskUsFkaYq9Vcw=;
        b=OFQFFJq28r2ZKDUYAfxb2fjvpYIbdcwL9/93UF8LRcjS1g1Rl3rXRcwgmiA//0d+ks
         50TDqIVLQbjADGm7TfaL5aJZzKQ07/q5wjZo6s4nE3MnN5hSvbd1r6yzaLxvCWmKdbPe
         A9+Vh9nMaybLypGOA2cDuzUKT1vYKfTvHQuBU+mhFLco2V3A+feui5YD5q/in1L37n5R
         DC+u48ov/1Fe35auCjxIOFDAwnZilhW/gBtzaru34BLyJHMveMUTqYi/8nw3xoo9hjFL
         IfowYliaFofv7xj8sqrl0jS8xPLFhVtJ984ErH2ITbKANSdokXMP8/ysoh1eNyy7ucX0
         jjyg==
X-Forwarded-Encrypted: i=1; AJvYcCXkn89gmxcOvcfGalkWsVDltlfM4lsuAZlRJzdZzQGGJdysO1QiKw+gA3lm6/wUqV9VoeSpw3M5vL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaQLPJlFs10MwASL+soJKWR0em5J8AN/cmS4KosjGus4Q+XBxj
	WDTIpFWB4QH/LC8QfQ6r3obsry+8v1/w6Me7lZ2ouVrMDfyoWoaeNtMNYki69tv3AvedFhAZPpu
	bfgmu+CNmGLHYFFh/e7G+ItHyTojvO/wKXNyC
X-Gm-Gg: ASbGncvvo1zpf/26asWvMjyqjRHM4BxoSHByA1fZSbBKRg5StXwYRGTQqMYqKRnPYyk
	ZaZYsc1i30/xP86P0n3fI5lPW5hlZsn80jKIwI9cBSAw2NIs0ss1CZ4O6gLqTgURJhOo=
X-Google-Smtp-Source: AGHT+IF6NbO+AjTf/FCy0lNcrVASXR+PtHw3Tx7ZbiEj0GAJM4vMrvUn6FzPIOJBqhMJvAfBjAbYHe/EJMBcfXkqzzs=
X-Received: by 2002:a05:622a:1450:b0:46c:791f:bf46 with SMTP id
 d75a77b69052e-46dea92686bmr3258841cf.19.1736879365440; Tue, 14 Jan 2025
 10:29:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
 <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com> <5abiddu5zgxdmotauxnohnk25zyzd3cbjlfgskejk5ta7arzk2@pjpofoy7pcce>
 <CA+i-1C1WF1cSvcNABGRbg34_aaOnSoVoDNBR357q8rrGk52OPQ@mail.gmail.com> <20250114-tapir-of-splendid-leadership-ad115e@lemur>
In-Reply-To: <20250114-tapir-of-splendid-leadership-ad115e@lemur>
From: Brendan Jackman <jackmanb@google.com>
Date: Tue, 14 Jan 2025 19:29:14 +0100
X-Gm-Features: AbW1kva5sW-rXTnemQTnnc5Xt-0oQc5VCVpNEfJYacYH51C_uSiSrZfr7NbQZS0
Message-ID: <CA+i-1C2OrLDvp_xiomc_B96vZu8G8KRrg7KBHATz2y7KMO8UsA@mail.gmail.com>
Subject: Re: [PATCH 1/2] checkpatch: Add support for Checkpatch-ignore patch footer
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 17:04, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Tue, Jan 14, 2025 at 03:25:41PM +0100, Brendan Jackman wrote:
> > <konstantin@linuxfoundation.org> wrote:
> > > Do we really want this to become part of the permanent commit message? I'm
> > > pretty sure this won't go over well with many.
> >
> > Why not?
>
> Tweaks aimed at checkpatch are only useful during the code review stage, so
> once that code is accepted upstream, they become wholly irrelevant. A
> checkpatch trailer in the permanent commit record serves no purpose, not even
> a historical one.

Yeah that's a good argument for them being unnecessary. It's not clear
why them persisting beyond their useful lifetime would be a problem
though. Any given reader of a commit message is already very likely to
see tags they don't care about in that moment, is that something
people really complain about?

> At best, utility trailers like that need to go into the basement of the patch,
> not into the commit message.

If people do really object to them being in the commit message, I like
this as a backup. It looks like the UX for git would be like:

  git notes --ref checkpatch-ignore append -m "EMAIL_SUBJECT"

Then if you set --notes=checkpatch-ignore in your format-patch command
it comes out like this after the "---":

  Notes (checkpatch-ignore):
      EMAIL_SUBJECT

Downsides?

1. More Perl. But, OK, we have an existence proof that writing Perl is possible.

2. Doesn't seem this can be imported by 'git am'. But, I don't think
that's necessary.

3. That 'git notes' command is a bit unwieldy. But, whatever.

4. With the default Git config, if you rebase your commits you lose the setting.

Point 4 does matter IMO, but it can at least be worked around with:

  git config set notes.rewriteRef "refs/notes/**"
