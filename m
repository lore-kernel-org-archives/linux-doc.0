Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B305381B
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 23:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725579323; cv=none; b=A6apHKu4BPkUUbJgV34JoTzrjH1MW2BniIVEnB3cQJujeSNgPzZAXi29Aaq7KbYX9LVmb+t80qCvd6XPMWFYQOu+zBJ9yEr5z/8Bf5dn5m69rpQTuDyVwtUhju6kmdcATf7NCOEtUvFz8LOaXR5cFr4193Bnlb3UcuukXD69fco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725579323; c=relaxed/simple;
	bh=ApnFC/T14NVmUv/TA68Xqe3p3OMhR/FsWOkCNdPVr2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7IAQAHf2gUfkoJNZ2m5J19XDkCxMWhyf7oGv9NKlQFwH4756V6DJjR0usMyWmVUaqrudL0u1pZoOfYTuuyVY7PS8/XujoHKIVbWuUA2lrPDF6UC4dtuiC9KdiAK/rJSc2lHB1G5Kdm3TU0yHSBZuW/Qe8tVp+v+L5ljqC8rR1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzEQvkV7; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzEQvkV7"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71788bfe60eso1176163b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Sep 2024 16:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725579321; x=1726184121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZHqkVBOGl2Zdjxn3jx4VhZEIB1GDSKNhyPqNImMqx8=;
        b=hzEQvkV78FM64hHowtJXSGM0kqB5holP2gZu/LP2S7kr7+sxXv/zfRP1V3AEDfx7+s
         3Qec29oIVD54VPiMpcGb8zmUNcHaeGMq2Zq0V0R7LL1C0E5kMBSWLoIUZZzypa2O2dRD
         7IfMxwftYU8eTNVRHC2GVDbjTb3nflbF69/4ADXzCP+lEv7XFk9D8TkpNZkcjMs7K0H9
         9/24cVy+9iQZtRXeNm6JxOf7lesiU7Ne9YvKwAKkwTCWVqnIwzQxSfdVmcnNzu3d8j3K
         y0jZJNaed/He4Et1wZIGr+HnexcOXRGRPxOUXgK3M1WRtDjNZBaIn3zMHFovhObGtuQ4
         I7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725579321; x=1726184121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZHqkVBOGl2Zdjxn3jx4VhZEIB1GDSKNhyPqNImMqx8=;
        b=fu6qSvKNijPUVD+KxzF5VOP/ecFCAAL9vorsInCeaO2W9KXoZSOpyruuzArfm3PNZy
         OMlQQHxoxmmudoDMe5V/mbk7Mg9IOcL3X4Ij1h0cCEEzjyZD9DaONvVU/BIS84VSy8sr
         aVIiMx3gOFKsn+QJDmkVqK6J3Ixuie/Wb8KY8bCwffNwsR6tWj6uskSqWNFJAsAKa1Dz
         ylHEx26uTfqCPSwB+27fZGDE5EAoEBuEK5WcKeFiFor5ei5Tc0jb8YroFAuTuUleTVx5
         8kLvCxPjgd8SPcF3QMyhxp41gWvi+2oFe7GKJt9tD8m0Nx5i8yBPN6V0DVfJY09cNdoc
         bdbQ==
X-Gm-Message-State: AOJu0YyKCWB46QnIIeCNbjaILkVE5i3n4SUgBnS1wYN5GDOwD6uZtb+8
	X3KNqip/SdZ9Rdc7KBP7iCz2KmUApI3dSqigNNH5mtbu+OdKnHRQV+ATzw==
X-Google-Smtp-Source: AGHT+IHvKa/hUUDWi9vLOoIwKF0G16lc8kFrPa6OiUQXateoN5YrTD+ITJZqqYUHBnFU25OfnBee1Q==
X-Received: by 2002:a05:6a21:39b:b0:1cc:ef31:da6d with SMTP id adf61e73a8af0-1ccef31dc1emr23086704637.52.1725579320891;
        Thu, 05 Sep 2024 16:35:20 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea54f06sm33378755ad.207.2024.09.05.16.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 16:35:20 -0700 (PDT)
Message-ID: <bb98d966-8c3f-4351-84ae-961c7776bd8f@gmail.com>
Date: Fri, 6 Sep 2024 08:35:19 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kerneldoc-preamble.sty: Suppress extra spaces in
 CJK literal blocks
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <20240905050941.31439-1-akiyks@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20240905050941.31439-1-akiyks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu,  5 Sep 2024 14:09:41 +0900, Akira Yokosawa wrote:
> Note for Jon:
>   Current docs-next won't complete full "make htmldocs".

Oh well...
I made a typo here, I wanted to say       "make pdfdocs"

Jon, looks like it affected the change log of the back merge.

Is it too late to amend it?

        Thanks, Akira

