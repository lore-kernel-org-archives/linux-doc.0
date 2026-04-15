Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8562C3255;
	Wed, 15 Apr 2026 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257751; cv=none; b=EhKeengNIl6UC36uCr+PDGH6SS0Q5c9GV6KETvgo08yDBFm3jGtIO9Nn8naINURHfEes1PvjtMRNjLCx1spvFk7xVMxPYQhQLEViJWp+P2eZ6wG9e6TGjpvmZst6aNe1dvrwDlky2UcGYb1vmLCvoN/Pr/YaGdTFMLNcor01sag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257751; c=relaxed/simple;
	bh=gqQVMT9Twy239JXZaAdY+DqLzM5N7ASaSKNxyeQsFwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTEorXaXZSndB0oEj90WLnN8GWB51F5Uztq5dsIWSx/epF/522MCgd5/ZisRh0GS8uoOvwtHJtUTHnwE+TxV0X3Qu47yXsAa22geEbJ4yxFf1AP2XM0AVjq5uddwEKq69Oh3B1k/n+soyNQKa7KW3gl8uCHAyyoYti7Twei9JIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=IFJ+GOGS; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="IFJ+GOGS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=2DOYW7+fbeL2VNYTSascVM/JMexV13XGSf3P0Srb5Ds=; b=IFJ+GOGS0YQUYc6mik52wA1cDD
	MFWB463UWmaMPNuGOyI5IdsLAdUyBFiCLDQCZASKw3tPfwYScMXeqQAQz13uDHKbgwvwTfRRwFfEH
	+Fg7Ls0UDOaH0lwEYehEtvGKp/PtN2YY88ezIsrVVNDCR5gBiOgva7pXQzkpajNCvz+6gN+iHXh+y
	M9dFguDy1xu3052goKY6mEjGVfn5NWXj77n4kOQBInXRo31aK4goaN1yoC8xGHHQIjY/4fD885eU9
	bnDgqpcXP8Ty+BPYa0/CCTah9+LbpbNtup3JfVma6pkNxUalMwDhC4dgxg3c/Gr+d3e0mbX6Ep5g2
	Qfx6T/6A==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCzmT-00Dqoz-0H;
	Wed, 15 Apr 2026 12:55:45 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 15 Apr 2026 05:55:00 -0700
Subject: [PATCH v4 1/3] mm/memory-failure: report MF_MSG_KERNEL for
 reserved pages
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ecc_panic-v4-1-2d0277f8f601@debian.org>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
In-Reply-To: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=leitao@debian.org;
 h=from:subject:message-id; bh=gqQVMT9Twy239JXZaAdY+DqLzM5N7ASaSKNxyeQsFwM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp34rHDcA5eHUSdXrkgeIaYk41TbbLb9TXl+BjY
 6x77pV5theJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCad+KxwAKCRA1o5Of/Hh3
 bQIKEACD+IGdXtgFH+lisYO7YsRhhqel9PluKZzzcoUfGdc6P14H+TFb2464+DI2oIPNAwvgEwX
 jH9rCYctvOXLOw+xWMLkV93suYqaue4pinawsq7dlXzc1HakW3UH76VhN5H5MH7MfO9H4hRCjgg
 HNyZJ1mpxffHuF8X+Jfd4JKSAXYrBJBAvIWfJviY1wCvEF+h68XRH2HI2RHkv2yNCnXAMlsjRBT
 31tfanmOy4aoiTryVFnKyT25hYzyV1Xo5nxLUX9r/Xb/ZiDwLzAEGmS/+TDGM9Yea8F5+yBBU9S
 RS6s+AwbWWz4v+ivEIdpdTcvPkMQQJZEVkV3y0xXCOONj/AipjpNtZV9VBG+PbsbD0dJMPCZnUv
 67DIBtdwz578QF3Y8rDlYvHLEumQdONxvgbtoW6ojj14MQewkKXoFA7lD38Yvr+VcSITd66WpxD
 BmBCO/CEaoEjuYM17Q8xHmaUFBKAasx3iLhZcUrJVWVk1fFAJHmhdwHSpIsXeZeR1BDw65iZBkG
 yFrHFacYkad0q04Vr0wjHxNvsEnLiSYvCGjKnF87lixM2iiTa3jNbPTv7dtEQtw9YmVLqgYSJ1W
 fDcxEAwGxw/ghBrItBe4N7Ug9I45U0k1DQ7jI05E75/BX5AtDMvl9seHv7zlU0Ez5Yz6Da991zw
 52c86c15KsiVUHw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

When get_hwpoison_page() returns a negative value, distinguish
reserved pages from other failure cases by reporting MF_MSG_KERNEL
instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
and should be classified accordingly for proper handling.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/memory-failure.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index ee42d43613097..7b67e43dafbd1 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -2432,7 +2432,16 @@ int memory_failure(unsigned long pfn, int flags)
 		}
 		goto unlock_mutex;
 	} else if (res < 0) {
-		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
+		/*
+		 * PageReserved is stable here: reserved pages have
+		 * PG_reserved set at boot or by drivers and are never
+		 * freed through the page allocator.
+		 */
+		if (PageReserved(p))
+			res = action_result(pfn, MF_MSG_KERNEL, MF_IGNORED);
+		else
+			res = action_result(pfn, MF_MSG_GET_HWPOISON,
+					    MF_IGNORED);
 		goto unlock_mutex;
 	}
 

-- 
2.52.0

