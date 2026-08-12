Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C10739B97E
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 06:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786517973; cv=none; b=iJclbY359/grSxEI9oLByatGro+R/ToKwwCOEoAHg/d4J4Wx0zCznhRHaQzRxJuBaL8cxdiUWaklZlFK3QDrFzsdUepEhRSO7zfTg4dKOi2vCiBhgt3L57ttZJ/Af7sTvYHQSPnYjq5bHNvOTtxM0u1t1e6MSBijcHvYUJRuhZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786517973; c=relaxed/simple;
	bh=ow91Y4E1mSY+pmX9Of1DnlWzxLiCg0lkZOWlo+tNkOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EjuqKm72mmOb243UegTF/A3lGf0BABhpI2v3Ili40WLaNPTz14p5oYIWWgWu8u2udIhooNy8lLlDVofGqZt9YW0PAEX4YaesIrQ9nrV2WFEB08D9V/q+rS3M/q6RwR/oIQ0tO23D240SuQ6EFj2PPv/yHpaR2VDncjK7OEvmjq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxPeM0qX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxPeM0qX"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f502ff678so64077f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 23:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786517970; x=1787122770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=prmr/Jndi+BNbM07sqH6cB8cxDm8c7W6tjC6zXyacuQ=;
        b=nxPeM0qXgOw+6c/RVAdMI561T55/PUphoRaXZX4k7lTsxYkz0MPB9swosVCmdnVK1P
         7TOec0poQnblK1IqseBvrlU+G+HJGSLrsqF8iM6Vkpa+rUgWAjQ8fKuDAnqYw3cnYP0R
         ToHqAUfzKBUINNEyibKugnnhP5JlDMbiUfqLckNZpaoUIS9rk2vXSPW6KO0e3+BHe8Xw
         VS1U62xYWuTDOiwbOkhpW7DwML/8S2RrVUCrMV1bdbePPhiQEzDDcJoRUWoKUuW82hvO
         9Un9ag1XkmDyL1nSXueoCFJ0TlRxhyMTslF0rnN3hMvys/3EC1w/I0jy0ayDPwzIdUBr
         038w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786517970; x=1787122770;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prmr/Jndi+BNbM07sqH6cB8cxDm8c7W6tjC6zXyacuQ=;
        b=WfXQcddnu+GAuvZlwjXCPwZlxzrfQ50WROClHgdrXADYvFAH5Cg2LhOHCG4w2D/Zrt
         enUCDoFUs258T4J2KsfWy5A6ZxdCKHjrkKhOYPT0RJgAPoKospoBIWnqkUPzL5SDRYIN
         1Sv3Q6enQZR+nYtchhK2GqlA0AiRIkJdVcEHe9OYKWUqKvPAZ0UhehN0sYNMcTl7fyXJ
         n/kmCFD5uE1vt2eJeOtFrnBpgaejkCcmpMn75i++rFJpB/RvhwAZaCCB7OU4h7KT0CZi
         +dCljsLHyfcGYqcB8xn3lBFoiFYIqqRl7srsXeueTqpWSE7xXPF/SEdKnvYxf9NAUvqI
         6pOw==
X-Forwarded-Encrypted: i=1; AHgh+RqUTv9gFdb+kfSrcWdwExBQHZkr9/MDLKqSOrhnrd4FrpuY88Q3grdWz2YsXLASdK+ffRdbtQUGogk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAZmngom/Pfm/tI95iMlOmBPDYxMlrmW9o8rlHAjHUcinc6HT9
	rjMmSh1iABLT7DkNlsGCq8Sg3+aWpVIbpeIWD64ONHVMAoZpsnEZ/hA1
X-Gm-Gg: AR+sD10uHz3s985qCeuablWCm/cNN6zk8lKkxB8AYzFyk6UDfPlxzjxpt93hseeZiGX
	pdgyb35uQ8LBC6N6gVp4dhbu4W2eZ7BNeN+v2ciJ5hCAPBItuN+3Nj/U17s3SbI3wlMkPibDa4X
	uQeXhYLSJj+YmuZ4sZDdomvROgBvdXVf2S0AMOCvcKltTQyAfqDQIZyxDIKqFBtVzkprnB7Im8r
	FT/2Q8ICac+hs+r/+XZXQ9qX2lfFPzpbkxu649OqBpgtsB3xaTq9T8CBeiEGmnzfLAgfdE3PHok
	dKft6YOoeTHxYBPeDoBG4T1m/qcCoT6OlxAHEubXhbiSNVfVdAwVKg+9At+q8Sj2er8mB64IvEC
	SfzqbLMeTHeW2o/R7OEmr4nkCUgjzTQEsNpNMLPAeljPlGBwLYh0kk8xKgbh3YKUkC78N7KD6lY
	FL4CGN0Y5ftJAv8NsijgGcxFmxJUBwSFLxx5N3T2153++LJQ8+RO8zmcrs0MrV/vETVKl5aLTMf
	uJ89hobAEBUiKeubWvWFjVL4JlFtBBTMJHHckNtmWcLxEQpk9Oaw10wJGe5LrFO8A1OmHwlEDtu
	gA6d6l6fMSSlztarimFoH5u0hGPqR259x1ZRdCYS+uPIjQ==
X-Received: by 2002:a05:600c:4688:b0:498:8e6:d463 with SMTP id 5b1f17b1804b1-4997c0ddd6amr14974525e9.1.1786517969708;
        Tue, 11 Aug 2026 23:59:29 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b15b807sm73628005e9.7.2026.08.11.23.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:59:29 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Doehyun Baek <doehyunbaek@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/7] docs/zh_CN: update DAMON index translation
Date: Wed, 12 Aug 2026 06:59:07 +0000
Message-ID: <20260812065914.3071433-4-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812065914.3071433-1-doehyunbaek@gmail.com>
References: <20260812065914.3071433-1-doehyunbaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the Chinese translation of .../admin-guide/mm/damon/index.rst.

Update the translation through commit c9380cdd949d
("Docs/{admin-guide,mm}/damon: fix DAMON documentation details").

Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
---
 .../zh_CN/admin-guide/mm/damon/index.rst          | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
index 6f8676a50b38..77bbfa7c25dc 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
@@ -9,12 +9,12 @@
 
 :校译:
 
-============
-监测数据访问
-============
+========================================
+DAMON：数据访问监测和访问感知系统操作
+========================================
 
-:doc:`DAMON </mm/damon/index>` 允许轻量级的数据访问监测。使用DAMON，
-用户可以分析他们系统的内存访问模式，并优化它们。
+:doc:`DAMON <../../../mm/damon/index>` 是一个 Linux 内核子系统，用于高效的
+数据访问监测和访问感知系统操作。
 
 .. toctree::
    :maxdepth: 2
@@ -23,7 +23,4 @@
    usage
    reclaim
    lru_sort
-
-
-
-
+   stat
-- 
2.43.0

