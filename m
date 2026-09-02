Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3EB4156FB
	for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341090; cv=none; b=XUyJB8hqKGiPrLCld0tD/sSPqIqaWeauN4ilXgTDfPYCr1+EZ2LcjJODivwA4LiYIttqe+4jZ6hIL5N/n/wCAun0AFCMxfVD3AhGasTGrvMiu00RbHMVqYfjQsZ7MtbKNXiQZm278wTG4sOj3vtjasWDo+6QPFooahynwU5CJT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341090; c=relaxed/simple;
	bh=ZdHHIbZJfkxShW+VC/jzQX9xO0bjMsfZ4Uqry3H0ap0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gaBGL5lErh4uYtCyOezsIH9TLIhT7WxpL1cHl3I1/+xIZYiME4e0NJukiLko8I8lUc7t7ZTIqiYUBbPtBGlE+g+nVYnShgMkaYKAHqw+9bzOAWcIFDTaJ+P5v1qRR+1dsl1nkuuf0Jmj7QIhSwxSQUlxYpOb0zO7N0a/8eXc08Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SHoUGUrm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SHoUGUrm"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so8980185e9.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 02:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788341087; x=1788945887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQeV/8ekaSrKNPDw7JKOOSul0YRAVF11Ftj2jef2Dyg=;
        b=SHoUGUrmhH5s5DeMHO8lbMtz8qJ6ycnCfApQpx0eETNasHbtoRCO3NaSNT2URCmPm5
         4o7Y4UaGKSaU8D0fuyuZ7Fc5zPL2Ifrl6p8gvxbC2cqbjvzh6WQvysFpmfnC4YqMqWTD
         OehE7Gw4xbDBz2aSaa4ydkGDmaqd+O87/iZ2a1eHydQ89HbqPBTXaWrtvjy14W1olh/6
         pemrGHqsuO9M25p9vBhOWOwWYwy/jCO4k6GFPjUBRG6XA2NqXczzIu0HXYRl0Ekqw2E8
         CJISLKz0hhAQaLhl0JAeVSDcRXuShes4EG5WoAOWFYBLMCbVzFoNWuaCSyBAUofW43Pv
         C7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341087; x=1788945887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQeV/8ekaSrKNPDw7JKOOSul0YRAVF11Ftj2jef2Dyg=;
        b=TE7cu0bREqbB25XdD2h5HXTo/dh3hQ5YyOeWMsK3XWpnti96sJmAx8Bobe/8uJ8hid
         CN7TEy5zYujL8DWibWBhwp1mopfS5lOB3+UevRkKz9/Avgw1SsSWoU6NcPEo+jVRJ8GB
         jWSW+UjkcCO+rMAlh1+GFTLM2Z+Ia96Bmwqi8aGU6OPU6hg67zZ+8939e13+IW0ZBGWs
         oIsFDjJ65DU6scOamUs++PpFzGFU2lyMD0M3qWkHvUPK4oonSyPxbn6iDEfcSFTPUb+j
         9ct5ztqL+B/KWGVu9pMiVpEQsS7s4p6d+yBQTmO0SUAY+oDjOsJY+Ghx+NUJFyaAtMn4
         VBKg==
X-Forwarded-Encrypted: i=1; AHgh+RrF8dolU2BJ/7uaqk06wDA0CQj3e7wf7VK/y1hxY1O9KAnF+CrL+yCUKdkNmH4LGDTCXV8aRorUyo8=@vger.kernel.org
X-Gm-Message-State: AFuF++m/fsDaE3Ty3sUUv2MSxFwn7tbv0scwJHKhbVgAv+VwOO5XPiIx
	j2I3h+svA503DlIVJCIDKvJKjLZXJTYI5e0wp7ZNWEynvSQy1dFVXoh9Ga48KwhZ/Zs=
X-Gm-Gg: AR+sD109V9GwkLomOtrZfv9RXRdly+Bumt7q/0/guzmh5NTaWGIy+49TqpXuQ08XgWx
	sNfgoMCN8IIwbnl0ptHQUY83QMYkjJN5mD9jrcQpo0I0+FNP5CAxKniOWUOw1+l9ISLJfQcMTHB
	FqaBtogiXmF4d7LGauVd5/YqwUjd5IW+bU82d4QabIk6lwQqNjLqstgNXWrTyU1sa2iUrugFdSh
	CWoSJvAFNak548Zm3hCGHsU70Iimb7HeScHZmxCZhA5eEOuYsLZ3cSOn/xTtainVt1dfkspTyqU
	7lIDkRyolKlIdMp9F5znhdm1VuuLsijfKRAR9CkUcJwZWqt1os1uASCg5vbNCLy3FVdU9P2IW5R
	qbOM7S9fp6eroSpLEAK6jMungBLGbmywfCp9ZTmg6fD85e7Jxu2l9NhRc36QU1YO53/HnaFmlU7
	sO9hcI4YaEHrVWouZSc6zrnxx25GrCesYEf/qlOjqJ+7MCo2+vYUe/e9Wr6oH4I64Z0Fqj
X-Received: by 2002:a05:600c:e558:10b0:49c:e9c1:2819 with SMTP id 5b1f17b1804b1-49ce9c12842mr13261025e9.16.1788341086717;
        Wed, 02 Sep 2026 02:24:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46422desm52404145e9.1.2026.09.02.02.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:24:46 -0700 (PDT)
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
Subject: [PATCH v3 2/2] Documentation/no_hz: Change dynticks-testing repository name
Date: Wed,  2 Sep 2026 11:24:25 +0200
Message-ID: <20260902092434.85096-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902092434.85096-1-marco.crivellari@suse.com>
References: <20260902092434.85096-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the documentation still mention dynticks-testing.

Recently the repository name and the tool have been renamed
to cpunoise (see Link tag below), so fix the URL.

Link: https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/timers/no_hz.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/timers/no_hz.rst b/Documentation/timers/no_hz.rst
index 7fe8ef9718d8..4006cab64079 100644
--- a/Documentation/timers/no_hz.rst
+++ b/Documentation/timers/no_hz.rst
@@ -204,9 +204,9 @@ but do not see any change in your workload's behavior.  Is this because
 your workload isn't affected that much by OS jitter, or is it because
 something else is in the way?  This section helps answer this question
 by providing a simple OS-jitter test suite, which is available on branch
-master of the following git archive:
+master of the following git repository:
 
-git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
+https://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git
 
 Clone this archive and follow the instructions in the README file.
 This test procedure will produce a trace that will allow you to evaluate
-- 
2.55.0

