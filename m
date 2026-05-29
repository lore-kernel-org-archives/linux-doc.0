Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468883E51F5
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065677; cv=none; b=PKQJl3SSIFxvv7Zb6YR0L7TanES6cy2HikUXPiW1IndQQ5VqIpndj4VJvt578/eA++L081yT3x7Ghua9vzzsxPnWX1fsqz/xLeSZGsHm9SEuQj7Qf51gATlmHQtLp3DNazpCA5HhkJmZBKmAGNQ66wk66+UuCDm9EO00Lf6vCDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065677; c=relaxed/simple;
	bh=GwX6M4/EK6SrBQ7tNZIqqdM6jMUv2V7uqBmnajKX7HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nggsD1Hlqqp8pFZLKlp6kkFkHeysrJ/OjCRhAbGGdc9xyXfdoaI9NsH9dt/tQDfakEhPKqzEwzL3TxE59UvXryLdwUyXFCPhpwBbnziZjIGfxXeuvDmsO5qrR4B7B6bzC9Vw8ntDCpxhmRiJy7C8Oj93ZBXzw3rMz2Kof+jlr6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqYc//TE; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqYc//TE"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82f8893bff3so6564581b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780065675; x=1780670475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifCetNsGhGXROpWXdUZu9k5jgo1IT0uJlL0ioftjkf0=;
        b=GqYc//TE2UUpgpOKl+0b7wAMvM1Mkh7PejvXuQiFDlmjZUARf4Ozy2DOTMjINyHv8/
         1W/1iEFjW7MA1oiBud35HlopB9X0VUGNibarpI50phBoDoR7D4zS06MaW/JybNkl2cke
         9MD93FkG8618hkSI7B3qWAw/7Ckf0N6nDfdz6LlGgiYvETSDAweF2PwsqIBJHGViXWnR
         GpEXFIawAx+Nt0Qx5iv51BGHIm8GxD03WOXS9qH3E/B9Fi7eqyeKcHmRHzxl8arJYtnJ
         ysHZ0QmrUpB/gjqTN7yDuoPf9wixWKe4XI85YwwUezxcLU87Be5cROpKfFPGTwczymmj
         N7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065675; x=1780670475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifCetNsGhGXROpWXdUZu9k5jgo1IT0uJlL0ioftjkf0=;
        b=HajZCub5Xb/GL7Xw9i7jNjb81WEbpfJpKvX+GpnihIm1SuqleRtGyiAn0uZba3fLoI
         mLjBAZoeNOlMl+FdLpYnjoIArum9oc2N4kt0QqdxgSknpKAqDF7nez1fmB1m/As4wwTT
         GRTcIkHICBd5d5SzQ4qphjrQy4XSHb9QVL7l1buROOlLPxZnQhrQ/4lwT/xOJxIebEjv
         JqUAPglFf8vrs88GGQLVEb+/c8sA3ecrVl6w6bQ+1d0Vf75YY+TBmMzO/nLg+vlIies5
         xEHF2ixX/bPwAPQrxkKt4hEzPUWO4OSb7d24Yy7ePSd26CTn7FTFVRYYMJhQpAC8wajS
         pdMg==
X-Forwarded-Encrypted: i=1; AFNElJ8OMW8H7rz4blnxvtGjA/k+s+CLQg20RZwtzULJSrW8ZBjKs1EK4JckKPGDUaQEYB5hGp+/sbnpjxg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+dwqg2g7N1xwGlOq+wlL4ofNAx8iTCwuieDN20jd+AcHKY4ey
	WlbRxcu8pL/yJ9BzEPmYa9RnJV3R32IlQzpPsJ70ORlhHdpEJ2SLx6Lj
X-Gm-Gg: Acq92OFupIxuZvRvdj2xFlfg2tH27QfUpY1lqDefuGfMOWgKp/Srxm7KF/IgTSdj9cj
	f/m1uvk3RHOXwjNIAmec0OyT2QNh+Bzfu56GaE07t4K+jNZJjQzksZGnRPhE9HheQ+JrTeQZpd5
	yzWUN4a5n9KmNnJ4cXT6T8Kf6lCwOu/SAJvh9z/kiDuZI+0/MjE/oMxyvQlsJPAAQrw0xlvE0Kj
	U9XCe7FjYmUgqGu3erir1ixjqcf+Ksvp35P6URpfHNpDm7ogWYXVtLmQiuHLHGUEksosYjfGyOM
	UTDkEeJQjLR2647fHwPOp+8hVqKjqSc/FUbN6g8P8OjrWBxl+W2IGrj5ZOIrVxhTphVrZ8cYAsV
	E0b6QujDRd8LGFBhDZUF763Yhc/6sMHa3OXDUXlwsCxXuRrFBzMoFbvTY6ksMeepi06k86UucnQ
	oDxohLb0pJJzxOae2hT65rWSFOg7YXBhI9sH+8ezZGf4g3iSM56puI5isiIf8GNHzgbaKfHnfRY
	imu
X-Received: by 2002:a05:6a00:94d1:b0:841:edbf:6424 with SMTP id d2e1a72fcca58-84212c03459mr3360610b3a.13.1780065675248;
        Fri, 29 May 2026 07:41:15 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b67a11sm1946082b3a.27.2026.05.29.07.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:41:14 -0700 (PDT)
Date: Fri, 29 May 2026 07:41:12 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Liam.Howlett@oracle.com, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
	leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
	shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
	vbabka@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <ahmliNJiR-R9N4M3@skinsburskii>
References: <177928604779.589431.14703161356676674288.stgit@skinsburskii>
 <20260521163309.c5cc5d3f6cf16bac212cf90b@linux-foundation.org>
 <ahidV_iSq3E-FtMI@skinsburskii>
 <20260528131115.184c178d03d516e11248a1ae@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528131115.184c178d03d516e11248a1ae@linux-foundation.org>

On Thu, May 28, 2026 at 01:11:15PM -0700, Andrew Morton wrote:
> On Thu, 28 May 2026 12:53:59 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > A gentle reminder as requested: do you think this change could be taken into
> > the mm tree?
> > It's beneficial not only for the MSHV driver, but can be used for
> > post-copy live migration of GPU states in future.
> 
> Still no review, alas.  It's not a trivial thing, affecting both hmm
> and userfaultfd.  And we're closing in on -rc6.
> 
> I'd prefer that we revisit in the next cycle, please.  Refresh retest
> and resend after -rc1?
> 

Sure, will do.

Thanks,
Stanislav
