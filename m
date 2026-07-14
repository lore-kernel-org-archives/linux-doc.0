Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3237D32E729
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 22:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067699; cv=none; b=gAIuF4VN/PMxFasinp3/4kDZY8eXo/g0lZN+VItJ1AMfZIR3VYc7htLMxaesSmCMEjG9k/pozckZi3rfU4M5cPUDQRpTCEX1f3k6YkJAqh6XV74mXoa1gwMr4aEHLA6NLaVjxgUIIvNkdkib1VqjatqpYY578v8SOX6q4pP8xuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067699; c=relaxed/simple;
	bh=yfrRBEA8+1jTOU/Ov53fj/3O/42x9krywkX8bMxjRO4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bunlJ4RhvTQZhAm/leO0j/OuxVdCSdhfwaUpcUMJMkqNzoK1NvgRWSne08GEfAiEqpDMpW7FkrhEhl6jp7D9u6GDKHJnU6026TYC5Ox7wZKzTdIMv1rvKLgr9i7cusH8c410aNDs8B4GRb0rI3yS/ECLSG5oD4QuRgiFhx8JFCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1iGNVTW; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1iGNVTW"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84867f07d63so5420858b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067697; x=1784672497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s/XP8nJGTiSx4jpNVu3XVkKeZD1kh7QswKhz9rXqGp8=;
        b=J1iGNVTWEe0KyQiu+5OStpLUutxVy8Gh9wWoQqtFoamqdxqxQgOIATZL8pqk99cj+b
         7l6aQCg6jdHL8gyDaVYC9sqCgYg/0R9/RHxBFnbBnExH2oQAbtjFZjJEBVoilbCdReTX
         DdAxpnjAGK4/gSJMJTtBTcQYK8tUgNVHu716ES7B65rFzOhchWzw30Ydk1AYvD4InDsk
         5wtJjKtyarYR2MA6ao6ruIK1W+IfJZYyql/phkA2JinAzCV0JLyzSyYr0jZuu8xUxDOo
         0ByrR1ob3xk3/w90uoAzs9o945rEBI0DraCcd99SGGqJdHlEe4A1fyXHtk4DA1qcBceV
         MXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067697; x=1784672497;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/XP8nJGTiSx4jpNVu3XVkKeZD1kh7QswKhz9rXqGp8=;
        b=A9kyA3Ynt4V/uJpB8Vskv+jGxJGtdZrBoEX44cNPuPplOkBrX+wUT/IYs7pYiwQF2y
         JR8bfeCGFUE9LYgem6RcKxa/KWYXxTufXwewa/5BNlQHCC/9HOoQ8iSaFSJw5GcLsoBw
         Pcj1VpgjnYtjt7OOFqb4tgYcusv0aJfKLV54GxqgfhSzHxV4g3gMXQK8TbYPHh8+UlDa
         cxgrrS8KbsUgncgZ/0jO9s0DjZIDMZeBPYa7GGbIXMbslZW1iyH0RLF/gHo1Om/HKz+O
         fszKUU8yLnAi9kBcY4i6rVCeUIfFSsHriV7BAtbtj32BMQYTkxUraBeAGrlKLTRjJfQh
         ZOmg==
X-Forwarded-Encrypted: i=1; AHgh+RptEOgHuPEHd9xEm/JDDRC92irmmOGiSz2RfM92jB+1GqjQ/qcKmaZlg9X22js32aPIp83MG7vZHfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUZBbfZGsbUCR5xV7HNRIcuBascsqFvzlwxxjg0Dk5WMzp9fMq
	dDjDNJFZ3Dcu/acmWXu017IM0uvbfIIa2tbbKIxOJOfAnzIs1qxSkWuV
X-Gm-Gg: AfdE7ckpprTCMe9tQ5qBa7hBiDd/anfhcfILfNmpzBTSeaJmnm/g98z69gKX1luUSG2
	WhfMpp7/3W0Ms+J5BihlS8NEs9sTxYXCcKu1SGECcwSyxe1q53gXMPrCEkNlgV5+z5OxvAt2NkW
	0P5UWt0uyi4a5TPCopj7xyrhBplXY9kCw2Lg6bTzrnCVWFpMjhDe7dkf2vkPto02PTjeATgPV+R
	Z+JGliCa9CiRcvQbhvnqSL1q++ZB6h4by40E5NvuIaVLiE+6Oq+caxzlfrGhZFKCSw4JnefbJBz
	4ydz9K7PA+subl91uIwpm8eDpX+/Rzmd8mmxuS8/2BpFZgmQrNVzYHz0kpZi2GANGuBw4uNyzLF
	p0EkNLri+zg+a6hXZTuH/Z98L0jngwmX7OVHrbOUM6R21wTMDsUKvFf0JvvHQoJisx5xWzGRmPa
	IKm8P2tBJHD57OEiR/+3IBMXSEPIF9fTxSvbtw5648NKaK+kzrR/ul06lELPGEgz0+scDY4Q==
X-Received: by 2002:a05:6a00:4b13:b0:847:8dec:141f with SMTP id d2e1a72fcca58-84a672ea3bfmr293017b3a.51.1784067697563;
        Tue, 14 Jul 2026 15:21:37 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f238f75sm2119769b3a.9.2026.07.14.15.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:21:37 -0700 (PDT)
Subject: [PATCH v2 2/4] fixup! drm/nouveau: use
 hmm_range_fault_unlocked_timeout() for SVM faults
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Date: Tue, 14 Jul 2026 15:21:35 -0700
Message-ID: <178406769581.1106335.2090301352195900623.stgit@skinsburskii>
In-Reply-To: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

nouveau_range_fault() now uses hmm_range_fault_unlocked_timeout() for
the HMM fault path. Pass the remaining SVM fault timeout into HMM as a
positive relative timeout instead of open-coding the HMM retry loop in
nouveau.

Keep the outer absolute timeout around nouveau's
mmu_interval_read_retry() loop. HMM's timeout only bounds retries while
HMM is walking and faulting the range. Once HMM returns successfully, a
continuous stream of mmu-notifier invalidations can still make
mmu_interval_read_retry() restart the operation. This path runs from the
GPU fault worker, so fatal signals for the faulting userspace task cannot
be relied on to break that outer loop.

Use time_after_eq() before the HMM call so the remaining timeout passed
to HMM is always positive. This preserves the old timeout behavior at the
expiry boundary and avoids passing 0, which means retry indefinitely, to
hmm_range_fault_unlocked_timeout().

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 4cfb6eb7c771..58735446d783 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -678,14 +678,20 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	range.end = notifier->notifier.interval_tree.last + 1;
 
 	while (true) {
-		if (time_after(jiffies, timeout)) {
+		long remaining = timeout - jiffies;
+
+		/*
+		 * The HMM timeout only bounds retries while HMM is walking and
+		 * faulting the range. This fault is handled by a kernel worker,
+		 * so fatal signals from the faulting process cannot stop an
+		 * endless stream of invalidations here.
+		 */
+		if (time_after_eq(jiffies, timeout)) {
 			ret = -EBUSY;
 			goto out;
 		}
 
-		ret = hmm_range_fault_unlocked_timeout(&range,
-						       max(timeout - jiffies,
-							   1L));
+		ret = hmm_range_fault_unlocked_timeout(&range, remaining);
 		if (ret)
 			goto out;
 


