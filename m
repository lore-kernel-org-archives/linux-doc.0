Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879363612C5
	for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 16:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771000222; cv=none; b=qZU7c5DEFOlVtXlH1AwTemVAkDd9pVTf1+7v3/EiFH+2JI1ozeqkY9goPg/1gFdYGeRDXtYjBFckx/oUWNVeLmxdDBldbZM+yLjjVgQfigxm25rFRhYglN29hp8lDjEE2YiqFBzwCRia4iDTPTHRO6lA/O4/LleQdPx0xLeHKc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771000222; c=relaxed/simple;
	bh=ER1XypOkXsKTywpffh6Eub9NJrh8j5WXLLNmChtu/NU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3E3I8AMVjjUoMlu3THgmZWP1md4nVFVy3oujWtiyYqTGRSxuz0jCPVikn1M0JIuYutz/KKlY63wHJNTZpSk8gr8dD+Zj7v0X/pyouw7nOHdkkv6VS4EJW9mIxgNSVxIkNHk0sqYVo25Lg3z/GV0nd1LSNgVVnuImrSXVXyHd34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MtyDrA9U; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MtyDrA9U"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b88593aa4dcso126192766b.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 08:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771000217; x=1771605017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr+VqNeJZ3352+M4sd0QzbD+WBZuE3yZS+hQ+POPMDc=;
        b=MtyDrA9UN9bBMCdheBjAZO++J1ru8NzKUHsbHeVSa5GOhjVpFY/pVCsLTk2bcDmkfB
         fegxM+14JB1I0h5Qrg/Q1SZTk7mTrIBd9/2hfgfLE4rT7pVb5/ScNNzazM8nEwZfUL6i
         kQu7arJzXQcWZoTgj+bLd8UGqhYxXobGO9JsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000217; x=1771605017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gr+VqNeJZ3352+M4sd0QzbD+WBZuE3yZS+hQ+POPMDc=;
        b=Cf3lY36F8o7EdPUWAPV08c0y2JFA1w4iTQeHHH30fccxwbG2hh39eB+9+dfPYrLHxv
         8k76ed/PFHC4xQRU+jQ/dOzRRWn5cIuTOKyjjcEKAFFx/LOZBmSmcN/SSFOCA+BlKsCP
         bDmRB62RkQSrelabfBdYe5Et8mMv1t4wl9N5RT8nZSzLSKftlUsT3NOasMPIiSyAFlRz
         zIPclB/KCd39QeWe7ewEjvx0i+yGkd+KG4kbNOPLtsnDczsh9BKz8JzkF9PG7i/VSKBA
         ij2LV+S0/lms8jHIr2yRYScuAIwslq+NKkOu2P1L60XV5xRnk3ahReeRBmEgbB3j9q9l
         sfBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSWBaXwa2zGjAUCcM4uKiL6pyqa2ycB9+aFMqV/mgiA8LMHII8KgF47Wt4XzXc1HNsxmQnVg97xrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfzhR0Ra5ht3Sey+ijGjS2uL1nlyo5Zvse6y6BLNoX7R+t5V7k
	T0NXetSKqL2jhnMP+DPUjAdm8ovpqccugXOBFApvhBxanhdOOE2CvB2Sg4jXZbJihDroyuMKby5
	71q30Dg==
X-Gm-Gg: AZuq6aKW9GCtDEta1JlTyuuUUqnqWztVndEGQf5HCML3yaDFXq6QLLuFraZKkLdkDke
	J+ZfchcAySck8YPFZKU1j2GeHQl1PekhL3ZjE1hjadvRoRL3ajTPgI56SxwEcPpd8B/4c/B99Fd
	XFLumh47MnF/LU9tL5WZuZ7vCIQyqSs2dWOsdTHOn+/JMqh+ccvYa2gW3RcS7Og/6l2F6SKXN82
	sWQ5/6sDQy0QyjDTfY8NsOuhV8P/knAtrl8Da0jmHMaMx3UWb5zNEcPhHE7hGyMtQvX9wD7bcP/
	dvUR2YXc2Fu2DiEnhK0rzkKp1IkHDJc5Y9+EijsvcYHglyqgikG41qnFxdAydJxaW3qJe7KrjVO
	IVpMzJZnNpgJKykcUm2YAgCtSFntye5FJabJi3sC8F07rylflQahyQZOC+HU5gBUdK5pbcP3ifD
	bma4VGnEvtDGlfy9MkJiqGhfK0v+L+FKr8rL+BQe3g/FdwTOEDE95KzEsf17b4Ig==
X-Received: by 2002:a17:907:782:b0:b8e:3957:f0d5 with SMTP id a640c23a62f3a-b8fb4266394mr127899966b.25.1771000217043;
        Fri, 13 Feb 2026 08:30:17 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f83e1a853sm230245866b.19.2026.02.13.08.30.15
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 08:30:15 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so12773205e9.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 08:30:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUB3Eki2R6xZRrB0O+1FNdiK0U7TC1U4wNX2ujbZIhguAvp6m/FCEQExsvbRddL+J0jzSnyf9c922o=@vger.kernel.org
X-Received: by 2002:a05:600c:458a:b0:483:6f37:1b33 with SMTP id
 5b1f17b1804b1-48373a58babmr35260935e9.30.1771000214215; Fri, 13 Feb 2026
 08:30:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com> <20260212-hardlockup-watchdog-fixes-v1-3-745f1dce04c3@google.com>
In-Reply-To: <20260212-hardlockup-watchdog-fixes-v1-3-745f1dce04c3@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Feb 2026 08:30:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V16Fdr3VEPgb19usGEU1gCJ_39KJJXiTorQpKFvEV9Ww@mail.gmail.com>
X-Gm-Features: AZwV_Qi04lOxTgOYce2VxbaFcCzpFuviN4h7UGDKciIWTgmP3CPd-IXK2yMI2Hc
Message-ID: <CAD=FV=V16Fdr3VEPgb19usGEU1gCJ_39KJJXiTorQpKFvEV9Ww@mail.gmail.com>
Subject: Re: [PATCH 3/4] watchdog/hardlockup: improve buddy system detection timeliness
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
> @@ -21,6 +21,7 @@ static unsigned int watchdog_next_cpu(unsigned int cpu)
>
>  int __init watchdog_hardlockup_probe(void)
>  {
> +       watchdog_hardlockup_miss_thresh =3D 3;
>         return 0;
>  }
>
> @@ -86,14 +87,6 @@ void watchdog_buddy_check_hardlockup(int hrtimer_inter=
rupts)
>  {
>         unsigned int next_cpu;
>
> -       /*
> -        * Test for hardlockups every 3 samples. The sample period is
> -        *  watchdog_thresh * 2 / 5, so 3 samples gets us back to slightl=
y over
> -        *  watchdog_thresh (over by 20%).
> -        */
> -       if (hrtimer_interrupts % 3 !=3D 0)
> -               return;

I really like that this solution achieves a tighter detection range
without any downside (no extra wakeups, etc). :-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
