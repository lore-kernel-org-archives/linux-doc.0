Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE27A55
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 20:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762978132; cv=none; b=ckxYH7RtTLvpRH4FiZBkMnHMpqn0IATxGC7m7ZVKU7YgsfhpjP2WTAIwSk9VneJvmS/pCtmBtCihixH23bxN1Bs+khdpCbIyYYe8kRNn61qF8avPZqH66kCkSAnKUrS3QnFtali7zRIOXGX8uz0rfS4QfRuNf5KeK77BRamo8cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762978132; c=relaxed/simple;
	bh=0B2xRy3DtiRYJVW5uqqFoE1hZORZpikyOoZj3dabAHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPbfM2u5LzpTbHqdF8RH+ja8H6ihS6ZEr0GBYQVTK5EO5iogG+rNBX9TjD14D/oOitJme7Wco24uA9Gemtb5SD7U5Mwrh1GLQvt30KO/nCGm4jf/PmpGiqWfTcXpCp0VRZqu038VqpBgWqv70FI2BuHbS82/HZfS1SXRlCiC/yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qtu3eSCZ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qtu3eSCZ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso13625b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 12:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762978131; x=1763582931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arO3innaom8XEOzV6JBZdbg+gJkC7Ox3enKZEFIeZyE=;
        b=Qtu3eSCZFvMZUPvjYh13A8XhukWrwkl7R3hac9VkdsG4kawSlPYlcnBfSDD+cvDUdY
         8V1Gk0akSAFa1yV5OOP4TpTX8Ycmk4BgKVYzn3tEr9iq7fpCQXdOGJOiH2EP8qkrIgOw
         bgaJ4Q6XD6A6epeFBaZiWL2qSXeNjf+jtUdk4JEpUEOYk3+F3nBOP153kRl+QraXGT1X
         L7mMvVv9F+mRHqbPHNXIHi5uEjQOPqwbXQphprcXM/I+GdzYCdqCpTEO5MbDpL3CXVua
         SmOAMYQpq4uwW21jKs0uurTmvJfMp58knfaZRan1A6Zb8MIk+DJhdeen1TitCwfE0q/4
         O8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762978131; x=1763582931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=arO3innaom8XEOzV6JBZdbg+gJkC7Ox3enKZEFIeZyE=;
        b=oDEddQcEG/9fGuBdsBhcVKsyRL2insaBF09acxjk6KDXLLzr+FiuXn2f1HP9kPvHoK
         iMWqmqoJhxljPRzxk/ERbHJgtmHiUNlRuGlsFsHA3GK7S07beJMwejlq9af/wWt9r9GI
         caevHfg8zYEjjPx+m7WfCkSkf9xlhSmyb5DOQsoYRARBeoluSr+rC3i+aI6IgoJ+K4Mf
         ttS6yiRkDSkhhXSP/U/V/Y1n792vg/8t0tEEPXwVp5Us1dZZ+mcHDvYvjj60F8/qmzJs
         Mi8/hhFj7QkaVaqHKr90qYzgIBujfjD4jtn+yq1h3VC5/Nq06Z8kM5KaoV/wSPDDgfEA
         3HfA==
X-Forwarded-Encrypted: i=1; AJvYcCX3bncS7XOnGgVZS17jC1gXLjGL1s/TulmtjolDYxq8TVaf03kKvYwttj4RqAD8YHDqk7ngaBZ+ogQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO6JFdraHEB32HGg0KgZ+gJ/AbKLh4IzQwfDwU9vp76za7YHbu
	nye6eZCdPRenolrHMES2wOxPZb9Rt/UBkgNbu9FJgp0JyiTQf9jNwip6
X-Gm-Gg: ASbGncvjWnuZDAMOUZ1axOxa4WSSkx/9s0X1uMWwDSD0Vsv9t8hk98/5ueWC4TLkQtS
	/jLOOsTwjG1RY9ywp4/nqxPY7B7XfYzbGTjIBjMwR0phbPIwi0o8lI5FfpG3jiZr4810JT/PZL1
	YEchOqHNohOuKhhUQ+IfX8w42xSZMmdY7GvcbD9DF1G7HfthZvNk57+PmoMLn4SMHMbpjbqQJnU
	1skDSQtWQebpR/tzp3oqaEgMZ+kyFL8TOhdmnheI/f3zIF/EiUN5NrS3CgCH+hLPUkrJiZtums5
	aFODs7qAn7HPWaGnCZQiBODrzFewXeo79SjuZzEJSisvuty+qpSe3p7E7lf2drVPUuxqq+ZrYBz
	3jKY7U0xJuqzfmfUKnJgfMvnSmL1mh61LKwpedrARnqFhzMJ7Xa66hwqQkFJZ2K5Jr6pjppv1hL
	05CHiWfw9Iyoge
X-Google-Smtp-Source: AGHT+IHXkVLeQmU+R1RNhYpyxag5ZVsaYVozFw1cdOfqrqm8uZqqgBlwBnx8aFYxTtDQsPwukjdAfQ==
X-Received: by 2002:a05:6a20:7288:b0:34a:f63:59dd with SMTP id adf61e73a8af0-3590b826447mr6333583637.51.1762978130558;
        Wed, 12 Nov 2025 12:08:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc326f3e8d6sm115288a12.25.2025.11.12.12.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 12:08:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 12:08:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: ST TSC1641 power monitor
Message-ID: <1dae4ff3-1b51-4e30-b874-83cb9289efad@roeck-us.net>
References: <20251105201406.1210856-1-igor@reznichenko.net>
 <20251105201406.1210856-2-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105201406.1210856-2-igor@reznichenko.net>

On Wed, Nov 05, 2025 at 12:14:05PM -0800, Igor Reznichenko wrote:
> Add binding for the TSC1641 I2C power monitor.
> 
> Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Thanks,
Guenter
