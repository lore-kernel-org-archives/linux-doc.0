Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E65C14BF8A
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712941536; cv=none; b=G9IQRyeT2Ae1TKkYZxzO9aT5rZjnPxrfYOvNIp0XLNU48D6jFrO0ThGcLqACBQu8s4PUVEpbdhXR/qMQtGRgpOgwfVaqKNnNRgJVIFXeCyfv5DY1U9R7MVS2WdtqEm1P/kuAab0iX3vrrWNFrvMmWZyxoYu2jz1hLIIJwmlQXzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712941536; c=relaxed/simple;
	bh=+su7OSUJsFls4CIQXxEZl65t0clagHiB1QsWAMbAmDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dK5bywlA9EF1cus3pqnJlgwtbw8wcOkOrDeHIi9R4QoOIbPgDu8FsfUM4gXTsR/25p+Pq6miI24FJor5ZjVu4sSFqhwG9D6ILk/CKjpiZUXFHbmo1ZDkS1JRKSQmO/C0XBE/FtxLMZCdzw5hKdsctuj4XN+ZYbtCE9iCvMbvT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=PIA/i4s+; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="PIA/i4s+"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-22edbef3b4eso404854fac.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712941534; x=1713546334; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/EuVGwHTxmbtDwTp4fNMFd9ojHayxYpTNJMubGDO+yg=;
        b=PIA/i4s+83uQbaOaXto2oSszm8r4MTN8R47nuVJ5DKe7kQipQJoPAEJLySGKEaduoi
         fBhzWW8686wJPotlI9vTyuNTFVQ1/NgKD4YGRbAwmGPCE+EW6hcRFU6vD48QyFN0oiUL
         jrcLnNsM9nFzlKMCcrZxq0Prpz6jiiVreEg88ZC+Dk9IyK6in6rraBhlALD1hLnfPbj3
         KyGuJBg3D5Y/7hLw1+Lo3fyfpQLwtYJ4c9QxFHdczXGO7nHr8k7m/4N1xKArcoGF+/oG
         jeLKP3Gh7zn1JEtCgwVWkdYSNXUIayQvSZXgWtYEFlLNy0JbIHimXFCGGHd6DNop9T2f
         0a2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712941534; x=1713546334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EuVGwHTxmbtDwTp4fNMFd9ojHayxYpTNJMubGDO+yg=;
        b=nMcaQTgiOOmDPdPiYb4mrNQlh8LICgxVssOL2fRpLqiw5mFze44tGGexzX/SPu2Fxd
         mgNfCGIXmRRcBmwOB3Cfb7MVxI4XrNgKRuUIKwz8Myys/uoyDRegm+mMsX6Vvu7ukmO2
         /edqfiFbvnyKAB81xOxTZAqVXRUr4icoWbAPM/mqHnR6QQMpLfPa5Ow95wLCdBiGgb9k
         Ph0sjsW8apSwgcC7jWgT4YHUN6Sc8+HE7/EbGmH0tZ6g+41GjwjtxBzo13eoRC5VIvhA
         tZ47F/aAdJkY5PIDTA8F7hbFTyWBe75WXp6aOlRCRzoLt/IIM3WaBbHY1CqNlLFxBo+5
         LrUA==
X-Forwarded-Encrypted: i=1; AJvYcCVyM0+VDY2OonKl7KzJL4EwBaYiYE8ZuUIpHZCgHGqmzcxPUK+XTV5T/4buWj3FelTSTz06DbbZATVtG0si2RhF/2s+pPDY5W53
X-Gm-Message-State: AOJu0Ywc7W0VNhpNW5zTx3/3p4UPdeYq8nbvO6/5L1ABwvMI+csudXOI
	JiMTuTrVyzOZghDaYtmC2STGQ3uGk2rQcOg5HtTxkl9EivGWMNolcbJcqfegOLehjaj5beBmub0
	ZZ5BXqThev/qlpIrOp+tm2DLR2s4MRaOjmWZtAA==
X-Google-Smtp-Source: AGHT+IFFWNWDQpb4IdXMSld7uI+GGFrLl02QQNkjBBmvPtfyGISuhykwiEhQTc4Uews9+sCsYC//GV0j7fEO9UlX82A=
X-Received: by 2002:a05:6870:1650:b0:22e:ed14:3e3d with SMTP id
 c16-20020a056870165000b0022eed143e3dmr3334118oae.33.1712941534211; Fri, 12
 Apr 2024 10:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220214558.3377482-1-souravpanda@google.com>
 <20240220214558.3377482-2-souravpanda@google.com> <20240319143320.d1b1ef7f6fa77b748579ba59@linux-foundation.org>
In-Reply-To: <20240319143320.d1b1ef7f6fa77b748579ba59@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 12 Apr 2024 13:04:57 -0400
Message-ID: <CA+CK2bDMNkCq6ts1BLAgJbAcUiq-106GCZZr_=cU0hW+jDYeiw@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] mm: report per-page metadata information
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sourav Panda <souravpanda@google.com>, corbet@lwn.net, gregkh@linuxfoundation.org, 
	rafael@kernel.org, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	rppt@kernel.org, david@redhat.com, rdunlap@infradead.org, 
	chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, tomas.mudrunka@gmail.com, 
	bhelgaas@google.com, ivan@cloudflare.com, yosryahmed@google.com, 
	hannes@cmpxchg.org, shakeelb@google.com, kirill.shutemov@linux.intel.com, 
	wangkefeng.wang@huawei.com, adobriyan@gmail.com, vbabka@suse.cz, 
	Liam.Howlett@oracle.com, surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	willy@infradead.org, weixugc@google.com
Content-Type: text/plain; charset="UTF-8"

> >  Documentation/filesystems/proc.rst |  3 +++
> >  fs/proc/meminfo.c                  |  4 ++++
> >  include/linux/mmzone.h             |  4 ++++
> >  include/linux/vmstat.h             |  4 ++++
> >  mm/hugetlb_vmemmap.c               | 17 ++++++++++++----
> >  mm/mm_init.c                       |  3 +++
> >  mm/page_alloc.c                    |  1 +
> >  mm/page_ext.c                      | 32 +++++++++++++++++++++---------
> >  mm/sparse-vmemmap.c                |  8 ++++++++
> >  mm/sparse.c                        |  7 ++++++-
> >  mm/vmstat.c                        | 26 +++++++++++++++++++++++-
> >  11 files changed, 94 insertions(+), 15 deletions(-)
>
> And yet we offer the users basically no documentation.  The new sysfs
> file should be documented under Documentation/ABI somewhere and

There are no new sysfs files in this change. The new Memmap field in
/proc/meminfo is documented.

> perhaps we could prepare some more expansive user-facing documentation
> elsewhere?
>
> I'd like to hear others' views on the overall usefulness/utility of this
> change, please?

Sourav, could you please consolidate the cover letter and the patch
into one email, sync it with the upstream kernel, and send the new
version putting the necessary background information into the stat
area in the patch.

Thanks,
Pasha
