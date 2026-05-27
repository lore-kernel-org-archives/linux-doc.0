Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF9D3EF664
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896145; cv=pass; b=UI4kHlZx0FiBHmDyatcTGAi19EYIKJ9G5w5Ddr/GQVuMmQd+NFNxZQeXlEYDJ5QLnYfPQexIWrwjJ8LcqNVLaArGFU3+HK3DkyuGlE/vGdgt3sa8tqhfS0u24hG7wstDVI9YkfRI9p+Bb1NJaGHbC3cryiAvyg9saFmvEOh94Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896145; c=relaxed/simple;
	bh=/34ZEKo4WKYSNfKeZJyC5zY+tHi9Bq+q7x5tIuisplU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpNBGxl7hNXYc6+ZfMEh2NCVA2LBp5JDtpqIw0mHMcWSg7e2YQHP0FlJSzDNveRCdfqHBqPLqpv3S+WpTStOqZH90yzLox4EzA3hKUF7B4pdyVGy12TLTL0JVexuhRSeJXePKmTDJS6v//p59bOpzPK5Rrd59WSLkkiPZ6Yy85k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wt/O37Jb; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wt/O37Jb"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-133466cf955so31400479c88.0
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 08:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779896143; cv=none;
        d=google.com; s=arc-20240605;
        b=lx5p8XLKu5SfPESJ/Jn0uoZPbGuot2cQuSdvxbBkmk5wDMdFcpSlriS9pGXoYZSWLO
         f7lSa9+j9D6hxEBiZiU4wRzpu1NarkdnEa7dY3jmXhtW0x3iVx1LFUu7G7ZsD1Tgq5ZJ
         BWpVtlJD9QLTCC3Gewa5XmmIv82NlRXp/7LGYlvQAYOp9AwzmF4Xc1N+xOIc1tJ7q4Ro
         ea6V3FgiLCpnR2z8oLafC90s11uns9duaKn0DwuYnw/hYl+rESzMacBy+0Z98bqUm3pQ
         MDUe8JobZv48x9mboFl3QvxuOg4X0MbjfGbv8bBDG7f0nRmTqTNmnfPT2/MDq/7q8Qgw
         nfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=/34ZEKo4WKYSNfKeZJyC5zY+tHi9Bq+q7x5tIuisplU=;
        fh=dNFv1XmdxjaJ+E9Pxltgt0RMjO6O1ge/9ECRoebhZuY=;
        b=SFUIb2AyChdkffxmnP5fCzFNvzpM3PMq9iYzhargvGnaJdSvNKgqmVj8fBwYojsdSZ
         29etcMHRNg2jZnZCnVhhQ1lcra9w7/ZaFGkaYYbVeR/1ahHwBUFDDv84N8n5P/ab31Gf
         X6kcqxH1ReZKkG2Yz+FcO2GO9kgplnyLCSgBuUcJJzjM59NfnaxL4NAEM1+jm6JDkkry
         3v1Sq3G1ihy6LPySwsFqz1+Uj60aZgCOAsdjwtDMYLD86ZhvNPl1mbMc680lNDOqwpVs
         iBGvLOyGwRrIm8POi0UhNNxtOAqwERyqVi7Q0NEpikQxnhqvsUcW+CXgeWxHWQISjG8h
         iw7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779896143; x=1780500943; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/34ZEKo4WKYSNfKeZJyC5zY+tHi9Bq+q7x5tIuisplU=;
        b=Wt/O37JbYDl4yd5Km/nAsMShHhMavvHfWq9StSAp3LFUK8CYUV2vcyGMtpJljM5qs0
         Qd7khQMbrj/j6jFUmQe978B2aqvrzoPTY3QZQ4/RgRYQ89Q4E80vFtVpbQO9NZ2Bg5pR
         +4qsbxc9rCrq6KCOTJfXAGVMVURwAC4qgrnyq+4DzHcDefdVDhuHBaGnyYNZxG2jrcbL
         ZjkXcv/Bgs8i7XG5WQ2YpJtAcoxPiI7qmbTWT6ErUA+Xw8LgVNvkUDAezHm9hxnTz5Na
         i8xQ9G5L9/03p0AXx4shZ5vSZN21ldaoptMhVgXgq1St7tlc3mg57Io5GxElZVbJ8Ftj
         BUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896143; x=1780500943;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/34ZEKo4WKYSNfKeZJyC5zY+tHi9Bq+q7x5tIuisplU=;
        b=OFoy875nbnWDhIo7mxnHT1utQtbC1Ri3OE0Nt3dP7JoSFcCT0sqbrS0b1aIMteud6B
         QnhukMJ0AbnMlkLHy9wVqf5q2R6Z68ljz/oaK1fTThz6Sx/zrCyxwXRRG6FQ7vGBee3R
         Zjd9Ve+FrhvX99ZLrDGu76CJfX3viBHuB3h/zU1D+JHn3wO4DfiYWOuOjRomijn3You3
         yjgq/8GdiuGucKv8DHGc4mxif1bEoEN8BFowEd0XZ/Z17GR2CMDM8sKiXrS32VIR5BKT
         w6WuuyFujXIsWkZTI2ge9YTkBckK+KI8Czk6iJ90vLJ8f57+iuEAFjoPYGKK1Rjx/ySA
         VL9w==
X-Forwarded-Encrypted: i=1; AFNElJ/H66Ha1iydsvt3U6HD3nXM+vLF/MtW8KR2mwPOu0ln5da8h6TcTnxLwCGD4p5tUO2n/9ZcXgKiQiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ntO4ypuuq6Ak7qlJC9h7CHsCtYnBVrZUFmU6eVlmt9CoakCM
	D+A1kKAiQSHK33s69sXGKjkw90tdl0mcak1e7yOYX4pin97IVXdvnf+SxLv/2Vk7tna0KvSyBg4
	/MlRgozJOtqsOH0/wndAVi/f6gje2vl4gZxVXxZJr
X-Gm-Gg: Acq92OEZ+ESWEAbsYr0cG6Pc1aIfmN4SqculJA2Yhb0raSOroMAsOEiXDqgEz+CvnqW
	KpJZS9vWCpF+gTf9ie9R5ftBHNqo2ZYJXyoAoDgM0+MZR4SuYRX4uDtstntEv/Vtbj4sodYv0TC
	rgd+gTl7wyQ3p74SSuosGHsVRAhUn6aeP4lBiYHE+STWe/2HXhfA8fHcobg4PBlCWPo0w3HwOB0
	ai5sifQAal8s2E1ERaPUfLopvGo7s23j9pv3fODW/ikhftcXgBcR/+ourrKmq6umC0XZ8y4NIjg
	JfcVj4wxCd52+lqdyFQNaRsTto3MCBDpRpCQV8+Dwa9IH8kJQw==
X-Received: by 2002:a05:7022:525:b0:128:d4be:7428 with SMTP id
 a92af1059eb24-1365fb4fa18mr10605757c88.19.1779896142087; Wed, 27 May 2026
 08:35:42 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 08:35:41 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 08:35:41 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgEZ9vCKkoMC11tVrueAonGWH2x6OeaYYxXGEj2gwHUaKw@mail.gmail.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com>
 <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
 <CAEvNRgGQvMdDmVfbk42EY_PGN0ybTp-x21Zj+pg_X1mk9iCRtA@mail.gmail.com>
 <CA+EHjTzLCD-dU-euZKgzwyEr2ecPqFDNutcaHm2fCDGA+MHVXA@mail.gmail.com>
 <ag8JIlHjohAOC3-g@google.com> <CAEvNRgEZ9vCKkoMC11tVrueAonGWH2x6OeaYYxXGEj2gwHUaKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 27 May 2026 08:35:41 -0700
X-Gm-Features: AVHnY4JKedjh8K8TNAXOjoVnM50DfBi_EKpudGArqGboylLRPDEHJZCPBXCFwT4
Message-ID: <CAEvNRgH_ToNJunEmQKn3wED1aF02hwg3GrQcRwwZTs_bfPVf_w@mail.gmail.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

>
> [...snip...]
>
>>
>> Hmm, I wonder if we can figure out a way to consolidate some documentation,
>> because this is _exactly_ the same pattern that x86's host_pfn_mapping_level()
>> deals with (see its big comment below).
>>
>
> This would be great, are you thinking an actual comment or something in
> Documentation/?
>
> Perhaps we could iterate on this a little with me providing the newbie
> perspective. Do you want me to take a stab at writing something up?
>

Please see https://lore.kernel.org/all/20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com/T/!

>>
>> [...snip...]
>>
