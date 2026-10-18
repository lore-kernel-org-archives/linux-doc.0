Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B043B71DC
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 06:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304532; cv=none; b=nlwvd/L+eweVs7Crn4gyAyj7Z/5WPG6vuzKuQC1haZHn6Kr5rNzn8JH6d/swCHuhIMc+/bo9DRNBCVXKXgEaMhJJ5i/VFkdUaYvlD+/JJFGM8l58IGv2rvOm5BA+1Ha9/4t8MdbXpXft5lbFHSsIZyBcbgsx3uRcvT9jH6LousQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304532; c=relaxed/simple;
	bh=y8F7dXJHndM13xZhNRXHWKnJACtvf/G0EiIhGDJJtWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SooJHYjE3u0kPwfIW1NMq1PlfB+cEOby1rI5oEsO9xyPavJ98XEhL6p1ysrRtgLwncIrxZhVodXzlwaOeopdNP2kUwgdttItEhoh596rcUeI9JIvjDEuxIw5yOX7kurmd8tzV5gBbMG5fVuaXbi7fpqi3ttGa0TxuPihLo8bjws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpRZ6G95; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpRZ6G95"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-873a4edb243so656066b3a.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 23:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792304530; x=1792909330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ImNMEDi8oPrWIx71COnlaNJwSBMr2u0fGsfEGtTKVc=;
        b=jpRZ6G95dVbCisuXSRF1PGL7VWpZfc7cqqzlvnta0wcWdu7mkYPlgmpooLCj7yNDcV
         +7JooiXIsgUqoeARYKEPCsesEBLTcQwBq7pDTavELZTRJpSJ9zNNz3iKaOCOVhmJzX7j
         1+z2POJbvLq5itzyfI8qpw5syO7D7robQJAC6nV9vLvATm6ekntSHSo2nXI208gbI0l6
         cQisLx1Am2Z0t6Z1QjAoSqVZfIF021GMN86X9zDmUMXwHgsKiGjxrWE8JL+9mIgrHtOs
         Bad5Nr5MDW5i4lqaRCSRkHM3PqyUjjjDx+lFZGp5L0n1M7kJQFrTEQoDGfyncVS4H6Sh
         GhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304530; x=1792909330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ImNMEDi8oPrWIx71COnlaNJwSBMr2u0fGsfEGtTKVc=;
        b=o6PYfsD4hMufKO2mqJ0OJErdsGt/Xe0JD6icSr94kPkTgiGCY1prD4xICQWJ4BYZ2V
         BCgGSMpvOFu2c/7AK6IrTBn8+cBi40+B99dwL2QhTY1qMtetHZ9V8XJHNuGeyopr2Tip
         8l3Wt4/RTFoKdVMo42ow+nLt7TXVruqaT2hFbCi2BeZj8C75UIV5bSAUc+8RLTWbz2T2
         oU6b+UylBE+p+scWvBs/+8G3uGuFajjCMNckdWcQ9WctsEulpdUSolKWLIh7VH+FUpeo
         O3bSvFuXRlYvIAtRhBPaNifscSfqg0ogmMnfVj0hJLIdyykrs6o/99t0hVfj/qf8rEeA
         OpcA==
X-Forwarded-Encrypted: i=1; AKwUvBx7R38a2CEkEvmy9Br2WvK6/ob+yXb4NZupI8M2lx7eXGXpG4ee0ChbfdvOEDt2XsKyBiOweYWz5H4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmKj5BWTk43ac6qRTBx24u4jsMhRrCVT+5e16R2PHOSw1je2H5
	h51GsVUnzIpsS//l4kFPHwSesB4I6qEQogDLkEY9ZBeZm6YflQ/oilwp1h7gQA==
X-Gm-Gg: AYBFou1nKZb8LEHJ5/KPtyhw1sIoaLHUsHet8QAS/Vi6c1KOeHw051scTnLiqFm49E6
	NhK3/8gZ0uG9bNpD1bPmLCHMp1xdUaVR2ZWHC5Mw7xFGLxuB7uKVehCrNE9/VfaSM2AwItkQ8nA
	yVX6cK/zHKHER7Zez1yHPy+g4WoT1Co9nIIkltI6OcgLUMIcLy9lXemK8/BDZUOWiiRksXXi8Ev
	IW6KfrsthrSRKvX1OvVtWaPhe3xVFK8bwKT1XWLqutMXQR6wOMedx6n0RRgrrLga0z2ux4AGEFP
	ebXNlUJJiruYECk7r/2PVhbCUqnWbqxM7GMzkyv4tctJhOLAXxzztbXDOxtDrSNdogVsR9jMgbS
	e1tHzHB36E8naU07mxSZltFAEE1bxhKVMvmP9CpJMYFosyTB3fZQ2IJ03hHRVhcW4tp+jUadFQ9
	AzpsGNi96AKmfJVlVMRTvQewyZklxJl89k/c6ctxPQNv+H6bhxtFrWv3ijRZ1l5lRyK2AYmvEhR
	ipFrn1yzOMGKd8oV9/f8WCi3+Z6
X-Received: by 2002:a05:6a00:1707:b0:882:ae75:b846 with SMTP id d2e1a72fcca58-8a04ac2a7e8mr3453484b3a.4.1792304529741;
        Sat, 17 Oct 2026 23:22:09 -0700 (PDT)
Received: from localhost.localdomain ([222.254.197.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a05d4b04dcsm584738b3a.16.2026.10.17.23.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:22:09 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: use git switch to create branches
Date: Sun, 18 Oct 2026 13:22:00 +0700
Message-ID: <20261018062200.29256-1-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ardqGdjnd7kC1B-E@wyuan.org>
References: <ardqGdjnd7kC1B-E@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Sep 26, 2026 at 14:45:45 +0800, Weijie Yuan wrote:
>     \$ git checkout -t -b my-topical-branch master
> +    \$ git switch -t -c my-topical-branch master
>      Branch 'my-topical-branch' set up to track local branch 'master'.
>      Switched to a new branch 'my-topical-branch'
> 
> @@ -882,7 +882,7 @@ notice that it will have the ``base-commit:`` trailer at the very
>  bottom, which provides the reviewer and the CI tools enough information
>  to properly perform ``git am`` without worrying about conflicts::
> 
> -    \$ git checkout -b patch-review [base-commit-id]
> +    \$ git switch -c patch-review [base-commit-id]
>      Switched to a new branch 'patch-review'
>      \$ git am patches.mbox
>      Applying: First Commit

Hi Weijie,

Thank you for putting this patch together and for the credit. The
conversion to the modern command layout keeps the guide fully up to
date with current Git usage practices.

Reviewed-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>

