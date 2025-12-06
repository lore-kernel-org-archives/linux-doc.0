Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91D61DDC2B
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765042055; cv=none; b=t2uAUdib/SZJGzd5oTPLHyFRb+FDO7XTp4Yy7AuGrv+MxchRDIy8uozfCDvi1IkD15AqjZYSVtxOdRayPL6nvbX+8JFYIEtHn/RLptPEbgVAVdfBamXT+UqFPuuSlhMScpSWnOofsww/h5Nz2mt1EKIDlxx9WCf6ka9PbLMjSoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765042055; c=relaxed/simple;
	bh=C3FawFXPA3WE1kUIDPb9duosc46uBccJrD7uW7G+Tjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcpw1Li20a0uG2AC8dkEg6BFKbrl2xFgQAhk8aJbUYlzkVhIi0CwF6Ics2kAJU9L0lSEko849tHbeHgbBeukSCfLI2buLsdHUF1iy3Kp3q5BQbP0dySJLCPEwmRx7CBgqqVyAo64at4knk7zTpA3BnIvGnigYqSgQ5n8bsFSYtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipOWQSzC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipOWQSzC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso33916385e9.3
        for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 09:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765042052; x=1765646852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmQGd3zDeUvkc3bjqYOxYVmLWQzdJ41JEZjzXmjtqgA=;
        b=ipOWQSzCWEhz2D/Vq+lnO/w3PsKwnopy1VdYPeDSVkZLGCY5ZgkPKOSkYO2Ed/KAZ1
         OBYJ3SK60ieCiO3WixCAm80GvWoPDFpmVgmLZI+tihOprKqZC6H0t/e7breW5kaEoXqx
         +uVPIkTb8dpkDa4KptYcd1WsB/FMaepG2j3BSHkAEHIMC/nh/JFyRK13CY0/D4t+LOdk
         zoyrT4VemIc5TWwCNcEWVkUtfBwmx5RX98eJAT1QMH1XmNE+2ATtIgEtRVnmKMHVsLea
         XUw2zwzClE1vtotMXROvL7yeytE8CE445mp9QgsGjjZnNcqP+pxxPg2SUo96yEt1rdE9
         yXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765042052; x=1765646852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmQGd3zDeUvkc3bjqYOxYVmLWQzdJ41JEZjzXmjtqgA=;
        b=fB3VMRZaKoGNr9aHG5PRxaoCYY1J6L/9c2gOY2lPwwnn1mV3hvLSxqJATQcg2lxhaE
         NLW1N/AB4xPLBy1WCsEVNRSvVDJ9xPpmMGWu/gGZnmziXwtH8Sl+qFvHC5p6uGNL8Mnm
         JuE0y/QXN1DFWA3bO9OEiEY9T5w7hD36knjk4Wo4ilwQ/jy96oErXzP8+1b+K9SCRcnt
         ovm7TGrt/sqpL71r9wTqD0+1fwm5vSwYs77RrxSb2i7jm7CC1InhKDZhoMNw22ZtQP6Z
         JUFtQB5hK/m8bq4PS3MUdk7y+K1l2GiVKxiQBGvFtE5lBDsDst87ZSjoYLiajfGXZ+Ef
         hsUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4iMZ+/ObRTHT0P4ptlgyvvF1T7yaSPXJukHysOESX99vM7tiv+lIFOh3XCyDxIWj28QP1GdsBneY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzuAUo2EX9FsWsoYAzckqIa3ikAq+nZ6SHAIaOq97wPF1T+goY
	EIC1AazVrPhU1JD2TO4WBApclsS8lELX3NqOZaNpzSSAauIMSU7GGArC
X-Gm-Gg: ASbGncvLvqeDt9p312hc7CUAfa5bYqhS5SRAQMj6+CeexkmWZOzZ/OG0kehxdDvpmkw
	wFWFMaePjnWuKJTr3JeVnxPi0Fm25DgzBJSes6LtWJRgtTsINOeSmmjErWCTQMxz1/cE4tsl8Ea
	ktYjovxIyh/qlRjWXMZBTFhANiUS5riV2WD6PknPyU3iHQQTMjeQ0m/EDoZUgl/tKasU67PQ2ix
	qbMVonOb9XrqMAIKrwK1w5ojKOw2WejDs9mpCoI1cwVk9eeNXuIL3iSkHGG9t3Sr1wxmTDMEYT1
	UW/ZqTgLwOLrI74pUN98gTugjdWTvNKzpvlP8+v+lkCY0NcvydBPZlAhPJCm+DjIsyNyxYDLUIL
	E6s/77hwRPWWJRFMfqiGp82pN5ITGh8Nv0rWb9/PLxQhEz08/WzY+0mWJsjuUxKE/RgdYiL/1vX
	mptiLD4AygzkMtUEc9apn7nZ1gxYSLOSMSur0HvUVJaCGFF5RrTu/6nQNDvpGkl8srosbC7OC+Z
	dhEs0yrse3c
X-Google-Smtp-Source: AGHT+IFRCRGZJPPDexdZldz97ECODKTffPkpF6pR6iCjdt4mOTDvN8wh64MBt4pDTPhFqma5Acsi9g==
X-Received: by 2002:a05:600c:4e4c:b0:471:21:554a with SMTP id 5b1f17b1804b1-47939dfa51amr28913365e9.13.1765042051767;
        Sat, 06 Dec 2025 09:27:31 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e750:1800:450:cba3:aec3:a1fd? ([2a02:6b6f:e750:1800:450:cba3:aec3:a1fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311ece7asm145085065e9.12.2025.12.06.09.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 09:27:30 -0800 (PST)
Message-ID: <17002374-e135-46a5-9e4c-c317ac9823ae@gmail.com>
Date: Sat, 6 Dec 2025 17:27:29 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] mm: Drop fake head checks and fix a race condition
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251205194351.1646318-1-kas@kernel.org>
 <20251205194351.1646318-8-kas@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20251205194351.1646318-8-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/12/2025 19:43, Kiryl Shutsemau wrote:
> Fake heads are no longer in use, so checks for them should be removed.
> 
> It simplifies compound_head() and page_ref_add_unless() substantially.
> 

Would be good to mention in the commit message what the race condition is as
its there in the subject. Probably can copy some text from the cover letter.

