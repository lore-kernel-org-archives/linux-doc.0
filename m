Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB184C8E6
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759846916; cv=none; b=XYrbQzul0NjaH5Vk+chN+PSOnQoFcw4vZFe06Qc5KPLBC8y4d6GBIWr5CiY5FYmuWn3VNxU/KBi629u/Ju4tKwGbnxD/dwRC8Hq3FP+MxteovbMphLu5J0JOvOy70+MH5lZBqtAFnDOAvoeSAf5h2e768Drc+As/koSEzwIVC9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759846916; c=relaxed/simple;
	bh=beYzFPbI0/spYeWYkmLiMeGqeeCWQz297/UiBn/fsCs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bSM2fekPGou/vy4ugrUcyBuZLFLlEIBY1Q5NioRGqVAcfM1IaEeyYjLIZjvkZQlanR5gckQKD8v7jRrLX+B02nTIdmtiS3mtAicbVShhwIl7X+bDuKnMfGVwD1B9/VC3sGGhItcFGMCB2f9UnyueAHuW7m/Rwe/8y3vNAiNm/R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOhvPU2q; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOhvPU2q"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-637dc2292cfso6918553d50.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 07:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759846913; x=1760451713; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=beYzFPbI0/spYeWYkmLiMeGqeeCWQz297/UiBn/fsCs=;
        b=kOhvPU2qjrjlrujfnrgYGcMaegJgN02Clyz7rlQ7PJarxAtVtRIZ2O6NgQN3laeZLe
         W4TgovApD6faWJcCqtzaZGYR5k44TLNXJt35w0f2OEKPWleIektj5af+J987kDO839U2
         6XfLpCvlNzjp5mDxA8FTLJ3be1QaGPTlmlNRSh4ntTjwHGyubMc/zcE85ejJ4Z05PhdR
         yZB/2nz0pGTVFQMIEHDHVnNomWXxHIcvgYIS8VeHCDGhCf9XCQbz8hyrah/YSnSrwWXb
         tkJWwY4wiUhPC5IbWJXYIF0l/sguHhTAB6nFpivZSYzMytVTRpGlu3lyc27oVngB798i
         99EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759846913; x=1760451713;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=beYzFPbI0/spYeWYkmLiMeGqeeCWQz297/UiBn/fsCs=;
        b=Ac1IT1f/a8rfHxwNYl8wpfXzINC/6x61SL4Zso8oBwfzV6Mn6Ta5pWQluuN2Ejl565
         t1+QrZ6nPpiABt42rcjVwbe9kVB2yCKJuqWApP7eQZHaQinI5DzioHmcHMmjjDL4fXoD
         KXJRcQNzNUKoMg4ShpFad6K69EHIoytgzuCgX7fBZvL/vTI2GKgA6dzB5KoNLiyaQ59G
         ZgsuXY4C6r85D14pydxEDNXB+zIZzlR4cAhlqjVEcMySd3S2bTi4fmxCnIqImH5LpZfe
         m3zn7fLBYEwcmD8Y0E6IbUeBSaCBNgxwqzR81+jYAM1pYQxP0KR05pqBKbLmlwUBjIbS
         i7dA==
X-Gm-Message-State: AOJu0Yx8AKvMnIGe6CNEE4QFbRM7/55fl5Uh63t2r92tNjyyK4w/Delx
	7mCtglOBnKvI1PVIY5RUsoDrSREjONMDcxsuHgb4X56ZJ2hTnyv7rZ5/iW55HS6s1evLfRWafPt
	uFJ8RjMgvej7fic2ODafKXWXuy2lakl2Drw/cdUw=
X-Gm-Gg: ASbGnct3MYAcJk9QyNYhyZ8mKs1c3eahwaA4Gs4ktdNPkF91gRqEw3f901HO/lIakC2
	5tV+iw2mcs0ciClyWM+HKexQbMQdaQ1raUaOMt3EkhKMciU+9lksxS2cQJYGTj1Ez9VduQeF/Xc
	3JlwIIox1+BlST3pJN9cjt3xX6czngaWy/N7hL6plo7QaY2s6aaNYehlgaMmVev1PEttI+nF0dN
	wTY1qbVXJa+qORCdfRhwCreDG32Mn+b9g==
X-Google-Smtp-Source: AGHT+IE0OLAdc/Z8tfY+SPvblOi93NiPFefB7lF17RTLV6gFgy6ixmlPIeWJ/nkE2f5VApasNNOsalTF3a64Eub8GFo=
X-Received: by 2002:a05:690c:b85:b0:762:9a58:b334 with SMTP id
 00721157ae682-77f94708f72mr275620247b3.42.1759846913103; Tue, 07 Oct 2025
 07:21:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Peter Story <peter.garth.story@gmail.com>
Date: Tue, 7 Oct 2025 10:21:41 -0400
X-Gm-Features: AS18NWDwSxTREXouP4qTbnCmmnifl7QYDl6SRqExHCZGiJCOlEVvvz91EZYgDgE
Message-ID: <CAEC0iFCK6RznO-_bAuEv80U_6cMMuuPzJptgOMGDZaxGpXY5xw@mail.gmail.com>
Subject: EEVDF vs CFS Clarification
To: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The documentation for the EEVDF scheduler says:
> The Linux kernel began transitioning to EEVDF in version 6.6 (as a new option in 2024), moving away from the earlier Completely Fair Scheduler (CFS) in favor of a version of EEVDF proposed by Peter Zijlstra in 2023 [2-4].
https://docs.kernel.org/scheduler/sched-eevdf.html

"As a new option" and "began transitioning" suggest that even in
kernel version 6.6, the CFS scheduler might be used. My assumption was
that CFS had been completely removed from 6.6 onwards. For example:
https://unix.stackexchange.com/questions/127110/which-process-scheduler-is-my-linux-system-using/127113#127113

I'm looking for clarification on this point because I'm trying to test
the effect of the scheduler on my software (pydiode, a tool for
unidirectional data transfers). I'm testing using Ubuntu, and I want
to confirm that:
- When I'm running a 6.5 kernel or earlier, I am using the CFS scheduler
- When I'm running a 6.6 kernel or greater, I am using the EEVDF scheduler

Thanks!
-Peter Story
Clark University
https://datadiode.net/
