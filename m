Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C23333BBAF
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956881; cv=none; b=Pohu/YuVWd0rtAwkrraT4Tej610gevwIu9XbAaV6Ff5KwnnAqrOjDBtGDLsuUrVCP8Z3jbZvleB8TfBU/9Y7S5YNVFYXV2vFiEaYoNA6QFJoptc6Bu0PvUZq9+l1O6jLXAVmgIHaX1LbHN67lypbD6BT5NOz5yTB7VWDIvVFClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956881; c=relaxed/simple;
	bh=q6FxBzkARiZN8ZZpPhrlKLwmPmLSeu/MAIkQqhD1PdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSWX6HoXb0aErMOaOwLWtv/59hLZDE9DIpsBJYFtkx/b5EZ9RJgXhqFAKK4dxB5g6lERmDFRGDDRdNB1JcSSFTXNSFJgbsfsIAvvAYlR9e6XutLxxuDRq2OOWXc4MBcBB5QEVgamDWtSBYgs+pxJWa/WSGTrFWnKoZAvufn53MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AS9kC2cD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AS9kC2cD"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b6f59c4f5so3965981e87.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 03:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767956875; x=1768561675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qhYHZPTuL2aBvvNzqCfbjl/KtRyIlXiEiynyoI/6EWg=;
        b=AS9kC2cDJTq7JsyMdLjazCu/9qTL1lRCaBGt99I6WNEtnun8EBARdG0TESjN7WUrJN
         iKFMSCIMgo3b6K9Pg1R5gjx/nqfHDISdTdr8H3kpdaXqBD+pUeuoqsbUPqFuGgywcSq1
         TC5ZUjjsgp5qUQwVEDI6cVr55hgm33xrwuNsdAxpvTi4b5upyzPGCrCvAldwF4IahnIm
         hjXfsGxi9rPX+mRHi/59EXhwLszs9nsczyju3TzT/KFdWHdFvGfJ2n0iFh4lT/73PCYp
         VD0LAJi4LHj3lR7b1P2Ufu0AsFE5CA8uy2khdR2lIPxzMe/khBk/R2qMr8Bv0jcB/a6X
         gYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956875; x=1768561675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhYHZPTuL2aBvvNzqCfbjl/KtRyIlXiEiynyoI/6EWg=;
        b=UIqI2ri2O4gi2KBuj78Ls/+x0SdKvs9pCtnSyhbYvUpUULnPXlP4QLkA/MIykFAH+g
         oBTR7jhhfZo+ZB286f89M+99/Xv9K9nyeSckG/vM7Gv4jBXe+RguVTRnSLNzpkHnoGZn
         mXGq73CXWft7d2+yvWWHmaO+5gJ5vT8gc5kKHHQuGeiuuFvhThqrFlpSygnTLTW/VjDZ
         Z1Aq06AaBWtNQE3BTDaPz1zDX8o0WOQjN9YtRSYayYEcCHtKS4hZ2d5v9ECyyvEWTjxo
         kQDXCBneAeW4CAvPKT5DNym4dv33Gh+FZud60hO25qsqjWdv1kBCXgdNOYvG2Ttzl0zf
         sT6g==
X-Gm-Message-State: AOJu0Yx3jRiKwGksG6/k20lDPVj/fkSfHjhipPzi/n51dFp6ovUZMsCl
	4t7WBvxZiwnL4xKEBG8x5RROg6FqiAvRtcYCLVDu5zoawAzROoiGIBep
X-Gm-Gg: AY/fxX6RAUIBeuULnbI3Pf84hSS3dktnDRw7EugsTRxJ01LLf/Oy8olmAC//I1XKqAR
	Q/xwII+wHtT4V7LpKI6GGZEHm7xKzIaBFfvHre4A8/PZCJTBm5+QxYrEq/7l5z/yaeehrEsbEqV
	sCQ7PF+fxn0JIz8oU6HvQQCHJq2kqbGOYEiH+mhddBFKCq5FYjuvpbDzT/8ckdPskzKVhd+PglX
	Oq3VT7xtYXSdnMesaULVCG5jrK3FQv0AJDF2/4N5fMo3q7RYNBAPC/T5ZZX02X0e7B5lKs9I+Jy
	XpTvi8CR4OrSQ8GFbZ9+t0YcYbluZc9fIFloLTNI1+OWAiwJtgZ2cRKqT/oSlr5e/UEWUPXup9E
	Omz/u/ObZTd4IzbL0tnZ/2WhvMYnZTQJxfwtXmH4DCTGxXRLEhwF84+Rudtg0K4Xewjmau+eSFl
	G+PJ+q1MYTp1kp/TplD4osblKXULPPg7sdVQ==
X-Google-Smtp-Source: AGHT+IFhSsI3vlgU1wfkt4tHxrL6Lisvr7aRqaZSCTlMeE7SovYhkCmM+HOExh8/tL/rAzJR0iGQFQ==
X-Received: by 2002:a05:6512:12c7:b0:59b:6d1b:1566 with SMTP id 2adb3069b0e04-59b6ef221c1mr3631299e87.19.1767956875033;
        Fri, 09 Jan 2026 03:07:55 -0800 (PST)
Received: from [192.168.1.149] (nat-0-0.nsk.sibset.net. [5.44.169.188])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-382f5f8a42asm19513911fa.26.2026.01.09.03.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:07:54 -0800 (PST)
Sender: Maxim Nikulin <m.a.nikulin@gmail.com>
Message-ID: <1d7a379c-b11e-498f-a166-a64d65bb37e6@gmail.com>
Date: Fri, 9 Jan 2026 18:07:52 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] docs: admin: devices: remove /dev/cdwriter
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
References: <aSuj66nCF4r_5ksh@archie.me>
 <3d7f473d-174a-488c-8852-533b8a81c58e@gmail.com>
 <87jyye18n2.fsf@trenco.lwn.net>
Content-Language: en-US, ru-RU
From: Max Nikulin <manikulin@gmail.com>
In-Reply-To: <87jyye18n2.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for your work on kernel docs.

Feel free to ignore the following comment.

On 23/12/2025 4:58 am, Jonathan Corbet wrote:
> 
> As a general rule, kernel documentation should describe the kernel we
> have now; if we try to fill it with all of the history of what once was,
> the end result will not be pleasing.

Actually I was considering adding a history section at the end of
Documentation/admin-guide/devices.rst. It seems, mentions of LANANA and 
FHS in opening paragraphs are not actual any more. I have not noticed 
references to the devices doc in the latest revision of FHS. The note on 
LANANA was important a decade ago when it was added.

Currently perhaps it is better to move these remarks to the end of the 
document. They will be available for search engines, effort invested 
into maintenance of that docs in the past is recognized, but these 
references will not distract readers interested in current state of affairs.

Mentions of /dev/scd<N> and /dev/cdwriter may be moved to the new 
section on history as well. The idea to to help those, who find old 
device names in old docs or code, to resolve their uncertainty.

I have no plan to submit more patches though.
