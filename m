Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0B0191F66;
	Tue,  7 Jan 2025 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252894; cv=none; b=e6ZuNWNPa809/z4AoYVDEq/ABY23kluF7V2VEjynOhb2UQV7LYlSPzvbdfFZGb+fduaZrRDWAMsY78Pe5g6icUUyb13KdmvGDW2J3bbRCIj1J2DxCrD8YEOVKTQqgNoi6uGZPzcYM7bllBO5LTeWm1/Cy5RtnzgBNv9tPEWOq6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252894; c=relaxed/simple;
	bh=1/HcQq/YmuWJo6riIlJTFgZjpKLXFivEYEiYy2oVg24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0ZU7fH2aUXQ79hr1k5axCHJPyxRSYqcfjHZAAaAxQvjcQRNvyhchQcC22WITe8OKTap1zOuKpbml0eEzFyAcmgjld/IaaedkuUFhIsDGuN4iOHupVP6A13Pz+g0Hsy9NDpkBIaZ/K6rY4eofV63Aj6XLjiwrufV3Ci2AVryhkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zb7ELEkE; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zb7ELEkE"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso2166860166b.2;
        Tue, 07 Jan 2025 04:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736252891; x=1736857691; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxVpDxmMIrZ8O4h3kBmPYeM/tvN24AqibedskpkkqlE=;
        b=Zb7ELEkErnZjOwM/wCsRLH8P8FONm2OiOnYf5ft93hCfPZIJHGjTXSL1TsC871EwkL
         +xc6kgbT9So4fZhX9aO6UUDsnhx8MqqelFEF8Mp4XLAFxCgjsAV4YSJptaWkvT7ILAVt
         Xcxx9cpTgYSbrz0lMNAv5nzlwWQXiXM/Co3Hpr/jTLfJOaQnhyr1GoQoF3a8HcpRWrKc
         0eRhK/gL/TS8tQ4xl6g1ehRrHyXcHe2uw7WLUngwjRRyPrra0d5r9HyyGu9LPhK7bHIq
         plNfTtV9poR0YvM424kLygmnIji+ZoN4IlY6RkyNLkRb2Cwb/TdxDiLzg6HtVF8VGJ6C
         kSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736252891; x=1736857691;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxVpDxmMIrZ8O4h3kBmPYeM/tvN24AqibedskpkkqlE=;
        b=DsxyPqNenwVKNwmycow1hHzQT/flAcBtfAZmYgUajjN5/GgDmLCVQLVZ5j30DEYR/g
         aa4kYuJDYEVWLCpr2Dmh1QLKEPMbsjhuy0Khm3M0EjSzrQWkVUOMD5vJyTGidIviqMU+
         623/WzURwbwQWGkxpFsEvcVzgcxax6AFT78WtH7+bqNqGFP2my9yoevIvhC/w/DAfbcc
         ChumseGUvSCwQWEfc4pL8nvWfvF4hnq+TiV7ACMjOYKQHvK7Yo6hjwbQqCRdB9gRhBrX
         dJ8vlqAuHoTsKW3+vtW/u1xr4ZMpLw3Q9GA0HIsFRnd12TOTx7H2eJ0qvsx6hxhNiCmS
         RfQg==
X-Forwarded-Encrypted: i=1; AJvYcCV+2wCxEEtWl3jVJ1A7WY+oQbwr2Scr0cRnd4wYOX4TMtjYN7v8/c1WzNASuSBb4Pe4W0z2VDs/QVlaL6Ro@vger.kernel.org, AJvYcCW14B9ala+0vnZXhTmvhr26E803be0nFQQrjtubUe70SZUmhL2qoXg5NxqEJsnglgnmA1Yd7r8wHUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+9B6gGmSIjSNtXgwyopdsCiipHPz5O8jJZggKuM5O2yhg7dWJ
	eDjmVI01lU1fQZFdzW9t+/N+Et1/eEJD7h1DKWueGfcWkxqHl9Og
X-Gm-Gg: ASbGnctK3SOG4khj7cuXJyvj6dE2JDbemitdrlgA9IKWkGs3xDYRgSC0MJ7N94STAed
	cAwmEC3q/lN7RzxfUwCUuFVFL8/0p3UKhNDWN/GWcQAfsvIFEqg5zc48Y5ZOEn6B6dLAh5/5gML
	IVCJ56mJh5u0Ux1uJ8d4FzDaRVFoAlQAKgc8GZR3+JUAZT5kY+aOMHAqfgPAwmCOKmiTcrqSDLa
	JD1i6pjU1JUkIw7S3rszm+94ZDhbTjNJA1WbsulRPPl18Viw86DYBra
X-Google-Smtp-Source: AGHT+IE374I3W2qVaFGb9oLlN9bOkRTGBFfaEZCdrtGtGIpchcuGWoTSBfL2KwKVgqlNpUznpHrXvw==
X-Received: by 2002:a05:6402:5245:b0:5d3:ba42:e9fa with SMTP id 4fb4d7f45d1cf-5d81ddc01a0mr151395377a12.16.1736252890854;
        Tue, 07 Jan 2025 04:28:10 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e894f22sm2356783166b.50.2025.01.07.04.28.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 04:28:09 -0800 (PST)
Date: Tue, 7 Jan 2025 12:28:09 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, richard.weiyang@gmail.com,
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 1/1] mm: remove extra check for VMA_LOCK_OFFSET when
 read-locking a vma
Message-ID: <20250107122809.ofddv3yw44ciaklm@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250107030415.721474-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107030415.721474-1-surenb@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Jan 06, 2025 at 07:04:15PM -0800, Suren Baghdasaryan wrote:
>Since we limit vm_refcnt at VMA_REF_LIMIT and it's smaller than
>VMA_LOCK_OFFSET, there is no need to check again if VMA_LOCK_OFFSET bit
>is set. Remove the extra check and add a clarifying comment.
>
>Fixes: e8f32ff00a66 ("mm: replace vm_lock and detached flag with a reference count")
>Suggested-by: Wei Yang <richard.weiyang@gmail.com>
>Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>---
>Applies over mm-unstable
>
> include/linux/mm.h | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>
>diff --git a/include/linux/mm.h b/include/linux/mm.h
>index 486638d22fc6..b5f262fc7dc5 100644
>--- a/include/linux/mm.h
>+++ b/include/linux/mm.h
>@@ -747,7 +747,11 @@ static inline bool vma_start_read(struct mm_struct *mm, struct vm_area_struct *v
> 
> 
> 	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
>-	/* Limit at VMA_REF_LIMIT to leave one count for a writer */
>+	/*
>+	 * Limit at VMA_REF_LIMIT to leave one count for a writer.
>+	 * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited() will fail
>+	 * because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
>+	 */
> 	if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
> 						      VMA_REF_LIMIT))) {
> 		rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
>@@ -766,8 +770,7 @@ static inline bool vma_start_read(struct mm_struct *mm, struct vm_area_struct *v
> 	 * after it has been unlocked.
> 	 * This pairs with RELEASE semantics in vma_end_write_all().
> 	 */
>-	if (unlikely(oldcnt & VMA_LOCK_OFFSET ||
>-		     vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
>+	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
> 		vma_refcount_put(vma);
> 		return false;
> 	}
>
>base-commit: f349e79bfbf3abfade8011797ff6d0d47b67dab7
>-- 
>2.47.1.613.gc27f4b7a9f-goog

-- 
Wei Yang
Help you, Help me
