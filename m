Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ADF1EC018
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759221227; cv=none; b=gplDHEv5b6JL2N1PnmQByW+gabNYNXANcUhVBEb2tL9w4lftJfuph2khioJF0UP5hoggqLRr26hqXr23wW3fFV2Vh+kUnd6WC2ilWkEo5CD8TJHWmoRoyKhza/O+IWzfJ8NgaB8bVWSCOCUJ0SRynVdA2C2Q5HJ/y26JTQlksv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759221227; c=relaxed/simple;
	bh=b84z4sLj6OipiU/LDADQxD4tH4RaTd5fv3amUZ6N038=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O6uJYTqppOn8iBiIPacnmhFr9HGZiOQnHoypEG1yCkxWn4WsdPFfcJ4xwnXl5EGJlg67curNp/rReNRnOKI1rS/58Uen2G61y162CyBNxWT/nMtb6JwUjHrkCaJ11Gj77qDkdh4uCq/t1ynJHxjrLxCcUXXLeQcRPtoj5FX6pC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jH0BfA7p; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jH0BfA7p"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-73b4e3d0756so70011977b3.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759221223; x=1759826023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bBOPU6N+QlAarzu9LlqnD6xE/6f1CWCmb96507SlQ5Q=;
        b=jH0BfA7pDo+pX7Z+tkcD8+wAy9cVudilMudXZukkQ2bgWYdPTHjDwiE0aFeVDWeXuy
         OsIfUnhzVXpL+wZUYsn6bTKdYAOJOrH5b/TP4fGJWmcL/URvY1RxlixYIKxAd0dz+JmJ
         V/svmB8CJAtAnFGFxcdoo9SEJLdW5eyTaPqP+yCEuweVPs+ZvXGrMJLDfYvj1WsqiT8P
         X6Vf1esS5qkzi7kgvV5OFGboqEyVQImNjLMIk1EojLiJl2DOjpvXo44WbXdgPL9d9I67
         REA9W9K2suAWQqA4wwMxhUM/JY+/h1M5SKMKB94tZ4FypM5+Xg895Jw0VqQicGHGNwDB
         fmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759221223; x=1759826023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBOPU6N+QlAarzu9LlqnD6xE/6f1CWCmb96507SlQ5Q=;
        b=qxW4MzpNku7To7+A5DinJummsxt6srGKd1D8a2XEgKpvwpR7eoYM9LpIRGcok1bUHh
         FGHdQWj5dH9ZRdzr1H6BCYp1+SqHjV28bakBPlabMj1yyIcY5zdU1NKVLT/azVXdppw3
         KgHOlP6BoFwu+VaribsW/a4tU4192Ql1kfLVoOu5q4PzmsS8oQt8zF6tWvDa791DK7Nj
         oOhanUZ/vNYlShIG4sCKgGjxuRM7LPBHemqV0iaVg6LLl6oziT7vdIUon+bs+4tzB0GM
         OnjFN/oVNYFL5yTqB++Qia1q1+Vq0WQGptjZpjXR+uYNWl9IPLfJOsExRWEG0dWB1FEH
         PmXw==
X-Forwarded-Encrypted: i=1; AJvYcCXkGothV4VZ5A9KKYhN+O41URQRHK2D8wRZZUsAiPyNPDp9Q39AV8FRkDswWmRrFa2jtWthahq/jc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRfFIYtpGBihtjaauUgimw7cWUhlr7yFHNd3s/l3CK1EkXuUoL
	HgHr6Xz+tqmhvrBiR+gLIkDnxCTH7i65wPdKG23Zvc5JD1V5PwU8Enxo
X-Gm-Gg: ASbGncswBGQgu9G3FABx4rJBvTkfCh9o/5flalPNpImjcxLTzQ9sZUpGDtVr0z8uM7n
	WjugmUIBueKVcUrWbloho3p0oOh08ZLux1ARNSz9dmr85nMMd/tPqF4MKRJwBa0lm5gi1AFdIDx
	1qez0u2SEwKxR15H/ob9Eo7OwqABfG/T3vD91A+iN/Ru07X6p2URoarxw2+8nW3T1S3s894lKon
	jDPDHnEK0i+oNQY/3Gyfj/A1ZhSH75K+7i+gLRQ2+UthSVxgXEAV3MkP0NuuUUM54cXq9VGEO4I
	Vv7o1+04PwWCM1mHiUGmLq39JUcL82AQ5veMx20o+esJHgRLLWz4H8wktpvKKIF6tw3zRZaZRKa
	zMz857R1OoFjtQ4FQQu/5QGdXLU0mWn9lJzHIjZuLbJJXdk1fGCwB3OTm6XeNaceZrE+i
X-Google-Smtp-Source: AGHT+IGdR0AHEeCd0GI8ArsMTXFyr2HmyKLRFM1XYpy12MOYMkBlzY/X5jDZtYeuuUkt/8DMB9hqmQ==
X-Received: by 2002:a53:d015:0:b0:635:4ecf:bdd1 with SMTP id 956f58d0204a3-6361a8d4824mr21581008d50.51.1759221222864;
        Tue, 30 Sep 2025 01:33:42 -0700 (PDT)
Received: from [127.0.0.1] ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-636d5b1d875sm3280311d50.10.2025.09.30.01.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 01:33:42 -0700 (PDT)
Message-ID: <7530d25c-f4ef-40bc-9ac8-40de4abe3960@gmail.com>
Date: Tue, 30 Sep 2025 16:33:14 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/23] tools/ksw: add test script
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Alexander Potapenko <glider@google.com>, Randy Dunlap
 <rdunlap@infradead.org>, Marco Elver <elver@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Rong Xu <xur@google.com>,
 Naveen N Rao <naveen@kernel.org>, David Kaplan <david.kaplan@amd.com>,
 Andrii Nakryiko <andrii@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Nam Cao <namcao@linutronix.de>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com,
 "David S. Miller" <davem@davemloft.net>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
 <20250930024402.1043776-22-wangjinchao600@gmail.com>
 <3ed8a6a5-9983-4b9e-bae1-4c433568de16@redhat.com>
Content-Language: en-CA
From: Jinchao Wang <wangjinchao600@gmail.com>
In-Reply-To: <3ed8a6a5-9983-4b9e-bae1-4c433568de16@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/25 14:49, David Hildenbrand wrote:
> On 30.09.25 04:43, Jinchao Wang wrote:
>> Provide a shell script to trigger test cases.
>>
>> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
>> ---
> 
> Do you think there could be a way to convert this into an automated 
> selftests, living in tool/testing/selftests/TBD ?
> 
kstackwatch_test includes 6 cases. Because KStackWatch is aimed at
debugging stack corruption, several of the cases intentionally trigger
kernel panic. kselftest is designed for tests that exit cleanly with a
status code, so these panic cases do not map well to it.

-- 
Jinchao
