Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B452B2D5436
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780234554; cv=none; b=QWRZz37RtEGQYIh5+VOagqDosZUMvqENp7ZkFALtTYCHOZQzqDD4dbAW73BEFJXa/xMCJB7Ow5mAgHsXCBxYnPZp8FGp2iSWU+QLKnixV3P5u0obPHzS+kr5raNPiR7bV7MVRIGDQvFf2z+yiiidwmSgiIXulxGY2NPZaZMsr7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780234554; c=relaxed/simple;
	bh=wSZz+AzdlVOHc9rG+lsEwhIOCICN5R2ptJEM8nrsYKM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAb/Q7l+3TXe/rmncvD89Y+XPpJfwEW9frGG+TqxHYtSw2YW5V2qMPJdtpGI9D2Zb3iPw/1WlLxnKn30zXSKGzp81f8Zr24h0HwMm48g921suMckmpO8d6SV7y2RgKY04aJXQs7basKG1nkMrer3NCOokcWh67mMO+bdzANkgMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=kG99phYZ; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="kG99phYZ"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8cc0ef7c306so130584396d6.3
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780234550; x=1780839350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ecmbfN6Hxv0wzfAQ6MM3bdc8Nu3WaBbGIPmE7GrM3yA=;
        b=kG99phYZ+rEyxpR1LQJ6oRzQ/wUnAdfJvSc+pplmMsP6OiJbEPKB0fnOOz6qSSkUUJ
         UYC5jvzU6RUZypAOoLyRHgKh8wzG0aUR9JPYWgoAKvX3LA6KmRjt4mNVwxNBHgF+qbPj
         SAbRIAT9YisQBcNZe8bjncHvd/AK0TvkiQYu77yGgza6aXi3WgfbF03gm6h02eaMVP59
         6KKcDWKEEHoTae1TctROW/mAmdkJiuRiv+OYnL0UwmESdW2UgNyj5yh/a/uwCmttRz5y
         UgXtMTVmQ0sBM04jv827GywAIpuxG9PpSHhKIvkM5bW+ehcuj57IozUNUNGSB5abip7s
         qghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780234550; x=1780839350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ecmbfN6Hxv0wzfAQ6MM3bdc8Nu3WaBbGIPmE7GrM3yA=;
        b=oRLwnYeRdbjdWafqCPjPeATWEC34uyEpcRg6m6hNVeukbQAPExHMs7+25FQ2tKhY2U
         CoM/MHMkFN66phqcsp24Gs+S9KvTSitj+KFlN32wdLupOSKaMcApWSTpAyih9ZoFdzFF
         SeNLubvm+kSLz3TsP5LTxUA6iq4idHRGoETsxshCKBcn15YW0s91+Gy0xgT3dKx0GCNx
         k7ktIpNr6A2YeIoJW0RNQ97Tg3GaVETccHPBF0B+xwB0ramTNkX5BUf6+DQ+Ws6tmAVh
         nOKpLKqsVEMsOWM071IG77u4ATJ38DeGOtH7aUHrLrEsw7SdS5uysriR38NtkIdPN7kE
         wYhw==
X-Forwarded-Encrypted: i=1; AFNElJ8y3/C3Rrdjxe49oIMy0PjuWRuK/8bF9mt38UyzFSAEM/KfiWCxtYufOYwBWGuln53rr66ubXwm6Qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPyCELHstfXZzuEV6ibK2XdcVaPLoNnnaV9C8RKGVy2ooWyCZO
	W+MEOmWnW+Ln2G1vp+Y9ziKGuDk1cX0XGDrpOXSZFab1/i3opzvnG6eAjIPfhX/CEr8=
X-Gm-Gg: Acq92OEzbS9pxyk9MCb72epTgh8gc4pWkqZvliJQavs75EKOxlUjN5urq+KwEQOfMOY
	jRYWJ4dxuKnvFFQ2vM2nFwk+4XrC2bYZluPUIOg1QUid/E9FRZtwJM0HYBkzhcrZT31OY3qnMe4
	IzkeRTIw+O2NMVQ/zXHlwzw8BNKP/UjszAxyDkZdhiOFyR85jsEKm5uw7e06r5zIpcosvh9alKJ
	6EzzFMRIapReS7THOEcgfR8oq1q0TDBlAoUJFeHzQa0nsRE+fOqR4Jkj690v+biOtC1s2UrJBDF
	QK45HaOuD8Z/gTqxsWBLtVLF7Tg8SS/1aejldIgXpSUxnMFXPedAE+BCoZaqvr3m7ayG6YsOxSu
	uubhhz0FJ4EkuX5xh0XzL0x9ifpVwC09NXIciz8Zf6EXgw3PTkcxzpP48QhuYOp4QR+mRqDM0Go
	tPO5QxTB4YNwWdsdjH10hn5bDmLgSBHWR5G5LJ+3m8aPrxha29yG3f6suiO5zxIw==
X-Received: by 2002:ad4:5f8e:0:b0:8cc:ee2e:8d9b with SMTP id 6a1803df08f44-8ccefd58403mr113278696d6.18.1780234549737;
        Sun, 31 May 2026 06:35:49 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea0425dfsm69984996d6.3.2026.05.31.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 06:35:49 -0700 (PDT)
Date: Sun, 31 May 2026 13:35:48 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
	pasha.tatashin@soleen.com, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v4 01/13] liveupdate: change file_set->count type to u64
 for type safety
Message-ID: <ahwv0ZiyQ6TzoCah@plex>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-2-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530221938.115978-2-pasha.tatashin@soleen.com>

On 05-30 22:19, Pasha Tatashin wrote:
> This improves type safety and aligns the in-memory file_set->count with
> the serialized count type. It avoids potential truncation or sign
> conversion mismatch issues.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  kernel/liveupdate/luo_internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
> index dd53d4a7277e..ae58206f14ac 100644
> --- a/kernel/liveupdate/luo_internal.h
> +++ b/kernel/liveupdate/luo_internal.h
> @@ -52,7 +52,7 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
>  struct luo_file_set {
>  	struct list_head files_list;
>  	struct luo_file_ser *files;
> -	long count;
> +	u64 count;

From Sashiko 1:
...
Since FLBs use a single contiguous block for serialization, an untrusted
KHO payload could provide an abnormally large count.
...

Answer: NO, there is a chain of trust during live update. The previous 
kernel acts as a boot loader for the next kernel, and performs all the 
necessary verifications. We trust the previous kernel to pass the right 
things if compatability strings and format matches. KHO payload has the 
same trust as the previous kernel.

Therefore, we assume the serialized metadata is well-formed and valid. 
Defending against a malicious or hostile KHO payload is outside the 
threat model of this system.

From Sashiko 2:
...
If luo_session_finish_one() fails (for example, if a file handler returns
-EBUSY), the early return skips luo_session_remove() and
luo_session_free(). Since this is called during the VFS release operation
via fput(), VFS will unconditionally destroy the file descriptor regardless
of the return value.
...

Answer: NO. A finish failure means that we cannot safely release 
resources, as they might be associated with devices and DMA activity. We 
deliberately leak these resources to avoid memory corruption and data 
leaks. When userspace fails to finish properly and closes the session, 
the only way to recover these resources is to perform a cold reboot or 
another live update.

>  };
>  
>  /**
> -- 
> 2.53.0
> 
