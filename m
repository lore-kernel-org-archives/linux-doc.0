Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED9046D09A
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196760; cv=pass; b=Z/DTcQMMKt+JOi6Y7vb0Ryd09mYGgTfMmWbR56WK3VXFHPgUuNJHgTLRFfapJuhNKtUeuT0Pfy3PZCuTNcCAvF0h4uFCOpTsAw+sG+FGx0y8gL1vdiy/RlonbE6LiJ1WqS1fGMAIVpt/FHr36Dzsfm2y+SzmQS7GfUHCiBk0Mqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196760; c=relaxed/simple;
	bh=EceNcS+Z+ajhb8CIpd8JlFdQ1JxKxr3f6vg2kh+0pjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RE2LdbnqlKu3TUEDLPQZeSUdyh7tBWn+phfg2YzurL5ZB5CyXm+KklGIEKJlJ0mDne6qcvMEObSztJMkUezjFokTPtmSjrm9FTkvJklo7DvrPOuUAS3/ynhww22Jcg+Ik/DHui5T7aoFnesBXVaqlZjiJBqID6JQInDlPYHEYMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8VFmRTX; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8VFmRTX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so33399305ad.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 10:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788196759; cv=none;
        d=google.com; s=arc-20260327;
        b=mkMxfKFHcsPNOv3wXAFNhdtj5PkgnFkXWuZ4O6Mcn9bTmRpXrA1XKg1zKOKohy7juV
         C0NdiH1Xb7YC8rTm8zjgRF2f4NfLFdR0Mog2WQ5kFH5gB2zfczlyARxHd5hVl/4SVdJi
         v+1DcBLb4jFl1FJBgHEnZAwRLGJaKLlkztPUcxlvCUelNHstNZs9qfzWP1/fTEboHWmG
         0Y7rnh0rAciSvbmzLwk/MpKnnzGnStgRCIHklyXScMXj0oAkMG0ZAq9sM/CsGs95z7ly
         OWI+uvPH1PUb6pEqhq6WO/+a8nUz6aCX7VDFnQshvcqucgWEOof0h0gM2j5j7v3SBdId
         74dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EceNcS+Z+ajhb8CIpd8JlFdQ1JxKxr3f6vg2kh+0pjk=;
        fh=wMesJS6YwVwEgNY8IQZkGN31B2Mc2pgUz8zoHRjutqE=;
        b=cA6L+o9/BtUHDRK9neggCDK1tjAwH4HPPeDUEfBpamgK9B7EZXoIAQkeblHCv8C6db
         QOOguZd+DV8j7WjEe/axAw15UYU+hAppwP/yUnrqRUacwrzsA0kMixxymw0hvEtHcRrc
         DF6LFULt/fj2dNEFkzdruJwx5a+oRdPkDtNcB5NDRUdSVKM5VAZ9OXteFdXgP82HWFWN
         XYavNVoX1QgR8+09lORYeAuY4fDulIMApQzFGRbXbsSxOao+A7cyYPOR/zkvaN/veijB
         vNwbDrkjxVFMBdozSNyT6BMmvCAbFTe+JwE7g1RyMbuqFKfm85I6k7sbuB3Z6ImqmOrA
         7l1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788196759; x=1788801559; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EceNcS+Z+ajhb8CIpd8JlFdQ1JxKxr3f6vg2kh+0pjk=;
        b=X8VFmRTXbvDqoxLgXGat+Z26QoM8Ni9bVBsJTECGEijku1i+wcDfXJVjbcylsITqKk
         bhv1cBUe9psa+aH3B+7cG3i7eJTRuJ+JJW/146B1vCoY1dxGNH1WVqSQGPHer7h7IRmC
         kgYMIFn419e51jMovYk+v42CSgOpphBZPsjEdp0XZQlNmTYUCd+5XhWLAhKkczA3D8vp
         gA9U2ZxmKwd4CRLax+Y+c+Dl6RmHYNAejHuYdfT9DphQalkmjnKInYnXcWwhAPui9gR6
         hAQOtYC9tAbqxyrXWINhQG9rqgP/wme2R9i1cZYbgsxHn5tbRMHUVzIXOJCfLVkZ9h2k
         H3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788196759; x=1788801559;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EceNcS+Z+ajhb8CIpd8JlFdQ1JxKxr3f6vg2kh+0pjk=;
        b=MXCOIBwVmjy7dsDsScUuCSUZ44U19lFKGAI+SnmmMjpUiSbuVhBv+YLWZguFydSVYj
         iS/jHWZ4jsIu4RuEKmrt9OOaTBypbGm3yLysguyOjLXhHbpe4EX6Sf70xQ8HMDz7qVGv
         hzQ2T0mcMX16uQLvM0cuwn4hX5VYm7GZ3CkNKN++mM505H5Bnl1+DKOnLErdNxge+WeS
         bmQ40zKrkyw42OWy9u9T5mfAIhR409x57381MjnCzUJklDMOt/qc4vnJayWm1Ped3Tgq
         4aj/dLynKhhnOhFIFU8fMGoMTFs+Ee1tSaXChxLz/xGCIiYEO3cYe1cK27UusBtn7LEk
         5UVA==
X-Forwarded-Encrypted: i=1; AKwUvBx0zukg7JXi1rAzDJJHLWaj2qnQR/siwhurCP8cZF9lVTAHU9hWKyw0Winm5QSTwt/iCH0bg33aaaA=@vger.kernel.org
X-Gm-Message-State: AFuF++lmJAXfEdzivfK1AEUGmg4L0wL8CvzFQUIgqXLWBVQfsuBjLhzp
	slJu9Jcu2ffhE3aJWpgcADHaMiFZdRyI6AHb6Oy49g3yTEXiDZ/rpJwunbleW2J++25oMh5NpCD
	nQqUi3Lalf1c88764THFkz0nYfQ4vYpc=
X-Gm-Gg: AYBFou3REC2WmPp7/RJDjk3Gxg9nVRrCBcLMttnY0QNTDoI4DHSU65450VrDNT1Pmhl
	8gjd4rCWgFsu6dFFoRQv+CrRNf8eXlF10Tk/CmT6Svanvl06mfO7vLhTGMjbSwsqsfod8S+qjFp
	eAIEft1OCSwHnPgqCdeq4SS/1AL1UA6pVm/txTQC1x5BTTUEAyxFPISoU8j9HlfTP1zlGycHuzP
	Up03Y/z7BjG6oDfCsBn9bYmkNrQ4lCeN97f0GDOEmxBCMHV2n0CHjkUCyr+cih4r//eOsNKmIDw
	nMdceWuySC+nYLSd6BcSexaCALMn0QLXjO7+Fu7TtUxom0gvJnjuo2gjReL2BH1QHTHmGLAfTip
	iW03QsECt7F7fCVk4jFiXFhPNOUoSBIbgbfZ9p2e1gAb0Qw==
X-Received: by 2002:a17:903:2385:b0:2d8:d4ce:7e40 with SMTP id
 d9443c01a7336-2d8d4ce83fcmr275351495ad.21.1788196758727; Mon, 31 Aug 2026
 10:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-asus-x670e-a-hwmon-fix-v2-1-759406c2a61a@sne.moe>
In-Reply-To: <20260901-asus-x670e-a-hwmon-fix-v2-1-759406c2a61a@sne.moe>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 31 Aug 2026 19:19:05 +0200
X-Gm-Features: AcwNN1WRhzKCE3-qq9S5IPJctdndIBtS6owhuM_r8cD37FzQpK4fkoVAkjdiw9s
Message-ID: <CAB95QATuQcbMWVGP3GdaguhC=MUEj3ZpnAWkJ1nyUjaSstWXxQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG STRIX X670E-A GAMING WIFI
To: sugar@sne.moe
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 31 Aug 2026 at 18:18, Asai Neko via B4 Relay
<devnull+sugar.sne.moe@kernel.org> wrote:
> Changes in v2:
> - Reuse the existing X670E-E board information instead of duplicating it.
> - Link to v1: https://patch.msgid.link/20260830-asus-x670e-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe

Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Thank you,
Eugene
