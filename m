Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313506;
	b=2FApcevt5ef0+QEJ69cVG/iXJTfDDqpKtBeL+T2SCHVcs96vPn2ewcwp3A4Gyz1a8R2G
	 fSdju/TYgQSH+4yHsbGycIcSw0yOmwyYrx5Co3WfOROtYrjGVGLokYvOyfNes2ZyctOOE
	 t/6TyZJm9r4FXHRv00LG1DVVaQL5gqc1A40kTfXqCF4Qk0BnFR92W2yQyNmEP6OhrOCtY
	 McUG7JLcR1yQ1Oa4DT64/9LuxAjsKqaQGF6kefhCGd88XRh743J0oQmI9vUY4peQMcYWC
	 8QkCTGvUFwJewnQB4Tdu373AuDv8xQnbDNGsy4cGiId2nFnOv6cZtRefc7lvCTuDCgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313506;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VQa/zF/czqRgBTE3EecGrylKNQt9LYXwl13l8Xprd24=;
	b=XN0+KfOpZIQF2NCKsauSrXOQqKEEK7l5Lf2eC6PXac8xznReRTt1FtEp8kOXjIcXu6Jf
	 BxoBHomh2t9Lc1LzDcF4KW9xv0bXgxbkBtkqD0T+MvcfW0PqcAnAaa6FOYvMUNxGD11bc
	 bRkzEw4+DkExOTr8ae5Ol3pX06wGMJV5da3KNL5mKUqi9Z3/6/UM7FIMSToQNG0Jtpp5l
	 1D15bQ7hryz9PsVwbLfqiCJ5qDuPQ5zII3fXttH9p1r/zfQBHxLqlgkzbtgIuE48WmIa6
	 Gjwnbp5b8pSXAOkd0cYKTAZTq1VKSxGiKgT8Q48Nvrdsb5PjXxVIhomVZ1aJijJYEXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gaZ+IBrY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OZ5PTgUU;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5C0606A321
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 12:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB5C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gaZ+IBrY;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OZ5PTgUU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794313504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQa/zF/czqRgBTE3EecGrylKNQt9LYXwl13l8Xprd24=;
	b=gaZ+IBrYaGjCsDwNYEB6oSb7EW9VO14HBJyLO59SM4yoyWfheDygnM5cEuoCQInMwVxdkS
	PUMGXLOQ50srcwtPyAJ5MYfAvsN8jVgz/uo8mfFoiLj1uHey8Peb/xNmqYFuWYOJqq1bDA
	p6n3r7IliiJaF5WrWdwgDliDSCiUcGo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-TSgjtq8yNUWwCPjRCkdDlg-1; Tue, 10 Nov 2026 07:25:03 -0500
X-MC-Unique: TSgjtq8yNUWwCPjRCkdDlg-1
X-Mimecast-MFC-AGG-ID: TSgjtq8yNUWwCPjRCkdDlg_1794313502
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a211bff50bso13118155e9.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 04:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794313502; x=1794918302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQa/zF/czqRgBTE3EecGrylKNQt9LYXwl13l8Xprd24=;
        b=OZ5PTgUUrM/bCkP1D/FUAAlfZS3NzHyDd4Ak/fTk1dxj7r9esRupwQbuFptwyWTWTM
         HmFsB3wa+Z9BcACzYh2q8cYDzIuD0MRqF4BQ+XxTFnWonPBhVcwwVvdEUATt2HR9QGsS
         0gV0PYOvwiQmIb4fuEOVZcmRznMScEMw9hEW3zMtGHNkk2U3oeEjJDx4ITiB7k1jMVAs
         rJSz/Bs6qu21SG+XZQk/Giv6yLd3PmIA7iMBexQ++qgOvaIejAy+3a5KOUXoaT52bHQ3
         Ve+liNhvCYZwEGuQaqjHKN1rtzCFjC1pjxGmZcS4Nzv0/tdH3hiAc9kCsphoICbFhF3I
         mWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313502; x=1794918302;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQa/zF/czqRgBTE3EecGrylKNQt9LYXwl13l8Xprd24=;
        b=v2RYgs6Hy+Agy6GLYpE98jh6GG++8uJsFCKoiBsj5Speh5DqhTGE8sDEHNCpuKxIxQ
         iBPS9IkQs2mmytLh6tzjVdouF8+IZScij20IPr+BOSnmr9i4zoft8q/EqRG0zR/kjwrQ
         7tS3r5wU9FWiFQ1BJwhvdBxJYbTX6osrWGw9gcqYQ9CX/i0Osr5nokEGjHY++LF7hMc0
         +Ktu1CVrm+r5DdafsSOplKN6qyCi6CX2DDCsubAnCd1F9LzHtEBdKaaXX5AGD2XVQpq8
         bke7+rgrtkADoKAZYU2RJFVyKFE7tC3ygI5+cQQ7ltD4YD1K2iSivzgTMpsZxQ+MQ/U0
         yGyw==
X-Forwarded-Encrypted: i=1; AL+hErFY8QbQpr/3i5kf6pjELgXRqtWTBJdceU82GnOaINsGEe+ZyNI+Qh0Pf54IwKx+T44tnInTSiGM8Jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0PLqi5VUvf7OxytNvAr7fNvkCPn0FjmX8tzPOaWnfv71AFTpf
	CO2mBzzFzLdcSxJHlk5Q2sWiaRBJgaW0BPmxdd9mwQa+GAMayzgIzFmEmIXl1IiwASIIQ40JErL
	GYj1Go+J5hDRDJkCkJlZ8TpFeD0bZBaoqiS7l53jHTFfSKea+GylhGQV6xcYdTw==
X-Gm-Gg: AYBFou2QAngLJ54DeS0D8vs/zYo+JwU2BKFjs4PWh6p4T+dyTOSR0MgnvCZY/SzdfMt
	WBEJjokwWMAvFVwM3AfKVGbkW8DpC4TQCD2DsMEqa3wW29smWp6GNS/riuS6tFptl9W1HJKWq2Z
	gR9yPF5W5aWy+NddWzAOn3RSJhCBrrKwS8Bq4aDiPBK5S9NOHf0J13k00t1tWtg2i7rY4dn6YqN
	TWAG5NxE58YSlyiUcDub78zHXVtHBvpOJWTYvBwO2iv3LwiOdyGs49lMOrRFvvidX3kQjjyvXn3
	zkBEbb1n5Rgd3DYBHErZ11lGSfT3Onh7U+T/ZcHGlF+eUzDwGyTrbCQsju0CzyyJk3NW3JVHsLO
	yOMqS+MdrNQ9qJc+GtpwT0REH0arL/S18ALw=
X-Received: by 2002:a05:600d:82d3:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4ba0234ff73mr46627455e9.26.1794313501859;
        Tue, 10 Nov 2026 04:25:01 -0800 (PST)
X-Received: by 2002:a05:600d:82d3:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4ba0234ff73mr46626915e9.26.1794313501466;
        Tue, 10 Nov 2026 04:25:01 -0800 (PST)
Received: from [10.43.3.161] ([213.175.46.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c5b9sm4681271f8f.9.2026.11.10.04.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:24:59 -0800 (PST)
Message-ID: <42c9a0b6-0828-42b6-ba9e-cd49fb9ef4bd@redhat.com>
Date: Tue, 10 Nov 2026 13:24:58 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/10] dpll: zl3073x: update locking comments
Content-Language: en-US
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>
References: <20261106121005.1327603-1-ivecera@redhat.com>
 <20261106121005.1327603-9-ivecera@redhat.com>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261106121005.1327603-9-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 1:10 PM, Ivan Vecera wrote:
> Callbacks are serialized by the DPLL core domain lock instead of dpll_lock.
> All channels of a chip belong to one domain, so what the comments rely on
> still holds.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/dpll/zl3073x/dpll.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
> index 1cdadb8e46fb2d..6e5e2bb41f55d6 100644
> --- a/drivers/dpll/zl3073x/dpll.c
> +++ b/drivers/dpll/zl3073x/dpll.c
> @@ -349,9 +349,10 @@ zl3073x_dpll_input_pin_ref_sync_set(const struct dpll_pin *dpll_pin,
>   	if (rc)
>   		goto unlock;
>   
> -	/* All code paths accessing per-channel reference priorities are
> -	 * serialized by the subsystem dpll_lock, so it is safe to release
> -	 * our lock here before iterating over the other channels.
> +	/* All callbacks accessing per-channel reference priorities are
> +	 * serialized by the DPLL core domain lock shared by all channels of
> +	 * the chip, so it is safe to release our lock here before iterating
> +	 * over the other channels.
>   	 */
>   	mutex_unlock(&zldpll->lock);
>   
> @@ -2401,7 +2402,7 @@ zl3073x_dpll_changes_check(struct zl3073x_dpll *zldpll)
>   	mutex_unlock(&zldpll->lock);
>   
>   	/* Send notifications outside the lock to avoid ABBA deadlock
> -	 * with dpll_lock taken by notification functions.
> +	 * with the DPLL core domain lock taken by notification functions.
>   	 */
>   	if (dev_changed)
>   		dpll_device_change_ntf(zldpll->dpll_dev);
Reviewed-by: Petr Oros <poros@redhat.com>

