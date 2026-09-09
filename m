Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A0E4302F8
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 20:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985771; cv=none; b=Ik8O9cldpkVHs/LwK1lAHclKsZOZH+BsNtOub9P6KqJQXNnJcmCfjSOVBAJE2i/pXISIFw6zf5S0JNem7Q9vBXmp5kWmbKNeCvRjlFeDF2YldJhe+0LhFGd+kjeiNbBJ5XslDuQIuOWoYS14cpMUb+lzHwFTM+nBPJKcDwrYa/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985771; c=relaxed/simple;
	bh=z+0tLgyCRJJAjKpetPBYp4AGbyWgzkXH+IurDgPiS78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXXbx1RUsqhVmI/kWoQvcU6oB+61SkZWqANR6lF0fITh0pb/ytBS5X3CoSy/JX+np874FZPrJluYT28jGP3Jc7dz9PjOc9N9AD06kA9CNLNsVhYxMBZ2G2KbkJIReTN02Lq9fQ0rWhdzWWGMb7EtaXcxJ6x6YoqY8wlC1H8WV3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gf870PZ2; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gf870PZ2"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1587241a91.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 13:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985764; x=1789590564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQ2gcX78zM5THDHJgEgcjT08beP/iAweGRJTqOXZ9/c=;
        b=Gf870PZ22XfKELmiVeXwwnlhYzjqtlrQXqQ9wBwHKGb8IHRo+KZeHFTaQ7GMirOi9y
         jLzq9swursocWRRd373GQMFM3dR8C9QAQyCzxnKydvS/g2Ja+424sJOuRwJbl97+4ELz
         Q8tJPE6kQJvgmWWXJUGgrsBurIykQorLwCTcvgP5VtAEIMxE3Kj8tL5PZCupavsKt2mO
         q635xqibpof/pRz2ktIHUgojQFOchFTx9fmMCHpnUL+gUWh5+g2cDyR2zniaDW5YQnAZ
         DXNFQ7ArNgz8OIGkOgxnsrITdLBT7TMz/Hgl5D5e258iPZ+Sc/TMqAq7YG/QKwSdwbaM
         mtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985764; x=1789590564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQ2gcX78zM5THDHJgEgcjT08beP/iAweGRJTqOXZ9/c=;
        b=CMlRvbT8QL8xSmpqseshlgMKHbOfrTKrxgsLoy/9roiV/ZQTl+v4B3oX/3B9v0z/Qq
         EkGLbYwjtAioHOG1KYTgSTyWpaY6TDUy0eDqh61xJoZ8YmIlBSs6HRfzJlaRtP/HpVB9
         gjovaEEkmJWGmIYHspInK6K1qtfWRFrnWMCqv6MyYT9oJIZZiHQV+Mj1isDsEnkAFhch
         Gq0+izx0F003jqIns8jrVU38LHMwk11miNLBy8sTi3aNNDcxNUS3vAQzOaIUYJgxxZPA
         5EN/lix1WeOz23BwvcPeUYSMsqfHWT3X90anCIwDIAnNJqQBn2WorfQDqeIwvJV5CdBu
         AP2g==
X-Forwarded-Encrypted: i=1; AKwUvByXIZNnSn7cbPwLJMienw/fk78e695Jue1YQQKsg46Z3YFMhj89ys6AWRGNZ2lv7qSm15RexjFFCcY=@vger.kernel.org
X-Gm-Message-State: AFuF++mSx4TbZv+4YMBX1DPUoLnqpYBL3ooQMw8HTBDpofpCGP9dRl4U
	UWQicpAE0Ezlqpd9qoytLs2c5JLx7WY0WqQgVzHdOWdAwMcsPMXRgy7G
X-Gm-Gg: AYBFou34LCbkWm+xCRTXJDnHFsDoKqKg+vHgmR8hHlYjMaPGl3oQwubrodelI3O/68l
	dKdauCP/bYGpAMtKUJQK8+ktYt6heJE85X805bxELAWW2YMm5on71aNyM25I3yhCGvoKUveetrC
	+1b8RjFEw8SpE+Tr5UlY28yxVlCk4T0tv5MNLcSk9HoUev4MHOrey+hUOCmvzRHPMieBzCyC6Ab
	nBimV+B+P40RtUXjzyIs5LIpyerFkX5kZnFfkTbzTj0Nc+BWqnU5Gk9gSCvHEAO/ckrxjiXT4Q+
	nqTr+OvRCaJ9LOm0/0wPEgo8eZEUIdFIj8bSHXrgttOiJN+oLLITnwBQsU1zVTGviTeccnf/+Zm
	Y2bch+OnS1r7hDp5j+jB+CZUIO/EN2yyihU6NUHT68HcsBEyizGT5lr04mw3t9JkqYoxbVzNTyV
	GGuDj/6kF0/Q0vBn4IZHd5Xf4xIF19BJey1kNU8AOIxPCSRGpDg0J/BzJD7SLgmdS9T/2s6cq5H
	Vl8R6YSJWEINEiOVY3nqBU=
X-Received: by 2002:a17:90b:17c2:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39bac4571cfmr10334634a91.23.1788985764524;
        Wed, 09 Sep 2026 13:29:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7740383asm1159237a91.7.2026.09.09.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:29:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:29:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zac Lanzon <lanzonza@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Aleksa Savic <savicaleksa83@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus_rog_ryujin) Add ROG Ryujin III 360
Message-ID: <7e2e3c81-ac92-44ad-ad9f-19add2879be6@roeck-us.net>
References: <20260903004054.502171-1-lanzonza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903004054.502171-1-lanzonza@gmail.com>

On Wed, Sep 02, 2026 at 08:40:54PM -0400, Zac Lanzon wrote:
> Add the USB product ID of the base ASUS ROG RYUJIN III 360 (0b05:1aa2,
> USB product string "ROG RYUJIN III"). It uses the same status report
> layout and cooler duty channel as the RYUJIN III EXTREME, EVA and
> WHITE editions, so it can share rog_ryujin_iii_info.
> 
> Tested on a ROG RYUJIN III 360: coolant temperature, pump speed and
> internal fan speed report plausible values that track load, and the
> internal fan follows pwm2 (30% -> 870 RPM, 40% -> 1590 RPM).
> 
> Assisted-by: Claude:claude-fable-5-1
> Signed-off-by: Zac Lanzon <lanzonza@gmail.com>

Applied.

Thanks,
Guenter
