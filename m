Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AC02749CF
	for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778414581; cv=pass; b=uxzR8GrhxPGTI0iWfdPbmnbfgsnzSMgNrSdelOGe39LFhLATjh4a/DkGB1MTCEuEd1MR7CeqrlVaR9+DEHYcAYYmLEM3HjY55iPNYdFZ5IwvvxdpQDZgcIre7geaQy7LBB3FNStUgVTRYDF0/Zs1AyvihsxOpuvTOkIHXyDLy2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778414581; c=relaxed/simple;
	bh=bH+A1pcJNHbsEm31+G4EJAAN3LgMlSAJINOZTIByCpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6hB01BFQWpOurtcTts+PIn1qcCIaYNAA4O3qvGaz8YykNzlC0i0VSgq/eMCjb5lUQ9L+AgmBMGLKS0vCSpzHcY08goJfavajXzG6xI0vp0MGd+LNSH/8VdaxUEMgHrOY7lTQdVE4vLPCw6ng123WUIpzqXCEVsXY2ZHtbxKOGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fO0pJrO8; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fO0pJrO8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so3573051a12.0
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 05:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778414578; cv=none;
        d=google.com; s=arc-20240605;
        b=TIandWw0YCCY/cQPRd6KVvw2x5An5AVHaZNhgpdnYjMkCbnGWe0bqzYbQ6uJVrBdWO
         SDJbglgBMuqarABRRM4YNDNvGL4ZFvZ92edSc5u07DeIxoFOY1VcePiBFwfvkYXdkzOG
         gyZmI/O8rr7ed/PX09SOxfXNGsuwoLhbOC5NcsaLduovuYxzogxJEjWtQsB2u2Etk/Iu
         Ab1G9OGZQQvFt68LFuXEj36ttAyftHcobbhT7no4TxDWhawNBfnkF1Lvj9zZLFUrw8Qj
         2JOao/6phleHi+//HtT9Bf+8sg+a//pRIu3Blt9JWkZ/D3sASLVxXo/LAq2ljLHKL0T6
         oqpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vmli1MjJU1iPg6tCzc8RsiqsXAYEqteoIsuCG5nm0hc=;
        fh=9nfQhqeooNAwWpfLBOi6c7Tfiic25DLDz1PeU5MKigY=;
        b=AiM2ZGS2IpquoQiPPMJqqroV6lgMbLE77u/tbu9Ib/wKwMj4VwRmHeHzf7ig94DIR+
         sD/saND+rcUtA2G3Q0kZmD+ioADCaocETNA7IaxNl68h2LwwTka+4Z+A6Ww75lWE6nMS
         U1XF0UAHjgoXIuz7MYHSO8RuE5URIld6qMexoafx7rwK7BhDgByI5gpKagYkkJG8T8j9
         q0i7j/TS9DSjghmpe19icfLYMAr0fo4u4rwX90pfo7UE4uIyqF1PZNomvrWyJgCMqQac
         FKDhqoTyuZadTTyVlZW9bMraBFOzDmWw7OfdJx2Lqb9/rnXak/hMWtdxN1RcIWQGjI6g
         uNAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778414578; x=1779019378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vmli1MjJU1iPg6tCzc8RsiqsXAYEqteoIsuCG5nm0hc=;
        b=fO0pJrO8ujKdOeYAdQyNU3+8Vm0rnTWHF7763Kct16qI84G4j3Xzo+XVwJpN7NKMrf
         TO6g7oBiNUrXU8H7Se7tTM+BqJOXbOjlXEqZNun8vGKTwQ81pbfnbptOYIzsFbzGBnZw
         9Zv+wa8pOf7abXoV7MVJBpuZUvzyZ5FiuAzUmfoLJP4/d1vePAl/P8PzPOz8ZE558CSy
         XJpeM1BY8r/J/GELM8VoXH+PCF+iXh2sU2AfRAdaoYkrfqMNFTKQvZLsCfFk2uTbVm6H
         FBBg+mkzWMzvkt/QD8YWa/Wlnccoc5A9xc8cUXVirru3X7G/0uydm7yWkQPGz0WfmTvm
         Wyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778414578; x=1779019378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vmli1MjJU1iPg6tCzc8RsiqsXAYEqteoIsuCG5nm0hc=;
        b=kWhFs1qr5Eu9evscJ1cmZ5dO86I8pXwjTQCNHP+JAQ6yjzcnZkwOpffBctjoiShsmq
         f7n9g5K5YZVEMCRKNJQhaJXTXMHffEmSSlpN/mlCCjbpsmQ5+pO/SnLnaH/QO3XXhM8j
         EC4qVIFZTT+hsxVO7NQC+E5WFmZSmfFgiGqsnssYRjD8zKElbX5EuW83B5p9wiqm2WMf
         u94JDju061spzZHuFsqKI7D6uwhyWgv1XJz9IIPF835Ocl+Q4CFQD0UrxtLKIwGUOrom
         L4i2F7/FxL77MFEH0ozjskzJEWwKXbWoEyODpJyD3O0NhFJHd5XHABzrezkAFdxe1lZv
         dbzA==
X-Forwarded-Encrypted: i=1; AFNElJ8OOQbLZCa6bztRNe0O8vqk++tjs5z0mvmiBJkX70XTQ0tMZt6dh47W68J1qS7uvd5vn33DK+l88Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEEMBqsM1X3eQbCQw+Ke2k1+oI9KLrTUFq8ODQWZQs8mYCIWS6
	rekl0w3xaDA1BUvWsv+EFbE/QbY7gnyBVKuRaDlUHROT36tQDYpG7MpaKztPV9sJReV7Xqy3+M5
	mQCAdzAgOrCaoS3zS/1omPE2ckItFwt8=
X-Gm-Gg: Acq92OH0pAao85xeJYRF1tsOQeScYOmSB0a39GnvlA3ZkL2jj/P6X3KzT6ovinnFq0z
	I4Vlix2OuZDF2PJTA8Pk1bKrQE3ueJarFZmnuQasHc2eKwGhYM9L0KCO1HYaJiZ7EeU5ZLOzprI
	2qhpLxDc4HVmSbumUNrtSySltxmHi1/W3IsVbUywjwoDph47qZ97Zg7aCNCUNkUJ5CVL/y+ZGCq
	WTtWX8HET5i6dhmX53qvo5KxdN6zwGlE22lrY1ar8EkypUMIajCqxxFmwk36M0qpX7x5fzPcwsh
	OLlmsgYTS7xDHjCenNwx3R0PffRcjcK/4HBR5jCW/A==
X-Received: by 2002:a17:906:eec6:b0:bc3:ae9a:15 with SMTP id
 a640c23a62f3a-bc56b94225bmr1059279966b.9.1778414578150; Sun, 10 May 2026
 05:02:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com>
 <20260504163915.4a8b028e@kernel.org> <CAGCJULP83NnaX6HAqwb3umDXsxN8LH48_gPpJ_3gG8_xA96QNQ@mail.gmail.com>
 <20260504182833.344d7b33@kernel.org> <20260508033210.5149db4fc3977d33937e6942@uniroma2.it>
 <CAGCJULP_dTSjXQqyOYXckkmtd-HAPo4UT2V0WQofOZaJYLgENw@mail.gmail.com>
In-Reply-To: <CAGCJULP_dTSjXQqyOYXckkmtd-HAPo4UT2V0WQofOZaJYLgENw@mail.gmail.com>
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Sun, 10 May 2026 21:02:46 +0900
X-Gm-Features: AVHnY4IcF3vmMhSO8SdPuE7-fCfzpzAXRJRVY1ZnbUg0Ri8QL_dBkXa2fNxxouU
Message-ID: <CAGCJULMSMrcWmQUZ-RoWB8uAivZ2DZdefED7nShMpUNBzPBLFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433) behaviors
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
	stefano.salsano@uniroma2.it
Content-Type: text/plain; charset="UTF-8"

On Fri, May 8, 2026 at 10:32 AM Andrea Mayer <andrea.mayer@uniroma2.it> wrote:
> just a heads-up: I am going through the series (kernel and iproute2)
> and will send detailed comments within the next few days. It is a
> substantial addition so I want to take the time to review it properly.

Quick note from my side before you spend more time on patch 4/7:

While preparing v3 I noticed that v2's patch 4/7 ("End.M.GTP6.D")
implements RFC 9433 Section 6.4 (D.Di) by mistake -- it shares the
SRH-augmenting builder with patch 5/7 and preserves the original
outer DA in segments[0].  Per Section 6.3 it should push the SR
Policy verbatim and write Args.Mob.Session into segments[0].
Already fixed in the local v3 branch.

Feel free to skip the End.M.GTP6.D-specific comments on v2 patch
4/7; patch 5/7 (D.Di) is unaffected.  Per Jakub's guidance I will
hold the v3 repost until your review lands.

Thanks,
Yuya
