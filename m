Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2343B8934
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 19:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453661; cv=none; b=FHxvbn7Ub56jWQ8O9IKarmIYUXSmWVRC0aGd+GHoMfgPkNS33l7HWURH/VRwyacjpb2k4T2T3CI4T27ZJBLeqXzpZZJ/dAGq5zCx76xhtP7WPBpKPV8UoQPn8veuvlSlwnXE3F6MI6FMZ6y5xuRDT0dhDbFenlcsBP/vv29Vbus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453661; c=relaxed/simple;
	bh=cLajtPW0MZ2OaqGeLhMH9ovKQAc7UWeuKIBvIqrQFY0=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MroQ85EaMIi3O1lXco0L7IXTJbf3CO27GUJv84hOev/0sWiM97qS4JojfJlPdBPGVshplt5WSCA6g4rgFkb5BvGCnEtuykn98AOUULt52SIREL8nhuJnYeh7QqKIzR0jzkX89kXV1g3rd2ZP4B0LXZdjHS4ef5lhppL95Pd68RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hohY8F+R; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hohY8F+R"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caea3f742bso66374715ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453659; x=1784058459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+Fuhl2eREcU7wQkONDn3KjcEE0Ws3TgFkFsQfjplBps=;
        b=hohY8F+RKdiRcr5Q02tTxf0dBC8c0szuQYsfv5idKDm8lYCkwpz30Ghaf/E6sTkP/p
         ke/KokGFkDR3b75JOLXFR+eLCb9O6I2ESkB98dSr8UfZJzUGiZHHc84GJnjMXT/QWfVt
         nAanhIPYJ7FHpoUpeJ3VWLdz+0nTVZdTYmcsbI+/8PWZJ/6CYg5JcixkuSLYUqmjNlUQ
         GnqJmirnjUDPEPQCzWkXsSmCmbzIUx/ha0onl/hx21eikU0ymBbnWjF9lJ4QYsojHiEM
         ldBNWjzPUEGQe9bxqSjYW4Mf8Zs1K8PZWScXqLIZirhFNH/cBBl8S8iBV0moF/PqR0c3
         2o7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453659; x=1784058459;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Fuhl2eREcU7wQkONDn3KjcEE0Ws3TgFkFsQfjplBps=;
        b=IlHsttZOLkGZH7SEKQNqHlDkR2DzX0hUfgw35p1QE8tE42lNCKwY6mqp5ZsArB60Lv
         PTEMSlWyGmX6s26wg3mnXRf4w4SgQ3Kezk6spl7VjQwx7WorVNi1E9Zgj8qio2uQzxi1
         +JG2vlGbPkd5+VSWXOskjkhaEt4fNY7ZVf6BQ23uybNVPQtptm2N3/uGjvHUT0XC9YSw
         KmGUkBGkBZRJw/fTHv7KTfRef+KR8Z7FgKGdSqyPWznmCHVU4br/8GFs1HSPh+DIsL23
         arOWDjJJAEixk2subT1lrLhjg7LBtfsKq2bxBUsVth55CBv61JVocJOQGFYwhAj+LE9N
         DQ/w==
X-Forwarded-Encrypted: i=1; AHgh+Rpi3VjFZmg34sUtMiouKzEd91UsFvOfrcSdfX9Ua67EOFy0pF7oSS29z050mYd/Dl6mYT7rOwgiG6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrVn9Wop3O5RfqvSiJWxnBwcbxG2Z1XqEALRhsAtKllCce3Iou
	1qKQ9vIcMPiD0PomJUQyqhMinXwU63cd2lXJo4fLaVbUynIXmLtSbJG6
X-Gm-Gg: AfdE7clDI22fLtDyV3BOPWMrcfeQxfHnMDd1budnp0FsOTgXdFR8T/3P8UJIH8me9Hp
	YaEXgOlDsMD3zy3kVwELYZpA3pgoX4K1iZjTKhCA7iwHYVf5BueV9u9iBSI0rDISeaE4CAoaag1
	GhtrgsCkyJyU+9R2cai2Orc+ae3h6Ngi/36AzDXcj4wr9d9roagZjq/fmRaiYoQXCj126p/Zdcc
	EtD1R7nK5Yf8+HENr8ZXp4Dp5o3ut/h/vnHsJD5fz3feVYqdTmf0n1zcaSUoEivHqWYk4FrXgU6
	cOoDCR43MJeMlKqnNu9i44JXqmSysuG8R2nmRsVQC/2lUwXARS5wYG9lWPy7Mdcpk5cVEekU7L6
	mMWLY5Of9JOG4/mKxX6RKywUC5fPk50tAa10od9w0zf5jAuZ0R50PmWKIUPSY2vjNPhzdU8r1Vt
	y5WcQkVVDjKm0J+WgYceBHll9HK2YeIDbYTZqGvGab/IB1O0f0nZ2vMJdK6ww=
X-Received: by 2002:a17:902:f68f:b0:2c0:e5ee:f554 with SMTP id d9443c01a7336-2ccbe40ee4cmr72069895ad.8.1783453658644;
        Tue, 07 Jul 2026 12:47:38 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ea7fsm17015165ad.38.2026.07.07.12.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:47:38 -0700 (PDT)
Subject: [PATCH v7 7/8] accel/amdxdna: Use hmm_range_fault_unlocked_timeout()
 for range population
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org, kys@microsoft.com,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
 longli@microsoft.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org, wei.liu@kernel.org,
 skinsburskii@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
Date: Tue, 07 Jul 2026 12:47:36 -0700
Message-ID: <178345365679.660027.16671418103486907555.stgit@skinsburskii>
In-Reply-To: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

aie2_populate_range() takes mmap_read_lock() only around hmm_range_fault().
It keeps a single HMM_RANGE_DEFAULT_TIMEOUT deadline for the populate pass
and retries -EBUSY until that deadline expires.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes mapp->range.notifier_seq for its internal
retries. Pass the remaining jiffies from the existing deadline to HMM,
while preserving the driver's existing outer loop for interval invalidation
retries and for selecting the next invalid mapping.

Keep returning -ETIME when the retry budget expires, matching the driver's
existing timeout error convention.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/accel/amdxdna/aie2_ctx.c |   17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index e9fbd8c14364..412f812d7c2c 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -1031,22 +1031,11 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 		return -EFAULT;
 	}
 
-	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
-	mmap_read_lock(mm);
-	ret = hmm_range_fault(&mapp->range);
-	mmap_read_unlock(mm);
+	ret = hmm_range_fault_unlocked_timeout(&mapp->range,
+			max_t(long, timeout - jiffies, 1));
 	if (ret) {
-		if (time_after(jiffies, timeout)) {
+		if (ret == -EBUSY)
 			ret = -ETIME;
-			goto put_mm;
-		}
-
-		if (ret == -EBUSY) {
-			amdxdna_umap_put(mapp);
-			mmput(mm);
-			goto again;
-		}
-
 		goto put_mm;
 	}
 


