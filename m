Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753037;
	b=5Btl0TDcjlV+Nv9FXgSn0Y16eqM3n1ZHYq7lfjXKvtHkz0B1+PU8Wpjn4S8nhWrY7Rcj
	 7hyW/1jOdi2mwIv5sBTLOluSKeB7p8rnFKjjOfcV7RjszOm40YijD7txsIYMvfyDLCt2I
	 U0xI/X14c+X86AHRXpGYfTTn+SzwUJKoANGct+BTIme6vUQJ9Re+U4cnQ+wtrTdGFkhKT
	 4emZePfB/j2hGDScV4A4c6BcN0Rt/wmQjhdxzyyQaBtttYChmIFigfGPOlCHDEHXTXLg+
	 /saEShsJzpDhO4uWglZeA4guUdT7sBmHz4kjpz03CPPb0Qc3Z3CsSrpGXZiuZBCkLqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8qRp/BwQBEaKjJByyj+gyRQztnD96+imNxep8e/AfWM=;
	b=D8D0mWFwOs1+ULbzgJJ96XNK+YVkFyhCyOXSCN+u033vfxqagcfMW6FJdboCZAp10S6p
	 hCLghflAT7k9o/Uk6yOTWpboEbv9tladwjj+09DUV4xqL+rJSdXGt0YQjMdjrQm2M4ODT
	 LhmQE73DlENYO/s85qQHpKa9AdF5LI/nvtVb/Xpe4E25O+F8ij4KtuOcDLmx+yP1FioTL
	 Bqa9T83a3KhepBN8+NV+/LIACofdxaX535cKQQJClQKbqQtG6vhxV4i5FBWxKy0gGUinB
	 pGAhqx+gWh76PnlmrlAS8WJCsD+HFNIiaD7K8925N1iFbyBbemvbji90UijAdRAQoFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=jO07yc6n;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E525B606A33D
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 00:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E525B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=jO07yc6n
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7ce77f98658so39114137.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 16:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793753036; x=1794357836; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8qRp/BwQBEaKjJByyj+gyRQztnD96+imNxep8e/AfWM=;
        b=jO07yc6nRLiWKhwl44KUm1HjezR0c806TH1txeu+TkAiuBJZUYTjCvm2Gu4+X8IXDK
         anrgepMJzdixRVLz0b5bIMCkjKTTt6jyeh97YUwRSizjY69pF7gkSQRQg3oZxemSV2/Y
         9m/US1Jy8Ko0/u7N7X0gECl9Z/+yNeP8EWQ2a1tna/LdJd58H3Gw51xyWnwFPgHhYdoN
         3ixtPYcEhdDsEqmpfJ7CJq2MXvB/mMGobXnJ2vK9XO205dqGYiIm2etbPC+pDWmD3Xqe
         ChidxTH2uNDSVAGdKcS51hPU07jUl9UxxC53kkBk+hUDmpJU5Wyn0guM4i/fF86H8eE3
         ee0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753036; x=1794357836;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qRp/BwQBEaKjJByyj+gyRQztnD96+imNxep8e/AfWM=;
        b=TmszdhcO0G3G3MmOdjlSGAfV7bj4YwMMCGOSTImkSwRv0dFicPbff/EyPn6tp/07tv
         HpCjI3SnjgE6bDIbVDUpkSfkOAy3ct9ERc4SfQuoLS7TX8MlIVihG4La05envQOAJCw8
         Z4rC1W0xmYeo9znDXS6D4dD4L0TdtE+HdFlwPq8BUtk8Tnjo+W/6Tw9UcTmK8+SYtIwY
         drst3L2uNkLv4vhvkfpi5Dvh3DuRyTEnsGSUeR3EkW/96QglpSNfm5QnkDX3xE0+kv6c
         +wxEdUmhNGXDaBs5NA3w3y3NIq1TlCGYQRbMLWPesEWfHzF6S54EY+yTQKhFML0dvq5o
         0SSw==
X-Forwarded-Encrypted: i=1; AKwUvBw4kYmUpzm5VipcBPAZwTEC7c8eebSPMMHZTrLpYwp74gbg+a4r6Go4nyJY3MJhiJkZ9ytMO1KqXc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WnaT/2iAIGvMzsEZ2d0mR4z++QVDzCBgG33bRXp9NLR6sPlFV
	E3+nZMCs5pJrFcz2Sqjdcjfxq0qoH9xuMzADnR+017INK16cdmU2XDjP67Yf7YOQk0g=
X-Gm-Gg: AYBFou2ZY1eZdpE0OMlBeMXQlHinxkW8aXW20W5z6O/AWIO/FtkmpQVBNIm96p9pkZY
	3EDBKqcaIlUz36BRCab9755S+nuyudBgej39VcoZ2B/piTyU6LdFYjj1l11TNhwPkgs1eP+655k
	SmPJwao24fh1mPQBM4PP38Mhou7MpvtFoaswoXrY7wvAA1Ye4D9tAYiiIw661pGyyqHI1xOUzTv
	puVQFRzJO8WDYuE7jNN46CxrIUJpfyPMv1utZ+C5qij9i0a4WjTKReD2ykpykmPn2Lsm3rCC86d
	EWZxxNp4ObDRlQpi3bA3i5H/WJFeZfGeDPZXixxeSKzLa1aBW+83eYvYMpS9JEutfB5+ZVfi0sz
	KA7tzCvK6gslNIM/2ZpskKI7DbXZ8kI0xAUwQu3F0nWvkCDNRIfQyt+rPS+bEPrqsPACws9bxjK
	W5JhnrbYypzfFT0Yk7TcSfZ9qB3+IK8MF3qR045W6Iz7eDEGlXlfLzJG1vgyJhPBXR0VYg1oqQI
	7UBG+dT4obexd6MLZiXo+4hkt5hyzTDZe+6BJL5j8Y2z8A6zOptNpiCZafneNWAV25RZ/Ow4TUP
	TyCx3Ce/I4NyCjz/ZljWWRMYQcr9RWHdh7cqAbXYfKCN6oGeGnpLaqhKWqfE8YsaDLtyiGlJvh0
	5/AxA96pnDS3bjmhWFAbsYweEGMtDXG9MBTs88O9mc4YCUvTxQ9emrR7z5xKrc7SCLw==
X-Received: by 2002:a05:6102:5126:b0:7cc:9f01:1378 with SMTP id ada2fe7eead31-7d07227aa1bmr5468508137.1.1793753035777;
        Tue, 03 Nov 2026 16:43:55 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fef4ed3sm527432137.11.2026.11.03.16.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:54 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 09/10] mm/shmem_luo: Allow retrieving tmpfs files
 with O_RDONLY
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Christian Brauner <brauner@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261103010216.3447716-10-dmatlack@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-10-dmatlack@google.com>
Date: Tue, 03 Nov 2026 19:43:45 -0500
Message-Id: <179375302574.727293.7162114309691231709.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=YJNHuLpjxIokzzpeqa7IUF5TSeIz4RUMcZp7xbSVc0o=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq6n/F6EDZbzsbaVPLjMR9sGnRAbDjC1Ciq/AWa
 k9NfuYfEceJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCaup/xQAKCRC7dyhM23N6
 3lCsEACbXM9A4HxMiLl0Hu2iZsdE1Zmu0oXPj7p9V/8TudGtpt1T3tZNzMqRg6mcMoIdIXCEIg2
 JGGNbNtFurmX2M5+0ioNMR5zbXreBE6AuMkYyEhsz9mLhC6GBjKjgPj2jwt+KnOABcJebeqvRKd
 y4Ya+Yp8Es0cpw17FEDkCzUKbK3//D/WIsWKUn6UM7hucv2w/fAkxpXo5BN543+YBaI8xkMMVRn
 n2g2UW/55sOqpWCgyLP5hKC7O0nH80i67ccDx51adPqeWorKXdA8tAiJGEPA1HvKWrQDq1M5XiV
 TL4ToZhvaP2cDPZOzpWQ+SgM8RR5rEbNjx9HbRyEDqVkGL4ewRKR51X3p3i1MjK/Icggu6iRZCV
 pQA4W2yUN0jd8+lNPUAiYVySmSCxilvwg6NSyXvMmni81dEPk1fNTTLz0RXPakYv7ZOo3Msi6nl
 7tFk0/DrvNUKZ0r6ofwz0pJr2y99tYr9lo1aH+1zucM2oxgldSBR4CeGzDL5Qw+ht5ewGuRtCiB
 ipQP2XasfAbUcUZS6qWGqKtqHwJTzTNR0SpjLgOb1maNy6iJzZa9Ft7S02FAM7S0MoEuYDPga+D
 8lVnnR8pCfP6Vv6S/s9t7rUIlGpD3nal/TBbtUq5aGwpDr8N80Ks9Ddzg29Xk+EE4VtpUcJ5HMk
 PbRmcH5B06b972g==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> Allow userspace to pass O_RDONLY in struct liveupdate_shmem_retrieve_arg
> to retrieve a tmpfs file read-only.
> 
> open() requires write access for O_TMPFILE, so create the file writable
> like before, then reopen it read-only with dentry_open() using the flags
> of the writable file, which file_open_root() normalized, and drop the
> writable file. Like open(), which grants the requested access to a new
> file regardless of its mode, don't check permission for the read-only
> open.
> 
> Retrieving a file read-only allows a restored binary to be executed
> before the session is finished. LUO keeps the retrieved file open until
> then, and executing a binary that is open for writing fails with
> -ETXTBSY. Being able to execute restored binaries right away matters
> when they are needed to finish restoring the system, e.g. to bring up
> the services that retrieve and finish the remaining sessions.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Link: https://patch.msgid.link/20261103010216.3447716-10-dmatlack@google.com

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

