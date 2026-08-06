Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93AE29DB6E
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020744; cv=none; b=K0Da5IXiafSnudiVYaTjrDDZAuh8Dd8yXy3pjjbFh+OqEi8PGX8OBOzSvhBu+NWc88vRNH379cAdSngb/dfFqg4IXg8aNQOAb58djBtGmDV70/u4fcCXtYSUTnxESoPDi8UAie8akGHJIgzEuTFIhoA7stpXNmpTiS2h+p0e8tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020744; c=relaxed/simple;
	bh=E+t1gFtcHDiraPPrfsroY+Aj4GCqUrp3X08deU2GKIU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FScFZouDCiabw92LEejJYDhfpan27OGe6wzWtBPyuo9rYY5Z+v68XCJUc0ASjCGr+qwKKnqB2D3CpxhzndXc0Zciuprn9XGISDwOS7pEV5QrugB1SOxRSjNpapuX8nSGlgya1uEoWhVjy+vSBxWctEsYR7wsxizz4XHLbJUxDX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=QJpPa04w; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="QJpPa04w"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-930f618435cso138719285a.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786020741; x=1786625541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vo5x/LABgr4z5KWlM8OBLiF0UJfhkaG4qblmSgV8YMA=;
        b=QJpPa04wKEU93cVUT6IOHEoTbPdj1SLgqIogOrZevNcBUAQ4+egaELr2nW/8bkBY8P
         QEz/4gTs+dY30vIaqKCtk6FJeoTG7uYJ8Te8GJDPLJs+GsvvAGl+iWBa7WckxDks+nDw
         YUxNfptFq5UvWrSb2YWhxsPNYE7rIMrRe1ic5P7Fm9hcBNXrg6rnWjd9syuWKjTG3o0q
         QHkmWriyni3+mWGrQSrf1S5FcsaVVZvUKyzybfTu+gP38m2XkiJcarJBGX5y6FGm+YEw
         Qn98v+3MuEtBsSLGFM9qAQzZxolAsRE5FcgM9EzVu2zmcicsyDqMD0NYvor8/u8yxEZa
         R7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786020741; x=1786625541;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vo5x/LABgr4z5KWlM8OBLiF0UJfhkaG4qblmSgV8YMA=;
        b=YE2Kn0McB9+mVydom0QyE0vVgvgo+DLi6Nxdj9Cvn5s4jcL5zsEe3MR51J/HdF5OO3
         SWWEk0Z/lfEKEhPg9pBK6oUtcyotIZwARRN2uyC2zaJ8G9IouA+NVCYM9NNwMfAvHhnu
         cYrMZXwOV6KmyQL+woIDVm2UfsMU4pVOUiJYJPDI9nMFX/NvyN0pvHDmIoOunT+Lj1m8
         t2WcRH/dU1hioV2X8lyJCe4OaxoJ8dqFh2nzmU96wCjMlFBmoXvaKQ9MFUMBhLNGHUkQ
         4kVtBMrWxOSPhB21fDdGdxKnHmsbjpE7FeaICOph//3PelMNlk6OAYQkpyzQO/pH6RY7
         bbbA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1JZH0HixwyEHwcz+2P/STpTD2Yqag5LENUBqiTDCd1pVHo3dgPF0B4OAPDpcfCAzXKFwXFW0ZdHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2WMRLvlrbze9y1wsY+ZQTcMiMu7MpLcorHnhHeKsXEz81nlQG
	9Ko1EYDTM/hbRrh2se4q19n/3AJaaKe5WbcvLaC7BkrZ8Prq4sl66fOmU9wx7mBmafE=
X-Gm-Gg: AR+sD12C3lfKP1FxGw6lPPw8uJDuSk+IJXBGkWI1382TArdwo50vzVGL3fiCK7zH0aa
	ufkI+uGF/KVxbkkOBY/XH/S2cQrt5+EwGarm/gRRBNUARAQ6PY2tXewi1TFZEXlGVNSunXwBCul
	xFl/Rk4Ul/BmH3Gi8JTgSj6Z/wM7qFq0XP9Ci9bvdRPuOBONnkqK0OGeEyfjX8qSQbSjhnO53BM
	MBE6Wc4PYdMHhoeIoLR/SU7gl7wc6kSxtJgs4U61WPQM2u5XQEry6uB3ePrkIiSCohZ5wvMWaQR
	hV8hYZkY9iK4aQQmkr5pgKhbpqUsumOPlwheLUcEOJkA31WQKrtWr+ow33x/CkuMxmehjMGpPKi
	Zqow4NKUandzHGuuL5MiL4XvwzTvFokkS5xJ8nDshRAp75NeEryUrWMtNvfxY6AMIeR4J1S9W95
	tIHMgaU8nnidOomfByesLIiypKe4E0n2IREDnen2b7lZ8DeOsZvFlPUR1a40/i3Wep46C8zLFX6
	wpyIcQL/wB5n563ZXOCx6GWlwULI/nCqZ/BslXfDpuhiS3y
X-Received: by 2002:a05:620a:2311:20b0:930:84d0:fd3b with SMTP id af79cd13be357-93648fafbc7mr1150209885a.7.1786020740525;
        Thu, 06 Aug 2026 05:52:20 -0700 (PDT)
Received: from [127.0.0.1] ([2605:59ca:42bb:f910:6d9f:8dfb:ae1:441b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9365ef833edsm123847685a.3.2026.08.06.05.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:52:19 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <dlemoal@kernel.org>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>, 
 Dongsheng Yang <dongsheng.yang@linux.dev>, Zheng Gu <cengku@gmail.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chris Mason <clm@fb.com>, 
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, Hannes Reinecke <hare@kernel.org>, 
 linux-doc@vger.kernel.org, dm-devel@lists.linux.dev, nvdimm@lists.linux.dev, 
 linux-nvme@lists.infradead.org, linux-btrfs@vger.kernel.org, 
 io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 ceph-devel@vger.kernel.org
In-Reply-To: <4e4c21858705a200bd8848ffe4080522e3eb5c1c.1786018753.git.asml.silence@gmail.com>
References: <4e4c21858705a200bd8848ffe4080522e3eb5c1c.1786018753.git.asml.silence@gmail.com>
Subject: Re: [PATCH 1/1] block: rename bi_bvec_done
Message-Id: <178602073720.2137920.17721545855702977301.b4-ty@b4>
Date: Thu, 06 Aug 2026 06:52:17 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 06 Aug 2026 13:19:27 +0100, Pavel Begunkov wrote:
> struct bvec_iter::bi_bvec_done is used an offset in the current bvec,
> let's rename it accordingly for better clarity. I also plan to use it
> for non-bvec based iteration in the future like dma-buf, so drop the
> "bvec" part.

Applied, thanks!

[1/1] block: rename bi_bvec_done
      commit: b539aeacf8cc5e9d8e5d94625d2d9c697a167add

Best regards,
-- 
Jens Axboe



