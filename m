Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6BA3A168B
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349215; cv=pass; b=duBcFJkZm0rEmqh17ePIRKh5JPOEb+OHP+ZQPohgDo/Vht9LCl8CtrFKwLuRM0xOLBIJqipuI0BeMaHSUCq0qyajekXpGoNhZ7YcqNuastOuHGzRRd8ie6OIqRPgDzy1gHTxouvPhH3DHFiXE0OBjJLKcBQOcqZiwRPfndFGLsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349215; c=relaxed/simple;
	bh=XIt9g8EG67F9cgRee/glyq8tUMfvAYEbWJBaUWy6Nb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZ9fQji6hQb+LwVnvWTrzX9kUUZVxMKyf0s26R62TP8dlLO0kLNrf7yIHxF8DXIu5803AoSp8IlgSfJlUZonEmazcgHLivbr+huny/d/WC+DZYwzewvAtGczw7d2E/HHP6FrY6MQv8onqbjUzCFe22e2Btc1ry6iKBQeBRyJOak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCQVfpHt; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCQVfpHt"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698beff7178so6011418a12.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 07:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783349212; cv=none;
        d=google.com; s=arc-20260327;
        b=lUDCid/ifJjyq9gaA0+BtdqtK4bTG5Pz0LSrI/wISGjF7AP0a7TucZ38h0WPFf3IHy
         4DozSjPkK0JNDv+Ag7nBVZqCxlzdEBHUNz9lIUkTSADGeOC1vLpM9q3USNQrCYfl19mg
         2KCV/4QcJNud++E+/b7oSeXdsE7MqODJvsVzShQYj3kTu55MaICfH1ZrM5eV3C/WwuQ+
         1yTOVl2x2VR+kl1Ipra7k3grs40Jcxu0We0YkdecQujmQFjXtXCV+S2EyK+XE+hm307G
         dFdDyBmsgeFbUpNyZuKhdeH20Y9te0LbvGtqLBU+pJk5H4RqtO7mOpLCIflgcdJUPQWA
         y8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FORy38h/raNHh5CiZOJtyCT7bYZdVLlFNLJYBpR1kIQ=;
        fh=Y14WfU9uclw15SXZkMu6HM3NzA9njtvy41VvjVcMCc0=;
        b=CBkquBrhyfdTEbq4eQfh0AU2pxg8UWPuYbBlQEj5rremeXZIAzAJcteunFRxKDFd1z
         cyx9ajLCgpy5EgComla8AsbOwbVSOd3SKcCDo8nlvWd+eiXZxb/4oepv6Vw7mzEuRSIQ
         sGfLAIPaY/uZzQ/0759Hj2rmoMpQOIOIssaygqgxLZZGOyAMu/pnPtaH+Z04zcTARTwT
         k4T9mJOyetDhNLrrOuwJs+xjAZml2DN0UIzwAtD75xriupBn4upj9E6hqDrDtk91QxEI
         Jdo8LRcmH0xSJoN//AKRMTv1tDgcA+2I/tJIwTtGDRtR0Px5wUFXjPnXizmtpHf41lZl
         ul0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349212; x=1783954012; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FORy38h/raNHh5CiZOJtyCT7bYZdVLlFNLJYBpR1kIQ=;
        b=OCQVfpHtTZgsrQ/QlAMqINsuwa1Bo48ySGgc77RDPte0azTcSNSaOIs51lfFkHt9f2
         UYIBgHzvoJILe6a695tJl11bk0T83K+QHp/fUuKqWoWVY5cCBXVbxbH/PGymR3qHYzx8
         ufFNtfPmojWakMg06hSWxrqFl/aP3sqGpDLdDrgQ+VNF2W0zc39VoCuHbbnXFslAqBC6
         O4juZEXvHMf/AlgZ+hR0s5OjNG0vNORg7e3u5nIrzTWlLLJnDj6Kz9fXiPlXc9OTY7MT
         Dc/kzbOiHFeA78tKa+aBWtkeY6Aa+wVFbH7T47JQ4jser80PvG7LCEzhtp1Jy2QjXG3Y
         hrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349212; x=1783954012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FORy38h/raNHh5CiZOJtyCT7bYZdVLlFNLJYBpR1kIQ=;
        b=erly6MGKfV0/v5Y9dwYXA3mDtCpLXu4LVuIw4fnLOC3/q8LjB1KEmyhyuKdYqMbIur
         ts/rvco0bPIdE02UI4BPhhIFnNKbWVxzwptXrdUbs2+LD9+n+DdHtCpYXFvxsj9U0FhY
         MLRPTRPOiXzIfG6UYXF0FR+Oiwhcn00V4uo5AtyAW6r58ljU6YhFl5ZbUQNFFJsVXuKC
         xiQkX6XtDxr8EHFmOeqWPfBzW/uah1teQPcz5lVOYmGUUfXS+ud46CHpx0KJA00dQlFP
         RTr5ahZYeNDJDwrbjM1br1kVF0NAqY2wimEeUGe++wKvzK9GbAMrsEI48kh489iODcKu
         j/pg==
X-Forwarded-Encrypted: i=1; AFNElJ8EvYi4TDUuU/XtST51WRHEBMnfLJUIt0e/lA6mxIOHDqrL3ReYLNzgP+Q9Zcmg+kSOEoMebqCUzHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgztiy5v1QR3aDZcM482yHqWynp6FDqUZzT4Jez3y1OSNFQGBW
	lfIhQwlZcbsRHa/mFyQAYc0bamvX79jsC+1gWLgsWz/FRTgzKwDX918wDWcw9vQqY1sL8NvNSt6
	GPe8+BFuJh6BcqQd344b0e1ZmRh+03Qo=
X-Gm-Gg: AfdE7cmW4BgxEtJzWGq1wHw0cyu673tsYp6cKvBuXtDl+Lbd4MFSDLp4YWjAX98DUId
	wt0p7BIufA42pzFVY7FMgMOF7An3EmB1LBGvH5DYNohhFFhF6tiaVO4tVw+htngWtqUEIhTiul5
	iBILTPVmlVBGI3ZU95Y2mpKrLTG11rIkn1T3GM4ejXkIp8OHDAu1yyLV0h+u64hUKxuipkcZzJy
	8mbe41n2SjOz6+OU4AsJQsi2M8ZjIl/xi+anOhPkiVq7PK/cJSi2h1qWP8ZrSUiLX8ON9H/0kOt
	TKMN24YWOOfXFSowHoLZ0QHvnHD3j4jVYJsgnXxctb4bvhaJW6rAhQcRFrc=
X-Received: by 2002:a17:907:c785:b0:c12:2acc:c9d7 with SMTP id
 a640c23a62f3a-c15a67f7e94mr49868766b.15.1783349211791; Mon, 06 Jul 2026
 07:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <20260628231634.6752f74d.michal.pecio@gmail.com> <CAFgddh+AUNH9Ji-Qd=BKEDZWJrzPMWN20-g-htQDPSdSehZStQ@mail.gmail.com>
 <e7d49127-0215-4b29-9a2a-e1dc0d889b70@rowland.harvard.edu> <CAFgddhLeQ1cJv-E4mYWR8cs7T2USkrEd5i=uxqkNCH2UWaQ5=g@mail.gmail.com>
In-Reply-To: <CAFgddhLeQ1cJv-E4mYWR8cs7T2USkrEd5i=uxqkNCH2UWaQ5=g@mail.gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Mon, 6 Jul 2026 20:16:37 +0530
X-Gm-Features: AVVi8Cc6S4gmNZiqXPN-q3CLCjzsrywYMCqte4aKKTPMu6Gbk__YM43TBXfYweM
Message-ID: <CAFgddhL__55iy5FyekW+-dWD6j913DuEV-_505gKRTT4pe6YPQ@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jun 2026 at 22:40, Nikhil Solanke <nikhilsolanke5@gmail.com> wrote:
>
> > There's nothing wrong with trusting the caller to do the right thing.
> > Besides, if a segfault does occur then it will be pretty obvious that
> > the caller needs to be fixed.
> >
> > What would you do if buf is NULL?  Return an error code?  That won't
> > help anyone locate the bug.  Put an error message in the log?  Segfaults
> > are much more visible.
>
> Understood. I guess my coding style is a little "too paranoid" and
> "check everything and report errors". I understood now why this may
> not always be the best approach in low level programming like kernel
> development.
>
> Anyways, I have done all the requested changes. Here's a short summary:
> - put strings in a single line
> - copy bytes from desc to bigbuffer instead of pointer aliasing. (so
> no krealloc too)
> - change tabs to spaces in documentation
> - reworded some comments
> - drop USB_CONFIG_WINDOWS_REQ_SIZE macro
> - revert USB_DELAY_INIT to original behavior. no delay before 1st request.
>
> Let me know if I missed any changes mentioned in previous discussions
> (or misunderstood and made unnecessary changes :') ).
>
> > I wonder if it wouldn't make sense to split announce_device() so that
> > the first line is printed as soon as usb_new_device() starts, before
> > enumeration is attempted and possibly fails.
>
> The current patch still logs device ids upon failure in
> usb_enumerate_device(). Do you want me to implement that suggestion?
>
> Thanks,
> Nikhil Solanke

Just following up on my previous email regarding the requested changes
to the patch. Any comments on this?

Thanks,
Nikhil Solanke
