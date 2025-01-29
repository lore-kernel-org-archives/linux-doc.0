Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A7C11712;
	Wed, 29 Jan 2025 01:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738114307; cv=none; b=jtnAfplAOYgJQCqm4XIr9kdRqP6+Il8YS1oh4TWuXuQadpIetanj/13BWxpEj4sYIlB41WKp5uTD8pc4nn1tIYWaxHuxpVGS6YUdULIFBIf//H4XjocioX97O/3+Nh5ekzOWHZU1anO8FMvKeYvVg0Ktjm/2By7BuF7feeSFfgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738114307; c=relaxed/simple;
	bh=d5qfO4/XFz+7YO3XXFMut0YNnPVgNExnOhGBnCKkZes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsJEpaX71cNaUqeQro1D9/UHr08lmjxccUc+oGwBoIup/hD9hbDq6mBNogt75eUjOBRfQVk8I/as+unsbi4jqLOKQPlSFixUe4LdiYStk2gfEsOQ17sjYVHcTAkctlVO8+5r132IwcUapctgLnPuH1RMDk7x3oYsc+r1YEbxTW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdaywT7M; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdaywT7M"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-724f4d99bc7so1009555a34.1;
        Tue, 28 Jan 2025 17:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738114305; x=1738719105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+B/15K47bRdYLek+fkHupiAZ5LJgE60f+AvMfxXf28c=;
        b=KdaywT7MaL+X9lAj01Sw0d1Wn/vf5iKut8eRanIDF6QhS1DYe1uQo7tGTnAVbt4Wrr
         9pz83GTz8yjsw50CBtHRGEg6EwxdHV6wmf6WcLSraBRhClbbwHAuxoBsMKNdqkHbcC5V
         Vt66gi9WvHjoTwanq9yjqAJBRPRVKvC4mXxJddbxpcVi6rwznu4yrI826PSLWqIczhoL
         uKp5Yf9O5Y3Eh4z6ncCFRm5iNuUvHz4/BlOGlMVR8WydgIok7/JpQXHZEDyHCbuKmE4r
         Vzdwk6yIdQvwUruMhdxFuiH7cHwIs69HtC0tEcxUDDMdaa7Wbr02s7jqb+pEgdDIYaau
         xKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738114305; x=1738719105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+B/15K47bRdYLek+fkHupiAZ5LJgE60f+AvMfxXf28c=;
        b=AUV4txkckccQBFLgQLZL9bJiOGNVKkyrZSKr23h2x4/u6mH/dHxU1K/EUG+d+C71de
         x7qSkV+4FqU3JiDD4SIzyE5xZCTI96oRwzaEnJEqacGIF5ZblpHvXSQ1Qv68O2L8lirN
         j5qsqXkGcuQE32iJYlRzgfZtLMpvTxtQH9vufaLRMO1xcRGXjBygiMk0Nq1jZiRkSxhS
         B+L29VJKNKNs3ERLmc3YOWcf7W91zbLIXHeF2DnsAfRUSWogiKEgaM4E9FGYVimkapsk
         Cqnbo+2feJn7pe595iHtUoJefU4JIQN5qc+6IJOCk3l9GUBJPncxAFRVYewo4Wou5hkd
         7g7A==
X-Forwarded-Encrypted: i=1; AJvYcCVVnfVP9YJlWM7XKHs+MQn8jz8b1jYXfr3YAaWF1HmA03tZlNnOu0NfgPMoTxwmFeSnvf6FkpuZnmWi4vmT@vger.kernel.org, AJvYcCXyuna7F/Glyki8U4Z5konnO+ZDOZLyEGnqD6SL1IbPwT5Ezn7pPfsa5p38Od+QDkP/G5NzoB35XVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNGdOQE6MfOiwI4/t1gyLRy1ded/PL7Sj/ZVNDWydpoKNBt4E8
	4Gvc2Diy7DdHT/raGdHeo4LmQ0j0Ucshg5l6llULYwqNjrDyFpz3
X-Gm-Gg: ASbGncuXkL6m/dcaYAcEpQ5jbCIA3SSLAE6nWO4fEYtSlH9NEhk7oYYR0cwzeDYdAq9
	4SqbJ8f7LTL7Ggz5apVzBgfX7gsonglKQd9xMUDTR5kXJ/DIafaG7OmxTEfq5RDSw9JN85O5PTJ
	I+JvY579/ORAW2r0xh2FRPmLze4gqR0wZeSv6j/fn/w2W3vfuygQKfQtMmLarqMMlI0vH1fZ8PP
	0vyzHHR7+X9bQw4tymgc/8EGGEhhAcSpGGxCbGpcpwc4xJVvz3j0orwAdkz4xJ400kmVBv+fFlw
	t4fS1yRJ+/PYosZONd3YE6Fk77yy8WYmTxK5nR8IQtZtDMa856Ha5ue3CJtaYysjzXzC6TsgAxF
	tACE=
X-Google-Smtp-Source: AGHT+IEGQpMHleOVaU4GUNJIgZ97LsXeL06/Uwbyubl8fdGSeGIuZuoDKrph+fRoixpVmo2x0rXBKA==
X-Received: by 2002:a05:6830:4101:b0:71d:f581:3c0 with SMTP id 46e09a7af769-72656792bcemr697095a34.16.1738114305198;
        Tue, 28 Jan 2025 17:31:45 -0800 (PST)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-724ecddaac7sm3434774a34.25.2025.01.28.17.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 17:31:44 -0800 (PST)
Message-ID: <3de5e08f-0643-45bb-ba13-de372dec1b11@gmail.com>
Date: Tue, 28 Jan 2025 19:31:43 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] .mailmap: Remove redundant mappings of emails
To: Matthew Wilcox <willy@infradead.org>, carlos.bilbao@kernel.org
Cc: corbet@lwn.net, akpm@linux-foundation.org, bilbao@vt.edu,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250129011555.1108720-1-carlos.bilbao@kernel.org>
 <Z5mEmwDuATHAqJsq@casper.infradead.org>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <Z5mEmwDuATHAqJsq@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/28/25 19:30, Matthew Wilcox wrote:

> On Tue, Jan 28, 2025 at 07:15:55PM -0600, carlos.bilbao@kernel.org wrote:
>> viresh.kumar@linaro.org -> viresh.kumar@linaro.org
> I think you took out the wrong line?
>
>> @@ -721,7 +720,6 @@ Viresh Kumar <vireshk@kernel.org> <viresh.kumar2@arm.com>
>>  Viresh Kumar <vireshk@kernel.org> <viresh.kumar@st.com>
>>  Viresh Kumar <vireshk@kernel.org> <viresh.linux@gmail.com>
>>  Viresh Kumar <viresh.kumar@linaro.org> <viresh.kumar@linaro.org>
>> -Viresh Kumar <viresh.kumar@linaro.org> <viresh.kumar@linaro.com>
> You surely meant to delete the line above and not this one?


Absolutely, thanks Matthew, resending now.

>
