Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A6913D268
	for <linux-doc@vger.kernel.org>; Tue, 30 Apr 2024 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714478460; cv=none; b=eBz6A9zj53oI+BUMa4nAqkCqqNGP0bwQ5YsjpEhv4QJE6AoT1ILyN0gJVTShDjniK3+6TLClmVofs8LW3FHwyt9ZpQcOm7s/u8eCd0c3wv54VNcDai8pcmtIvdQfZj6jgj+/gWXNupFNgK5AKlk7Xpn72FLvUbekZlf8Um13v1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714478460; c=relaxed/simple;
	bh=4i+oZELfhNBtH5dV47fRsrwUCxoVTACihHsZt/+Av6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ed/bbY5teu+jbXWOx4gBbxnYA2d3APoRVdX2dnEtJcr99kwNdlffqTSu3segyyO1nzsBQ6GXO2R0EByOkEpAR4U4TnQZSA632QkmY0yRFIEcWDMdvfEozK/+sVUxL7diUgpwKwwpc7ZdDlKl1eXFGuVoWmCLSLHUhyJL6hIyF08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BpxXjIY9; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BpxXjIY9"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2a2d0ca3c92so3944479a91.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Apr 2024 05:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714478458; x=1715083258; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Z1myKdAdC7HyTTZzja4JHzqozZdoiE8OpsVv5HUH3I=;
        b=BpxXjIY9SXeeMvcA+8kpBAFTJg8aMorOMVAwa0JPkjpgxf1NLkBcmHjrtO8zSQ+u6l
         dxQEWNLKBKJw4ZtQ3Lh75+xLmXS4qoe56MfQP7XyTViq7AAikaXwrGIL6kJC0QD3ZOqa
         2zxSTum5ismBdU59R6UnmHeSqdbH/73k0oW4IINcFFgwvwZHI0LUEs9g43eceSLmnzjA
         h6OVG7sGlYbNxGWffSo7RLYt27vSjbcVwFzUZigckKgMT69Jj9WAWlg5FKKNrVSvqUqN
         AriE0W5TlTW9qPeDhSK0taVPjWkoRORCCO5oiXZ6b3ln/4oPIPGIU8+HeiZsaBrQsma9
         BpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714478458; x=1715083258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Z1myKdAdC7HyTTZzja4JHzqozZdoiE8OpsVv5HUH3I=;
        b=SYjOXJSyJlnTTQmblzbDnaYw3VYWJpadPz1pFunCVZwBqoewXPzrQVJW4QnA76f+Qe
         aNozfzFqhnMymJO8Lm/SOsdo9QUROKXYsPAWvte3V3gXallXmfupohcOlb2gLKaHE/8A
         Nh3EXsjTbUffN+dM7nfHFF78v+/J5YPtZj72G4X0ESoD9HnyLHTFJr7K9N0SdC74FxsP
         CKwzLBuMdCwqdsa2lExBgqjuIxRtov7jPqmeYW0VaLI0i5rN9ZbM91WR/aVSFFCcqkZP
         DhOHqc4KB30B5/aiPUBqYF4rU7bi4Vi0YwuHbreARa0nfMJuZodNhG4c+7PxhdWqKrsw
         k/9w==
X-Forwarded-Encrypted: i=1; AJvYcCUwDvKwJSb5leYoKJ6tx31o3TPij91QZCUGD49nZQ36Nyhv9g/F3FGsQAal8gtAd9D/GLJR1UUejAAKKVqJ97/TRro8iyuY8kho
X-Gm-Message-State: AOJu0Yy8fVpgrP/nvttwp+Uz+mIQCoKBGyERkTzx3oL5NSmdInmL8GRJ
	el8gQ6J5yYw151j5tRlsZxuBrQJak9eO0dv6KazQB47nmrZGpKJo74B28wbG1A0HZw82iNEzmAP
	1FpVuk+gDY6V2Pge39PxKMst2alluqmaVNqGx+w==
X-Google-Smtp-Source: AGHT+IEuoO12CTIHP9MUVVJqpOCwqG+W7dUdh4INEBszG2ueQMsjN9KNncSH+zwGVhI1PcUMescz5bfhnoSrw19sGCs=
X-Received: by 2002:a17:90a:a00a:b0:2a5:df97:b with SMTP id
 q10-20020a17090aa00a00b002a5df97000bmr3997149pjp.18.1714478458032; Tue, 30
 Apr 2024 05:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326091616.3696851-1-vincent.guittot@linaro.org>
 <20240326091616.3696851-5-vincent.guittot@linaro.org> <95760e2b-ec38-4f04-8f86-e4f935d24a83@linaro.org>
In-Reply-To: <95760e2b-ec38-4f04-8f86-e4f935d24a83@linaro.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 30 Apr 2024 14:00:46 +0200
Message-ID: <CAKfTPtDhVfpvO46YWmMnVhJmiKUbNJt7d2cvmyXfPJ4g1YZkXg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] sched: Rename arch_update_thermal_pressure into arch_update_hw_pressure
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	sudeep.holla@arm.com, rafael@kernel.org, viresh.kumar@linaro.org, 
	agross@kernel.org, andersson@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, lukasz.luba@arm.com, rui.zhang@intel.com, 
	mhiramat@kernel.org, daniel.lezcano@linaro.org, amit.kachhap@gmail.com, 
	corbet@lwn.net, gregkh@linuxfoundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Qais Yousef <qyousef@layalina.io>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

H Konrad,

On Tue, 30 Apr 2024 at 13:23, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 26.03.2024 10:16 AM, Vincent Guittot wrote:
> > Now that cpufreq provides a pressure value to the scheduler, rename
> > arch_update_thermal_pressure into HW pressure to reflect that it returns
> > a pressure applied by HW (i.e. with a high frequency change) and not
> > always related to thermal mitigation but also generated by max current
> > limitation as an example. Such high frequency signal needs filtering to be
> > smoothed and provide an value that reflects the average available capacity
> > into the scheduler time scale.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > Reviewed-by: Qais Yousef <qyousef@layalina.io>
> > Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> > Tested-by: Lukasz Luba <lukasz.luba@arm.com>
> > ---
>
> Hi, I'm not quite sure how, but this commit specifically breaks booting
> on Qualcomm platforms with EAS..

This is the fix:
https://lore.kernel.org/lkml/20240425073709.379016-1-vincent.guittot@linaro.org/

>
> https://pastebin.com/raw/1Uh7u81x

Which platform is it ?
I tested it on dragonboard rb3 and it booted and run tests  even w/o the fix

>
> Konrad
