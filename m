Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FFE32B12B
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163053; cv=none; b=aixP4TsxTR8V7ht62LKPqkVWUvW+SrW8/NO+hDZUXCYyE6TNTClZ1WOZM1CXTJ4ml+I2QZLAnTZxWz7ILpI/yatJEx7AtwZzBeQ996zhXh9JdcZcSNuKf2Gb4zaZ40K+v1Ty7FcykwJ+qbtSZ/d0RzGJ/CiEm22C97cYQ6wORi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163053; c=relaxed/simple;
	bh=Y3J288KadRqGlm+UcuDJg/9L4/0jmcklFppaaxEMwmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWxxqyijJUSEoXKkMfl5tlx9v7tMOzZokXIpteoq0/mhVHCDo0WdXxRPtqPjUwRMMCrBFDdQBozi+wnzCF9SIS/SS5UhKi2e180V815f96eDxdgwPfQZW6iFsSrltnbrc+q/JfJJL1C4nvFEZs7sjzh07+g9axGTnvyQPRvx7LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=graXt2ho; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="graXt2ho"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38deea72eebso3109437a91.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163052; x=1785767852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HqOE539hczEPQ6l8CZ3xe78XOKKvKZwkPFqogc/KFdw=;
        b=graXt2hoiBt8rz5lIXiYqCZ0uULwkK68cfnaQKv0/n/yyw80QTyQiIG8cpjdDAoyQV
         GwwtU0kzwbj7bzvZeQoJXvFxx8vTEmbVtIKUc5dJvcTEoSvIQym0nVuAluHNMVKH54WO
         Xd7/9Bq2qRmCopiFmZx/f+Q5VKBQ4DLC7D1Xl3BWJoicmq26h+8H6CyTVMfJxfH/xYAr
         nfCBtVbksjrPv2rkoz9kMGJob0nlOPP2YGcUdWloTL0B0Ap4Zj+b5uEwcj7FN7B4eYHs
         9O3zpvQqhBowa2f+Mwv4/2GMhX9MfWno+kUw9GRChftKxDv1zqOhrkwO4TyCMaQYfmCc
         u6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163052; x=1785767852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqOE539hczEPQ6l8CZ3xe78XOKKvKZwkPFqogc/KFdw=;
        b=M19ZbemXd7Acsvj75AYhwrFcuWtZUhbLIhGp+kXU5cGXGnVScjgyuOPOvonY5uMZ3K
         XcuMPHeACY8kFDaOqjJrFQc0D/9PHLqb8I29/KAHdeB34Ev/decGDuu0Hm3QxtMxyBzh
         WEm5GnQ9A48vgLJVCiwTvDhsdny2Pn+7EeBdyx+q5Vbxna4fQGUmL/wrLfEupLXVvNTu
         dlmq0orgZmYZMHXkzfRUAokcR17cC/IQ6I8Ud0EomBASFdZIz5HDqbNGKQsJ6IgkqG55
         IlMSV7pviPRPRHSjauueaNlIB+g9Wog6W8y9yKUuG1Q6xgE/MO3rvQj5wzWCefZ6X5Gi
         L8nQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiImFRfv6zrWXR7Q4/KOvl0GlZam8c8XXIcun9WO2rFqy0jz2g8IgaNUBBBXLLpW93E81b2q20OMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBODm8W2FVyIvQhP13G2uw5DuRyrIYDnnHrXSszl/yeyk4XFCt
	dOxnGHmCNjjjZR8lrcDV9CbLHWVTvbXwcLz0Cm5HQ3L4E+/LiLwoKDLY
X-Gm-Gg: AR+sD11v5yBxiPYaN9jwcIWZhSNwC8G5CVHyq623JhFt0NGVeXuZj8SekLyZyKr7CVi
	OmU5QFx5+Ubh/QnOY9erv0mCquTko+VN70Mlw8OaV/mqOnWCgTb0PsqehhnUd5R0iHCcY3zbaf2
	rawTxs4OlO7IWVogCRPMf9T7S/qVJXN0kDANdyVn+5otoqkyno7kG2NA7dlvhRIA/NxiSY9q5vS
	UtWE2q1+w6DSlUAu9doKGHe+IFDmS1UImgKEyeOOd0syxInsgggMFKZC+h1ogru8nUBwWjmYwh4
	kmiS918ca5rd19RZwd/pnSJ+Qn4mjp9AZ+7CVLx51+U5n1zR7qTKfubmrZG9owPUvDjHT6RFZYf
	kQ2fEtLIX8YA2Vjp/CxT+AVScrpouLxoVgu5A/r+T0rVuvrISUD5If5KWIwrlQZ6UAUNVba6zzI
	nY6q90tcPhRd8nzc3DfOEka3htVA==
X-Received: by 2002:a17:90b:3b41:b0:38e:76f8:fcbe with SMTP id 98e67ed59e1d1-38f296606bamr7946117a91.29.1785163051571;
        Mon, 27 Jul 2026 07:37:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130cc5ebsm71899726c88.12.2026.07.27.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:37:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:37:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "shaikh.kamal" <shaikhkamal2012@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: fix spelling error
Message-ID: <b263e111-4664-4b37-8e75-3da025fe6c6b@roeck-us.net>
References: <20260726065835.21012-1-shaikhkamal2012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726065835.21012-1-shaikhkamal2012@gmail.com>

On Sun, Jul 26, 2026 at 12:28:35PM +0530, shaikh.kamal wrote:
> Fix spelling error reported by codespell:
> 
>   supprts -> supports (sg2042-mcu.rst)
> 
> No functional change.
> 
> Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>

In future patches, please mention the affected driver in the subject line.

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/sg2042-mcu.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/sg2042-mcu.rst b/Documentation/hwmon/sg2042-mcu.rst
> index 077e79841d2e..431ed832d083 100644
> --- a/Documentation/hwmon/sg2042-mcu.rst
> +++ b/Documentation/hwmon/sg2042-mcu.rst
> @@ -18,7 +18,7 @@ Authors:
>  Description
>  -----------
>  
> -This driver supprts hardware monitoring for onboard MCU with
> +This driver supports hardware monitoring for onboard MCU with
>  i2c interface.
>  
>  Usage Notes
