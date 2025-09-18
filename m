Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AFE315769
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210771; cv=none; b=Y1dmR3i8pm9wwj09+sf1D1aTP3pUIM7Gun6prJPfe3zp2USVvVqdvtpJEpy7KkFzuElus9oYtkuSLfCOJnVdSxn1k9WfZTqs0QWTHSbDOECu3wIxdTT/lq0Z8rEYZHoM/njPEMg1L2N+a0w02zgYdSNAmSzLbJfAGIAPfnmgXZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210771; c=relaxed/simple;
	bh=1ThK/rR645nYnWoPl5AGIZzEq0hrX0mKYDFiJ7pgpwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjkob3beuRIWNoIlZFg3NewOuCQX7Ts9uA4z9aU7AR4pc/MXuyFwv+wW2oBBa+kOOPSFAGOnh3zSeUXCYPz6DWmVyA0b52/gMsGbusVhIsucKvRGRlvQ5cnwjXLfxno9hQ+tble0wZVhZTv0lZ8bDlFS1RGBN2/CiDFh4C9IlIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jg4qERVd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jg4qERVd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46256e402fdso1837615e9.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 08:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758210767; x=1758815567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4tOEHafOTi5CrXOSO1m8dEnNyNggHvPpDClq9ufaB4=;
        b=jg4qERVdwTqX7tZQST0zSYTPDJEDNy5iX6rpxL32hb9/ERX1Wl3ZLRKckZROmkMQB5
         M57HuJlg//souQ0Y/Vje10Y0J035gVY+R84fDYdv/F/Is5V83n/sMD3tvaJI4mlgXu38
         lN1Cb6T3AsPzv5s94UvAPikbQJ1ZLsq7LIMINVcSLBd8O18aJZKy1odbZSSKgmqD40wc
         ftla15XDWoPrD8sjBmLorbr/5XZ+maiHJewc2uVZ75vhT0pzTJ7NywiqyOU747gT/wYg
         uQ3nw4qxOpIhvAz4EGVW2cD7+vp4meDZfC1+n+b4IZfJ7pV8/LwtlEgva2nNx5mnbshH
         Hk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210767; x=1758815567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4tOEHafOTi5CrXOSO1m8dEnNyNggHvPpDClq9ufaB4=;
        b=v08uorFrVrR1QCHesVNNSKpm/HzoGVWg+raAOayq6cOPCP+tS3Ksl6GtNNL8/RQgFq
         ocbCSzQAPWreyN8oRrIIxmdp2thwT94vyHLrWb43sVcxy6CdRm8MTf505c3wNm5bUMwU
         xIb9AC88uhVJr1QG0yWziP9vSA8xOsJIsvJJrIhaMJH3qRCeZcgNFsQuxAlw1nu9Cn4e
         h5USPlBXfoOqu/UIhBb6XDOpTkzHGnl8ZwlMQhz6f/uOsWr9BeJ6wc6KalYVWYzKP2wb
         rGKgovHPHQWHAOZ8RmwjNq7oyi0Kz6dhzhRgmIg7nFNMeKj20bFN8ayrAPTqSbsdg/dB
         qIog==
X-Forwarded-Encrypted: i=1; AJvYcCW2dE0xnvLsK8xYyuDOOtgDt4N/HPCkH2b33k0DJ8LKfezI1Tn2SF7Ktgvj9RUozlKxILSvDaFNz2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdVnJ6H7o92cI7Ne2XGr/xMmcfCzduqbEyPuPac1Gvax0uPCTa
	dfyJIHFw7H2ggB2Tyiphj4xqY7F9KHgYWu/gJmQ3qIb8cY/sssSo260J
X-Gm-Gg: ASbGncu9X1cHd518EZOf7kADQRZbf2gPdqhhIQRrMsTaVqyEDt512pvbhdh3xIq2Krm
	64tm+wyZHzg77tHFePrHomQEIGW2buW6ief8hgIoEAYlEVdlKYi+UpHz/wy/083dJdtw36sUnNa
	S5/RXgXM3XR7sILOa/BoCfCy8Ov+LPIzgB0OZJz5ZmPlL3s9t+0YqDqiYSktAdvuD3HYtyHahlP
	mSVfmP89Pbj5dONQKTY0yt47N/PEzKjV1lBrdGaR37G9/IS3yKlYW7gav8q5CXIeOSbIo6Br46q
	fv9Y8aXVpoN1SLyFnTBO8oKHvyjE28OS/CExyr5Lc4FwWGRYDQx/k34a7LRhb2c6Zes7G39e/+Z
	a1YtCSFBvDbRHP2/t6Eof3MJ6LXirQerlDMW6G5iM1ZSEO94=
X-Google-Smtp-Source: AGHT+IG0MfbY3dY99xKFXmJfWWQhOAQTGGYXwxyEVK9fIcFhqDqMdo/IcROmJKmQtggm9VagY37U2w==
X-Received: by 2002:a05:600c:6308:b0:45c:b6d8:d82a with SMTP id 5b1f17b1804b1-46206283dd3mr33695135e9.6.1758210767067;
        Thu, 18 Sep 2025 08:52:47 -0700 (PDT)
Received: from [10.214.98.247] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46138695223sm87677465e9.5.2025.09.18.08.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 08:52:46 -0700 (PDT)
Message-ID: <60b9d835-b164-4775-b9b4-64a523c98879@gmail.com>
Date: Thu, 18 Sep 2025 17:52:39 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/19] x86: Add arch specific kasan functions
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com,
 kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com,
 alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com,
 trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com,
 joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org,
 graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org,
 ardb@kernel.org, thiago.bauermann@linaro.org, glider@google.com,
 thuth@redhat.com, kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com,
 nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com,
 justinstitt@google.com, catalin.marinas@arm.com,
 alexander.shishkin@linux.intel.com, samuel.holland@sifive.com,
 dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com,
 dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com,
 jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org,
 lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com,
 kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org,
 jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com,
 ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org,
 peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com,
 ziy@nvidia.com, smostafa@google.com, ubizjak@gmail.com, jbohac@suse.cz,
 broonie@kernel.org, akpm@linux-foundation.org, guoweikang.kernel@gmail.com,
 rppt@kernel.org, pcc@google.com, jan.kiszka@siemens.com,
 nicolas.schier@linux.dev, will@kernel.org, andreyknvl@gmail.com,
 jhubbard@nvidia.com, bp@alien8.de
Cc: x86@kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <7cb9edae06aeaf8c69013a89f1fd13a9e1531d54.1756151769.git.maciej.wieczor-retman@intel.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <7cb9edae06aeaf8c69013a89f1fd13a9e1531d54.1756151769.git.maciej.wieczor-retman@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 8/25/25 10:24 PM, Maciej Wieczor-Retman wrote:

> +static inline void *__tag_set(const void *__addr, u8 tag)
> +{
> +	u64 addr = (u64)__addr;
> +
> +	addr &= ~__tag_shifted(KASAN_TAG_MASK);
> +	addr |= __tag_shifted(tag);
> +
> +	return (void *)addr;
> +}
> +


This requires some ifdef magic to avoid getting this into vdso32 image build process,
otherwise we'll get this warning:

CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
In file included from ../arch/x86/include/asm/page.h:10,
                 from ../arch/x86/include/asm/processor.h:20,
                 from ../arch/x86/include/asm/timex.h:5,
                 from ../include/linux/timex.h:67,
                 from ../include/linux/time32.h:13,
                 from ../include/linux/time.h:60,
                 from ../arch/x86/entry/vdso/vdso32/../vclock_gettime.c:11,
                 from ../arch/x86/entry/vdso/vdso32/vclock_gettime.c:4:
../arch/x86/include/asm/kasan.h: In function ‘__tag_set’:
../arch/x86/include/asm/kasan.h:81:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
   81 |         u64 addr = (u64)__addr;
      |                    ^
../arch/x86/include/asm/kasan.h:86:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
   86 |         return (void *)addr;
      |                ^


