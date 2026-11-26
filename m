Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689925;
	b=FMRZBs91IgGDHSLUPLrVWQjxLh34lX+v3FUtJ4BUDU/OdzbaFwm/yLtGkk2z6gIj5uhV
	 nFR8Fz1lc5C7F3/8uZnVwcGU1I7xtgvYEANC53Do8kZrmq/hTV+jUOl8Hlee84+ECAvG8
	 LZ16SSFIqbt3oyxmhA122GoKU+ioV/8eDSbLkGCRn0E3g4SLjk2X89g4G0Y82U4B76h4s
	 i7GgOrqw4F1qgxg8qsXVUwXhMgsqeqMDAzURV1TJqi+8YbZimM/Tgd1DHz6acpF8O530L
	 fA1PcsG1jlKdbYw4YPayEAbvwCBQg99QnN0zC0ui52td0cmT3QJhGgjHb5XZTO+U05g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Un6gMhy72C5GdMKpxarLNGYbqAQ9rBfW8csPHV3xsTs=;
	b=zhOd78WjhZHf3DjsKG8D6XSAHmFZBw35btYs8gJ9i9kzSUWboOfBrk2WFSIoVKcpWD7v
	 QQiUNBvk6KXXAOhL7N2LTlU7ywXPmUhOCtS86FWHQsU7YS34HgA1nSxXgq6otjeGRg302
	 CWhB2rGhEZCPKEYfS0lkvBjBy21Q1DDso5WQSi7MPfa0WkMSz33Fze7dyV2W7Ki4/Vk8/
	 gDU0NKzKUpLvPjJjIOS77PkZIvKkf52nCiALnwu1EjgK4zwyOge73ZiQ5Gah+RaOvsQKL
	 ZryzimL3P7UoI6AQpwtkoUtf39VkZF9GWB4uj5zFce4pgU2lXz6v2P7belyS1SjJIzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="fb/AnGuu";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FBD606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 10:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7FBD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fb/AnGuu
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so3732218f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 02:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795689923; x=1796294723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Un6gMhy72C5GdMKpxarLNGYbqAQ9rBfW8csPHV3xsTs=;
        b=fb/AnGuufRVSuumZI6EQLA6cj75+M3xYaDzd0Gy6RIfFD9vTufZ0ocvqMKbKkCMuJU
         HCBXLOxx8vgikybvFGaP8kOTEPC96KRwXnjjGdmpRLIAP3v7/cEX49ZmqXzavqZRuij3
         yAgWXhNLnFWVkhqNg9FhZPzLqKHj3vih4TQBrzWrYFpbfSQ4U8bI/qVviCwdNFG1GKRg
         Hxn6CMjZT5DpBlzV5e6WnYlgdhQXs2yNA/UJVS7jWkPiOHnO8ZNEWlUFaREDrgmI9OpC
         SZzobCPy89LxilfHUkDRa5QJboD//JYUx9AJLoSKPUrVgXCRpyowQ5xPdH3/qHs9I8jV
         3Rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689923; x=1796294723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Un6gMhy72C5GdMKpxarLNGYbqAQ9rBfW8csPHV3xsTs=;
        b=YJjWJ4Kq9vmCf3RZzQ4lWe1nEQd+uzOwSKHSTlYDnfabYuumRetHxGj5MRNisC1EfB
         dVK3+Hrr5wvhjvqq0DXFFs7WE71e19WNQ4naQ+8OMsNLaHYXg9EbYbo25XfHvT0sc/dg
         amMJKeSU6PPWa+MZkL8WX9TGwKRJ69mDh5E7IeBPPEwjSzXjuTIcPWrDyVsvaZGpW2aR
         VKSaZFJQ1KVzA9eAYq9YzXj907DfFHSZgsL9oWYyMeg4zZQVcXstw0AnA7039XDLBn3P
         9l0o/tmROvbQD4KbdwWBtg2yVV1s5HxJFYwMYpJKaRlHGwbb8eYl3ZmAtRroR+tM5RrV
         llWA==
X-Forwarded-Encrypted: i=1; AL+hErH+4paZrWp2AfxkijnnDmLDWRh9fBIDyg+TgcHpYVMPD9+McQIcjoPhhUnqsmwcD5UBVCRWfzJII4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jrG3VLqcNQWIlFBzOIyp6ZfVbhAf6IX2wNSqnCw05r7kDxlJ3
	LrWTa3emyvKald1AUI6UUDI/gjF/R7ZSNUBn0RuFB3B55/0jqZTZVMcq4sYUdMsQKnQ=
X-Gm-Gg: AZFdTZeGhzki4tAm0ejqSNjiyhAxToCgnWxGC2EB2IVkdHZiT25oY3vpoCIYthSTyhN
	b8KaWy5eY9PVaU0zdIRy1LaU6x2kjnztsmxoRXd0ACNW0OvVtN5VvA3priT1OTDmUnjTIP49VbG
	8pVLZmJFp6IPuU6SKdfzhgq5ZaMPKkSPFWbaijWmFR+cyGt2prC5TMOXD+POqfQrAW4RVHcz/ub
	RnrlgASzmGDa2JaVlm8n+YGhFFyy1wcyPRMiIMtMGxwIlC+7ivq4urQdkfyduMnj6226sPGqM7s
	eYwEaLs8b+BtPJDsv9ShV6HOCxqbzRQqUP0oybQuu9q9Gyly/9YJkFPQFJ7+hdUq/YYu5lEkS0M
	y1tnaueRgmKW9bGFPnLpdD0nmx7J8McT7qaF4cgVdComdqt0P6e+mi6A3eNZfy6iiV3jLpLJq8O
	mHdB2ERpTRs7NAbrwfXxbnJpG/mCMUtddQ/F1VDWDm2qUs/VPS6uJ0UpgfSqWMKZ85txeFg4GMK
	3dgGK1eD+FZfVDqao21XDwQXlb6JWGnME/mDLQYYMCLY4cE2r6ekBN21flpZvATqTGp3kyOTv2O
	JHiS7Vi6qoHmMFS2PVl8CUTpAcVP1zSVHl3pLY3b+LWnkyakHdWi+jAdcnv/y9VeoQ==
X-Received: by 2002:a05:6000:248a:b0:487:b50:101c with SMTP id ffacd0b85a97d-4abaa97702bmr38359967f8f.5.1795689923186;
        Thu, 26 Nov 2026 02:45:23 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm40416103f8f.53.2026.11.26.02.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:45:22 -0800 (PST)
Message-ID: <a40ad738-cb7b-469e-b67b-353b64622dbd@suse.com>
Date: Thu, 26 Nov 2026 11:45:21 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 David Laight <david.laight.linux@gmail.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-modules@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-14-wusamuel@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261113221248.3535369-14-wusamuel@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 11:12 PM, Samuel Wu wrote:
> To find a few kernel symbols, users such as libbpf parse all of
> /proc/kallsyms, which is several MB and text based.
> 
> Add the KALLSYMS_QUERY_BY_NAME ioctl. It finds a symbol by exact name or
> by prefix in the entries of /proc/kallsyms, with vmlinux matches first,
> and optionally in a single module with module_filter, or all modules by
> default. Each call returns one match and its position; pos + 1 continues
> the search, until -ENOENT. The output returns the address, the size, and
> optional name and module buffers. A buffer that is too small gives
> -ENAMETOOLONG and the required size.

The kallsyms data in the kernel can change between two
KALLSYMS_QUERY_BY_NAME calls, for instance, when a new module is loaded.
Should the mechanism provide a way to detect such changes, likely by
tracking and exposing some kind of generation number, or is it
unnecessary?

-- 
Thanks,
Petr
