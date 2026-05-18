Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD6638F949
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 20:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779137382; cv=none; b=mXeo0oYYJVZKQ6hzR3rdJvBMhGCG+PiwB0DtIpt3GIcn9V5PN3pfjlSCeWz555oBdFt82OXwaIvoLTueMe+kSbVtdDACJ2SMM410QfyUlNYcWTOBtK0GrP1hTG5V+uan1Kl1za+ZezZSefbdU1cqCoTbEwLqfDO6sQLKWPNMr9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779137382; c=relaxed/simple;
	bh=RyoGwN7G9vQDOQNVZPxQ+HRgEPGCBHD6qVUWTvQXfgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvKrRzJdFcraLhnwAMnzFM5v3Vg5OT9tcXeKogin90ZTYkyRFpO363TRPXKmYlX6QQiY5PzEsPCED4X0iDBkP3rvyyfjINzQYD7wJN3RZaTGvp1CdYnSWXTcg0LTXOSH3UpPaswhXf3HGgCM7509l5qYN8c7xYugNIyrV8GfnGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=S2p2Gpjw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="S2p2Gpjw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488d2079582so26617165e9.2
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 13:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1779137379; x=1779742179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l2NTPpzDiFlBQXBmoJbzyiHW1xJm+/TyVqfGW6eXiWI=;
        b=S2p2GpjwTt4UoRQubG4MKIQk2vZVomn/0DBffu8gVa/lCpwcuI4nz4brOmYXlKV/Uu
         zjZtLq+csuxH74tbks+6GRVhkyAGFLdQs7ns/EK43zrSjQ0k1woJUxxXgYkwkvPnc5nM
         phEnexQ25l0Qp5BMDwmo8kSlqS1o7N22d25GHVhJAJQbUtJLGyG74kSEOvqwKNCqCbVf
         dY6oKNaPb+iavq07bxWSIXUo6p/A1/CVoatSEb5yzZfZIUbWzFeMJsRt6WsQBIU+0mvX
         B/4dRnNQ1yBihpVVIVrae6YQZHhYnnJvAT4d812J5vkA5by3T/K77QBTXBXM2FDjnTW9
         0gUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779137379; x=1779742179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2NTPpzDiFlBQXBmoJbzyiHW1xJm+/TyVqfGW6eXiWI=;
        b=mCnV/ajn+L6mi5gSgcscNzcSoutJXQBecpeNxumh5T/gFUUMRA7/QmcBTj9GNa4tLm
         dHxHGD7itNT8WS6WxwlKPasPAd4WY4nwgI/sSGdfxEdRc/Phbggy5A4d08Lxte2nEcPK
         rBZR+qbrLTDdJkvp8ckJUfldnVHAIBfyqUHG3pB6ZTgATmlA2HsV4tsXn+Z/pdawAKmT
         vZwrmlrIXQbFKe+RMj5/UwTIU97PGPT3C6wjzJIgfhfN6PQzdcnAhicA6/dGoAuCihBV
         N5v2W5vithKl7l/t/F/C8N9+UKPZHpAtTZjJwkUfipELg4clQl5JyCN33QcXp3bzz7D3
         ElSA==
X-Forwarded-Encrypted: i=1; AFNElJ/a1u6KaiRnCmiBUolmq84awrSuRhSfwZq+nloqk3FbnhLMh3x3D2+un0RHuk23BhNXau8tMqmdWas=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUw8E5ih95seEMTEICGcdvJ8G8gG5dG2HL3DFiG3czMImUFkfo
	DdZtf2Fl2b/wOrnd2pLFP2LDc4zIvdDeSNbej8+0T7zpWw0KG379gbGOYuGR3ejg0w==
X-Gm-Gg: Acq92OFUWzjoq3fsnrjeI1e8teOV8AucGsWFwlPm5MxkAqef6kEGZlnecaaGBMvQNez
	/hoiKb18RQ+50Cff/ApTT5BekokPh05OXpt38IOVSyAW2aXYfzki01iJSC8WmgCu7Yu94Y6Wdv1
	6GmBYnZYFXfOSRXP+wkMgEOyDSYfMCMguH/RY0salBWLLDk7pl4kT+Z1XcjAfSLNTqp9qeyOGIG
	2LF4XEwKyhBraQAK4tcWrLjJwR5cZyq+lPFasBlLpmgH/7nxdTqVLiD93e/0SgNq9FPWGAJ8BSW
	oovXEEFVFkyvfFecXduNg1n3vHm6j4lhniYr8hLgh9of8OoX19MbwXucJMrrPdaOrZBRGmUdo+o
	UOn/+8/WEkJmfDg/CRKeZbKuuAYr9BKNGawfFv8BsziT6k0ypnd1vQwERxL7OTCwNWKK7Ys5ACG
	5uDXReJoe8jm9hcx9fKTZisuc=
X-Received: by 2002:a05:600c:2d81:b0:48f:e518:d110 with SMTP id 5b1f17b1804b1-48fe651d7cemr158815975e9.32.1779137378929;
        Mon, 18 May 2026 13:49:38 -0700 (PDT)
Received: from [10.83.43.186] ([159.134.255.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm273208205e9.14.2026.05.18.13.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 13:49:38 -0700 (PDT)
Message-ID: <01dd7a1d-fac7-4e5a-aeee-cc8dccef41e4@arista.com>
Date: Mon, 18 May 2026 21:49:35 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI/AER: Clear non-fatal errors on AER recovery failure
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, mahesh@linux.ibm.com, oohall@gmail.com,
 corbet@lwn.net, skhan@linuxfoundation.org, linux-pci@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Lukas Wunner <lukas@wunner.de>
References: <20260518202903.GA641158@bhelgaas>
Content-Language: en-US
From: "Yury M." <yurypm@arista.com>
In-Reply-To: <20260518202903.GA641158@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Current behavior has existed for a long time and I could easily imagine 
that there is software which relies on the fact that the system is in a 
non-modified state if AER recovery failed. The software can analyze the 
system and do cleanup afterwards. Sometimes, if something fails in the 
system, it is better to have it in a non-modified state.
In short, I just wanted to preserve the current logic by default because 
there is a chance that we have software which relies on the current 
behavior.

On 5/18/26 21:29, Bjorn Helgaas wrote:
> [+cc Lukas]
>
> On Mon, May 18, 2026 at 02:23:36PM +0100, Yury Murashka wrote:
>> pci_aer_clear_nonfatal_status() is not called when AER recovery fails.
>> If a new AER error is subsequently reported, the AER driver calls
>> find_source_device() to find the source of the error. It rescans the
>> whole bus and picks the first device reporting an AER error. Because the
>> previous error was never cleared, the error is attributed to the wrong
>> device and AER recovery is started for the wrong device.
>>
>> Add a kernel boot parameter pci=aer_clear_on_recovery_failure to clear
>> AER error status even when recovery fails, preventing stale errors from
>> causing incorrect device identification on subsequent AER events.
> Why should we add a kernel parameter for this?  How would a user
> decide whether to use the parameter?  Are there cases where we
> find the source of the first error, but we *wouldn't* want to clear
> it if recovery fails?
