Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A0614B946;
	Wed, 15 Jan 2025 02:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736909917; cv=none; b=lVayNvFcUvUQzFunQtB3G6In/Qpq43MkVuYIAdgTRlK1R97lWX4TRzHRe9lpptwJojYAn+Quf77uCGqFJyb6oe0AjfDU4zsNogE0YbwzYl3/DtNcd57DKxlxo3CAJa49kDR/UNLZ5PcCnWRLEc2TcdVZiAJLjuAs99T8xAOYFb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736909917; c=relaxed/simple;
	bh=faIDhUpXEBGb4ajZkWDE+XkD8dt8yFc0L4jK8vnNbnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8n9Ne+AlQprwARD8eqolWlwRUxywpvyRg7Ai2bRagYGT+ERBg7/gwKZETAVECp80HzteoKxCFz3IhS0bFlcfXpSAMBoZlC+NhFwX+oq9PvFeyMxtnRqpa5n5cnNisIseWv1UdOVoSHd44c3QPt458SYOqqrBRBhW1QdGmN4qII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBYequvT; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBYequvT"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so1174702666b.0;
        Tue, 14 Jan 2025 18:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736909914; x=1737514714; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOcRRRb2tRIdJ2BkO0YaTQVSUXC8mfW5SWFnS3UV9Bg=;
        b=fBYequvTpRwivhls6igavqMrfQbrpTlU6/XyuJvq/j1DWCGfREKyuBmK05sk0GHuXf
         Uvp0XkPciVL/5wKRfvUgWTBv4J4zyfStp/BkYL08bsU/J2hV0dLeOqSrgX5ffZ2IvpVt
         kyiHw4dMYySUpVoe5Ov8GPVpOsfU4QJ7DX3GmRubbXByzSDMpljctVDH5GolFCjpp6nn
         wLvssEOMr020tnPcSQGdBuwkHmodQvbbrAxI8Tvc9mUj0woLX45gW8IXAVx7Xha7X+cX
         cMAeAgA/luCd1zytXQEz7ezY4hdnzG9OziQG2Blf/q3lt58y4J2V3Drl1SvO6erfQ3eI
         H0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736909914; x=1737514714;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DOcRRRb2tRIdJ2BkO0YaTQVSUXC8mfW5SWFnS3UV9Bg=;
        b=YWz+zMRJqZA1lX2YI68+bGwx72IgcPTwiFv2zYf107t2vcvz2rrLL+Co7c75go8pQ8
         orekErlRBo5DnTiuTcMYQKPeoGavComQkT1bEbBkw/ub4jsKreOLyonIbMvBZPoc8fKc
         MgVT7fyrLtWEYGHKyfVo+05z6Mi/rWYipotqgazausO3+2Q7Wsor1eOukWoFOzIZTqZe
         9WlIDHTRl+1cb5ien2RhWu638ycsjq+r5LFU/cFdrzzI8r0Ab8JWY4Hk3mCORDe4fmCl
         1UR1c2FCoSxdvI+wqY/WeVAo7054LV4AxV6tEnE8Z/9X3PI7QPT3IVBrO9BBx1BzzrRB
         BlMA==
X-Forwarded-Encrypted: i=1; AJvYcCVEgix1qSQJi0JIUMH3ycx6yjlrcnBQx8Y5FWVVthEYEn9Zv3XcELZGJtQWbbeYQF14v9u0mSsJSHM=@vger.kernel.org, AJvYcCXzeJCdT9G1vKnf8qez+ahQPLwa7Vn9e1X3eoWV4rzpD79IqS6MUQwcoEKJVBtWJW2leWDzBF3YO7jl1FOA@vger.kernel.org
X-Gm-Message-State: AOJu0YyltA2ZaiGAwFWD7Wr8VuSvU7oDTwKf1cEbAt7HrkKNEk2KJd7E
	T2LAMr1OVBCFmKmpLT70L8cOGviHCJIuVnGcXUfwcGZyzBv8iEpX
X-Gm-Gg: ASbGncto4k480OSzLD6AFk1nPeJziCD3O9AIlkWGj5V7cOQWR6aCt1SzLwJDyrFF8Cy
	tVzCupOz2erxUm841SLCLtaaBzHOJ2oMY4oDOlPxx/T9HN1E2jNmpU0pQbs9bFiItxKtnhGFDFu
	ZTDEPmtcKo/ymkLEWGAJ5w04J8+cYbjBHVTx5902hQ4m1OK9uARrNbbxyTCsRmnphYBn8+z+vBa
	Uqyg4JGtn+Y5KiO5YN7A2j0LZQEI1yMMK5sKmmFVUxyGzyIuZSaLZw4
X-Google-Smtp-Source: AGHT+IE0wx+2Az22Xb8x1x1CxWZaauraPRs1nL8gyFw8PRcQDDH6sFebSZCPEqphD2UPGUruyufDUQ==
X-Received: by 2002:a17:907:3f95:b0:aae:b259:ef6a with SMTP id a640c23a62f3a-ab2aad3a453mr2652717566b.0.1736909913726;
        Tue, 14 Jan 2025 18:58:33 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95625a5sm694594766b.114.2025.01.14.18.58.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 18:58:31 -0800 (PST)
Date: Wed, 15 Jan 2025 02:58:30 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com,
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com,
	richard.weiyang@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20250115025830.pebmoyerkruqtx5y@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-12-surenb@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
>@@ -6354,7 +6422,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> 	struct vm_area_struct *vma;
> 
> 	rcu_read_lock();
>-retry:
> 	vma = mas_walk(&mas);
> 	if (!vma)
> 		goto inval;
>@@ -6362,13 +6429,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> 	if (!vma_start_read(vma))
> 		goto inval;
> 
>-	/* Check if the VMA got isolated after we found it */
>-	if (is_vma_detached(vma)) {
>-		vma_end_read(vma);
>-		count_vm_vma_lock_event(VMA_LOCK_MISS);
>-		/* The area was replaced with another one */
>-		goto retry;
>-	}

We have a little behavior change here.

Originally, if we found an detached vma, we may retry. But now, we would go to
the slow path directly. 

Maybe we can compare the event VMA_LOCK_MISS and VMA_LOCK_ABORT
to see the percentage of this case. If it shows this is a too rare
case to impact performance, we can ignore it.

Also the event VMA_LOCK_MISS recording is removed, but the definition is
there. We may record it in the vma_start_read() when oldcnt is 0.

BTW, the name of VMA_LOCK_SUCCESS confuse me a little. I thought it indicates
lock_vma_under_rcu() successfully get a valid vma. But seems not. Sounds we
don't have an overall success/failure statistic in vmstat.

> 	/*
> 	 * At this point, we have a stable reference to a VMA: The VMA is
> 	 * locked and we know it hasn't already been isolated.

-- 
Wei Yang
Help you, Help me
