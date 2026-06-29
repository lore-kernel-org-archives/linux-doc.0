Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD131427A03
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 15:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748113; cv=none; b=XNAeJY/mNEYWFRaiJVahD9aSU8MKtqJXs8/0lWZ1YKh10DGYAPK5FzelyUH7GDSI5M/1RoaUn5Qy24BKKfdczSBHE58eofL9tMJw857DBC8qUvuWWEGgE7kQP4Njk2rBBjUVNN4odWk0j1QfY1kLi84HWL9CNBRzSwj2An+pra8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748113; c=relaxed/simple;
	bh=i8ONpixMujFX/WAcwrYwZhC6OCLzpFUm7/dL2XKRKRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VthXF9dzVT3taMNYRzzZv4vMtJB1A0TnnANo49FsEnHY8FPoExgqqBmoxx8fXpC2DKZmmvUuoNkPIP+DnF8jd8UWj9eEfWJlR41Tv9xSNKf7cEPdMny6a2stkjQA3eYlODndsANwKTtGdfup56aZYXcWtocsmRM7+kcpA3ym5jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmHhiotX; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmHhiotX"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3078e0dcd67so6087587eec.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782748111; x=1783352911; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XnfYZFFV0ryFVGO4RHx8uwQIWAFO9eQlXqtuzCiwiyI=;
        b=cmHhiotXAi/+1/XBDO+AngGh2lpfN0cq/Jo4ixTa9BY/pm3xBJ8AkhJlb1GqHoz+Iy
         8e0BNwz69DsFKJ8eUzNk//657bOzam6AIdg25SJlRsS+asTkP6v0xiyfRO/r1F3BNvH5
         E2O7nH3JZyAl6h2DtvyQZgRdffeBAKVqNFrQZiMdqSgt4mBQtBo33XZGgDTeG4Ri7Vgf
         2UFoRloJKJLX7N9jxD0mdhev7YpOOFutRt7Jm1EaQYDAwdvQFjoklk129vI8P1+ryMWa
         qk28TrJpOJbqVbyRbHxgBjmP+zv0J9fsh5jbaub8h8pjxQ3oDc7PNzVJk/JCVVzcw1I/
         xgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748111; x=1783352911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnfYZFFV0ryFVGO4RHx8uwQIWAFO9eQlXqtuzCiwiyI=;
        b=lRhzq7CLecXNaHpCWe765PQaSb6Ciu5kTKtRtgMtdKkIf0G8UTBnaGrG3jwQw6y7ag
         mEH4koSAs/n4FbgFBsZcwXdRSxclL3DyGRVJyFNmDiueAoghuHrNUBLPwtyG0Cz+b3bC
         xAE4DmHwBHmVC2I6L9p6ybHcYyNaqDWS8kfzpc+wOvosaTNuHasZSvqkjLXATdQ26AnM
         FcVADohsi3EAV6moRqkzcQopR4Etwd2wgwHF+VH4KK+GDeskjR8AsxvOliq6GqcgDkVW
         XjBYHX4IENgXOYXU3YJoKZg+lNWvDtLuM55Ex2h2Arhj869LKUH6fVm2JPTwAmW0nO6O
         kSSA==
X-Gm-Message-State: AOJu0YyeghHkCduLZj6lZ3KL8Fi8BHp4JgulNguS7nZmrz8zjgL8mzMc
	WIbjN4LERDjBsDMNLs5WBuBTwXJiOI3P4nqpHhqsICYjrrl5XSwVqcMZ
X-Gm-Gg: AfdE7cnmZXCS4m35pFFBzOEQ2eLCtkbdq8YObskuwj03rUX7kmxc7gIm0epgknUns8d
	aBeohEv4BA1lV1hLmOWvteDJPUVSKxhnSf4iwFBQHUp2/diOQ5i1yk2qHB0IiintPw2HDVruhh7
	p9rtCYzljlUL7k+7dDjhaM5xz83LElliwbagPSNvpdhJb0IeJsHk98mLevRWynI3M3fAmme5LUX
	F9GYAkwG+30j1LG18ukY0meU8fKARTduHX6FYu4q1Kgqfnzl8x8T8IZl0Q81h7meMgzztiCxBca
	KXabWg2WOaHTtr2hkHMWWDbWjJ3OAHuT6v0eriThxLGjml+DfbFn4CLWZYhjP5oPbj1eKquuxgJ
	GzGFygQNRG1SvRQFZZeVH4pF3gV8pRk2T9snvHk2lPU84MQPfHpMIPu9Xxjm4p6p5eGJXaaOhBu
	I0aEHvG7EE6yBlyqWEZAeBQo/LUA==
X-Received: by 2002:a05:7300:2150:b0:30c:472a:248 with SMTP id 5a478bee46e88-30ee14ba3aamr4290eec.32.1782748110867;
        Mon, 29 Jun 2026 08:48:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c664sm51583295eec.8.2026.06.29.08.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:48:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 08:48:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: ltc4283: fix malformed table docs build error
Message-ID: <b1f32693-608e-46b9-8fe4-8878fec580e4@roeck-us.net>
References: <20260620011833.3568693-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260620011833.3568693-1-rdunlap@infradead.org>

On Fri, Jun 19, 2026 at 06:18:30PM -0700, Randy Dunlap wrote:
> Expand the table borders (upper & lower) to prevent a documentation
> build error:
> 
> Documentation/hwmon/ltc4283.rst:261: ERROR: Malformed table.
> Text in column margin in table line 3.
> =======================         ==========================================
> power1_failed_fault_log         Set to 1 by a power1 fault occurring.
> power1_good_input_fault_log     Set to 1 by a power1 good input fault occurring at PGIO3.
> 
> Fixes: dd63353a0b5e ("hwmon: ltc4283: Add support for the LTC4283 Swap Controller")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
