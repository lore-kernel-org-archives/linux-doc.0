Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9E73DA7D7
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168095; cv=none; b=LKNBKficXtz5dPi0KTXe7uqCY9UnWOBVSZjKQK5GNqKoi+RZCREJcqNNKhQh8lUmtdyvQ2d//9H0DcvTOn+luMw6+O5t5W8Xq8lyA3AaVlM1iaPAg6YFzEmGFHnzy2EXJc1es6UZp6ua1YRxpRYcMR83r9Jmg6gMiaecXPnGRQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168095; c=relaxed/simple;
	bh=3gArK77n2NjqbVaBq8qIADTWaXLArEqot7z9ZOmx4yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXyL2WIcRUQkK18uju/dP3GMpw9DNQ7Q7qbUgXsTvKF0J2Xvj+pWGpCweihmRY6XqKmnN9E/7dLjzgGNncApBX8f7c9x3MEQ+plmWqABDzoFVhHxQSMoMh2t3n1bgD1DemeKtUlwneKsS9ntV0VQt0mDs+YBBCy2cPOaPy71Vdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BiZca74z; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BiZca74z"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so17691765e9.3
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 02:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788168091; x=1788772891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CP/iU6/taW8ol4SzNq6xLRFo/dhj0C8jDaKht8KXEfI=;
        b=BiZca74ztjsVu2cr9YNAjKEC/XBjLvu2hBU2NCmyTIh+rrqCeA1BF/EhbHHjHpadhB
         tVx+U/pxFdV3RV/1DNvwPrw0p1d8AGev5ilCdw0r1/aVtcgivX1LdEReplRi1LoKmgeb
         6/rlLEALbVBkcOZyghh7ETwzDH7Iulzk/hmPvCPDa7s84hcOBZt5RJGhxx4JBK3SJFyo
         qY2JiPsplV5c1m0+YbD3CuEFhPVlD8ypMnNDF3VnijRRyHdbM/lzBX+KV+1F/ZipDkiV
         io1/zJFxAGWKdIqiBrK7681HXsJuwNvZIzlIOOhnR1xTMblntRz6fxo6nNh8k6mHqd2e
         g/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168091; x=1788772891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CP/iU6/taW8ol4SzNq6xLRFo/dhj0C8jDaKht8KXEfI=;
        b=phKiCIxsvgoa+o3B5Bkp6ATQ+9tZViFh/e6sWtmIfuhjLGWxOz2IujAj+Y7CE8+OWM
         HeHu0rKdpkoobYJU1UzNibarimUUNICDlRJY0X71hpwYWUwqHdpf5ufmJTHeSLhSYo2C
         kSsSalNmlZRC55Xr04AZj8OYne52i9Mb1SZdwUMDtk+F2OwWnSB3VQl+Im7zmJpa9eK/
         5aepud4ItY2dVlp744hfbgEoEKvDX5Ms7e3zrSiQWvQ/nbt/BLDS2TFejMgu1+IeCqWJ
         LBf4Y248RFC5KgGvl2mFcnoxwLruCBHAtPBb6CJUZv6ImpMJx/iOqtsN8RZsK1j4uhxy
         umag==
X-Forwarded-Encrypted: i=1; AHgh+RpnOXVnfrQHcMYO9jlDcCbsW31v+ZGovOm0kYvD8HrE/Ou8ZoV4fMJEAhDsJprZ7/aMlTSqUn63s+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lrYJ6N7ILW9IlgSj3ux/pNpcat3zn08tzkeLnvFtdUZAo95O0N
	z4+rk6mx+Ns7Zspyxv+9gkazGS7RZmnMmAk7VpPmj7fT97MyEgoKNTJjOan/3ydZDV4=
X-Gm-Gg: AR+sD13MQOGjUbYcn5HhiWPeddG2c+YgXC4XnyuZGJvQQWP57AupHzMkww1PbWFTFPu
	wyTpyXL8WCOB6sSR2JdH7CAL1lby5bukBrObpDGhDqot2Wm5lF44WmwmIPPd8VjDJnSOHqMct7S
	3VGENdEaoP5X3nEdCxMnDhEQkSBeah7ykcV3UKskpPSuc8CAWX+T9s6LUA1KaQ1OTVrol09JajI
	3Qnqs4IO7B2k8H3leURrN0xJcM66NRuFktik4UFHHisY281FUZsUWhJqoviyZj4+t/GcHIU8tMl
	gHiYHVhs42Q7qXAjhp9iV4ThfdQYSDHf4dbfLt/O7neJJHVKrZW6B5Dx0XikCclx2lHuQLAxYRp
	K8/XtT69WWnQvhX1UfxZ0OZFM9kydCSkW8IQaiF9GPAN7QCuJYSZTvSCWnYX92cHsChsb9mHpBp
	Atdw8WRK8xVTOAxRBYyfe/aydh9/QAe2pZRMckpsuLlWuP8bYDb/CnZ3Mpi0NTzYo7LtIwO7XCa
	FY1ixJuTtCgWnbJBwr/UQ==
X-Received: by 2002:a05:600c:c4ac:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-49b91c20e36mr366838225e9.6.1788168091576;
        Mon, 31 Aug 2026 02:21:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm150432695e9.3.2026.08.31.02.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:21:31 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: [PATCH v2 2/2] Documentation/no_hz: Change dynticks-testing repository name
Date: Mon, 31 Aug 2026 11:21:13 +0200
Message-ID: <20260831092118.124576-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831092118.124576-1-marco.crivellari@suse.com>
References: <20260831092118.124576-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the documentation still mention dynticks-testing.

Recently the repository name and the tool have been renamed
to cpunoise (see link tag below), so fix the URL.

Link: https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/timers/no_hz.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/timers/no_hz.rst b/Documentation/timers/no_hz.rst
index 7fe8ef9718d8..dd624b7c3f42 100644
--- a/Documentation/timers/no_hz.rst
+++ b/Documentation/timers/no_hz.rst
@@ -206,7 +206,7 @@ something else is in the way?  This section helps answer this question
 by providing a simple OS-jitter test suite, which is available on branch
 master of the following git archive:
 
-git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
+git://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git
 
 Clone this archive and follow the instructions in the README file.
 This test procedure will produce a trace that will allow you to evaluate
-- 
2.55.0

