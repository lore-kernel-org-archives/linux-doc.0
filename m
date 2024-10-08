Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491731DEFF4
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728400081; cv=none; b=TAyzkBdoHM8oaAO95CfpMgv8TvyR6bdlTIR0aBC29FfH4aDdwltqbpoa8//9mtfDpja8Em+oXuioMAZgRIbytCt6UOGzGOOqIHIgic95ndqcqfZYmk87VSj8S2a8vXuaq1LHlUG6FA9BuyOt3g3Ag82B4E8Sef4B5nHV+PxQqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728400081; c=relaxed/simple;
	bh=+RBeccNF54Oyb9OZCGBEuaZVGC5uRYeWsUsB0zlMSj0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TKNKMAcjDeCZ3BjdtgSXVgjB3PvTup2//eU4Ku3TdVO/8iFMtTXrfCLcW1dK9yGLZUdkAFg3FaNnnSZzK00a3egah4X3S94CPnJ0vQdPodFR+O+m7H4ZnpBJ/boidJCaCib4+13UkIGAMYc88naN15v/7AMcCOjLW90mwSVG+m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=HxI+jiB0; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="HxI+jiB0"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a1a22a7fa6so17911775ab.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1728400077; x=1729004877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9unpiJCmaM/90BIThnIApTXc7RW1tNCFD+q7FeSDSU=;
        b=HxI+jiB0Y1HYvuMbjU0YMjd/h35/PKGSaMB4qP0L1ghu7MgMQVMX9x5lyiuPfd9Gg0
         qoXMEQccnZox3vaarkjE/dI0KluD2toSMqfAUYqLqMm3GewxIK3q/jzmxF9rjsPS/aIn
         6A35cUBvPVMrntVKr8iiFjqQeNO4t3LuAwY/sr6cK2wPPU5pluKQ3JyZmslPun1Iu5uB
         kHjQBCTVpPQg/WWIztXvDRNdKIVc5A1f4Qzv1lQn99FhGR5W/ICClMZRraO6u0jnZFWZ
         rEakm6h/XGx6rAIF6ppTgY4OPp649gUp3/F5bnm4S1iaKwGAqBirhE7gPfcYauYah7br
         p/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728400077; x=1729004877;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9unpiJCmaM/90BIThnIApTXc7RW1tNCFD+q7FeSDSU=;
        b=Sn5xGlj0YKh1DHvWISyFpTLpMBPTW2NLAcMykSwpodBlW+bDmotSoSXbrdfgeupeDr
         6vKUVtqKmKR1t9KWg1pgtN8GIq/fIBaoiHLTnJyaaMge2hHwFqOk93Odi/wifNlKBN0s
         DzhMmn9s2yn990ODlRo7xw4d4JyAky3IAwHjhlTikRmVwB4cYjJiinJwoBSC55hSPtxd
         JpNlDEyGaPVpByRHADyqUDuIP/SW2oufHRjL7r0a5+4mHzAfyXtOBDpwHBK/4CDK6ZOI
         5bsH1cTll4G4B732ouNNoU5xJLn0nKngEvZ8HYrVrNn25x3DuPLJGEI5LYOByNLGcr2n
         eYtw==
X-Forwarded-Encrypted: i=1; AJvYcCWeDcAsrJPF/XXayVHMfUqh2ejfNkD5ncYhXh4ZFgFIlmF8zWhhPvlObnYOyJLi8dFKiHSvd8BTnu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKL3CM7Hvi/jykT5hwmfAEyAM5Ab9788FFULcgXKNDUh1qrUuc
	DdbfqFhXwMw3IAStQbrgtR9+rc/hcKHm8zkSRvnb3hegci6gVohkvnl/tu3gO84PdevlfiF7P+6
	E3uo=
X-Google-Smtp-Source: AGHT+IGQp8oawiSk///+k6L8FedBDQ4FI1tKggdewW0vHRrgMWOym1S89gmStWTP+W03dFRHRMl/FQ==
X-Received: by 2002:a05:6e02:1d84:b0:3a3:637f:1012 with SMTP id e9e14a558f8ab-3a38af7899bmr30255855ab.12.1728400076614;
        Tue, 08 Oct 2024 08:07:56 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4db84c47434sm1071055173.43.2024.10.08.08.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 08:07:56 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Uday Shankar <ushankar@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20241007182419.3263186-1-ushankar@purestorage.com>
References: <20241007182419.3263186-1-ushankar@purestorage.com>
Subject: Re: [PATCH v4 0/5] ublk: support device recovery without I/O
 queueing
Message-Id: <172840007574.12645.10207244713759182674.b4-ty@kernel.dk>
Date: Tue, 08 Oct 2024 09:07:55 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 07 Oct 2024 12:24:13 -0600, Uday Shankar wrote:
> ublk currently supports the following behaviors on ublk server exit:
> 
> A: outstanding I/Os get errors, subsequently issued I/Os get errors
> B: outstanding I/Os get errors, subsequently issued I/Os queue
> C: outstanding I/Os get reissued, subsequently issued I/Os queue
> 
> and the following behaviors for recovery of preexisting block devices by
> a future incarnation of the ublk server:
> 
> [...]

Applied, thanks!

[1/5] ublk: check recovery flags for validity
      commit: 0a4f884510c68ac48d853a1d89ddb5c2f0a2db39
[2/5] ublk: refactor recovery configuration flag helpers
      commit: 20f2939cbcc5a1792b71130bad626b19345a23d1
[3/5] ublk: merge stop_work and quiesce_work
      commit: dbe142123bd713eeadb129f66a1357d0719ec853
[4/5] ublk: support device recovery without I/O queueing
      commit: 4aef53b1cd32f61ee2bd67c764c2bf299358e740
[5/5] Documentation: ublk: document UBLK_F_USER_RECOVERY_FAIL_IO
      commit: a463281eb2796a63000e0d528c1b712fdad452d0

Best regards,
-- 
Jens Axboe



