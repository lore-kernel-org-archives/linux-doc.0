Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F7846D0AB
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731706; cv=none; b=rJa4nGE4KtoH1tj4Bk2Yll1w5IyeqfwyrpC5IKct6cQDythgipusP4Rv0plt029jzfIzH2WMhXLgoZgBJAsuqbvOerjcHhkeF1JGQDdJLSSXzXQMPa2UwgmhXQrglN6MtVtb8AMFvMZVmcIOn+a2Ks+e3rq6uIsfbnb4Vdz9Tdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731706; c=relaxed/simple;
	bh=xEj4tFEVVKEw6rfmqLoEpJmSB9jVUAjZq7TGgem5abs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrYAk8z5c6OP6CxZmTu3SJUWOzwVF0V2coNxHmtKocWfJnL4yigQjW3KgWNCnA5Y3EqgKq7Yt2xRy0t5wa+500rwqj46cjjmdjCbApFvzFMvA8q3TC+sB3xVNQStF+UeVSI40atdGrK8cerC8Ffua+bYrqqp+n8VDnwMWQosmmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qzu6unf6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzu6unf6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d032846c95so20055305ad.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 11:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786731705; x=1787336505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3wYwlqNv4bYiTyUjfLZEHUu+ZKFWmhTVkUqtF1X6MSw=;
        b=qzu6unf6KEABn5DAqviIinX1oANZ1RtVT4RaPUkStRhsyFItpWW8umkSoOSNJk1gG5
         I/RxBzoh6QXnQX4LO+WU8t2RqB08C0e+/7TCDljPRZUMx0+Tu5lI7OVI1ZX8zyQdRuN7
         1WPvPqZFdj9zatjFjhALSApq+NPfRA3xRXRgUUBF7H5a28RP7g8uH4VubtjB7sD6u4bP
         XmHeKaYGzmN9OKRAU7Q5RaRqGwAxvM1sPe+kh4sJjeWIMiMT2X1c88yqXhi8dEMob0lk
         cbvOmHcE7Mo3IiJxK0wqOop8Wpcgzk2eSETvywuw8ce8CXMkEE45vzCZRtPenJq3F2ME
         oiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786731705; x=1787336505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wYwlqNv4bYiTyUjfLZEHUu+ZKFWmhTVkUqtF1X6MSw=;
        b=jkXp16loruQmP6VR9XxHrh6W+QH6xbIlfS3mhpt6ekUpEdTeKgb5csPaI3gBv7wnVX
         ARMqC78tSyJKArYyaQmS5DG85FnRhkzyYklT0241zSiQqFocH4LgNMqqL/YN1D2kDy6O
         MTTOPAqS3GV9ixLEALH4x9FOnKEgiVCnPlcqoZXNccTYiIx6DXjb/4y9ghOUKk4ofK0O
         RIi+FX7cokMa1Sjt5NnoOpp3FcO3BVIWD7LjJYwTl3riHOAvNK2Pjg5v3ol7WQclrdRU
         f1Pnnmhe1ICWLCGSV2kMtNLOba5QxLOVKG+LyX7j99yzBpnurJZ0lgGAWmGPOczKhtai
         4MdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfhXIn7+UBOkvyibOwaX6Qy2WMamPp5WJDksFRExnE34S2nng3+pFH1Bfvh+faJ5BYyDU+rIbRR58=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/0qHJAFGaqKOCUrVoF4rnr+0xdfwJlQDVBanXhJOikjW1kzVI
	1MonY9tJlIVuT/jSeAEe2ynhiZF8y9s0vM3R8cOONL0dVOoHq/U39LF5
X-Gm-Gg: AR+sD11ylywRv2wmhtLx4D8EHjw6SUcSUGSWfJeQIMDU+5mNA5b1pOo9slbed6tJOD1
	iZQ7m6QFLyYoLi4SyGqrYDMzf4CF3AI4fjOdl9KB57AMHZyhNgBLIiKaaMvb/HUC4bMxTkAlK/7
	7XXRywZ+edGxDdg9UhzXUejfnXEa2RJaekMwQHJLvOw+JKQsszbbl7h4dZ8TbA7DVSpFIN6KUes
	bm0FsLgw5/uNy4iODxJYIadX09kGoZx9+KlWMfgzPrj+6gtlpftt6gOdw3ZdAWBaVwcn72Vw20+
	caPmR4L5swX484V7hBTgfFNYaNxIUMcLtnLQt7UwI43fKSzKpCOGmReKaC0FG5oNOkzX0t+sIft
	FdFzD5Z3Qge88ZnaHh0/b2JpfmJ7qAL1ALc8BKJv3ByNxZfaNudjPUqDtwFYT+Sptok7p3rv8gU
	8VkjnTI4AHdOCkd5RBm4NnfJhvNfNBTTzwMyYxhvn5/uFWjMgPEGSuKay2adggg3C63rh3lqfxo
	A==
X-Received: by 2002:a05:6a21:6e8e:b0:3c3:64cc:311a with SMTP id adf61e73a8af0-3cc71d7a211mr10237708637.22.1786731704621;
        Fri, 14 Aug 2026 11:21:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387e49d3sm11747792c88.7.2026.08.14.11.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 11:21:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 14 Aug 2026 11:21:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arie Miller <renari@arimil.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III White
 Edition
Message-ID: <d81bc6cb-f6db-4bec-90e0-d41a46eebd4c@roeck-us.net>
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-4-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812103532.395049-4-renari@arimil.com>

On Wed, Aug 12, 2026 at 06:35:32AM -0400, Arie Miller wrote:
> From: Will Smith <github@notthatwillsmith.com>
> 
> The ROG Ryujin III White Edition uses the same report layout as the
> other supported Ryujin III variants. Add its USB device ID and list it
> in the driver documentation.
> 
> The device was tested with the driver on the author's hardware.
> 
> Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/10
> Signed-off-by: Will Smith <github@notthatwillsmith.com>
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>
> Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

Applied.

Thanks,
Guenter
