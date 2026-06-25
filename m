Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06CE1F37D3
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 00:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782346791; cv=pass; b=pYOnRq2ewgOSkU2qCl5SQ2lfdkoo6m84j4GBwy/+op/zPe+y9nyiJKzuRzKTYvm9DZeMCBbiMtGhyGI7CrCH6ypS6/5m3EKp1HR2kLVipN4jAlwJu5GnYEU57iPE2Cxj9+BFqRd6kfz4+Op3qTmMZB4/zT3J5ta8bxasKvLuBW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782346791; c=relaxed/simple;
	bh=rLzvOJxIQU3Ts0wS9KKJCuJPkhIJBlsf6U32nXubaQQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcldMCHh4Oub++B8+ez9NUjZtknknJjupH9jshEPFxci724UZ0vLXG4tVpRo7uwa8pAU5+zbloSgIyHbbJll2jco9BaZTWiQ9KyhvscEBy6rpE1CiiuFTTFZ6szHQzva6S7MyAJin8Ec8F8Ty+svp/W+gNlrT+5VSWdnWMHR3NI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d6SJ8T8b; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d6SJ8T8b"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-139986373b8so2266407c88.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 17:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782346790; cv=none;
        d=google.com; s=arc-20260327;
        b=FJBhOktcES294B1VdYQpNJzalKOpQknQ+ug8HtfZ2XgE76mDXF9O5r6mwQw4McmPQo
         C8RumCyZUV6TWIqKQaPmZVmw+94CaVqhobup20FbbCD0S0bWTPiWZsFoLr4KFm2xLTDV
         If0XM6lPSkjTLnhzRc/VBIMdKK9iLFJJ7pLeUJRKGJcD5hdWYfnrEVKfEKFbfzvO8fYy
         dqjk42BpVcJaaVDd7zQhW/8i6OihfY1GMFUu/OMJQN2j3OuuI9NWgO7doO+At4dlSwxR
         xV/7R43sHBQAt3sMPqKAv6N2d44/V9m3paGS9oFqlorZ1Ct/zibfm3UbDHdZtUmlYnpT
         QzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CdGA3bllvZfq9+oq5ATtnUq0c6NavELb8bI7ZCuFA30=;
        fh=C29bq3GMjB8KA3GAzKKGnkw3jJ3JsemMuxQr+UKLge4=;
        b=II7xdIqm5AbZr4PS15uCxVzs4RmPUvKBQ6Esd1Km7vXVCai8ovd0fHSN35Il5VQVwT
         5r4NMuqsDrlqzcI6E1OBPbOs5XRqc5R0HChm4oVm96moyak4BZ+RS0Bh/X/sQKcBFK58
         9HFRs3JnJH5YCo+6M1SOsas/eHrcoMDaxXbdVWgqMya1bGFOUj/g660IfJNn3xAmenen
         ZpCS7wu8x69S31MmoHVjAs3bR+KJtScbsSwSspT34+Pa1aOWP1Yvk7EdLJ8K7hztR2Ie
         lcWGBDiiKKbQ0kYrspplTVHn38ZxIIHY9RtkiOnMpASqzz1pfQjSQ4+aWXLtn2HwwGnL
         l03g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782346790; x=1782951590; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CdGA3bllvZfq9+oq5ATtnUq0c6NavELb8bI7ZCuFA30=;
        b=d6SJ8T8bFXONBDv8sWkZAq4UxMY1A+sKJAuHT6rEAa7dMvyVDEJrMh1ltaIaSfuquJ
         edvG+HIKuITzIffmOLmoKSQLPZ/dt54ReDIf3J2wnsRdhVmFvN9X5RQdKHO3Hjrz3o2L
         fpjxSMr3L8Ohxdl75FruWF6/Ned4s9TUgu1wtKXLR0M6y1ZjRFiAvapds5FbrNstpsZq
         c7r0yPZqNWvF9p1/Ps+v4YJby45kyjrQpZNQ4yJ6vDfcLnF1EkmBQRaia3NGo1HqfLIV
         h/9MjPaFQ88X58vnGtO91tzkrlUTPflsbxRF27DR7/Fj6XdjYStQIF4j7f7WMalRPUIJ
         NC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346790; x=1782951590;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdGA3bllvZfq9+oq5ATtnUq0c6NavELb8bI7ZCuFA30=;
        b=OabRboPvVd8fHk9SeV54FJw+sp3dipJndSAMJ4KOuN/6jxkSHC6BYRSIVg7n35dBAK
         N4EtPCo5IyUhxTfH7pKv+8yzPTKI9cjgzKb/D0hM3Za0bU9gIwFfKVEZLb5FTHWquFmu
         B51qe6Q8aR6EYQt1wMETtVSyqErG72hjvRn/EgNH3vDXvwycnhjU8EiTGAsmSj3ApB96
         pS4g2NOYMg/UjtecxlPTfu3e9y7M5p3igHIg4/SoFjGof0+4N/sW6JR3B+uh32uG6D76
         S8efM2lHrBNXzc0T30eRGCS4xC0Ae9CwWmb0PUlN2QZ5pJUoiUo2tydaUdIj+dkC5eRd
         x+nQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xjUkG3n1PVoLXG0gywU49AW4ctNN6+pYnKyx20Sndt40leKsSg5UVt089wb9ZmIuk6rzMXlRPK5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKlUkBEyMUl6g3j/gldjftUOSWBPGWFnAx4Jgtc8RwSZB+XQNS
	U5a5vRh0xkqGfYPXTC71OW89SXFkzSpyWWjQcviICk7QLjrnBMqDogwuF4ZR19gifWLYbSmSpzI
	o0f5U1IYggXAOwR1pXGMJuTw+UMcNpxPc1uMQ38ts
X-Gm-Gg: AfdE7cn3OAbo4sUybuuFXIhJeoXUtVC21xCyuV5qL1BSwpQzDiDL2Vh3Lpn+Lv7qjbJ
	eosZntAqmLSgOxvUEXYWFxFBYvqfr/hRKCUZl01k5eNGp+YUdojJ9m880FAxarJ08V6PXkfWHog
	q1pYzxZk8ql+6S/bdrot8B4q0JNr5ELZQSVYFDrBhWwlpL/Qg/KPyF2HG8zAFOp3x4w+IomrC6A
	UDA2JdJ+7ShmwRQiXHZEOzqQ9m5oujmSS5cbpck2GMUr6rLzBU2JQEnwtYcZ97Xg0ryKwvzOgBy
	NTYTsE+nWX2ScIElDuM//Yp1LqVTFkUtfRCp9/lnP0xhbdK7oPFBjVqIyes=
X-Received: by 2002:a05:7022:611:b0:137:f001:fce2 with SMTP id
 a92af1059eb24-139dbbc564bmr255822c88.33.1782346789006; Wed, 24 Jun 2026
 17:19:49 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:19:48 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:19:48 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <9f81ea12-98c4-4ce6-a95e-233851dfe8dd@intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <9f81ea12-98c4-4ce6-a95e-233851dfe8dd@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 17:19:48 -0700
X-Gm-Features: AVVi8CeR8FAzeQAvNnM15yag_GxBRrpO8H44tlQVk9R637S1b27Bxjsp2TDXvkw
Message-ID: <CAEvNRgHR-6X72fvx-4s+RrsMHohSCBu53bVX4G3x-=XGLnOxiw@mail.gmail.com>
Subject: Re: [PATCH v8 00/46] guest_memfd: In-place conversion support
To: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>> TODOs
>>
>> + Retest with TDX selftests. v7 was tested with TDX [12], but the setup there was
>>    wrong. Conversions were successful (no errors), but the shared memory being
>>    tested is actually in a completely different host physical page.
>
> Glad to see you knew it already (I was going to report this to the
> original POC TDX patch)

Thanks for reviewing!
