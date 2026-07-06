Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E1B41C307
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 18:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360933; cv=none; b=iTBBdFyAF9+rTyPomBA5vftuRROcdQY+fgxinCKefEjYvC/Jw5XE6KF7ND57aRQdZA9egGmrrawLf8wBfmKBIroMd48XYo6kf68FbHsVQ1GBCWlu3KNfCBZBCFcKjHLR0WlkQ7+xaY6PYEeWphQbYBIxN3nmqsXdDha99BhNamE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360933; c=relaxed/simple;
	bh=kXDlM4ALMMZ+goUgzxjE8iSzN63pj5SPv611+8XFIGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsIe8NoMhFY2uTvYtQhI2w5cFm/ds2Ewvovhx96BPPXhBKP5rZ95+UzGoavMFZA9q17racv0s5US2Ia1/NCDK4enwRllfTS7XX9c0uTtyW+9vJwyV3+3sEM1bymY10RhocAO5gQ/q7nRmvqyQRAHv60SUbXkwspkmYIK4gYwWYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=SazfPKw5; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SazfPKw5"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8eff5ce3b95so24734436d6.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 11:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783360931; x=1783965731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kXDlM4ALMMZ+goUgzxjE8iSzN63pj5SPv611+8XFIGI=;
        b=SazfPKw5hQYTg9bVJDJxEiMKZV1JBN2c83Jh9Wiidbl6iqOJJBFCWRI4jWimKnfY13
         teafepspQADfGRWblUzKOGf1QNE2Yr0WLmGhqe2+KZ8o11DQYPO0jlAi7rIAxPXLOnUa
         zXDWcmnZntZTSPGBfmPj3FMwjfni8AXvVq00h10UItFUMdq0Xs1T2BTV8aChiUJDZIFC
         utzw9jNpTbhQcDxVzKSlC/yT8fgoxTzZrHd/vypd2YdWBhYRtgjnSO/qOkqMUqRKkB/4
         7/Alf79DViSMccTpXF7ynnJf8FKlNXnrOfx/f+Mu2KkUpK7CiKSTkvfHrxPV4AwkgKmr
         PBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360931; x=1783965731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXDlM4ALMMZ+goUgzxjE8iSzN63pj5SPv611+8XFIGI=;
        b=tSJENlA/ApiTT/so+QZK2YmsZ/00PVT00YTGCWvC8zzdlVvguyPKAxCysse+6hAKAc
         EvZLSPZCq9zxGkt9EAcI6eJx26iTOQWORV5XHRet74TiYKpLmOhMLDX9zWRPayHnYv4a
         KY1CwNavJPu5ECH9S06FUIe8EcEe5LxKTxDBNDQXJcklCIW8MIE24zT65VO+Qr/np08s
         Aq+WJ1OVCTM1PkQssp5wT3EzIrGiyZREo6XsR1/YVVPldf4fr9SJMlqPMEoHiwTlZtOY
         JlNBNn9qzfX0SQehVFeltnjZSPCJQ26CPXLA2gDWdLvx7x+2EJoFeImA0IKrtTRn85WU
         1Xig==
X-Forwarded-Encrypted: i=1; AHgh+RopxhebcgFLB3pjEa7P10rqlTK1eHbQ8GX3JHiybzYCgX+0ENwrEx9DzAxogef+0JjL+LdXY01dp/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAG2Cfu2TYYnvAQzYdM+thsEkJtGAzHMuh74XxWI4TmEEBsTY1
	esIasSdz4Zju0HeWbtuGT5BTzLXeRBLAymXg2wqFIsRf9qyF26/I5n3v7kEo9ghPVOU=
X-Gm-Gg: AfdE7cmwwCLh24v15R68q9WAgT1C1/5eOB4Nq0Bwzyisjb0rsnthyXvD1jwAtMOOdtf
	1azRDvzwaWfg4zYBhC+tdBx44M7njDVoWlZLwtHY130WzG/+fWGtWcZQ8TUDB/w4vX2Jx9++5+4
	mtDGPCqLyP1TZUwwYFkbAXl8TPmu7NYiOUm1X4BkRqpWFg+IlZq8Q4aa1Ke5SDOta9xOQajMhlN
	3o7R6H2L7S/NRxwcOy9LfSkQnhVbZ42dGSt9QNsCtDiMYr7vK6odw1FgmShqkeAGN7SGU+pLFGx
	QVp+KDweooDP7tFDxTvQvTl9e/wYMgoQvt4BvKrDJ/nR9Cj3TzgF+mqfQmOSwGxiOBGRPK/gYi/
	+2UPmhMiCzlFHxHbvhtsbVeNGw4km2aZ1KZtduuhwPNGd+PaWpQ9j++jYZhzJZXUc092p+Vo=
X-Received: by 2002:a05:6214:590c:b0:8ce:ca7d:b099 with SMTP id 6a1803df08f44-8fcb2990a80mr21004896d6.18.1783360929999;
        Mon, 06 Jul 2026 11:02:09 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e371f44sm150118746d6.2.2026.07.06.11.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:02:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wgndw-00000000dS8-35OA;
	Mon, 06 Jul 2026 15:02:08 -0300
Date: Mon, 6 Jul 2026 15:02:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, david@kernel.org,
	corbet@lwn.net, leon@kernel.org, ljs@kernel.org, mhocko@suse.com,
	rppt@kernel.org, shuah@kernel.org, skhan@linuxfoundation.org,
	surenb@google.com, vbabka@kernel.org, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	longli@microsoft.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v6 2/4] mm/hmm: add hmm_range_fault_unlocked() for mmap
 lock-drop support
Message-ID: <20260706180208.GB118978@ziepe.ca>
References: <178336023903.504354.7500950448226027718.stgit@skinsburskii>
 <178336050736.504354.6052508493877924780.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178336050736.504354.6052508493877924780.stgit@skinsburskii>

On Mon, Jul 06, 2026 at 10:55:07AM -0700, Stanislav Kinsburskii wrote:

> +The caller must not hold ``mmap_read_lock`` before the call.
> +``hmm_range_fault_unlocked()`` takes the mmap read lock internally and allows
> +``handle_mm_fault()`` to drop it during fault handling. If the mmap lock is
> +dropped, the function returns ``-EBUSY``. The caller must then restart the
> +walk from ``range->start`` with a fresh notifier sequence. ``-EINTR`` is
> +returned if a fatal signal is pending during retry handling.

It doesn't make sense to me to expose this to the caller, the caller
isn't holding the lock and there is no reason to redo the mmu_interval
at this point, so why not just loop inside hmm_range_fault_unlocked ?

Jason
