Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC253B4E84
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 17:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792344644; cv=none; b=lZXQL3ptmB6EbQEqKkxTKRg48dnjc9q6bFE63OdAVpdzPyN5KAAJi+lYuIZnyVUNAT5jfbPB4BIHjuSf8OE8v/w8d/HzF55Cm6Do26Ww26WSql6ZOypileaUyY3WmMIjy+JOZCInjWw8gePR0EPyMApyKcc4SX2/8Ovnt2DY9Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792344644; c=relaxed/simple;
	bh=74zW7bX+zhXYnzIJmFSSuGPDBD3IIhvKVExVvMEfcu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nN7J3P67uGGIHGWH/Ll0edFHsBSdsOpILeJiX+OxDBPdg7puTFnsMIe3d8YbfOa7c4AKHlLD4al9do14wuKvlBq5It+j1qjJvF55EaQhyTAhj+hjU2eR7JjbaIMLwbawS8N/gg8L/IudbhYJPIP/yg0FSWAATS/xybQSnbtUzbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzen8RkI; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzen8RkI"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so924416a91.1
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792344642; x=1792949442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ixHYsvcVa+4o7T8DatH23CM41eHYBblIhIu3k33z0A=;
        b=mzen8RkIKqMI7TjU1lIdnHbzS7VzH+7+3587M2lrbdmQbKevP+rQ6AnGB41fZrMe7H
         1L12pFORyigwSzHMcv2PE80bQmuGJ8CXRC4/4pe8rQHzq9wUU4AYn6xhZp8J32UCTSsc
         3LnuDlph8caZC9YJdYoPVg/B+NC3l1mURD5MZOSV9aJKlLs5joZyl2PWh1wM8t5ibB8q
         tTYZQ+aKW4D1ZtAjQizYm5t63YwJ8lk6/ez9t4kz9MbpWgjAA2yaxzKBB422iL+5DJ5I
         n7mI+UF/yJPCgK/FEzHTvIwrawJ/d4yGcO+v1YGlca/rn05AmwHZIPDHZX2qknYMwdfa
         bgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792344642; x=1792949442;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ixHYsvcVa+4o7T8DatH23CM41eHYBblIhIu3k33z0A=;
        b=qx4SkS483Q9I3Ju+/OFfpvS8Z/4ZCFIpWpwlCDHO8BOEMhMu8dYxRk/xw8tTOooLL0
         oEuQ0bxZUWxZGcN036j/h7kARVo+3rxUiH5xeqAPXEz4FSe4nWB4GBIi3nxWz2sLC5kE
         rGaVoSNPzuqo+LRwPO+xyGaVDr97iqQxE6P3EnghmURRWZOHOHaHGNSJEUMnQR/dSBkN
         lllXxOi/1Z+OMrQlpXyl76R0fI0lglP8eaG0sdpmI2adw9sY6rTTrggrTb4dy8yIOrDa
         PF7+Wk6hSprW61iaNIBWVf7ykMYycOe/T767VPqtsfUxNRZDygVb/KBcZpJE4xpdwW5m
         NmKw==
X-Forwarded-Encrypted: i=1; AKwUvBxRs/MzJfXQQ5rNJVJnb61JrQ5VK4JOnqMpMluxGLGJHJW6F9gv7I/1DACpRWxDz12cTgOVsJs22Tw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCgUYcT2orjTO4hhqsGI+xJpo/+EnCwdwB0zRkGbd9M1+NVxxg
	ObNYnUqJ3DXLJj+sxDY2x/qs4+GokwCidg6r0dSzs9hkTAWHVzEA/NDa
X-Gm-Gg: AYBFou3dPq7A9SmqSrDBgEXCFZ2U/rWuRrH3QFlz0H5D4HpKDQzxdDd5Kr1oJFgkpWW
	zoy1NantQEzPz4Vlkny4YO8fltPoiTraV4DedWXGo/Jcu3vmwQGV46jtgoYj/5HbsUloiVg4Pf7
	DsXRzA3FONhFMS2Egkcu0Iu1laPusL/7ajmFlPEMNExN66HQ4BIgBOiVKLRs7tjrj/TIgTa5dTq
	kOxGuNJrgnkTl2IXu7DERDRWQJcJDZy7L01VK03NzVts9CPRLsXH2/4swU2vAQPxrvPDqG57upY
	Ue+MGNnJ8+n4BZlomAHbmNwvf40lSuCdKulG+lbOw1bfbRW4TPrM5fGkxTu2tz5tKp2Xlzwxsea
	0n1I2KQqhCsao2aga3KrfPpmpa3hqmEL1ZDLHhdSQYO9T7G3AD0g54gfDIsSbe2OhA9s0AHFxkE
	eG/hKzONPX1pMtSs5BR5CcLC8SVNvDrQW+z6nVagGuHB/sKrXDDRKK+U6zwv9BWoxGPbrTR3mxb
	gqvzg==
X-Received: by 2002:a17:90a:da87:b0:3a7:9ec3:ea0e with SMTP id 98e67ed59e1d1-3acef144e3emr3623867a91.22.1792344642433;
        Sun, 18 Oct 2026 10:30:42 -0700 (PDT)
Received: from [192.168.89.2] ([14.67.155.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acddc37958sm10649439a91.14.2026.10.18.10.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 10:30:41 -0700 (PDT)
Message-ID: <fe746c04-391e-4b7e-a5c9-7dfd3cd07913@gmail.com>
Date: Mon, 19 Oct 2026 02:30:39 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] docs: hwmon: Document the uhwmon userspace interface
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1791531025.git.hurryman2212@gmail.com>
 <c02aeee5b7e7a5d159d4df5baabe925e16814e94.1791559095.git.hurryman2212@gmail.com>
 <e77719ee-c813-400e-b49a-9f8a3b0e2e91@roeck-us.net>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <e77719ee-c813-400e-b49a-9f8a3b0e2e91@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ok. Then I will withdraw these patch series.

But then let me ask you the initial question that brought this patch
series: Do you think it is at least OK to add kernel drivers for
network-based sensors? Or do you think those are also to be subjected to
be rejected (or remained in DKMS projects)?


Sincerely,
Jihong Min

On 10/19/26 01:06, Guenter Roeck wrote:
> On Sat, Oct 10, 2026 at 12:38:44AM +0900, Jihong Min wrote:
>> Document the uhwmon UAPI for developers implementing userspace hwmon
>> drivers. Cover device registration, request handling, notifications
>> and device lifetime.
>>
>> Assisted-by: Codex:gpt-6-astra
>> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
> 
> I am not going to review, much less apply, this series.
> Exposing subsystem internals to userspace is a bad idea and would limit
> future improvements of the hardware monitoring subsystem. User space file
> systems are bad enough and cause all kinds of trouble. I don't want to have
> to deal with the same kind of issues in the hardware monitoring subsystem.
> 
> Interested parties should implement kernel hardware monitoring
> drivers instead.
> 
> Guenter

