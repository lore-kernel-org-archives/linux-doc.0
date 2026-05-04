Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4675C32BF5D
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 20:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777928311; cv=none; b=JSMvTUHM/Zzp9UaKb2ZdrDSc/OgtOQGzgu7kZdc3qmg+5vy9WrcllpoRzYTHUnJiPNSNkfOVBpOPGrEsVWoI9ASdEh2xYN3hrUTRUUMMKqGF02HJUpQ2GSqvLBTvQz3ekkwBmeYw0LvDdSjNnjGp4ffnsrFK71u4RkQlRkt6EE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777928311; c=relaxed/simple;
	bh=AnHqmTk7h+qZbfpUtv/6QvkRxKkNv38kGyl2d1Y1klo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQmT7CYqRhvnU9CBNS2u4eG7LE4iCeumu1/k1twoSwIpmKZXArrtWu1fJcHzxpZV+IQiIR05J+3+1mf3aTFs35PLbTuuTsayiTx+oSCrV596WdxkTVURp6NhuSXMaDzjZTRNdZhSnqebFCoPWwbAQfVro1jNb4PWgjih3AcVwbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CIfgjEuW; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CIfgjEuW"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-40427db1300so3431332fac.0
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 13:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777928308; x=1778533108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0amaTMBgDEgs3tF4RCm1e9Dle/WjpaIw0roTFTHbcEU=;
        b=CIfgjEuWFXT2dSbfPdLSygsJ1jexgKi2KKMddjnqAn9oA6KqvICrx/50cpA6l8Cgbp
         BvIQKVLfJgKfURSIkO9tlO6DZHBKsJ/iuMQ4cLFsh5bzIfLNRJdzrdA1FVNRyCZBPWYu
         lzD+ex9/GsrtRnyjrgHIufY42K/K+Gp9ue+gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777928308; x=1778533108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0amaTMBgDEgs3tF4RCm1e9Dle/WjpaIw0roTFTHbcEU=;
        b=nmTkXPgT/XzRXnRLV03+PmCI2SzT6kCIRRKNT/gEMMfAJ2qSZ3B/zFHxqZ1fRacJ8t
         ySqrMaGVp3Ix0rTafFhPHujkOqJbKLMQw91fsdveRBFpKIOiO+z5jIgQ1iuaJVz3d7JE
         U+47mT7ViR/Kkpv6vPdWKd3vzfGRrXVBj8w19JDqEsD28zmDOf4IUsKnlYWn5WhTX15F
         ZyNi5q6Kuq41txxbwaEjmDGUXtm8PV+WCZOFjcrSirZ97glW+8M4a6at35SOWp9upwBS
         GePn27Af9n2m7l+/D7l+fCp3WfYFDraVJkbZtneNjZ8FO/y7Qc8KM+cIHiwhhvPWUz1S
         WJ3g==
X-Forwarded-Encrypted: i=1; AFNElJ+nPg/1yX+M6aCerSXFONzrT6rghcQxapDJW/sUSfb0sAGUS++5r59xrFCJ1OyONdCy5WhfIeY4OKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHKnoD4xnTeOIAS/oF2Nih1GeOURfbVUi/mo3JdvOcTzJjpazr
	uL0odpS0VXC9+R5+pY5BLEoKB0ml//jasaJXOXZHKTYBOoHrLLngItaYN499iMX57Lc=
X-Gm-Gg: AeBDieszJYzWomfnKwdVCE08iwNzaOBfYcTNnZ81uq1pgTwuOIXAwzHlle4kdtmp/bE
	fGxDo3TXed5iTt7pYMsUdmZ2zwU30tJJrZeOO7UeGqLae6XXKBNOvhBAqRGKM5wIpZgXaWNL4ye
	pAl8TI4XBkBUaMMvVVhh3G2Ac4LFHlRDICkiKPG+MPgKQKtJX4/H7EyZVLYSVWBZaAMh9Wg0D1b
	/VUAiwnpgLE+mUeLLuqLu/zgPPee8jd2iho7hYYGOFGn5YWceTcIM6AvNQAjzv8Cb/ebP+hZox6
	K0x5UTlEfLT1mKiQy+AwJ9eguIf/UfCR2jYMw8/c4ANiar+ocEvXbP2AHaq2DyagQvuSRJClpiT
	MxMB+1+XYn7WVibH/IspLC7GFHd00Un4ghAS9T8B2+RL/ajnhsyHSgShQDYSQqvxlC7ai6xnbEL
	JCX0nB6Wvgg5X3y4fsEsVZeWU78K+7xvKUvI2SsfrhfA==
X-Received: by 2002:a05:6870:1776:b0:42c:ecc9:58b3 with SMTP id 586e51a60fabf-434760613c0mr6278794fac.10.1777928308251;
        Mon, 04 May 2026 13:58:28 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454cbbbd7sm10977170fac.10.2026.05.04.13.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 13:58:27 -0700 (PDT)
Message-ID: <444d823c-40d0-4c14-ac8e-4f810a5a2f04@linuxfoundation.org>
Date: Mon, 4 May 2026 14:58:27 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kselftest: Document the FORCE_TARGETS build
 variable
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260417-selftests-docs-v1-1-32e4a78214eb@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260417-selftests-docs-v1-1-32e4a78214eb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/17/26 11:36, Ricardo B. Marlière wrote:
> FORCE_TARGETS has been part of the kselftest build system for
> some time but is absent from the developer documentation. Without
> an entry here, users relying on kselftest in CI pipelines would
> have to read the selftests Makefile directly to discover the
> option.
> 
> A build that exits zero despite some targets failing can mask
> real breakage and mislead automated systems into reporting
> success. Add a dedicated section so that CI authors can easily
> find and adopt FORCE_TARGETS=1 to turn such silent partial
> failures into hard errors.
> 
> Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
> ---
>
Thanks Ricardo. I applied it to linux-kselftest next branch.

thanks,
-- Shuah
