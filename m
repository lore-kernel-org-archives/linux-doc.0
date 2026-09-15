Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F7743B6D3
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 22:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509756; cv=none; b=SgEegHu5gEpCk9gcx4rxbtJHqero4LSH9E0EfunX8okYEoH9WAD017U2id8KtlRGqBCkD6DtzeFhSsEP753baBVac5YwFVd9B1HBTgzc0zQec9AKDqTEVPhWbFzUubJfVcK53+4R9PapYLlG4DBRh49FxK112IwiKM04z6+/sUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509756; c=relaxed/simple;
	bh=bA5ljx6B7ITW0N/BGPzHL/Zxz6YCyPP3gMhy0+PZ8fE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XeGlfkiEMqHU23wB4pqAXP6b7qaxCHOwUgUopD7b3B6kPteEJgHXy15T1lQJr0jeuy//4p7c0CEf6Fd2a6kcMDxYgKHWWVolDjkJEPfDJoXEsbJiAs0C7NPiU+dS4OGJTc42XZ8jkiH/NwTlnKy1zCUTxcmRIvFUXURc22O55LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAvwXvmB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAvwXvmB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so2087725e9.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 15:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789509753; x=1790114553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8HiHaihSRj3NAinCMOoe99n81qEN+3jpEfhb65vi+w=;
        b=GAvwXvmBuws1EzjCKqb8vlhZdrvt6YwfW1iawqyyDcVKTS4SsCOuJKkZgphkdzLQkC
         k/6f9O/WDTVFnjKFcHD8zNS5+ZQK8afwgo9LlmTqxnMSSuxykNUifbU5dRZSlSwsbH44
         txN6q67bW2tOvzXX6uQZvR6E5lrxc+VwBJEOY8sWGN4CGpTyL7TDNszZ5DQIHa/R93oj
         cuRKZ2A/Z/r9ZA2f5WK38RqqCvWyShi7g30eBiwF5LDgqWqgnbOR4XvJrrIEIP5DMfck
         nFsvuDyz5k2LaMpL9Xha7g9eD14XmOoeTI4AnppnijIz0OdEVZds1vOchpzgLPd6m5ZC
         pklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509753; x=1790114553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8HiHaihSRj3NAinCMOoe99n81qEN+3jpEfhb65vi+w=;
        b=wKGRMvzjyBS3iQZ+wpAS17kBkBb3a/8ikSsMMmpnYnmKsQamhxgWraI60tio7kDzGt
         rgmAcbQ5s/g6gAuJvaNmCwoIt8HB1QxVQ32c/9SrOLWF0rkU+G+VP0FvYSNwQf9da9dN
         9qownZYm42Dx7Tubn5Q5mEbQlq9YMC7j/k4YtwOiJxwhxKQR2B7Yli55NxxWjZsfCmTG
         DxKSxIVNwtOV5+9+RgOeNChCjG7gRZkpTjhWX1fRvABOE/QP4IRPMg436FmeaBRJBlvt
         bMr834UpJGqmfG7PLkYKjm8iCXPgE6RSIoGNWUzH7uOYFLL/qf7Km2gS9VYc7z0Df2q9
         cS7g==
X-Forwarded-Encrypted: i=1; AKwUvBzas7dF1abBn0ykZNIjzvq/hGHpDGPMSZzjqqy8EfW4SRzzJWoejZZUfDqH+wlU9gHdLHe2xORlsq0=@vger.kernel.org
X-Gm-Message-State: AFuF++nb1XmKLNlp35PDyoYmooU9aTfMyq5ipqcqqVFm3gEW04729J17
	CluomH2VvSXqyM/VIB1Y13eaP1LWbLv+vKwZqBmzVWJBQf2UK3DoPsSf
X-Gm-Gg: AYBFou0+GCE4QAeaut2h9xJoDAVc99hLE2SBFZzZ+DvebOTxh2080eMZ5UvLqVNfENG
	D9CL8C31vfZksR2H4JbCxUR0OqrbiTFux5ydp+0LMUZdaNrWSv5Nrfly3VkrWc4V2+n55WonUUA
	F+iyD90nqc05vNX9olOPqG9/FeVvtqMvgYcAnOF1HNGkFu0qZUVxaNh06yjWKIQQI+E3zoJVSdr
	9uahVmYZHNEBW/jshr4R+2iYYUEje0s6bgyOoLGa//3dK3gaYbatMJTgdUVEFPHiTNUe8op5AGU
	nBD96PK0vP/wNhHyrhpb0JtNd/diWyVQlc72WG1jixmSG924uVHsaVitg2BBu09dY7zi1Om7Bit
	HjHixdvjxePimuaGNh3fd5caLDaHoJ4158rfBKgSyW49fWLMqRdGCFi6BpCFezbMTT5zJe9LyNu
	6qMdHwaTvCR6WRn4wi91AXXL5L6qVLLRhCsyt7AOENeJ/iykI3R5rfrW/NWFOiBIaUxOzCdvATt
	rdUxw==
X-Received: by 2002:a05:600c:1d07:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49eb7314c2emr245005e9.3.1789509753103;
        Tue, 15 Sep 2026 15:02:33 -0700 (PDT)
Received: from epiphany ([143.58.158.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83aeae01sm27747445e9.6.2026.09.15.15.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:02:32 -0700 (PDT)
From: Syazwina Fazrul <norsyazwina.fazrul@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Syazwina Fazrul <norsyazwina.fazrul@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-pm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: power/cpuidle: Fix repeating phrase
Date: Tue, 15 Sep 2026 23:00:55 +0100
Message-ID: <20260915220105.14655-1-norsyazwina.fazrul@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove repeating 'with the' phrase

Signed-off-by: Syazwina Fazrul <norsyazwina.fazrul@gmail.com>
---
 Documentation/admin-guide/pm/cpuidle.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/pm/cpuidle.rst b/Documentation/admin-guide/pm/cpuidle.rst
index be4c1120e3f0..e91ebd432f6f 100644
--- a/Documentation/admin-guide/pm/cpuidle.rst
+++ b/Documentation/admin-guide/pm/cpuidle.rst
@@ -316,7 +316,7 @@ interval" value.
 
 Now, the governor is ready to walk the list of idle states and choose one of
 them.  For this purpose, it compares the target residency of each state with
-the predicted idle duration and the exit latency of it with the with the latency
+the predicted idle duration and the exit latency of it with the latency
 limit coming from the power management quality of service, or `PM QoS <cpu-pm-qos_>`_,
 framework.  It selects the state with the target residency closest to the predicted
 idle duration, but still below it, and exit latency that does not exceed the
-- 
2.52.0

