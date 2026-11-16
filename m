Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866112;
	b=SihdX6/lHA8kjlcmV3Udz3UN+5V4zhsyWB4xhCM12+jtupknBWx/o5wTtMW8Gf6SiA0b
	 duMKvsWYiKwimDg0gT26EKYjtjBrAzBg7a8eBY5qMoTCK879/1HzAj7m1PaRkT2GQeaK+
	 0XvaxQ0Qp8pujLDQxbTITQ4k628xuNGAAn6lLSltM+HwbPUfcM1yO21zYMc40ACmq1+YF
	 HtxVa7i9jG9CBZ0gMontW3VM6Ll5C0y+6IdmojUQcAPCmtq/qkZENdMMHMXwr7ixeuN3i
	 V11XrmMiu/2WviRX0T0ZSeM5hEiWz46Vg/Xzdy6y5Sen6oc3GG1KH+DlP2rdf31EpPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z8vq/8+11uEzF73ROpgv5xIjXzTVcQX1lcqgJ4otboU=;
	b=whk1K7+AmiynzYQsaVJqnb3TCWJDodPHcDNCt+43wgyIvAPz5JYNojXQc0waGlNI1akJ
	 hgNBjk0HuS22BkAasBsxrajq1duQzdw5563E871iVf1AGPolFAxBM15kzdPs1rKB6k7Si
	 7DG6/QY1xJsIYVzdOkWfKHTlqyplNDrmkc6sx/WazmJ1DWsNQk9TqgCkMnXQSk1oM/a63
	 FCLzaLQoRUlFAVa9Snudlr7tzJUEQ5hNcIPvemPflrvKbiBlNX2UklQj7oRC8g/Ag7uQe
	 RD+ob1M5DVGWKaY2DTxZI/IFZTBYjMK3kXEzge96IdgWlq2AJ9SrDQZwC17HH+3v3wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SEuIsnhT;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22155606A882
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 21:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22155606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SEuIsnhT
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso27405595e9.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 13:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866109; x=1795470909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8vq/8+11uEzF73ROpgv5xIjXzTVcQX1lcqgJ4otboU=;
        b=SEuIsnhTIa0FHktjysnma68HfFiWhJjXoAtls/Psz/C/g288mSMcR3KF2eqIyUZCPv
         T9F7rL6omnVBvjcxOdV4wm/cpwzKqsUJNUQWou81N9X0EryPVuy3+iaQW9AlF0+HR5tC
         f/cvZ1jHSPnGS/yj3M9/ecmn/z+/9b8lkN+asobbZB1I0xTlkh6OI4Z2fcxWJg9aZ5k+
         ZhWocnLfZmmOP0Eb+R2Fz0TeHSgQE83AGmHyrQ/s74Xze9RbRkw8ciXiYWd3dlTQRcl8
         0chPpDGPIC0N6BEe10DckkkmJYA+ApFowC7BY46ajLpD3uCMkV1wyzJkQ17ywRCfoTr4
         BvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866109; x=1795470909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8vq/8+11uEzF73ROpgv5xIjXzTVcQX1lcqgJ4otboU=;
        b=kwnU0wTObav75cc5jA8a4RA6mPh+hw1CLtKZKKcHeATIoXh/dkvN1VcQR5yHG3THMJ
         gU7mI+PIuKobBfNduPoZonZjrOb6sIM5OLAEW5FgQgeUSxsA8hGdSnxPfjO6375vOF75
         G+WzyD3d6yA2OAI0Sw9E+jjdUG5zBL18OWGFIlTLkwIPhaDp0qQfwvS1sK14/v/BSCNg
         sBq76nGRJ6/bi1pUAE5YBL+x1HiIjvv7AUZCQWoQFyRyQofZc9thSuSf2TgXiFBRXec8
         baBvIR/U0zlVzfHTFZ0dmlM2MW4laE4yZTkljvBVURY7D4NGdr8zAn4UUwXB1B8VfhgI
         8XCg==
X-Forwarded-Encrypted: i=1; AL+hErHHqzuMkFV4PEjTDPijeZYA7/JWx86NnfR9IqlkkG1Pab01/ZASQcSV9FWq3VyE/pcmxOS0KMXp8KI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+G5nv7xYqZG1hZXJiVq1gMZpndWDcbTr6cWMLGK7EapaqCCv//
	g+8f/mfhCt8FclxoPxU8nlcAsnvf71aVsPusSuicdekube+vwzJ23Dvn
X-Gm-Gg: AYBFou2MmZLTCHoXLgbYwDMsuYLmFCCCVo1P3Kv8HDA1FxfXwa1Rz6BVy+rkqAngKyR
	b5Nr4PMyw2XQfnPalnAy/1RDSF0gCqOUx57ZIGQ5dmtumjVOKzAhJvoGrT12pimeiLMyptVkuLh
	ely2PXiCm6YQyLxQCNCP4+InHYQn6EtYdz+eXiQpZtANTFjM8Q7/a103x+aB7fmxAqRdsjmfNSO
	kT4tyGp/crWHhhc2FoP6OX+EhlzkhbG0RgtcMQIKFq+ErR2LNY/+QBbYs+/pOdc2ModjkeRDYn5
	DabAvatzW6Lrsp5jFQNyfNRUDv1D2UQ+CyIrUY1BV12bmrvhy1i4YRg7BECQFaVpiVg9deRGECH
	z+vggPO8Ssff3z/hZTx3HkHuTb6HMife6au7lkWGy0AQkmYpmp6UoAAAqviEi43nO3R8Ew/v7zn
	uley+GxR2yoYN0oh1p+EwKzdQ1aQlogu/ODeCOireF1p4CrnuN1zUbIhZIK7pUlM882v9HQpjvM
	NSfYA4WSYn1h+WAfoLuwtRIWMGrsbHSg2tKtJa0iVakI0qddL7cGsmBdhp79J0vZThIWbZyFBrL
	opwBWLmR/CPguUw0TN3KbSRB
X-Received: by 2002:a05:600c:1f96:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4bb55a4eb97mr252720535e9.12.1794866109317;
        Mon, 16 Nov 2026 13:55:09 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78346f4asm17391425e9.0.2026.11.16.13.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:55:08 -0800 (PST)
Message-ID: <08c0c631-64d6-4703-adbc-88fa1dfbe3c5@gmail.com>
Date: Mon, 16 Nov 2026 22:55:07 +0100
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
Subject: Re: [PATCH v2] Documentation/userfaultfd: document RWP behavior when
 the PTE is dropped
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, David Hildenbrand <david@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20261116101004.15322-1-azpijr@gmail.com>
 <avsu-yTSPKtZn_Ez@shutemov.name>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <avsu-yTSPKtZn_Ez@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 5:28 PM, Kiryl Shutsemau (Meta) wrote:
> On Mon, Nov 16, 2026 at 11:09:56AM +0100, Jose A. Perez de Azpillaga wrote:
>> +The registration is fixed, but the tracking mode is not: a context that
>> +switches to sync mode with ``UFFDIO_SET_MODE``, as the workflow below does,
>> +needs the sync registration. This has a cost in async mode, because minor
>> +faults are always synchronous: an access that takes a minor fault blocks
>> +until the handler resolves it, even while RWP faults are resolved by the
>> +kernel.
> 
> Nitpick, and my fault: I said in v1 that the registration is fixed. It
> is not. UFFDIO_REGISTER on an already registered range with the same
> context can add or drop MISSING and MINOR; only dropping WP or RWP needs
> an unregister first. So the cost in async mode is optional: the VMM can
> add MINOR before it switches to sync and drop it after it switches back.
> 
> Maybe something like:
> 
>   The registration does not follow the tracking mode: a context that
>   switches to sync mode with ``UFFDIO_SET_MODE``, as the workflow below
>   does, needs ``UFFDIO_REGISTER_MODE_MINOR`` while it is in sync mode.
>   Minor faults are always synchronous, so keeping it registered makes
>   them block in async mode as well. Re-registering the range to add
>   ``UFFDIO_REGISTER_MODE_MINOR`` before switching to sync, and to drop
>   it after switching back, avoids that.
> 
> The example can stay as it is.
> 
> Otherwise:
> 
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> 

thanks :)

will change that. anyway, I'll give some time for the others in case
they want to share something ;)

-- 
cheers,
jose a. p-a
