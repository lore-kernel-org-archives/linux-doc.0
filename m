Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEFC3E5ED5
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 13:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505540; cv=none; b=a4SFTUQnVJNia7zYpY+dURS0enyHMf8Pi4KfqA8KZxSgAxETN+9hr7R4WhhyvFepLtYAOQ1xL3DwCKxs9zH8swnrvH0whEGgy+e/5uAmgVZ3kTxmUDOlHWiVKkQ3t4ywKvcEST4oMF/3StUJLifOBlgiJX/Ct4DwRi3MYCk4zEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505540; c=relaxed/simple;
	bh=aFKpLXhtgadBepER+jv213UmH+cx7dVrSbjQrlKsbLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXz5tqX2+0TLo70qHFWFG+xYMgGmkH3kw3GJOdCC6niDzsqpa0VZHuZRdqzi3GxaDGacd/WOGSI2owtdXyvRFLQfgEB61TWghLGrcb1nf04/soL9hvXQtO677BjYnug6tHMVlRcYzVfRkmcJPxcWEOoOk2MyqOA96QtfNB0jz/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCPmQUpf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCPmQUpf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so50881925e9.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 06:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778505537; x=1779110337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=g/gsIqss6ka1gkZNbEHINXe4X7NBBNbHnrb2ir7Oq5U=;
        b=cCPmQUpfxONz5lgCLItoo6WlxwgkWI5ljm9u/5FSEzSFqgp+wSBUZS6Kz7hmMiONiv
         Q8g+RWMd2dt8+Bgqc24H7aSt3ST25KwwBsfPxdN6S29TKRJRGGMR4VpYqoQik0EhNKe3
         6M3Lk0bN+ucyrzFdi2v8/iTkuNKmRfTQ7oAwrOcGeGgRM1G69qWjWOAm8GAYVpM0sqkw
         GExThRNxDAccoGa/SF0Fa8apM+j9CCpOpiCJRWolk2iqHLTeZcRhgR0XrhJD1FXKbdGV
         HfoOFHHmocpUJ8AcKctOG3lPwr1TIWohwFgtw8mqQZP5GS8wrlN7n693ekByuPYRyWWR
         EDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505537; x=1779110337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/gsIqss6ka1gkZNbEHINXe4X7NBBNbHnrb2ir7Oq5U=;
        b=PbcLK0FyAsF53Klc5vcN0R6hBou0OQTEJhvwGZ+aFM3C6J4mGZBBCorRY0t8nTiHjs
         q3OfyzLbPoKcoQOVPsveeThruM2tgUN49G1K8l7rSkhZQ+pG+eAsHN/rh1s56idVIYwc
         I28l5U0WiT9jNe5TShqE4uJp7Y4U9nWi234WSdQ17hT1PiX8sW7JgHF0grMeCRvpVPjY
         fMr6rNMsRpsRQbDw4wqiXJ63qYyC04sUSyuUC8fyBNBpDtyMkiAiE4t08OyfSfQHh30U
         Lc7pqLur3WMrWdIapJY8D6ZoHvke5Fft4aCGjuz6NjTMfljrXVoWPfKcR/yRHYeHWPRF
         8ziA==
X-Forwarded-Encrypted: i=1; AFNElJ8uaBZY5072NGM5zj3jeYj3eAkTj352S18G7cihzvWuKtzaSLK5ZALDR6/aRn7SLQ9dek4UYO47kmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1IeFflxSw//rnt/KodEn087yXmtut7Q5d70u9Q/q9Rmm2alY
	VMTBQGmb10NoOV927RrTTRov0X7V2aftsLiFp8Uthym3lfFUq5/lkLo2
X-Gm-Gg: Acq92OGFDotgNH0lNqCB6J1f+TzjY8ovPSHkDzaRbJKb+yCiP6px9iwkuo8iEEINO44
	FJj/Hprr+PYhDlEP6FcPezhL9MIAYp9rqwVTdJQGwgl2Z321zLO8CbbqWOVTDyXhHB1vjflenzO
	ujOLk65OQFC3Qdy3ex5eE3vuKDtwQaI7Vf5kIVCDaLsVA0PUkwQ+7Rf7u8zsPuhmzeLnHgnQg2L
	ZtVmbDZQp9346Yum3Z45xn8UB3+KXq+Hv80/MuX+Hgb6AsinlSdRiFkZ87Gy73EkAZxN/5je2u+
	ptRB2pf6HzBg8DjmjjckFZCjAxeQ9/AluuC6fBE5V45LGO5Yc232DdlAngkR82OJ68zNkpV3rDG
	eLH6u6uvXwACqycV0jb512qS1UNqy2YOrMhVZMMF02Aih1BmwNgDrFkkWB8wDPzMK3FrhQSMkEn
	RZJQudXMrUJme42MKOfkqldfkg+KkIzCfw7JFnoEq06p5f3EjeVlnQodi5f30csOx3LKehyQ==
X-Received: by 2002:a05:600c:5306:b0:48e:526e:101a with SMTP id 5b1f17b1804b1-48e706c781emr158001255e9.12.1778505536621;
        Mon, 11 May 2026 06:18:56 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702ec426sm178326055e9.10.2026.05.11.06.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 06:18:56 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <0f65dcac-7c5c-4bbf-be2c-b1cd68c7697a@gmail.com>
Date: Mon, 11 May 2026 14:18:54 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] scripts: add kconfirm
To: Jani Nikula <jani.nikula@linux.intel.com>, nathan@kernel.org,
 nsc@kernel.org
Cc: akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, masahiroy@kernel.org,
 ojeda@kernel.org, corbet@lwn.net, qingfang.deng@linux.dev,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <20260509203808.1142311-2-julianbraha@gmail.com>
 <4579a61db0975b967e8063661be77bb439283fd7@intel.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <4579a61db0975b967e8063661be77bb439283fd7@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/11/26 10:57, Jani Nikula wrote:
>>  scripts/kconfirm/LICENSE                      | 339 +++++++++
> Why?
> 
> See LICENSES/preferred/GPL-2.0.

Sorry, that's an accidental artifact of the tool's current setup as an
open source repo on GitHub. The tool code itself has the expected SPDX
identifiers. I think I need to write a small script for preparing these
patch set submissions. Thanks for your attention on these RFCs.

- Julian Braha
