Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539C610A1F;
	Wed, 29 Jan 2025 01:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738113361; cv=none; b=fEMttt7y73oE8aB6G1CMB8nNX6/oCZWZLfFFVgv7P5mfM/bl7HS808M7aZrsVlp3/U3KI/qh58m/Mto08J9cT0EjC/7RYnXRRM6+03OMxZDdcUIJsrV0p0+ZrRTwlEfBp7fyIVPNEVgzKOt3f4B9lX8bpuxtMFfuwUMzaZBsW+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738113361; c=relaxed/simple;
	bh=8yneBJY7/9OwdZRVYkGie9cRiJVKyvuqgxKTBjUpV8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KJW1ObmVQiR9D4pN2+e6TYA0i6+ze6dt5TaZlrSV/9gnuovfOkVl0Rg6JTArIG4VAK19t/s8ABl14xStHOD41Cei6hLdM9lfwqlSSr+g23IUvL/Pb0gDsMVBDQwzYpgK0zvXAwsGkJ9EwhRbbQGTsnslW/Qw1bbDPCI/N+m5tLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfM5yQtb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfM5yQtb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4401C4CEE6;
	Wed, 29 Jan 2025 01:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738113360;
	bh=8yneBJY7/9OwdZRVYkGie9cRiJVKyvuqgxKTBjUpV8g=;
	h=From:To:Cc:Subject:Date:From;
	b=cfM5yQtbk0iCup7ZFXU18vTiYvLS16RO2W/nhbKJUMBh2rxAuvpgvobevA4+APkpw
	 2MXBLS5/7FMlD0UC6jieRAPwAmYEi69/iPIf/oKPi4Z/Iu7LtujUCTqAL3+mhoyacK
	 NaTQ6AcDtA1U98cuECFAtd5NVp7W7BZfirPjK2h6/Arx9exnUe5c9OKhTdeKWDPFsy
	 2UVHZe8JzCOvVXpzTFwFARb64fQtaVrM+SkjPiuGzk+2QFxBR8GbCu6nM9KT7sNkpk
	 llQilatEHkgWczIalMO9KpMww7GxJsiGqa1m8PB6fCcNshD+6/JabkgpeQbB9VuTP4
	 kFuhot9UFcQbA==
From: carlos.bilbao@kernel.org
To: corbet@lwn.net
Cc: akpm@linux-foundation.org,
	bilbao@vt.edu,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH] .mailmap: Remove redundant mappings of emails
Date: Tue, 28 Jan 2025 19:15:55 -0600
Message-ID: <20250129011555.1108720-1-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Carlos Bilbao <carlos.bilbao@kernel.org>

Remove two redundant mappings:
changbin.du@intel.com -> changbin.du@intel.com
viresh.kumar@linaro.org -> viresh.kumar@linaro.org

Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
---
 .mailmap | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 0768824e9d19..2132b08052da 100644
--- a/.mailmap
+++ b/.mailmap
@@ -143,7 +143,6 @@ Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
 Changbin Du <changbin.du@intel.com> <changbin.du@gmail.com>
-Changbin Du <changbin.du@intel.com> <changbin.du@intel.com>
 Chao Yu <chao@kernel.org> <chao2.yu@samsung.com>
 Chao Yu <chao@kernel.org> <yuchao0@huawei.com>
 Chester Lin <chester62515@gmail.com> <clin@suse.com>
@@ -721,7 +720,6 @@ Viresh Kumar <vireshk@kernel.org> <viresh.kumar2@arm.com>
 Viresh Kumar <vireshk@kernel.org> <viresh.kumar@st.com>
 Viresh Kumar <vireshk@kernel.org> <viresh.linux@gmail.com>
 Viresh Kumar <viresh.kumar@linaro.org> <viresh.kumar@linaro.org>
-Viresh Kumar <viresh.kumar@linaro.org> <viresh.kumar@linaro.com>
 Vishnu Dasa <vishnu.dasa@broadcom.com> <vdasa@vmware.com>
 Vivek Aknurwar <quic_viveka@quicinc.com> <viveka@codeaurora.org>
 Vivien Didelot <vivien.didelot@gmail.com> <vivien.didelot@savoirfairelinux.com>
-- 
2.43.5

