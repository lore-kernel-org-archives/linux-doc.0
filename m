Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB7A35E53C
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 18:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769019182; cv=none; b=hW0HQWgNRZg6pwtAqRBwe00CojS2O0qGi42Dr+3CJsjgwg9/0c91d5d7m1yxriS6Jd/RTVplE7Ai23APw/NCtZg/v5hnEl3il4ZUEipnsE7dhZLWSsjAHf5ouz0exovi2pfsyPMo3rbW1Aic3EnwUdj48gJApUs9EDNitce1ZQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769019182; c=relaxed/simple;
	bh=M7jVNUNY+4g0kBsxBJ4DNRNiLjvFbYlQeCao5nUzBIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dMWTMbODSLvvBNpqMpJWrlCKCuu7ptp7AV0Nm2kLJevayRwVCnrqSAMzi6RVk5tASXskiZTrv70j0Gs8L55F5pE1nrpcs/43LQiJaP0LpPa15rKcJpQq7wcR6BvHSRbbxkSPHVhPDhkR3Urhh9DSHOza8UnhDMNnBEFjMj2+UUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=ObCZof5k; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="ObCZof5k"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c52e25e644so12748885a.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 10:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1769019179; x=1769623979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odBgMeGleRPkwApB129VpN2tHRH7cELn9wuHglowA3c=;
        b=ObCZof5kh3alQhOxDuE24+3Kbp34L7vyvatIDNE7sLNkq+Ca0Gx139mNo5S5RbALMo
         3CVfAwRvYMK9BUp7PYgUyNxLSJquRmQ5BzFxBxYPtFP895nKP8ewCA6aGb6OyTlJxWTj
         GsCov7FaaHlQAZpzBd4BpswRKBovqP7Bxm94g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769019179; x=1769623979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odBgMeGleRPkwApB129VpN2tHRH7cELn9wuHglowA3c=;
        b=BLMLWqw67rvXszf65/O5IVpIlBwfsS2vnrXyWnTqdLnNHGbxGSqI42PsDRrg1rsfGv
         B/V6HALaguTM/tGFMXNfdYxkAKsQNJtQItxay7eDIT/Ehn8JFK9IGA66svD/8/rLuhRi
         6jvuaEiBx0+1N24QyI4LJlUXVvSSJMuxjLhEuFrfLgD/PTWW2jCrB/DcpcEqgtTiwGvc
         VFtnEU3oCWYrZw0derNR6uMXwnKm0SLtTq83XPrS3FdsvegJ7mY8nJ277d9LanK9mx/p
         bUO+v4/JBZnPgs+4nVueXoI51C29CT7cE+bV1BT7+XSBTZnvd8E6F+tdWnuk9PjDqG1v
         4/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVug5vTVafjhGv6zWOvSrAACSCuoir94rYChJDHCezDJkfm80NfHoBCtH15x/tZQXelEnROYOjph6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhsfTq5/dlmztrKR5uqQpdFGaQJk2BUm61WdX/5Z+VDJ7hot+t
	/Mxr670k5BmLqym0E7FiUNny9wRYi9rHeXJm34xyY61Nk9utHs6hg6n+LiU4FUaGdfg=
X-Gm-Gg: AZuq6aJoycUQWE+ryoykr9sXtHmhbIV41gcK5gk2DN9EHsQDRGvZoEdI3io6y60fN4s
	uELbUAyLaSdwguVBWq1KZMl73ZHdnaZZFcq4kzjGEZROcB/rtOOdFSqoLNYyuhfR7RdHVLo7DGY
	HDjLv4Ht/bONBhl9NVnNA4RsfZxwTz337Wp76cEzRzXg/MIQJ2MyVMeancy0XNIpwYqJfEEkCrh
	QI3vTopb+YwUfJlPChMbY8qH2GchipTPPjIPhK4Swt1k6iRmL+Fs0WwOAi4yNgjU/XAXK8mi4kC
	op6j0tfNFboxrCK/3RRTtvJDfljsxK3HdbdJmBghWYljhYKzaZZHk6MJ07C3y/9siP+lANZBZYS
	AqS9jB2VoYy2iY4v98lMuXXztYLG2Ln0ufn1VCxqdDr3IpRlwdev8pIdu5SyiQVYo7SvkCn+6z7
	k2fxBr/Wu0EIx7VVXGFx39k3zLtw==
X-Received: by 2002:a05:620a:2d90:b0:8c6:a790:cd09 with SMTP id af79cd13be357-8c6a790cd9cmr1883910285a.40.1769019178697;
        Wed, 21 Jan 2026 10:12:58 -0800 (PST)
Received: from [192.168.0.99] ([71.219.3.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab288sm1356284885a.6.2026.01.21.10.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 10:12:58 -0800 (PST)
Message-ID: <237f94cc-dde6-4d91-b942-4854e62eeebb@joelfernandes.org>
Date: Wed, 21 Jan 2026 13:12:55 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 01/26] rust: clist: Add support to interface with C
 linked lists
To: Zhi Wang <zhiw@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-2-joelagnelf@nvidia.com>
 <20260121092730.3628d290.zhiw@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joel@joelfernandes.org>
In-Reply-To: <20260121092730.3628d290.zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/21/2026 2:27 AM, Zhi Wang wrote:
> 
>> +/// Initialize a `list_head` object to point to itself.
>> +///
>> +/// # Safety
>> +///
>> +/// `list` must be a valid pointer to a `list_head` object.
>> +#[inline]
>> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
>> +    // SAFETY: Caller guarantees `list` is a valid pointer to a
>> `list_head`.
>> +    unsafe {
>> +        (*list).next = list;
>> +        (*list).prev = list;
>> +    }
>> +}
>> +
>
> Might be better to have a C helper? since INIT_LIST_HEAD() has WRITE_ONCE()
> for memory ordering. This one seems not equal to it.

WRITE_ONCE() is not really about CPU memory ordering though, it is about
compiler optimizations. On the C side, I think it is needed in case of
list_for_each_entry_rcu(), to avoid the case of invented stores or store fusing,
but here we are not doing RCU-based iteration.

Anyway, if we want to future proof that, I am Ok with adding the helper back
(which I actually initially had but feedback from past review was to just inline
it into rust).

But I am not sure if we have this issue for the Rust compiler, like we do for C.
Rust does not allow raw pointers to be concurrently read/written using plain
accesses, so should be already protected due to the borrow checker and compiler
itself right?

Adding some interested folks as well to CC for the topic of _ONCE, +Boqun +Paul.

--
Joel Fernandes

