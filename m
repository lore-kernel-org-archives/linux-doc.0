Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606577;
	b=oBdeCLoFrVL6UhO8A86KbFiGAkdf/SWWdsPTyRjuRZxSHAPtBGFfe66G1/HCm6ydbp2c
	 vDnLSaVSXJtshtFOaV2CaNmXP0V6XaNfXet/hgRzFUjx/zN/EihhvLkmIWIqIgSJ+42YA
	 d/kHyWwwe21HMTXZy6K6gGA9kLbjRKf75QAfWO1RoytGAGtM1d4ySxjcCG1EtEOCH0qrE
	 GcEz16ugs42jQ+aUHHRLCN7VuITNdwEn1zBRzS8CW/xQ6JQJpX5MxZnxkfQNDuwep/jRd
	 TqhD8AtSpyoujMlUJsG++5o5EFwBBddVl2oOS1iuDhU2IJDMy0oLn04RtBSouFmOLbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=/qcsr62uFOhvdCv1Z4CFJXXaONdJiHRFO6Btz2367L0=;
	b=OJagMzjfVdkgEKi0iHDPORj7T0Xn87WLrzgPkePbLxLJpfcMHyQxUwspnKQ0VN1ng91N
	 H+UxOYBBk38QHnl+IgyRzD1jbbQ6XPCEgnp9BhJQ+43lyZFpd/44JIIF7hSq7SFTNNvVX
	 GAuQ2eUs7j2pysGYFX/T2/37ROObmb5cksGE53B8XQpBF12/8s+j9QJa+HO296dAsARQI
	 KHOi69BLwovW8mArmwS8uvsmFyP25E5ZGxCANAHoSoVsqhEEF8+HFUtaLwwbX4ufjkz/I
	 nMLMkt/jevdlEl1qgvsBoRzKt6m4PzezJRMNYn2vVgJC3cNsKNdPLvXtMYmIItBcRIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ghqIEHNU;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA3960A2637
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 21:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA3960A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ghqIEHNU
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91f30ff609eso7595136d6.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 13:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794606575; x=1795211375; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/qcsr62uFOhvdCv1Z4CFJXXaONdJiHRFO6Btz2367L0=;
        b=ghqIEHNUTk/Egmeku5ypK1Wz5tcQukr5e5ExNt3NiqCSADJ0H6FB6nWIAfBthKyuz7
         4Xqameh7l18qWPZ3TNz1BUzTHaARTohdL3Zd7gjqrhsDglIKqLef65F8kUYnxrTHB4Zl
         bo90KaR3amttm01kClcxvL8wxycMxohW0EzetFpZWf0eNdqqGIY93nDUjCPEnaGY27q9
         4xOOCpH14vnboktINgLxJ3nanxglA8VyNnVQlMIBaWnV4hH39CJiaU9+ZSZ7HQqRjie5
         Fkc9v66buLfQpspMAvkyrwDNPEy3EEqInyN3YC/kybPSgnrLKdkX7kyCs/WKaMEkqq8k
         2TTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606575; x=1795211375;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qcsr62uFOhvdCv1Z4CFJXXaONdJiHRFO6Btz2367L0=;
        b=moF3OWehgzg/QF4LhEPqI9DZJMITaSTtR1/vVj77MQMQc4Pa5dp+NH+JaNHSvF+1L4
         ngS1asLcgtupUF2LQdjstpz7I58po5lcffBtqrcACk4WFKxNP+ljc/QoDf6e23rxcxUn
         tW39TTWJRnQXcfRwZV7M+SyJVPzzHvDg4bbq4nFJS7c06McYGFcFnv5i4w9XEybZ4Aku
         Eg0u4XdQRk7RDfLO5pjsTqYWl04QR2Jv//dXkpdh4GS6aEloELhNBECJGdzqUEPfBin6
         eR2hNubnShyELbN2qr3BE+7yVSAh9D9l0bunB+xesGbhblR+vEcrJ3fLIOOiMFnKfR2/
         +ipQ==
X-Forwarded-Encrypted: i=1; AL+hErEWeNjNQvJdEq/igC5sw6b0TegwU6KbAnkmFmvQugiD4YfIql1Ng8x/XCHk5gMZK/yAlgjv7uMdelM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Er6I2fxgmasja3zeeudQOTfCXHOP8m75RBZKjp0HQOCSZfk8K
	S6TOZ2iFcHtto175hyTYhoEc6zXfbhk4TK5x1LI2y2l/hsrobp7gnkANzrIH8tRBc0M=
X-Gm-Gg: AYBFou1mKkfRQjmOSj55bto1p7l/pg0VfY9hizpCGXVblpXdHgEBNDQmCBx05bCIoJb
	WwWWE86I1m7m1WS+MttX4/WZ1YSCZG2vRvPH3dhSoXHwddlWSwzPleWbqxJ8yJprv2J0v/NxI9Y
	AXzbdvIunycuF3ZccPrZvvfjcAAcqYQrOzglJb13FZhZMn73WTOBvHzJQ+DVkpj7KPRqjGkcsK/
	9DYMwjVKn04mupKI/aUDOD5YmtTQCmWzEl4tFVt8QQr5rkuQjRkWkM17hIdpwO+ZVl1cKc7GFqP
	xxQt+U+nVCccfZAKNtjegIr++iex/kVNXGzB7GHKFNjDF9xow0z+w7lZ6mAMm09EI7rlBl+GvP7
	nokG2T0z6bHOXgRcctgoregOqExWtFPYzsdonq48yTGjwg2Rlt2497C3g5Ha06X3FmXfiaamrsb
	sSX5etSjCqm/zyaRRRWo94km4CYqR6AgIaX5BljCrIceALjE4iTWq1uXGw3e0Hhd7qct0Zx503/
	4WldWCoHJxrD31RjY8/uxwqS0wPIIv7R3y7Q99FvJdTmsqPQwPUQhCdorhTNazDv/ZURwmpOMs3
	4fNyQDdWvv280fkKAAEGbNbXmR9/elN4Sx0gpVN5NV5GMTBB4gqu8O7odDQ5/6AJ5KEkJPCXUUL
	lUw7V8FI=
X-Received: by 2002:a05:6214:5784:b0:91e:9437:95a6 with SMTP id 6a1803df08f44-91f24222b57mr56835466d6.47.1794606574483;
        Fri, 13 Nov 2026 13:49:34 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d459c6sm29868656d6.14.2026.11.13.13.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:49:34 -0800 (PST)
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
Subject: Re: [PATCH 11/15] hugetlbfs: do not grow a sealed file in mmap()
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@suse.de>, 
 Andy Whitcroft <apw@canonical.com>, Miaohe Lin <linmiaohe@huawei.com>, 
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Dave Airlie <airlied@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Peter Xu <peterx@redhat.com>, 
 Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Gerd Hoffmann <kraxel@redhat.com>, linux-doc@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, 
 Chris Mason <mason@kernel.org>, stable@kernel.org
In-Reply-To: <20261028-fixes_hugetlb-v1-11-a0a033db180f@kernel.org>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org>
 <20261028-fixes_hugetlb-v1-11-a0a033db180f@kernel.org>
Date: Fri, 13 Nov 2026 16:49:32 -0500
Message-Id: <179460657279.482102.3328777708780344971.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-28 21:13 +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> hugetlbfs_file_mmap() grows a file when a writable mapping extends beyond
> EOF. We are missing seal checks similar to hugetlbfs_setattr() and
> hugetlbfs_fallocate(), allowing a user to grow a file that has F_SEAL_GROW
> set.
> 
> To fix it, skip the resize when F_SEAL_GROW is set; mmap() still succeeds
> without growing the file.
> 
> We currently also allow CoW mappings to grow a file. Disallowing this,
> maybe even only for read-only file descriptors, could break existing
> userspace, so we have to be more careful. QEMU's file backend is an
> example user that might rely on such things, and would suddenly start
> getting SIGBUS when faulting in memory outside EOF.
> 
> So be careful and focus on F_SEAL_GROW for now.
> 
> Fix generated by an LLM and sent by Chris Mason in private.
> 
> Fixes: ff62a3421044 ("hugetlb: implement memfd sealing")
> Cc: stable@kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: drop comment; simplify+extend description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reproduced by growing a sealed memfd length from 0 to 2MB.
With the patch, we stay at length 0.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

