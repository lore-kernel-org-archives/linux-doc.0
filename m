Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AF32E401;
	Tue, 31 Mar 2026 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954843; cv=none; b=QaBEuuSu+ttDsU66Vobsf0WMGeEpG+lpxpJ4Q2RL7EDzt28DeyWfx1WVVVCEg4sAeiiFboI6tYVKsC07zvDpVUpJHWO9BDiPQQ1RHPJzVddeYre5fKMWPkoLQYkRBppA78CO6b/zruwiqgHtSsnxv8eDwNp1afMIVukTQMVjE/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954843; c=relaxed/simple;
	bh=LQ8JPJu4hVwXA6ZBcwhWKH4JmrXxTSQbw/JmwDUjF4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DfT+GbgrC6En4Tl1f56PaQ4n23kTSnIqaA0gk6+Ruod4RowIlifITr1ll3fIvZ7kHl6yJDA5E0Abkbq3xwDNiC+Y43askY6dfIJ9l0PQQg1FbhCRn7W+SPoMi2ejvxeCpq+Gx3LJiMlOJmoI6EvWoeKp5B1r2+odm3xwzKtYfEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=I6HMSAwt; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="I6HMSAwt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=D3oi2WL9aVMRGCDxrM3eE/b0NGQJJRrFO3ofQ0V/e2I=; b=I6HMSAwtXrXIBW/RtXa5KMCct0
	RFhBLw/Ml8GEnRdD3jC5twXHbmCG9n7R9uen9ldHC8fOfReSvGMHw5JtfyJazu6CzXf3YZrUSC97t
	p7u0lWe1mycrtaaIPzyEEu792zso3aLoEzUZ4nBSKP48J1tmhaLAaCvapG1sRkcDEPzAeFLixZg2H
	tYd+POTt26PJwTgmrv3XMa9WAIbTXPJsru0AV+ypvGe8yGBkjJGhSiVAewkTu1xjsINvAqErakkej
	qvKwgQs1qcOWgsCGQgnl1CSaDY/wyw9eitLI65I73sqy5x4o0GR89OZPkYY/usqQANopiz4q6zDpt
	ZrH5GjIw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1w7Wpl-002Aan-26;
	Tue, 31 Mar 2026 11:00:32 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 31 Mar 2026 04:00:16 -0700
Subject: [PATCH v2 1/3] mm/memory-failure: report MF_MSG_KERNEL for
 reserved pages
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ecc_panic-v2-1-9e40d0f64f7a@debian.org>
References: <20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org>
In-Reply-To: <20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=leitao@debian.org;
 h=from:subject:message-id; bh=LQ8JPJu4hVwXA6ZBcwhWKH4JmrXxTSQbw/JmwDUjF4Y=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpy6lIlRQLIv0IYw8ryV6vm0jHNbCVtjXc3Xeou
 /NgiA8DHsSJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCacupSAAKCRA1o5Of/Hh3
 bYf6D/4o0UQMOnG1ClcQ3eCmn9QhVYwmpu9MYpIjydSGaoNVYxGa307x7T1pueq49fEWNJ/Zusc
 k980fbsdTXIiyklHxWai/4hiFUtmg01JLk2KriPOc2K0Q7JNfu0avc9hQYBBXD2jQTwFIaPNgUt
 7SUUSAu5uVIUbZstjQH5ocHkK5Gaa0OCLw6N6zxFHDrVecwDugein1NEM66fDdwSBXf/HsSYldJ
 ftIR0ktUz1CYQ54sGy88qX74FGO3EHVOukUtQhAHeTt5nobKW41ZSRBPpNkjRRF5yBEpyx/RspP
 ZQ1g/5FVwH7h86wDMky/6fjO7lRwkOQnqt4LnuU7hrF7m9eMkPJQqCRJHSodFMU0AEVnChPNNpA
 sKo8IhZazArTBvbBhU1weDQccic99JUABt2gdmlaAWQU4NLRl1jm8jvAcilIlpCETZkPmowXHfc
 hSrI3tadNC4ub6cXy/Zxrgf0GEeyJjf55eXGhPm+0bhohkNau5Wrde/X9UllEZUncsQNG80egzT
 kfUXdZ1+eIln4sPROep8qcrAiYzzb+2URoK9gXl7/e4XOCnlbO7erdsUcnWZ0BA+BMbJAeBbf7t
 viXIr8vpg6o0AMMCAHcGm+7IDPuxN9KLNV16eNGys8Xuz26T9/GbAnudITUEXAI5ehn4Ux9br/R
 yioz27gGZ/S+V2Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

When get_hwpoison_page() returns a negative value, distinguish
reserved pages from other failure cases by reporting MF_MSG_KERNEL
instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
and should be classified accordingly for proper handling by the
panic_on_unrecoverable_memory_failure mechanism.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/memory-failure.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index ee42d4361309..6ff80e01b91a 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -2432,7 +2432,11 @@ int memory_failure(unsigned long pfn, int flags)
 		}
 		goto unlock_mutex;
 	} else if (res < 0) {
-		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
+		if (PageReserved(p))
+			res = action_result(pfn, MF_MSG_KERNEL, MF_IGNORED);
+		else
+			res = action_result(pfn, MF_MSG_GET_HWPOISON,
+					    MF_IGNORED);
 		goto unlock_mutex;
 	}
 

-- 
2.52.0

