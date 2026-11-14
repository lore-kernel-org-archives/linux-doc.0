Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794687951;
	b=C02UKAq5vjNzjbYXTbpnLJiwOvuO9FkrL2LcNHMGKvNqvJUIawdPFHrLLIZTIVWwDsiZ
	 QMWwz6PqExL7lxcVGmEQqQjsp+1JT6y6R6sCTOxgZHTON94Q8LCx0R+U1MdT8IsO+Xqey
	 BXjc1Vzzz69ZPXgfVqrCzMjPPd5EGtk4xkUUIMk08mEQP59d+qyWwa0OL2nF7gmCyhUor
	 K6+9Sj90ZeYDSTCdcz+ZuJEAuh84VPxNRTZtZ+TeEtw9DlB0mGLxjUx77n7RTYOFEdfJV
	 F8FrMIoIOLeMDXA9K10kI3w82CMiT8ztJtO39wRekr7LHy/tcvlr//8vh5efCWggAPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=uhFgL5mQ4FmBEnWXxDB8G4YBTGpdQKsK7XBv176IhtY=;
	b=ZJ9cVMucPuA8XAW68hN61LX3i+ucqb/XImLcDzCsbnT0mz4x4f+hi0597gWaVEyXeMMC
	 9s2ZHeXYTLVzJ3XwqnjnwGirR8E9msleyjoXpMWgu3zUCrn6lSeUaE686X8UIPexfhqS0
	 YLQa6S2PUxkrt7Bfhyfs935kJxr4jbbDl3RqO6xt1ZHWnDN8ZKt9AYrS/aGKjnhpL1aOb
	 EfBcoxe0Y38ws/DtjD4ctnyI+qO7zS1s/aj7zOtA2v/Tg0s4i4vu2kzlPEB4pZdC799wP
	 b5legK/sjAGtt3LdS42Z5ghrjv/8ihdzfLnNKST2OcUwFSVKInmWyoldYNzdPHAkP5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Umr5E+Um;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417DC606A881
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 20:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417DC606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Umr5E+Um
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-949680e6d83so58795085a.3
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 12:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794687950; x=1795292750; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uhFgL5mQ4FmBEnWXxDB8G4YBTGpdQKsK7XBv176IhtY=;
        b=Umr5E+UmqmQJUEtXniscPQJbti6YD2DHitWwub7Ht3Og9pJeig5ihXV2Z4T9u/CQar
         ELecvn5Etdz2Cp5NYxT0dDCgI+3y3/csLjrjwcVOzDvq9Ixd4fJ2N/GTi/XLkUaTDgX1
         i0ICXQzR7wbfXQB/GV7oZJuG3JWcxo605hw4EBuSlfDunXA0mUsNN1DLC3CPc8h6OrlV
         AdD7yEtHYuI6saCYQnVwVFhNbkOuTy8TawCgHFcx84SLpC0DPVu+Gc5lA2eMkrpUB4IY
         NWqX7nqtqf59Xs2h8IB2WJgW3S+bQjvcaGi34kiAmjO1HyPcFnDvoNJJQ6aA/sXkaY7i
         R+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687950; x=1795292750;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhFgL5mQ4FmBEnWXxDB8G4YBTGpdQKsK7XBv176IhtY=;
        b=btEdmhaQKqztCVBosXdAG9Mjh82cBR7Rb66ujw7MV2N+yM097ZO+zDtiol9j6BIc+R
         blKzJpcV3aiF+4DEuW4iS8UkcCTOSNoX3Aafvu/lrXjOKKuYy0APDG6QMv24w+4FWq5H
         O0n658EFAPHzk0cPResa8tOshDB2JxyQXqk4fwl2PfKwJLNw00yG9rFfRPuMYCNckn53
         eTMm6o71SRGAn0eh+hL/Iwnx79nDXd08eZz1R8WgTosg2MMxQKKUJdJLxtAEPFEj+b+J
         Qlpq4VnANjG16WY8iiYgmCvCt7mDCQFxKQ3sj/+zTQY+hyJE8ZyHcRTiIHSaQHXIAXyv
         TFVg==
X-Forwarded-Encrypted: i=1; AL+hErG4EM7zUe28ppiI6WX3/Of4Wcru02V/yD0sqK5QrMYUqsA9v3uTXOXfuZzvJF1OoHWV9LvSkeeFTkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FxcBdjOTbmnbjJJfEL1gaXiJrfRjdhdO1SWt+2vjxAG3CMgm8
	jskTjwq/E+ab4OzdZivuNzR6YdUpQmX/qBf1zdV8z9a7oe5k5CB+2kkk2edie0cvhnw=
X-Gm-Gg: AYBFou3mZGinOuLSyidtAMDQciC2ZnxVSYDs8jeZsddX1GaSavpnoDTaAQe3SquUhfO
	EUDeAvZ4+I9rp/bhjy4IhVrnFoKsR0ASQ8iDD+c9RYFsPJyub92Q3lXvZcyLf0CdVgJWFU3bf6/
	Cn8o2w085tCQnocFI3ek5v6WbO/+u8zet6QSC74fGqMmyMI45Ed3vedPTm5qDtZ1lS2ZTob/s4g
	1ElLgc0lEQpzQoSSI6nvxPxcHz93fqM2wHh/aqS/IrlsqEE5Zu+QEwHY0z9NJ0LnGFloZA5q6mk
	lzR0qM5Gj1xEVtsiu6N/4OZNDjbtkGudn4R7HDWWh9hkiZ1EtArG8ojAaFrRrmj5XGcba0Dx9EQ
	9G3JTHCrEOF8OW3eclJz6DP7YhLIW1FZ53K7jUmKt5TcKoxxwTBzX1hTNZezi2egIYe8Fru3e83
	K+uH3HQrrKs3bQTuF94Njj4ZC05Lqz5KDAC6UQX+RYpmKpXF5g4cnyLr082UD6I+f87CV+b4NWZ
	v9izkmeVSDa1GuaeR7pX79tsBLRFAtelCX1nBDMNPrIXGSrhQB/CF8MzlFMje753H/mEeD/BRyo
	ifY46yyw08IPl8PqxSl+SD8WhpSGSPM+FFPD5pklLKEINjafjMqrJIyqJvLTEY+D/Wh+n9R6hLt
	AJdgteGA=
X-Received: by 2002:a05:620a:4481:b0:93e:c12c:f11e with SMTP id af79cd13be357-9494bcd396cmr1068763285a.74.1794687950152;
        Sat, 14 Nov 2026 12:25:50 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5f3e4sm50436436d6.16.2026.11.14.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:25:49 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] mm/mempolicy: limit shared policy ranges per inode
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <70740a32-92f5-4425-8676-68863f3e44c3@kernel.org>
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
 <20261113-mempolicy_limit-v1-2-16688b2644dc@kernel.org>
 <179467808112.482102.13365594235443107281.b4-reply@b4>
 <70740a32-92f5-4425-8676-68863f3e44c3@kernel.org>
Date: Sat, 14 Nov 2026 15:25:48 -0500
Message-Id: <179468794889.482102.14066028910704780583.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-14 21:16 +0100, David Hildenbrand (Arm) wrote:
> On 11/14/26 18:41, Gregory Price (Meta) wrote:
> > 
> > Multi-task mappers were previously unlimited, but that seems like more
> > of a nasty unintended corner case - not a real feature.
> > 
> > A single process is already limited on the number of vmas/policies based
> > on `max_map_count`, so it seems natural to just use max_map_count
> > directly, but I took a brief look at some distros and most seem to
> > ship a raised `max_map_count` (>1 million) by default).
> > 
> > I tested that and even 1 million can cause a soft lockup.
> > 
> > Not sure there's an easy solution here, we might have to rework the shm
> > policy locks.
> 
> Do you know a single valid use case that's not solved by patch #1 and would
> trigger that many policies?
> 
> Ai was not able to come up with anything for me.

Just want to make sure the bases are covered.

If others are ok with this change, it doesn't look unreasonable to me.

Although I'd wonder whether just using max_map_count's limit instead of
adding a new toggle would just be cleaner and avoid adding a new uapi.

-- 
~Gregory

