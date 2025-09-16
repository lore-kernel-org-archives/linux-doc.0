Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FCB2D73BF
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758036470; cv=none; b=D1mYF4ZKNGjWXvYcRCBUSIylzP/oeI6VUkIGfECNCf0PN11qD4KeAloOMCFdDdrv1iwVbVuifGc/HBcGbN1M27pLXNM/SspENQhbNjIRQ6YGb7Gm4dkLztIuTzJ4RSsMtM2WOdgmMiYD+bbUcZjK31chgPkA5v/Ef9LPXq5Ingc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758036470; c=relaxed/simple;
	bh=xsVGrDBuIpyS5tIu+vza30bL4Ph8oIfodBVdwJnIvlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkrbkrsKp7ZzAr7MhaV7esGZ1yUHUs3hRmGGh+PemtX1JtPN8Jiul5G43fj+BIO8J4wpoy8fXXvTuLJJpAReddC0/J5L4xQ55LuMwUlrz2/Pb0L5vlteCc0P+yHQRKwVP2lOiqhssTmlRUUEgAz8H9jIkW4vTvIwRwb3HNqmIgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gYqivpUp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gYqivpUp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ec4d6ba0cdso1004987f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758036468; x=1758641268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zBk3cgVrEpdZ+x59L+pHlmsugwnIS3miRhoSDYBnqO0=;
        b=gYqivpUpYDejz9tee0YfCxZXKPOpYnf5qdnTts7a/FDqyo0mfuksoSiogh8Ow1AoMZ
         CLMEpshVdIFCOH+Z48Br04CsPs6vYUGpoCo3iR6AA2qGz4bR4Rlm/yoe05LTPDYTAf3e
         /tDTK3QO4tAjY1hlLiKl9ksb6t6YH77pJgdZ8SKFUynnZTQqoAVoK4UfsfD/WiAkVkf0
         7VRJjKDHVodvCxqEBaaciiKPWhuNHJGUHBUCfz0ZBgXBFlGuze+3hAEVyT6Stm1vEhqJ
         eR1u8bsr90GjSrhEww3LJuLfJ516Yox3IfWQ/EylgQyrIL8Nbom/Phr+i1CcVyblep7e
         oqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758036468; x=1758641268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBk3cgVrEpdZ+x59L+pHlmsugwnIS3miRhoSDYBnqO0=;
        b=cmtRNw4Ij9oCtBfd7JaR92ad5+hKyj8LDxIJ7u67pMLs6GzHOhfdWBbcS/PIR1xShN
         fUWrW9ZznQM40WepBAhJDvg2OXQzHSj7e/EH7MV/jc3Fc5iIiLKjW/F6WP36/manMrle
         FyCntUXmKpviQNJV9eJ+cok659q/8iPjO6hmhSzZKccYnEX7ojlNaQSTgsotRTNmeG7z
         Iezu5UJtVA49T/q4tRAChY+0ioJKl2CQPCZ89v8p4vYy1fTEOnn1NwMLbicfvAeDAedL
         bL+r8EA6oEXyfdjZJVMsTl/xgRjxeuGAhb8Bn25ODExP1DYL9u8hqP3VwAJhbdjNM8z9
         YFQw==
X-Forwarded-Encrypted: i=1; AJvYcCWUYM3JFog2vzQJYSmEndeXUQOkJn8hF2cyfkzXAQ5Lbn9c3RbyebZbsj91I23Re3WSNgzSMZQjhDo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4/gZCMj08gjlnfS7o+DH2euK8WPuaXmc6nz6q+j2WrGjaV2GR
	aZxQb8clKaJUCFq4vWpSRFlCELBlSNMsf37bIw7J192QoBN0aYJXxkSB8SyyMZZbA0Q=
X-Gm-Gg: ASbGncsy6KWH1lfGXy3BOmRgh/nWOL8uhsTZdT9pJ2Mo0Vj5fakyw9pUTYYI092wbEu
	YxO3kRv6FSe0RtbVU6ObasQKbi87CV3mE/BjFbbMzzWFCW29UhmL0l3uwJrD97n/hlmNn99fuxg
	C2pBOLh0inWq2noQb44NZisGsFrTRE0L5MHg4AdovjgzMTH09wp/R63EpQU33xiDTE3rC8kR0zn
	I4OH1z7vlNKYKjwN7jb3PrWmYubPlUKW58ovUVtRfUyI8bizkphOubgDpZeK0/HKmB+8IzrqIZQ
	pPsG6R203CJ7+6rYNE3WexObuTBt7ob9vohGh8fVHSj2YybMAc12SyvdKZL1vrXCMnunHcuh7ug
	RqBj2D0UdF2Oi2jWGCzxkU5iLipMQRQ==
X-Google-Smtp-Source: AGHT+IHDwjfQuIQJuBkMmBQqFsxSOzTJndqBY6wuQhoBVd+d/7RL64/dV9lAVoQBQ7xySIf7p9k7wA==
X-Received: by 2002:a5d:5d05:0:b0:3e2:c41c:bfe3 with SMTP id ffacd0b85a97d-3e7659d3a79mr16152029f8f.38.1758036467575;
        Tue, 16 Sep 2025 08:27:47 -0700 (PDT)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f27f44624sm148981005e9.3.2025.09.16.08.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 08:27:47 -0700 (PDT)
Message-ID: <f9e90d18-ead0-404a-937e-f5e2cf11c0f7@linaro.org>
Date: Tue, 16 Sep 2025 18:27:45 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 00/16] Introduce kmemdump
To: "Luck, Tony" <tony.luck@intel.com>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: "kees@kernel.org" <kees@kernel.org>,
 "gpiccoli@igalia.com" <gpiccoli@igalia.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "pmladek@suse.com" <pmladek@suse.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "david@redhat.com" <david@redhat.com>,
 "mhocko@suse.com" <mhocko@suse.com>,
 "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "jonechou@google.com" <jonechou@google.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250916074929.xiait75tbnbyjt4c@hu-mojha-hyd.qualcomm.com>
 <SJ1PR11MB6083477193D9EF7CD10DE9EAFC14A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <SJ1PR11MB6083477193D9EF7CD10DE9EAFC14A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/16/25 18:25, Luck, Tony wrote:
>> +Adding some pstore experts to bring this to their attention if this can
>> be followed and if they find it useful.
> 
> Depends on the capabilities of the pstore backend. Some of them
> (ERST, EFI variables) have tiny capacity (just a few kilobytes) so
> well suited for saving the tail of the console log, but if the user specified
> more than a couple of pages to be dumped using this mechanism, that
> would exceed the persistent store capacity.
> 
> -Tony

The backend can fully decide what to select from all the regions.
Some regions of interest are named (listed inside an enum with an ID),
and some have an incremental ID that is being assigned.
Either way, the backend can choose to ignore what is unwanted.
E.g. patch 16/16 where the kinfo driver selects just a few of the
regions which are of interest for Pixel debugging, the rest being ignored.
