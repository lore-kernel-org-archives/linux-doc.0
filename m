Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E721E9B3A
	for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 16:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771000235; cv=none; b=pZctZfJBU+bS6evyMJzHbW8w9igDy6LavAlTkaj+4bNEiUKBeWd8DTlSdEXADl3tnU8113KflRj8rBAjplMBpmcE/fZXO9wbAPHREGmNwKFIulWrINcD3Ct4DZcuSxNjGw3H1xXWXyvud8oFrONe4fvSEfVdFmnLqObmPrzLj18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771000235; c=relaxed/simple;
	bh=2IZdT97SZKaiVPXs9mj3Shgbw4NBR9uBPcXDZ0MT45Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXP9NUjZLySzvKJNUD7rJQo3i9r56T/o70uZSAJet3tjeK2Jc6r24TE/y1XIKLlm8Psvv/F30TAns/KszopB/POPbioFnZDapBr1i3UtpYujpZoAZnujQ5NUzbyU8suLhC+1IuCVT9DyypLIMFzRpo9+tUPfw/SR7hvnPRAwk0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ksYzGBbk; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ksYzGBbk"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-65807298140so1727921a12.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 08:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771000230; x=1771605030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKJCw15NBFToE7px/oywClbneCWIeYYLdAR0EKBcGMY=;
        b=ksYzGBbkTkUqIvDA/UZ3360HzN1LbafrmbpLK3yj2RyWUmQ+g2KUy83hHtvibBUfbd
         qC9S4cJHEaFpRpWSf096exwaNmkd/loxBzBt+kOF/3vqNGNyAuWPZiDQ9zuJKbLZOX8/
         tHAHQcpibW+hyY31Ko/KD60OPY/Ol/O9JPfYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000230; x=1771605030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YKJCw15NBFToE7px/oywClbneCWIeYYLdAR0EKBcGMY=;
        b=Dpu0MSCewhAp3G/uT9+71R3XlfHad8fHDuNlYWTLvDJSGPhPD3/OMOmAbR2Qn/99bd
         kmad/8sLr190w878ah4LFId1OxMKjHvecisMN8AHvkC1PkK1Rsr3SSukh+ZzZCjJwLHQ
         Vkw5bdW22+YVNJJonEcei/Ow+zwhPVXF+k4fQmrYyK9VlJAaUTW0wIopbZ75oKKiPqx5
         bQa/qsDrcMNu/jUllBafLcRsOQ2zN/VWemzmFZ588RtoYyYu2pq1AwbXUbrEhFauN/s6
         nASnJ7QEuPUQS7BA5yI4LyGdyOTBu8sZ5BnorgtUnWm19KlDBiNLMLt91F/zFBZe71Yv
         EBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwpQXLNURh/7BNGgvw4Ewdf1sqA3bB57vzu4bY2VgNopAJAJIVywSyMIrP6XIAW3u5LOXh/So20jU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2m5b+kMFLX3NRbpNplcxwurwKzjQSY7G05i0AvR0W/VEYopA9
	6VOFcL38bJUx1D4WEd0iUJJ/dmSR+w0YVaMGY86+M//+d1VODIHQdS/+DbSHUAsg822xKYM/5xs
	BkVcKJYDR
X-Gm-Gg: AZuq6aLiI5A7bxNftSF5MtrKdZkrpyG+StMUBsSbR9jI6f8WO/+r1GnJmdMs9BgUFjg
	r16M3BXIFQy3d22PoPD4b3KkR1/YOOak6uRbYukGoMbwrOg5gCa2wJ3p+memEtBsTrYTUgj/p6A
	23qcnggelR95rr4WnATruDnUMjfEZ+i6lIQgp9D8+T99VntlUc/HISBRmydk8sUgpuyhZyOixpz
	ka3uFDP5CiwXLNOcpBED9AVFcag89gqCDDzssmyNn4E1accbQFn0ZPmu216/PjnuonObt5s0FqH
	4UjEDGeOVOdQl4PX2y0kx2LBszkphpGDeQNZB4N1jxJQHPABRmEH1UqLmaW7k/JU4ShxUefOYMa
	VcBGL4oI1unimTcoIE1rVc0wcmJ4yoGFtWd855GUUTYBMxvaeTfUv0FADfjwgP5jcgNWtWeyocw
	9XfXsWxC2/WrOFiRYkxsl88ZS7Rk50bMERSQ9pGFLCAPLlWnZ/GLP+Jye+YVzAxg==
X-Received: by 2002:a05:6402:5202:b0:64d:540e:c68e with SMTP id 4fb4d7f45d1cf-65bb12ac7dfmr1188165a12.26.1771000230329;
        Fri, 13 Feb 2026 08:30:30 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19be17sm785342a12.4.2026.02.13.08.30.28
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 08:30:30 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4376acce52eso801567f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 08:30:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5IgwceSr7qxHw2L6tjgTZKt6nR2Ic/quq8BWfDXV4lVD8wBqFmXBe4pqrtP30k45s9xGnm3mDfMQ=@vger.kernel.org
X-Received: by 2002:a05:6000:2481:b0:436:8061:7f91 with SMTP id
 ffacd0b85a97d-437979132f0mr4833706f8f.41.1771000227152; Fri, 13 Feb 2026
 08:30:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com> <20260212-hardlockup-watchdog-fixes-v1-4-745f1dce04c3@google.com>
In-Reply-To: <20260212-hardlockup-watchdog-fixes-v1-4-745f1dce04c3@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Feb 2026 08:30:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X4WVK_8Ks5EMfGSnSkgUrgn-MiuT4ZqARnHV5BrC=1OQ@mail.gmail.com>
X-Gm-Features: AZwV_Qgu9JKQ7NGS-LMaYVzou2xp3aeIz6Di4CgKlxK064qABDwz73C91BvXcqU
Message-ID: <CAD=FV=X4WVK_8Ks5EMfGSnSkgUrgn-MiuT4ZqARnHV5BrC=1OQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] doc: watchdog: Document buddy detector
To: mrungta@google.com
Cc: Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>, 
	Jinchao Wang <wangjinchao600@gmail.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Stephane Eranian <eranian@google.com>, Ian Rogers <irogers@google.com>, 
	Li Huafei <lihuafei1@huawei.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Max Kellermann <max.kellermann@ionos.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 12, 2026 at 1:12=E2=80=AFPM Mayank Rungta via B4 Relay
<devnull+mrungta.google.com@kernel.org> wrote:
>
> From: Mayank Rungta <mrungta@google.com>
>
> The current documentation generalizes the hardlockup detector as primaril=
y
> NMI-perf-based and lacks details on the SMP "Buddy" detector.
>
> Update the documentation to add a detailed description of the Buddy
> detector, and also restructure the "Implementation" section to explicitly
> separate "Softlockup Detector", "Hardlockup Detector (NMI/Perf)", and
> "Hardlockup Detector (Buddy)".
>
> Clarify that the softlockup hrtimer acts as the heartbeat generator for
> both hardlockup mechanisms and centralize the configuration details in a
> "Frequency and Heartbeats" section.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  Documentation/admin-guide/lockup-watchdogs.rst | 149 +++++++++++++++++--=
------
>  1 file changed, 101 insertions(+), 48 deletions(-)

Thank you for updating the docs! I consider it my bug that I didn't
think to update this doc when the buddy lockup detector first landed.
I'm glad it's updated now, at least! :-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
