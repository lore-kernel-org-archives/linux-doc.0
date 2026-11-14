Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697343;
	b=e8O/NKljwmYCowbP1AdCBXMen/Fr4dbTsSY7zqhqgfk9Z33KyvMGYhPVNsLcptqUNafG
	 6WY2HedB8K47OrTEwWHLdeGQGxSrOH2gJBGU5nHQfJNMPVwJ+zNkPNRuHk31TapuYglkL
	 ZdWgyqT4I8qpC6JLmwIW0je4dUhFm0H0JtwqOZDYbDHJweZ3SNM6bXjsH7pZNX+BzUq6h
	 zs/QBw1tY5+sV6rPcF9JoioWNsu3tTIDYzr8G0vuDGwwFLoPVHBpMw8X/dv60gv+QWQmo
	 zyIDvRts6vj9eMm/KwPMa9IBnIAn6zI/P532hrqi3AxvV9egUHy7UW6ScEzGdJzD5Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=ogoLg/UrKn4w2HbWGHqWFTtUp7LAKklTdIxHd1gOThQ=;
	b=mBhVGbKGym9kRCp966b45OpgvJ+TN5g1IzTcdcYjY3jE4955q+LKwbJLN0V4mQMqMo7i
	 puc4Q72hQknLzDXSmZNDqoItmWYR8vUh3ffJW3SZiisgahNCuKykq+64C/TvcUM3x5XPr
	 MoRYBBsJwX0TpSelafdHVYPKCXjiq23T+qiR+H1n9trWCKqaRtJd9W5cinjPigWMzwOMs
	 7cnKfDZ/fyjT8ezcMk8o7GRabEiVdTHaBkt+oSCH++GYu69ZFW2wVC7DDOD1RKdYMfMaM
	 mrUeFR9x0eRbgNYoHCxc7Eyrh5JdO1n9OlPw5B1Kk38uYB+qme+KX5rIEe1J/uOvqTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MXuwAjHK;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE78606A8AE
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 23:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE78606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MXuwAjHK
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so2703676c88.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 15:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794697342; x=1795302142; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ogoLg/UrKn4w2HbWGHqWFTtUp7LAKklTdIxHd1gOThQ=;
        b=MXuwAjHK3ryzzU4k/6N08wyMpBVAPV32D+CcCmN0rlUTaMDWUPzvLQ44/3LeLXDVWO
         rx9Xe+dlKZo+KGL05nuM+m0vH/8d8L5wcr/8+J6ub5UL7V/kpCI1EyOufNKb6t5H8QQx
         A0lVM1yUsLbvqpj/M6n5jiGzeYgdAEAJzNA0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697342; x=1795302142;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogoLg/UrKn4w2HbWGHqWFTtUp7LAKklTdIxHd1gOThQ=;
        b=HssSRSMU+cq9Lj8kGmWnD0e+NgCkfHo1175DgNaSGZ7TuwS+tkXzFIKFQWwO18rLeG
         /avRKm/t82NFku6uI+SVl1D8MPGXGrJjECFt8YI9M4sRX04Xn8PXg2TL8pxKuJLzJJfr
         ppUC7LQVYFfLFJK/8OI2rskFHDRLib+ViC05VzxGb/M5R+MFLc9UlyxxOtMMLPhrADSZ
         0dEwlfkR5Z91rf+JjMsBoX8Filr6EeLf+BvQtceUY6FQTDEufJ1+TnYMHlCLTnHDKVxp
         BXGdcQIcOzUXzWBYNJSOUGQhgHGjOzZKiCk1K2C1S8uc7/ajpnsQmTPBIG4eFxq6uSni
         vAGw==
X-Forwarded-Encrypted: i=1; AL+hErEIPfTzcG9Rw/wwsKWNiv4TjkOBbiyFb6H6Yr59m46RBSoVPK1b7NDeCAHhSMSz/HDEGpPscHlokE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NdQQFiMiQhm7xGDxGunXTEYdjbrP180bwgsWH+loEhqb1TLpO
	NYdgFEUyXsAk1ZPldm07MmyCJmwAyxrozu3INIuJdzBQyopVNhySrQlzo6Zb4o+2cP4=
X-Gm-Gg: AYBFou1TbRYr2vl3jqmsFU1Ce8KDU/VI7AGoz+PRymD1fhVsiQqox5lMDl7k4N1yVqY
	n5WPpYHRd2fRh+p0YljWSTNWdcWaEM1nhP+l/rI7/1jtdMFL6GX1TQ4qYkv0/NVhzx4hDtnhFo3
	mWRLS48HpKRDXwRAp17/GrPIeX2ijm6FsTf13VNNmTL3qI6iaytP0RItxty53wSv4wamCL8b0lb
	ccfJUOh6WvSI9uItnjdo+5sw1S2gmfUduxvsnkBp8wFPOV1DRGiCxWwuenY0JX2Q72stADSsJDG
	XDQzSbgCIcKXaWskavQE5QxdZp5CDQrkooq8lS3JwMfhe/D+s3Df7noSc15M7wK6Ybzvht6acRz
	5SWj0CB0DaxbQazRksxo9fU7+kCEtrCrhz+FB7i7ZiJpCmYtnGpXQpoBN2D7VUgmfhqxvdbiBXR
	KHcqOpL1qmIc05PgKKWkIL82o2YcXag4tAePcSk+kO/SiAp/zCxVLvb+aDIfsJkviI+wCj79TOs
	4Fp9QnhXWwsCVnUYqDaMvRYOFqvgMBoWQq6nFHvW3RKf/74szWBy3YQBjUoyXFZ9LiLFEpegQPk
	hfXrdHP2+7CIKouL8tgdlwaSXhE1G9qlNrP40nj/qb88qM+GAsWbD1hzlcZU7fx7XUwpQl1iYO1
	rIALu3L9pV/vYE4geofqfy65R6xyKdn7DI4bgbn1R7YVgpoeAOg1himnz0MsqLjMh3s/2ZGwsIN
	dRFIawbpD5BUJEy0wDpV4le6uxxHEA5Weq/TYAeiEDdPVqeSrkdXzPePuatm8/lSnWK+F1iniUL
	DLu6y0p61f6oHJb3GUlny9lhYcWvUqTfg==
X-Received: by 2002:a05:701b:2810:b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b503124f1amr5429567c88.33.1794697342110;
        Sat, 14 Nov 2026 15:02:22 -0800 (PST)
Received: from [172.18.0.3] ([216.139.163.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm15078205c88.10.2026.11.14.15.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:02:20 -0800 (PST)
Date: Sat, 14 Nov 2026 15:02:01 -0800
From: Chris Down <chris@chrisdown.name>
To: Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] kfence: Allow selecting static keys mode at boot
In-Reply-To: <CANpmjNMunLgXHRqXgW3LnniCX50CLbLYsE3DpY7h=cuvu2vSkA@mail.gmail.com>
References: <auA7FdubFEDVPB7v@chrisdown.name>
	<CANpmjNMunLgXHRqXgW3LnniCX50CLbLYsE3DpY7h=cuvu2vSkA@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114150201.d428c3847d573be1@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Marco,

Marco Elver writes:
>On which systems have you found static keys to provide a significant
>improvement? Can you share benchmarks?

I don't have numbers that show a significant improvement. To be clear,
the hosts that use static keys have had it set that way since long
before I started looking at this, so it may well just be cargo culted
by now :-) Given that, I had a go at measuring the saving on its own.
It's there, but it's small.

 From a quick check I did in an 8 CPU x86 VM, a
kmem_cache_alloc()/kmem_cache_free() pair takes 8.0ns in static keys
mode, which is the same as with KFENCE off. With the dynamic branch it
takes 8.4ns. A kmalloc()/kfree() pair takes 13.3ns in all three. Both
are the same with either branch layout.

So static keys saves about half a nanosecond per allocation at best, in
a loop that does nothing else. At a million allocations a second on a
CPU, that accounts for 0.05% of it.

>IMHO, I was thinking of deleting the CONFIG_KFENCE_STATIC_KEYS mode,
>because on most systems, it's not worth the complexity for the small
>(if any) performance improvement anymore.

I agree, and I think the numbers above are enough evidence for that.
Deleting it is better than this patch, because all we want is one kernel
across the fleet, and that gets us there with less code. I'm happy to
send the removal, if you'd like.

Thanks!

Chris
