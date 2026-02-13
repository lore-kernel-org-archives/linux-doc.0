Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A25364058
	for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771000187; cv=none; b=oduW7cWH4EqoRJF0bBDagHYFUzGIOKGQ2gO2G3/6gdhnxaQcq+L2dL/2cd7fAbvrQ8iXN/uadrFCJNNrUcHS0Ga9JuRfKRcnsRrrcKYrEaKDWVxq0SG3mT7+zVjL9tx98SSUqLFEBv4OnMcDTrxIywF0P1/cocFNBO9zTZXr5z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771000187; c=relaxed/simple;
	bh=XIbNl/5K+nYuv69C3eQvBtoZT8xa9yM458oSAycdXC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K2qPA2TzozGaFeKBCivS0VLSPGAcdURrRnlvKOPL/L4XvKr+GhOm4G1xn2JUkLo2qd/c6STldob7B9GKJ43p+DdiqhyKmY4yTmupElhIOSpT2SsQWqBadZNdTfzMQu75FygUNXvrxl5zHdiUKKUWnKo5MnXMOriwwEdeQMP06xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GhH/JbIB; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GhH/JbIB"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so97797166b.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 08:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771000183; x=1771604983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuZtPPoWZ3f3zuzofLCNwJlMtpb6Hvq3PBpC0h2RLEk=;
        b=GhH/JbIB2OYUZ8BT58Jv8HKyGRbVAM+PPPR1Z+dv1Mldcc6J4bsr++cYmUr625acbo
         HF/+5OE/5+81u4e+DlLsDveA1SC0NhxUOstWQJEt33zgP6cMi2SFARXgqPNFL42/N29p
         AAd1+I4XJT4/RYB8zRmI9N3/9NZkU+W4VG3Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000183; x=1771604983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HuZtPPoWZ3f3zuzofLCNwJlMtpb6Hvq3PBpC0h2RLEk=;
        b=u/7dUv7jb5T9TmHjpTxjGBAtg3psflS1Ls4yNVydE+NbTHeLPYd1XKKG8fQRXTxAx9
         KhDU/dmHwmMCxjgSSJg2ejucAnpvMfsSCm0TM9GnmS8u0N5QKlThj6cXyxTSnH3PWyiG
         RNwgo2iu/Gx2rurtsV2FYpDGmsLJmVo6QyRJDr2kbFxR+uGe44XJVqLJpdm6vx94fE/f
         eL74bdwA19umH4D6/zUJnwOTa63pooqfgxqO9W2hP9qaByutO5sFWgmumdzlJjNhTZjN
         CqAv2s7odh4Eu2xwmbFHXchLTwiUCKYpUy/oiyDZms6OsT0RsHR4rJBEE9IIJyitpwq7
         JIQA==
X-Forwarded-Encrypted: i=1; AJvYcCXp/JEjixGbzW2wV5n7jPANfHz5JKpyLK8Da/NizPGejw0sHCYCEpmVMTYZGIACBA5/NrXdP8e3TzI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf0baAGJPNcJqXqFek43wjV4CPD0Ez34nhOEbZVCfQz/MG7odn
	w2w1BXM3ACxaWCSAKnTv+qWD2SqaoQX56PvOiSvy2o7GCFzs0ViGbj/a6aGnYEyIK100aaRo+6g
	Ue/y50w==
X-Gm-Gg: AZuq6aKOFqsVUovP9GF3sUwZjnBl0osxYBdcv1crQ50rGBMCIpnWeiuc2fl3lsZ53Ak
	4Zxpdd5wVfVhlCW2YwZYIssGeTlkTDW6qxGgclEu119FNSkkSqvAeFmJPlJfR61xmNRtWCRSC/l
	eNZT6Q99AJorsSDX0PJnAf53lmIXcdf+7zE+wujuezQwEu0jXVx4ZsQOR9MxtmDncP0oIoVXINa
	6Lnpl8XcBj71VOXBkpECJ62eLgzpYfyNld1HjFHmyH3cl6bH1GNPGbfm1Qr4g0P8A0fQohth+Le
	V/hUkBNQRT7DOvHRjxVX50DVvKnrU6jibDB7qBikwXMqZBO90v5lYLNm52Qw39UyME2Y8oDK7GK
	Z85J1aTo7fpEwu2gT5cFOokA33dPZCR3AdfZaSw/GlS7ljt9Z8ST+/x6Lg+lD2k6yk5nqyAfgQ1
	+5dqDEBlM5C9g5ehscxmv3J3o0HWfKS43fxOARq1v1DnEPZynTjpwOBTF3ZqWoLw==
X-Received: by 2002:a17:907:961a:b0:b6d:67b0:ca0b with SMTP id a640c23a62f3a-b8fb46764admr123046866b.61.1771000182862;
        Fri, 13 Feb 2026 08:29:42 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f9212d6basm174347266b.66.2026.02.13.08.29.40
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 08:29:40 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so12767925e9.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 08:29:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVTNK+XDtuJSuVtppEu4hu7cCO+urRvn5a0EFHlmWnPYrbv0YvwR2MAjgH9gPgXzky1NL5uisCA6c=@vger.kernel.org
X-Received: by 2002:a05:600c:4686:b0:477:b0b9:3129 with SMTP id
 5b1f17b1804b1-483739ff981mr47097705e9.3.1771000179472; Fri, 13 Feb 2026
 08:29:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com> <20260212-hardlockup-watchdog-fixes-v1-1-745f1dce04c3@google.com>
In-Reply-To: <20260212-hardlockup-watchdog-fixes-v1-1-745f1dce04c3@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Feb 2026 08:29:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X01CAb9hk-eHw-Rwv1Z=biSp=o-1XAMcZhPkdOscSoWw@mail.gmail.com>
X-Gm-Features: AZwV_QhsLaSX9I0cCf0pnZ39V-_OVjtimawxZO1hy0nHGmS_PYlbkkbFQmMnGZI
Message-ID: <CAD=FV=X01CAb9hk-eHw-Rwv1Z=biSp=o-1XAMcZhPkdOscSoWw@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog/hardlockup: Always update saved interrupts
 during check
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
> Currently, arch_touch_nmi_watchdog() causes an early return that
> skips updating hrtimer_interrupts_saved. This leads to stale
> comparisons and delayed lockup detection.
>
> Update the saved interrupt count before checking the touched flag
> to ensure detection timeliness.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  kernel/watchdog.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)

I pre-reviewed this patch series for Mayank, so unsurprisingly I have
no comments. ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
