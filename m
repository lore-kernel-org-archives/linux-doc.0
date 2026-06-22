Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8713E39EF0B
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119237; cv=none; b=XYAdMaJuWRpoZ/VcKaVrZWf5xmsJ1oYzXobOgm6YkYUqGpvdslgX4eOHgyN+qsdWez1ZhUTzvfVuYn/6Ar/3s0+SbstInKiE9Ut6mIzGJ7rca14A2ecE6/VbM9H0sRDHetFRty3LYCO1sl7bVZKXV3asPPdq9sCz5iZT/idWE24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119237; c=relaxed/simple;
	bh=NpHNaiRLNtNCkc5SPlHVRmlp8TrcZRVYKVSRt1U6y6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWW652/n55D6axWifa3s0/1Rt2uALuWs8rHoVS/0XCnRNtol0WwGT3kMIFKeKO30luEzJFG2AjZAH63E4qoLkBcLtTr4XXV+DShG/cpjewVNDUt8yTtQgyJtK+UYA1hpwfg5aeaI8xgpGwpSZUkeKe5qmfNXcoBDJ919sgZ4YCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkdPnwvD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkdPnwvD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so2782866f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 02:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782119234; x=1782724034; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WpKYeM7Sadyd/Iym5bxCNYMlAD0KCXoNph0pgG1QDwo=;
        b=HkdPnwvDJZFGNzMRPznXSkttAGgMUlaDL9A0LNLfdqKw4OkgyrICrQtOKpJpJaU/NK
         pAGtBQ5bpWHuKmzAZxSNM5GHwAO9+v1FcrAFCsW3MOQ9FHWrNQtpHJMnbp6CpzP51XbA
         uMb73Lag3mTWEG2lpULUd01G5gmpKato2GU0JT8424lhvimi10n3uy84Ef7zAUgw1s+w
         ACZYR0eqUqzs2WHN6IsyicqO7ja3Tuk95CRyT54mP038LDiyGTNdY/ETlWHtmnb5q/DU
         F+w/nILLP77JsFI4gI5h/WRa9Y4ihqqHFavhcEtNaYJinDfHqUti/f7zCwiYOrlL933n
         WKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782119234; x=1782724034;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpKYeM7Sadyd/Iym5bxCNYMlAD0KCXoNph0pgG1QDwo=;
        b=mf41pMPHjj8DjPxOiZOhMDnj5fWjeBzIYXCpXo/9amAwhsm3R9QTFX7Po+jOvekPBt
         mvtURi3WMnJC5yWsAndj7JZqEOMnq1ESLiXqVg2oMLAxzm3jPgD3sJLTkD3027iUAv/P
         WXsEHPd4gMAvIYRg8RG8As6qv2qxULKeHZk/WaN93KqFRAtyvL3XrYSv6H2TUdGqKbc9
         Mh2e/cRYiwRDdXTJORAVflq/NG7Opl4bzeVFny4pkuDnotY9xQ78SHOpbS4ujPqkiRnc
         EWW7rjFmd4b3RHQIIZgY+JlPud10zP+MlGT06Rm4jvVyU8sz+VGNITpkzbAYW58j5Fu6
         JeuQ==
X-Gm-Message-State: AOJu0YzFLX+U1K6GcNg9VXfeQLHjBdkv+D2Jhlok8QaYneJHZVWrdZJ7
	X2GrM9lRhogWS5+m+bCs5sPu3fn7GToLUUZ5OKFYYFOOE7RTjTC3jvBx
X-Gm-Gg: AfdE7clc3NkKufbuxeJ6Aje0QgxVUGnDMg/bhVvQp33FTkNGjDdK+PtVfUHyn42zrvi
	w6ACqItiDmPE6y3oK3v5aSoHoZFkQ0gn8JpdN18FieS0t1wUJZKSqVEZhKYlARrJ4ZacMZDlS05
	gMrBCt54P5gtZwXdwWs+2B48mA/cljRHA0gSFcVcbzuTmMCQCUaQ41pDMdT5zanoouWD+UpoJHG
	+EvYHSYOnQ82jx+peVDJtJ8re3dROOQnv+d3EwA0Z5JN0tUXLKnLb71AgzPhwglN5naOqJb0Sg2
	6EPJlYmPC1a7a9HedQTG+bUTQ9fqpruyv1MjcwTSg/6wJmkm2+b6WA0l6XXIL0+BxhuVPA3EfZZ
	uRVJ9irGOICikGc++7T8W900islV690/Z9ky14oJ/4YT/brsYbr73SE5ux4cV/TREyR6W77WL86
	vV6dIZ
X-Received: by 2002:a5d:5f47:0:b0:464:fff6:489a with SMTP id ffacd0b85a97d-4651bf5b6f2mr18829588f8f.6.1782119233555;
        Mon, 22 Jun 2026 02:07:13 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666678828dsm24176331f8f.19.2026.06.22.02.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:07:13 -0700 (PDT)
Date: Mon, 22 Jun 2026 10:08:16 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: ltc4283: fix malformed table docs build error
Message-ID: <ajj7aada43285zDR@nsa>
References: <20260620011833.3568693-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
> ---

Thanks!

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

> Cc: Nuno Sá <nuno.sa@analog.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> 
>  Documentation/hwmon/ltc4283.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20260619.orig/Documentation/hwmon/ltc4283.rst
> +++ linux-next-20260619/Documentation/hwmon/ltc4283.rst
> @@ -256,7 +256,7 @@ these logs can be cleared by writing in
>  ``/sys/kernel/debug/i2c/i2c-[X]/[X]-addr/``
>  contains the following attributes:
>  
> -=======================		==========================================
> +==============================  ==========================================================
>  power1_failed_fault_log		Set to 1 by a power1 fault occurring.
>  power1_good_input_fault_log	Set to 1 by a power1 good input fault occurring at PGIO3.
>  in11_fet_short_fault_log	Set to 1 when a FET-short fault occurs.
> @@ -264,4 +264,4 @@ in11_fet_bad_fault_log		Set to 1 when a
>  in0_lcrit_fault_log		Set to 1 by a VIN undervoltage fault occurring.
>  in0_crit_fault_log		Set to 1 by a VIN overvoltage fault occurring.
>  curr1_crit_fault_log		Set to 1 by an overcurrent fault occurring.
> -======================= 	==========================================
> +==============================  ==========================================================
