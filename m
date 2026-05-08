Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B5A36E497
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 05:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778219289; cv=none; b=ICscJzBYSVQSxV76HzhHO/yCSB+pFiVoNmZbIifUUxKdNbWgmjZqKPCqisFzZtPyxCwc/MMdHFtWDltyqKCemTHvDTj1phxGb1FZ068oCexBCXCeCCkJBElofe/d2N7sjh3UElnaeuTN0dxJamytDM7crZUrfmdk97l9zgzApoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778219289; c=relaxed/simple;
	bh=SUkWlFKmAlp8PM0AWeEekhIMr0lbsTtnjYR248qBtPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSdJPfrhnHn6WoqQ+e10z4C4R+iRevw0YK+7oPTB+WvaRKNpH56CmXUanfRLx+Sa84Q2x8B+lyUZ7cM074W+JDhVCsxsHPI6EA8LU9JE6Mc2sTab7TLkzsvWmRh8+LY2S7rJV/biaiAOdkZruCwTjuLYIZRW0taKSovsvC7jXQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbilsdWo; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbilsdWo"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-837dfccd950so739370b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 22:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778219280; x=1778824080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BXHCKiYFz3uC8EghuRIMhzyE/oqlvKBcArJ1LO8Jdmc=;
        b=FbilsdWoiigMLFbehSnYePgT4lS0S7CKZwfIoHiyujfs5EllhtkClq/fc9edftO4qq
         Uce6gJkTNGUtPJwJdyCHwLb1YlhxFL3YIEkOJWa+troFGsB6e1+dlrsMx4vO7n/6LpPi
         S3O6+uV2uMsPliGOUBd/IoUmCIm9qbA8cDQoyrtUBL20tKU8cfhvGHJvYNC9O9fSnlt8
         bwlFvgf0QqnjjB7C1jJOPF3CvZDk9x3xqA3xIuKNn9ro4nrELPDjv0u4Kq3b/ldyp2b5
         KUJyR+XCW+uqi4bt+my2W0dGxCKP0OgxKldKkwf9hYTM+6WfnsdwvU84vQwFuGCFyG5z
         U8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778219280; x=1778824080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXHCKiYFz3uC8EghuRIMhzyE/oqlvKBcArJ1LO8Jdmc=;
        b=Nt1Je2zDoi1QVkL5WHTEOgS5ldkiwF4QUlstipzS7zWWMk2PKIPDCAwYF7RMkwklQz
         zlxgIJOjP2YJGZlmYnRAM6kD6rDVIE9xcj2tGJOPtO5ZAGSF3VDEIScqmpP4is75SHCM
         hg8d34XdVHA5900DY3rTAuIG8AJ1mbdMcEe40bqlGMQR6cCL3oDKVer7i9mj31Beg+SB
         wPoGMM3GIsfuv+pakSNm9q6C4vEXShzESrjfH45JN/J/DlI7tQ7xtoiN7kB+UlpfuCTF
         52h//A4YIXCAwlwXz0tH/XZOsushBh1GdmpZVaiTUcO9EcA3xt64Kkp2ic/1jFyCFhir
         WbTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9VEk4Sy94UQ+DlaloobzPpkJfZtdMN2VyxvOehdmCrBM+NHPngLBEY2AW2PkkvrXiaTNXtGvcKN3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/qiaKudyZrByZwQ33M53iA5dcm86Pg/f8goFZHoUmXXukKfF
	r7cQdkQNkdFPu8xG8trsrkGOk/BrC1tDtoENuDITfReKh93GzYt+lAs+WnsMaHBmkXQ=
X-Gm-Gg: AeBDievZxdAXQ2Iq50vHZpejfLyf9ymbBveZMNvXWysMfiLI+pijWaGJvlvfSxoBHwA
	YRtCAwEFazMu6Ep9lWJT2trADEHXLpLcQmnnoD7BX6WLPQixn8Ohd2v1wkFUgED21YuUHnvPB8m
	WVHVjeGD9uYZpUspYWnIrOGsFmnO4gmQnPhwJY1mmt74mCo8M4BzaI/psZ/3ZLubOBT8GqTW61D
	UQYAKUbW4PL7oaT/RpjoTS+ij/ZHgHhHk8eoYS7f3qwpMsgCbM+4NYthQXJJveWl1G/aMcbS8ZM
	Ml81Gv0eardoDperykh2NrF5CPBL8gZJM4BvhdYXkl/MlNQRDss8zY3OxJx2tgyCivioyWMqVeI
	CkIiW3kezlbIJso1tcRrcCJCdao9eay8+QsG30z8ebRG3riWxXTokXHPbkUJL3nx/X4hKqY+GXG
	/3yNZv0NekrE1uStLMGx1rW58=
X-Received: by 2002:a05:6a00:340e:b0:827:32de:d197 with SMTP id d2e1a72fcca58-83a5dc60675mr9849040b3a.40.1778219280244;
        Thu, 07 May 2026 22:48:00 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbdda0sm11196302b3a.44.2026.05.07.22.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:47:59 -0700 (PDT)
Date: Fri, 8 May 2026 11:17:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sean Young <sean@mess.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: elanfreq: Drop support for AMD Elan SC4*
Message-ID: <nms5cy6tgpcteav34jdtjf5mbmidf6rwc2uuxxef456xzegsyv@54rbblkdjybt>
References: <20260507090107.10113-1-sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507090107.10113-1-sean@mess.org>

On 07-05-26, 10:01, Sean Young wrote:
> Since commit 8b793a92d862 ("x86/cpu: Remove M486/M486SX/ELAN support"),
> the AMD Elan SC4* is no longer supported, so the cpu frequency
> driver is no longer needed.
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
> Changes since v1:
>  - Also removes elanfreq= entry from kernel-parameters.txt
> 
>  .../admin-guide/kernel-parameters.txt         |   4 -
>  drivers/cpufreq/Kconfig.x86                   |  15 --
>  drivers/cpufreq/Makefile                      |   1 -
>  drivers/cpufreq/elanfreq.c                    | 226 ------------------
>  4 files changed, 246 deletions(-)
>  delete mode 100644 drivers/cpufreq/elanfreq.c

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
