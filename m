Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624570;
	b=yfPQg7XADVqBFenWOdpmwtC9HPEL0xNXIKJfqxMUj5cUTAYutP+Epv1gi3PT7uW+zQr0
	 HlbK9Dq0hbjVGBSgXxhGCMrjw6Sx5XdLwBVFPVBJkV1fp7AgYqSkyUT0Gkw6gsV9tFP1j
	 bn3IKMI/fD8wQpsVf+ygULrKcmxibfT9zTdM7ADueaYhE2nGR0mIgUSYCD17Tg5Af/h3t
	 qguuicohQMibmxRLwPgVMB7Sbd8HTqkEjiG42C07Ual2lLZNEX6mvcd1BbvELSeoMsRDI
	 PysHdh37jqQUdtmhSx9gzV8FsALuStFh553gSIflwoN8C6HeU/VL1CQlUfmFaE1q6Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=+rVghLVE5+gMoBZCIIvb0ZQoGty/hiEa5No/b+jM194=;
	b=UsetX81YfrI3v9AVzIa/ksTEZ0NwVu3QkTNUXM2P3vb/ghcPLnqJ3eYv8HjAAVeruvzj
	 09bPNy5Oq+c1GbfbwudUNcKC8JbKu6Lf1ygJFuP8seaV8u5+8pZaZR4GAU1pHIcPi8EYI
	 pOlL5ZUnDEbvwP3+butMD3DmZzCSDDBAh3wmsXoto5NHN+vjfJeqnm9ZzjRKAObTmflrR
	 Tx73X3B8VZNOc+XCLCV/iIKLY/dP0bjgYsXhE7pUnKne8XzdLf9Pg/XSzHLyj4w5AzQFR
	 D4L57jIWl5MPnuPSJoPatkr3dRP8j+BS0H10AW1N5aEXd3JfY2FcJPHMuKoS3Cs/1CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJsQCXJF;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C71F606A329
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 13:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C71F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJsQCXJF
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ea19bc317dso28356015ad.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 05:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793624569; x=1794229369; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+rVghLVE5+gMoBZCIIvb0ZQoGty/hiEa5No/b+jM194=;
        b=wJsQCXJFRWh2ve+HWhDOpjQOdlRDBfvJKdhwPhWQIWhwYEzH8Kol6MroShdJfHbRuy
         dlneoiPJOZzcvfFBrx073sUxp7iKwFRxUAzGxV4z0yD6imt13l/qOSUeerUH+PGM0h4B
         l+TJGfAUTMJ5Iah6psdlD8bLpKljdsz4lugF9Om7wZbj66ZsMac1gdZZMCNRRM22AQVf
         0UUsD1ConCLu34Yas1nA+xONN1JRfdOcqmpgBzKxrBhW0UBewaRNqAXNY3xpWqYFQf7h
         ubzQgR/UOgJZNAkgBQsb7w/hfVptEG8vTEEQV95lLHbahNQLGympw3hLEoET54u+FSTI
         uyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624569; x=1794229369;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rVghLVE5+gMoBZCIIvb0ZQoGty/hiEa5No/b+jM194=;
        b=KMAjXyb1NTXKfBEpC644eimLJoyUzD7q/ucMVlzptZJtyQ0vqB+CqKBKhW9xW3uC0T
         nw88XnGNCAXFfo9mHFR85M2bPJY2LLIzNYLZRl3kZkQUJDAa7vhMTzijROHPHotQF2nC
         AQUcgATJyIRbVpjM78CLgW6RA2SVx7ihNSNcxhPOtypIoXkX9j/UZ8/cmu9DNeR2AA18
         VxN3r6S8vqDs0pdqGMmtK7DTmBuURk1N2haUx3PNbKAhX0yGqePKPK3VOScYBex5YxFT
         3Tz2oecyt9ZPzhmtyD+lwZS28OWf7xONYakSO+S7HAxh5PU/Lp+pOTeugKrdntug10kD
         ldRg==
X-Forwarded-Encrypted: i=1; AKwUvBwmbTcy53HI7eOUZW/mx6CQHGhmlC2ekHPBNf7qW0TRx4L8OUuRqMMBRE4CpodZ806AatRGCKPN0eE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vLfOWKpUOiGBjorfeb4/VPmYJR9MHtrViwcLcbEpN4zrM84gn
	/w8065WN9YJOQD0vux30b+QG+UpTqW/xusJY0AHYNeUoWHMnE/HdZNEn
X-Gm-Gg: AYBFou1JZ+fLcIeVbAY92J9hlKVQ5jbOLcLfuyr3rrfYIu+iwwe8ZL1hDZsIKJKGR2A
	XObrcfPcPwyL7LaSmz6iYxkahTlSx6N4oTNgQ0qHbpbTUJbJxVzYwRhWp8f+GEHQWQOWt/U/u8w
	sE8LWefRShwgA6y5Rwm2xwOGjRy9fmYnfKFP8wAnlZKrcYxvgdRFSFoSvb8dZYAhwBIi4nOkdEv
	kMXKmk+3Wr3QyoVB9ClD5kYfgl6doxwGC+fPhywVbTqNBLSJ5EP6SdAoPaFpQKwbyplIMKGegft
	3gTo4pz0bGGrQcIVIbKCkwa4TW2PYr2F/fEUbtoLEE8wOGCVfIXB1DZP8eYY2OkGzH2hR57Sapo
	Vs53TZLa5pGO1Q1Ox/dwU2xLQOIZRoKqyvgryMaOW74pE9jPLvBCHfSVVxi88e041NrDuiRA1sf
	hfWFeo2hO2gB6UmX1fxXKgOygVWJRVTKYQqqKO29MLh43mtptAcLeQmMsoMlhRq7cUHOOyDNOoC
	sCw9dRAHY0ChjumNPjhSDqMoRUn+X3XF/kUVgaiF/PUDGGTxWpGtQnbUZsJEg69W3t6sz8ZdXab
	MsCkcq5AqaBG0Obl+xs888Hb5pO2iaYknOPupGQgsGNY2sYNQU8wZlkD8UqKIZQBRSplJH/f+qO
	tmbjnLCG5PL+mocXG6cwDTuHUWFzuLBW5EOouhHYqZlfEM+TqJw1AeQk=
X-Received: by 2002:a17:902:db01:b0:2e9:8b2f:3561 with SMTP id d9443c01a7336-2eb3650034amr96629035ad.54.1793624569079;
        Mon, 02 Nov 2026 05:02:49 -0800 (PST)
Received: from [10.131.7.109] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm27542985ad.25.2026.11.02.05.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:02:48 -0800 (PST)
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
Subject: Re: [PATCH] mm/hmm: honor write requests for owned device-private
 pages
From: Aveline Noir <jm5905938@gmail.com>
Date: Mon, 02 Nov 2026 23:23:28 +1100
Message-Id: <179362220860.2958105.9509793190720553695.b4-reply@b4>
To: Jason Gunthorpe <jgg@ziepe.ca>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>, amd-gfx@lists.freedesktop.org, 
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Danilo Krummrich <dakr@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Dev Jain <dev.jain@arm.com>, 
 dri-devel@lists.freedesktop.org, 
 Francois Dugast <francois.dugast@intel.com>, Christoph Hellwig <hch@lst.de>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 Honglei Huang <honghuan@amd.com>, Jann Horn <jannh@google.com>, 
 Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Leon Romanovsky <leon@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Lorenzo Stoakes <ljs@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Matthew Brost <matthew.brost@intel.com>, Michal Hocko <mhocko@suse.com>, 
 Nico Pache <nico.pache@linux.dev>, nouveau@lists.freedesktop.org, 
 Pedro Falcato <pfalcato@suse.de>, Philip Yang <Philip.Yang@amd.com>, 
 Randy Dunlap <rdunlap@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, Simona Vetter <simona@ffwll.ch>, 
 Shuah Khan <skhan@linuxfoundation.org>, Sunil Khatri <sunil.khatri@amd.com>, 
 Suren Baghdasaryan <surenb@google.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Zi Yan <ziy@nvidia.com>
In-Reply-To: <179352350180.2.12918668886938034091.b4-reply@b4>
References: <179343062238.2.2773026701442863377@gmail.com>
 <sashiko-outbox-192310@kernel.org>
 <179352350180.2.12918668886938034091.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi all,

On Sun, 01 Nov 2026 19:58:21 +1100 Aveline Noir wrote:

> Oh, I missed that. I'll try to fix it.

While working on this, I found that the fix reaches well beyond
mm/hmm.c and would likely need rework in several subsystems, so I'd
like to hear your views before going further. v1 shouldn't be applied
as is.

amdkfd holds svms->lock and prange->migrate_mutex across
hmm_range_fault(), and svm_migrate_to_ram() needs both, so it can't
migrate the page for the validating task. Migrating under those locks
can deadlock, since do_swap_page() waits for the device page lock, which
a concurrent CPU fault can hold while waiting for svms->lock. From
reading the code, amdkfd also maps such read-only pages writable today,
as it takes GPU write permission from the VMA rather than from
HMM_PFN_WRITE, so GPU writes after fork() would be visible to the child.
I haven't been able to confirm this on hardware.

One option I tried is an opt-in HMM flag that returns -EDEADLK and the
page address instead of faulting, so amdkfd can drop its locks, fault
the page and validate again. It works with test_hmm, but the amdkfd
side grew to about 550 lines across the GPU fault handler, the restore
worker and svm_range_set_attr(), and is only compile-tested. Read-only
entries also come from NUMA hinting scans and mprotect(), so pages that
aren't shared would be moved out of VRAM too, and Xe and nouveau would
see their pages migrated in the same cases.

Would you prefer an opt-in interface like this, a change to the amdkfd
locking so that migrate_to_ram() can run during validation, or
something else? I can post the amdkfd part as an RFC if that helps.

I also found a few smaller related issues, and I'll send fixes for them
separately.

Thanks,
Aveline Noir
