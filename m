Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B7930BF6D
	for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227101; cv=none; b=QwxdZ3kbDpb3Ab1it9qEkaT5lpN21zRcu6iw3dwfcxsHQS6IfKL2U+KCp7Hv2Rglevz5oEh3Ypg4eokNLKaxKPFxd5ZenXwYM0WdpYy37V9e5DUCRGomGScKGC+PfeDVZyFJ60hF5ZxLkP1wQJR3E0/oaHNHceGHi7KPqZhd/4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227101; c=relaxed/simple;
	bh=fQGPL2wAp1su4DsErlG30e9PExo6Wj5zg3lLPe3cQYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owRvATkRS/3wJMjRO/A9d37f3fmXAwiVcLD8JprQYVFcSa5R4fYfMXemu6dY2FnAr6Vjrx/vX6rRXzVN8xDpLPsheilWNfvHXO96NY3+yiM1nntd5sc5q/hlC5Skuxzev/AEZ2S9HRkA0an73QePvhv9wahF5mxDiIA7CDegbiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bPUQUojb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bPUQUojb"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso6404905e9.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 06:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761227098; x=1761831898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FZkEHZ6BvBqCRscatYxdEEZ9hCJa4XN3mU8tPMYldOM=;
        b=bPUQUojbqNMf+pd7a8jp0Iq5T1YdHmEWH65BHLUcoEKzV/ZEkYDhNCobgUJiVSU8LR
         hgIWgmPhJl4MpavoNKM7F+CxJNMDwpXQM8eZGR54YQAwwagoWvczqahdH/C082JPEZz3
         4Ks3QKiSabs3FPt817A3TtXWuLokBL957krRxWAvhQieiJy57vGWleyQrrfomxoVrVNY
         1cXh0+a7aCH0RPiOByzke4Hi6CFS92NkzDEKufP4YcA4aGFUiOQiNPAC/EyEkJMmILDS
         KOxJnAlhijLvQ/tYql3+eXk8odU6vJsVc/DolSnH0LrnDnRYzQG+J/eTq8SaVd6ojM9S
         2WuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227098; x=1761831898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZkEHZ6BvBqCRscatYxdEEZ9hCJa4XN3mU8tPMYldOM=;
        b=FfCoMsBZHgjlUURSZrFILTapkS/0F4Fn/YGwD+mOmaP1g6EE4++Y71F14i6vQ3cy8T
         ynvxwkXvWaHFXx59gEocaUqzd3B8W3XblmroSwhDo9OZhdFjdrA3cyGv1lm8b3ZbL1IR
         7LdJPoqs+uRYuRiWgniHcTSB10Ms+sTWpkSNsDB+g01GErKj67tmZvN6FKf46Hlsar+U
         1VXfKJW/322XBtIc+Gl3nvIH6c1HJQ3pD+TApg85CUKDpvJ7Vg4j1rrFOKwKN//7bLkh
         O+Pp6uPz1Ai9rNQb1+wzphxwMABGHZohWdx5BiPLNZRZr3ae4hPJKRKYcaQ789n5eth8
         K5wA==
X-Forwarded-Encrypted: i=1; AJvYcCX0XnUgiLITrJVNftMYOHyrrJ+Ht52YO0rqPF7jdtsrjqGT/+c3liBSxGRMIS/WwvK2okK8yXT5lSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfheRRS+xwhKn6tFRSC/HOJV0kyLLhc1ypDr/QDfGYTW3zoBPq
	qenKXHHaVZRcU65R2RqVECgiL/NnUmBtzuYEWnk1V61/pcShNEg1J6M956cSlhZKn+s=
X-Gm-Gg: ASbGncvnHN07SkAIa3vKVuFYJH1aaf3ppAGwJGfrW6AJVHz4Bsu5fePjEPbjHD7Zo2+
	ccz3SiBG2OnKykTJcQ/LjFf8hnKzqqrlcJGaAXiitWNhpyHA61bnnSywv+NsoWACJObJ7UBQPON
	gsv+jyT+RO5NYXWxPyYO7x9f5Do/RcxzbivSQvuNGAmtnJL+lhUmITzwWQExW8Dn9gTfDY3kFWl
	GMq1TQkHI6mcd0JjunKSQpewtAziKDTBX29vuiw6FqdwGXqAx8smKbzovaLbr2Zu2ojnukG2TnF
	uZpa3NLq6OSzmPAJkIgnbJtFdFdo3GmwskZ1guxsrxBjZanOl2gWm8EI9pVNafL2ID9iqmMyP+C
	fUqEz/yuzgRO3BybGMzvTt2NRtkKESnIEV43X6Fac+eKwVrymiDBrsF3lP0i8D7XGR66cH6G4rQ
	w+/9IQD5Km2+BRn6pisU6rttu58ms=
X-Google-Smtp-Source: AGHT+IGPd+brTs/tr9uigSHWLaHZFIfinUl3f0FWfAgHyxWRy8RvOdRx08VMDoZTA6McwENXy6a00w==
X-Received: by 2002:a05:600c:458b:b0:46e:39da:1195 with SMTP id 5b1f17b1804b1-471178784d9mr183926935e9.3.1761227098250;
        Thu, 23 Oct 2025 06:44:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475caf152absm46879295e9.9.2025.10.23.06.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:44:57 -0700 (PDT)
Date: Thu, 23 Oct 2025 16:44:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dan.j.williams@intel.com
Cc: Ally Heev <allyheev@gmail.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Hunter <david.hunter.linux@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] checkpatch: add uninitialized pointer with __free
 attribute check
Message-ID: <aPoxVqxevopRpPu1@stanley.mountain>
References: <20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>
 <68f7b830ec21a_10e910070@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68f7b830ec21a_10e910070@dwillia2-mobl4.notmuch>

On Tue, Oct 21, 2025 at 09:43:28AM -0700, dan.j.williams@intel.com wrote:
> I would go futher and suggest that the pattern of:
> 
> 	type foo __free(free_foo) = NULL;
> 
> ...be made into a warning because that easily leads to situations where
> declaration order is out of sync with allocation order. I.e. can be made
> technically correct, but at a level of cleverness that undermines the
> benefit.

To be honest, I'm not sure what you're saying here...

I have written code like this.  There are 515 places which use this
format.  I think it would be a controversial change.

$ git grep __free | grep "= NULL"  | wc -l
515

regards,
dan carpenter

