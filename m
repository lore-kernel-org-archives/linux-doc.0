Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA1E199EB7;
	Sat, 11 Jan 2025 12:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736599145; cv=none; b=IUlSm4k0Lm1amvfrxzUYM2NNtrdo9+iEtCvr3RhXzmFsL/cJDvsyQWJU9VNUxOP1KjFp+4uIBGbFakP5bsjrKX1TynFRQ8aijOIz/lpO/S4KxrV7SRd7Vb0vJpeNqE8Net5vV+tu7u6x/ohFT71CwIQYRaTDhLzJkE6zxXGkbfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736599145; c=relaxed/simple;
	bh=0SUteaRZ0/2JatYYIey7j+YlOh26WKWoULSo1RJMELw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FKvNeH/dTeGLG7YLxC/8X9z69feks9P8VM8W7vaF3+SwNuZ76XAL+x6GW+Yy2ArxgyImXDfC0MTXLMYT4NSmNuVFc7wKn4QoazGaTo0ZbZTlCRRsoDmsnxAYCv/JpxKYr7aRzTU7YR2auBNGZNxxkF8v14vOghUHYWdA7LoQ+WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAqsXcoI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAqsXcoI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so1631645f8f.1;
        Sat, 11 Jan 2025 04:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736599142; x=1737203942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjcUr7iPo16VpAzzLGdT20/uMUcDtwg+n1cza3W2ZFU=;
        b=OAqsXcoIrXm48+Xluc5yzTzPe3S1BNnFkhtDrAXDazuCI7btmnqBBo9rR1TrfLg8JB
         447WVWmgdROTEgvTjGNKoVWnVdam+AU8g8cB5poWG2C7m9wBATefzMxlVOQihHyjXhXG
         OOF7qW51opvVB9tx2SMoD2ydxtum4yC1rHqFW3Uk1CFzjhCtjVrFV89Ykv0CRYKhsaqd
         jFKlwz6FJQ/0sAbnL4dGwtoouNJfa9B1S1LRd6biMM/mxxYpJPLQANwYazLGTiPyxI8E
         F1ZzdKR4rZKyLkxKy70cxfhtWqVZt/9clDA6usjjamXO9K1vHftxXMFfnOu9iFFZneIl
         lklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736599142; x=1737203942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjcUr7iPo16VpAzzLGdT20/uMUcDtwg+n1cza3W2ZFU=;
        b=ihsBdU+spKPsDyLzb0aB2vOqh96xf9r4bAp8UEygtP1ISldlgP/9Qaikr36VQ4o+kk
         j/aJG792YtBmylvvRZD4iKjT9SXiEXhbeil23E4LgTALkxk6FIsLps0/LEnZKuZmMi99
         8p6j7pWiDAjQdJnaa1MD/W4tQu+3y0fqSOEGaPLPBSMB7Dx0hnbbV16wGA6xClC2foG8
         mVm6OBHaPQkiEpzCW9nYg+uxAEBxwyVehNAwEsOILQihV0YphqrZ3V+XroDr0/5V4noX
         jUatYE+dVZ3ntDMGtyuUplrPtrGxduCZKvWjmy0Al3IQOMCVAR6yACtXP4zisK++iwyC
         bDqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU34159k9HL44hD1pWEQkUyDF/5XJ0fXmel69GH8KkAPnJA6Ou3512oZuCss1PZDTGp6YD1jX5fHpmD6URZ@vger.kernel.org, AJvYcCWIULTJK8OYJmZyIJGgs1IDSajPQHRDI41+h912EO4abpBkR+TVUMMe9im9VbGw+dqDa0Wj90N6nLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUw3mWfv+6g1WCE9fDuft35PbhmvnSB2XuaaUuaj8juWaq1Br3
	PK0wjk0jOnK8RzZtBKQKZylS9vPa6NkStPhgFIv6htcG6eUVxfrj
X-Gm-Gg: ASbGncvbt5mCQlQzC4HqRO10f929mUNRp463A26pmUmiYB08Ix3aRVdOKdYhWrwvuCw
	tdz+hGH1B8j0paffY4p85EU0f5j98gnTluNSk76+NswiNA8MynhV++SFAIadAQhBSKxHDkCptQ7
	4SlwglZVSLJYj1fZRiI18LWBx/EWhleD/FE9T2opFSZfkn+ETokIVzB6ivk4DONt1K1H/Y4PADj
	M1w+mshmtBTO7MtxVm2Z317Ub4+/DnKJwFwFtAGenkQHVSBOGrsjdliWfVZCD+kHeH6VOHXSadT
	FxeXvsvhGWci+/zp7o8=
X-Google-Smtp-Source: AGHT+IHyM+5JHDmoYe0STSSA5fjw6i003CpLYyIbIAV2BpVbC08OESNUvTt7cMMoFTKPDG8cc94ZZg==
X-Received: by 2002:a5d:6d02:0:b0:385:df43:223c with SMTP id ffacd0b85a97d-38a87303941mr13248409f8f.13.1736599142095;
        Sat, 11 Jan 2025 04:39:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e3853b6sm7087513f8f.44.2025.01.11.04.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 04:39:01 -0800 (PST)
Date: Sat, 11 Jan 2025 12:39:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
 liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com,
 vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
 oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com,
 peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
 brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
 hughd@google.com, lokeshgidra@google.com, minchan@google.com,
 jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
 pasha.tatashin@soleen.com, klarasmodin@gmail.com,
 richard.weiyang@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 10/17] refcount: introduce
 __refcount_{add|inc}_not_zero_limited
Message-ID: <20250111123900.643e4b49@pumpkin>
In-Reply-To: <20250111042604.3230628-11-surenb@google.com>
References: <20250111042604.3230628-1-surenb@google.com>
	<20250111042604.3230628-11-surenb@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Jan 2025 20:25:57 -0800
Suren Baghdasaryan <surenb@google.com> wrote:

> Introduce functions to increase refcount but with a top limit above which
> they will fail to increase (the limit is inclusive). Setting the limit to
> INT_MAX indicates no limit.

This function has never worked as expected!
I've removed the update and added in the rest of the code.

> diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> index 35f039ecb272..5072ba99f05e 100644
> --- a/include/linux/refcount.h
> +++ b/include/linux/refcount.h
> @@ -137,13 +137,23 @@ static inline unsigned int refcount_read(const refcount_t *r)
>  }
>  
>  static inline __must_check __signed_wrap
> -bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
>  {
>  	int old = refcount_read(r);
>  
>  	do {
>  		if (!old)
>  			break;
>
>  	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
>  
>  	if (oldp)
>		*oldp = old;
?
>	if (unlikely(old < 0 || old + i < 0))
>		refcount_warn_saturate(r, REFCOUNT_ADD_NOT_ZERO_OVF);
>
>  	return old;
>  }

The saturate test just doesn't work as expected.
In C signed integer overflow is undefined (probably so that cpu that saturate/trap
signed overflow can be conformant) and gcc uses that to optimise code.

So if you compile (https://www.godbolt.org/z/WYWo84Weq):
int inc_wraps(int i)
{
    return i < 0 || i + 1 < 0;
}
the second test is optimised away.
I don't think the kernel compiles disable this optimisation.

	David

