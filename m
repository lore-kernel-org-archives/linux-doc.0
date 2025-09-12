Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAC63D544
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 04:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650788; cv=none; b=FP6euD4PfPkKj/fjNrPpYi2JH9egMo8Er/GXkPk5BFzuST+7tbG3XwlIaHrDOw5SOgIt3HqDfqtEph+gklDYrr2ECl6u66GlJkasFdbbZTfUTWcXqpjaJ4OUt2awldeLqDT1bFuuijscxMHfOaESSdV+DL2RLJNe7GoX3hD2Rp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650788; c=relaxed/simple;
	bh=+JSxQ+gaH1zt0MkLtqDcrldmuerhcNAt6ZV7U/9yqY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fM9ZTXHmGXvSXvcFj5C+lWQIOT370wCIZrIHZq7eqfhFR+ARbdywqeq58fc8uTEqN+ouDRt2kzquLZGq1EvoXAa7RcBqCzUdePSi2Q+NOFFIjrB+ptVeSDyjuHmUItZk38IHyhE2CMetuHJl6zOZCpO+UmsTzd7Sr6LxCcJj4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQeubunF; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQeubunF"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24c784130e6so16867295ad.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 21:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757650787; x=1758255587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6nKvu5cfJ180DRAKFjFgHBVhF1AV98rGP3oTY8bGprQ=;
        b=TQeubunFiZqZDah35xyrbJzMHyCGufiq99Ofn3iYvwDXiL5YfJU37kd51LGaHyCqIa
         8xkJQeyGuROUhIVw5ysh16DZwlJzevmLYIOyUhZ+2f5jlP/N4p4uxwP+hjhLiU6glA31
         lEuTOtaHJ3ATn3gn4jQa/zVCo2HX2JwWTdqA+pub68z8Pnwq80e29H9JPVAW6QUVGtbC
         99kYM1gXLaC6DsV2YEKBWAY5RWPbwMQ47E7i3av0D3JSCVS+cxLlxZir7uDioT4YcgjZ
         hOoRB7fJrpo1N+LND1+a58IXEAxomPx4qp2N8pbVOtO5tzoiFifs3PHnkmFbrHLFEVb0
         /NUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757650787; x=1758255587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nKvu5cfJ180DRAKFjFgHBVhF1AV98rGP3oTY8bGprQ=;
        b=hYoBGgLXDMGgJV+VxMzOe1IJa3p0mHlfkXHLm1A/4wiodYsBgBWe9XVRm3BNvvOgwa
         XD2aGAm1zh3OoeFkxGKGcryNerGwGATAmNRsU4CL5E/m0TLfeKfCEixYGVQo5I5YF188
         YfzIsgsekqbNFzfrWkoI/LU8a7qv6YwLSPIqZM/jI5GdfhahG9t6VYbEWpgwbXT0h2oU
         jXNGvP/4VzpdicAfarizCwLG+dgI0X8FXjCp8ID+tuN3rfQBpPRmobeqypX0svrQ90Lf
         I9vwEsCAQNiyH89aR6Fyr1ZzfbRxww12G7INa7PjtBVpnOEr3nFEi/gkEqyiwy9BP+tM
         w9YA==
X-Forwarded-Encrypted: i=1; AJvYcCVCir8Y8jx3xrbPLqx2veMpee8TcQaGuxbHSiiLAcAxbvTUJk5ktlNZmFnYadi7S8eq4ElrKrMolmY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0jgwus1fN3c6PyN2TCrjoyOuVQejq9gJ1PuN+VwWhzBjslSo4
	3ic9tUPUfzSRtda/yC9xmve5bLEThVcl3GLIymuTqNehCh0zditIYHca
X-Gm-Gg: ASbGncv5UU6G4YXjfcInEYQewOLqg0zVFlMg9bi1+zk7Mazs26puG77iAiIYETi6dvK
	rAiT8k5fffGHd0g95c9qGCYpjrAAJh22aDWlAT7GzkSEZ45wVwcnVJ1GXqlDuNLai4+EUC7G3SU
	rg7Vmalhg2XsX5/Qa2/+wlFMZKsnxyWUbtCMB3xhykHddw7e2NPMmshz8bTtJDLpP2vWwxNmEuC
	8L5oY9QQENRH4bRbfHPpfq19OOVsp7v/pN4znZxaTW5bAmidcTJsWO2QCIIXBXoc3L8WqrWz7L7
	9GwGBMd0hXZOnAHzBVh8o0gWqMGCNKxfDqEOVFiju5mKYMf382ANnlycDF7o1sr/axZ4diy6qvW
	iYK1lLmgj2HBrJESEAxRn12+k2mFfL8DOq/XC
X-Google-Smtp-Source: AGHT+IEm8DAmJ1SQii6dr3UbWWd9Pal3Of9tFu8U2LJtG2TZhT5L7kA+tBte6WgeHm26m9BBmQd6nQ==
X-Received: by 2002:a17:903:1ab0:b0:24c:d08e:309b with SMTP id d9443c01a7336-25d24cac50fmr21771995ad.15.1757650786678;
        Thu, 11 Sep 2025 21:19:46 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84957bsm34884335ad.80.2025.09.11.21.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 21:19:46 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 41FA141FA3A4; Fri, 12 Sep 2025 11:19:44 +0700 (WIB)
Date: Fri, 12 Sep 2025 11:19:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kenel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: Re: [PATCH net-next] Documentation: ARCnet: Update obsolete contact
 info
Message-ID: <aMOfYJgE-pKSAbWc@archie.me>
References: <20250912040933.19036-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250912040933.19036-1-bagasdotme@gmail.com>

On Fri, Sep 12, 2025 at 11:09:33AM +0700, Bagas Sanjaya wrote:
> ARCnet docs states that inquiries on the subsystem should be emailed to
> Avery Pennarun <apenwarr@worldvisions.ca>, for whom has been in CREDITS
> since the beginning of kernel git history and the subsystem is now
> maintained by Michael Grzeschik since c38f6ac74c9980 ("MAINTAINERS: add
> arcnet and take maintainership"). In addition, there used to be a
> dedicated ARCnet mailing list but its archive at epistolary.org has been
> shut down. ARCnet discussion nowadays take place in netdev list.

Please ignore this patch. I will resend with correct LKML address shortly.

Thanks.

-- 
pw-bot: changes-requested
