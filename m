Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41E52E8882
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762161554; cv=none; b=pCBQ2jxzJ3HoFdqtPCX84uBh09W/1Wg8s7xbn0hnOO5Q1adZO8XNcJPwoof2hSS1J3KEjbLhQNUMTzYpQekX+LkocIqv8LTAjxH5YE8XjAQlj2V5VCoz1I0wSwjWJYbwrPI+vlakOKmC9zzjRWFMQRUVQAw7nWTyaU6Cz/YsZ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762161554; c=relaxed/simple;
	bh=0Y9caYOqSW11yivpiI46fzV2GqLE4ZF0InC9uXM8/Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsjBzJM5N+OQVqX53T+4KzXUnoAcNgk8AuvZgTwzR6tabcS6ejWzHzUZUMy3eCYZ17Kfi+qxsre8m93BwJhQ7RZtNOB7CPkJ3KIaYcfBdTDfPd9ERKwT8dvGbbGNQD74AYYAD6QaW0g6pvVTHgJ065DCBubto3ld/wlISzIk/IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A4XDX3no; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A4XDX3no"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47721293fd3so22262525e9.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 01:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762161551; x=1762766351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ynz4s33e0TLs0d6hGvRQqkDSiZ1njMSQRICWUdMFEU=;
        b=A4XDX3noApDwzL1MuaWiwkzukhdKkVkO3pb3TyJc0whbOiiYMgnE2/F4HG/IcE3JQK
         kW4Pt3bSbpiLDgRaCJmRVcersuoR5hYRlam7pqJ9Tf7xij0Yk8E8M4FuwgjIC4O9aZxP
         8WD2Q9H+HufJj14gT66qpDnmYuVGN9VYvf7KxA3/uy0N5jXM6oM+VJDDW+GvuQSjrDAO
         CB4Ymfyt/5gJfhmOq7HH73uWpPUVRkaCAX/C4nM/pozv4peaUiQlumVs1UXsVDo2htm/
         M5ZufSct6XdrodB6I0yX/J0SCLgYUYq0cx6LEaGPXMXfFKtrXafW7S/Zc76WmbqIK5qi
         Geqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762161551; x=1762766351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ynz4s33e0TLs0d6hGvRQqkDSiZ1njMSQRICWUdMFEU=;
        b=EBNmlUOfK8j1yzYxizw+Dp6LsEu60KQqAepCvrYz33ZlJ35Cid+XagzqocQQfLTCFW
         U9b9xn0irumhVFiiXZ5luSxor1xLjYAjcmQcANHUDRVMVQMVpWnxsr1Ncez3FzQUU98K
         gX7GKSHwfolx0jtwHtUHxXE6qNRU1JHx8TbHqMBv2oIgrSePkSS2jhH78c+42k6ZHNP5
         +IO6tlDCNBDZCVathPwtWrDMIgesFekk1y9/j5mKSuTB2FtSOsZ612zcRjHt4A5Vu2tG
         VUwx00JiR+1hDcZuZVlbmluMDku/O//StrqMdfHxztmHFg4zWWjMQmJKW7m4pAPP/2uf
         IhlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXNpWZPrjBRAWkcYKQBsgOBJ7CK02B11wvTgF+fj6RApCWOXXrLqcqAeHskdpacxkIfZl0ob7T5S8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4MjtgWStNWWiio/2dnHjoZD3bgVjFAhiOJz748au8ARUlShqo
	vPWVj2pGbKEVpyn4beMf4X6RKW9lXV2OeJ2malvhBKdHkoyvk1ieH6GdvSlqaC7U5x8=
X-Gm-Gg: ASbGnct/ycfGZzjAliZ241AB0raAfPXFHtuClfCQ9yG4xyGfnmc/F6JgLuQC7oUsfYW
	67c6mDWOUg8USsxh0dKF67jYPGc62A0fsvLY70WYz6Tn/lDJ2JI1E66PU4S/wr0fLt9UEjRc6PK
	CFLkAiAZsuGVAo9l87oj8KAzUpP44Qu1/HwsyHhrB1Gpsu9ERHdLfBdI1vWX9oPvjAhXYtOzcMv
	EM6l+R/G4khaOKJbMfoZRiEmhaZauA3q7hfnCgvOrGu8ID4mLZwx1EeUYFbjJkaHUAS/K/OyO/2
	cw5fvWYqowDjGq3lmecX8PULE1tGWzImnl5DxjRTcrGWltl3z+Of3/oKrre7qSVm/kq11ejFD83
	cuqYwOQKC5R9zyVfUp3Az/raj5YIQJAOYBjxkuiL7NRtYf8w9qQGLDmi4L5c47Y2UmNTfHO3H3T
	is8T3beUm6uZgqFvpN994m0w==
X-Google-Smtp-Source: AGHT+IEWfWVVzQFxN3DAZRcF5k08MxsMc9ZYeQ4H54jSP0UkuFE80X1DOa7SdsC7jiBDXkya412Xcg==
X-Received: by 2002:a05:600c:64c3:b0:46e:2815:8568 with SMTP id 5b1f17b1804b1-477301041d1mr109894515e9.10.1762161551158;
        Mon, 03 Nov 2025 01:19:11 -0800 (PST)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429d1061efasm7626939f8f.24.2025.11.03.01.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 01:19:10 -0800 (PST)
Message-ID: <7301b0fa-5463-498f-82a0-f40bfee462ba@suse.com>
Date: Mon, 3 Nov 2025 10:19:10 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ABI: sysfs-module: update modules taint flags
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251102060458.517911-1-rdunlap@infradead.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20251102060458.517911-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/25 7:04 AM, Randy Dunlap wrote:
> Add missing taint flags for loadable modules, as pointed out by
> Petr Pavlu [1].
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> [1] https://lore.kernel.org/all/c58152f1-0fbe-4f50-bb61-e2f4c0584025@suse.com/
> ---

Looks ok to me. I would only move the "[1]" line before the
"Signed-off-by" tag in the commit message and separate them by an empty
line. Some tooling might rely on the tags being separately at the end.
I guess this can be directly adjusted by a maintainer that picks up the
patch and there is no need to resend it.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Daniel Gomez <da.gomez@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: linux-modules@vger.kernel.org
> ---
>  Documentation/ABI/testing/sysfs-module |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- linux-next-20251031.orig/Documentation/ABI/testing/sysfs-module
> +++ linux-next-20251031/Documentation/ABI/testing/sysfs-module
> @@ -59,6 +59,8 @@ Description:	Module taint flags:
>  			F   force-loaded module
>  			C   staging driver module
>  			E   unsigned module
> +			K   livepatch module
> +			N   in-kernel test module
>  			==  =====================
>  
>  What:		/sys/module/grant_table/parameters/free_per_iteration

