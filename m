Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5601DF980
	for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 14:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770821421; cv=pass; b=IkfH12VIk9CbL/jKXVkUqvwROS2QU2PtNUPiFfZOQSHpotPgClUwiyVN+YfF53PUx8bBeRqZeqGfbJl4hOhNLDbymUgmEFrJb1c/FSViarmE5gkPpjdh6VW/4Y4N+qrSOt/d8kblW9U4qDFsRZn3qcE8oP7zKemLmHUOQd1jP/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770821421; c=relaxed/simple;
	bh=PIZO4zWbF+NUU+GCLHSS8RQAVJrGdA7z/NBa9GU35+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpiwnkMl1wBgWJHR6dal+qAKqm14ISOhx7690s7pZnL9JcDS3wG/EnXAy+lFvrRihYAqj4z7u0f+EQVqWRuZ1A2XYpqVi03dsDjAfJr8rtSPGexveW7pr/0TPY4rycf68AChyPYwAA/aJTXzb5Ere/uYKFZUf/AjWoyFvqfQEks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=GwZo8z3P; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="GwZo8z3P"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e5bfa4f33so903289e87.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 06:50:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770821417; cv=none;
        d=google.com; s=arc-20240605;
        b=Dk8wtwOuP2UyICAf4uhjzh9rzRp00gf0DGFwm8Cztf/jRquy5NQeQIiJRqYEFVTwOO
         9GnrX67GJOHc/6Ve9Pwqx1ZROo+ti0p9xEYEkqNHtUVDlwgGc8LHkiEzlaoWJ3d6bb7H
         7gfsPvJcAxF3IB1yiyqVAcjoUiGR4wNANBXAd0UaH85u55o+qws1rf7DS2TNIuTGEox+
         pqeahZrImCV8uxfwYEKSJluDvZMya6DR7LngmMjFB9yBpNHciECte887MWn9VrftRw41
         sghWv4zuEuyJk78lmPwztk8VaaZYiOp4WcEMYOND7yxEEFcqpaQNJ/s9c+q+JU3QfMyr
         e7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RAC+65n1y5536yQ1ZiRJeZwn2G0HSBvLr2Csp67WCk0=;
        fh=XEJ4YQktL5VU5wKaob6Ppr1cILD9Ij9uN7Lxz4tDgTI=;
        b=EmeFDI1zPSl95Tp+cvsALbuwY1cHmfH8VQJJYkB8iwewRAraaMyqiWEAP4PEElPMwz
         HApjPHDX2XowZn958U1NNgShqBikC1vN1vaNSz973WamqRHaJ22ekQKB+5RnUqAVkIOo
         IwX/SWjvZZtES3x7TwyR4/pJPqb55XG220HDpMH1H8rxQbZEB1sa8djHf6Upkl8kbHPN
         NScw6ojh2TlNE0QLH3mDBcx8M+0wq3i6XDAwa84Nn3VUFyS6Z/DN43sHSCKIHIntXMVc
         L2KsPJcntUm5D5NmkHFDSlNmPNjdL3sgR1NbhSE2bTiL+zYXUQ2wNyWi0XN/IdsjeTRE
         hXUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1770821417; x=1771426217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAC+65n1y5536yQ1ZiRJeZwn2G0HSBvLr2Csp67WCk0=;
        b=GwZo8z3PM8FeUV92W3i3UxB5osFH5fFcKb5cB19gJN3jB6qMHhK6QHLWc2vqaxvMfB
         +p5jdgPac6eTAsHv9sgM4WdN07YLCjb5XxYY1NtL0RIMrUPG0mWK0dfHaK30QRAlcp1/
         iQWDx8SYzbGz4MIgvihYQv4fpnO7m/w87I0jTK0Zxclw+h8pL+En1T6dcSjQwDP5HIpC
         5zz6pSgXVCiqkq06UEaIJ67+vcu+sabzF7IW12E4kBSwqvXfzQKlpd9Gkv3OBu4BNQgq
         HcH9QF5C73bEt/oENxedk+KfRaKmNaCcONXjAZ+sE75Hd+sm0YA4Pe7V1OAV0c3r1y4t
         Xf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770821417; x=1771426217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RAC+65n1y5536yQ1ZiRJeZwn2G0HSBvLr2Csp67WCk0=;
        b=lD1p5gC2uDca6upSQN/zPwshvH/wkMT0+MXKZqrGPp8kkflEsa6xU6lpuW0ElveMZl
         EIGo3eOlD85t5avi29WtWq8buOTgdp8JxY//BxvmuiuwW/wb96GV9Z+RWGda4q23tY/r
         dyLmCSYCUwMnLHA4fFwca8pVdRmdup86DflbNJes80DYbzT+gwxmoCm6VxLPlJHajNmV
         yCjG2iRFmNGYZ0SwAYlMwQerMOvPPCXGXZkqUw/xf6lg9FWAtxtoz/DVNrGa7mmy/Eb/
         hv65DAhLc2qqnlAPVJu13j0MqA+4fMsKYhb7jZIfHX5jIm7mhLTfCanhFy2MqAZD6xq6
         I0yA==
X-Forwarded-Encrypted: i=1; AJvYcCVLk6itqo24MAPoWO10BruIwitb4Ju+xLAMy50hUfen3XY0aGft0X0Ze9N/yTRFQxJ99Q6KdoGdNPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/WwsE1ooH+9/Z763R28VkFbzb2UJVKUmCqVXfQaYxLxUtOGa0
	XGfBjhhQv9or7pyMLvC0aVX0nGlkzIvspwDjwYkIZ1objYg8wNu9IqvArjmXrpXsLCAs9TZxVWf
	RuKbVXnNZ5ucGpBIirrvk6jkYAGtkoeMeuneFhYag5g==
X-Gm-Gg: AZuq6aL8S/eUgtkwqpgX4A1OsJuMduDNRDRaDo0ArD3R9JRyp9Ikq2hIIV+zFg9y6C7
	Mn60fkA+0jSf/jjENfA7r4VoWl7Z1wfjlBhRg/btoWkJ+RUESi+J/NN8BhgAyE1efPh8CHuz+/A
	uWq+7gk+eFLgBCo5VNVxpOdEwHTZMD9Ctz6xY8nuF4ErKHrG2SPeQO8pS1zOX9pmAINII0Sr7+i
	aLvDAUKulq8iA9Y26yLbc8/uT2HjFgBlEM9ll9cmnwgo6w59sPzjt3gPS82z8eTq/x/KXVjtUmu
	0rBSmHzdXShA8MVRAA==
X-Received: by 2002:a05:6512:1194:b0:59e:708:cf56 with SMTP id
 2adb3069b0e04-59e5c3ee06emr1300142e87.26.1770821417457; Wed, 11 Feb 2026
 06:50:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114110837.84126-1-yizhou.tang@shopee.com> <guqq2cm3mk5qf45rcman3twiu7vax4sgkrhj23jrjb26tt3sk3@bh2h6s7givfq>
In-Reply-To: <guqq2cm3mk5qf45rcman3twiu7vax4sgkrhj23jrjb26tt3sk3@bh2h6s7givfq>
From: Tang Yizhou <yizhou.tang@shopee.com>
Date: Wed, 11 Feb 2026 22:50:06 +0800
X-Gm-Features: AZwV_QhP2qypkkBWSmBbgy6MSHPCepLJ3_C7202fgqAdyJeO3YQmLs4TKMN5fFU
Message-ID: <CACuPKxnY0Uo6RU5Cw2_fS=hQcjUBwiA+G3U-LUaviVYyf0Pojw@mail.gmail.com>
Subject: Re: [PATCH] docs: Fix blk-iolatency peer throttling description
To: Jonathan Corbet <corbet@lwn.net>
Cc: tj@kernel.org, axboe@kernel.dk, hch@lst.de, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 9:37=E2=80=AFPM Michal Koutn=C3=BD <mkoutny@suse.co=
m> wrote:
>
> On Wed, Jan 14, 2026 at 07:08:37PM +0800, Tang Yizhou <yizhou.tang@shopee=
.com> wrote:
> > From: Tang Yizhou <yizhou.tang@shopee.com>
> >
> > The current text states that peers with a lower latency target are
> > throttled, which is the opposite of the actual behavior. In fact,
> > blk-iolatency throttles peer groups with a higher latency target in ord=
er
> > to protect the more latency-sensitive group.
> >
> > In addition, peer groups without a configured latency target are also
> > throttled, as they are treated as lower priority compared to groups wit=
h
> > explicit latency requirements.
> >
> > Update the documentation to reflect the correct throttling behavior.
> >
> > Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>
> > ---
> >  Documentation/admin-guide/cgroup-v2.rst | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
>
> Not a big deal but it could've been confusing.
>
>
> Acked-by: Michal Koutn=C3=BD <mkoutny@suse.com>

Hi Jon, just checking in, do you think this patch is ready to be merged?

Best regards,
Yi
