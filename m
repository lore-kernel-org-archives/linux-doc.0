Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACEC2EC081
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774442973; cv=none; b=eT9+N57M/PxpBUjiU5nICqRNaqPdwO7HyYnTa+Gfm/hhOG4vv33tXbO+SBr3vkVPDNrDbAdUgzWhh5KmQpyEjiPkbt8Y8C3220ctX3EqlY8c84xaAPJz8TgTNptB+KiuvcDDELu4F/GIYMAjxCigMdX5AtIPoFldgx1DydvBvAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774442973; c=relaxed/simple;
	bh=0jbWB3FjVQp+P8Ybiw1JdATIo1RfpVsEkcvfvEH0fIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdi9rQmP6okhycaXqcUbZH5UM6K9DS46djxiqaf120pdKnbaeHnCfj2OO90B+a+Na2UQ1e28fLpwEtsbDgJp/p+eEUvHAva/0MgzQj5SwwOtymEFwcFsLa0chVVQlQKAZi9gq9Sa25/KPL17QSjxymsBnbDiNA7HmNrSR7jSD44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QsQTBQ2R; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QsQTBQ2R"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so789235f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774442970; x=1775047770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJ4RwDdYC7l5LX4+kxPiqchKwdT0zRAfuYVx8dHTGTI=;
        b=QsQTBQ2RkrQE7IMnUQFMVZf91MzfH5VhYOdj1f6Kc0qHkUjbpodcFhfNqvP7j00lIL
         7+0NS3ce2sJFLeV0zP1vFfjxIhzEfBOaUThEj56njyTJBz08hVYC3GsWPreyMX0/s+SI
         bqiSjb8e/MteSBDYDfZ88BtS+5N4oP3+lCjFDol0aDha2po5mM/macY7Gqc9+Qj7BF1Q
         Q9kC8G6jUxbYVPT/E3pXanzVD1QenpTOeoh5HahyBpCrlKLC34dPfa3dBGd4ozO0YZsi
         7nw+Vgi2bbhvnadrOePJ2jhdU86tkN+eJJiNDLdUr890bBTyvTbkDcI5FEOSvJZkri2v
         oHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442970; x=1775047770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJ4RwDdYC7l5LX4+kxPiqchKwdT0zRAfuYVx8dHTGTI=;
        b=bMeQzk4b1jzwxFxafIRpKnuTINJBuB/lqHvldurxepIhhs+nnUst/+xi6HXCEfTeWm
         x2SstTScyYBshqKuiihnQXDVXh4/zkw1rQS177+IIjYHCQQ2gT5RQqNtjYLRu/Q8LOkp
         rkwpUZ3rVbN55/GBky1Ylbvv0H4dG4mbib10P6SZHLbYR6jGBm8TRkHQBb8DU8sHalOB
         SP3hrUv4QwA9QbPJErnqxMtS7ZepN07QzBb0AoBEQzS1M2h9tWDW2uv/kdDLeC3zGQlB
         UB7EjJMFa+Y3lpwKAcs/w36s/oMnFrvkQHNlv9EYKLjCPyfSCplco5wzGUhH4GxFFZg6
         Tuhw==
X-Forwarded-Encrypted: i=1; AJvYcCVDLNTyAIEdnpbGJNntaTXtRRn5YRb5PAA5owPf2aXF+/YxmYnNlf7YfR5tqPSx7FBWgCwWlHZ6Fe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQDa6ZDNIkk3q0TCUTjd0O0gm+BMErCW511GFtWJ9NhzMdyJr
	+RRjTy6M7w2bYYw7QZqnUYloWNM2TH7v0f9dl+Juhk3moZnOVJX7l0OFfmRf3EpULwU=
X-Gm-Gg: ATEYQzzyV/ZTmYQOaN4cTZHbdqRhtuIB8qNNcfrZ6iaMswh3rvxq5W1gZplrUNJWIN3
	prcMwbLwv3Dab2nKj1i9RcJ7nKhZxMouAO4o3F4S94k0jo+A4Lb8QJ0Wpofc0q9dnI7PR49KPMh
	9S0XfgTRc1CPFX0b7OeFqyF9HyI+iFAWAXSV7MmTi4gOhwwFkWcncH+BfI9tfUjCiKSRNylq6PQ
	pd/mZn1bWXV9tyvqVMuzuxEy6NLV3NyKCmUn3VYvrM7mFTKf5e/EyZWEK7M8yraS8APIT0tUBL9
	rHZ2ImagsKodZsMHA+knnYdz64B+RSQT300w6YteW4t1nVdNaeQ0mFTKUycjehd6Eo/Jx2jEGx6
	6DztjMgHGtwWVt5xLuI4EQiTXBjzZMhSmtGKex/qOcHjq4LwKaqrHwVTGsp+THHgfbB++la+RMu
	zrs9oV68hYEUYBndSiBI4l2mfV0jXy+xKteFhb7jtEJPeD
X-Received: by 2002:a05:6000:228a:b0:43b:4909:203c with SMTP id ffacd0b85a97d-43b883c881dmr5791312f8f.21.1774442970332;
        Wed, 25 Mar 2026 05:49:30 -0700 (PDT)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8508285esm13445921f8f.19.2026.03.25.05.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 05:49:30 -0700 (PDT)
Message-ID: <b83c9524-13df-47dd-a597-bebab93288d8@suse.com>
Date: Wed, 25 Mar 2026 13:49:29 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] scalable symbol flags with __kflagstab
To: Siddharth Nayyar <sidnayyar@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 maennich@google.com, gprocida@google.com
References: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/5/26 5:55 PM, Siddharth Nayyar wrote:
> This patch series implements a mechanism for scalable exported symbol
> flags using a separate section called __kflagstab. The series introduces
> __kflagstab support, removes *_gpl sections in favor of a GPL flag,
> simplifies symbol resolution during module loading.

I noticed that the series has a bisecting issue. The module loader
doesn't see any GPL-only exports after patch #4. I think you'll need to
squash patches #4 and #5 to fix this. Alternatively, the patches could
be swapped, with the caveat that GPL-only symbols would lose their GPL
property for one commit.

Nit: Please use simply the "module" prefix in commit subjects:

#1: module: define ksym_flags enumeration to represent kernel symbol flags
#2: module: add kflagstab section to vmlinux and modules
#4: module: use kflagstab instead of *_gpl sections
#6: module: deprecate usage of *_gpl sections
#7: module: remove *_gpl sections from vmlinux and modules

The changes look otherwise ok to me. With the above fixed, feel free to
add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
